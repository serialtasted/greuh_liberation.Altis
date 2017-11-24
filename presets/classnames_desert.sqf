// This file allows you to add content to the mission without conflict issues after each update of the original classnames.sqf
// If you want more modifications to be supported by this file, let's discuss it on the forums.



// *** SUPPORT STUFF ***

// Setting a value here will overwrite the original value found from the mission. Do that if you're doing a total conversion.
// Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not. Just don't try.
FOB_typename = "Land_Cargo_HQ_V4_F";							// Default "Land_Cargo_HQ_V1_F";
FOB_box_typename = "B_Slingload_01_Cargo_F";					// Default "B_Slingload_01_Cargo_F";
FOB_truck_typename = "tf47_desert_hemtt_nato_box";				// Default "B_Truck_01_box_F";
Medical_typename = "Land_Medevac_house_V1_F";					// Default "Land_Medevac_house_V1_F"
Repair_typename = "Land_Research_house_V1_F";					// Default "Land_Research_house_V1_F"
Barracks_typename = "Land_Cargo_House_V3_F";					// Default "Land_Cargo_House_V4_F"
Build_helper_typename = "Pole_F";								// Default "Pole_F"
Arsenal_typename = "B_supplyCrate_F";							// Default "B_supplyCrate_F";
Respawn_truck_typename = "tf47_desert_hemtt_nato_med";			// Default "B_Truck_01_medical_F";
huron_typename = "ffaa_famet_cougar_olive";						// Default "B_Heli_Transport_03_unarmed_F";
little_bird_typename = "RHS_MELB_MH6M";							// Default "B_Heli_Light_01_F;
ammobox_b_typename = "Box_NATO_AmmoVeh_F";						// Default "Box_NATO_AmmoVeh_F";
ammobox_o_typename = "Box_East_AmmoVeh_F";						// Default "Box_East_AmmoVeh_F";
opfor_ammobox_transport = "O_Truck_03_transport_F";				// Default "O_Truck_03_transport_F";    // Make sure this thing can transport ammo boxes (see box_transport_config down below) otherwise things will break
commander_classname = "B_officer_F";							// Default "B_officer_F"


// Ambient Units
BLU_AirVehHeli = ["RHS_AH64D_AA", "RHS_AH64D"];
BLU_AirVehPlane = ["JS_JC_FA18E"];
BLU_LandVeh = ["ffaa_et_vamtac_m2"];
BLU_WaterVeh = [];

OPF_AirVehHeli = ["RHS_Ka_52_vvsc", "rhs_mi28n_vvsc"];
OPF_AirVehPlane = ["RHS_Su25SM_vvs"];
OPF_LandVeh = ["rhs_tigr_sts_vdv","rhs_tigr_m_vdv"];
OPF_WaterVeh = [];

IND_AirVehHeli = [];
IND_AirVehPlane = [];
IND_LandVeh = [];
IND_WaterVeh = [];

// Paradrop Vehicles
BLU_ParaHeli = "RHS_CH_47F";
OPF_ParaHeli = "rhsgref_ins_Mi8amt";
IND_ParaHeli = "I_Heli_Transport_02_F";


// *** FRIENDLIES ***

// All BLUFOR infantry. Defining a value here will replace the default value from the original mission.
blufor_squad_leader = "pmf_des_Soldier_SL_F";
blufor_rifleman = "pmf_des_soldier_F";
blufor_grenadier = "pmf_des_Soldier_GL_F";
blufor_machinegunner = "pmf_des_soldier_AR_F";
blufor_medic = "pmf_des_medic_F";
blufor_engineer = "pmf_des_soldier_repair_F";
blufor_marksman = "pmf_des_soldier_M_F";
blufor_sniper = "pmf_des_soldier_sniper_F";
blufor_explosives = "pmf_des_soldier_exp_F";
blufor_aa = "pmf_des_soldier_AA_F";
blufor_at = "pmf_des_soldier_LAT_F";
blufor_crewman = "rhsusf_usmc_marpat_d_crewman";
blufor_pilot = "rhsusf_usmc_marpat_d_pilot";


// Each array below represents one page of the build menu
// Format : [ "classname", manpower, ammo, fuel ]
// Example : [ "B_APC_Tracked_01_AA_F", 0, 40, 15 ],

// If overwrite is set to true, then the extension list will entirely replace the original list defined in classnames.sqf. Otherwise it will be appended to it.
// Useful for total conversions to RHS and such, without having to alter the original file.
infantry_units = [
	[blufor_squad_leader,3,0,0],
	[blufor_rifleman,3,0,0],
	[blufor_grenadier,4,0,0],
	[blufor_machinegunner,3,0,0],
	[blufor_medic,3,0,0],
	[blufor_engineer,3,0,0],
	[blufor_marksman,6,0,0],
	[blufor_sniper,10,0,0],
	[blufor_explosives,5,0,0],
	[blufor_aa,5,10,0],
	[blufor_at,5,10,0],
	[blufor_crewman,1,0,0],
	[blufor_pilot,1,0,0]
];

light_vehicles = [
	["B_Quadbike_01_F",1,0,1],
	["B_LSV_01_unarmed_F",2,0,2],
	["rhsusf_m1025_d",2,0,2],
	["rhsusf_m1025_d_m2",2,10,2],
	["rhsusf_m1025_d_mk19",2,20,2],
	["tf47_desert_hunter_nato",3,0,5],
	["tf47_desert_nato_hmg",3,25,5],
	["C_Van_02_vehicle_F",2,0,6],
	["C_Van_02_transport_F",2,0,6],
	["tf47_desert_hemtt_nato_transport",3,0,6],
	["tf47_desert_hemtt_nato_transport_covered",3,0,6],
	["ffaa_et_m250_recuperacion_blin",3,0,6],
	["B_UGV_01_F",3,0,6],
	["B_UGV_01_rcws_F",3,60,6],
	["B_Boat_Transport_01_F",2,0,2],
	["ffaa_ar_zodiac_hurricane",3,0,6],
	["ffaa_ar_lcm",3,0,8],
	["Burnes_LCAC_1",3,0,12],
	["B_SDV_01_F",2,5,15]
];

heavy_vehicles = [
	["rhsusf_m113d_usarmy",3,50,15],
	["rhsusf_m113d_usarmy_M240",3,50,15],
	["RHS_M2A2",4,85,15],
	["RHS_M2A2_BUSKI",4,95,15],
	["RHS_M2A3",4,100,15],
	["RHS_M2A3_BUSKI",4,110,15],
	["RHS_M2A3_BUSKIII",4,120,15],
	["ffaa_et_m250_sistema_nasams_blin",3,115,10],
	["ffaa_et_m250_estacion_nasams_blin",3,0,20],
	["rhsusf_m1a1aimd_usarmy",4,105,20],
	["rhsusf_m1a2sep1tuskid_usarmy",4,120,25],
	["rhsusf_m109d_usarmy",4,750,30],
	["rhsusf_mkvsoc",3,55,30]
];

air_vehicles = [
	["RHS_MELB_MH6M",2,0,10],
	["RHS_MELB_AH6M_L",2,30,10],
	["RHS_UH60M",2,25,12],
	["RHS_CH_47F",3,25,20],
	["B_Heli_Attack_01_F",3,200,30],
	["RHS_AH64D",3,400,50],
	["RHS_AH64D_GS",3,400,50],
	["RHS_AH64D_AA",3,400,50],
	["RHS_A10",4,700,85],
	["FIR_F16C",4,650,75],
	["FIR_F16D",4,650,75],
	["JS_JC_FA18E",4,800,75],
	["JS_JC_FA18F",4,800,75],
	["B_Plane_Fighter_01_Stealth_F",4,900,90],
	["ffaa_et_searcherIII",1,50,35],
	["ffaa_reaper_gbu",2,160,35],
	["ffaa_reaper_maverick",2,160,35],
	["B_UAV_05_F",2,240,45],
	["ffaa_ea_hercules",3,0,90],
	["ffaa_ea_hercules_cargo",3,0,90],
	["B_T_VTOL_01_INFANTRY_F",4,0,120],
	["B_T_VTOL_01_VEHICLE_F",4,0,120],
	["B_T_VTOL_01_ARMED_F",4,800,120]
];

static_vehicles = [
	["RHS_M2StaticMG_MiniTripod_WD",2,10,0],
	["RHS_M2StaticMG_WD",2,10,0],
	["RHS_MK19_TriPod_WD",2,20,0],
	["RHS_M119_WD",2,50,0],
	["RHS_M252_WD",2,35,0],
	["RHS_Stinger_AA_pod_WD",2,25,0],
	["RHS_TOW_TriPod_WD",2,30,0],
	["B_SearchLight",1,0,0]
];

buildings = [
	["Land_BarGate_F",0,0,0],
	["Land_RampConcrete_F",0,0,0],
	["BlockConcrete_F",0,0,0],
	["Dirthump_2_F",0,0,0],
	["Dirthump_3_F",0,0,0],
	["Dirthump_4_F",0,0,0],
	["Dirthump_1_F",0,0,0],
	
	["Land_CncBarrierMedium_F",0,0,0],
	["Land_CncBarrierMedium4_F",0,0,0],
	
	["Land_Shoot_House_Wall_F",0,0,0],
	["Land_Shoot_House_Wall_Crouch_F",0,0,0],
	["Land_Shoot_House_Wall_Prone_F",0,0,0],
	["Land_Shoot_House_Wall_Long_F",0,0,0],
	["Land_Shoot_House_Wall_Long_Crouch_F",0,0,0],
	["Land_Shoot_House_Wall_Long_Prone_F",0,0,0],
	["Land_Shoot_House_Panels_Window_F",0,0,0],
	["Land_Shoot_House_Corner_F",0,0,0],
	["Land_Shoot_House_Corner_Crouch_F",0,0,0],
	["Land_Shoot_House_Corner_Prone_F",0,0,0],
	["Land_Shoot_House_Tunnel_F",0,0,0],
	["Land_Shoot_House_Tunnel_Crouch_F",0,0,0],
	["Land_Shoot_House_Tunnel_Prone_F",0,0,0],
	
	["Land_CncShelter_F",0,0,0],
	["Land_CncWall4_F",0,0,0],
	["Land_CncWall1_F",0,0,0],
	
	["Land_PierLadder_F",0,0,0],
	
	["Land_Concrete_SmallWall_4m_F",0,0,0],
	["Land_Concrete_SmallWall_8m_F",0,0,0],
	["Land_Mil_ConcreteWall_F",0,0,0],
	
	["Land_Crash_barrier_F",0,0,0],
	["Land_CncBarrier_F",0,0,0],
	["Land_CncBarrier_stripes_F",0,0,0],
	
	["Land_PlasticBarrier_03_F",0,0,0],
	["Land_PlasticBarrier_02_F",0,0,0],
	["Land_PlasticBarrier_02_grey_F",0,0,0],
	
	["RoadBarrier_F",0,0,0],
	["RoadBarrier_small_F",0,0,0],
	["RoadCone_F",0,0,0],
	["RoadCone_L_F",0,0,0],
	
	["Land_HBarrier_1_F",0,0,0],
	["Land_HBarrier_3_F",0,0,0],
	["Land_HBarrier_5_F",0,0,0],
	["Land_HBarrier_Big_F",0,0,0],
	
	["Land_BagBunker_01_large_F",0,0,0],
	["Land_BagBunker_01_small_F",0,0,0],
	["Land_BagFence_01_long_F",0,0,0],
	["Land_BagFence_01_round_F",0,0,0],
	["Land_BagFence_01_short_F",0,0,0],
	["Land_Razorwire_F",0,0,0],
	["Land_BagBunker_tower_F",0,0,0],
	
	["Land_PortableLight_single_F",0,0,0],
	["Land_PortableLight_double_F",0,0,0],
	["Land_Camping_Light_F",0,0,0],
	
	["Land_PaperBox_open_full_F",0,0,0],
	["Land_PaperBox_closed_F",0,0,0],
	["Land_Pallet_MilBoxes_F",0,0,0],
	
	["Land_Scaffolding_F",0,0,0],
	["CamoNet_opfor_F",0,0,0],
	["CamoNet_opfor_open_F",0,0,0],
	["CamoNet_opfor_big_F",0,0,0],
	
	[Medical_typename,0,0,0],
	[Repair_typename,0,0,0],
	[Barracks_typename,0,0,0],
	["Land_Cargo_Patrol_V3_F",0,0,0],
	
	["Flag_NATO_F",0,0,0],
	["Flag_US_F",0,0,0],
	["Flag_Red_F",0,0,0],
	["Flag_Green_F",0,0,0],
	
	["Land_TentHangar_V1_F",0,0,0],
	["Land_HelipadSquare_F",0,0,0],
	["Land_HelipadRescue_F",0,0,0],
	["PortableHelipadLight_01_blue_F",0,0,0],
	["PortableHelipadLight_01_red_F",0,0,0],
	["PortableHelipadLight_01_green_F",0,0,0],
	["PortableHelipadLight_01_yellow_F",0,0,0],
	
	[Build_helper_typename,0,0,0],
	
	["Land_MapBoard_F",0,0,0],
	["Land_ChairPlastic_F",0,0,0],
	["Land_CampingChair_V1_F",0,0,0],
	["Land_CampingChair_V2_F",0,0,0],
	["Land_CampingTable_F",0,0,0],
	["Land_CampingTable_small_F",0,0,0],
	["Land_Campfire_F",0,0,0],
	
	["Land_Obstacle_Bridge_F",0,0,0],
	["Land_Obstacle_Climb_F",0,0,0],
	["Land_Obstacle_Crawl_F",0,0,0],
	["Land_Obstacle_Cross_F",0,0,0],
	["Land_Obstacle_Pass_F",0,0,0],
	["Land_Obstacle_Ramp_F",0,0,0],
	["Land_Obstacle_RunAround_F",0,0,0],
	
	["TargetP_Inf_F",0,0,0],
	["TargetP_Inf_Acc1_F",0,0,0],
	["TargetP_Inf_Acc2_F",0,0,0],
	
	["Land_SignM_WarningMilAreaSmall_english_F",0,0,0],
	["Land_SignM_WarningMilitaryArea_english_F",0,0,0],
	["Land_Sign_MinesTall_English_F",0,0,0],
	["Land_Sign_MinesDanger_English_F",0,0,0],
	["Land_SignM_WarningMilitaryVehicles_english_F",0,0,0],
	["ArrowDesk_L_F",0,0,0],
	["ArrowDesk_R_F",0,0,0],
	
	["Land_MetalCase_01_large_F",0,0,0],
	["Land_MetalCase_01_medium_F",0,0,0],
	["Land_MetalCase_01_small_F",0,0,0]
];

support_vehicles = [
	[Arsenal_typename,10,15,0],
	["C_Van_02_medevac_F",10,0,25],
	["tf47_desert_hemtt_nato_med",10,0,25],
	["rhsusf_m113d_usarmy_medical",15,0,25],
	[FOB_box_typename,30,50,0],
	[FOB_truck_typename,30,50,5],
	["B_G_Offroad_01_repair_F",5,0,2],
	["C_Van_02_service_F",10,0,2],
	["tf47_desert_hemtt_nato_rep",10,0,5],
	["tf47_desert_hemtt_nato_fuel",10,0,5],
	["TF47_Desert_HEMTT_NATO_AMMO",10,25,5],
	["B_Slingload_01_Ammo_F",5,25,0],
	["B_Slingload_01_Repair_F",5,0,0],
	["B_Slingload_01_Fuel_F",5,0,5],
	
	[ammobox_b_typename,0,180,0],
	[ammobox_o_typename,0,180,0]
];

// *** BADDIES ***

// All OPFOR infantry. Defining a value here will replace the default value from the original mission.
opfor_sentry = "LOP_Ists_Opf_Infantry_Rifleman";
opfor_rifleman = "LOP_Ists_Opf_Infantry_Rifleman";
opfor_grenadier = "LOP_Ists_Opf_Infantry_GL";
opfor_squad_leader = "LOP_Ists_Opf_Infantry_SL";
opfor_team_leader = "LOP_Ists_Opf_Infantry_SL";
opfor_marksman = "LOP_Ists_Opf_Infantry_Marksman";
opfor_machinegunner = "LOP_Ists_Opf_Infantry_AR";
opfor_heavygunner = "LOP_Ists_Opf_Infantry_AR";
opfor_medic = "LOP_Ists_Opf_Infantry_Corpsman";
opfor_rpg = "LOP_Ists_Opf_Infantry_AT";
opfor_at = "LOP_Ists_Opf_Infantry_AT";
opfor_aa = "LOP_Ists_Opf_Infantry_AT";
opfor_officer = "LOP_Ists_Opf_Infantry_Rifleman_3";
opfor_sharpshooter = "LOP_Ists_Opf_Infantry_Rifleman_2";
opfor_sniper = "LOP_Ists_Opf_Infantry_Marksman";
opfor_engineer = "LOP_Ists_Opf_Infantry_Engineer";
opfor_paratrooper = "LOP_Ists_Opf_Infantry_Rifleman";

// OPFOR Vehicles to be used in secondary objectives
opfor_mrap = "rhsgref_BRDM2UM_ins_g";
opfor_mrap_armed = "rhsgref_BRDM2_HQ_ins_g";
opfor_transport_helo = "I_C_Heli_Light_01_civil_F";
opfor_transport_truck = "rhsgref_ins_g_gaz66";
opfor_fuel_truck = "rhsgref_cdf_ural_fuel";
opfor_ammo_truck = "rhsgref_cdf_gaz66_ammo";
opfor_fuel_container = nil;
opfor_ammo_container = nil;
opfor_flag = "Flag_Syndikat_F";

// Militia vehicles to choose from
militia_vehicles = [
	"rhsgref_nat_uaz_dshkm",
	"rhsgref_nat_uaz_ags",
	"rhsgref_ins_g_bmd1",
	"rhsgref_BRDM2_ins_g"
];

// All the vehicles that can spawn as sector defenders and patrols
opfor_vehicles = [
	"rhsgref_ins_g_btr70",
	"rhsgref_ins_g_zsu234",
	"rhsgref_ins_g_t72bc",
	"rhsgref_ins_g_bmd1",
	"rhsgref_BRDM2_HQ_ins_g"
];

// Same with lighter choices to be used  when the alert level is low
opfor_vehicles_low_intensity = [
	"rhsgref_ins_g_uaz_dshkm_chdkz",
	"rhsgref_ins_g_gaz66_zu23",
	"rhsgref_ins_g_uaz_ags",
	"rhsgref_ins_g_uaz_spg9",
	"rhsgref_BRDM2_ins_g"
];

opfor_vehicles = opfor_vehicles + opfor_vehicles_low_intensity;

// All the vehicles that can spawn as battlegroup members
opfor_battlegroup_vehicles = [
	"rhsgref_ins_g_bmp2d",
	"rhsgref_ins_g_t72bc",
	"rhsgref_ins_g_bmd1",
	"rhsgref_ins_g_BM21",
	"RHS_Ka_52_vvsc",
	"rhs_mi28n_vvsc"
];

// Same with lighter choices to be used  when the alert level is low
opfor_battlegroup_vehicles_low_intensity = [
	"rhsgref_BRDM2_HQ_ins_g",
	"rhsgref_ins_g_uaz_spg9",
	"rhsgref_ins_g_uaz_dshkm_chdkz",
	"rhsgref_ins_g_gaz66",
	"rhsgref_ins_g_gaz66o",
	"rhsgref_ins_g_ural_open",
	"rhsgref_BRDM2_ins_g"
];

opfor_battlegroup_vehicles = opfor_battlegroup_vehicles + opfor_battlegroup_vehicles_low_intensity;

// All the vehicles that can spawn as battlegroup members (see above) and also hold 8 soldiers as passengers.
// If something in here can't hold all 8 soldiers then buggy behaviours may occur
opfor_troup_transports = [
	"rhsgref_ins_g_gaz66",
	"rhsgref_ins_g_gaz66o",
	"rhsgref_ins_g_ural_open"
];

// Battlegroup members that will need to spawn in flight. Should be only helos but, who knows
opfor_choppers = [
	"RHS_Ka_52_vvsc",
	"rhs_mi28n_vvsc"
];

// Opfor military aircrafts
opfor_air = [
	"rhs_l39_cdf",
	"rhsgref_cdf_su25",
	"rhs_l159_CDF_CAS"
];







// Other stuff

// Civilians
civilians = [
	"LOP_Tak_Civ_Man_06",
	"LOP_Tak_Civ_Man_08",
	"LOP_Tak_Civ_Man_07",
	"LOP_Tak_Civ_Man_05",
	"LOP_Tak_Civ_Man_01",
	"LOP_Tak_Civ_Man_10",
	"LOP_Tak_Civ_Man_02",
	"LOP_Tak_Civ_Man_09",
	"LOP_Tak_Civ_Man_11",
	"LOP_Tak_Civ_Man_12",
	"LOP_Tak_Civ_Man_04",
	"LOP_Tak_Civ_Man_14",
	"LOP_Tak_Civ_Man_13",
	"LOP_Tak_Civ_Man_16",
	"LOP_Tak_Civ_Man_15"
];

// Civilian vehicles
civilian_vehicles = [
	"C_Van_02_vehicle_F",
	"C_Van_02_transport_F",
	"LOP_Tak_Civ_Landrover",
	"LOP_Tak_Civ_Offroad",
	"LOP_Tak_Civ_UAZ",
	"LOP_Tak_Civ_UAZ_open",
	"LOP_Tak_Civ_Ural",
	"LOP_Tak_Civ_Ural_open"
];

// Elite vehicles that should be unlocked through military base capture.
elite_vehicles = [
	"B_Plane_Fighter_01_Stealth_F",
	"ffaa_reaper_gbu",
	"ffaa_reaper_maverick",
	"B_UAV_05_F",
	"B_UGV_01_rcws_F",
	"B_T_VTOL_01_ARMED_F",
	"RHS_A10",
	"RHS_M2A2",
	"RHS_M2A2_BUSKI",
	"CUP_B_M1A2_TUSK_MG_US_Army",
	"RHS_AH64D",
	"RHS_AH64D_GS",
	"RHS_AH64D_AA"
];