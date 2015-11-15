_supportNet = [ "sniper", "jtac", "pilot", "crew", "fso", "commander" ];
_playerclass = player getVariable ["St_class", "assault"];

// set comm net variable
call {
	if (_playerclass in _supportNet) exitWith {player setVariable ["SEN_commNet","support"]};
	if (player == (leader group player)) exitWith {player setVariable ["SEN_commNet","command"]};
	player setVariable ["SEN_commNet","squad"];
};

// setup radios
[] spawn compileFinal preprocessFileLineNumbers "scripts\misc\SEN_TFAR.sqf";