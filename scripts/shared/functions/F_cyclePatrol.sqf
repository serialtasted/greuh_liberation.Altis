params [ "_grp", "_target", ["_type", "MOVE"], ["_behaviour", "SAFE"], ["_combatMode", "GREEN"], ["_speed", "NORMAL"], ["_nObjectives", 5], ["_cRadius", 60] ];
private [ "_wp", "_wpPositions" ];

_wpPositions = [];

// Generate wp positions
for "_i" from 1 to _nObjectives do {
	_wpPositions pushback (getMarkerPos _target getPos [ random 300, random 360 ]);
};

{
	_wp = _grp addWaypoint [_x, 0];
	_wp setWaypointType _type;
	_wp setWaypointBehaviour _behaviour;
	_wp setWaypointCombatMode _combatMode;
	_wp setWaypointSpeed _speed;
	_wp setWaypointCompletionRadius ceil(random _cRadius);
} foreach _wpPositions;