_isServer = _this select 0;
waitUntil { !isNil "save_is_loaded" };
{
	_vehicle = _x;
	_classname = typeOf _vehicle;
	
	if ( _isServer ) then {
		clearWeaponCargoGlobal _vehicle;
		clearMagazineCargoGlobal _vehicle;
		clearItemCargoGlobal _vehicle;
		clearBackpackCargoGlobal _vehicle;
	};
	
	if ( _classname == "C_Offroad_01_repair_F" && _isServer ) then {
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
	
	/*if ( _classname == FOB_box_typename && _isServer ) then {
		[ [_vehicle, 3000 ] , "F_setMass" ] call BIS_fnc_MP;
	};*/
	
	if ( _classname in  [ ammobox_b_typename, ammobox_o_typename, "B_Slingload_01_Ammo_F","JNS_Skycrane_Pod_Ammo_BLU_Green", "B_Slingload_01_Medevac_F", "JNS_Skycrane_Pod_Medical_BLU_Green", "B_Slingload_01_Fuel_F", "JNS_Skycrane_Pod_Fuel_BLU_Green", "B_Slingload_01_Repair_F", "JNS_Skycrane_Pod_Repair_BLU_Green" ] ) then {
		_vehicle setVariable ["ace_cargo_size", -1];
	};
	
	if ( _classname == Build_helper_typename && _isServer ) then {
		_vehicle setVectorUp [0,0,1];
		_vehicle allowDamage false;
	};
	
	if ( _classname == Medical_typename && _isServer ) then {
		_vehicle setVariable["ace_medical_isMedicalFacility", true, true];
	};
	
	if ( _classname == Repair_typename && _isServer ) then {
		_vehicle setVariable ["ACE_isRepairFacility", 1, true];					
	};
	
	if ( _classname in ammo_vehicles && _isServer ) then {
		_vehicle setAmmoCargo 1;
	};
	
	if ( _classname in fuel_vehicles && _isServer ) then {
		_vehicle setFuelCargo 1;
	};
	
	if ( _classname in repair_vehicles && _isServer ) then {
		_vehicle setRepairCargo 1;
		_vehicle addItemCargoGlobal ["Toolkit", 25];
		["AddCargoByClass", ["ACE_Wheel", _vehicle, 6]] call ace_common_fnc_globalEvent;
		["AddCargoByClass", ["ACE_Track", _vehicle, 6]] call ace_common_fnc_globalEvent;
		_vehicle setVariable ["ACE_isRepairVehicle", 1, true];
	};
	
	if ( _classname in medical_vehicles && _isServer ) then {
		_vehicle addItemCargoGlobal ["ACE_fieldDressing", 300];
		_vehicle addItemCargoGlobal ["ACE_elasticBandage", 320];
		_vehicle addItemCargoGlobal ["ACE_bloodIV", 200];
		_vehicle addItemCargoGlobal ["ACE_bloodIV_500", 260];
		_vehicle addItemCargoGlobal ["ACE_bloodIV_250", 280];
		_vehicle addItemCargoGlobal ["ACE_bodyBag", 310];
		_vehicle addItemCargoGlobal ["ACE_epinephrine", 560];
		_vehicle addItemCargoGlobal ["ACE_morphine", 560];
		
		if(ace_medical_level == 2) then {
			_vehicle addItemCargoGlobal ["ACE_atropine", 560];
			_vehicle addItemCargoGlobal ["ACE_quikclot", 250];
			_vehicle addItemCargoGlobal ["ACE_packingBandage", 430];
			_vehicle addItemCargoGlobal ["ACE_personalAidKit", 290];
			_vehicle addItemCargoGlobal ["ACE_plasmaIV", 240];
			_vehicle addItemCargoGlobal ["ACE_plasmaIV_500", 270];
			_vehicle addItemCargoGlobal ["ACE_plasmaIV_250", 290];
			_vehicle addItemCargoGlobal ["ACE_salineIV", 250];
			_vehicle addItemCargoGlobal ["ACE_salineIV_500", 250];
			_vehicle addItemCargoGlobal ["ACE_salineIV_250", 270];
			_vehicle addItemCargoGlobal ["ACE_surgicalKit", 300];
			_vehicle addItemCargoGlobal ["ACE_tourniquet", 420];
		};
		
		_vehicle setVariable ["ace_medical_medicClass", 1, true];
	};
	
	if ( _vehicle isKindOf "Plane" && !_isServer ) then {
		[_vehicle] execVM "scripts\misc\pushback.sqf";
	};
	
	if ( _vehicle isKindOf "AllVehicles" && !_isServer ) then {
		[_vehicle] execVM "IgiLoad\IgiLoad.sqf";
	};
	
	if ( _classname in fuel_cannister ) then {
		[_vehicle, true, [0.3, 0, 0.3], 90] call ace_dragging_fnc_setCarryable;
		[_vehicle] execVM "scripts\misc\repair\TAA_Database.sqf";
	};
	
	if ( _classname in repair_container && _isServer ) then {
		_vehicle setRepairCargo 1;
		_vehicle addItemCargoGlobal ["Toolkit", 25];
	};
	
	if ( _classname in disable_damage && _isServer ) then {
		_vehicle allowDamage false;
	};
	
	if ( _classname in carryable_objects ) then {
		[_vehicle, true, [0, 1, 0], 180] call ace_dragging_fnc_setCarryable;
	};
	
	if ( _classname in draggable_objects ) then {
		[_vehicle, true, [0, 1, 0], 180] call ace_dragging_fnc_setDraggable;
	};
	
	if ( _classname isEqualTo "Flag_Red_F" && _isServer ) then {
		_vehicle setFlagTexture "res\flag_portugal_co.paa";
		_vehicle setFlagSide west;
	};
	
	if ( _classname isEqualTo "Flag_Green_F" && _isServer ) then {
		_vehicle setFlagTexture "res\flag_ptrangers_co.paa";
		_vehicle setFlagSide west;
	};
}forEach (allMissionObjects "");