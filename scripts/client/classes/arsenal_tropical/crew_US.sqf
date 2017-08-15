/*
Whitelist Arsenal items and weapons

Created by: Serialtasted
*/

// set default loadout if classtogo is different from -1
if ( classtogo != "" ) then {

	// add containers
	player forceAddUniform "rhs_uniform_g3_rgr";
	player addVest "V_TacVest_brn";
	for "_i" from 1 to 2 do {player addItemToVest "ffaa_9x19_mp5";};
	player addHeadgear "rhsusf_cvc_green_helmet";
	player addGoggles "G_Combat";

	// add weapons
	player addWeapon "ffaa_armas_hkmp5a5";
	player addPrimaryWeaponItem "ffaa_9x19_mp5";
	player addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
	player addPrimaryWeaponItem "rhsusf_acc_compm4";
	
	// add flare gun
	player addItemToVest"hgun_Pistol_Signal_F";
	
};

// set base values for uniform, vest and headgear
baseUniform = "rhs_uniform_g3_rgr";
baseVest = "V_TacVest_brn";
baseHeadGear = "rhsusf_cvc_green_helmet";
baseBackpack = "";

arsenal_weapons = [
	"Binocular",
	
	// submachine guns
	"ffaa_armas_hkmp5a5",
	
	// handguns
	"rhsusf_weap_glock17g4",
	"rhsusf_weap_m9",
	"rhsusf_weap_m1911a1",
	"hgun_Pistol_Signal_F"
];

arsenal_magazines = [
	// Grenades
	"SmokeShellPurple",
	
	// ACE grenades
	"ACE_HandFlare_Green",
	
	// submachine mags
	"ffaa_9x19_mp5",
	
	// handgun magazines
	"rhsusf_mag_17Rnd_9x19_JHP",
	"rhsusf_mag_15Rnd_9x19_JHP",
	"rhsusf_mag_7x45acp_MHP",
	
	// flare gun
	"6Rnd_GreenSignal_F",
	"6Rnd_RedSignal_F"
];

arsenal_items = [
	// misc items
	"itemMap",
	"itemCompass",
	"itemWatch",
	"toolkit",
	
	// balaclavas
	"G_Balaclava_blk",
	"G_Balaclava_combat",
	"G_Balaclava_oli",
	"G_Balaclava_TI_blk_F",
	"G_Balaclava_TI_G_blk_F",
	"G_Balaclava_TI_tna_F",
	"G_Balaclava_TI_G_tna_F",
	
	// bandana
	"G_Bandanna_aviator",
	"G_Bandanna_beast",
	"G_Bandanna_blk",
	"G_Bandanna_khk",
	"G_Bandanna_oli",
	"G_Bandanna_tan",
	
	// googles
	"G_Combat",

	// uniforms
	"rhs_uniform_g3_rgr",

	// vests
	"V_TacVest_brn",
	"V_Rangemaster_belt",

	// headgear
	"rhsusf_cvc_green_helmet",
	
	// RHS accessories
	"rhsusf_acc_anpeq15_bk",
	"rhsusf_acc_compm4",
	"rhsusf_acc_omega9k",
	
	// ACE items
	"ACE_IR_Strobe_Item",
	"ACE_EarPlugs",
	"ACE_wirecutter",
	"ACE_MapTools",
	"ACE_microDAGR",
	"ACE_RangeTable_82mm",
	"NVGoggles_OPFOR",
	"ACE_key_lockpick",
	
	// ACE flashlights
	"ACE_Flashlight_MX991",
	"ACE_Flashlight_KSF1",
	"ACE_Flashlight_XL50",
	
	// ACE basic medical items
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_morphine",
	
	// advanced logistics
	"AdvLog_TowCable"
];

arsenal_backpacks = [
	// vanilla backpacks
	"B_AssaultPack_cbr",
	
	// parachute
	"B_Parachute"
];