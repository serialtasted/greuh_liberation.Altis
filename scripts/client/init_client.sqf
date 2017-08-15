if (!hasInterface) exitWith {}; // headless client exit
waitUntil { alive player };

// initialize playerRank global var
playerRank = "";

// Wait for game to load
waitUntil {
	titleText ["Loading game... Please wait while the server loads the game.", "BLACK FADED"];
	player enableSimulation false;
	if ( !isNil "save_is_loaded" ) exitWith { true };
};

// TFAR Plugin check
if((getPlayerUID player) != "_SP_PLAYER_") then { 
	waitUntil {
		titleText ["Detecting TFR... (Make sure that your TaskForce Radio plugin is enabled on TeamSpeak!)", "BLACK FADED"];
		player enableSimulation false;
		if ( call TFAR_fnc_isTeamSpeakPluginEnabled ) exitWith { true };
	};
};

// handle player id during session
playableUnitOccupier_PV = player; publicVariableServer "playableUnitOccupier_PV";	
player addEventHandler ["Respawn", {	
	(_this select 0) setVariable ["ACE_isUnconscious", false];
	
	[GRLIB_worldType] call F_applyColorCorrection;
	
	playableUnitOccupier_PV = _this select 0; publicVariableServer "playableUnitOccupier_PV";
	
	playerTeam = (_this select 1) getVariable ["St_team", "PTr_alpha"];  [playerTeam] call F_setPlayerTeam;
	[ _this select 1, format["%1FlagWS", [_this select 1] call F_getPlayerCountry] ] remoteExec ["BIS_fnc_setUnitInsignia", 0, true];
	
	[_this select 1] spawn {
		sleep 120;
		deleteVehicle (_this select 0);
	};
}];

// fix arsenal options and actions
[] spawn {
	while {true} do {
		player removeAction (player getVariable ["bis_fnc_arsenal_action", 0]);
		waitUntil { player getVariable ["bis_fnc_arsenal_action", 0] != 0 };
	};
};

[ missionNamespace, "arsenalOpened", {
    disableSerialization;
    _display = _this select 0;
    {
        ( _display displayCtrl _x ) ctrlSetText "Not Available";
        ( _display displayCtrl _x ) ctrlSetTooltip ("");
        ( _display displayCtrl _x ) ctrlSetTextColor [ 0.7, 0.7, 0.7, 0.25 ];
        ( _display displayCtrl _x ) ctrlRemoveAllEventHandlers "buttonclick";
    }forEach [ 44145, 44146, 44147, 44148, 44149 ];
} ] call BIS_fnc_addScriptedEventHandler;

// setup ACE3
player setVariable ["ACE_canMoveRallypoint", false];

// color correction
[GRLIB_worldType] call F_applyColorCorrection;


// camera restriction
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\restrict_view.sqf";

// carry on...
player enableSimulation true;

[] spawn compileFinal preprocessFileLineNumbers "scripts\client\group\group_manager.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\client\misc\init_markers.sqf";

if ( typeOf player == "VirtualSpectator_F" ) exitWith {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\empty_vehicles_marker.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\fob_markers.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\group_icons.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\hostile_groups.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\huron_marker.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\sector_manager.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\spot_timer.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\synchronise_vars.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\ui_manager.sqf";
};

spawn_camera = compileFinal preprocessFileLineNumbers "scripts\client\spawn\spawn_camera.sqf";
cinematic_camera = compileFinal preprocessFileLineNumbers "scripts\client\ui\cinematic_camera.sqf";
write_credit_line = compileFinal preprocessFileLineNumbers "scripts\client\ui\write_credit_line.sqf";
do_load_box = compileFinal preprocessFileLineNumbers "scripts\client\ammoboxes\do_load_box.sqf";

[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\action_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\intel_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\recycle_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\unflip_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\build\build_overlay.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\build\do_build.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\fob_markers.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\hostile_groups.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\aircall_markers.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\medical_markers.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\sector_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\spot_timer.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\broadcast_squad_colors.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\disable_remote_sensors.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\fire_control.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\offload_diag.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\permissions_warning.sqf";
//[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\resupply_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\secondary_jip.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\stay_leader.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\stop_renegade.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\synchronise_vars.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\update_comms.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\vehicle_comms.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\vehicle_permissions.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\pilotCheck.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\lowerWeapon.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\player\dead_cam.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\player\medical_facility.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\player\save_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\ui_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\tutorial_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\classes\class_manager.sqf";

// player event handlers
player addMPEventHandler ["MPKilled", {
	_this spawn kill_manager;
}];

player addEventHandler ["TaskSetAsCurrent",{
	_newTask = "";
	_tmp1 = format ["%1", _this select 1];
	_tmp2 = _tmp1 splitString " ";
	_tmpNewTask = _tmp2 select 1;
	_tmpUnit = _this select 0;
	GRLIB_addUnitTask = [_tmpUnit,_tmpNewTask];
	publicVariableServer "GRLIB_addUnitTask";
}];

player addEventHandler ["GetInMan", {[_this select 2] execVM "scripts\client\misc\fuel_consumption.sqf";}];

{
	[_x] call BIS_fnc_drawCuratorLocations;
} foreach allCurators;

[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\intro.sqf";