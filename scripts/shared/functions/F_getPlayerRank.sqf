params [ "_source" ];
private [ "_uidvar", "_playerrank" ];

waitUntil { !isNil "save_is_loaded" };

if ( isNil "GRLIB_permissions_cache" ) then { GRLIB_permissions_cache = []; };

_playerrank = 1;
if ( !GRLIB_permissions_param ) then {
	_playerrank = 7;
} else {
	if ( !(isNil "GRLIB_permissions") && !(isNull _source) ) then {

		_uidvar = getPlayerUID _source;
		{ if ( _uidvar == _x select 0 ) exitWith { GRLIB_permissions_cache  = [] + (_x select 1) }; } foreach GRLIB_permissions;

		if ( count GRLIB_permissions_cache > 6 ) then {
			_playerrank = ((GRLIB_permissions_cache select 6) - 100);
		};
	};
};

_playerrank