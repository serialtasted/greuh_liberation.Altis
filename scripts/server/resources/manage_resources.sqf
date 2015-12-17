waitUntil { !isNil "save_is_loaded" };
waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "saved_ammo_res" };
waitUntil { !isNil "saved_intel_res" };

resources_ammo = saved_ammo_res;
resources_intel = saved_intel_res;

while { GRLIB_endgame == 0 } do {
	_base_tick_period = 6000;
	
	if ( count allPlayers > 2 ) then {
		_blufor_mil_sectors = [];
		{
			if ( _x in sectors_military ) then {
				_blufor_mil_sectors pushback _x;
				_base_tick_period = _base_tick_period * 0.95;
			};
		} foreach blufor_sectors;
		
		_base_tick_period = _base_tick_period / GRLIB_resources_multiplier;
		
		if ( _base_tick_period < 300 ) then { _base_tick_period = 300 };
		
		sleep _base_tick_period;
		
		if ( count _blufor_mil_sectors > 0 ) then {
			if ( GRLIB_passive_income ) then {

				_ammo_increase = round ( 35 + (random 35));
				resources_ammo = resources_ammo + _ammo_increase;

			} else {
			
				{
					_ammo_increase = 0;
					_solar_multiplier = 0;
					_is_generator = false;
					_is_device = false;
					_is_solar = false;
					
					{
						if ( AmmoFactory_generator_typename == typeOf _x ) then {
							_is_generator = true;
						};
						
						if ( AmmoFactory_device_typename == typeOf _x ) then {
							_is_device = true;
						};
						
						if ( AmmoFactory_solar_typename == typeOf _x ) then {
							_solar_multiplier = _solar_multiplier + 1;
							_is_solar = true;
						};
					} forEach nearestObjects [(markerpos _x), [], GRLIB_capture_size];
					
					if ( _is_device && _is_generator ) then {
						_ammo_increase = _ammo_increase + round ( 1 + (random 3));
					};
					
					if ( _is_solar && _is_device && _is_generator) then {
						_ammo_increase = _ammo_increase + (round ( 3 + (random 6)) * _solar_multiplier);
					};
					
					systemChat str _ammo_increase;
					resources_ammo = resources_ammo + _ammo_increase;
				} forEach _blufor_mil_sectors;
				
			};
		};
	};
	
	sleep 300;
	
	/*_base_tick_period = 4800;

	if ( count allPlayers > 0 ) then {
	
		_blufor_mil_sectors = [];
		{
			if ( _x in sectors_military ) then {
				_blufor_mil_sectors pushback _x;
				_base_tick_period = _base_tick_period * 0.82;
			};
		} foreach blufor_sectors;

		_base_tick_period = _base_tick_period / GRLIB_resources_multiplier;

		if ( _base_tick_period < 300 ) then { _base_tick_period = 300 };
		
		sleep _base_tick_period;

		if ( count _blufor_mil_sectors > 0 ) then {

			if ( GRLIB_passive_income ) then {

				_ammo_increase = round ( 35 + (random 35));
				resources_ammo = resources_ammo + _ammo_increase;

			} else {

				_spawnsector = ( _blufor_mil_sectors call BIS_fnc_selectRandom );
				_spawnpos = zeropos;
				while { _spawnpos distance zeropos < 1000 } do {
					_spawnpos =  ( [ ( markerpos _spawnsector), random 20, random 360 ] call BIS_fnc_relPos ) findEmptyPosition [ 0, 100, 'B_Heli_Transport_01_F' ];
					if ( count _spawnpos == 0 ) then { _spawnpos = zeropos; };
				};

				_newbox = ammobox_b_typename createVehicle _spawnpos;
				_newbox setVariable ["ace_cargo_size", -1];
				_newbox setpos _spawnpos;
				_newbox setdir (random 360);
				clearWeaponCargoGlobal _newbox;
				clearMagazineCargoGlobal _newbox;
				clearItemCargoGlobal _newbox;
				clearBackpackCargoGlobal _newbox;

				[ [_newbox, 500 ] , "F_setMass" ] call BIS_fnc_MP;
			};
		};
	};*/	
};