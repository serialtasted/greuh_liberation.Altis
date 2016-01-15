/*
	One array per class name:
	(e.g. "Land_i_House_Big_01_V1_F" and "Land_i_House_Big_01_V2_F" are two different class names!)
	[
		"object_className",
		[
			[doorPosition, "doorName1", isTwisted],	//one door
			OR
			[doorPosition, ["doorName1", "doorName2"], [is1Twisted, is2Twisted]],	//multiple doors, e.g. slider doors
			...
		],
		radius	//distance at which the door should open
	]
*/
#define DOOR_RADIUS_LARGE	6	//meters, radius of the trigger area for gates

[
	[
		"Land_Offices_01_V1_F",
		[
			[[10.4929,-7.65356,-7.05899], ["Door_1_rot", "Door_2_rot"]],
			[[11.2625,0.230713,-7.05899], "Door_3_rot"],
			[[7.92407,6.08911,-7.05899], "Door_4_rot"],
			[[-14.842,8.42163,-7.05899], "Door_5_rot"],
			[[6.05762,-0.0559082,4.66484], "Door_6_rot"],
			[[7.82715,-5.61768,4.66477], "Door_7_rot"]
		]
	],
	[
		"Land_Hospital_main_F",
		[
			[[12.1914,19.8083,-8.00933], "Door_1_rot"],
			[[2.77881,15.8291,-8.01416], ["Door_2A_move", "Door_2B_move"]],
			[[2.89697,7.51416,-8.01557], ["Door_3A_move", "Door_3B_move"]],
			[[-4.16626,-7.84277,-8.01557], ["Door_4A_move", "Door_4B_move"]],
			[[-11.3657,-18.49,-8.01557], "Door_5_rot"]
		]
	],
	["Land_Hospital_side1_F",	[[[4.08276,3.30518,-7.89348], "Door_1_rot"]]],
	["Land_Hospital_side2_F",	[[[-8.84106,-7.20435,-8.10451], "Door_1_rot"]]],
	["Land_LightHouse_F",		[[[-0.0231934,-0.757324,-11.0989], "Door_1_rot"]]],
	["Land_i_Addon_02_V1_F",	[[[2.5481,-0.521973,0.112265], "Door_1_rot"]]],
	
	#define LAND_I_GARAGE [[[5.37183,1.53638,-0.0974813], "Door_1_rot"]]
	["Land_i_Garage_V1_F",		LAND_I_GARAGE],
	["Land_i_Garage_V2_F",		LAND_I_GARAGE],
	
	#define LAND_I_HOUSE_BIG_01 [ \
		[[-1.90527,-6.00586,-2.54993], "Door_1_rot"], \
		[[4.86328,5.58179,-2.56493], "Door_2_rot"], \
		[[-1.31348,2.95703,0.855067], "Door_3_rot"]]
	["Land_i_House_Big_01_V1_F",		LAND_I_HOUSE_BIG_01],
	["Land_i_House_Big_01_V1_dam_F",	LAND_I_HOUSE_BIG_01],
	["Land_i_House_Big_01_V2_F",		LAND_I_HOUSE_BIG_01],
	["Land_i_House_Big_01_V2_dam_F",	LAND_I_HOUSE_BIG_01],
	["Land_i_House_Big_01_V3_F",		LAND_I_HOUSE_BIG_01],
	["Land_i_House_Big_01_V3_dam_F",	LAND_I_HOUSE_BIG_01],
	
	#define LAND_I_HOUSE_BIG_02 [ \
		[[-2.89819,-4.43188,-2.62094], "Door_1_rot"], \
		[[-1.39063,-0.484131,-2.56094], "Door_2_rot"], \
		[[0.14624,5.36157,-2.51594], "Door_3_rot"], \
		[[-2.92188,-4.29346,0.866564], "Door_4_rot"], \
		[[-1.38965,-0.560303,0.866564], "Door_5_rot"], \
		[[-2.85498,5.31714,0.881564], "Door_6_rot"]]
	["Land_i_House_Big_02_V1_F",		LAND_I_HOUSE_BIG_02],
	["Land_i_House_Big_02_V1_dam_F",	LAND_I_HOUSE_BIG_02],
	["Land_i_House_Big_02_V2_F",		LAND_I_HOUSE_BIG_02],
	["Land_i_House_Big_02_V2_dam_F",	LAND_I_HOUSE_BIG_02],
	["Land_i_House_Big_02_V3_F",		LAND_I_HOUSE_BIG_02],
	["Land_i_House_Big_02_V3_dam_F",	LAND_I_HOUSE_BIG_02],
	
	#define LAND_I_SHOP_01 [ \
		[[1.24316,-2.60669,-2.73571], "Door_1_rot"], \
		[[3.11353,-2.49414,-2.73571], "Door_2_rot"], \
		[[2.31201,7.25073,-2.71734], "Door_3_rot"], \
		[[-0.627441,5.03613,1.10916], "Door_4_rot"], \
		[[-0.587402,-2.53345,1.14653], "Door_5_rot"]]
	["Land_i_Shop_01_V1_F",		LAND_I_SHOP_01],
	["Land_i_Shop_01_V1_dam_F",	LAND_I_SHOP_01],
	["Land_i_Shop_01_V2_F",		LAND_I_SHOP_01],
	["Land_i_Shop_01_V2_dam_F",	LAND_I_SHOP_01],
	["Land_i_Shop_01_V3_F",		LAND_I_SHOP_01],
	["Land_i_Shop_01_V3_dam_F",	LAND_I_SHOP_01],
	
	#define LAND_I_SHOP_02 [ \
		[[-5.83984,-3.22119,-2.7151], "Door_1_rot"], \
		[[-2.44092,1.23584,-2.66855], "Door_2_rot"], \
		[[3.78369,0.0187988,1.27873], "Door_3_rot"], \
		[[-5.87939,-0.00195313,1.27032], "Door_4_rot"]]
	["Land_i_Shop_02_V1_F",		LAND_I_SHOP_02],
	["Land_i_Shop_02_V1_dam_F",	LAND_I_SHOP_02],
	["Land_i_Shop_02_V2_F",		LAND_I_SHOP_02],
	["Land_i_Shop_02_V2_dam_F",	LAND_I_SHOP_02],
	["Land_i_Shop_02_V3_F",		LAND_I_SHOP_02],
	["Land_i_Shop_02_V3_dam_F",	LAND_I_SHOP_02],
	
	#define LAND_I_HOUSE_SMALL_01 [ \
		[[3.07397,-4.56152,-1.03963], "Door_1_rot"], \
		[[1.68066,0.251465,-1.04106], "Door_2_rot"], \
		[[1.68311,3.03198,-1.0419], "Door_3_rot"], \
		[[-3.36792,4.9624,-1.03037], "Door_4_rot"]]
	["Land_i_House_Small_01_V1_F",		LAND_I_HOUSE_SMALL_01],
	["Land_i_House_Small_01_V1_dam_F",	LAND_I_HOUSE_SMALL_01],
	["Land_i_House_Small_01_V2_F",		LAND_I_HOUSE_SMALL_01],
	["Land_i_House_Small_01_V2_dam_F",	LAND_I_HOUSE_SMALL_01],
	["Land_i_House_Small_01_V3_F",		LAND_I_HOUSE_SMALL_01],
	["Land_i_House_Small_01_V3_dam_F",	LAND_I_HOUSE_SMALL_01],
	
	#define LAND_I_HOUSE_SMALL_02 [ \
		[[-3.79077,-2.15088,-0.712922], "Door_1_rot"], \
		[[0.910156,1.71558,-0.702502], "Door_2_rot"]]
	["Land_i_House_Small_02_V1_F",		LAND_I_HOUSE_SMALL_02],
	["Land_i_House_Small_02_V1_dam_F",	LAND_I_HOUSE_SMALL_02],
	["Land_i_House_Small_02_V2_F",		LAND_I_HOUSE_SMALL_02],
	["Land_i_House_Small_02_V2_dam_F",	LAND_I_HOUSE_SMALL_02],
	["Land_i_House_Small_02_V3_F",		LAND_I_HOUSE_SMALL_02],
	["Land_i_House_Small_02_V3_dam_F",	LAND_I_HOUSE_SMALL_02],
	
	#define LAND_I_HOUSE_SMALL_03 [ \
		[[0.439941,-2.56812,-0.338685], "Door_1_rot"], \
		[[3.85205,5.07227,-0.32163], "Door_2_rot"], \
		[[1.97925,-0.444824,-0.371629], "Door_3_rot"], \
		[[-1.06128,2.43042,-0.371629], "Door_4_rot"]]
	["Land_i_House_Small_03_V1_F",		LAND_I_HOUSE_SMALL_03],
	["Land_i_House_Small_03_V1_dam_F",	LAND_I_HOUSE_SMALL_03],
	
	["Land_Slum_House01_F", [[[1.28857,-1.17969,-0.852837], "Door_1_rot"]]],
	[
		"Land_Slum_House02_F",
		[
			[[-0.00439453,-1.68872,-0.798102], "Door_1_rot"],
			[[-0.727051,2.77686,-0.805723], "Door_2_rot"]
		]
	],
	["Land_Slum_House03_F", [[[2.82397,-0.945557,-0.901089], "Door_1_rot"]]],
	
	#define LAND_I_STONE_SHED [[[2.25366,-0.860107,-0.0762148], "Door_1_rot"]]
	["Land_i_Stone_Shed_V1_F",	LAND_I_STONE_SHED],
	["Land_i_Stone_Shed_V2_F",	LAND_I_STONE_SHED],
	["Land_i_Stone_Shed_V3_F",	LAND_I_STONE_SHED],
	
	#define LAND_I_STONE_HOUSESMALL [ \
		[[6.87354,-1.26782,-0.595454], "Door_1_rot"], \
		[[-7.8418,-1.24561,-0.601124], "Door_2_rot"], \
		[[0.891113,1.81787,-0.622117], "Door_3_rot"]]
	["Land_i_Stone_HouseSmall_V1_F",		LAND_I_STONE_HOUSESMALL],
	["Land_i_Stone_HouseSmall_V1_dam_F",	LAND_I_STONE_HOUSESMALL],
	["Land_i_Stone_HouseSmall_V2_F",		LAND_I_STONE_HOUSESMALL],
	["Land_i_Stone_HouseSmall_V2_dam_F",	LAND_I_STONE_HOUSESMALL],
	["Land_i_Stone_HouseSmall_V3_F",		LAND_I_STONE_HOUSESMALL],
	["Land_i_Stone_HouseSmall_V3_dam_F",	LAND_I_STONE_HOUSESMALL],
	
	[
		"Land_Airport_left_F",
		[
			[[25.2932,-4.73755,-6.73733], "Door_1_rot"],
			[[14.6909,-4.79712,-6.73733], "Door_2_rot"],
			[[14.7954,11.5122,-6.73733], "Door_3_rot"],
			[[5,-3.72559,-6.73733], "Door_4_rot"],
			[[2.95825,-1.79639,-1.73733], "Door_5_rot"],
			[[-5.98804,-0.515381,-1.73733], "Door_6_rot"],
			[[-0.601807,-15.106,-6.73733], ["Door_7A_move", "Door_7B_move"]],
			[[-0.591797,15.1272,-6.73733], ["Door_8A_move", "Door_8B_move"]]
		]
	],
	[
		"Land_Airport_right_F",
		[
			[[-25.2656,-4.8042,-6.73733], "Door_1_rot"],
			[[-14.6499,-4.80078,-6.73733], "Door_2_rot"],
			[[-14.762,11.5735,-6.73733], "Door_3_rot"],
			[[-5.1748,-3.68457,-6.73733], "Door_4_rot"],
			[[-2.96436,-1.81738,-1.73733], "Door_5_rot"],
			[[5.98535,-0.398682,-1.73733], "Door_6_rot"],
			[[0.570068,-15.1599,-6.73733], ["Door_7A_move", "Door_7B_move"]],
			[[0.610596,15.3569,-6.73733], ["Door_8A_move", "Door_8B_move"]]
		]
	],
	[
		"Land_Airport_Tower_F",
		[
			[[1.32935,2.26733,-10.4415], "Door_1_rot"],
			[[-0.605469,0.817383,-1.44081], "Door_2_rot"]
		]
	],
	["Land_Airport_Tower_dam_F", [[[2.31616,3.75049,-8.17514], "Door_1_rot"]]],
	
	#define LAND_CARGO20 [[[-2.96436,-0.0351563,-1.17787], ["Door_1_rot", "Door_2_rot"]]]
	["Land_Cargo20_blue_F",			LAND_CARGO20],
	["Land_Cargo20_brick_red_F",	LAND_CARGO20],
	["Land_Cargo20_cyan_F",			LAND_CARGO20],
	["Land_Cargo20_grey_F",			LAND_CARGO20],
	["Land_Cargo20_light_blue_F",	LAND_CARGO20],
	["Land_Cargo20_light_green_F",	LAND_CARGO20],
	["Land_Cargo20_military_green_F",	LAND_CARGO20],
	["Land_Cargo20_orange_F",		LAND_CARGO20],
	["Land_Cargo20_red_F",			LAND_CARGO20],
	["Land_Cargo20_sand_F",			LAND_CARGO20],
	["Land_Cargo20_white_F",		LAND_CARGO20],
	["Land_Cargo20_yellow_F",		LAND_CARGO20],
	
	#define LAND_CARGO40 [[[-6.00146,-0.034668,-1.18187], ["Door_1_rot", "Door_2_rot"]]]
	["Land_Cargo40_blue_F",			LAND_CARGO40],
	["Land_Cargo40_brick_red_F",	LAND_CARGO40],
	["Land_Cargo40_cyan_F",			LAND_CARGO40],
	["Land_Cargo40_grey_F",			LAND_CARGO40],
	["Land_Cargo40_light_blue_F",	LAND_CARGO40],
	["Land_Cargo40_light_green_F",	LAND_CARGO40],
	["Land_Cargo40_military_green_F",	LAND_CARGO40],
	["Land_Cargo40_orange_F",		LAND_CARGO40],
	["Land_Cargo40_red_F",			LAND_CARGO40],
	["Land_Cargo40_sand_F",			LAND_CARGO40],
	["Land_Cargo40_white_F",		LAND_CARGO40],
	["Land_Cargo40_yellow_F",		LAND_CARGO40],
	
	[
		"Land_CarService_F",
		[
			[[1.01733,-1.88135,-1.25606], "Door_1_rot"],
			[[-0.0632324,6.27026,-1.25606], "Door_2_rot"],
			[[3.3811,8.60718,-1.25606], "Door_3_rot"]
		]
	],
	[
		"Land_Factory_Main_F",
		[
			[[-10.9998,11.0737,-6.24667], "Door_1_rot"],
			[[-6.22217,8.29834,-6.27167], "Door_2_rot"]
		]
	],
	[
		"Land_FuelStation_Build_F",
		[
			[[0.00634766,-1.70264,-1.33598], "Door_1_rot"],
			[[1.52466,1.99561,-1.33611], "Door_2_rot"]
		]
	],
	[
		"Land_i_Shed_Ind_F",
		[
			[[-9.09351,5.95923,-1.40978], ["Door_1_rot", "Door_2_rot"]],
			[[-7.83813,-2.00854,-1.40978], "Door_3_rot"],
			[[-8.33643,2.46899,-1.40978], "Door_4_rot"],
			[[13.7107,-2.05518,-1.40978], ["Door_5_rot", "Door_6_rot"]]
		]
	],
	
	#define LAND_I_BARRACKS	[ \
		[[-5.51221,-6.75781,0.591874], "Door_1_rot"], \
		[[14.8027,0.0830078,0.605519], "Door_2_rot"], \
		[[9.50024,4.83301,0.589749], "Door_3_rot"], \
		[[-2.53955,4.82568,0.602982], "Door_4_rot"], \
		[[-5.65137,4.85205,3.9395], "Door_5_rot"], \
		[[3.44189,4.83057,3.9395], "Door_6_rot"], \
		[[9.48315,4.83667,3.9395], "Door_7_rot"], \
		[[14.9141,0.171143,3.9395], "Door_8_rot"], \
		[[-11.104,-0.907227,0.60552], "Door_9_rot"], \
		[[-8.74707,1.06201,0.60552], "Door_10_rot"], \
		[[-0.400879,1.05518,0.60552], "Door_11_rot"], \
		[[3.57227,-0.93335,0.60552], "Door_12_rot"], \
		[[6.35474,1.09619,0.60552], "Door_13_rot"], \
		[[10.3669,1.06982,0.60552], "Door_14_rot"], \
		[[13.2195,-0.918701,0.60552], "Door_15_rot"], \
		[[-11.1819,-0.935547,3.9395], "Door_16_rot"], \
		[[-8.76489,1.08472,3.9395], "Door_17_rot"], \
		[[-0.413574,1.04199,3.9395], "Door_18_rot"], \
		[[3.58984,-0.92334,3.9395], "Door_19_rot"], \
		[[6.35059,1.04834,3.9395], "Door_20_rot"], \
		[[10.3633,1.11963,3.9395], "Door_21_rot"], \
		[[13.2368,-0.935303,3.9395], "Door_22_rot"]]
	["Land_i_Barracks_V1_F",		LAND_I_BARRACKS],
	["Land_i_Barracks_V2_F",		LAND_I_BARRACKS],
	
	#define LAND_I_BARRACKS_DAM [ \
		[[-7.76221,-5.75781,-1.891874], "Door_1_rot"], \
		[[12.5527,1.1530078,-1.905519], "Door_2_rot"], \
		[[7.25024,5.83301,-1.889749], "Door_3_rot"], \
		[[-4.78955,5.82568,-1.902982], "Door_4_rot"], \
		[[-7.90137,5.85205,1.4395], "Door_5_rot"], \
		[[1.31189,5.83057,1.4395], "Door_6_rot"], \
		[[7.23315,5.83667,1.4395], "Door_7_rot"], \
		[[12.6641,1.171143,1.4395], "Door_8_rot"], \
		[[-13.354,0.107227,-1.90552], "Door_9_rot"], \
		[[-10.99707,2.06201,-1.90552], "Door_10_rot"], \
		[[-2.650879,2.05518,-1.90552], "Door_11_rot"], \
		[[1.32227,0.13335,-1.90552], "Door_12_rot"], \
		[[4.10474,2.09619,-1.90552], "Door_13_rot"], \
		[[8.1169,2.06982,-1.90552], "Door_14_rot"], \
		[[10.9695,0.118701,-1.90552], "Door_15_rot"], \
		[[-13.4319,0.135547,1.4395], "Door_16_rot"], \
		[[-11.01489,2.08472,1.4395], "Door_17_rot"], \
		[[-2.663574,2.04199,1.4395], "Door_18_rot"], \
		[[1.33984,0.12334,1.4395], "Door_19_rot"], \
		[[4.10059,2.04834,1.4395], "Door_20_rot"], \
		[[8.1133,2.11963,1.4395], "Door_21_rot"], \
		[[10.9868,0.135303,1.4395], "Door_22_rot"]]
	["Land_i_Barracks_V1_dam_F",	LAND_I_BARRACKS_DAM],
	["Land_i_Barracks_V2_dam_F",	LAND_I_BARRACKS_DAM],
	
	[
		"Land_u_Barracks_V2_F",
		[
			[[-9.01221,-5.75781,-1.891874], "Door_1_rot"],
			[[11.3027,1.1530078,-1.905519], "Door_2_rot"],
			[[6.00024,5.83301,-1.889749], "Door_3_rot"],
			[[-6.03955,5.82568,-1.902982], "Door_4_rot"],
			[[-9.15137,5.85205,1.4395], "Door_5_rot"],
			[[0.06189,5.83057,1.4395], "Door_6_rot"],
			[[5.98315,5.83667,1.4395], "Door_7_rot"],
			[[11.4141,1.171143,1.4395], "Door_8_rot"],
			[[-14.604,0.107227,-1.90552], "Door_9_rot"],
			[[-12.24707,2.06201,-1.90552], "Door_10_rot"],
			[[-3.900879,2.05518,-1.90552], "Door_11_rot"],
			[[0.07227,0.13335,-1.90552], "Door_12_rot"],
			[[2.85474,2.09619,-1.90552], "Door_13_rot"],
			[[6.8669,2.06982,-1.90552], "Door_14_rot"],
			[[9.7195,0.118701,-1.90552], "Door_15_rot"],
			[[-14.6819,0.135547,1.4395], "Door_16_rot"],
			[[-12.26489,2.08472,1.4395], "Door_17_rot"],
			[[-3.913574,2.04199,1.4395], "Door_18_rot"],
			[[0.08984,0.12334,1.4395], "Door_19_rot"],
			[[2.85059,2.04834,1.4395], "Door_20_rot"],
			[[6.8633,2.11963,1.4395], "Door_21_rot"],
			[[9.7368,0.135303,1.4395], "Door_22_rot"]
		]
	],
	
	#define LAND_CARGO_HOUSE [[[0.730957,-0.200195,-0.0957494], "Door_1_rot"]]
	["Land_Cargo_House_V1_F",	LAND_CARGO_HOUSE],
	["Land_Cargo_House_V2_F",	LAND_CARGO_HOUSE],
	["Land_Cargo_House_V3_F",	LAND_CARGO_HOUSE],
	
	#define LAND_CARGO_HQ [ \
		[[-4.37964,-2.2937,-3.27229], "Door_1_rot"], \
		[[2.41895,-3.01953,-0.672286], "Door_2_rot"]]
	["Land_Cargo_HQ_V1_F",	LAND_CARGO_HQ],
	["Land_Cargo_HQ_V2_F",	LAND_CARGO_HQ],
	["Land_Cargo_HQ_V3_F",	LAND_CARGO_HQ],
	
	#define LAND_CARGO_TOWER [ \
		[[-0.821289,-1.93799,5.07987], "Door_1_rot"], \
		[[3.87866,0.433105,-0.120125], "Door_2_rot"], \
		[[0.132813,4.23706,-0.120125], "Door_3_rot"]]
	["Land_Cargo_Tower_V1_F",		LAND_CARGO_TOWER],
	["Land_Cargo_Tower_V1_No1_F",	LAND_CARGO_TOWER],
	["Land_Cargo_Tower_V1_No2_F",	LAND_CARGO_TOWER],
	["Land_Cargo_Tower_V1_No3_F",	LAND_CARGO_TOWER],
	["Land_Cargo_Tower_V1_No4_F",	LAND_CARGO_TOWER],
	["Land_Cargo_Tower_V1_No5_F",	LAND_CARGO_TOWER],
	["Land_Cargo_Tower_V1_No6_F",	LAND_CARGO_TOWER],
	["Land_Cargo_Tower_V1_No7_F",	LAND_CARGO_TOWER],
	["Land_Cargo_Tower_V2_F",		LAND_CARGO_TOWER],
	["Land_Cargo_Tower_V3_F",		LAND_CARGO_TOWER],
	["Land_Medevac_house_V1_F",		LAND_CARGO_HOUSE],
	["Land_Medevac_HQ_V1_F",		LAND_CARGO_HQ],
	
	[
		"Land_MilOffices_V1_F",
		[
			[[-12.0823,11.6567,-2.86676], "Door_1_rot"],
			[[4.13403,-6.05859,-2.86676], "Door_2_rot"],
			[[13.8674,-5.98828,-2.86676], "Door_3_rot"],
			[[7.88184,4.12891,-2.86676], "Door_4_rot"],
			[[-12.8137,-1.5249,-2.86676], "Door_5_rot"],
			[[-10.9253,-2.80322,-2.86676], "Door_6_rot"],
			[[10.5718,-4.19482,-2.86676], "Door_7_rot"],
			[[10.5447,-2,-2.86676], "Door_8_rot"]
		]
	],
	[
		"Land_Dome_Big_F",
		[
			[[23.2537,-0.234375,-10.1811], ["Door_1A_move", "Door_1B_move"]],
			[[-0.617188,-24.4429,-10.1811], "Door_2_rot"],
			[[-0.540771,24.0342,-10.1811], "Door_3_rot"]
		]
	],
	[
		"Land_Dome_Small_F",
		[
			[[0.00561523,14.1118,-6.93302], ["Door_1A_rot", "Door_1B_rot"]],
			[[-0.0483398,-14.0713,-6.93302], ["Door_2A_rot", "Door_2B_rot"]]
		]
	],
	["Land_Research_house_V1_F",LAND_CARGO_HOUSE],
	["Land_Research_HQ_F",		LAND_CARGO_HQ],
	["Land_BarGate_F",			[[[-0.271729,-0.0668945,-4.04884], "Door_1_rot"]], DOOR_RADIUS_LARGE],
	["Land_City_Gate_F",		[[[-0.0090332,-0.165283,-0.500221], ["Door_1_rot", "Door_2_rot"]]], DOOR_RADIUS_LARGE],
	["Land_Net_Fence_Gate_F",	[[[0.0195313,0.0183105,-1.03606], ["Door_1_rot", "Door_2_rot"]]], DOOR_RADIUS_LARGE],
	["Land_Stone_Gate_F",		[[[-0.0373535,0.165771,-0.506733], ["Door_1_rot", "Door_2_rot"]]], DOOR_RADIUS_LARGE],
	["Land_Kiosk_blueking_F",	[[[-0.0341797,1.87793,-1.76589], "Door_1_rot"]]],
	["Land_Kiosk_gyros_F",		[[[-0.00195313,1.88965,-1.97606], "Door_1_rot"]]],
	["Land_Kiosk_papers_F",		[[[-0.00488281,1.88574,-1.97606], "Door_1_rot"]]],
	["Land_Kiosk_redburger_F",	[[[-0.0217285,1.8623,-2.87051], "Door_1_rot"]]]
]
