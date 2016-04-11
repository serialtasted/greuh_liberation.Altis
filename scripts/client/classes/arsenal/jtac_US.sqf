/*
Whitelist Arsenal items and weapons

Created by: Serialtasted
*/

// set default loadout if classtogo is different from -1
if ( classtogo != "" ) then {

	comment "Add containers";
	player forceAddUniform "rhs_uniform_cu_ocp";
	player addVest "rhsusf_iotv_ocp_Rifleman";
	for "_i" from 1 to 5 do {player addItemToVest "rhs_mag_an_m8hc";};
	for "_i" from 1 to 5 do {player addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	for "_i" from 1 to 4 do {player addItemToVest "rhs_mag_m67";};
	for "_i" from 1 to 4 do {player addItemToVest "rhs_mag_mk84";};
	for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_m18_red";};
	for "_i" from 1 to 3 do {player addItemToVest "Laserbatteries";};
	player addHeadgear "rhsusf_ach_helmet_ocp";
	player addGoggles "rhs_googles_black";

	comment "Add weapons";
	player addWeapon "rhs_weap_m16a4_grip";
	player addPrimaryWeaponItem "FHQ_acc_LLM01L";
	player addPrimaryWeaponItem "FHQ_optic_ACOG";
	player addWeapon "Laserdesignator";

	comment "Add items";
	player linkItem "B_UavTerminal";
	
};



arsenal_weapons = [
	"Binocular",
	"Laserdesignator",
	"ACE_MX2A",
	
	"rhs_weap_m4",
	"rhs_weap_m4_grip",
	"rhs_weap_m4_grip2",
	"rhs_weap_m4_bipod",
	"rhs_weap_m4_carryhandle",
	"rhs_weap_m4_carryhandle_pmag",
	
	"rhs_weap_m4a1",
	"rhs_weap_m4a1_grip",
	"rhs_weap_m4a1_grip2",
	"rhs_weap_m4a1_bipod",
	"rhs_weap_m4a1_carryhandle",
	"rhs_weap_m4a1_carryhandle_grip",
	"rhs_weap_m4a1_carryhandle_grip2",
	"rhs_weap_m4a1_carryhandle_bipod",
	
	"rhs_weap_m16a4",
	"rhs_weap_m16a4_grip",
	"rhs_weap_m16a4_bipod",
	"rhs_weap_m16a4_carryhandle",
	"rhs_weap_m16a4_carryhandle_pmag",
	"rhs_weap_m16a4_carryhandle_grip",
	"rhs_weap_m16a4_carryhandle_grip_pmag",
	"rhs_weap_m16a4_carryhandle_bipod",

	"rhs_weap_M590_8RD",
	"rhs_weap_M590_5RD",
	
	"rhs_weap_M136_hp",
	
	// flares
	"rhs_weap_rsp30_white",
	"rhs_weap_rsp30_red",
	"rhs_weap_rsp30_green",
	
	// handguns
	"RH_usp",
	"RH_m1911",
	"RH_p226",
	"RH_mp412",
	"RH_fnp45",
	"RH_fnp45t",
	"RH_muzi",
	
	// MX
	"arifle_MX_F",
	"arifle_MX_Black_F",
	"arifle_MXC_F",
	"arifle_MXC_Black_F"
];

arsenal_magazines = [
	// Grenades
	"rhs_mag_m67",
	"rhs_mag_m69",
	"rhs_mag_mk84",
	"rhs_mag_an_m8hc",
	"rhs_mag_an_m14_th3",
	"rhs_mag_m7a3_cs",
	"rhs_mag_mk3a2",
	"rhs_mag_m18_green",
	"rhs_mag_m18_purple",
	"rhs_mag_m18_red",
	"rhs_mag_m18_yellow",

	"Chemlight_green",
	"Chemlight_red",
	"Chemlight_yellow",
	"Chemlight_blue",
	
	"Laserbatteries",

	// 5.56 mags
	"rhs_mag_30Rnd_556x45_Mk318_Stanag",
	"rhs_mag_30Rnd_556x45_Mk262_Stanag",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow",
	"rhs_mag_30Rnd_556x45_M200_Stanag",
	
	//ACE grenades
	"ACE_HandFlare_White",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Yellow",
	
	//handgun magazines
	"RH_12Rnd_45cal_usp",
	"RH_7Rnd_45cal_m1911",
	"RH_15Rnd_9x19_SIG",
	"RH_6Rnd_357_Mag",
	"RH_15Rnd_45cal_fnp",
	"RH_30Rnd_9x19_UZI",
	
	//MX magazines
	"30Rnd_65x39_caseless_mag",
	"30Rnd_65x39_caseless_mag_Tracer"
];

arsenal_items = [
	//misc items
	"itemMap",
	"itemCompass",
	"itemWatch",
	"Laserdesignator",
	
	//uav terminal
	"B_UavTerminal",
	
	//special uniforms
	"U_B_Wetsuit",
	"V_RebreatherB",
	
	//balaclavas
	"G_Balaclava_blk",
	"G_Balaclava_combat",
	"G_Balaclava_lowprofile",
	"G_Balaclava_oli",
	
	//bandana
	"G_Bandanna_aviator",
	"G_Bandanna_beast",
	"G_Bandanna_blk",
	"G_Bandanna_khk",
	"G_Bandanna_oli",
	"G_Bandanna_shades",
	"G_Bandanna_sport",
	"G_Bandanna_tan",
	
	//googles
	"G_Combat",
	"G_Lowprofile",
	"G_Tactical_Black",
	"G_Tactical_Clear",
	"G_Aviator",
	"G_Spectacles",
	"G_Spectacles_Tinted",
	"G_Squares",
	"G_Squares_Tinted",
	"G_Shades_Black",
	"G_Shades_Blue",
	"G_Shades_Green",
	"G_Shades_Red",
	"G_B_Diving",

	//uniforms
	"rhs_uniform_cu_ocp",
	"rhs_uniform_cu_ucp",

	//vests
	//IOTV
	"rhsusf_iotv_ocp_Rifleman",
	"rhsusf_iotv_ucp_Rifleman",

	//opticgear
	"rhs_googles_black",
	"rhs_googles_clear",
	"rhs_googles_yellow",
	"rhs_googles_orange",

	//headgear
	"rhsusf_ach_helmet_ocp",
	"rhsusf_ach_helmet_ucp",
	"rhsusf_ach_helmet_camo_ocp",
	"rhsusf_ach_helmet_headset_ocp",
	"rhsusf_ach_helmet_headset_ucp",

	//accesories
	"rhsusf_acc_compm4",
	"rhsusf_acc_LEUPOLDMK4",
	"rhsusf_acc_LEUPOLDMK4_2",
	"rhsusf_acc_HAMR",
	"rhsusf_acc_EOTECH",
	"rhsusf_acc_eotech_552",
	"rhsusf_acc_ELCAN",
	"rhsusf_acc_ACOG",
	"rhsusf_acc_ACOG2",
	"rhsusf_acc_ACOG3",
	"rhsusf_acc_ACOG_USMC",
	"rhsusf_acc_ACOG2_USMC",
	"rhsusf_acc_ACOG3_USMC",
	"rhsusf_acc_M2010S",
	"rhsusf_acc_SR25S",
	"rhsusf_acc_anpeq15",
	"rhsusf_acc_anpeq15_light",
	"rhsusf_acc_anpeq15side",
	"rhsusf_acc_anpeq15A",
	"rhsusf_acc_harris_bipod",
	"rhsusf_acc_rotex5_grey",
	"rhsusf_acc_rotex5_tan",
	"rhsusf_acc_nt4_black",
	"rhsusf_acc_nt4_tan",
	"rhsusf_acc_SF3P556",
	"rhsusf_acc_SFMB556",
	
	//vanilla accesories
	"bipod_01_F_snd",
	"bipod_01_F_blk",
	"bipod_01_F_mtp",
	
	//FHQ accessories
	"FHQ_optic_ACOG",
	"FHQ_optic_ACOG_tan",
	"FHQ_optic_AIM",
	"FHQ_optic_AIM_tan",
	"FHQ_optic_HWS",
	"FHQ_optic_HWS_tan",
	"FHQ_optic_HWS_G33",
	"FHQ_optic_HWS_G33_tan",
	"FHQ_optic_MicroCCO",
	"FHQ_optic_MicroCCO_tan",
	"FHQ_optic_MicroCCO_low",
	"FHQ_optic_MicroCCO_low_tan",
	"FHQ_optic_LeupoldERT",
	"FHQ_optic_LeupoldERT_tan",
	"FHQ_acc_ANPEQ15",
	"FHQ_acc_ANPEQ15_black",
	"FHQ_acc_LLM01L",
	"FHQ_acc_LLM01F",
	"FHQ_optic_VCOG",
	"FHQ_optic_VCOG_tan",
	"FHQ_optic_AC11704",
	"FHQ_optic_AC11704_tan",
	"FHQ_optic_AC12136",
	"FHQ_optic_AC12136_tan",
	"FHQ_optic_MARS",
	"FHQ_optic_MARS_tan",
	"FHQ_optic_AimM_BLK",
	"FHQ_optic_AimM_TAN",
	"FHQ_optic_MCCO_M_BLK",
	"FHQ_optic_MCCO_M_TAN",
	
	//ACE items
	"ACE_IR_Strobe_Item",
	"ACE_ATragMX",
	"ACE_CableTie",
	"ACE_ConcertinaWireCoil",
	"ACE_DAGR",
	"ACE_EarPlugs",
	"ACE_HuntIR_monitor",
	"ACE_wirecutter",
	"ACE_MapTools",
	"ACE_microDAGR",
	"ACE_RangeTable_82mm",
	"ACE_NVG_Gen1",
	"ACE_NVG_Gen2",
	"ACE_NVG_Gen3",
	"ACE_NVG_Gen4",
	"ACE_NVG_Wide",
	"ACE_SpareBarrel",
	"ACE_Altimeter",
	"ACE_key_lockpick",
	"ACE_Sandbag_empty",
	"ACE_SpraypaintBlack",
	"ACE_SpraypaintRed",
	"ACE_SpraypaintGreen",
	"ACE_SpraypaintBlue",
	
	//ACE flashlights
	"ACE_Flashlight_MX991",
	"ACE_Flashlight_KSF1",
	"ACE_Flashlight_XL50",
	
	//ACE basic medical items
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_morphine",
	
	//handgun accesories
	"RH_x2",
	"RH_m6x",
	"RH_x300",
	"RH_fhusp",
	"RH_muzisd",
	"RH_gemtech45",
	"RH_gemtech9",
	"RH_suppr9",
	"optic_MRD",
	"optic_Yorris"
];

arsena_backpacks = [
	"rhsusf_assault_eagleaiii_ucp",
	"rhsusf_assault_eagleaiii_ocp",
	"rhsusf_falconii",
	
	//vanilla backpacks
	"B_Kitbag_mcamo",
	"B_Kitbag_sgg",
	"B_Kitbag_cbr",
	"B_Carryall_ocamo",
	"B_Carryall_oucamo",
	"B_Carryall_khk",
	"B_Carryall_cbr",
	
	// parachute
	"B_Parachute",
	
	// remote designator
	"B_Static_Designator_01_weapon_F",
	
	// ACE backpacks
	"ACE_TacticalLadder_Pack"
];