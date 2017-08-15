if ( GRLIB_endgame == 1 ) exitWith {};

private [ "_bg_groups", "_target_size", "_vehicle_pool" ];
_bg_groups = [];

last_battlegroup_size = 0;
_spawn_marker = "";
if ( count _this == 1 ) then {
	_spawn_marker = [ 2500, 5000, true, _this select 0 ] call F_findOpforSpawnPoint;
} else {
	_spawn_marker = [ 2500, 5000, true ] call F_findOpforSpawnPoint;
};


_vehicle_pool = opfor_battlegroup_vehicles;
if ( combat_readiness < 50 ) then {
	_vehicle_pool = opfor_battlegroup_vehicles_low_intensity;
};

if ( _spawn_marker != "" ) then {

	GRLIB_last_battlegroup_time = time;

	_selected_opfor_battlegroup = [];
	_target_size = GRLIB_battlegroup_size * ([] call F_adaptiveOpforFactor) * (sqrt GRLIB_csat_aggressivity);
	if ( _target_size >= 10 ) then { _target_size = 10 };
	if ( combat_readiness < 60 ) then { _target_size = round (_target_size * 0.65) };
	while { count _selected_opfor_battlegroup < _target_size } do {
		_selected_opfor_battlegroup pushback (_vehicle_pool call BIS_fnc_selectRandom);
	};

	[ _spawn_marker ] remoteExec ["remote_call_battlegroup"];
	
	diag_log format["### BATTLEGROUP"];
	diag_log format["### SELECTED %1", _selected_opfor_battlegroup];

	{
		_nextgrp = createGroup GRLIB_side_enemy;
		_vehicle = [markerpos _spawn_marker, _x] call F_libSpawnVehicle;
		sleep 0.5;
		(crew _vehicle) joinSilent _nextgrp;
		[_nextgrp] spawn battlegroup_ai;
		_bg_groups pushback _nextgrp;
		if ( ( _x in opfor_troup_transports ) &&  ( [] call F_opforCap < GRLIB_battlegroup_cap ) ) then {
			[_vehicle, true] spawn troup_transport;
		};
		last_battlegroup_size = last_battlegroup_size + 1;
	} foreach _selected_opfor_battlegroup;

	if ( combat_readiness >= 60 ) then {
		diag_log format["## SPAWNING PARADROP UNITS"];
		
		_randomInt = round(random 5);
		_spawn_pos = markerpos _spawn_marker;
		_target_pos = ([_spawn_pos] call F_getNearestBluforObjective) select 0;
		
		for "_i" from 0 to _randomInt do {
			diag_log format["# HELIPARADROP"];
			[_target_pos, GRLIB_side_enemy, true, false, ((_target_pos distance2D _spawn_pos) + random [100,300,600]), _target_pos getDir _spawn_pos, true, 250, round(random[300,450,600]), 6, 0.2, 130, false, false, false, true, (_this select 0), false, "default", nil, nil, 1, false] spawn F_LVheliParadrop;
			sleep 4;
		};
	};
	
	if ( combat_readiness >= 90 ) then {
		diag_log format["## SPAWNING AIR UNITS"];
		[([markerpos _spawn_marker] call F_getNearestBluforObjective) select 0] spawn spawn_air;
	};

	sleep 5;

	combat_readiness = combat_readiness - (round ((last_battlegroup_size / 2) + (random (last_battlegroup_size / 2))));
	if ( combat_readiness < 0 ) then { combat_readiness = 0 };

	stats_hostile_battlegroups = stats_hostile_battlegroups + 1;

	{
		if ( local _x ) then {
			_headless_client = [] call F_lessLoadedHC;
			if ( !isNull _headless_client ) then {
				_x setGroupOwner ( owner _headless_client );
			};
		};
		sleep 3;

	} foreach _bg_groups;
};


