/*
Breaching-Doors-script for ArmA3-Buildings by LuzifR (v0.07)
*/

if (!isServer) exitWith {};

sleep 2; // To make sure the script works with placed buildings

private ["_randomBuildings","_randomDoors","_count","_doors","_i"];

// Defaults
_randomBuildings = 100;
_randomDoors = 100;

_count = count _this;
if (_count > 0) then {_randomBuildings = _this select 0};
if (_count > 1) then {_randomDoors = _this select 1};

{	if (random 100 <= _randomBuildings) then {
		_doors = getNumber (configFile >> "CFGVehicles" >> typeOf _x >> "numberOfDoors");
		for "_i" from 1 to _doors do {
			if (random 100 <= _randomDoors) then {
				[_i,_x,_forEachIndex] spawn {

					private ["_door","_building","_pos","_doorpos","_index","_dummy","_damage"];

					_door = _this select 0;
					_building = _this select 1;

					_pos = _building selectionPosition (format ["Door_%1_trigger", _door]);
					_doorpos = _building modelToWorld _pos;

					//_index = _this select 2;
					//_doormark = createMarker [str _index + "_" + str _door, _doorpos];
					//_doormark setMarkerType "hd_dot";

					_dummy = "Land_MetalBarrel_F" createvehicle [0,0,0];
					_dummy enableSimulation false;
					_dummy setPos [_doorpos select 0, _doorpos select 1, (_doorpos select 2)-1];
					_dummy hideObjectGlobal true;

					_damage = switch (typeOf _building) do {
						case "Land_City_Gate_F": 	{0.006};
						case "Land_Stone_Gate_F": 	{0.1};
						case "Land_Medevac_house_V1_F";
						case "Land_Cargo_House_V2_F";
						case "Land_Cargo_House_V3_F";
						case "Land_Cargo_House_V1_F":	{0.11};
						default 			{0.025};
					};

					_building animate [ format["door_%1_rot",_door], 0];
					_building setVariable[format["bis_disabled_Door_%1",_door],1,true];
					while {damage _dummy < _damage} do {
						if (_building animationPhase format["door_%1_rot",_door] > 0) then {
							_building animate [ format["door_%1_rot",_door], 0];
						};
						sleep 0.1;
					};
					_building setVariable[format["bis_disabled_Door_%1",_door],0,true];
					_building animate [ format["door_%1_rot",_door], 1];

					deleteVehicle _dummy;
				};
			};
		};
	};
} forEach allMissionObjects "Building";
