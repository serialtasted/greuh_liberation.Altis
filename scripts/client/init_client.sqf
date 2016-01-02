if (!hasInterface) exitWith {}; // headless client exit
waitUntil { alive player };

// initialize playerRank global var
playerRank = "";

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
	playableUnitOccupier_PV = _this select 0; publicVariableServer "playableUnitOccupier_PV";
}];

// add arsenal items
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\classes\arsenal\#all_US.sqf";

// setup ACE3
player setVariable ["ACE_canMoveRallypoint", false];

// initialize objects on client side
[false] execVM "scripts\misc\initObjects.sqf";

// handle parameters
call St_fnc_setParams;

// add pp effect
["EastWind"] call BIS_fnc_setPPeffectTemplate;

// camera restriction
[] spawn compileFinal preprocessFileLineNumbers "scripts\misc\restrict_view.sqf";

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

respawn_lhd = compileFinal preprocessFileLineNumbers "scripts\client\spawn\respawn_lhd.sqf";
spawn_camera = compileFinal preprocessFileLineNumbers "scripts\client\spawn\spawn_camera.sqf";
cinematic_camera = compileFinal preprocessFileLineNumbers "scripts\client\ui\cinematic_camera.sqf";
write_credit_line = compileFinal preprocessFileLineNumbers "scripts\client\ui\write_credit_line.sqf";

[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\action_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\intel_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\recycle_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\unflip_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\classes\arsenal_restrictor.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\build\build_overlay.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\build\do_build.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\fob_markers.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\hostile_groups.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\sector_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\spot_timer.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\broadcast_squad_colors.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\disable_remote_sensors.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\offload_diag.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\permissions_warning.sqf";
//[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\resupply_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\secondary_jip.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\stay_leader.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\stop_renegade.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\synchronise_vars.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\update_comms.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\vehicle_permissions.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\player\dead_cam.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\player\save_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\ui_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\tutorial_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\classes\class_manager.sqf";

player addMPEventHandler ["MPKilled", {_this spawn kill_manager}];

{
	[_x] call BIS_fnc_drawCuratorLocations;
} foreach allCurators;

[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\intro.sqf";