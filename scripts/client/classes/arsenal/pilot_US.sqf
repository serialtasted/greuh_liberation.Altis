/*
Whitelist Arsenal items and weapons

Created by: Serialtasted
*/

// set default loadout if classtogo is different from -1
if ( classtogo != "" ) then {

	comment "Add containers";
	player forceAddUniform "U_B_HeliPilotCoveralls";
	
	/*switch (getPlayerUID player) do {
		case "76561198035670394": { player addHeadgear "Patcho_HeliHelmet_Serialtasted" };
		case "76561198080606334": { player addHeadgear "Patcho_HeliHelmet_Whiplash" };
		default { player addHeadgear "rhsusf_hgu56p" };
	};*/
	
	player addHeadgear "rhsusf_hgu56p";
};



arsenal_weapons = [
	"Binocular",
	
	"RH_usp",
	
	// flares
	"rhs_weap_rsp30_green"
];

arsenal_magazines = [
	"RH_12Rnd_45cal_usp",
	
	// Grenades
	"rhs_mag_an_m8hc",
	"rhs_mag_m18_green",
	"rhs_mag_m18_purple",
	"rhs_mag_m18_red",
	"rhs_mag_m18_yellow",
	
	//ACE grenades
	"ACE_HandFlare_White",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Yellow"
];

arsenal_items = [
	"itemMap",
	"itemCompass;",
	"itemWatch",
	
	"H_Cap_headphones",
	"H_PilotHelmetHeli_B",
	"H_PilotHelmetFighter_B",
	
	"U_B_PilotCoveralls",
	"U_B_HeliPilotCoveralls",
	
	"ACE_NVG_Wide",
	
	"RH_m6x",
	
	"ACE_Flashlight_XL50",
	"ACE_IR_Strobe_Item",
	"ACE_EarPlugs",
	
	"ACE_microDAGR",
	"ACE_RangeTable_82mm",
	
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_morphine"
];

arsena_backpacks = [
	// parachute
	"B_Parachute"
];