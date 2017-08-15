/*
Whitelist Arsenal items and weapons

Created by: Serialtasted
*/

// set default loadout if classtogo is different from -1
if ( classtogo != "" ) then {
	
	// add containers
	player forceAddUniform "PMF_dpm_uniform_01";
	player addVest "pmf_VestDPM_rig_ranger";
	player addItemToVest "ACE_SpraypaintGreen";
	player addItemToVest "ACE_SpraypaintRed";
	for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
	for "_i" from 1 to 2 do {player addItemToVest "ACE_M84";};
	player addBackpack "pmf_carry_dpm";
	for "_i" from 1 to 3 do {player addItemToBackpack "rhs_200rnd_556x45_T_SAW";};
	player addHeadgear "pmf_dpm_ech_a";
	player addGoggles "G_Balaclava_TI_G_blk_F";

	// add weapons
	player addWeapon "rhs_weap_m249_pip_L";
	player addPrimaryWeaponItem "rhs_200rnd_556x45_T_SAW";
	player addPrimaryWeaponItem "rhsusf_acc_eotech_552";
	player addWeapon "rhs_m136_hedp_mag";
	player addWeapon "Binocular";
	
};

// set base values for uniform, vest and headgear
baseUniform = "PMF_dpm_uniform_01";
baseVest = "pmf_VestDPM_rig_ranger";
baseHeadGear = "pmf_dpm_ech_a";
baseBackpack = "pmf_carry_dpm";

arsenal_weapons = [
	"Binocular",
	"ACE_MX2A",
	
	// light machine guns
	"rhs_weap_m249_pip_L",
	"rhs_weap_m249_pip_L_vfg",
	"rhs_weap_m249_pip_S",
	"rhs_weap_m249_pip_S_vfg",
	
	// heavy machine guns
	"rhs_weap_m240B",
	
	// launchers
	"rhs_m136_hedp_mag",
	
	// handguns
	"rhsusf_weap_glock17g4",
	"rhsusf_weap_m9",
	"rhsusf_weap_m1911a1",
	"hgun_Pistol_Signal_F",
	
	// MX
	"arifle_MX_SW_F",
	"arifle_MX_SW_Black_F",
	
	// Marksmen DLC
	"MMG_02_black_F",
	"MMG_02_sand_F" 
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

	// M249 mag
	"rhs_200rnd_556x45_T_SAW",
	"rhs_200rnd_556x45_B_SAW",
	
	// M240 mag
	"rhsusf_50Rnd_762x51_m993",
	"rhsusf_100Rnd_762x51_m993",
	
	// ACE grenades
	"ACE_HandFlare_White",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Yellow", 
	"ACE_HuntIR_M203",
	
	// handgun magazines
	"rhsusf_mag_17Rnd_9x19_JHP",
	"rhsusf_mag_15Rnd_9x19_JHP",
	"rhsusf_mag_7x45acp_MHP",
	
	// flare gun
	"6Rnd_GreenSignal_F",
	"6Rnd_RedSignal_F",
	
	// mx mags
	"100Rnd_65x39_caseless_mag_Tracer",
	"100Rnd_65x39_caseless_mag",
	
	// Marksmen magazines
	"130Rnd_338_Mag"
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
	"PMF_dpm_uniform_01",
	"PMF_dpm_uniform_02",
	"PMF_dpm_uniform_03",

	// vests
	"pmf_Vest_dpm_ranger",
	"pmf_VestDPM_rig_ranger",
	"V_Rangemaster_belt",
	
	// headgear
	"pmf_dpm_ech_a",
	"pmf_dpm_ech_light",
	"pmf_dpm_ech_light_headset",
	"pmf_dpm_ch",
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
	
	// ACE items
	"ACE_IR_Strobe_Item",
	"ACE_ATragMX",
	"ACE_CableTie",
	"ACE_EarPlugs",
	"ACE_MapTools",
	"ACE_microDAGR",
	"ACE_RangeTable_82mm",
	"NVGoggles_OPFOR",
	"ACE_SpareBarrel",
	"ACE_Altimeter",
	"ACE_key_lockpick",
	"ACE_Sandbag_empty",
	"ACE_Tripod",
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
	"pmf_compact_dpm",
	"pmf_kitbag_dpm",
	"pmf_carry_dpm",
	
	// parachute
	"B_Parachute"
];