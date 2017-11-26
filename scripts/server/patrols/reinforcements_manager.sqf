if ( combat_readiness > 15 ) then {

	params [ "_targetsector" ];
	_init_units_count = ( ([ getmarkerpos _targetsector , GRLIB_capture_size , GRLIB_side_enemy ] call F_getUnitsCount) );

	if ( !(_targetsector in sectors_bigtown)) then {
		while { (_init_units_count * 0.75) <=  ( [ getmarkerpos _targetsector , GRLIB_capture_size , GRLIB_side_enemy ] call F_getUnitsCount ) } do {
			sleep 5;
		};
	};

	if ( _targetsector in active_sectors ) then {

		_nearestower = [markerpos _targetsector, GRLIB_side_enemy, GRLIB_radiotower_size * 1.4] call F_getNearestTower;

		if ( _nearestower != "" ) then {
			_reinforcements_time = (((((markerpos _nearestower) distance (markerpos _targetsector)) / 1000) ^ 1.66 ) * 120) / (GRLIB_difficulty_modifier * GRLIB_csat_aggressivity);
			if (_targetsector in sectors_bigtown) then {
				_reinforcements_time = _reinforcements_time * 0.35;
			};
			_current_timer = time;

			waitUntil { sleep 0.3; (_current_timer + _reinforcements_time < time) || (_targetsector in blufor_sectors) || (_nearestower in blufor_sectors) };

			sleep 15;

			if ( (_targetsector in active_sectors) && !(_targetsector in blufor_sectors) && !(_nearestower in blufor_sectors) && (!([] call F_isBigtownActive) || _targetsector in sectors_bigtown)  ) then {
				reinforcements_sector_under_attack = _targetsector;
				reinforcements_set = true;
				
				[ [ "lib_reinforcements" , [ markertext  _targetsector ] ] , "bis_fnc_shownotification" ] call BIS_fnc_MP;
				
				_rValue = 2;
				if ( (random combat_readiness) > (20 + (30 / GRLIB_csat_aggressivity) ) ) then {
					_rvalue = 4;
				};
				
				_randomInt = round(random _rValue);
				for "_i" from 0 to _randomInt do {
					[markerpos _targetsector, GRLIB_side_enemy, true, false, 1400, "random", true, 250, 200, 6, 0.2, 60, false, false, false, true, _targetsector, false, "default", nil, "this addMPEventHandler ['MPKilled', {_this spawn kill_manager}]", 1, false] spawn F_LVheliParadrop;
				};
				stats_reinforcements_called = stats_reinforcements_called + 1;
			};
		};
	};
};

