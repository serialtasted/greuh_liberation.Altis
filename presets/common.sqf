// Special items per building type
medical_type = [
	["Box_NATO_Wps_F",0,0,0]
];
repair_type = [
	["ACE_Wheel",0,0,0],
	["ACE_Track",0,0,0],
	["Land_MetalBarrel_F",0,0,1],
	["FlexibleTank_01_forest_F",0,0,1],
	["StorageBladder_01_fuel_forest_F",0,0,5],
	["Land_CanisterFuel_F",0,0,0]
];
barracks_type = [
	["Box_NATO_AmmoOrd_F",0,0,0],
	["Box_NATO_WpsSpecial_F",0,0,0],
	["Box_NATO_Ammo_F",0,0,0],
	["Box_NATO_Grenades_F",0,0,0],
	["Box_NATO_Support_F",0,0,0]
];

disable_damage = [ 
	"Land_BarGate_F",
	"CamoNet_BLUFOR_F",
	"CamoNet_BLUFOR_open_F",
	"CamoNet_BLUFOR_big_F",
	"CamoNet_ghex_F",
	"CamoNet_ghex_open_F",
	"CamoNet_ghex_big_F",
	"RoadBarrier_F",
	"RoadCone_F",
	"RoadCone_L_F",
	"Land_Obstacle_Cross_F",
	"Land_Obstacle_RunAround_F",
	"Land_Crash_barrier_F",
	"Land_CncBarrier_F",
	"Land_CncBarrier_stripes_F",
	"Land_Mil_WiredFence_F",
	"Land_Mil_WiredFence_Gate_F",
	"Land_Net_Fence_Gate_F",
	"Land_Concrete_SmallWall_4m_F",
	"Land_Concrete_SmallWall_8m_F"
];
carryable_objects = [ 
	"Land_PortableLight_single_F",
	"Land_PortableLight_double_F",
	"Land_BagFence_Long_F",
	"Land_BagFence_01_long_green_F",
	"Land_BagFence_Round_F",
	"Land_BagFence_01_round_green_F",
	"Land_BagFence_Short_F",
	"Land_BagFence_01_short_green_F",
	"RoadBarrier_F",
	"RoadCone_F",
	"RoadCone_L_F",
	"Land_Camping_Light_F",
	"Land_MetalCase_01_large_F",
	"Land_MetalCase_01_medium_F",
	"Land_MetalCase_01_small_F",
	"Land_MapBoard_F",
	"Land_ChairPlastic_F",
	"Land_CampingChair_V1_F",
	"Land_CampingChair_V2_F",
	"Land_CampingTable_F",
	"Land_CampingTable_small_F",
	"Land_WaterCooler_01_new_F",
	"Land_FireExtinguisher_F",
	"PortableHelipadLight_01_blue_F",
	"PortableHelipadLight_01_red_F",
	"PortableHelipadLight_01_green_F",
	"PortableHelipadLight_01_yellow_F",
	"TargetP_Inf_Acc2_F",
	"Target_PopUp_Moving_Acc2_F",
	"Target_PopUp_Moving_90deg_Acc2_F",
	"Land_Sign_WarningMilAreaSmall_F",
	"Land_Sign_WarningMilitaryArea_F",
	"Land_Sign_WarningMilitaryVehicles_F",
	"Land_PaperBox_open_full_F",
	"Land_MetalBarrel_F",
	"FlexibleTank_01_forest_F",
	"B_supplyCrate_F",
	"TargetP_Inf_F",
	"TargetP_Inf_Acc1_F",
	"TargetP_Inf_Acc2_F"
];
draggable_objects = [ 
	"CargoNet_01_box_F"
];

// Objects that can be lifted
light_objects = carryable_objects + draggable_objects + static_vehicles + [ 
	Arsenal_typename,
	"Land_PaperBox_closed_F",
	"Land_Pallet_MilBoxes_F",
	"Flag_NATO_F",
	"ACE_Wheel",
	"ACE_Track"
];

// All the UAVs must be declared here, otherwise there shall be UAV controlling issues. Namely: you won't be able to control them.
uavs = [
	"ffaa_et_searcherIII",
	"ffaa_reaper_gbu",
	"ffaa_reaper_maverick",
	"B_UAV_01_F","B_UAV_02_F",
	"B_UAV_02_CAS_F",
	"B_UGV_01_F",
	"B_UGV_01_rcws_F",
	"B_UAV_05_F",
	"B_T_UAV_03_F"
];

// Everything that can resupply other vehicles
vehicle_repair_sources = [
	"C_Van_02_service_F",
	"B_APC_Tracked_01_CRV_F",
	"C_Offroad_01_repair_F",
	"B_Truck_01_Repair_F",
	"B_Slingload_01_Repair_F",
	"JNS_Skycrane_Pod_Repair_BLU_Black",
	"rhsusf_M977A4_REPAIR_usarmy_wd",
	"ffaa_et_m250_repara_municion_blin",
	"TF47_Desert_HEMTT_NATO_REP"
];
vehicle_rearm_sources = [
	"B_APC_Tracked_01_CRV_F",
	"B_Truck_01_ammo_F",
	"B_Slingload_01_Ammo_F",
	"JNS_Skycrane_Pod_Ammo_BLU_Black",
	"rhsusf_M977A4_AMMO_usarmy_wd",
	"rhsusf_m113_usarmy_supply",
	"ffaa_et_m250_municion_blin",
	"TF47_Desert_HEMTT_NATO_AMMO"
];
vehicle_refuel_sources = [
	"B_APC_Tracked_01_CRV_F",
	"B_Truck_01_fuel_F",
	"B_Slingload_01_Fuel_F",
	"C_Van_01_fuel_F",
	"rhsusf_M978A4_usarmy_wd",
	"ffaa_et_m250_combustible_blin",
	"TF47_Desert_HEMTT_NATO_FUEL"
];
vehicle_medical_sources = [
	"C_Van_02_medevac_F",
	"C_IDAP_Van_02_medevac_F",
	"B_Truck_01_medical_F",
	"B_Slingload_01_Medevac_F",
	"rhsusf_m113_usarmy_medical",
	"TF47_Desert_HEMTT_NATO_MED"
];

vehicle_repair_containers = [
	"B_Slingload_01_Repair_F",
	"JNS_Skycrane_Pod_Repair_BLU_Black"
];

fuel_cannister = [ 
	"Land_CanisterFuel_F"
];

// Everything the AI troups should be able to resupply from
ai_resupply_sources = [
	Respawn_truck_typename,
	huron_typename,
	Arsenal_typename
] + vehicle_rearm_sources;

// Configuration for ammo boxes transport
// First entry: classname
// Second entry: how far behind the vehicle the boxes should be unloaded
// Following entries: attachTo position for each box, the number of boxes that can be loaded is derived from the number of entries
box_transport_config = [
	[ "B_Truck_01_transport_F", -6.5, [0,	-0.4,	0.4], [0,	-2.1,	0.4], [0,	-3.8,	0.4] ],
	[ "B_Truck_01_covered_F", -6.5, [0,	-0.4,	0.4], [0,	-2.1,	0.4], [0,	-3.8,	0.4] ],
	[ "O_Truck_03_transport_F", -6.5, [0,	-0.8,	0.4], [0,	-2.4,	0.4], [0,	-4.0,	0.4] ],
	[ "O_Truck_03_covered_F", -6.5, [0,	-0.8,	0.4], [0,	-2.4,	0.4], [0,	-4.0,	0.4] ],
	[ "B_Heli_Transport_03_F", -7.5, [0,	2.2,	-1], [0,	0.8,	-1], [0,	-1.0, -1] ],
	[ "B_Heli_Transport_03_unarmed_F", -7.5, [0,	2.2,	-1], [0,	0.8,	-1], [0,	-1.0, -1] ],
	[ "I_Heli_Transport_02_F", -6.5, [0,	4.2,	-1.45], [0,	2.5,	-1.45], [0,	0.8, -1.45], [0,	-0.9, -1.45] ]
];

// Pre-made squads for the commander build menu. These shouldn't exceed 10 members.
// Light infantry squad
blufor_squad_inf_light = [
	blufor_squad_leader,
	blufor_rifleman,
	blufor_rifleman,
	blufor_rifleman,
	blufor_medic,
	blufor_grenadier,
	blufor_machinegunner
];

// Heavy infantry squad
blufor_squad_inf = [	
	blufor_squad_leader,
	blufor_grenadier,
	blufor_marksman,
	blufor_machinegunner,
	blufor_medic,
	blufor_engineer,
	blufor_rifleman
];

// AT specialists squad
blufor_squad_at = [
	blufor_squad_leader,
	blufor_rifleman,
	blufor_at,
	blufor_at,
	blufor_at,
	blufor_grenadier,
	blufor_medic,
	blufor_machinegunner
];

// AA specialists squad
blufor_squad_aa = [
	blufor_squad_leader,
	blufor_aa,
	blufor_aa,
	blufor_engineer,
	blufor_medic,
	blufor_rifleman,
	blufor_machinegunner
];

// Force recon squad
blufor_squad_recon = [
	blufor_squad_leader,
	blufor_sniper,
	blufor_sniper,
	blufor_engineer,
	blufor_medic,
	blufor_rifleman,
	blufor_machinegunner
];

// Paratroopers squad
blufor_squad_para = [
	blufor_squad_leader,
	blufor_rifleman,
	blufor_rifleman,
	blufor_rifleman,
	blufor_grenadier,
	blufor_engineer,
	blufor_medic,
	blufor_machinegunner
];

squads = [
	[blufor_squad_inf_light,20,0,0],
	[blufor_squad_inf,30,0,0],
	[blufor_squad_at,20,25,0],
	[blufor_squad_aa,20,25,0],
	[blufor_squad_recon,25,0,0],
	[blufor_squad_para,20,0,0]
];

// Militia infantry. Soldier classnames the game will pick from randomly
militia_squad = [
	opfor_squad_leader,
	opfor_rifleman,
	opfor_grenadier,
	opfor_marksman,
	opfor_machinegunner,
	opfor_medic,
	opfor_rpg,
	opfor_aa,
	opfor_sniper,
	opfor_engineer
];


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
	"I_C_Boat_Transport_02_F",
	"SC_RHIB",
	"rhsusf_mkvsoc",
	"ffaa_ar_supercat",
	"Burnes_LCAC_1",
	"ffaa_ar_lcm",
	"CUP_B_RHIB_USMC",
	"CUP_B_RHIB2Turret_USMC",
	"CUP_B_Zodiac_USMC"
];
cant_parachute = [] + boat_classnames + air_vehicles_classnames + static_vehicles_classnames;
can_parachute = all_vehicles_classnames - cant_parachute;
can_build_on_water = [ "Land_Pier_small_F" ];
ammobox_transports_typenames = [];
{ ammobox_transports_typenames pushback (_x select 0) } foreach box_transport_config;
ammobox_transports_typenames = [ ammobox_transports_typenames , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
elite_vehicles = [ elite_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
original_resistance = [ "O_G_Soldier_SL_F","O_G_Soldier_A_F","O_G_Soldier_AR_F","O_G_medic_F","O_G_engineer_F","O_G_Soldier_exp_F","O_G_Soldier_GL_F","O_G_Soldier_M_F","O_G_Soldier_F","O_G_Soldier_LAT_F","O_G_Soldier_lite_F","O_g_soldier_unarmed_f","O_G_Sharpshooter_F","O_g_survivor_F","O_G_Soldier_TL_F"];
opfor_infantry = [opfor_sentry,opfor_rifleman,opfor_grenadier,opfor_squad_leader,opfor_team_leader,opfor_marksman,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_rpg,opfor_at,opfor_aa,opfor_officer,opfor_sharpshooter,opfor_sniper,opfor_engineer];
GRLIB_intel_table = "Land_CampingTable_small_F";
GRLIB_intel_chair = "Land_CampingChair_V2_F";
GRLIB_intel_file = "Land_File1_F";
GRLIB_intel_laptop = "Land_Laptop_device_F";
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
GRLIB_sar_wreck = "Land_Wreck_Heli_Attack_01_F";
GRLIB_sar_fire = "test_EmptyObjectForFireBig";
GRLIB_mines_to_be_saved = [
	"ATMine_Range_Ammo",
	"APERSMine_Range_Ammo",
	"APERSBoundingMine_Range_Ammo",
	"SLAMDirectionalMine_Wire_Ammo",
	"SLAMDirectionalMine_Magnetic_Ammo",
	"APERSTripMine_Wire_Ammo"
];