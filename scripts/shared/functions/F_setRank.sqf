private [ "_unitrank" ];

_unitrank = str( [player] call F_getPlayerRank );

switch ( _unitrank ) do {
	case '0': {_unitrank = "PRIVATE"}; 
	case '1': {_unitrank = "CORPORAL"};
	case '2': {_unitrank = "SERGEANT"};
	case '3': {_unitrank = "LIEUTENANT"};
	case '4': {_unitrank = "CAPTAIN"};
	case '5': {_unitrank = "MAJOR"};
	case '6': {_unitrank = "COLONEL"};
	default {_unitrank = "PRIVATE"};
};

[player, _unitrank] remoteExec ["setRank", 0, true];
diag_log format ["-- Your rank is %1", _unitrank];