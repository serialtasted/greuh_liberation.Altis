private [ "_clearedtobuildsector", "_clearedtobuildcount", "_nearobjects" ];

_clearedtobuildsector = false;
_clearedtobuildcount = 0;

_nearobjects = [];
{
	_nearobjects pushBack (typeOf _x);
} forEach nearestObjects [player, [AmmoFactory_device_typename], 30];

if ( AmmoFactory_device_typename in _nearobjects ) then {
	_clearedtobuildsector = true;
	
	{
		_clearedtobuildcount = _clearedtobuildcount + 1;
	} forEach nearestObjects [player, [AmmoFactory_generator_typename], 150];
};

if ( !_clearedtobuildsector ) then {
	hint "You must be close to a Factory Device.";
} else {
	if ( _clearedtobuildcount >= 1 ) then {
		hintSilent format ["You have reached the maximum ammount ( %1 ) of generators per device.", _clearedtobuildcount];
	} else {
		buildtype = "generator";
		dobuild = 1;
	};
};