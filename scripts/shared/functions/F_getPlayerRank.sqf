private [ "_playerrank", "_unit" ];
params [ "_unit" ];

_playerrank = 1;

if ( isNil { name _unit } ) then { _unit = player; };

{
	if ( ( ( _x select 1 ) select 0 ) == ( getPlayerUID _unit ) ) then {
		_playerrank = ( ( _x select 2 ) select 0 );
	};
} forEach player_data;

_playerrank