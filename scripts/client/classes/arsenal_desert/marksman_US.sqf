/*
Whitelist Arsenal items and weapons

Created by: Serialtasted
*/

// set default loadout if classtogo is different from -1
if ( classtogo != "" ) then {

	// add containers
	player forceAddUniform "PMF_des_uniform_01";
	player addVest "pmf_Vestdes_ranger_rig";
	for "_i" from 1 to 6 do {player addItemToVest "rhsusf_20Rnd_762x51_m62_Mag";};
	for "_i" from 1 to 4 do {player addItemToVest "SmokeShell";};
	for "_i" from 1 to 2 do {player addItemToVest "MiniGrenade";};
	for "_i" from 1 to 2 do {player addItemToVest "ACE_M84";};
	player addHeadgear "PMF_des_boonie";
	player addGoggles "G_Bandanna_oli";

	// add weapons
	player addWeapon "rhs_weap_m14ebrri";
	player addPrimaryWeaponItem "rhsusf_20Rnd_762x51_m62_Mag";
	player addPrimaryWeaponItem "optic_DMS";
	player addPrimaryWeaponItem "bipod_01_F_blk";
	player addWeapon "Leupold_Mk4";
	
};

// set base values for uniform, vest and headgear
baseUniform = "PMF_des_uniform_01";
baseVest = "pmf_Vestdes_ranger_rig";
baseHeadGear = "PMF_des_boonie";
baseBackpack = "";

arsenal_weapons = [
	"Binocular",
	"Leupold_Mk4",
	"Laserdesignator",
	"ACE_MX2A",
	"ACE_Vector",
	"ACE_Yardage450",
	
	// markman rifles
	"rhs_weap_m14ebrri",
	"rhs_weap_sr25",
	"rhs_weap_m24sws_blk",
	
	// launchers
	"rhs_m136_hedp_mag",
	
	// handguns
	"rhsusf_weap_glock17g4",
	"rhsusf_weap_m9",
	"rhsusf_weap_m1911a1",
	"hgun_Pistol_Signal_F",
	
	// MX
	"arifle_MXM_F",
	"arifle_MXM_Black_F",
	
	// Marksmen DLC
	"srifle_DMR_05_blk_F",
	"srifle_DMR_05_tan_f",
	"srifle_DMR_03_F",
	"srifle_DMR_03_khaki_F",
	"srifle_DMR_03_tan_F",
	"srifle_DMR_03_woodland_F",
	"srifle_DMR_06_olive_F",
	"srifle_dmr_06_camo_f"
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
	
	"Laserbatteries",

	// M14 mag
	"rhsusf_20Rnd_762x51_m993_Mag",
	"rhsusf_20Rnd_762x51_m62_Mag",
	
	// ACE grenades
	"ACE_HandFlare_White",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Yellow", 

	// handgun magazines
	"rhsusf_mag_17Rnd_9x19_JHP",
	"rhsusf_mag_15Rnd_9x19_JHP",
	"rhsusf_mag_7x45acp_MHP",
	
	// flare gun
	"6Rnd_GreenSignal_F",
	"6Rnd_RedSignal_F",
	
	// MX mags
	"30Rnd_65x39_caseless_mag",
	
	// Marksmen magazines
	"10Rnd_93x64_DMR_05_Mag",
	"5Rnd_127x108_APDS_Mag",
	"20Rnd_762x51_Mag"
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

	// uniforms
	"PMF_des_uniform_01",
	"PMF_des_uniform_02",
	"PMF_des_uniform_03",

	// vests
	"pmf_Vestdes_ranger_lite",
	"pmf_Vestdes_ranger_rig",
	"V_Rangemaster_belt",

	// headgear
	"pmf_des_ech_a",
	"pmf_des_ech_light",
	"pmf_des_ch",
	"rhsusf_bowman_cap",
	"PMF_des_boonie",

	// vanilla accessories
	"optic_DMS",
	"optic_AMS",
	"optic_AMS_khk",
	"optic_AMS_snd",
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
	"rhsusf_acc_LEUPOLDMK4",
	"rhsusf_acc_LEUPOLDMK4_2",
	"rhsusf_acc_M8541",
	"rhsusf_acc_M8541_low",
	"rhsusf_acc_M8541_low_d",
	"rhsusf_acc_M8541_low_wd",
	"rhsusf_acc_premier",
	"rhsusf_acc_premier_low",
	"rhsusf_acc_premier_anpvs27",
	
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
	
	// RHS accessories
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
	"ACE_muzzle_mzls_93mmg",
	"muzzle_snds_93mmg",
	"muzzle_snds_93mmg_tan",
	
	// ACE items
	"ACE_IR_Strobe_Item",
	"ACE_ATragMX",
	"ACE_CableTie",
	"ACE_EarPlugs",
	"ACE_Kestrel4500",
	"ACE_MapTools",
	"ACE_microDAGR",
	"ACE_RangeTable_82mm",
	"NVGoggles_OPFOR",
	"ACE_SpareBarrel",
	"ACE_Altimeter",
	"ACE_RangeCard",
	"ACE_key_lockpick",
	"ACE_Sandbag_empty",
	"ACE_SpottingScope",
	"ACE_Tripod",
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
	"optic_MRD"
];

arsenal_backpacks = [
	// vanilla backpacks
	"pmf_compact_des",
	"pmf_kitbag_des",
	
	// parachute
	"B_Parachute"
];