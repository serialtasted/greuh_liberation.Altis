private ["_debug","_minDist","_maxDist","_multiChance","_multiMax","_ieds","_trig","_size","_center","_marker","_roadsArray","_road","_count","_position"];

waitUntil { !isNil "sectors_allSectors" };
waitUntil { !isNil "save_is_loaded" };
waitUntil { !isNil "blufor_sectors" };

// CONFIG START

// Enable Debug Markers
_debug = false;
// Minimum distance between ieds
_minDist = 800;
// Maximum distance between ieds
_maxDist = 1200;
// Spawn chance of multiple ieds
_multiChance = 15;
// Maximum count of ieds at one spot
_multiMax = 2;

// DO NOT EDIT BELOW
if !(isServer) exitWith {};
_ieds = [];

_size = getnumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");

_center = [_size/2,_size/2,0];

if (_debug) then {
	_marker = createMarker ["center",_center];
	_marker setMarkerColor "ColorRED";
	_marker setMarkerType "mil_dot";
	_marker setMarkerText "CENTER POINT";
};

_roadsArray = _center nearRoads (_size / (sqrt 2));

diag_log format ["[IED MANAGER] [STARTED] Center: %1 - Size: %2 - Found Roads: %3",_center,(_size/2), count _roadsArray];

//!!DO NOT EDIT BELOW!!
iedBlast=["Bo_Mk82","Rocket_03_HE_F","M_Mo_82mm_AT_LG","Bo_GBU12_LGB","Bo_GBU12_LGB_MI10","HelicopterExploSmall"];
iedList=["ACE_IEDLandBig_Range","ACE_IEDLandSmall_Range","ACE_IEDUrbanBig_Range","ACE_IEDUrbanSmall_Range"];
iedAmmo=["IEDUrbanSmall_Remote_Ammo","IEDLandSmall_Remote_Ammo","IEDUrbanBig_Remote_Ammo","IEDLandBig_Remote_Ammo"];
iedJunk=["Land_Garbage_square3_F","Land_Garbage_square5_F","Land_Garbage_line_F"];

iedAct={
	_iedObj=_this select 0;
	if(mineActive _iedObj)then{
		_iedBlast=selectRandom iedBlast;
		createVehicle[_iedBlast,(getPosATL _iedObj),[],0,""];
		createVehicle["Crater",(getPosATL _iedObj),[],0,""];
		{ deleteVehicle _x } forEach nearestObjects[getPosATL _iedObj,iedJunk,4];
		deleteVehicle _iedObj;
	};
};

while {(count _roadsArray) > 0} do {
	_road = selectRandom _roadsArray;
	_roadsArray = _roadsArray select {_x distance2D _road > (ceil ((random (_maxDist - _minDist)) + _minDist))};
	_count = 0;
	
	while {(_count == 0) || ((_count < _multiMax) && ((random 100) <= _multiChance))} do {
		
		_position = ((getPos _road) getPos [ random [0,2,4], random 360 ]);
		
		if !(_position isEqualTo []) then {
			_forceIed = false;
			if ( ([2000, _position] call F_getNearestSector in blufor_sectors) ) then {
				if ( round(random 6) == 1 ) then { _forceIed = true };
			};
			
			if ( (!([2000, _position] call F_getNearestSector in blufor_sectors) || _forceIed) && (_position distance startbase) > 1200 ) then {
				_ied=selectRandom iedList;
				_junk=selectRandom iedJunk;
				_ied=createMine[_ied,_position,[],8];
				_ied setPosATL(getPosATL _ied select 2+1);
				_ied setDir(random 359);
				_ied allowDamage false;
				
				if(round(random 2)==1)then{
					_iedJunk=createVehicle[_junk,getPosATL _ied,[],0,""];
					_iedJunk setPosATL(getPosATL _iedJunk select 2+1);
					_iedJunk enableSimulationGlobal false;
				};
				
				_junk=createVehicle[_junk,_position,[],8,""];
				_junk setPosATL(getPosATL _junk select 2+1);
				_junk enableSimulationGlobal false;
				_trig=createTrigger["EmptyDetector",getPosATL _ied];
				_trig setTriggerArea[5,5,0,FALSE,5];
				_trig setTriggerActivation[GRLIB_side_friendly_s,"PRESENT",false];
				_trig setTriggerTimeout[3,5,8,true];
				
				if(isMultiplayer)then{
					_trig setTriggerStatements[
						"{vehicle _x in thisList && speed vehicle _x>5}count playableUnits>0",
						"{if((typeOf _x)in iedAmmo)then{[_x]call iedAct;};}forEach nearestObjects[thisTrigger,[],25];",
						"deleteVehicle thisTrigger"];
				}else{
					_trig setTriggerStatements[
						"{vehicle _x in thisList && isPlayer vehicle _x && speed vehicle _x>5}count allUnits>0",
						"{if((typeOf _x)in iedAmmo)then{[_x]call iedAct;};}forEach nearestObjects[thisTrigger,[],25];",
						"deleteVehicle thisTrigger"];
				};

				_ieds pushBack _ied;
				
				if(_debug)then{
					iedMkrs=[];
					_iedPos=getPosWorld _ied;
					_mkrID=format["m %1",_iedPos];
					_mkr=createMarker[_mkrID,getPosWorld _ied];
					_mkr setMarkerShape"ICON";
					_mkr setMarkerType"mil_dot";
					_mkr setMarkerBrush"Solid";
					_mkr setMarkerAlpha 1;
					_mkr setMarkerColor"ColorGreen";
					_mkr setMarkerText  "IED";
					iedMkrs pushBack _mkr;
				};
				
				GRLIB_side_civilian revealMine _ied;
				GRLIB_side_enemy revealMine _ied;
				GRLIB_side_resistance revealMine _ied;
				
				_count = _count + 1;
			};
		};
	};
};

diag_log format ["[IED MANAGER] [FINISHED] Placed IEDs: %1",count _ieds];