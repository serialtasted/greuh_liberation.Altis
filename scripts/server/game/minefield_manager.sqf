private ["_debug","_minDist","_maxDist","_minefields","_mines","_size","_center","_marker","_spawnPoints","_point","_count","_position"];

waitUntil { !isNil "sectors_allSectors" };
waitUntil { !isNil "save_is_loaded" };
waitUntil { !isNil "blufor_sectors" };

// CONFIG START

// Enable Debug Markers
_debug = false;
// Minimum distance between minefields
_minDist = 1600;
// Maximum distance between minefields
_maxDist = 2200;

// DO NOT EDIT BELOW
if !(isServer) exitWith {};

_minefields = [];
_mines = [];

_size = getnumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");

_center = [_size/2,_size/2,0];

if (_debug) then {
	_marker = createMarker ["center",_center];
	_marker setMarkerColor "ColorRED";
	_marker setMarkerType "mil_dot";
	_marker setMarkerText "CENTER POINT";
};

_spawnPoints = _center nearRoads (_size / (sqrt 2));
mineBlast=["Bo_Mk82","Rocket_03_HE_F","M_Mo_82mm_AT_LG","Bo_GBU12_LGB","Bo_GBU12_LGB_MI10","HelicopterExploSmall"];
mineList=["ATMine","APERSMine"];
mineAmmo=["ATMine_Range_Ammo","APERSMine_Range_Ammo"];

mineAct={
	_mineObj=_this select 0;
	if(mineActive _mineObj)then{
		_iedBlast=selectRandom mineBlast;
		createVehicle[_iedBlast,(getPosATL _mineObj),[],0,""];
		createVehicle["Crater",(getPosATL _mineObj),[],0,""];
		deleteVehicle _mineObj;
	};
};

while {(count _spawnPoints) > 0} do {
	_point = selectRandom _spawnPoints;
	_spawnPoints = _spawnPoints select {_x distance2D _point > (ceil ((random (_maxDist - _minDist)) + _minDist)) };
	_count = 0;
	
	_position = ((getPos _point) getPos [ random [200,350,500], random 360 ]);
	
	if (
		!(_position isEqualTo []) &&
		!(surfaceIsWater _position) &&
		count([150, _position] call F_getNearestSector) == 0 &&
		!([800, _position] call F_getNearestSector in blufor_sectors) &&
		(_position distance startbase) > 1200 &&
		count(_position nearRoads 200) == 0
	) then {
		for "_i" from 1 to round(random [10,15,20]) do {
			_sign = "Land_Sign_Mines_F" createVehicle (_position getPos [140, random 360]);
			_sign setDir (_sign getDir _position);
		};
		
		while {(_count < round( random [25,40,55] ))} do {		
			_mine=selectRandom mineList;
			_minePos = (_position getPos [ random [5,60,140], random 360 ]);
			
			if !(surfaceIsWater _minePos) then {
				_mine=createMine[_mine,_minePos,[],8];
				_mine setPosATL(getPosATL _mine select 2+1);
				_mine setDir(random 360);
				_mine allowDamage false;
				
				_trig=createTrigger["EmptyDetector",getPosATL _mine];
				_trig setTriggerArea[5,5,0,FALSE,5];
				_trig setTriggerActivation[GRLIB_side_friendly_s,"PRESENT",false];
				_trig setTriggerTimeout[3,5,8,true];
				
				if(isMultiplayer)then{
					_trig setTriggerStatements[
						"{vehicle _x in thisList && speed vehicle _x>5}count playableUnits>0",
						"{if((typeOf _x)in mineAmmo)then{[_x]call mineAct;};}forEach nearestObjects[thisTrigger,[],10];",
						"deleteVehicle thisTrigger"];
				}else{
					_trig setTriggerStatements[
						"{vehicle _x in thisList && isPlayer vehicle _x && speed vehicle _x>5}count allUnits>0",
						"{if((typeOf _x)in mineAmmo)then{[_x]call mineAct;};}forEach nearestObjects[thisTrigger,[],10];",
						"deleteVehicle thisTrigger"];
				};
				
				_mines pushBack _mine;
				
				if(_debug)then{
					mineMkrs=[];
					_minePos=getPosWorld _mine;
					_mkrID=format["m %1",_minePos];
					_mkr=createMarker[_mkrID,getPosWorld _mine];
					_mkr setMarkerShape"ICON";
					_mkr setMarkerType"mil_dot";
					_mkr setMarkerBrush"Solid";
					_mkr setMarkerAlpha 1;
					_mkr setMarkerColor"ColorPink";
					mineMkrs pushBack _mkr;
				};
				
				GRLIB_side_civilian revealMine _mine;
				GRLIB_side_enemy revealMine _mine;
				GRLIB_side_resistance revealMine _mine;
			};		
			
			_count = _count + 1;
			
		};
		
		_minefields pushBack _position;
		
		if(_debug)then{
			minefieldsMkrs=[];
			_mkrID=format["mfield %1",_position];
			_mkr=createMarker[_mkrID,_position];
			_mkr setMarkerShape"ELLIPSE";
			_mkr setMarkerBrush"Grid";
			_mkr setMarkerAlpha 0.7;
			_mkr setMarkerColor"ColorPink";
			_mkr setMarkerText "MINEFIELD";
			_mkr setMarkerSize [140,140];
			minefieldsMkrs pushBack _mkr;
		};
	};
};

diag_log format ["[MINEFIELDS MANAGER] [FINISHED] Placed Minefields: %1 Placed MINES: %2",count _minefields, count _mines];