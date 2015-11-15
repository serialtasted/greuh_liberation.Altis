/*
Author: Serialtasted

Last modified: 9/06/2015

Description: preInit settings

		 returns nothing
__________________________________________________________________*/
if (!isServer) exitWith {};

if (PARAMS_TimeofDay isEqualTo -1) then {
	setDate [2014, random ceil 11, random ceil 27, random round 23, 00];
} else {
	setDate [2014, random ceil 11, random ceil 27, PARAMS_TimeofDay, 00];
};