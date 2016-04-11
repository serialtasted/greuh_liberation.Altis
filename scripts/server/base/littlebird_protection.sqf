if ( isServer ) then {

	waitUntil { time > 1 };

	params [ "_littlebird" ];
	_littlebird allowdamage false;
	_littlebird setdamage 0;

	waitUntil { !isNil "GRLIB_isAtlasPresent" };

	if ( GRLIB_isAtlasPresent ) then {

		_littlebird setdamage 0;
		sleep 10;
		_littlebird setdamage 0;
		_littlebird allowdamage true;
	};
	
	[_littlebird] remoteExec ["ace_fastroping_fnc_equipFRIES", 0, true];
};