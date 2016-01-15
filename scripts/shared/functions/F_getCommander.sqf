private [ "_commanderobj" ];

_commanderobj = objNull;

{ if ( _x getVariable ["St_class", "assault"] == "commander" ) exitWith { _commanderobj = _x }; } foreach allPlayers;

_commanderobj