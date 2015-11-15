// For this entire file: classnames that come from mods you don't have
// will be filtered out and won't cause any issues. You just won't see them ingame.

// Each array below represents one page of the build menu
// Format : [ "classname", manpower, ammo, fuel ]

// Each of these should be unique, the same classnames for different purposes may cause various issues with actions
FOB_typename = "Land_Cargo_HQ_V1_F";
FOB_box_typename = "B_Slingload_01_Cargo_F";
FOB_truck_typename = "B_Truck_01_box_F";
Medical_typename = "Land_Medevac_house_V1_F";
Repair_typename = "Land_Research_house_V1_F";
Build_helper_typename = "Pole_F";
Arsenal_typename = "B_CargoNet_01_ammo_F";
Respawn_truck_typename = "B_Truck_01_medical_F";
huron_typename = "JNS_Skycrane_BLU_Grey";
ammobox_b_typename = "Box_NATO_AmmoVeh_F";
ammobox_o_typename = "Box_East_AmmoVeh_F";
opfor_ammobox_transport = "rhs_gaz66_ammo_vdv";

AmmoFactory_truck_typename = ["B_Truck_01_ammo_F","rhsusf_m113_usarmy_supply"];
AmmoFactory_box_typename = "B_Slingload_01_Ammo_F";
AmmoFactory_device_typename = "Land_Device_disassembled_F";
AmmoFactory_solarBox_typename = "Land_Cargo10_grey_F";
AmmoFactory_solar_typename = "Land_SolarPanel_2_F";
AmmoFactory_generatorBox_typename = "CargoNet_01_box_F";
AmmoFactory_generator_typename = "Land_PowerGenerator_F";

AmmoFactory_allclasses = [AmmoFactory_device_typename,AmmoFactory_solar_typename,AmmoFactory_generator_typename];

pilot_type = ["rhsusf_airforce_pilot"];

infantry_units = [
["rhsusf_army_ucp_rifleman",2,0,0],
["rhsusf_army_ucp_grenadier",3,0,0],
["rhsusf_army_ucp_autorifleman",3,0,0],
["rhsusf_army_ucp_medic",3,0,0],
["rhsusf_army_ucp_marksman",3,0,0],
["rhsusf_army_ucp_engineer",3,0,0],
["rhsusf_army_ucp_rifleman_m590",4,0,0],
["rhsusf_army_ucp_sniper",10,0,0],
["rhsusf_army_ucp_machinegunner",5,0,0],
["rhsusf_army_ucp_aa",5,10,0],
["rhsusf_army_ucp_javelin",5,10,0],
["rhsusf_army_ucp_crewman",1,0,0],
["rhsusf_airforce_pilot",1,0,0]
];

light_vehicles = [
["B_Quadbike_01_F",0,0,1],
["rhsusf_m1025_w",0,0,2],
["rhsusf_m1025_w_m2",0,10,2],
["rhsusf_m1025_w_mk19",0,20,2],
["rhsusf_m998_w_4dr",0,0,2],
["fsf_fnk_norm_ce",0,0,3],
["greuh_fnk_norm_ce",0,0,3],
["fsf_fnk_hmg_ce",0,10,3],
["greuh_fnk_hmg_ce",0,10,3],
["greuh_fnk_hmg_dsrt",0,10,3],
["B_Truck_01_transport_F",0,0,5],
["B_Truck_01_covered_F",0,0,5],
["B_UGV_01_F",0,0,5],
["B_UGV_01_rcws_F",0,60,5],
["B_Boat_Transport_01_F",0,0,2],
["ffaa_ar_supercat",0,45,10],
["ASH_MKVSOC",0,80,10]
];

heavy_vehicles = [
["greuh_pandur_wdld",0,60,10],
["greuh_fv510_wdld",0,50,15],
["greuh_fv510_dsrt",0,50,15],
["rhsusf_m113_usarmy_MK19",0,40,15],
["rhsusf_m113_usarmy_M240",0,50,15],
["RHS_M2A3_BUSKIII_wd",0,85,15],
["rhsusf_m1a1aimwd_usarmy",0,105,20],
["Steve_MBT_Kuma",0,110,25],
["rhsusf_m1a2sep1tuskiwd_usarmy",0,110,25],
["Burnes_FV4034_01",0,250,40],
["rhsusf_m109_usarmy",0,750,30]
];

air_vehicles = [
["B_Heli_Light_01_F",0,0,10],
["B_Heli_Light_01_armed_F",0,30,10],
["greuh_aw159_t",0,0,12],
["greuh_aw159_a",0,50,12],
["RHS_UH60M",0,25,12],
["JNS_Skycrane_Medical_BLU_Grey",0,0,12],
["RHS_CH_47F",0,25,20],
["USAF_CV22",0,0,25],
["greuh_eh101_gr",0,0,25],
["MV22",0,0,25],
["B_Heli_Attack_01_F",0,150,30],
["RHS_AH1Z_wd_GS",0,175,30],
["H_RAH66",0,200,30],
["RHS_AH64D_wd",0,400,50],
["USAF_A10",0,700,50],
["FIR_F16C",0,100,20],
["JS_JC_FA18E",0,650,40],
["JS_JC_FA18F",0,650,40],
["sab_C130_CSP",0,0,30],
["sab_C130_J",0,0,30],
["B_UAV_01_F",0,0,5],
["B_UAV_02_F",0,250,20],
["B_UAV_02_CAS_F",0,250,20],
["usaf_f22",0,500,75],
["USAF_F35A",0,650,75],
["usaf_kc135",5,0,120],
["USAF_E3",75,0,25],
["USAF_C17",0,0,65],
["USAF_C130J",0,0,70],
["USAF_C130J_Cargo",0,0,70]
];

static_vehicles = [
["RHS_M2StaticMG_MiniTripod_WD",0,10,0],
["RHS_M2StaticMG_WD",0,10,0],
["RHS_MK19_TriPod_WD",0,20,0],
["RDS_M252_RHS_OCP",0,35,0],
["RDS_Igla_AA_pod_FIA",0,25,0],
["RDS_TOW_TriPod_RHS_UCP",0,30,0],
["B_SearchLight",0,0,0]
];

buildings = [
["Land_BarGate_F",0,0,0],
["Land_CncBarrierMedium_F",0,0,0],
["Land_CncBarrierMedium4_F",0,0,0],
["Land_CncShelter_F",0,0,0],
["Land_Mil_WiredFence_F",0,0,0],
["Land_Mil_WiredFence_Gate_F",0,0,0],
["Land_CncBarrier_F",0,0,0],
["Land_CncBarrier_stripes_F",0,0,0],
["Land_HBarrier_1_F",0,0,0],
["Land_HBarrier_3_F",0,0,0],
["Land_HBarrier_5_F",0,0,0],
["Land_HBarrierBig_F",0,0,0],
["Land_BagBunker_Large_F",0,0,0],
["Land_BagBunker_Small_F",0,0,0],
["Land_BagFence_Long_F",0,0,0],
["Land_BagFence_Round_F",0,0,0],
["Land_BagFence_Short_F",0,0,0],
["Land_Razorwire_F",0,0,0],
["Land_BagBunker_Tower_F",0,0,0],
["Land_PortableLight_single_F",0,0,0],
["Land_PortableLight_double_F",0,0,0],
["Land_Camping_Light_F",0,0,0],
["Land_MetalCase_01_large_F",0,0,0],
["Land_MetalCase_01_medium_F",0,0,0],
["Land_MetalCase_01_small_F",0,0,0],
["Land_Scaffolding_F",0,0,0],
["CamoNet_BLUFOR_open_F",0,0,0],
["CamoNet_BLUFOR_big_F",0,0,0],
["Land_TentHangar_V1_F",0,0,0],
[Medical_typename,0,0,0],
[Repair_typename,0,0,0],
["Land_Cargo_House_V1_F",0,0,0],
["Land_Cargo_Patrol_V1_F",0,0,0],
["Flag_NATO_F",0,0,0],
["Land_HelipadSquare_F",0,0,0],
["Land_HelipadRescue_F",0,0,0],
["PortableHelipadLight_01_blue_F",0,0,0],
[Build_helper_typename,0,0,0],
["MapBoard_altis_F",0,0,0],
["Land_ChairPlastic_F",0,0,0],
["Land_CampingChair_V1_F",0,0,0],
["Land_CampingChair_V2_F",0,0,0],
["Land_CampingTable_F",0,0,0],
["Land_Campfire_F",0,0,0],
["RoadBarrier_F",0,0,0],
["RoadCone_F",0,0,0],
["RoadCone_L_F",0,0,0],
["ACE_Wheel",0,0,0],
["ACE_Track",0,0,0],
["Land_MetalBarrel_F",0,0,1],
["FlexibleTank_01_forest_F",0,0,1],
["Land_CanisterFuel_F",0,0,0]
];

support_vehicles = [
[Arsenal_typename,10,15,0],
[Respawn_truck_typename,20,0,5],
[FOB_box_typename,30,50,0],
[FOB_truck_typename,30,50,5],
["rhsusf_m113_usarmy_medical",20,0,5],
["C_Offroad_01_repair_F",5,0,2],
["B_Truck_01_Repair_F",10,0,5],
["B_Truck_01_fuel_F",10,0,5],
[AmmoFactory_truck_typename select 0,10,15,5],
[AmmoFactory_truck_typename select 1,10,15,5],
["B_Slingload_01_Repair_F",5,0,0],
["B_Slingload_01_Fuel_F",0,0,5],
["B_Slingload_01_Medevac_F",5,0,0],
[AmmoFactory_box_typename,0,15,0],
["JNS_Skycrane_Pod_Bench_BLU_Green",5,0,0],
[AmmoFactory_solarBox_typename,5,0,15],
[AmmoFactory_generatorBox_typename,5,0,35],
[ammobox_b_typename,0,155,0],
[ammobox_o_typename,0,115,0],
[AmmoFactory_solar_typename,5,0,15],
[AmmoFactory_generator_typename,5,0,35]
];

// Vehicles unlocked by military base control
elite_vehicles = ["B_UGV_01_rcws_F","Steve_MBT_Kuma","B_MBT_01_TUSK_F","Burnes_FV4034_01","B_MBT_01_arty_F","B_MBT_01_mlrs_F","B_Heli_Attack_01_F","RHS_AH1Z_wd_GS","H_RAH66","RHS_AH64D_wd","B_Plane_CAS_01_F","JS_JC_FA18E","JS_JC_FA18F","B_UAV_02_F","B_UAV_02_CAS_F","greuh_pandur_wdld","RHS_M2A3_BUSKIII_wd","usaf_f22","USAF_F35A","usaf_kc135","USAF_C17","USAF_C130J","USAF_C130J_Cargo","USAF_E3"];

// Vehicles and buildings for specific actions and inventories
ammo_vehicles = [ "B_Truck_01_ammo_F","B_Slingload_01_Ammo_F","JNS_Skycrane_Pod_Ammo_BLU_Black","rhsusf_m113_usarmy_supply" ];
fuel_vehicles = [ "B_Truck_01_fuel_F","C_Van_01_fuel_F","B_Slingload_01_Fuel_F" ];
repair_vehicles = [ "C_Offroad_01_repair_F","B_Truck_01_Repair_F" ];
medical_vehicles = [ "B_Truck_01_medical_F","B_Slingload_01_Medevac_F","rhsusf_m113_usarmy_medical","JNS_Skycrane_Medical_BLU_Grey" ];
fuel_cannister = [ "Land_CanisterFuel_F" ];
repair_container = [ "B_Slingload_01_Repair_F" ];

disable_damage = [ "Land_BarGate_F","CamoNet_BLUFOR_open_F","CamoNet_BLUFOR_big_F","RoadBarrier_F","RoadCone_F","RoadCone_L_F" ];
carryable_objects = [ "Land_PortableLight_single_F","Land_PortableLight_double_F","Land_BagFence_Long_F","Land_BagFence_Round_F","Land_BagFence_Short_F","RoadBarrier_F","RoadCone_F","RoadCone_L_F","Land_Camping_Light_F","Land_MetalCase_01_large_F","Land_MetalCase_01_medium_F","Land_MetalCase_01_small_F","MapBoard_altis_F","Land_ChairPlastic_F","Land_CampingChair_V1_F","Land_CampingChair_V2_F","Land_CampingTable_F" ];
draggable_objects = [ "Land_MetalBarrel_F","FlexibleTank_01_forest_F" ];

// Objects that can be lifted
light_objects = [ "RHS_M2StaticMG_MiniTripod_WD","RHS_M2StaticMG_WD","RHS_MK19_TriPod_WD","RDS_M252_RHS_OCP","RDS_TOW_TriPod_RHS_UCP","B_SearchLight","Land_BagBunker_Large_F","Land_BagBunker_Small_F","Land_BagFence_Long_F","Land_BagFence_Round_F","Land_BagFence_Short_F","RoadBarrier_F","RoadCone_F","RoadCone_L_F","Land_Camping_Light_F","Land_PortableLight_single_F","Land_PortableLight_double_F","Flag_NATO_F","Land_ChairPlastic_F","ACE_Wheel ACE_Track","Land_MetalBarrel_F","FlexibleTank_01_forest_F","Land_CanisterFuel_F" ];

// Pre-made squads for the commander build menu
blufor_squad_inf_light = [ "rhsusf_army_ucp_squadleader","rhsusf_army_ucp_grenadier","rhsusf_army_ucp_autorifleman","rhsusf_army_ucp_grenadier","rhsusf_army_ucp_medic","rhsusf_army_ucp_rifleman_m590","rhsusf_army_ucp_rifleman","rhsusf_army_ucp_rifleman"];
blufor_squad_inf = [ "rhsusf_army_ucp_squadleader","rhsusf_army_ucp_autorifleman","rhsusf_army_ucp_machinegunner","rhsusf_army_ucp_medic","rhsusf_army_ucp_grenadier","rhsusf_army_ucp_rifleman_m590","rhsusf_army_ucp_rifleman_m590","rhsusf_army_ucp_marksman","rhsusf_army_ucp_sniper" ];
blufor_squad_at = [ "rhsusf_army_ucp_squadleader","rhsusf_army_ucp_javelin","rhsusf_army_ucp_javelin","rhsusf_army_ucp_javelin","rhsusf_army_ucp_medic","rhsusf_army_ucp_rifleman" ];
blufor_squad_aa = [ "rhsusf_army_ucp_squadleader","rhsusf_army_ucp_aa","rhsusf_army_ucp_aa","rhsusf_army_ucp_aa","rhsusf_army_ucp_medic","rhsusf_army_ucp_rifleman" ];

// [ squad, manpower, ammo, fuel ]
// The game doesn't calculate the actual cost of the squads when they're being bought and instead use the costs below (especially ammo),
// but once they're spawned the cost of each individual unit will be used to calculate caps (especially manpower and fuel)
squads = [
[blufor_squad_inf_light,20,0,0],
[blufor_squad_inf,30,0,0],
[blufor_squad_at,20,25,0],
[blufor_squad_aa,20,25,0]
];

// All the UAVs you'll use must be declared here for technical purposes, otherwise there will be buggy issues
uavs = [ "B_UAV_01_F","B_UAV_02_F","B_UAV_02_CAS_F","B_UGV_01_F","B_UGV_01_rcws_F" ];

// Guerillas. It's only classnames the game will pick from, not the actual squad that will spawn, unlike the CSAT pre-made squads below
militia_squad = [ "B_G_Soldier_SL_F","B_G_Soldier_A_F","B_G_Soldier_AR_F","B_G_medic_F","B_G_engineer_F","B_G_Soldier_exp_F","B_G_Soldier_GL_F","B_G_Soldier_M_F","B_G_Soldier_F","B_G_Soldier_LAT_F","B_G_Soldier_lite_F","b_g_soldier_unarmed_f","B_G_Sharpshooter_F","b_g_survivor_F","B_G_Soldier_TL_F"];
// Same principle, only an array with everything for the game to randomly choose into
militia_vehicles = [ "rhs_btr70_chdkz","rhs_zsu234_chdkz","I_MU_mercs_Offroad_01_armed_F","I_MU_mercs_Offroad_01_armed_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F","LOP_AFR_BTR60","LOP_AFR_M113_W","LOP_AFR_T72BA","I_MU_mercs_Offroad_01_armed_F"];

// All the CSAT pre-made squads
opfor_squad_low_intensity = ["rhs_vdv_mflora_sergeant","rhs_vdv_mflora_grenadier","rhs_vdv_mflora_medic","rhs_vdv_mflora_LAT","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_rifleman"];
opfor_squad_8_standard = ["rhs_vdv_mflora_junior_sergeant","rhs_vdv_mflora_sergeant","rhs_vdv_mflora_grenadier","rhs_vdv_mflora_machinegunner","rhs_vdv_mflora_medic","rhs_vdv_mflora_marksman","rhs_vdv_mflora_grenadier","rhs_vdv_mflora_LAT"];
opfor_squad_8_infkillers = ["rhs_vdv_mflora_junior_sergeant","rhs_vdv_mflora_grenadier","rhs_vdv_mflora_grenadier","rhs_vdv_mflora_machinegunner","rhs_vdv_mflora_medic","rhs_vdv_mflora_marksman","rhs_vdv_mflora_marksman","O_sniper_F"];
opfor_squad_8_tankkillers = ["rhs_vdv_mflora_junior_sergeant","rhs_vdv_mflora_medic","rhs_vdv_mflora_machinegunner","rhs_vdv_mflora_LAT","rhs_vdv_mflora_at","rhs_vdv_mflora_at","rhs_vdv_mflora_at"];
opfor_squad_8_airkillers = ["rhs_vdv_mflora_junior_sergeant","rhs_vdv_mflora_medic","rhs_vdv_mflora_machinegunner","rhs_vdv_mflora_LAT","rhs_vdv_mflora_LAT","rhs_vdv_mflora_aa","rhs_vdv_mflora_aa","rhs_vdv_mflora_aa"];

// Single units that will be used for secondary objectives and cargo posts garrisons
opfor_sentry = "rhs_vdv_mflora_rifleman";
opfor_lookout_1 = "rhs_vdv_mflora_marksman";
opfor_lookout_2 = "rhs_vdv_mflora_machinegunner";

// All the vehicles that can spawn as sector defenders and patrols, the game will pick randomly
opfor_vehicles = ["rhs_bmp1_msv","rhs_bmp3m_msv","rhs_bmp2k_msv","rhs_prp3_msv","rhs_tigr_ffv_vdv","rhs_tigr_3camo_msv","rhs_uaz_open_vdv","rhs_tigr_vdv"];
// Same, with lighter choices to be used  when the alert level is low
opfor_vehicles_low_intensity = ["rhs_btr60_msv","rhs_tigr_ffv_vdv","rhs_btr70_msv","rhs_tigr_vdv"];

// All the vehicles that can spawn as battlegroup members, again the game will pick randomly
opfor_battlegroup_vehicles = ["rhs_sprut_vdv","rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","RHS_Mi24V_FAB_vdv","RHS_Mi8AMT_vdv","RHS_Mi8mt_vdv","rhs_zsu234_aa","rhs_bmp1_vdv","rhs_bmp2_vdv","rhs_bmd4m_vdv"];
opfor_battlegroup_vehicles_low_intensity = ["rhs_btr70_msv","rhs_gaz66_vdv","RHS_Mi8mt_vdv"];
// All the vehicles that can spawn as battlegroup members (see above) and hold 8 soldiers as passengers.
// If something can't hold all 8 soldiers then buggy behaviours may occur 
opfor_troup_transports = ["rhs_btr70_msv","rhs_gaz66_vdv","RHS_Mi8mt_vdv","rhs_gaz66o_vdv"];
// Battlegroup members that will need to spawn in flight. Should be only helos but, who knows
opfor_choppers = ["RHS_Mi24V_FAB_vdv","RHS_Mi8AMT_vdv","RHS_Mi8mt_vdv"];

// Opfor attack aircrafts to choose from
opfor_air = ["RHS_Su25SM_vvs"];

// Civilians to randomly choose from
civilians = ["C_man_1","C_man_polo_6_F","C_man_polo_3_F","C_man_polo_2_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_1_F","C_man_p_beggar_F","C_man_1_2_F","C_man_p_fugitive_F","C_man_hunter_1_F","C_journalist_F","C_man_shorts_2_F","C_man_w_worker_F"];
civilian_vehicles = [ "C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Offroad_01_F","C_SUV_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Van_01_fuel_F" ];


// !!
// Do not edit below this point!!
// Only boring technical stuff
// !!

infantry_units = [ infantry_units ] call F_filterMods;
light_vehicles = [ light_vehicles ] call F_filterMods;
heavy_vehicles = [ heavy_vehicles ] call F_filterMods;
air_vehicles = [ air_vehicles ] call F_filterMods;
support_vehicles = [ support_vehicles ] call F_filterMods;
static_vehicles = [ static_vehicles ] call F_filterMods;
buildings = [ buildings ] call F_filterMods;
build_lists = [[],infantry_units,light_vehicles,heavy_vehicles,air_vehicles,static_vehicles,buildings,support_vehicles,squads];

militia_squad = [ militia_squad , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
militia_vehicles = [ militia_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_squad_low_intensity = [ opfor_squad_low_intensity , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_squad_8_standard = [ opfor_squad_8_standard , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_squad_8_infkillers = [ opfor_squad_8_infkillers , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_squad_8_tankkillers = [ opfor_squad_8_tankkillers , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_squad_8_airkillers = [ opfor_squad_8_airkillers , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_vehicles = [ opfor_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_vehicles_low_intensity = [ opfor_vehicles_low_intensity , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles = [ opfor_battlegroup_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles_low_intensity = [ opfor_battlegroup_vehicles_low_intensity , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_troup_transports = [ opfor_troup_transports , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_choppers = [ opfor_choppers , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_air = [ opfor_air , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
civilians = [ civilians , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
civilian_vehicles = [ civilian_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;

military_alphabet = ["Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu", "Alpha-2", "Bravo-2", "Charlie-2", "Delta-2", "Echo-2", "Foxtrot-2", "Golf-2","Hotel-2","India-2","Juliet-2","Kilo-2","Lima-2","Mike-2","November-2","Oscar-2","Papa-2","Quebec-2","Romeo-2","Sierra-2","Tango-2","Uniform-2","Victor-2","Whiskey-2","X-Ray-2","Yankee-2","Zulu-2","You should really reconsider a few life choices if you build more than 52 FOBs."];
land_vehicles_classnames = (opfor_vehicles + militia_vehicles);
all_ofpor_troops = opfor_squad_low_intensity + opfor_squad_8_standard + opfor_squad_8_infkillers + opfor_squad_8_tankkillers + opfor_squad_8_airkillers + [opfor_sentry, opfor_lookout_1, opfor_lookout_2 ];
all_resistance_troops = militia_squad;
all_hostile_classnames = (land_vehicles_classnames + opfor_air + opfor_choppers + opfor_troup_transports + opfor_vehicles_low_intensity);
{ land_vehicles_classnames pushback (_x select 0); } foreach (heavy_vehicles + light_vehicles);
air_vehicles_classnames = opfor_choppers;
{ air_vehicles_classnames pushback (_x select 0); } foreach air_vehicles;
markers_reset = [99999,99999,0];
squads_names = [ localize "STR_LIGHT_RIFLE_SQUAD", localize "STR_RIFLE_SQUAD", localize "STR_AT_SQUAD", localize "STR_AA_SQUAD" ];
boats_names = [ "B_Boat_Transport_01_F","ffaa_ar_lcm","ffaa_ar_supercat" ];

box_transport_config = [
	[ "B_Truck_01_transport_F", -6.5, [0,	-0.4,	0.4], [0,	-2.1,	0.4], [0,	-3.8,	0.4] ],
	[ "B_Truck_01_box_F", -6.5, [0,	-0.4,	0.4], [0,	-2.1,	0.4], [0,	-3.8,	0.4] ],
	[ "B_Truck_01_covered_F", -6.5, [0,	-0.4,	0.4], [0,	-2.1,	0.4], [0,	-3.8,	0.4] ],
	[ "RHS_CH_47F", -7.5, [0,	2.2,	-1], [0,	0.8,	-1], [0,	-1.0, -1] ],
	[ "greuh_eh101_gr", -6.5, [0,	4.2,	-1.45], [0,	2.5,	-1.45], [0,	0.8, -1.45], [0,	-0.9, -1.45] ]
];

ammobox_transports_typenames = [];
{ ammobox_transports_typenames pushback (_x select 0) } foreach box_transport_config;
ammobox_transports_typenames = [ ammobox_transports_typenames , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;

elite_vehicles = [ elite_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;