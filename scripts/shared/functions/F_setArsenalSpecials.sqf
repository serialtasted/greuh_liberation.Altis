private [ "_playerclass", "_general_class", "_pilot_class", "_crew_class", "_commander_class" ];

_playerclass = player getVariable ["St_class", "assault"];
_general_class = ["assault", "at", "aa", "ar", "engineer", "fso", "grenadier", "jtac", "marksman", "medic", "sniper"];
_pilot_class = ["pilot"];
_crew_class = ["crew"];
_commander_class = ["commander"];
_class_allow_carry = ["aa", "at", "engineer", "ar"];

if ( _playerclass in _general_class ) then {
	
	_vestType = "";
	switch (GRLIB_worldType) do {
		case "desert": { _vestType = "Vest_des" }; 
		case "tropical": { _vestType = "Vest_" }; 
		case "winter": { _vestType = "VestDPM_" }; 
		case "woodland": { _vestType = "VestDPM_" }; 
	};
	
	// special items
	switch (getPlayerUID player) do {
		case "76561198035670394": { arsenal_items pushBack format["pmf_%1serial", _vestType] };
		case "76561198080606334": { arsenal_items pushBack format["pmf_%1whip", _vestType] };
		case "76561197995464883": { arsenal_items pushBack format["pmf_%1tiago", _vestType] };
		case "76561198132294209": { arsenal_items pushBack format["pmf_%1tuga", _vestType] };
		case "76561198115914620": { arsenal_items pushBack format["pmf_%1gongas", _vestType] };
		default { };
	};
	
	// specops mode
	if ( (missionNamespace getVariable ["specops_mode", 0]) isEqualTo 1 ) then {
		specops_gear = [
			// uniforms
			"PMF_black_uniform_01",

			// vests
			"pmf_Vest_fuz_rig",
			"pmf_Vest_fuz_lite",
			"V_BandollierB_blk",

			// headgear
			"H_Bandanna_gry",
			"H_Watchcap_blk",
			"rhsusf_protech_helmet_rhino",
			"rhsusf_opscore_bk",
			"rhsusf_opscore_bk_pelt",
			
			// thermal optics
			"NVGogglesB_blk_F"
		];
		arsenal_items = arsenal_items + specops_gear;
		
		specops_gear_backpacks = [
			// backpacks
			"B_AssaultPack_blk",
			"pmf_kitbag_black"
		];
		
		if ( _playerclass in _class_allow_carry ) then {
			specops_gear_backpacks = specops_gear_backpacks + ["pmf_carry_black"];
		};
		
		arsenal_backpacks = arsenal_backpacks + specops_gear_backpacks;
	};
	
};

if ( _playerclass in _pilot_class ) then {
	// special items
	switch (getPlayerUID player) do {
		case "76561198035670394": { arsenal_items pushBack "Patcho_HeliHelmet_Serialtasted" };
		case "76561198080606334": { arsenal_items pushBack "Patcho_HeliHelmet_Whiplash" };
		default { };
	};
};