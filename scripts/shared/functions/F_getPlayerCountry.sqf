params [ "_source" ];
private [ "_uidvar", "_playercountry" ];

_playercountry = "EU";

if ( isNil { name _source } ) then { _source = player; };

{
	if ( ( ( _x select 1 ) select 0 ) == ( getPlayerUID _source ) ) then {
		_playercountry = ( ( _x select 1 ) select 1 );
	};
} forEach player_data;

_playercountry