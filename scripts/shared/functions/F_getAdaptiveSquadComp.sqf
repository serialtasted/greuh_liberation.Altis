private [ "_squadcomp", "_specialists", "_randomchance" ];
params [ ["_vehspots",0] ];
if ( isNil 'infantry_weight' ) then { infantry_weight = 33 };
if ( isNil 'armor_weight' ) then { armor_weight = 33 };
if ( isNil 'air_weight' ) then { air_weight = 33 };

_squadcomp = opfor_squad_8_standard;
_specialists = false;

if ( !isNil 'combat_readiness' ) then {
	if ( combat_readiness < 35 ) then {
		_squadcomp = opfor_squad_low_intensity;
		_specialists = true;
	};
};

if ( armor_weight > 40 && !_specialists) then {
	_randomchance = (armor_weight - 40) * 1.35;
	if ( (random 100) < _randomchance) then {
		_specialists = true;
		_squadcomp = opfor_squad_8_tankkillers;
	};
};

if ( air_weight > 40 && !_specialists) then {
	_randomchance = (air_weight - 40) * 1.35;
	if ( (random 100) < _randomchance) then {
		_specialists = true;
		_squadcomp = opfor_squad_8_airkillers;
	};
};

if ( infantry_weight > 40 && !_specialists) then {
	_randomchance = (infantry_weight - 40) * 1.35;
	if ( (random 100) < _randomchance) then {
		_specialists = true;
		_squadcomp = opfor_squad_8_infkillers;
	};
};

diag_log format["### ADAPT SQUAD"];
diag_log format["### OLD SQUAD: %1", _squadcomp];

if ( (count _squadcomp) > _vehspots && _vehspots > 0 ) then {
	_newsquad = [];
	{
		if ( (count _newsquad) < _vehspots ) then { _newsquad pushBack _x };
	} forEach _squadcomp;
	_squadcomp = _newsquad;
};

if ( _vehspots > 8 ) then {
	_i = 0; 
	for [{private _i = 0}, {_i < (_vehspots - (count _squadcomp))}, {_i = _i + 1}] do {
		_squadcomp pushBack (opfor_infantry call BIS_fnc_selectRandom);
	}; 
};

diag_log format["### NEW SQUAD: %1", _squadcomp];
diag_log format["### VEH SPACE: %1", _vehspots];
_squadcomp
