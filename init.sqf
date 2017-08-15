enableSaving [ false, false ];

diag_log ["------------------------------------------------------------------------------- STEP #1 : Set Legacy Variables"];
if( isNil "ussfreedom" ) then { ussfreedom = objNull };
if( isNil "medicalpod" ) then { medicalpod = objNull };
"huronmarker" setMarkerAlpha 0;


diag_log ["------------------------------------------------------------------------------- STEP #2 : Initialize Functions"];
[] call compileFinal preprocessFileLineNumbers "scripts\shared\liberation_functions.sqf";


diag_log ["------------------------------------------------------------------------------- STEP #3 : Initialize Sectors"];
[] call compileFinal preprocessFileLineNumbers "scripts\shared\init_sectors.sqf";


diag_log ["------------------------------------------------------------------------------- STEP #4 : Fetch Paramters"];
[] call compileFinal preprocessFileLineNumbers "scripts\shared\fetch_params.sqf";


diag_log ["------------------------------------------------------------------------------- STEP #5 : Gameplay Constants"];
[] call compileFinal preprocessFileLineNumbers "gameplay_constants.sqf";


diag_log ["------------------------------------------------------------------------------- STEP #6 : Initialize Classnames"];
_presetFile = format["presets\classnames_%1.sqf", GRLIB_worldType];
[] call compileFinal preprocessFileLineNumbers _presetFile;
[] call compileFinal preprocessFileLineNumbers "presets\common.sqf";


diag_log ["------------------------------------------------------------------------------- STEP #7 : Initialize Shared Scripts"];
[] call compileFinal preprocessfilelinenumbers "scripts\shared\init_shared.sqf";


diag_log ["------------------------------------------------------------------------------- STEP #8 : Initialize Server and Client scripts and functions"];

//------------------------------------------------ Initialize whitelist
[] call Whitelist;


//------------------------------------------------ Build list of ignored markers
GRLIB_ignored_markers = allMapMarkers;


//------------------------------------------------ Initialize server, client and HC
if (isServer) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
	waitUntil { alive player };
	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
};

enableSentences false;
enableRadio false;
enableEngineArtillery true;


//------------------------------------------------ Misc
[] call compileFinal preprocessFileLineNumbers "CS\init.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\misc\repair\TAA_init.sqf";