private["_pname","_pval","_var","_requireBoolean"];

if ( isMultiplayer ) then {
	GRLIB_difficulty_modifier = ((["Difficulty",1] call bis_fnc_getParamValue) / 100);
	GRLIB_time_factor = ["DayDuration",12] call bis_fnc_getParamValue;
	GRLIB_resources_multiplier = ((["ResourcesMultiplier",1] call bis_fnc_getParamValue) / 100);
	GRLIB_fatigue = ["Fatigue",0] call bis_fnc_getParamValue;
	GRLIB_revive = ["Revive",3] call bis_fnc_getParamValue;
	GRLIB_introduction = ["Introduction",1] call bis_fnc_getParamValue;
	GRLIB_deployment_cinematic = ["DeploymentCinematic",1] call bis_fnc_getParamValue;
	GRLIB_unitcap = ((["Unitcap",1] call bis_fnc_getParamValue) / 100);
	GRLIB_adaptive_opfor = ["AdaptToPlayercount",1] call bis_fnc_getParamValue;
	GRLIB_civilian_activity = ((["Civilians",0] call bis_fnc_getParamValue) / 100);
	GRLIB_teamkill_penalty = ["TeamkillPenalty",0] call bis_fnc_getParamValue;
	GRLIB_build_first_fob = ["FirstFob",0] call bis_fnc_getParamValue;
	GRLIB_param_wipe_savegame_1 = ["WipeSave1",0] call bis_fnc_getParamValue;
	GRLIB_param_wipe_savegame_2 = ["WipeSave2",0] call bis_fnc_getParamValue;
	GRLIB_param_resetelite = ["ResetEliteVehs",0] call bis_fnc_getParamValue;
	GRLIB_param_resetbuildings = ["ResetBuildings",0] call bis_fnc_getParamValue;
	GRLIB_param_removeunits = ["RemoveUnits",0] call bis_fnc_getParamValue;
	GRLIB_passive_income = ["PassiveIncome",0] call bis_fnc_getParamValue;
	GRLIB_permissions_param = ["Permissions",1] call bis_fnc_getParamValue;
	GRLIB_cleanup_vehicles = ["CleanupVehicles",2] call bis_fnc_getParamValue;
	GRLIB_csat_aggressivity = ((["Aggressivity",1] call bis_fnc_getParamValue) / 100);
	GRLIB_weather_param = ["Weather",3] call bis_fnc_getParamValue;
	GRLIB_shorter_nights = ["ShorterNights",0] call bis_fnc_getParamValue;
	GRLIB_ammo_bounties = ["AmmoBounties",0] call bis_fnc_getParamValue;
	GRLIB_civ_penalties = ((["CivPenalties",0] call bis_fnc_getParamValue) / 100);
	GRLIB_remote_sensors = ["DisableRemoteSensors",0] call bis_fnc_getParamValue;
	GRLIB_blufor_defenders = [ "BluforDefenders",1] call bis_fnc_getParamValue;
 	GRLIB_autodanger = [ "Autodanger",0] call bis_fnc_getParamValue;
	GRLIB_maximum_fobs = [ "MaximumFobs",26] call bis_fnc_getParamValue;
	GRLIB_max_squad_size = ["MaxSquadSize",10] call bis_fnc_getParamValue;
	
	GRLIB_allow_redeploy = ["AllowRedeploy",1] call bis_fnc_getParamValue;
	GRLIB_allow_fob_deploy = ["AllowFOBDeploy",1] call bis_fnc_getParamValue;
	GRLIB_allow_mobile_deploy = ["AllowMobileDeploy",1] call bis_fnc_getParamValue;
	GRLIB_halo_param = ["HaloJump",1] call bis_fnc_getParamValue;
} else {
	GRLIB_difficulty_modifier = 2.5;
	GRLIB_time_factor = 12;
	GRLIB_resources_multiplier = 1;
	GRLIB_fatigue = 0;
	GRLIB_revive = 3;
	GRLIB_introduction = 0;
	GRLIB_deployment_cinematic = 0;
	GRLIB_adaptive_opfor = 0;
	GRLIB_unitcap = 0.75;
	GRLIB_civilian_activity = 1;
	GRLIB_teamkill_penalty = 0;
	GRLIB_build_first_fob = 0;
	GRLIB_param_wipe_savegame_1 = 0;
	GRLIB_param_wipe_savegame_2 = 0;
	GRLIB_param_resetelite = 0;
	GRLIB_param_resetbuildings = 0;
	GRLIB_param_removeunits = 0;
	GRLIB_passive_income = 0;
	GRLIB_permissions_param = 1;
	GRLIB_cleanup_vehicles = 2;
	GRLIB_csat_aggressivity = 2.5;
	GRLIB_weather_param = 3;
	GRLIB_shorter_nights = 0;
	GRLIB_ammo_bounties = 1;
	GRLIB_civ_penalties = 1;
	GRLIB_remote_sensors = 0;
	GRLIB_blufor_defenders = 1;
 	GRLIB_autodanger = 0;
	GRLIB_maximum_fobs = 26;
	GRLIB_max_squad_size = 10;
	
	GRLIB_allow_redeploy = 2;
	GRLIB_allow_fob_deploy = 2;
	GRLIB_allow_mobile_deploy = 0;
	GRLIB_halo_param = 1;
};

// -- Boolean Variables
if ( GRLIB_fatigue == 1 ) then { GRLIB_fatigue = true } else { GRLIB_fatigue = false };
if ( GRLIB_introduction == 1 ) then { GRLIB_introduction = true } else { GRLIB_introduction = false };
if ( GRLIB_deployment_cinematic == 1 ) then { GRLIB_deployment_cinematic = true } else { GRLIB_deployment_cinematic = false };
if ( GRLIB_build_first_fob == 1 ) then { GRLIB_build_first_fob = true } else { GRLIB_build_first_fob = false };
if ( GRLIB_teamkill_penalty == 1 ) then { GRLIB_teamkill_penalty = true } else { GRLIB_teamkill_penalty = false };
if ( GRLIB_adaptive_opfor == 1 ) then { GRLIB_adaptive_opfor = true } else { GRLIB_adaptive_opfor = false };
if ( GRLIB_passive_income == 1 ) then { GRLIB_passive_income = true } else { GRLIB_passive_income = false };
if ( GRLIB_permissions_param == 1 ) then { GRLIB_permissions_param = true } else { GRLIB_permissions_param = false };
if ( GRLIB_shorter_nights == 1 ) then { GRLIB_shorter_nights = true } else { GRLIB_shorter_nights = false };
if ( GRLIB_ammo_bounties == 1 ) then { GRLIB_ammo_bounties = true } else { GRLIB_ammo_bounties = false };
if ( GRLIB_param_resetelite == 1 ) then { GRLIB_param_resetelite = true } else { GRLIB_param_resetelite = false };
if ( GRLIB_blufor_defenders == 1 ) then { GRLIB_blufor_defenders = true } else { GRLIB_blufor_defenders = false };
if ( GRLIB_autodanger == 1 ) then { GRLIB_autodanger = true } else { GRLIB_autodanger = false };

// -- Ace 3 Parameters
_requireBoolean = ["ace_map_BFT_Enabled", "ace_medical_enableAdvancedWounds", "ace_advanced_ballistics_enabled"];
{
	_pname = configName ((missionConfigFile >> "Params") select _ForEachIndex);
	_pval = paramsArray select _ForEachIndex;
	
	_tempname = toArray _pname; _tempname resize 3;
	if ( toString _tempname == "ace" ) then {
		if ( _pval > 5 ) then { _pval = _pval * 0.1 };
		if ( _pname in _requireBoolean ) then { _pval = if (_pval isEqualTo 0) then {false} else {true} };
		
		_var = format["%1 = %2", _pname, _pval];
		call compileFinal _var;
	};
} forEach paramsArray;