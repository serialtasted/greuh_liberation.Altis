private [ "_markers", "_marker", "_idx" ];

_markers = [];

uiSleep 3;

while { true } do {
	
	_idx = 1;
	
	{ deleteMarkerLocal _x } foreach _markers;
	
	{
		if ( alive _x && !((driver _x) in allPlayers) && ((getPosASL _x) select 2) > 40 && !(isTouchingGround _x) && _x isKindOf "Air" && speed _x > 5 && side _x isEqualTo GRLIB_side_friendly && ( _x getVariable ["isCallOut", false] ) ) then {
			_marker = createMarkerLocal [format ["aircall%1",_idx], markers_reset];
			_marker setMarkerTypeLocal "mil_triangle";
			_marker setMarkerSizeLocal [ 0.7, 0.7 ];
			_marker setMarkerDirLocal (direction _x);
			_marker setMarkerPosLocal (getPos _x);
			_marker setMarkerColorLocal "ColorBLUFOR";
			_marker setMarkerTextLocal format["%3 // spd %1 // alt %2 // hdg %4º", round (speed _x), round ((getPosASL _x) select 2), toLower (getText (configFile >> "cfgVehicles" >> typeof(_x) >> "displayName")), round (direction _x)];
			_markers pushback _marker;
			_idx = _idx + 1;
		};
	} forEach vehicles;
	
	sleep 7;
	
};