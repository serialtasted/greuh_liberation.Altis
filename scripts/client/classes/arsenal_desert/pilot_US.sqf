/*
Whitelist Arsenal items and weapons

Created by: Serialtasted
*/

// set default loadout if classtogo is different from -1
if ( classtogo != "" ) then {

	// add containers
	player forceAddUniform "U_B_HeliPilotCoveralls";
	player addVest "V_TacVest_oli";
	player addHeadgear "H_PilotHelmetHeli_B";
	
	// add flare gun
	player addItemToVest "hgun_Pistol_Signal_F";
	
};

// set base values for uniform, vest and headgear
baseUniform = "U_B_HeliPilotCoveralls";
baseVest = "V_TacVest_oli";
baseHeadGear = "";
baseBackpack = "";

arsenal_weapons = [
	"Binocular",
	
	// handguns
	"rhsusf_weap_glock17g4",
	"rhsusf_weap_m9",
	"rhsusf_weap_m1911a1",
	"hgun_Pistol_Signal_F"
];

arsenal_magazines = [
	// handgun magazines
	"rhsusf_mag_17Rnd_9x19_JHP",
	"rhsusf_mag_15Rnd_9x19_JHP",
	"rhsusf_mag_7x45acp_MHP",
	
	// flare gun
	"6Rnd_GreenSignal_F",
	"6Rnd_RedSignal_F",
	
	// Grenades
	"SmokeShell",
	"SmokeShellGreen",
	"SmokeShellPurple",
	"SmokeShellRed",
	"SmokeShellYellow",
	
	// ACE grenades
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
	
	"V_TacVest_oli",
	
	"NVGoggles_OPFOR",
	
	// RHS accessories
	"rhsusf_acc_omega9k",
	
	"ACE_Flashlight_XL50",
	"ACE_IR_Strobe_Item",
	"ACE_EarPlugs",
	
	"ACE_microDAGR",
	"ACE_RangeTable_82mm",
	
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_morphine"
];

arsenal_backpacks = [
	// parachute
	"B_Parachute"
];