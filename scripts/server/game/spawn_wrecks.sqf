/*
kp_wreckspawn.sqf
Author: Wyqer
Website: https://www.killahpotatoes.de
Source & License: https://github.com/Wyqer/A3-Scripts
Date: 2017-06-19

Description:
Place random wrecks on the roads of the map.

Parameters:
NONE

Method:
execVM

Example for initServer.sqf:
[] execVM "kp_wreckspawn.sqf";
*/
private ["_debug","_minDist","_maxDist","_multiChance","_multiMax","_placedWrecks","_wrecksArray","_size","_center","_marker","_roadsArray","_road","_count","_position","_wreck"];

waitUntil { !isNil "iedAct" };

// CONFIG START

// Enable Debug Markers
_debug = false;
// Minimum distance between wrecks
_minDist = 900;
// Maximum distance between wrecks
_maxDist = 1400;
// Spawn chance of multiple wrecks
_multiChance = 15;
// Maximum count of wrecks at one spot
_multiMax = 2;

// CONFIG END

// DO NOT EDIT BELOW
if !(isServer) exitWith {};
_placedWrecks = [];

_wrecksArray = [
	"Land_Wreck_Car_F",
	"Land_Wreck_Car2_F",
	"Land_Wreck_Car3_F",
	"Land_Wreck_HMMWV_F",
	"Land_Wreck_Hunter_F",
	"Land_Wreck_Truck_dropside_F",
	"Land_Wreck_Offroad_F",
	"Land_Wreck_Offroad2_F",
	"Land_Wreck_Skodovka_F",
	"Land_Wreck_Truck_F",
	"Land_Wreck_UAZ_F",
	"Land_Wreck_Ural_F"
];

_size = getnumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");

_center = [_size/2,_size/2,0];

if (_debug) then {
	_marker = createMarker ["center",_center];
	_marker setMarkerColor "ColorRED";
	_marker setMarkerType "mil_dot";
	_marker setMarkerText "CENTER POINT";
};

_roadsArray = _center nearRoads (_size / (sqrt 2));

diag_log format ["[KP WRECKS] [STARTED] Center: %1 - Size: %2 - Found Roads: %3",_center,(_size/2), count _roadsArray];

while {(count _roadsArray) > 0} do {
	_road = selectRandom _roadsArray;
	_roadsArray = _roadsArray select {_x distance2D _road > (ceil ((random (_maxDist - _minDist)) + _minDist))};
	_count = 0;
	while {(_count == 0) || ((_count < _multiMax) && ((random 100) <= _multiChance))} do {

		_position = ((getPos _road) getPos [ random [5,8,12], random 360 ]) findEmptyPosition [1, 10, "B_MRAP_01_F"];
		
		if !(_position isEqualTo []) then {
			_wreck = (selectRandom _wrecksArray) createVehicle _position;
			_wreck setDir (round (random 360));
			_wreck setVectorUp surfaceNormal position _wreck;
			_placedWrecks pushBack _wreck;
			_wreckIed = false;
			
			_forceIed = false;
			if ( ([2000, _position] call F_getNearestSector in blufor_sectors) ) then {
				if ( round(random 6) == 1 ) then { _forceIed = true };
			};
			
			if ( (!([2000, _position] call F_getNearestSector in blufor_sectors) || _forceIed) && (_position distance startbase) > 1200 ) then {
				_position_ied = ((getPos _road) getPos [ random [0,2,4], random 360 ]);
				
				_ied=selectRandom iedList;
				_junk=selectRandom iedJunk;
				_ied=createMine[_ied,_position_ied,[],8];
				_ied setPosATL(getPosATL _ied select 2+1);
				_ied setDir(random 359);
				_ied allowDamage false;
				
				if(round(random 2)==1)then{
					_iedJunk=createVehicle[_junk,getPosATL _ied,[],0,""];
					_iedJunk setPosATL(getPosATL _iedJunk select 2+1);
					_iedJunk enableSimulationGlobal false;
				};
				
				_junk=createVehicle[_junk,_position_ied,[],8,""];
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
				
				_wreckIed = true;
			};
			
			if (_debug) then {
				_marker = createMarker [str _wreck,_wreck];
				if (_wreckIed) then { _marker setMarkerColor "ColorOrange" }
				else { _marker setMarkerColor "ColorYellow"; };
				_marker setMarkerType "mil_dot";
				if (_wreckIed) then { _marker setMarkerText "WRECK IED" }
				else { _marker setMarkerText "WRECK"; };
			};
			
			_count = _count + 1;
		};
	};
};

diag_log format ["[KP WRECKS] [FINISHED] Placed Wrecks: %1",count _placedWrecks];
