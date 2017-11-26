if (isServer) then {

	params [ "_lost_sector" ];

	_combat_readiness_increase = 0;


	if ( _lost_sector in sectors_bigtown ) then {
		_combat_readiness_increase = (floor (random 10)) * GRLIB_difficulty_modifier;
	};

	if ( _lost_sector in sectors_capture ) then {
		_combat_readiness_increase = (floor (random 6)) * GRLIB_difficulty_modifier;
	};

	if ( _lost_sector in sectors_military ) then {
		_combat_readiness_increase = (5 + (floor (random 11))) * GRLIB_difficulty_modifier;
	};

	if ( _lost_sector in sectors_factory ) then {
		_combat_readiness_increase = (3 + (floor (random 7))) * GRLIB_difficulty_modifier;
	};

	if ( _lost_sector in sectors_tower ) then {
		_combat_readiness_increase = (floor (random 4));
	};
	
	if ( GRLIB_passive_income ) then {
 		resources_ammo = resources_ammo + (floor (random 20));
 	};
	
	civ_aggression = civ_aggression + (_combat_readiness_increase * 0.55);
	if ( civ_aggression > 100.0 && GRLIB_difficulty_modifier < 2 ) then { civ_aggression = 100.0 };
	
	combat_readiness = combat_readiness + _combat_readiness_increase;
	if ( combat_readiness > 100.0 && GRLIB_difficulty_modifier <= 2.0 ) then { combat_readiness = 100.0 };
	
	stats_readiness_earned = stats_readiness_earned + _combat_readiness_increase;
	[ [ _lost_sector, 2 ] , "remote_call_sector" ] call BIS_fnc_MP;
	
	blufor_sectors = blufor_sectors - [ _lost_sector ];
	publicVariable "blufor_sectors";
	
	reset_battlegroups_ai = true;
	[] call recalculate_caps;
	stats_sectors_lost = stats_sectors_lost + 1;

	trigger_server_save = true;
};