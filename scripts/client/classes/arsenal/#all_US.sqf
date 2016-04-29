/*
Whitelist Arsenal items and weapons

Created by: Serialtasted
*/

private["_advancedMedicalItems"];

all_arsenal_weapons = [
	"Binocular",
	"Laserdesignator",
	"Leupold_Mk4",
	"ACE_MX2A",
	"ACE_Vector",
	"ACE_Yardage450",
	
	"rhs_weap_m4",
	"rhs_weap_m4_m203",
	"rhs_weap_m4_grip",
	"rhs_weap_m4_grip2",
	"rhs_weap_m4_bipod",
	"rhs_weap_m4_carryhandle",
	"rhs_weap_m4_carryhandle_pmag",
	"rhs_weap_m4_m320",
	"rhs_weap_m4a1_m320",
	"rhs_weap_m4a1_m203",
	"rhs_weap_m4a1_carryhandle_m203",
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
	"rhs_weap_m16a4_carryhandle_M203",
	"rhs_weap_m16a4_carryhandle_pmag",
	"rhs_weap_m16a4_carryhandle_grip",
	"rhs_weap_m16a4_carryhandle_grip_pmag",
	"rhs_weap_m16a4_carryhandle_bipod",

	"rhs_weap_m249_pip_S",
	"rhs_weap_m249_pip_S_vfg",
	"rhs_weap_m249_pip_L",
	"rhs_weap_m249_pip_L_vfg",
	"rhs_weap_m240B",
	"rhs_weap_m240B_CAP",
	"rhs_weap_m240G",

	"rhs_weap_m14ebrri",
	"rhs_weap_sr25",
	"rhs_weap_sr25_ec",

	"rhs_weap_m39",
	"rhs_weap_XM2010",
	"rhs_weap_XM2010_d",
	"rhs_weap_XM2010_wd",
	"rhs_weap_XM2010_sa",

	"rhs_weap_M320",
	"rhs_weap_m32",

	"rhs_weap_M136",
	"rhs_weap_M136_hedp",
	"rhs_weap_M136_hp",
	"rhs_weap_fim92",
	"rhs_weap_fgm148",
	"rhs_weap_smaw",

	"rhs_weap_M590_8RD",
	"rhs_weap_M590_5RD",
	
	"rhs_weap_m27iar",
	
	//flares
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
	
	//MX
	"arifle_MXC_Black_F",
	"arifle_MX_Black_F",
	"arifle_MX_GL_Black_F",
	"arifle_MX_SW_Black_F",
	"arifle_MX_SW_Black_F",
	"arifle_MXC_F",
	"arifle_MX_F",
	"arifle_MX_GL_F",
	"arifle_MX_SW_F",
	"arifle_MXM_F",
	
	//Marksmen DLC
	"srifle_DMR_05_blk_F",
	"srifle_DMR_05_tan_f",
	"srifle_GM6_F",
	"srifle_DMR_03_F",
	"srifle_DMR_03_khaki_F",
	"srifle_DMR_03_tan_F",
	"srifle_DMR_03_woodland_F",
	"MMG_02_black_F",
	"MMG_02_sand_F"
];

all_arsenal_magazines = [
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

	//5.56 mags
	"rhs_mag_30Rnd_556x45_Mk318_Stanag",
	"rhs_mag_30Rnd_556x45_Mk262_Stanag",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow",
	"rhs_mag_30Rnd_556x45_M200_Stanag",

	//M320 ammo
	"rhs_mag_M441_HE",
	"rhs_mag_M433_HEDP",
	"rhs_mag_M4009",
	"rhs_mag_m576",
	"rhs_mag_M585_white",
	"rhs_mag_M661_green",
	"rhs_mag_M662_red",
	"rhs_mag_M713_red",
	"rhs_mag_M714_white",
	"rhs_mag_M715_green",
	"rhs_mag_M716_yellow",
	
	//M32 ammo
	"rhsusf_mag_6Rnd_M441_HE",
	"rhsusf_mag_6Rnd_M433_HEDP",
	"rhsusf_mag_6Rnd_M576_Buckshot",
	"rhsusf_mag_6Rnd_M781_Practice",
	"rhsusf_mag_6Rnd_M714_white",
	
	//M203 GL ammo
	"rhs_mag_M781_Practice",

	//M249 mag
	"rhsusf_100Rnd_556x45_soft_pouch",
	"rhsusf_100Rnd_556x45_M200_soft_pouch",
	"rhsusf_200Rnd_556x45_soft_pouch",

	//M240 mag
	"rhsusf_50Rnd_762x51",
	"rhsusf_50Rnd_762x51_m80a1epr",
	"rhsusf_50Rnd_762x51_m993",
	"rhsusf_100Rnd_762x51",
	"rhsusf_100Rnd_762x51_m80a1epr",
	"rhsusf_100Rnd_762x51_m993",

	//M14 mag
	"rhsusf_20Rnd_762x51_m118_special_Mag",
	"rhsusf_20Rnd_762x51_m993_Mag",

	//xm2010
	"rhsusf_5Rnd_300winmag_xm2010",

	//annihilator
	"rhsusf_5Rnd_00Buck",
	"rhsusf_8Rnd_00Buck",
	"rhsusf_5Rnd_Slug",
	"rhsusf_8Rnd_Slug",
	"rhsusf_5Rnd_HE",
	"rhsusf_8Rnd_HE",
	"rhsusf_5Rnd_FRAG",
	"rhsusf_8Rnd_FRAG",

	//rockets
	"rhs_m136_mag",
	"rhs_m136_hedp_mag",
	"rhs_m136_hp_mag",
	"rhs_fim92_mag",
	"rhs_fgm148_magazine_AT",
	"rhs_mag_smaw_HEAA",
	"rhs_mag_smaw_HEDP",

	//explosives
	"ATMine_Range_Mag",
	"APERSMine_Range_Mag",
	"APERSBoundingMine_Range_Mag",
	"SLAMDirectionalMine_Wire_Mag",
	"APERSTripMine_Wire_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"SatchelCharge_Remote_Mag",
	"DemoCharge_Remote_Mag",
	
	//ACE grenades
	"ACE_HandFlare_White",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Yellow", 
	"ACE_HuntIR_M203",
	
	//handgun magazines
	"RH_12Rnd_45cal_usp",
	"RH_7Rnd_45cal_m1911",
	"RH_15Rnd_9x19_SIG",
	"RH_6Rnd_357_Mag",
	"RH_15Rnd_45cal_fnp",
	"RH_30Rnd_9x19_UZI",
	
	//MX magazines
	"30Rnd_65x39_caseless_mag",
	"30Rnd_65x39_caseless_mag_Tracer",
	"100Rnd_65x39_caseless_mag_Tracer",
	"100Rnd_65x39_caseless_mag",
	"30Rnd_65x39_caseless_mag",
	"30Rnd_65x39_caseless_mag_Tracer",
	"1Rnd_HE_Grenade_shell",
	"UGL_FlareWhite_F",
	"UGL_FlareGreen_F",
	"UGL_FlareRed_F",
	"UGL_FlareYellow_F",
	"UGL_FlareCIR_F",
	"1Rnd_Smoke_Grenade_shell",
	"1Rnd_SmokeRed_Grenade_shell",
	"1Rnd_SmokeGreen_Grenade_shell",
	"1Rnd_SmokeYellow_Grenade_shell",
	"1Rnd_SmokePurple_Grenade_shell",
	"1Rnd_SmokeBlue_Grenade_shell",
	"1Rnd_SmokeOrange_Grenade_shell",
	"3Rnd_HE_Grenade_shell",
	"3Rnd_UGL_FlareWhite_F",
	"3Rnd_UGL_FlareGreen_F",
	"3Rnd_UGL_FlareRed_F",
	"3Rnd_UGL_FlareYellow_F",
	"3Rnd_UGL_FlareCIR_F",
	"3Rnd_Smoke_Grenade_shell",
	"3Rnd_SmokeRed_Grenade_shell",
	"3Rnd_SmokeGreen_Grenade_shell",
	"3Rnd_SmokeYellow_Grenade_shell",
	"3Rnd_SmokePurple_Grenade_shell",
	"3Rnd_SmokeBlue_Grenade_shell",
	"3Rnd_SmokeOrange_Grenade_shell",
	
	//Marksmen magazines
	"10Rnd_93x64_DMR_05_Mag",
	"5Rnd_127x108_Mag",
	"5Rnd_127x108_APDS_Mag",
	"20Rnd_762x51_Mag",
	"130Rnd_338_Mag"
];

all_arsenal_items = [
	//misc items
	"itemMap",
	"itemCompass",
	"itemWatch",
	"toolkit",
	"MineDetector",
	
	//mine detector items
	"Revo_mD_battery",
	"Revo_mD_Flag",
	
	//uav terminal
	"B_UavTerminal",
	
	//special uniforms
	"U_B_GhillieSuit",
	"U_B_FullGhillie_sard",
	"U_B_FullGhillie_lsh",
	"U_B_FullGhillie_ard",
	"U_B_Wetsuit",
	"V_RebreatherB",
	
	//pilot helmets
	"H_Cap_headphones",
	"H_PilotHelmetHeli_B",
	"H_PilotHelmetFighter_B",
	
	//pilot uniforms
	"U_B_PilotCoveralls",
	"U_B_HeliPilotCoveralls",
	
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
	"rhsusf_iotv_ocp",
	"rhsusf_iotv_ocp_Grenadier",
	"rhsusf_iotv_ocp_Medic",
	"rhsusf_iotv_ocp_Repair",
	"rhsusf_iotv_ocp_Rifleman",
	"rhsusf_iotv_ocp_SAW",
	//"rhsusf_iotv_ocp_Squadleader",
	"rhsusf_iotv_ocp_teamleader",

	"rhsusf_iotv_ucp",
	"rhsusf_iotv_ucp_Grenadier",
	"rhsusf_iotv_ucp_Medic",
	"rhsusf_iotv_ucp_Repair",
	"rhsusf_iotv_ucp_Rifleman",
	"rhsusf_iotv_ucp_SAW",
	//"rhsusf_iotv_ucp_Squadleader",
	//"rhsusf_iotv_ucp_teamleader",

	//opticgear
	"rhs_googles_black",
	"rhs_googles_clear",
	"rhs_googles_yellow",
	"rhs_googles_orange",

	//headgear
	//"rhsusf_patrolcap_ocp",
	//"rhsusf_patrolcap_ucp",
	
	"rhsusf_ach_helmet_ocp",
	"rhsusf_ach_helmet_ucp",
	"rhsusf_ach_helmet_camo_ocp",
	"rhsusf_ach_helmet_headset_ocp",
	"rhsusf_ach_helmet_headset_ucp",
	
	//"rhsusf_ach_bare",
	//"rhsusf_ach_bare_headset",
	//"rhsusf_ach_bare_tan",
	//"rhsusf_ach_bare_tan_headset",
	//"rhsusf_ach_bare_wood",
	//"rhsusf_ach_bare_wood_headset",
	//"rhsusf_ach_bare_des",
	//"rhsusf_ach_bare_des_headset",
	//"rhsusf_ach_bare_semi",
	//"rhsusf_ach_bare_semi_headset",
	
	//"rhsusf_opscore_01",
	//"rhsusf_opscore_01_tan",
	//"rhsusf_opscore_02",
	//"rhsusf_opscore_02_tan",
	//"rhsusf_opscore_03_ocp",
	//"rhsusf_opscore_04_ocp",
	
	"rhsusf_cvc_helmet",
	"rhsusf_cvc_green_helmet",
	
	"rhs_Booniehat_ocp",
	"rhs_Booniehat_ucp",
	
	//"rhsusf_Bowman",
	//"rhsusf_Bowman_cap",
	
	"H_Beret_Colonel",

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
	"optic_DMS",
	"optic_AMS",
	"optic_AMS_khk",
	"optic_AMS_snd",
	"optic_KHS_blk",
	"optic_KHS_tan",
	"optic_LRPS",
	"bipod_01_F_snd",
	"bipod_01_F_blk",
	"bipod_01_F_mtp",
	
	//FHQ accessories
	"FHQ_optic_ACOG",
	"FHQ_optic_ACOG_tan",
	"FHQ_optic_AIM",
	"FHQ_optic_AIM_tan",
	"FHQ_optic_TWS3050",
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
	"ACE_Clacker",
	"ACE_M26_Clacker",
	"ACE_DefusalKit",
	"ACE_DeadManSwitch",
	"ACE_Cellphone",
	"ACE_EarPlugs",
	"ACE_HuntIR_monitor",
	"ACE_Kestrel4500",
	"ACE_UAVBattery",
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
	
	//ACE flashlights
	"ACE_Flashlight_MX991",
	"ACE_Flashlight_KSF1",
	"ACE_Flashlight_XL50",
	
	//ACE basic medical items
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_bloodIV",
	"ACE_bloodIV_500",
	"ACE_bloodIV_250",
	"ACE_bodyBag",
	"ACE_epinephrine",
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

all_arsena_backpacks = [
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
	
	// UAV
	"B_UAV_01_backpack_F",
	
	// ACE backpacks
	"ACE_TacticalLadder_Pack"
];

//ACE advanced medical items
if(ace_medical_level == 2) then {
	_advancedMedicalItems = [
	"ACE_atropine",
	"ACE_quikclot",
	"ACE_packingBandage",
	"ACE_personalAidKit",
	"ACE_plasmaIV",
	"ACE_plasmaIV_500",
	"ACE_plasmaIV_250",
	"ACE_salineIV",
	"ACE_salineIV_500",
	"ACE_salineIV_250",
	"ACE_surgicalKit",
	"ACE_tourniquet"
	];
	
	all_arsenal_items = all_arsenal_items + _advancedMedicalItems;
};

[missionNamespace, all_arsenal_items,false,false] call BIS_fnc_addVirtualItemCargo;
[missionNamespace, all_arsenal_weapons,false,false] call BIS_fnc_addVirtualWeaponCargo;
[missionNamespace, all_arsena_backpacks,false,false] call BIS_fnc_addVirtualBackpackCargo;
[missionNamespace, all_arsenal_magazines,false,false] call BIS_fnc_addVirtualMagazineCargo;

["Preload"] call BIS_fnc_arsenal;