private [ "_commanderobj" ];

_commanderobj = objNull;

{ if ( typeOf _x == "rhsusf_army_ucp_officer" ) exitWith { _commanderobj = _x }; } foreach allPlayers;

_commanderobj