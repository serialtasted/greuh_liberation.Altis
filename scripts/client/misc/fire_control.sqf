private ["_leftFOB"];
waitUntil { !isNil "weapon_safe" };

_leftFOB = true;
inside_fob = true;

_nearfob = [] call F_getNearestFob;
_fobdistance = 9999;
if ( count _nearfob == 3 ) then { _fobdistance = player distance _nearfob };
if ( _fobdistance < 100 || (player distance lhd) < 150 || (player distance nimitz) < 150 ) then { _leftFOB = true; inside_fob = true; } 
else { _leftFOB = false; inside_fob = false; };

while { true } do {
	_nearfob = [] call F_getNearestFob;
	_fobdistance = 9999;
	if ( count _nearfob == 3 ) then { _fobdistance = player distance _nearfob };
	
	if ( _fobdistance < 100 || (player distance lhd) < 150 || (player distance nimitz) < 150 ) then {
		if ( _leftFOB ) then { 
			if ( !weapon_safe ) then { hint parseText format["FOB Fire Safety Control:<br/><t color='#CC0000' size='1.5'>Enabled</t>"] };
			weapon_safe = true 
		};
		inside_fob = true;
		_leftFOB = false;
	} else {
		if ( !_leftFOB ) then { 
			if ( weapon_safe ) then { hint parseText format["FOB Fire Safety Control:<br/><t color='#00CC00' size='1.5'>Disabled</t>"] };
			weapon_safe = false
		};
		inside_fob = false;
		_leftFOB = true;
	};
};