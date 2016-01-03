params [ "_target" ];

skipTime ( _target - daytime + 24 ) % 24;

[_target] spawn {
	params [ "_target" ];
	waitUntil { daytime > _target && dayTime < (_target + 0.5) };
	_hour = format ["%1", ([dayTime, "HH:MM"] call BIS_fnc_timeToString)];
	[[_hour, ":", ""] call CBA_fnc_replace] spawn BIS_fnc_infoText;
};