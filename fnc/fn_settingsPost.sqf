/*
Author: Serialtasted

Last modified: 9/06/2015

Description: postInit settings

		returns nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

// safezone setup
"safezone_1" setMarkerAlpha 0;
"safezone_2" setMarkerAlpha 0;
"huronmarker" setMarkerAlpha 0;

// initialize objects after load
[true] execVM "scripts\misc\initObjects.sqf";