if ( isServer ) then {

	[] spawn {
		sleep 15;
		{ _x setFuel 1; } foreach ( ( getmarkerpos "lhd" ) nearObjects 500 );
	};
	
	lhd hideObject true;
	GRLIB_isAtlasPresent = true; publicVariable "GRLIB_isAtlasPresent";
	
} else {
	waitUntil { !isNil "GRLIB_isAtlasPresent" };
};