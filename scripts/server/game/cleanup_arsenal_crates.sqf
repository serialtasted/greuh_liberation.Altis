private [ "_nextobject", "_nearestfob" ];

while { true } do {

	sleep 600;

	{
		_nextobject = _x;
		
		if ( (typeof _nextobject) isEqualTo Arsenal_typename ) then {
			_nearestfob = [ getpos _nextobject ] call F_getNearestFob;
			if ( count _nearestfob == 3 ) then {
				if ( ( _nextobject distance _nearestfob > ( 2 * GRLIB_fob_range ) ) && ( _nextobject distance startbase > ( 2 * GRLIB_fob_range ) ) ) then {
					if ( count allPlayers > 0 ) then {
						_nextobject setVariable [ "GRLIB_arsenal_crate_life", ( _nextobject getVariable [ "GRLIB_arsenal_crate_life", 0 ] ) + 1 ];
					};
				};
			} ;

			if (  _nextobject getVariable [ "GRLIB_arsenal_crate_life", 0 ] >= 3 ) then {
				deleteVehicle _nextobject;
			};
		};

		sleep 0.5;
	} foreach (allMissionObjects Arsenal_typename);
};