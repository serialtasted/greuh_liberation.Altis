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

//doors marked with a /*x*/ are twisted in functionality, meaning open = 0 and closed = 1
[
	[
		"Land_Church_03",
		[
			[[-14.8086,-0.0595703,-14.4025], ["dvere1", "dvere2"]]
		]
	],
	[
		"Land_HouseV_1I4",
		[
			[[1.36328,1.73242,-2.827], "dvere1"],
			[[-0.305664,-0.494141,-2.81924], "dvere2"]
		]
	],
	[
		"Land_Ind_Garage01",
		[
			[[1.0791,-2.88232,-1.00977], ["dvere1", "dvere2"]]
		]
	],
	[
		"Land_plot_rust_vrata",
		[
			[[0.00488281,-0.00976563,-0.766479], ["DoorL", "DoorR"]]
		]
	],
	[
		"Land_plot_rust_branka",
		[
			[[-0.0703125,-0.0229492,-0.660797], "DoorR"]
		]
	],
	[
		"Land_Hlidac_budka",
		[
			[[-1.44434,-0.302979,-1.06775], "Dvere1"/*x*/, true]
		]
	],
	[
		"Land_Ind_Workshop01_02",
		[
			[[2.55908,0.789063,-1.47028], "dvere1"],
			[[-2.40234,1.03711,-1.45596], ["dvere2","dvere3"]]
		]
	],
	[
		"Land_Wall_Gate_Ind2B_R",
		[
			[[-0.0302734,-0.0214844,-0.953461], "DoorR"]
		],
		DOOR_RADIUS_LARGE
	],
	[
		"Land_Wall_Gate_Ind2B_L",
		[
			[[-0.00195313,-0.0205078,-0.956818], "DoorL"]
		],
		DOOR_RADIUS_LARGE
	],
	[
		"Land_Wall_Gate_Ind2Rail_L",
		[
			[[-0.00195313,-0.0205078,-0.956818], "DoorL"]
		],
		DOOR_RADIUS_LARGE
	],
	[
		"Land_Wall_Gate_Ind2Rail_R",
		[
			[[-0.0209961,-0.0205078,-0.951573], "DoorR"]
		],
		DOOR_RADIUS_LARGE
	],
	[
		"Land_Wall_Gate_Wood1",
		[
			[[-0.0551758,-0.0253906,-0.174713], "DoorR"]
		]
	],
	[
		"Land_Wall_Gate_Ind1_L",
		[
			[[-0.000732422,-0.0195313,-0.847656], "DoorL"]
		],
		DOOR_RADIUS_LARGE
	],
	[
		"Land_Wall_Gate_Ind1_R",
		[
			[[-0.000732422,-0.0195313,-0.847656], "DoorR"]
		],
		DOOR_RADIUS_LARGE
	],
	[
		"Land_Farm_Cowshed_a",
		[
			[[-1.97095,7.08105,-3.17764], ["door01_a", "door01_b"]],
			[[2.84375,-7.50293,-3.17764], ["door02_a", "door02_b"]],
			[[11.1541,6.16895,-3.08765], "door03"]
		]
	],
	[
		"Land_Ind_Workshop01_04",
		[
			[[2.16284,-6.02246,-1.66843], ["dvere1", "dvere2"]],
			[[-2.63501,2.21777,-1.66846], "dvere3"],
			[[2.37231,3.72949,-1.66846], "dvere4"]
		]
	],
	[
		"Land_plot_green_branka",
		[
			[[-0.0749512,-0.0185547,-0.766602], "DoorR"]
		]
	],
	[
		"Land_A_FuelStation_Build",
		[
			[[-0.0175781,-1.9043,-1.69754], "door_1"],
			[[1.54736,1.83154,-1.47339], "door_2"]
		]
	],
	[
		"Land_Farm_Cowshed_c",
		[
			[[0.155273,3.7041,-3.21585], ["door_a", "door_b"]]
		]
	],
	[
		"Land_Barn_Metal",
		[
			[[-10.3438,-1.35059,-5.49496], ["dvere1", "dvere2"/*x*/], [false, true]],	//dvere2 is not really moving at all
			[[11.7007,-1.20313,-5.49213], ["dvere3"/*x*/, "dvere4"], [true, false]]
		],
		DOOR_RADIUS_LARGE
	],
	[
		"Land_sara_domek_zluty",
		[
			[[3.3457,-1.55469,-2.87785], "Dvere1"/*x*/, true]
		]
	],
	[
		"Land_Ind_Workshop01_L",
		[
			[[0.809082,3.83984,-1.46579], "dvere1"],
			[[-4.09473,2.30078,-1.46982], "dvere2"],
			[[1.16016,-5.89453,-1.46048], "dvere3"],
			[[3.94141,-0.867188,-1.45892], ["dvere4", "dvere5"]]
		]
	],
	[
		"Land_Ind_Workshop01_01",
		[
			[[1.26172,2.88965,-1.29782], ["dvere1", "dvere2"]],
			[[-2.0752,-2.35254,-1.32492], "dvere3"]
		]
	],
	[
		"Land_Wall_Gate_Ind2A_L",
		[
			[[0.0639648,-0.0253906,-0.991592], "DoorL"]
		],
		DOOR_RADIUS_LARGE
	],
	[
		"Land_Wall_Gate_Ind2A_R",
		[
			[[-0.0141602,0.145508,-0.931366], "DoorR"]
		],
		DOOR_RADIUS_LARGE
	],
	[
		"Land_Wall_Gate_Village",
		[
			[[-0.00976563,-0.0224609,-0.53833], "DoorR"]
		]
	],
	
	[
		"Land_A_GeneralStore_01",
		[
			[[-10.1855,2.4375,-1.20155], ["dvere1", "dvere2"]],
			[[-8.6543,-8.80566,-1.20155], ["dvere3", "dvere4"]],
			[[-5.87988,-8.90234,-1.20155], ["dvere5", "dvere6"]],
			[[6.14063,-8.92285,-1.20155], ["dvere7", "dvere8"]],
			[[10.707,-8.93994,-1.20155], ["dvere9", "dvere10"]]
		]
	],
	[
		"Land_A_GeneralStore_01a",
		[
			[[-9.10645,6.19678,-1.2287], ["dvere1", "dvere2"]],
			[[-7.52051,-5.36035,-1.24332], ["dvere3", "dvere4"]],
			[[-4.80664,-5.3335,-1.21725], ["dvere5", "dvere6"]],
			[[7.32129,-5.32178,-1.21725], ["dvere7", "dvere8"]],
			[[11.9238,-5.32031,-1.21725], ["dvere9", "dvere10"]]
		]
	],
	[
		"Land_Misc_Cargo1Ao",
		[
			[[0.0649414,-2.89795,-1.09224], ["door_1_1", "door_1_2"]/*x*/, [true, true]]
		]
	],
	[
		"Land_Misc_Cargo1Bo",
		[
			[[0.0725098,-3.04395,-1.21188], ["door_1_1", "door_1_2"]/*x*/, [true, true]],
			[[0.102783,3.12305,-1.20029], ["door_2_1", "door_2_2"]/*x*/, [true, true]]
		]
	],
	[
		"Land_plot_green_vrata",
		[
			[[-0.0253906,-0.00292969,-0.631104], ["DoorR", "DoorL"]]
		],
		DOOR_RADIUS_LARGE
	],
	[
		"Land_Mil_Barracks_i",
		[
			[[7.02295,2.01855,-1.36285], "Door_01"],
			[[5.06592,0.768555,-1.36694], "Door_02"],
			[[1.88184,0.764648,-1.36694], "Door_03"],
			[[-1.34668,0.710938,-1.36694], "Door_04"],
			[[-4.55762,0.755859,-1.36694], "Door_05"],
			[[-7.70068,0.873047,-1.36694], "Door_06"]
		]
	],
	[
		"Land_a_stationhouse",
		[
			[[18.2163,4.20605,-9.51791], "dvere"],
			[[3.57715,-8.2168,-9.5079], ["vrataL1", "vrataR1"]],
			[[9.96826,-8.27441,-9.50879], ["vrataL2","vrataR2"]],
			[[16.2329,-8.26758,-9.51273], ["vrataL3", "vrataR3"]]
		],
		DOOR_RADIUS_LARGE
	],
	[
		"Land_Mil_ControlTower",
		[
			[[-0.54834,4.29688,-9.62869], ["dvere_spodni_L", "dvere_spodni_R"]],
			[[0.999023,1.03906,-0.915131], "dvere_vrchni"]
		]
	],
	[
		"Land_Gate_Wood1_5",
		[
			[[0.0107422,-0.015625,0.00445938], "DoorR"]
		]
	],
	[
		"Land_Gate_wood2_5",
		[
			[[-0.0722656,0.03125,-0.542114], "DoorR"]
		]
	],
	[
		"Land_Shed_Ind02",
		[
			[[2.68604,-9.96289,-4.62598], ["dvere1L", "dvere1R"]],
			[[-2.00171,10.7129,-4.62598], ["dvere2L", "dvere2R"]]
		]
	],
	[
		"Land_A_TVTower_Base",
		[
			[[5.22119,-0.477051,-22.2336], "dvere1"],
			[[-1.57153,-5.27197,-2.21945], "dvere2"]
		]
	],
	[
		"Land_Hangar_2",
		[
			[[8.56519,-10.0205,-2.56317], ["vrata1", "vrata2"]],
			[[-9.79907,-10.1289,-2.56317], ["dvere1", "dvere2"]]
		]
	],
	[
		"Land_Shed_wooden",
		[
			[[-1.55371,0.0341797,-1.27574], "dvere1"/*x*/, true]
		]
	],
	[
		"Land_A_Office02",
		[
			[[2.19873,-7.33765,-8.15197], ["DoorL", "DoorR"]]
		]
	],
	[
		"Land_rail_station_big",
		[
			[[-3.479,-4.1731,-5.04438], "dvere1"],
			[[-0.0288086,-4.14282,-5.04438], "dvere2"],
			[[-1.74365,6.56543,-4.98034], ["dvere3", "dvere4"]]
		]
	]
]
