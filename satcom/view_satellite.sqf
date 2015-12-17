//script for launch the SATCOM camera

PXS_SatelliteActive = true; //SATCOM is activated

//set view distance
PXS_ViewDistance = viewDistance;
setViewDistance PXS_ViewDistanceNew;

//view dialog interface
PXS_SatelliteDialog = createDialog "PXS_RscSatellite";

//spawn info functions
[] spawn PXS_keyMain;
[] spawn PXS_timeView;
[] spawn PXS_coordinatesView;

//create satellite camera
PXS_SatelliteCamera = "camera" camCreate [0,0,0];
PXS_SatelliteCamera cameraEffect ["internal","back"];
call PXS_updateCamera;

showCinemaBorder false;

//camera effect
ppEffectDestroy PXS_ppColor;
ppEffectDestroy PXS_ppInversion;
ppEffectDestroy PXS_ppGrain;

[2] call PXS_adjustCamera;