private ["_left_fob", "_inside_fob"];

waitUntil { !isNil "client_is_loaded" };
waitUntil { client_is_loaded && (player distance (getmarkerpos GRLIB_respawn_marker) > 50) };

_left_fob = true;
_inside_fob = false;

while { true } do {
	_nearfob = [] call F_getNearestFob;
	_fobdistance = 9999;
	if ( count _nearfob == 3 ) then { _fobdistance = player distance _nearfob };
	
	if ( _fobdistance < 100 || (player distance startbase) < 150 ) then {
		if ( _left_fob ) then {
			[player, currentWeapon player, currentMuzzle player] call ace_safemode_fnc_lockSafety;
			forceLowerWeapon = true;
		};
		_inside_fob = true;
		_left_fob = false;
	} else {
		if ( !_left_fob ) then { 
			[player, currentWeapon player, currentMuzzle player] call ace_safemode_fnc_unlockSafety;
		};
		_inside_fob = false;
		_left_fob = true;
	};
};