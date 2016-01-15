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
		"Land_House_L_8_EP1",
		[
			[[-4.22168,0.881226,-1.10075], "Dvere1", true],
			[[-0.330811,-2.14136,-1.59706], "Dvere2", true]
		]
	],
	[
		"Land_House_L_7_EP1",
		[
			[[0.895752,4.34277,-0.0942535], "Dvere1", true]
		]
	],
	[
		"Land_House_L_4_EP1",
		[
			[[6.15723,-0.591797,-1.11998], "Dvere1", true]
		]
	],
	[
		"Land_House_L_3_EP1",
		[
			[[-2.87427,-1.03711,-0.249451], "Dvere1", true],
			[[2.15051,-1.03247,-0.222488], ["Dvere2", "Dvere3"], [true, true]]
		]
	],
	[
		"Land_House_K_6_EP1",
		[
			[[-1.33029,-1.60327,-1.4765], "Dvere1", true],
			[[-1.13531,-1.6106,4.49858], "Dvere2", true],
			[[5.5174,5.14844,-1.53729], "Dvere3", true]
		]
	],
	[
		"Land_House_K_3_EP1",
		[
			[[-5.05005,-3.42703,-0.810303], "Dvere1", true],
			[[2.9209,5.19992,-0.523315], "Dvere2", true],
			[[1.42725,2.76184,2.99969], "Dvere3", true]
		]
	],
	[
		"Land_House_K_1_EP1",
		[
			[[-0.762909,2.25415,1.56625], "Dvere1", true]
		]
	],
	[
		"Land_House_K_8_EP1",
		[
			[[-0.859131,-2.70093,-2.54048], "Dvere1", true],
			[[1.50659,4.45374,-2.60072], "Dvere2", true],
			[[-1.35767,-1.42102,0.590027], "Dvere3", true]
		]
	],
	[
		"Land_House_L_6_EP1",
		[
			[[-4.76807,0.986359,-1.51956], "Dvere1", true]
		]
	],
	[
		"Land_House_K_5_EP1",
		[
			[[-0.974854,0.691162,1.5269], "Dvere1", true]
		]
	],
	[
		"Land_House_C_1_v2_EP1",
		[
			[[-3.19141,-2.63721,-1.35547], "Dvere1", true],
			[[-2.0437,2.77515,-1.35548], "Dvere2", true],
			[[-7.58203,3.62793,-1.35547], "Dvere3", true],
			[[-6.4425,-3.0083,-1.35547], "Dvere4", true]
		]
	],
	[
		"Land_House_C_12_EP1",
		[
			[[-4.39404,-7.38721,-3.51102], "Dvere1", true],
			[[3.66992,-7.3562,-3.51102], "Dvere2", true],
			[[5.47485,-4.47583,-3.51102], "Dvere3", true]
		]
	],
	[
		"Land_Wall_L1_gate_EP1",
		[
			[[0.0222168,0.368408,-0.523605], ["Dvere1", "Dvere2"], [true, true]]
		]
	],
	[
		"Land_House_C_2_EP1",
		[
			[[-3.54004,-2.32837,-2.29343], ["Dvere1", "Dvere2"], [true, true]],
			[[5.45654,-2.25244,-2.3127], "Dvere3", true],
			[[5.14526,4.14404,-2.3127], "Dvere4", true],
			[[-2.46436,4.22925,-2.27092], "Dvere5", true]
		]
	],
	[
		"Land_House_C_10_EP1",
		[
			[[-0.990234,4.36182,-4.1722], "Dvere1", true],
			[[2.03174,0.0561523,-4.17734], "Dvere2", true],
			[[3.83862,-8.7334,-4.18428], "Dvere3", true],
			[[3.92603,-8.69971,-0.776352], "Dvere4", true],
			[[1.48926,-8.12061,-0.869232], "Dvere5", true],
			[[1.50293,1.48901,-0.869125], "Dvere6", true],
			[[-4.12842,-8.7793,-0.54213], "Dvere7", true],
			[[-4.06616,5.51123,-0.506973], "Dvere8", true]
		]
	],
	[
		"Land_House_C_5_EP1",
		[
			[[-4.85352,-3.82471,-0.753708], "Dvere1", true],
			[[4.82104,3.20264,-0.780563], "Dvere2", true]
		]
	],
	[
		"Land_House_C_1_EP1",
		[
			[[-3.22412,-4.13208,-0.92775], "Dvere1", true],
			[[-2.03149,1.22681,-0.92775], "Dvere2", true],
			[[-7.59131,2.03735,-0.92775], "Dvere3", true]
		]
	],
	[
		"Land_House_C_9_EP1",
		[
			[[3.75269,5.57153,-3.74944], "Dvere1", true],
			[[-3.58423,-3.84937,-0.152176], "Dvere2", true],
			[[4.08032,-3.61694,2.5787], "Dvere3", true]
		]
	],
	[
		"Land_House_K_7_EP1",
		[
			[[-7.81055,0.348022,0.558914], "Dvere1", true],
			[[0.57666,3.8479,-0.218369], "Dvere2", true],
			[[0.631836,3.80249,3.29031], "Dvere3", true],
			[[-6.08813,1.43872,3.29031], "Dvere4", true]
		]
	],
	[
		"Land_House_C_4_EP1",
		[
			[[-4.40894,5.20166,-3.44356], "Dvere1", true],
			[[1.59375,-4.09595,-3.45354], "Dvere2", true],
			[[-3.91895,-2.01807,-0.35051], "Dvere3", true],
			[[-5.37427,1.64331,-0.349152], "Dvere4", true]
		]
	],
	[
		"Land_House_C_11_EP1",
		[
			[[2.79565,2.35522,-2.08453], "Dvere1", true]
		]
	],
	[
		"Land_House_C_3_EP1",
		[
			[[-7.86719,-4.14648,-3.86868], "Dvere1", true],
			[[-0.0224609,-4.02783,-4.02466], ["Dvere2", "Dvere3"], [true, true]],
			[[6.47559,-3.39648,-3.91483], "Dvere4", true],
			[[4.60742,4.56982,-3.91481], "Dvere5", true],
			[[-7.98047,4.50977,-3.86868], "Dvere6", true],
			[[3.25098,-0.128418,4.19785], "Dvere7", true]
		]
	],
	[
		"Land_House_C_5_V1_EP1",
		[
			[[-4.76953,-3.80249,-1.423], "Dvere1", true],
			[[4.87695,3.21875,-1.44987], "Dvere2", true]
		]
	],
	[
		"Land_Ind_FuelStation_Build_EP1",
		[
			[[-0.0214844,-1.68457,-1.336], "door_1", true],
			[[1.52539,1.93262,-1.33611], "door_2", true]
		]
	],
	[
		"Land_Mil_Barracks_i_EP1",
		[
			[[6.81152,1.96436,-1.09824], "Door_01", true],
			[[1.67676,0.800781,-1.09822], "Door_03", true],
			[[-1.50781,0.772461,-1.09824], "Door_04", true],
			[[-4.7002,0.854492,-1.09824], "Door_05", true],
			[[-7.94678,0.846191,-1.09824], "Door_06", true]
		]
	],
	[
		"Land_Ind_Garage01_EP1",
		[
			[[1.19238,-2.35254,-1.57217], ["dvere1", "dvere2"], [true, true]]
		],
		DOOR_RADIUS_LARGE
	],
	[
		"Land_Misc_Cargo1Ao_EP1",
		[
			[[0.0649414,-2.89795,-1.09224], ["door_1_1", "door_1_2"], [true, true]]
		]
	],
	[
		"Land_Misc_Cargo1Bo_EP1",
		[
			[[0.0725098,-3.04395,-1.21188], ["door_1_1", "door_1_2"], [true, true]],
			[[0.102783,3.12305,-1.20029], ["door_2_1", "door_2_2"], [true, true]]
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
		"Land_Ind_Coltan_Main_EP1",
		[
			[[-11.0732,11.0544,-6.24667], "Dvere1", true],
			[[-6.23145,8.29346,-6.27167], "Dvere2", true]
		]
	],
	[
		"Land_Barrack2",
		[
			[[-0.0185547,-3.56348,-0.694138], "door", true]
		]
	],
	[
		"Land_House_C_5_V3_EP1",
		[
			[[-4.78125,-3.81738,-1.423], "Dvere1", true],
			[[4.81177,3.21924,-1.44986], "Dvere2", true]
		]
	],
	[
		"Land_House_C_5_V2_EP1",
		[
			[[-4.78125,-3.81738,-1.423], "Dvere1", true],
			[[4.81177,3.21924,-1.44986], "Dvere2", true]
		]
	],
	[
		"Land_A_Mosque_big_hq_EP1",
		[
			[[0.437012,-10.1455,-9.31998], ["Dvere1", "Dvere2"], [true, true]],
			[[0.446289,10.2051,-9.31998], ["Dvere3", "Dvere4"], [true, true]],
			[[-8.58936,-9.97021,-9.31998], "Dvere5", true],
			[[9.44629,-9.98389,-9.31999], "Dvere6", true],
			[[11.7021,0.0532227,-9.31998], "Dvere7", true],
			[[9.42139,10.0488,-9.31998], "Dvere8", true],
			[[-8.61816,10.0332,-9.31998], "Dvere9", true],
			[[-10.8579,0.0395508,-9.31998], "Dvere10", true],
			[[-8.65576,-9.9917,-4.04752], "Dvere11", true],
			[[9.50635,-9.97363,-4.04752], "Dvere12", true],
			[[9.46826,10.0254,-4.04752], "Dvere13", true],
			[[-8.67188,10.0356,-4.04752], "Dvere14", true]
		]
	],
	[
		"Land_A_Mosque_big_addon_EP1",
		[
			[[8.43262,0.102539,-6.38554], "Dvere1", true]
		]
	],
	[
		"Land_Wall_L3_gate_EP1",
		[
			[[0.362305,0.000488281,-1.22949], ["Dvere1", "Dvere2"]]
		],
		DOOR_RADIUS_LARGE
	],
	[
		"Land_Mil_ControlTower_EP1",
		[
			[[-0.54834,4.29688,-9.62869], ["dvere_spodni_L", "dvere_spodni_R"]],
			[[0.999023,1.03906,-0.915131], "dvere_vrchni"]
		]
	]
]
