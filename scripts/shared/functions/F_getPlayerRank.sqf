params [ "_source" ];
private [ "_uidvar", "_playerrank" ];

_playerrank = 0;

if ( isNil { name _source } ) then { _source = player; };

{
	if ( ( ( _x select 1 ) select 0 ) == ( getPlayerUID _source ) ) then {
		_playerrank = ( ( _x select 2 ) select 0 );
	};
} forEach player_data;

_playerrank