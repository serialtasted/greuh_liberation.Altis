params [ "_vehicle", ["_fillVeh", false] ];

_classname = typeOf _vehicle;

// -- Initialize Veh
if ( _vehicle isKindOf "Helicopter" ) then {

	if ( _classname == "RHS_MELB_MH6M" || _classname == "RHS_MELB_AH6M_L" ) then {
		[_vehicle,[0,"res\tex\melb_body_co.paa"]] remoteExec ["setObjectTexture",0,true];
	};
	
	if ( _classname == "RHS_UH60M" ) then {
		[_vehicle,[0,"res\tex\uh60_body_co.paa"]] remoteExec ["setObjectTexture",0,true];
	};

};

if ( _vehicle isKindOf "Plane" ) then {

	if ( _classname == "ffaa_ea_hercules" || _classname == "ffaa_ea_hercules_cargo" ) then {
		[_vehicle,[0,"res\tex\c130j_body_co.paa"]] remoteExec ["setObjectTexture",0,true];
		[_vehicle,[1,"res\tex\c130j_wings_co.paa"]] remoteExec ["setObjectTexture",0,true];
	};
	
	if ( _classname == "FIR_F16C" || _classname == "FIR_F16D" ) then {
		[_vehicle,[0,"res\tex\f16_body_falcon_co.paa"]] remoteExec ["setObjectTexture",0,true];
		[_vehicle,[1,"res\tex\f16_wings_falcon_co.paa"]] remoteExec ["setObjectTexture",0,true];
	};
	
};

_defaultColor = "Olive";
if ( GRLIB_worldType == "desert" ) then { _defaultColor = "Desert" };

if ( _vehicle isKindOf "Land" ) then {
	switch (_classname) do {
		case "C_Offroad_01_repair_F": { 
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
		case "B_G_Offroad_01_repair_F": { 
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
		case "C_Van_02_service_F": { 
			[
				_vehicle,
				nil,
				[
					"ladder_hide", 0,
					"spare_tyre_holder_hide", 0,
					"spare_tyre_hide", 0,
					"reflective_tape_hide", 0,
					"roof_rack_hide", 0,
					"LED_lights_hide", 0,
					"sidesteps_hide", 0,
					"front_protective_frame_hide", 0,
					"beacon_front_hide", 0,
					"beacon_rear_hide", 0
				]
			] call BIS_fnc_initVehicle;
		};
		case "C_Van_02_medevac_F": { 
			[
				_vehicle,
				nil,
				[
					"reflective_tape_hide", 0,
					"LED_lights_hide", 0,
					"sidesteps_hide", 0,
					"beacon_front_hide", 0,
					"beacon_rear_hide", 0
				]
			] call BIS_fnc_initVehicle;
		};
		default {
			[
				_vehicle,
				[_defaultColor,1], 
				true
			] call BIS_fnc_initVehicle;
		};
	};
	
	if ( _classname == "C_Van_02_transport_F" || _classname == "C_Van_02_service_F" || _classname == "C_Van_02_vehicle_F" ) then {
		if ( _defaultColor == "Olive" ) then {
			[_vehicle,[0,"res\tex\orangevan_woodland_co.paa"]] remoteExec ["setObjectTexture",0,true]
		} else {
			[_vehicle,[0,"res\tex\orangevan_desert_co.paa"]] remoteExec ["setObjectTexture",0,true];
		};
	};
	
	if ( _classname == "C_Van_02_medevac_F" ) then {
		if ( _defaultColor == "Olive" ) then {
			[_vehicle,[0,"res\tex\orangevan_medical_woodland_co.paa"]] remoteExec ["setObjectTexture",0,true]
		} else {
			[_vehicle,[0,"res\tex\orangevan_medical_desert_co.paa"]] remoteExec ["setObjectTexture",0,true];
		};
	};
};

if ( _vehicle isKindOf "NATO_Box_Base" ) then {
						
	if ( _classname == "Box_NATO_Wps_F" ) then {
		[_vehicle,[0,"res\tex\box_medical_co.paa"]] remoteExec ["setObjectTexture",0,true];
	};

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

if ( _classname in vehicle_repair_sources ) then {
	_vehicle setVariable ["ACE_isRepairVehicle", 1, true];
};

if ( _classname in vehicle_medical_sources ) then {
	_vehicle setVariable ["ace_medical_medicClass", 1, true];
};

if ( _classname in fuel_cannister ) then {
	[_vehicle, true, [0.3, 0, 0.3], 90] remoteExec ["ace_dragging_fnc_setCarryable"];
	[_vehicle, true, 1] remoteExec ["ace_cargo_fnc_makeLoadable"];
	[_vehicle] execVM "scripts\misc\repair\TAA_Database.sqf";
};

if ( _classname in carryable_objects ) then {
	[_vehicle, true, [0, 1, 0], 180] remoteExec ["ace_dragging_fnc_setCarryable"];
	[_vehicle, true, 1] remoteExec ["ace_cargo_fnc_makeLoadable"];
};

if ( _classname in draggable_objects ) then {
	[_vehicle, true, [0, 1, 0], 180] remoteExec ["ace_dragging_fnc_setDraggable"];
	[_vehicle, true, 3] remoteExec ["ace_cargo_fnc_makeLoadable"];
};

if ( _classname isEqualTo "Flag_Red_F" ) then {
	_vehicle setFlagTexture "res\flag_portugal_co.paa";
	_vehicle setFlagSide GRLIB_side_friendly;
};

if ( _classname isEqualTo "Flag_Green_F" ) then {
	_vehicle setFlagTexture "res\flag_ptrangers_co.paa";
	_vehicle setFlagSide GRLIB_side_friendly;
};

if ( _classname in disable_damage ) then {
	[_vehicle, false] remoteExec ["allowDamage"];
};


// -- Fill vehicle
if ( _fillVeh ) then {
	if ( _classname in vehicle_rearm_sources ) then {
		_vehicle setAmmoCargo 1;
	};

	if ( _classname in vehicle_refuel_sources ) then {
		_vehicle setFuelCargo 1;
	};

	if ( _classname in vehicle_repair_sources ) then {
		_vehicle setRepairCargo 1;
		_vehicle addItemCargoGlobal ["Toolkit", 25];
		["AddCargoByClass", ["ACE_Wheel", _vehicle, 6]] call ace_common_fnc_globalEvent;
		["AddCargoByClass", ["ACE_Track", _vehicle, 6]] call ace_common_fnc_globalEvent;
	}else{
		if ( _vehicle isKindOf "Land" ) then { _vehicle addItemCargoGlobal ["Toolkit", 2]; };
	};

	if ( _classname in vehicle_medical_sources ) then {
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
	};

	// FILL CUSTOM BOXES
	if ( _classname == "Box_NATO_Wps_F" ) then { // MEDICAL (TODO MEDICAL LEVEL 2)
		_vehicle addItemCargoGlobal ["ACE_fieldDressing", 80];
		_vehicle addItemCargoGlobal ["ACE_elasticBandage", 80];
		_vehicle addItemCargoGlobal ["ACE_bloodIV", 60];
		_vehicle addItemCargoGlobal ["ACE_bloodIV_500", 60];
		_vehicle addItemCargoGlobal ["ACE_bloodIV_250", 80];
		_vehicle addItemCargoGlobal ["ACE_bodyBag", 5];
		_vehicle addItemCargoGlobal ["ACE_epinephrine", 80];
		_vehicle addItemCargoGlobal ["ACE_morphine", 80];
	};
	if ( _classname == "Box_NATO_AmmoOrd_F" ) then { //EXPLOSIVES
		_vehicle addItemCargoGlobal ["ATMine_Range_Mag", 5];
		_vehicle addItemCargoGlobal ["APERSMine_Range_Mag", 5];
		_vehicle addItemCargoGlobal ["APERSBoundingMine_Range_Mag", 5];
		_vehicle addItemCargoGlobal ["SLAMDirectionalMine_Wire_Mag", 5];
		_vehicle addItemCargoGlobal ["APERSTripMine_Wire_Mag", 5];
		_vehicle addItemCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 5];
		_vehicle addItemCargoGlobal ["SatchelCharge_Remote_Mag", 5];
		_vehicle addItemCargoGlobal ["DemoCharge_Remote_Mag", 5];
	};
	if ( _classname == "Box_NATO_WpsSpecial_F" ) then { //EXPLOSIVES
		_vehicle addItemCargoGlobal ["rhs_fim92_mag", 4];
		_vehicle addItemCargoGlobal ["rhs_fgm148_magazine_AT", 4];
		_vehicle addItemCargoGlobal ["rhs_fgm148_magazine_AT", 2];
		_vehicle addItemCargoGlobal ["rhs_mag_smaw_HEAA", 2];
		_vehicle addItemCargoGlobal ["rhs_mag_smaw_HEDP", 2];
	};
	if ( _classname == "Box_NATO_Ammo_F" ) then { // BASIC AMMO
		_vehicle addItemCargoGlobal ["30Rnd_556x45_Stanag", 25];
		_vehicle addItemCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 10];
		_vehicle addItemCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Green", 10];
		_vehicle addItemCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Yellow", 10];
		_vehicle addItemCargoGlobal ["ffaa_9x19_mp5", 5];
		_vehicle addItemCargoGlobal ["ffaa_9x19_ump", 5];
		_vehicle addItemCargoGlobal ["ffaa_507x28_p90", 5];
		_vehicle addItemCargoGlobal ["rhsusf_5Rnd_00Buck", 5];
		_vehicle addItemCargoGlobal ["30Rnd_65x39_caseless_mag", 15];
		_vehicle addItemCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 10];
		_vehicle addItemCargoGlobal ["rhsusf_5Rnd_300winmag_xm2010", 5];
		_vehicle addItemCargoGlobal ["rhsusf_20Rnd_762x51_m993_Mag", 5];
		_vehicle addItemCargoGlobal ["rhsusf_20Rnd_762x51_m62_Mag", 5];
		_vehicle addItemCargoGlobal ["ffaa_127x99_ap", 5];
		_vehicle addItemCargoGlobal ["ffaa_762x51_accuracy", 5];
		_vehicle addItemCargoGlobal ["10Rnd_93x64_DMR_05_Mag", 5];
		_vehicle addItemCargoGlobal ["rhsusf_mag_17Rnd_9x19_JHP", 5];
		_vehicle addItemCargoGlobal ["rhsusf_mag_15Rnd_9x19_JHP", 5];
		_vehicle addItemCargoGlobal ["rhsusf_mag_7x45acp_MHP", 5];
	};
	if ( _classname == "Box_NATO_Grenades_F" ) then { // GRENADES
		_vehicle addItemCargoGlobal ["MiniGrenade", 5];
		_vehicle addItemCargoGlobal ["HandGrenade", 5];
		_vehicle addItemCargoGlobal ["ACE_M84", 5];
		_vehicle addItemCargoGlobal ["SmokeShell", 5];
		_vehicle addItemCargoGlobal ["SmokeShellGreen", 5];
		_vehicle addItemCargoGlobal ["SmokeShellPurple", 5];
		_vehicle addItemCargoGlobal ["SmokeShellRed", 5];
		_vehicle addItemCargoGlobal ["SmokeShellYellow", 5];
		_vehicle addItemCargoGlobal ["Chemlight_green", 5];
		_vehicle addItemCargoGlobal ["Chemlight_red", 5];
		_vehicle addItemCargoGlobal ["Chemlight_yellow", 5];
		_vehicle addItemCargoGlobal ["Chemlight_blue", 5];
		_vehicle addItemCargoGlobal ["1Rnd_HE_Grenade_shell", 3];
		_vehicle addItemCargoGlobal ["ACE_HandFlare_White", 3];
		_vehicle addItemCargoGlobal ["ACE_HandFlare_Red", 3];
		_vehicle addItemCargoGlobal ["ACE_HandFlare_Green", 3];
		_vehicle addItemCargoGlobal ["ACE_HandFlare_Yellow",3];
		_vehicle addItemCargoGlobal ["ACE_HuntIR_M203", 3];
	};
	if ( _classname == "Box_NATO_Support_F" ) then { // SUPPORT
		_vehicle addItemCargoGlobal ["ACE_IR_Strobe_Item", 15];
		_vehicle addItemCargoGlobal ["ACE_ATragMX", 3];
		_vehicle addItemCargoGlobal ["ACE_CableTie", 30];
		_vehicle addItemCargoGlobal ["ACE_Clacker", 2];
		_vehicle addItemCargoGlobal ["ACE_M26_Clacker", 2];
		_vehicle addItemCargoGlobal ["ACE_DefusalKit", 4];
		_vehicle addItemCargoGlobal ["ACE_EarPlugs", 20];
		_vehicle addItemCargoGlobal ["ACE_wirecutter", 2];
		_vehicle addItemCargoGlobal ["ACE_MapTools", 15];
		_vehicle addItemCargoGlobal ["ACE_microDAGR", 10];
		_vehicle addItemCargoGlobal ["ACE_RangeTable_82mm", 7];
		_vehicle addItemCargoGlobal ["ACE_SpareBarrel", 3];
		_vehicle addItemCargoGlobal ["ACE_Altimeter", 12];
		_vehicle addItemCargoGlobal ["ACE_key_lockpick", 5];
		_vehicle addItemCargoGlobal ["ACE_entrenchingtool", 2];
		_vehicle addItemCargoGlobal ["ACE_SpraypaintBlack", 10];
		_vehicle addItemCargoGlobal ["ACE_SpraypaintRed", 10];
		_vehicle addItemCargoGlobal ["ACE_SpraypaintGreen", 10];
		_vehicle addItemCargoGlobal ["ACE_SpraypaintBlue", 10];
		_vehicle addItemCargoGlobal ["AdvLog_TowCable", 5];
	};

	if ( _classname in vehicle_repair_containers ) then {
		_vehicle setRepairCargo 1;
		_vehicle addItemCargoGlobal ["Toolkit", 25];
	};
};


_vehicle setVariable ["ALLOWRECYCLE", true, true];

