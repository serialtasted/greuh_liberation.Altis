params [ "_target" ];

skipTime ( _target - daytime + 24 ) % 24;

[_target] spawn {
	params [ "_target" ];
	waitUntil { daytime > _target && dayTime < (_target + 0.5) };
	[format ["%1", ([dayTime, "HH:MM"] call BIS_fnc_timeToString)]] spawn BIS_fnc_infoText;
};