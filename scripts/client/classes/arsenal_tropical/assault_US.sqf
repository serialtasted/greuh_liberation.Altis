/*
Whitelist Arsenal items and weapons

Created by: Serialtasted
*/

// set default loadout if classtogo is different from -1
if ( classtogo != "" ) then {

	// add containers
	player forceAddUniform "PMF_erdl_uniform_01";
	player addVest "pmf_Vest_ranger_rig";
	for "_i" from 1 to 5 do {player addItemToVest "SmokeShell";};
	for "_i" from 1 to 6 do {player addItemToVest "30Rnd_556x45_Stanag";};
	player addItemToVest "ACE_SpraypaintGreen";
	player addItemToVest "ACE_SpraypaintRed";
	for "_i" from 1 to 4 do {player addItemToVest "MiniGrenade";};
	for "_i" from 1 to 4 do {player addItemToVest "ACE_M84";};
	for "_i" from 1 to 2 do {player addItemToVest "SmokeShellRed";};
	player addHeadgear "pmf_wd_ech_b";
	player addGoggles "G_Combat";

	// add weapons
	player addWeapon "rhs_weap_m4a1_blockII_bk";
	player addPrimaryWeaponItem "30Rnd_556x45_Stanag";
	player addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
	player addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR";
	player addWeapon "rhs_m136_hedp_mag";
	player addWeapon "Binocular";
	
};

// set base values for uniform, vest and headgear
baseUniform = "PMF_erdl_uniform_01";
baseVest = "pmf_Vest_ranger_rig";
baseHeadGear = "pmf_wd_ech_b";
baseBackpack = "";

arsenal_weapons = [
	"Binocular",
	"ACE_MX2A",
	
	// rifles
	"rhs_weap_m16a4",
	"rhs_weap_m4a1_blockII_bk",
	"rhs_weap_m4",
	"rhs_weap_hk416d10",
	
	// submachine guns
	"ffaa_armas_hkmp5a5",
	"ffaa_armas_ump",
	"ffaa_armas_p90",
	
	// shotguns
	"rhs_weap_M590_5RD",
	
	// launchers
	"rhs_m136_hedp_mag",
	"rhs_weap_smaw_green",
	
	// handguns
	"rhsusf_weap_glock17g4",
	"rhsusf_weap_m9",
	"rhsusf_weap_m1911a1",
	"hgun_Pistol_Signal_F",
	
	// MX
	"arifle_MX_F",
	"arifle_MX_Black_F",
	"arifle_MXC_F",
	"arifle_MXC_Black_F"
];

arsenal_magazines = [
	// Grenades
	"MiniGrenade",
	"HandGrenade",
	"ACE_M84",
	"SmokeShell",
	"SmokeShellGreen",
	"SmokeShellPurple",
	"SmokeShellRed",
	"SmokeShellYellow",

	"Chemlight_green",
	"Chemlight_red",
	"Chemlight_yellow",
	"Chemlight_blue",

	// 5.56 mags
	"30Rnd_556x45_Stanag",
	"30Rnd_556x45_Stanag_Tracer_Red",
	"30Rnd_556x45_Stanag_Tracer_Green",
	"30Rnd_556x45_Stanag_Tracer_Yellow",
	
	// submachine mags
	"ffaa_9x19_mp5",
	"ffaa_9x19_ump",
	"ffaa_507x28_p90",
	
	// shotgun mags
	"rhsusf_5Rnd_00Buck",
	
	// ACE grenades
	"ACE_HandFlare_White",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Yellow",
	
	// rockets
	"rhs_mag_smaw_HEAA",
	"rhs_mag_smaw_HEDP",
	
	// handgun magazines
	"rhsusf_mag_17Rnd_9x19_JHP",
	"rhsusf_mag_15Rnd_9x19_JHP",
	"rhsusf_mag_7x45acp_MHP",
	
	// flare gun
	"6Rnd_GreenSignal_F",
	"6Rnd_RedSignal_F",
	
	// MX magazines
	"30Rnd_65x39_caseless_mag",
	"30Rnd_65x39_caseless_mag_Tracer"
];

arsenal_items = [
	// misc items
	"itemMap",
	"itemCompass",
	"itemWatch",
	
	// special uniforms
	"U_B_Wetsuit",
	"PMF_fuz_uniform_dv",
	"V_RebreatherB",
	
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
	"G_Combat_Goggles_tna_F",
	"rhs_googles_black",
	"rhs_googles_clear",
	"G_Aviator",
	"G_Spectacles",
	"G_Spectacles_Tinted",
	"G_B_Diving",

	// uniforms
	"PMF_erdl_uniform_01",
	"PMF_erdl_uniform_02",
	"PMF_erdl_uniform_03",

	// vests
	"pmf_Vest_ranger_rig",
	"pmf_Vest_ranger_lite",
	"V_Rangemaster_belt",

	// headgear
	"pmf_wd_ech_b",
	"pmf_wd_ech_light",
	"pmf_wd_ech_light_headset",
	"pmf_wd_ch",
	"rhsusf_bowman_cap",
	
	// vanilla accessories
	"bipod_01_F_snd",
	"bipod_01_F_blk",
	"bipod_01_F_mtp",
	
	// RHS accessories - rifles
	"rhs_weap_m4_grip",
	"rhs_weap_m4_grip2",
	"rhs_weap_m4_grip3",
	"rhs_weap_m4_carryhandle",
	"rhs_weap_m4_carryhandle_pmag",
	"rhs_weap_m4a1_carryhandle",
	"rhs_weap_m4a1_carryhandle_grip",
	"rhs_weap_m4a1_carryhandle_grip2",
	"rhs_weap_m4a1_carryhandle_grip3",
	"rhs_weap_m4a1_m320",
	"rhsusf_acc_EOTECH",
	"rhsusf_acc_eotech_552",
	"rhsusf_acc_eotech_552_d",
	"rhsusf_acc_compm4",
	"rhsusf_acc_ACOG",
	"rhsusf_acc_ACOG2",
	"rhsusf_acc_ACOG3",
	"rhsusf_acc_ACOG_RMR",
	"rhsusf_acc_ACOG_USMC",
	"rhsusf_acc_ACOG2_USMC",
	"rhsusf_acc_ACOG3_USMC",
	"rhsusf_acc_ACOG_d",
	"rhsusf_acc_ACOG_MDO",
	"rhsusf_acc_ELCAN",
	"rhsusf_acc_ELCAN_ard",
	"rhsusf_acc_ELCAN_pip",
	"rhsusf_acc_SpecterDR",
	"rhsusf_acc_SpecterDR_A",
	"rhsusf_acc_SpecterDR_3d",
	"rhsusf_acc_SpecterDR_A_3d",
	"rhsusf_acc_SpecterDR_CX_3D",
	
	"rhsusf_acc_nt4_black",
	"rhsusf_acc_nt4_tan",
	"rhsusf_acc_rotex5_grey",
	"rhsusf_acc_rotex5_tan",
	"rhsusf_acc_M2010S",
	"rhsusf_acc_SR25S",
	"rhsusf_acc_rotex_mp7",
	"rhsusf_acc_rotex_mp7_winter",
	"rhsusf_acc_rotex_mp7_desert",
	"rhsusf_acc_rotex_mp7_aor1",
	"rhsusf_acc_SF3P556",
	"rhsusf_acc_SFMB556",
	"rhsusf_acc_ARDEC_M240",
	"rhsusf_acc_M952V",
	
	"ACE_acc_pointer_green",
	"acc_pointer_IR",
	"acc_flashlight",
	
	"rhsusf_acc_grip1",
	"rhsusf_acc_grip2",
	"rhsusf_acc_grip2_tan",
	"rhsusf_acc_grip3",
	"rhsusf_acc_grip3_tan",
	
	// RHS accessories - handguns
	"rhsusf_acc_omega9k",
	"rhsusf_acc_nt4_black",
	"rhsusf_acc_nt4_tan",
	"rhsusf_acc_rotex5_grey",
	"rhsusf_acc_rotex5_tan",
	"rhsusf_acc_SF3P556",
	"rhsusf_acc_SFMB556",
	
	// ACE accessories
	"ACE_muzzle_mzls_B",
	
	// vanilla accessories
	"muzzle_snds_H",
	"muzzle_snds_B",
	"muzzle_snds_M",
	
	// ACE items
	"ACE_IR_Strobe_Item",
	"ACE_ATragMX",
	"ACE_CableTie",
	"ACE_ConcertinaWireCoil",
	"ACE_EarPlugs",
	"ACE_HuntIR_monitor",
	"ACE_wirecutter",
	"ACE_MapTools",
	"ACE_microDAGR",
	"ACE_RangeTable_82mm",
	"NVGoggles_OPFOR",
	"ACE_SpareBarrel",
	"ACE_Altimeter",
	"ACE_key_lockpick",
	"ACE_Sandbag_empty",
	"ACE_entrenchingtool",
	"ACE_SpraypaintBlack",
	"ACE_SpraypaintRed",
	"ACE_SpraypaintGreen",
	"ACE_SpraypaintBlue",
	
	// ACE flashlights
	"ACE_Flashlight_MX991",
	"ACE_Flashlight_KSF1",
	"ACE_Flashlight_XL50",
	
	// ACE basic medical items
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_morphine",
	
	// handgun accessories
	"muzzle_snds_acp",
	"optic_MRD",
	
	// advanced logistics
	"AdvLog_TowCable"
];

arsenal_backpacks = [
	// vanilla backpacks
	"pmf_compact",
	"pmf_kitbag",
	
	// parachute
	"B_Parachute",
	
	// ACE backpacks
	"ACE_TacticalLadder_Pack"
];