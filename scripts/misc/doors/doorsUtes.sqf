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
		"Land_Barrack2",
		[
			[[-0.0185547,-3.56348,-0.694138], "door", true]
		]
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
		"Land_Wall_Gate_Wood1",
		[
			[[-0.0551758,-0.0253906,-0.174713], "DoorR"]
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
		"Land_Wall_Gate_Ind2B_L",
		[
			[[-0.00195313,-0.0205078,-0.956818], "DoorL"]
		],
		DOOR_RADIUS_LARGE
	],
	[
		"Land_Wall_Gate_Ind2B_R",
		[
			[[-0.0302734,-0.0214844,-0.953461], "DoorR"]
		],
		DOOR_RADIUS_LARGE
	],
	[
		"Land_Gate_Wood1_5",
		[
			[[0.0107422,-0.015625,0.00445938], "DoorR"]
		]
	],
	[
		"Land_Mil_ControlTower",
		[
			[[-0.54834,4.29688,-9.62869], ["dvere_spodni_L", "dvere_spodni_R"]],
			[[0.999023,1.03906,-0.915131], "dvere_vrchni"]
		]
	]
]
