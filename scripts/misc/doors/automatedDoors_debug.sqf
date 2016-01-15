scriptName "automatedDoors_debug";
/*
	File:			automatedDoors_debug.sqf
	Author:			Heeeere's Johnny!	<<< Please do not edit or remove this line. Thanks. >>>
	Version:		2.5
	Description:	For each player, it creates and removes triggers on nearby buildings which open the door if a player is close to it.
					Must be executed server side.
					If locations of type "Name" and with name prefix "doors" exist, door triggers will only be managed in these locations.
					addActions to enable/disable this script's functionality solely for the player executing the action.
	Execution:		Any
	
	Parameters:
		0 ARRAY		_objects		(optional, default: ["all"]) defines the buildings to be taken into account by this script
									e.g. ["altis", "chernarus"] means, all buildings from Altis and Chernarus will be taken into account on every map
		1 BOOLEAN	_doorsStayOpen	(optional, default: false)
									if true, doors will never close automatically
									if false, they will close automatically if player doesn't disable it for himself
	
	Return:
		nothing
*/
#define DOOR_RADIUS_SMALL	3	//meters, radius of the trigger area for doors
#define DOOR_RADIUS_LARGE	6	//meters, radius of the trigger area for gates
#define SCAN_RADIUS			50	//meters, radius of the area around a player to be scanned for buildings on each loop
#define SCAN_SLEEP			10	//seconds, time between each scan
#define DOOR_TRIGGERS		"doorTriggers"	//used to setVariable on buildings, alter if in conflict with other scripts
#define DOOR_SPHERES		"spheres"		//used to setVariable on buildings, alter if in conflict with other scripts
#define USES_AUTO_DOORS		"usesAutomatedDoors"		//used to setVariable on player, alter if in conflict with other scripts
#define DOORS_STAY_OPEN		"automatedDoors_stayOpen"	//used to setVariable on player, alter if in conflict with other scripts
#define ID_ACTIONS			"automatedDoors_actions"	//used to setVariable on player, alter if in conflict with other scripts
#define HANDLE_REMOVE_ACTIONS	"automatedDoors_handleRemoveActions"	//used to setVariable on player, alter if in conflict with other scripts
#define LOCATION_SIDE		"automatedDoors_locationSide"	//used to setVariable on buildings, alter if in conflict with other scripts

#define VALID_MAPS			["altis", "stratis", "chernarus", "takistan", "zargabad", "utes"]

if !isServer exitWith {hintSilent """Automated Doors"" may only run server side or in Singleplayer!";};
if (!isNil "scriptHandle_automatedDoors" && {!isNull scriptHandle_automatedDoors}) exitWith {
	hintSilent "automatedDoors: Script invoked even though it's already running. Nothing happens.";
};

params [["_objects", toLower worldName, ["", []]], ["_doorsStayOpen", false, [true]]];

if ("STRING" == typeName _objects) then {
	switch true do {
		case ("all" == _objects): {
			_objects = VALID_MAPS;
		};
		case (toLower _objects in VALID_MAPS): {
			if ("stratis" == toLower _objects) then {
				_objects = ["Altis"];
			} else {
				_objects = [_objects];
			};
		};
		default {
			hintSilent format ["automatedDoors: incorrect parameter ""%1""", _objects];
			_objects = VALID_MAPS;
		};
	};
} else {
	if (1 isEqualTo ({if !(toLower _x in VALID_MAPS) exitWith {1};} count _objects)) then {
		hintSilent format ["automatedDoors: incorrect value(s) in ""%1""", _objects];
		_objects = VALID_MAPS;
	};
	
	if ([] isEqualTo _objects) then {
		_objects = VALID_MAPS;
	};
};

//debug function, gets the current position of the player relative to the nearest building
fnc_getModelPos = {
	_building = nearestObject [player, "House"];
	
	if (_building != cursorTarget) then {
		_building = cursorTarget;
		hintSilent "Target building unclear!\n\ncursorTarget taken.";
	} else {
		hintSilent "";
	};
	
	createVehicle ["Sign_Sphere10cm_F", getPosATL player, [], 0, "CAN_COLLIDE"];
	copyToClipboard format ["[%1, ""%2"", true]", _building worldToModel getPosATL player, _this];
};

_fnc_addDoorActions =
{
	// _doorsStayOpen = _this select 0;
	_doorsStayOpen = param [0, player getVariable [DOORS_STAY_OPEN, false], [true]];
	
	_actionIds = [];
	_actionIds pushBack (player addAction ["Enable Automated doors", {player setVariable [USES_AUTO_DOORS, true, true];}, [], 0, false, true, "", format ["!(player getVariable ['%1', true])", USES_AUTO_DOORS]]);
	_actionIds pushBack (player addAction ["Disable Automated doors", {player setVariable [USES_AUTO_DOORS, false, true];}, [], 0, false, true, "", format ["player getVariable ['%1', true]", USES_AUTO_DOORS]]);
	
	if(!_doorsStayOpen) then	//only add these actions if doors are not already server side (globally) kept open
	{
		player setVariable [DOORS_STAY_OPEN, false, true];
		_actionIds pushBack (player addAction ["Keep doors open", {player setVariable [DOORS_STAY_OPEN, true, true];}, [], 0, false, true, "", format ["player getVariable ['%1', true] && {!(player getVariable '%2')}", USES_AUTO_DOORS, DOORS_STAY_OPEN]]);
		_actionIds pushBack (player addAction ["Don't keep doors open", {player setVariable [DOORS_STAY_OPEN, false, true];}, [], 0, false, true, "", format ["player getVariable ['%1', true] && {player getVariable '%2'}", USES_AUTO_DOORS, DOORS_STAY_OPEN]]);
	}
	else
	{
		player setVariable [DOORS_STAY_OPEN, true, true];
	};
	
	_fnc_removeAllActions =
	{
		{
			player removeAction _x;
		} forEach (player getVariable [ID_ACTIONS, []]);
		player setVariable [ID_ACTIONS, nil];
		terminate (player getVariable HANDLE_REMOVE_ACTIONS);
	};
	
	_actionIds pushBack (player addAction ["Perm. remove 'Automated Doors' actions", _fnc_removeAllActions, [], 0, false, true]);
	
	player setVariable [ID_ACTIONS, _actionIds];
	
	player setVariable
	[
		HANDLE_REMOVE_ACTIONS,
		_fnc_removeAllActions spawn
		{
			//avoid action removal before the script even started
			while {isNil "scriptHandle_automatedDoors" || {isNull scriptHandle_automatedDoors}} do {sleep 10;};
			while {!isNull scriptHandle_automatedDoors} do {sleep 10;};
			[] call _this;
		}
	];
};

[
	[
		[_doorsStayOpen, _fnc_addDoorActions],
		{
			// _doorsStayOpen = _this select 0;
			_fnc_addActions = _this select 1;
			(_this select 0) call _fnc_addActions;
			player addEventHandler ["Respawn", _fnc_addActions];
		}
	],
	"BIS_fnc_call", true, true, true
] call BIS_fnc_MP;

scriptHandle_automatedDoors = [_objects, _doorsStayOpen] spawn
{
	params [["_objects", [], [[]]], ["_doorsStayOpen", false, [true]]];
	
	_fnc_transformArray =	//Source: https://spideroak.com/browse/share/see/sqf/sqf/fn_transformArray/
	{
		params [["_thisArray", [], [[]]], ["_xLength", 0, [0]], ["_defaultValue", false]];
		
		// _thisArray		= _this select 0;
		if(_thisArray isEqualTo []) exitWith {hintSilent "_fnc_transformArray: Passed array has no elements.";};
		// _xLength		= [_this, 1, 0, [0]] call BIS_fnc_param;
		// _defaultValue	= [_this, 2, false] call BIS_fnc_param;

		_transformedArray	= [];

		if(_xLength isEqualTo 0) then	//get size of largest sub array
		{
			{
				_xLengthNew = count _x;
				if(_xLengthNew > _xLength) then {_xLength = _xLengthNew;};
			} count _thisArray;
		};
		
		if(_xLength isEqualTo 0) exitWith {};	//empty sub array(s), nothing to transform here
		_xLength = _xLength - 1;
		
		for "_i" from 0 to _xLength do
		{
			_transformedArray pushBack [];
		};

		{
			_subArrayCount = 0;
			_subArrayCount =
			{
				(_transformedArray select _subArrayCount) pushBack (if(isNil "_x") then {_defaultValue} else {_x});
				_subArrayCount = _subArrayCount + 1;
				true
			} count _x;	//transform sub array as far as possible
			
			for "_i" from _subArrayCount to _xLength do	//fill up with default values if needed
			{
				0 = (_transformedArray select _i) pushBack _defaultValue;
			};
		} count _thisArray;

		_transformedArray
	};
	
	_fnc_findLast = {
		private ["_hayStackCount", "_hayStackTmpIndex", "_indexLast"];
		params [["_hayStack", [], ["", []]], "_needle"];

		_hayStackCount		= count _hayStack;
		_hayStackTmpIndex	= _hayStack find _needle;
		_indexLast			= -1;

		while {_hayStackTmpIndex > -1} do
		{
			_indexLast			= _indexLast + 1 + _hayStackTmpIndex;
			_hayStackTmp		= _hayStack select [_indexLast + 1, _hayStackCount];
			_hayStackTmpIndex	= _hayStackTmp find _needle;
		};

		_indexLast
	};
	
	diag_log format ["automatedDoors: str missionConfigFile = %1", str missionConfigFile];
	diag_log format ["automatedDoors: __FILE__ = %1", __FILE__];
	
	_prefixLength = 0;
	if !(isMultiplayer && isServer) then {	//don't execute in Multiplayer on the server
		_isAddon = if (__FILE__ == "automatedDoors\automatedDoors.sqf") then {true} else {false};
		if !_isAddon then {	//only do this if script is not an addon
			_prefixLength = count str missionConfigFile - 15;
		};
	};
	
	//relative path to the folder where this file is in
	_path = (__FILE__ select [_prefixLength, ([__FILE__, "\"] call _fnc_findLast) - _prefixLength + 1]);
	
	diag_log format ["automatedDoors: _path = %1", _path];
	
	_allBuildingDoors = [];
	{
		_fileName = format ["%1doors%2.sqf", _path, _x];
		diag_log format ["_fileName = %1", _fileName];
		try {
			_doors = call compile preprocessFileLineNumbers _fileName;
			if (isNil "_doors") then {
				diag_log format ["automatedDoors: File ""%1"" does not exist.", _fileName];
			} else {
				_doors = _doors - _allBuildingDoors;
				_allBuildingDoors append _doors;
			};
		} catch {
			diag_log format ["automatedDoors: Processing file ""%1"" threw an exception: %2.", _fileName, _exception];
		};
	} forEach _objects;
	
	if ([] isEqualTo _allBuildingDoors) exitWith {hintSilent "automatedDoors: No buildings with doors found.";};
	
	_allBuildingDoors = [_allBuildingDoors, 3, DOOR_RADIUS_SMALL] call _fnc_transformArray;
	
	_mapRadius = worldSize / 2;
	_mapCenter = [_mapRadius, _mapRadius];
	
	_fnc_createTriggerStatements = {};
	if(_doorsStayOpen) then
	{
		_fnc_createTriggerStatements =
		{
			if(typeName _doorName isEqualTo "ARRAY") then
			{
				_statementActivation = "_building = thisTrigger getVariable 'building';";
				
				if(isNil "_isTwisted") then
				{
					{
						_statementActivation = format ["%1_building animate ['%2', 1];", _statementActivation, _x];
					} count _doorName;
				}
				else
				{
					{
						if(_isTwisted select _forEachIndex) then
						{
							_statementActivation = format ["%1_building animate ['%2', 0];", _statementActivation, _x];
						}
						else
						{
							_statementActivation = format ["%1_building animate ['%2', 1];", _statementActivation, _x];
						};
					} forEach _doorName;
				};
			}
			else
			{
				if(isNil "_isTwisted") then
				{
					_statementActivation = format ["(thisTrigger getVariable 'building') animate ['%1', 1];", _doorName];
				}
				else
				{
					_statementActivation = format ["(thisTrigger getVariable 'building') animate ['%1', 0];", _doorName];
				};
			};
		};
	}
	else
	{
		_fnc_createTriggerStatements =
		{
			_statementDeactivation	= format [
			"
				_nearUnit = nearestObject [thisTrigger, 'Man'];
				_doorsStayOpenCustom = (isPlayer _nearUnit && _nearUnit getVariable ['%1', false]);
				
				if(!_doorsStayOpenCustom) then
				{
					_building = thisTrigger getVariable 'building';
			", DOORS_STAY_OPEN];
			
			if(typeName _doorName isEqualTo "ARRAY") then
			{
				_statementActivation	= "_building = thisTrigger getVariable 'building';";
				
				if(isNil "_isTwisted") then
				{
					{
						_statementActivation	= format ["%1_building animate ['%2', 1];", _statementActivation, _x];
						_statementDeactivation	= format ["%1_building animate ['%2', 0];", _statementDeactivation, _x];
					} count _doorName;
				}
				else
				{
					{
						if(_isTwisted select _forEachIndex) then
						{
							_statementActivation	= format ["%1_building animate ['%2', 0];", _statementActivation, _x];
							_statementDeactivation	= format ["%1_building animate ['%2', 1];", _statementDeactivation, _x];
						}
						else
						{
							_statementActivation	= format ["%1_building animate ['%2', 1];", _statementActivation, _x];
							_statementDeactivation	= format ["%1_building animate ['%2', 0];", _statementDeactivation, _x];
						};
					} forEach _doorName;
				};
			}
			else
			{
				if(isNil "_isTwisted") then
				{
					_statementActivation	= format ["(thisTrigger getVariable 'building') animate ['%1', 1];", _doorName];
					_statementDeactivation	= format ["%1_building animate ['%2', 0];", _statementDeactivation, _doorName];
				}
				else
				{
					_statementActivation	= format ["(thisTrigger getVariable 'building') animate ['%1', 0];", _doorName];
					_statementDeactivation	= format ["%1_building animate ['%2', 1];", _statementDeactivation, _doorName];
				};
			};
			
			_statementDeactivation = _statementDeactivation + "};";
		};
	};
	
	_fnc_createDoorTriggers =
	{
		private ["_allDoorTriggers", "_allSpheres"];		
		params ["_building", ["_buildingDoors", [], [[]]], ["_triggerRadius", DOOR_RADIUS_SMALL, [0]]];
		
		//debug
		if([] isEqualTo _buildingDoors) exitWith
		{
			_hintString = format ["%1No doors found for building type ""%2""\n", _hintString, typeOf _building];
		};
		
		_allDoorTriggers = [];
		_allSpheres = [];	//debug
		
		systemChat "Creating door triggers";	//debug
		_sideStatement = format ["{side _x isEqualTo (_building getVariable ['%1', side _x])} &&", LOCATION_SIDE];
		
		{
			//_x == door(s)
			_doorName	= _x select 1;
			_isTwisted	= _x select 2;
			
			_states = [1, 0];
			_open = 1;
			_close = 0;
			
			_statementActivation = "";
			_statementDeactivation = "";
			
			[] call _fnc_createTriggerStatements;
			
			_position = _building modelToWorld (_x select 0);
			
			_doorTrigger = createTrigger ["EmptyDetector", _position];
			_doorTrigger setTriggerArea [_triggerRadius, _triggerRadius, 0, false];
			_doorTrigger setTriggerActivation ["ANY", "PRESENT", true];
			_doorTrigger setVariable ["building", _building];
			_doorTrigger setVariable ["position", _position];
			_locationStatement = "";
			
			_doorTrigger setTriggerStatements
			[
				format
				["
					isServer &&
					{
						if(isNull scriptHandle_automatedDoors) then
						{
							{	comment 'debug';
								deleteVehicle _x;
							} count ((thisTrigger getVariable 'building') getVariable ['%2', []]);
							deleteVehicle thisTrigger;
						}
						else {true}
					} &&
					{
						_building = thisTrigger getVariable 'building';
						this &&
						{
							if(
								{
									comment 'if isPlayer && hasCorrectSide && usesAutoDoors && isOnTriggerHeight';
									if
									(
										isPlayer _x && %3 {_x getVariable ['%1', true]} &&
										{
											comment 'Height difference between player position and original trigger position is less than 1 meter';
											(abs (((getPosATL _x) select 2) - ((thisTrigger getVariable 'position') select 2))) < 1
										}
									) exitWith {1}
								} count thisList isEqualTo 1
							) then {true} else {false}
						}
					}",
					USES_AUTO_DOORS, DOOR_SPHERES, _sideStatement
				],
				_statementActivation,
				_statementDeactivation
			];
			
			_allDoorTriggers pushBack _doorTrigger;
			
			//debug
			_sphere = createVehicle ["Sign_Sphere100cm_F", _position, [], 0, "CAN_COLLIDE"];
			_sphere enableSimulation false;
			_allSpheres pushBack _sphere;
		} forEach _buildingDoors;
		
		_building setVariable [DOOR_TRIGGERS, _allDoorTriggers];
		_building setVariable [DOOR_SPHERES, _allSpheres];	//debug
	};
	
	_fnc_removeDoorTriggers =
	{
		systemChat "Removing door triggers";	//debug
		// _building	= _this;
		
		{
			deleteVehicle _x;
		} count (_this getVariable [DOOR_TRIGGERS, []]);
		
		{	//debug
			deleteVehicle _x;
		} count (_this getVariable [DOOR_SPHERES, []]);
		
		_this setVariable [DOOR_TRIGGERS, nil];
		_this setVariable [LOCATION_SIDE, nil];
		_this setVariable [DOOR_SPHERES, nil];	//debug
	};
	
	_allBuildingClassNames	= _allBuildingDoors select 0;
	_allDoorPositions		= _allBuildingDoors select 1;
	_allRadius				= _allBuildingDoors select 2;
	_allNearestBuildingsOld = [];
	_allNearestBuildingsNew = [];
	
	while {true} do
	{
		_allLocations = [];
		_hintString = "";	//debug
		
		{
			if(0 isEqualTo ((name _x) find "doors")) then
			{
				_hintString = format ["%1location %2 added\n", _hintString, name _x];	//debug
				0 = _allLocations pushBack _x;
			};
		} count (nearestLocations [_mapCenter, ["Name"], _mapRadius * 1.2]);
		
		if([] isEqualTo _allLocations) then	//take into account all buildings
		{
			{
				//_x == player
				0 = {
					_building = _x;
					_building setVariable [LOCATION_SIDE, nil];	//remove locationSide from building (if exists)
					if !(_building in _allNearestBuildingsNew) then
					{
						0 = _allNearestBuildingsNew pushBack _building;
					};
				} count (nearestObjects [_x, ["House", "Cargo_base_F", "Wall_F"], SCAN_RADIUS]);
			} count allPlayers;
		}
		else
		{
			{
				//_x == player
				0 = {
					//_x == building
					if !(_x in _allNearestBuildingsNew) then
					{
						_building = _x;
						_building setVariable [LOCATION_SIDE, nil];	//remove locationSide from building (if exists)
						0 = {
							//_x == location
							if(getPosATL _building in _x) exitWith	//take into account only buildings which are in respective locations
							{
								_locationSide = _x getVariable LOCATION_SIDE;	//get side from location
								if(!isNil "_locationSide") then
								{
									_building setVariable [LOCATION_SIDE, _locationSide];	//set side on building
								};
								
								0 = _allNearestBuildingsNew pushBack _building;
							};
						} count _allLocations;
					};
				} count (nearestObjects [_x, ["House", "Cargo_base_F", "Wall_F"], SCAN_RADIUS]);
			} count allPlayers;
		};
		
		_hintString = format ["%1cleared objects: %2\n", _hintString,	//debug
			{
				_x call _fnc_removeDoorTriggers;
				true
			} count (_allNearestBuildingsOld - _allNearestBuildingsNew)
		];
		
		_hintString = format ["%1filled objects: %2\n", _hintString,	//debug
			{
				_buildingIndex	= _allBuildingClassNames find typeOf _x;
				if(-1 != _buildingIndex) then
				{
					[_x, _allDoorPositions select _buildingIndex, _allRadius select _buildingIndex] call _fnc_createDoorTriggers;
					true
				}
				else	//debug
				{
					// if (0 != (typeOf _x find "Land_u_")) then
					if !(((typeOf _x) select [0, 7]) in ["Land_u_", "Land_d_"]) then
					{
						_hintString = format ["%1Type ""%2"" not found\n", _hintString, typeOf _x];
					};
					false
				};
			} count (_allNearestBuildingsNew - _allNearestBuildingsOld)
		];
		
		hintSilent _hintString;	//debug
		
		_allNearestBuildingsOld = _allNearestBuildingsNew;
		_allNearestBuildingsNew = [];
		
		sleep SCAN_SLEEP;
	};
};
publicVariable "scriptHandle_automatedDoors";
