waitUntil { !isNil "save_is_loaded" };

please_recalculate = true;

while { true } do {
	waitUntil { please_recalculate };
	please_recalculate = false;

	[] call recalculate_caps;

	_new_manpower_used = 0;
	_new_fuel_used = 0;

	{
		if ( ( side group _x == GRLIB_side_friendly ) && ( !isPlayer _x ) ) then {
			if ( ( _x getVariable ["ALLOWRECYCLE", false] ) && ( _x distance ( getmarkerpos GRLIB_respawn_marker) > 50 ) && ( alive _x ) ) then {
				_unit = _x;
				{
					if ( ( _x select 0 ) == typeof _unit ) then {
						_new_manpower_used = _new_manpower_used + (_x select 1);
						_new_fuel_used = _new_fuel_used + (_x select 3);
					};
				} foreach infantry_units;
			};
		};
	} foreach allUnits;

	{
		if ( ( _x getVariable ["ALLOWRECYCLE", false] ) && ( alive _x ) ) then {
			_unit = _x;
			{
				if ( ( _x select 0 ) == typeof _unit ) then {
					_new_manpower_used = _new_manpower_used + (_x select 1);
					_new_fuel_used = _new_fuel_used + (_x select 3);
				};
			} foreach ( buildings + light_vehicles + heavy_vehicles + air_vehicles + static_vehicles + support_vehicles + medical_type + repair_type + barracks_type );

		};
	} foreach vehicles;

	resources_infantry = _new_manpower_used;
	resources_fuel = _new_fuel_used;
};