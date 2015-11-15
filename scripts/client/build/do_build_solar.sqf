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
	} forEach nearestObjects [player, [AmmoFactory_solar_typename], 150];
};

if ( !_clearedtobuildsector ) then {
	hint "You must be close to a Factory Device.";
} else {
	if ( _clearedtobuildcount >= 3 ) then {
		hintSilent format ["You have reached the maximum ammount ( %1 ) of solar panels per device.", _clearedtobuildcount];
	} else {
		buildtype = "solarPanel";
		dobuild = 1;
	};
};