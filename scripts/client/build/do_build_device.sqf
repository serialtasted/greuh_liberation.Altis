private [ "_clearedtobuildsector", "_sector", "_clearedtobuildcount" ];

_clearedtobuildsector = false;
_sector = [150] call F_getNearestSector;
_clearedtobuildcount = 0;

if ( _sector in sectors_military ) then {
	_clearedtobuildsector = true;
	
	{
		_clearedtobuildcount = _clearedtobuildcount + 1;
	} forEach nearestObjects [player, [AmmoFactory_device_typename], 150];
};

if ( !_clearedtobuildsector ) then {
	hint "You must be inside a controlled military base to build a Factory Device.";
} else {
	if ( _clearedtobuildcount >= 1 ) then {
		hintSilent format ["You have reached the maximum ammount ( %1 ) of devices per military base.", _clearedtobuildcount];
	} else {
		buildtype = "ammoDevice";
		dobuild = 1;
	};
};