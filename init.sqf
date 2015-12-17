enableSaving [ false, false ];
diag_log ["------------------------------------------------------------------------------- STEP #1"];
[] call compileFinal preprocessFileLineNumbers "scripts\shared\atlas_manager.sqf";
diag_log ["------------------------------------------------------------------------------- STEP #2"];
[] call compileFinal preprocessFileLineNumbers "scripts\shared\liberation_functions.sqf";
diag_log ["------------------------------------------------------------------------------- STEP #3"];
[] call compileFinal preprocessFileLineNumbers "scripts\shared\init_sectors.sqf";
diag_log ["------------------------------------------------------------------------------- STEP #4"];
[] call compileFinal preprocessFileLineNumbers "scripts\shared\fetch_params.sqf";
diag_log ["------------------------------------------------------------------------------- STEP #5"];
[] call compileFinal preprocessFileLineNumbers "gameplay_constants.sqf";
diag_log ["------------------------------------------------------------------------------- STEP #6"];
[] call compileFinal preprocessFileLineNumbers "classnames.sqf";
diag_log ["------------------------------------------------------------------------------- STEP #7"];

[] call compileFinal preprocessfilelinenumbers "scripts\shared\init_shared.sqf";
diag_log ["------------------------------------------------------------------------------- STEP #8"];

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

//------------------------------------------------ Handle parameters
call St_fnc_setParams;

//["Initialize", [true]] call BIS_fnc_dynamicGroups;
enableSentences false;
enableRadio false;

//------------------------------------------------ Misc
[] call compileFinal preprocessFileLineNumbers "LT\init.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\misc\intLight.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\misc\repair\TAA_init.sqf";
[] call compileFinal preprocessFileLineNumbers "satcom\init_satellite.sqf";