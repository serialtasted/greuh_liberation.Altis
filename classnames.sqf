// For this entire file: classnames that come from mods you don't have
// will be filtered out and won't cause any issues. You just won't see them ingame.

// Each array below represents one page of the build menu
// Format : [ "classname", manpower, ammo, fuel ]

if ( isNil "elite_vehicles_extension" ) then { elite_vehicles_extension = []; };
if ( isNil "infantry_units_extension" ) then { infantry_units_extension = []; };
if ( isNil "light_vehicles_extension" ) then { light_vehicles_extension = []; };
if ( isNil "heavy_vehicles_extension" ) then { heavy_vehicles_extension = []; };
if ( isNil "air_vehicles_extension" ) then { air_vehicles_extension = []; };
if ( isNil "static_vehicles_extension" ) then { static_vehicles_extension = []; };
if ( isNil "buildings_extension" ) then { buildings_extension = []; };
if ( isNil "support_vehicles_extension" ) then { support_vehicles_extension = []; }; 

// Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not. Just don't try.
if ( isNil "FOB_typename" ) then { FOB_typename = "Land_Cargo_HQ_V1_F"; };
if ( isNil "FOB_box_typename" ) then { FOB_box_typename = "B_Slingload_01_Cargo_F"; };
if ( isNil "FOB_truck_typename" ) then { FOB_truck_typename = "B_Truck_01_box_F"; };
if ( isNil "Build_truck_typename" ) then { Build_truck_typename = "B_Truck_01_box_F"; };
if ( isNil "Medical_typename" ) then { Medical_typename = "Land_Medevac_house_V1_F"; };
if ( isNil "Repair_typename" ) then { Repair_typename = "Land_Research_house_V1_F"; };
if ( isNil "Build_helper_typename" ) then { Build_helper_typename = "Pole_F"; };
if ( isNil "Arsenal_typename" ) then { Arsenal_typename = "B_supplyCrate_F"; };
if ( isNil "Respawn_truck_typename" ) then { Respawn_truck_typename = "B_Truck_01_medical_F"; };
if ( isNil "huron_typename" ) then { huron_typename = "JNS_Skycrane_BLU_Grey"; };
if ( isNil "ammobox_b_typename" ) then { ammobox_b_typename = "Box_NATO_AmmoVeh_F"; };
if ( isNil "ammobox_o_typename" ) then { ammobox_o_typename = "Box_East_AmmoVeh_F"; };
if ( isNil "opfor_ammobox_transport" ) then { opfor_ammobox_transport = "O_Truck_03_transport_F"; };
if ( isNil "pilot_classname" ) then { pilot_classname = "B_Helipilot_F" };

AmmoFactory_truck_typename = ["B_Truck_01_ammo_F","rhsusf_m113_usarmy_supply"];
AmmoFactory_box_typename = ["B_Slingload_01_Ammo_F"/*,"JNS_Skycrane_Pod_Ammo_BLU_Green"*/];
AmmoFactory_device_typename = "Land_Device_disassembled_F";
AmmoFactory_solarBox_typename = "Land_Cargo10_grey_F";
AmmoFactory_solar_typename = "Land_SolarPanel_2_F";
AmmoFactory_generatorBox_typename = "CargoNet_01_box_F";
AmmoFactory_generator_typename = "Land_PowerGenerator_F";

GRLIB_intel_table = "Land_CampingTable_small_F";
GRLIB_intel_chair = "Land_CampingChair_V2_F";
GRLIB_intel_file = "Land_File1_F";
GRLIB_intel_laptop = "Land_Laptop_device_F";

GRLIB_sar_wreck = "Land_Wreck_Heli_Attack_01_F";
GRLIB_sar_fire = "test_EmptyObjectForFireBig";

GRLIB_ignore_colisions_when_building = [
	"Land_Flush_Light_Red_F",
	"Land_Flush_Light_green_F",
	"Land_Flush_Light_yellow_F",
	"land_runway_edgelight",
	"land_runway_edgelight_blue_f",
	"Land_HelipadSquare_F",
	"Land_HelipadRescue_F",
	"Sign_Sphere100cm_F",
	"TMR_Autorest_Georef",
	"Land_ClutterCutter_large_F",
	"PortableHelipadLight_01_blue_F",
	"PortableHelipadLight_01_red_F",
	"PortableHelipadLight_01_green_F",
	"PortableHelipadLight_01_yellow_F",
	"Land_Camping_Light_F",
	"RoadCone_F",
	"RoadCone_L_F",
	"Land_Cargo_Patrol_V2_F",
	"Land_Cargo_Patrol_V3_F",
	"Land_Cargo_Tower_V2_F",
	"Land_Cargo_Tower_V3_F",
	"Land_Cargo_HQ_V2_F",
	"Land_Cargo_HQ_V3_F",
	"Land_Cargo_House_V2_F",
	"Land_Cargo_House_V3_F",
	"Land_Medevac_HQ_V1_F",
	"Land_Research_HQ_F",
	"Land_Dome_Big_F",
	"Land_Dome_Small_F",
	"B_supplyCrate_F",
	"Land_LandMark_F"
];

GRLIB_mines_to_be_saved = [
	"ATMine_Range_Ammo",
	"APERSMine_Range_Ammo",
	"APERSBoundingMine_Range_Ammo",
	"SLAMDirectionalMine_Wire_Ammo",
	"SLAMDirectionalMine_Magnetic_Ammo",
	"APERSTripMine_Wire_Ammo"
];

// Standard crewman to use when default crew won't work (saved AAF vehicles for example)
crewman_classname = "rhsusf_army_ucp_crewman";

AmmoFactory_allclasses = [AmmoFactory_device_typename,AmmoFactory_solar_typename,AmmoFactory_generator_typename];

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
	["Peral_B_600",0,0,3],
	["rhsusf_m1025_w",0,0,2],
	["rhsusf_m1025_w_m2",0,10,2],
	["rhsusf_m1025_w_mk19",0,20,2],
	["rhsusf_m998_w_2dr_halftop",0,0,2],
	["rhsusf_m998_w_4dr_halftop",0,0,2],
	["B_MRAP_01_F",0,0,4],
	["B_Truck_01_transport_F",0,0,5],
	["B_Truck_01_covered_F",0,0,5],
	["B_UGV_01_F",0,0,5],
	["B_UGV_01_rcws_F",0,60,5],
	["C_Rubberboat",0,0,2],
	["B_Boat_Transport_01_F",0,0,2],
	["ffaa_ar_lcm",0,0,4],
	["Burnes_LCAC_1",0,0,7],
	["B_SDV_01_F",0,0,15],
	["ffaa_ar_supercat",0,30,10]
];

heavy_vehicles = [
	["rhsusf_m113_usarmy_MK19",0,55,15],
	["rhsusf_m113_usarmy",0,50,15],
	["rhsusf_m113_usarmy_M240",0,50,15],
	["RHS_M2A3_BUSKIII_wd",0,85,15],
	["rhsusf_m1a1aimwd_usarmy",0,105,20],
	["rhsusf_m1a2sep1tuskiwd_usarmy",0,120,25],
	["rhsusf_m109_usarmy",0,750,30],
	["B_Boat_Armed_01_minigun_F",0,65,25]
];

air_vehicles = [
	["MELB_MH6M",0,0,10],
	["MELB_AH6M_L",0,30,10],
	["RHS_UH60M",0,25,12],
	["JNS_Skycrane_BLU_Green",0,0,12],
	["RHS_CH_47F",0,25,20],
	["B_Heli_Attack_01_F",0,200,30],
	["RHS_AH1Z_wd_GS",0,175,30],
	["RHS_AH64D_wd",0,400,50],
	["USAF_A10",0,700,85],
	["JS_JC_FA18E",0,650,75],
	["JS_JC_FA18F",0,650,75],
	["B_UAV_01_F",0,0,5],
	["B_UAV_02_F",0,50,25],
	["B_UAV_02_CAS_F",0,250,25],
	["USAF_F16",0,500,75],
	["usaf_f22",0,500,75],
	["USAF_F35A",0,650,75],
	["usaf_b1b",0,1200,90],
	["usaf_kc135",5,30,180],
	["USAF_E3",75,0,65],
	["USAF_C17",0,0,130],
	["USAF_C130J",0,0,95],
	["USAF_C130J_Cargo",0,0,95],
	["USAF_AC130U",0,800,95]
];

static_vehicles = [
	["RHS_M2StaticMG_MiniTripod_WD",0,10,0],
	["RHS_M2StaticMG_WD",0,10,0],
	["RHS_MK19_TriPod_WD",0,20,0],
	["RHS_M119_WD",0,50,0],
	["RHS_M252_WD",0,35,0],
	["RHS_Stinger_AA_pod_WD",0,25,0],
	["RHS_TOW_TriPod_WD",0,30,0],
	["B_SearchLight",0,0,0]
	
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
	["Land_CncShelter_F",0,0,0],
	["Land_CncWall4_F",0,0,0],
	["Land_CncWall1_F",0,0,0],
	["Land_Mil_WiredFence_F",0,0,0],
	["Land_Mil_WiredFence_Gate_F",0,0,0],
	["Land_Net_Fence_Gate_F",0,0,0],
	["Land_Concrete_SmallWall_4m_F",0,0,0],
	["Land_Concrete_SmallWall_8m_F",0,0,0],
	["Land_Mil_ConcreteWall_F",0,0,0],
	["Land_Crash_barrier_F",0,0,0],
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
	["Land_PierLadder_F",0,0,0],
	["Land_PortableLight_single_F",0,0,0],
	["Land_PortableLight_double_F",0,0,0],
	["Land_Camping_Light_F",0,0,0],
	["Land_MetalCase_01_large_F",0,0,0],
	["Land_MetalCase_01_medium_F",0,0,0],
	["Land_MetalCase_01_small_F",0,0,0],
	["Land_PaperBox_open_full_F",0,0,0],
	["Land_PaperBox_closed_F",0,0,0],
	["Land_Pallet_MilBoxes_F",0,0,0],
	["Land_Scaffolding_F",0,0,0],
	["CamoNet_BLUFOR_open_F",0,0,0],
	["CamoNet_BLUFOR_big_F",0,0,0],
	[Medical_typename,0,0,0],
	[Repair_typename,0,0,0],
	["Land_Cargo_House_V1_F",0,0,0],
	["Land_Cargo_Patrol_V1_F",0,0,0],
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
	["Land_FireExtinguisher_F",0,0,0],
	["MapBoard_altis_F",0,0,0],
	["Land_ChairPlastic_F",0,0,0],
	["Land_CampingChair_V1_F",0,0,0],
	["Land_CampingChair_V2_F",0,0,0],
	["Land_CampingTable_F",0,0,0],
	["Land_CampingTable_small_F",0,0,0],
	["Land_WaterCooler_01_new_F",0,0,0],
	["Land_Printer_01_F",0,0,0],
	["Land_Projector_01_F",0,0,0],
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
	["Land_Sign_WarningMilAreaSmall_F",0,0,0],
	["Land_Sign_WarningMilitaryArea_F",0,0,0],
	["Land_Sign_Mines_F",0,0,0],
	["Land_Sign_WarningMilitaryVehicles_F",0,0,0],
	["ArrowDesk_L_F",0,0,0],
	["ArrowDesk_R_F",0,0,0],
	["RoadBarrier_F",0,0,0],
	["RoadCone_F",0,0,0],
	["RoadCone_L_F",0,0,0],
	["ACE_Wheel",0,0,0],
	["ACE_Track",0,0,0],
	["Land_MetalBarrel_F",0,0,1],
	["FlexibleTank_01_forest_F",0,0,1],
	["StorageBladder_01_fuel_forest_F",0,0,5],
	["Land_CanisterFuel_F",0,0,0]
];

support_vehicles = [
	[Arsenal_typename,10,15,0],
	[Respawn_truck_typename,20,0,5],
	[FOB_box_typename,30,50,0],
	[FOB_truck_typename,30,50,5],
	["rhsusf_m113_usarmy_medical",20,0,5],
	["B_G_Offroad_01_repair_F",5,0,2],
	["B_Truck_01_Repair_F",10,0,5],
	["B_Truck_01_fuel_F",10,0,5],
	[AmmoFactory_truck_typename select 0,10,25,5],
	[AmmoFactory_truck_typename select 1,10,25,5],
	[AmmoFactory_box_typename select 0,0,25,0],
	//[AmmoFactory_box_typename select 1,0,25,0],
	["B_Slingload_01_Repair_F",5,0,0],
	//["JNS_Skycrane_Pod_Repair_BLU_Green",5,0,0],
	["B_Slingload_01_Fuel_F",0,0,5],
	//["JNS_Skycrane_Pod_Fuel_BLU_Green",0,0,5],
	//["JNS_Skycrane_Pod_Medical_BLU_Green",5,0,0],
	//["JNS_Skycrane_Pod_Bench_BLU_Green",5,0,0],
	[AmmoFactory_solarBox_typename,5,0,15],
	[AmmoFactory_generatorBox_typename,5,0,35],
	[ammobox_b_typename,0,155,0],
	[ammobox_o_typename,0,115,0],
	[AmmoFactory_solar_typename,5,0,15],
	[AmmoFactory_generator_typename,5,0,35],
	[AmmoFactory_device_typename,10,25,5]
];

// Vehicles unlocked by military base control
elite_vehicles = ["B_UGV_01_rcws_F","rhsusf_m109_usarmy","B_Heli_Attack_01_F","RHS_AH1Z_wd_GS","RHS_AH64D_wd","JS_JC_FA18E","JS_JC_FA18F","B_UAV_02_F","B_UAV_02_CAS_F","RHS_M2A3_BUSKIII_wd","USAF_A10","usaf_f22","USAF_F35A","usaf_kc135","USAF_C17","USAF_C130J","USAF_C130J_Cargo","USAF_E3","USAF_F16","usaf_b1b","rhsusf_m1a2sep1tuskiid_usarmy"];

// Vehicles and buildings for specific actions and inventories
ammo_vehicles = [ "B_Truck_01_ammo_F","B_Slingload_01_Ammo_F","JNS_Skycrane_Pod_Ammo_BLU_Green","rhsusf_m113_usarmy_supply" ];
fuel_vehicles = [ "B_Truck_01_fuel_F","C_Van_01_fuel_F","B_Slingload_01_Fuel_F","JNS_Skycrane_Pod_Fuel_BLU_Green" ];
repair_vehicles = [ "C_Offroad_01_repair_F","B_Truck_01_Repair_F","B_G_Offroad_01_repair_F" ];
medical_vehicles = [ "B_Truck_01_medical_F","B_Slingload_01_Medevac_F","JNS_Skycrane_Pod_Medical_BLU_Green","rhsusf_m113_usarmy_medical" ];
fuel_cannister = [ "Land_CanisterFuel_F" ];
repair_container = [ "B_Slingload_01_Repair_F","JNS_Skycrane_Pod_Repair_BLU_Green" ];
fireworks_base = [ "C_Rubberboat","B_G_Offroad_01_repair_F" ];

disable_damage = [ "Land_BarGate_F","CamoNet_BLUFOR_open_F","CamoNet_BLUFOR_big_F","RoadBarrier_F","RoadCone_F","RoadCone_L_F" ];
carryable_objects = [ "Land_PortableLight_single_F","Land_PortableLight_double_F","Land_BagFence_Long_F","Land_BagFence_Round_F","Land_BagFence_Short_F","RoadBarrier_F","RoadCone_F","RoadCone_L_F","Land_Camping_Light_F","Land_MetalCase_01_large_F","Land_MetalCase_01_medium_F","Land_MetalCase_01_small_F","MapBoard_altis_F","Land_ChairPlastic_F","Land_CampingChair_V1_F","Land_CampingChair_V2_F","Land_CampingTable_F","Land_DataTerminal_01_F","Land_CampingTable_small_F","Land_WaterCooler_01_new_F","Land_Laptop_unfolded_F","Land_Printer_01_F","Land_Projector_01_F","Land_Document_01_F","Land_File1_F","Land_FilePhotos_F","Land_File2_F","Land_File_research_F","Land_Map_altis_F","Land_Microwave_01_F","Land_GasCooker_F","Land_Ketchup_01_F","Land_Mustard_01_F","Land_Can_V1_F","Land_Can_V2_F","Land_Can_V3_F","Land_Tableware_01_stackOfNapkins_F","Land_FireExtinguisher_F","PortableHelipadLight_01_blue_F","PortableHelipadLight_01_red_F","PortableHelipadLight_01_green_F","PortableHelipadLight_01_yellow_F","TargetP_Inf_Acc2_F","Target_PopUp_Moving_Acc2_F","Target_PopUp_Moving_90deg_Acc2_F","Land_Sign_WarningMilAreaSmall_F","Land_Sign_WarningMilitaryArea_F","Land_Sign_WarningMilitaryVehicles_F" ];
draggable_objects = [ Arsenal_typename,"Land_MetalBarrel_F","FlexibleTank_01_forest_F","Land_PaperBox_open_full_F","Land_PaperBox_closed_F","Land_Pallet_MilBoxes_F" ];

// Objects that can be lifted
light_objects = carryable_objects + draggable_objects + [ "RHS_M2StaticMG_MiniTripod_WD","RHS_M2StaticMG_WD","RHS_MK19_TriPod_WD","RHS_M252_WD","RHS_Stinger_AA_pod_WD","RHS_TOW_TriPod_WD","B_SearchLight","Flag_NATO_F","ACE_Wheel","ACE_Track" ];

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

// *** BADDIES ***

// All OPFOR infantry
opfor_sentry = "rhs_vdv_mflora_rifleman";
opfor_rifleman = "rhs_vdv_mflora_rifleman";
opfor_grenadier = "rhs_vdv_mflora_grenadier_rpg";
opfor_squad_leader = "rhs_vdv_mflora_junior_sergeant";
opfor_team_leader = "rhs_vdv_mflora_sergeant";
opfor_marksman = "rhs_vdv_mflora_marksman";
opfor_machinegunner = "rhs_vdv_mflora_machinegunner";
opfor_heavygunner = "rhs_vdv_recon_arifleman";
opfor_medic = "rhs_vdv_mflora_medic";
opfor_rpg = "rhs_vdv_mflora_LAT";
opfor_at = "rhs_vdv_mflora_at";
opfor_aa = "rhs_vdv_mflora_aa";
opfor_officer = "rhs_vdv_mflora_officer";
opfor_sharpshooter = "rhs_vdv_recon_rifleman_scout_akm";
opfor_sniper = "O_sniper_F";
opfor_engineer = "rhs_vdv_mflora_engineer";

// Militia infantry. It's only classnames the game will pick from randomly
militia_squad = [ "rhs_g_Soldier_AA_F","rhs_g_Soldier_exp_F","rhs_g_engineer_F","rhs_g_Soldier_LAT_F","rhs_g_Soldier_AR_F","rhs_g_Soldier_M_F","rhs_g_medic_F","rhs_g_Soldier_F","rhs_g_Soldier_F3","rhs_g_Soldier_lite_F","rhs_g_Soldier_TL_F","rhs_g_Soldier_SL_F" ];

// Militia vehicles to choose from
militia_vehicles = [ "rhs_uaz_ags_chdkz","rhs_uaz_dshkm_chdkz","rhs_uaz_spg9_chdkz","rhs_btr60_chdkz","rhs_t72bb_chdkz" ];

// All the vehicles that can spawn as sector defenders and patrols
opfor_vehicles = [ "rhs_bmd4_vdv","rhs_prp3_vdv","rhs_btr60_vdv","rhs_2s3_tv" ];
// Same with lighter choices to be used  when the alert level is low
opfor_vehicles_low_intensity = [ "rhs_tigr_m_vdv","rhs_tigr_sts_vdv","rhs_uaz_open_vdv" ];

// All the vehicles that can spawn as battlegroup members
opfor_battlegroup_vehicles = [ "rhs_btr80a_vdv","rhs_sprut_vdv","rhs_zsu234_aa" ];
// Same with lighter choices to be used  when the alert level is low
opfor_battlegroup_vehicles_low_intensity = [ "rhs_tigr_m_vdv","rhs_tigr_sts_vdv" ];

// All the vehicles that can spawn as battlegroup members (see above) and hold 8 soldiers as passengers.
// If something can't hold all 8 soldiers then buggy behaviours may occur 
opfor_troup_transports = [ "RHS_Ural_Open_VDV_01","RHS_Ural_VDV_01","RHS_Mi8mt_vvsc","rhs_ka60_c" ];

// Battlegroup members that will need to spawn in flight. Should be only helos but, who knows
opfor_choppers = [ "RHS_Ka52_vvsc","RHS_Ka52_UPK23_vvsc", "RHS_Mi24V_AT_vvsc" ];

// Opfor attack aircrafts to choose from
opfor_air = [ "RHS_Su25SM_vvs" ];

// Vehicles to be used in secondary objectives
opfor_mrap = "rhs_tigr_m_vdv";
opfor_mrap_armed = "rhs_tigr_sts_vdv";
opfor_transport_helo = "rhs_ka60_c";
opfor_transport_truck = "RHS_Ural_Open_VDV_01";
opfor_fuel_truck = "RHS_Ural_Fuel_VDV_01";
opfor_ammo_truck = "rhs_gaz66_ammo_vdv";
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";
opfor_flag = "rhs_Flag_Russia_F";

// Civilians to randomly choose from
civilians = ["C_man_1","C_man_polo_6_F","C_man_polo_3_F","C_man_polo_2_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_1_F","C_man_p_beggar_F","C_man_1_2_F","C_man_p_fugitive_F","C_man_hunter_1_F","C_journalist_F","C_man_shorts_2_F","C_man_w_worker_F"];
civilian_vehicles = [ "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_SUV_01_F", "C_Van_01_transport_F", "C_Van_01_box_F", "C_Van_01_fuel_F", "C_Quadbike_01_F" ];

// !!
// Do not edit below this point!!
// Only boring technical stuff
// !!


elite_vehicles = elite_vehicles + elite_vehicles_extension;
infantry_units = infantry_units + infantry_units_extension;
light_vehicles = light_vehicles + light_vehicles_extension;
heavy_vehicles = heavy_vehicles + heavy_vehicles_extension;
air_vehicles = air_vehicles + air_vehicles_extension;
static_vehicles = static_vehicles + static_vehicles_extension;
buildings = buildings + buildings_extension;
support_vehicles = support_vehicles + support_vehicles_extension;
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
opfor_vehicles = [ opfor_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_vehicles_low_intensity = [ opfor_vehicles_low_intensity , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles = [ opfor_battlegroup_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles_low_intensity = [ opfor_battlegroup_vehicles_low_intensity , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_troup_transports = [ opfor_troup_transports , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_choppers = [ opfor_choppers , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_air = [ opfor_air , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
civilians = [ civilians , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
civilian_vehicles = [ civilian_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
military_alphabet = ["Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu"];
land_vehicles_classnames = (opfor_vehicles + militia_vehicles);
opfor_squad_low_intensity = [opfor_team_leader,opfor_machinegunner,opfor_medic,opfor_rpg,opfor_sentry,opfor_sentry,opfor_sentry,opfor_sentry];
opfor_squad_8_standard = [opfor_squad_leader,opfor_team_leader,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_marksman,opfor_grenadier,opfor_rpg];
opfor_squad_8_infkillers = [opfor_squad_leader,opfor_machinegunner,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_marksman,opfor_sharpshooter,opfor_sniper];
opfor_squad_8_tankkillers = [opfor_squad_leader,opfor_medic,opfor_machinegunner,opfor_rpg,opfor_rpg,opfor_at,opfor_at,opfor_at];
opfor_squad_8_airkillers = [opfor_squad_leader,opfor_medic,opfor_machinegunner,opfor_rpg,opfor_rpg,opfor_aa,opfor_aa,opfor_aa];
all_resistance_troops = [] + militia_squad;
all_hostile_classnames = (land_vehicles_classnames + opfor_air + opfor_choppers + opfor_troup_transports + opfor_vehicles_low_intensity);
{ land_vehicles_classnames pushback (_x select 0); } foreach (heavy_vehicles + light_vehicles);
air_vehicles_classnames = [] + opfor_choppers;
{ air_vehicles_classnames pushback (_x select 0); } foreach air_vehicles;
static_vehicles_classnames = [];
{ static_vehicles_classnames pushback (_x select 0); } foreach static_vehicles;
support_vehicles_classnames = [];
{ support_vehicles_classnames pushback (_x select 0); } foreach support_vehicles;
all_vehicles = light_vehicles + heavy_vehicles + air_vehicles + static_vehicles;
all_vehicles_classnames = land_vehicles_classnames + air_vehicles_classnames + static_vehicles_classnames + support_vehicles_classnames;
buildings_classnames = [];
{ buildings_classnames pushback (_x select 0); } foreach buildings;
markers_reset = [99999,99999,0];
zeropos = [0,0,0];
squads_names = [ localize "STR_LIGHT_RIFLE_SQUAD", localize "STR_RIFLE_SQUAD", localize "STR_AT_SQUAD", localize "STR_AA_SQUAD",  localize "STR_RECON_SQUAD", localize "STR_PARA_SQUAD" ];
boat_classnames = [ 
	"B_Boat_Transport_01_F", 
	"B_Boat_Armed_01_minigun_F",
	"C_Rubberboat",
	"B_SDV_01_F",
	"ffaa_ar_supercat",
	"Burnes_LCAC_1",
	"ffaa_ar_lcm"
];
cant_parachute = [ 
	AmmoFactory_solarBox_typename, 
	AmmoFactory_generatorBox_typename,
	AmmoFactory_box_typename select 1,
	"JNS_Skycrane_Pod_Repair_BLU_Green",
	"JNS_Skycrane_Pod_Fuel_BLU_Green",
	"JNS_Skycrane_Pod_Medical_BLU_Green",
	"JNS_Skycrane_Pod_Bench_BLU_Green"
] + boat_classnames + air_vehicles_classnames + static_vehicles_classnames;
can_parachute = all_vehicles_classnames - cant_parachute;

box_transport_config = [
	[ "B_Truck_01_transport_F", -6.5, [0,	-0.4,	0.4], [0,	-2.1,	0.4], [0,	-3.8,	0.4] ],
	[ "B_Truck_01_covered_F", -6.5, [0,	-0.4,	0.4], [0,	-2.1,	0.4], [0,	-3.8,	0.4] ],
	[ "O_Truck_03_transport_F", -6.5, [0,	-0.8,	0.4], [0,	-2.4,	0.4], [0,	-4.0,	0.4] ],
	[ "B_Heli_Transport_03_F", -7.5, [0,	2.2,	-1], [0,	0.8,	-1], [0,	-1.0, -1] ],
	[ "B_Heli_Transport_03_unarmed_F", -7.5, [0,	2.2,	-1], [0,	0.8,	-1], [0,	-1.0, -1] ],
	[ "greuh_eh101_gr", -6.5, [0,	4.2,	-1.45], [0,	2.5,	-1.45], [0,	0.8, -1.45], [0,	-0.9, -1.45] ],
	[ "I_Heli_Transport_02_F", -6.5, [0,	4.2,	-1.45], [0,	2.5,	-1.45], [0,	0.8, -1.45], [0,	-0.9, -1.45] ]
];
ammobox_transports_typenames = [];
{ ammobox_transports_typenames pushback (_x select 0) } foreach box_transport_config;
ammobox_transports_typenames = [ ammobox_transports_typenames , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
elite_vehicles = [ elite_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
original_resistance = [ "rhs_g_Soldier_AA_F","rhs_g_Soldier_exp_F","rhs_g_engineer_F","rhs_g_Soldier_LAT_F","rhs_g_Soldier_AR_F","rhs_g_Soldier_M_F","rhs_g_medic_F","rhs_g_Soldier_F","rhs_g_Soldier_F3","rhs_g_Soldier_lite_F","rhs_g_Soldier_TL_F","rhs_g_Soldier_SL_F" ];
opfor_infantry = [opfor_sentry,opfor_rifleman,opfor_grenadier,opfor_squad_leader,opfor_team_leader,opfor_marksman,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_rpg,opfor_at,opfor_aa,opfor_officer,opfor_sharpshooter,opfor_sniper,opfor_engineer];