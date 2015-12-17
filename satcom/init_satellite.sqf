//compile functions and variables for SATCOM
//v1.0 A3

//variables
PXS_SatelliteInitialHeight = 1200; //height of camera
PXS_SatelliteFOV = 0.2; //default FOV 
PXS_SatelliteZoom = 37; //default in zoom range
PXS_SatelliteNorthMovementDelta = 0;
PXS_SatelliteSouthMovementDelta = 0;
PXS_SatelliteEastMovementDelta = 0;
PXS_SatelliteWestMovementDelta = 0;
PXS_ViewDistance = 0; //view distance (storage of old value)
PXS_ViewDistanceNew = 3000; //view distance while SATCOM is launched
PXS_TimeZone = "[UTC+2]"; //time zone

//compile functions
PXS_timeFunction = compile preprocessFileLineNumbers "satcom\time_function.sqf";
PXS_timeView = compile preprocessFileLineNumbers "satcom\time_view.sqf";
PXS_coordinatesFunction = compile preprocessFileLineNumbers "satcom\coordinates_function.sqf";
PXS_coordinatesView = compile preprocessFileLineNumbers "satcom\coordinates_view.sqf";
PXS_adjustCamera = compile preprocessFileLineNumbers "satcom\adjustCamera.sqf";
PXS_updateCamera = compile preprocessFileLineNumbers "satcom\updateCamera.sqf";
PXS_closeCamera = compile preprocessFileLineNumbers "satcom\closeCamera.sqf";
PXS_viewSatellite = compile preprocessFileLineNumbers "satcom\view_satellite.sqf";
PXS_keyEventFunction = compile preprocessFileLineNumbers "satcom\key_function.sqf";
PXS_mouseZChanged = compile preprocessFileLineNumbers "satcom\mouseZChanged.sqf";
PXS_keyMain = compile preprocessFileLineNumbers "satcom\key_main.sqf";
PXS_startSatellite = compile preprocessFileLineNumbers "satcom\start_satellite.sqf";
PXS_switcher = compile preprocessFileLineNumbers "satcom\switcher.sqf";
PXS_redefineDefaultPos = compile preprocessFileLineNumbers "satcom\redefine_position.sqf";