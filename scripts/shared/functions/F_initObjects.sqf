params [ "_vehicle" ];

_classname = typeOf _vehicle;

if ( _classname == "C_Offroad_01_repair_F" ) then {
	[
		_vehicle,
		nil,
		[
			"HideDoor1", 1,
			"HideDoor2", 1,
			"HideGlass2", 1,
			"HideDoor3", 0,
			"Proxy", 0,
			"Destruct", 0
		]
	] call BIS_fnc_initVehicle;
};

if ( _classname == "B_G_Offroad_01_repair_F" ) then {
	[
		_vehicle,
		nil,
		[
			"HideDoor1", 0,
			"HideDoor2", 0,
			"HideGlass2", 1,
			"HideDoor3", 0,
			"Proxy", 0,
			"Destruct", 0
		]
	] call BIS_fnc_initVehicle;
};

if ( _classname in [ ammobox_b_typename, ammobox_o_typename, "B_Slingload_01_Ammo_F","JNS_Skycrane_Pod_Ammo_BLU_Green", "B_Slingload_01_Medevac_F", "JNS_Skycrane_Pod_Medical_BLU_Green", "B_Slingload_01_Fuel_F", "JNS_Skycrane_Pod_Fuel_BLU_Green", "B_Slingload_01_Repair_F", "JNS_Skycrane_Pod_Repair_BLU_Green" ] ) then {
	_vehicle setVariable ["ace_cargo_size", -1, true];
};

if ( _classname == Build_helper_typename ) then {
	_vehicle setVectorUp [0,0,1];
	_vehicle allowDamage false;
};

if ( _classname == Medical_typename ) then {
	_vehicle setVariable["ace_medical_isMedicalFacility", true, true];
};

if ( _classname == Repair_typename ) then {
	_vehicle setVariable ["ACE_isRepairFacility", 1, true];					
};

if ( _classname in repair_vehicles ) then {
	_vehicle setVariable ["ACE_isRepairVehicle", 1, true];
};

if ( _classname in medical_vehicles ) then {
	_vehicle setVariable ["ace_medical_medicClass", 1, true];
};

if ( _vehicle isKindOf "AllVehicles" ) then {
	[[[_vehicle],"IgiLoad\IgiLoad.sqf"],"BIS_fnc_execVM",true,false] call BIS_fnc_MP;
};

if ( _classname in fuel_cannister ) then {
	[[_vehicle, true, [0.3, 0, 0.3], 90], "ace_dragging_fnc_setCarryable", true, false] call BIS_fnc_MP;
	[_vehicle] execVM "scripts\misc\repair\TAA_Database.sqf";
};

if ( _classname in carryable_objects ) then {
	[[_vehicle, true, [0, 1, 0], 180], "ace_dragging_fnc_setCarryable", true, false] call BIS_fnc_MP;
};

if ( _classname in draggable_objects ) then {
	[[_vehicle, true, [0, 1, 0], 180], "ace_dragging_fnc_setDraggable", true, false] call BIS_fnc_MP;
};

if ( _classname isEqualTo "Flag_Red_F" ) then {
	_vehicle setFlagTexture "res\flag_portugal_co.paa";
	_vehicle setFlagSide west;
};

if ( _classname isEqualTo "Flag_Green_F" ) then {
	_vehicle setFlagTexture "res\flag_ptrangers_co.paa";
	_vehicle setFlagSide west;
};