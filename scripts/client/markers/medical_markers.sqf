private [ "_markers", "_marker", "_idx" ];

_markers = [];

uiSleep 3;

while { true } do {
	
	_idx = 0;
	
	{ deleteMarkerLocal _x } foreach _markers;
	
	waitUntil { player getVariable ["St_class", "assault"] isEqualTo "medic" };
	
	{
		if ( _x getVariable ["ACE_isUnconscious",false]) then {
			_marker = createMarkerLocal [format ["deadmarker%1",_idx], markers_reset];
			_marker setMarkerTypeLocal "KIA";
			_marker setMarkerSizeLocal [ 0.7, 0.7 ];
			_marker setMarkerPosLocal (getPos _x);
			_marker setMarkerColorLocal "ColorRed";
			_markers pushback _marker;
			_idx = _idx + 1;
		};
	} forEach allPlayers;
	
	sleep 3;
	
};