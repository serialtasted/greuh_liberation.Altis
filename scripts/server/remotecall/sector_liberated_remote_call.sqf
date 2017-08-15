if (isServer) then {

	params [ "_liberated_sector" ];

	_combat_readiness_increase = 0;


	if ( _liberated_sector in sectors_bigtown ) then {
		_combat_readiness_increase = (floor (random 10)) * GRLIB_difficulty_modifier;
	};

	if ( _liberated_sector in sectors_capture ) then {
		_combat_readiness_increase = (floor (random 6)) * GRLIB_difficulty_modifier;
	};

	if ( _liberated_sector in sectors_military ) then {
		_combat_readiness_increase = (5 + (floor (random 11))) * GRLIB_difficulty_modifier;
	};

	if ( _liberated_sector in sectors_factory ) then {
		_combat_readiness_increase = (3 + (floor (random 7))) * GRLIB_difficulty_modifier;
	};

	if ( _liberated_sector in sectors_tower ) then {
		_combat_readiness_increase = (floor (random 4));
	};
	
	if ( GRLIB_passive_income ) then {
 		resources_ammo = resources_ammo + (floor (random 20));
 	};

	combat_readiness = combat_readiness + _combat_readiness_increase;
	if ( combat_readiness > 100.0 && GRLIB_difficulty_modifier <= 2.0 ) then { combat_readiness = 100.0 };
	stats_readiness_earned = stats_readiness_earned + _combat_readiness_increase;
	[_liberated_sector, 0] remoteExec ["remote_call_sector"];

	reset_battlegroups_ai = true; publicVariable "reset_battlegroups_ai";

	blufor_sectors pushback _liberated_sector; publicVariable "blufor_sectors";
	stats_sectors_liberated = stats_sectors_liberated + 1;

	[] call recalculate_caps;
	[] spawn check_victory_conditions;

	sleep 1;
	
	if ( (random combat_readiness) > (20 + (30 / GRLIB_csat_aggressivity) ) || _liberated_sector in sectors_bigtown ) then {
		[markerpos _liberated_sector, GRLIB_capture_size, false, round(random [0,2,4]), round(random [4,8,12]), round(random [3,5,7]), round(random [15,30,45])] spawn F_mortarAttack;
	};
	
	if ( GRLIB_blufor_defenders && GRLIB_delay_allow_defenders ) then {
		//[markerpos _liberated_sector, false, GRLIB_side_friendly, 3, false, true, _liberated_sector, "random", 1400, true, false, 6, "default", [false,false,true,false], nil, "this addMPEventHandler ['MPKilled', {_this spawn kill_manager}]", 2, false] spawn F_LVreinforcementChopper;
		
		_rValue = 1;
		if ( (random combat_readiness) > (20 + (30 / GRLIB_csat_aggressivity) ) ) then {
			_rvalue = 3;
		};
		
		_randomInt = round(random _rValue);
		for "_i" from 0 to _randomInt do {
			[markerpos _liberated_sector, GRLIB_side_friendly, true, false, 1400, "random", true, 250, 200, 6, 0.2, 130, false, false, false, true, _liberated_sector, false, "default", nil, "this addMPEventHandler ['MPKilled', {_this spawn kill_manager}]", 1, false] spawn F_LVheliParadrop;
		};
		
		[] spawn {
			GRLIB_delay_allow_defenders = false;
			sleep 600;
			GRLIB_delay_allow_defenders = true;
		};
	};

	trigger_server_save = true;

	sleep 45;

	if ( GRLIB_endgame == 0 ) then {
		if ( (!( _liberated_sector in sectors_tower )) && (((random (200.0 / (GRLIB_difficulty_modifier * GRLIB_csat_aggressivity) )) < (combat_readiness - 20)) || ( _liberated_sector in sectors_bigtown )) && ([] call F_opforCap < GRLIB_battlegroup_cap) ) then {
			[ _liberated_sector ] spawn spawn_battlegroup;
		};
	};
};