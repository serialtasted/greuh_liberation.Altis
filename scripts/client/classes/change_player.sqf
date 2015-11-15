private [ "_newunit", "_oldunit", "_oldpos", "_olddir", "_oldteam", "_playeruid", "_playerclass", "_params", "_randint", "_unitrank" ];

action_manager_alive = false;

removeBackpack player;
_oldunit = player;
_olddir = getDir player;
_oldpos = getPosATL player;
_playeruid = getPlayerUID player;
_playerclass = player getVariable "St_class";

_oldteam = _oldunit getVariable ["St_team", "PTr_alpha"];

_randint = str(round(random 9999));

_newunit = format ["unit_%1_%2", _playeruid, _randint];
_params = format ["%1 = this", _newunit];

_unitrank = str([] call F_getPlayerRank);

switch ( _unitrank ) do {
	case '1': {_unitrank = "private"}; 
	case '2': {_unitrank = "corporal"};
	case '3': {_unitrank = "sergeant"};
	case '4': {_unitrank = "lieutenant"};
	case '5': {_unitrank = "captain"};
	case '6': {_unitrank = "major"};
	case '7': {_unitrank = "colonel"};
	default {_unitrank = "private"};
};

switch ( _playerclass ) do {
	case "medic": {
		"rhsusf_army_ucp_medic" createUnit [ getMarkerPos "hold_unit", group player, _params, 0.60000002, _unitrank ];
	};
	case "engineer": {
		"rhsusf_army_ucp_engineer" createUnit [ getMarkerPos "hold_unit", group player, _params, 0.60000002, _unitrank ];
	};
	case "jtac": {
		"rhsusf_army_ucp_uav" createUnit [ getMarkerPos "hold_unit", group player, _params, 0.60000002, _unitrank ];
	};
	case "pilot": {
		"rhsusf_airforce_pilot" createUnit [ getMarkerPos "hold_unit", group player, _params, 0.60000002, _unitrank ];
	};
	case "crew": {
		"rhsusf_army_ucp_crewman" createUnit [ getMarkerPos "hold_unit", group player, _params, 0.60000002, _unitrank ];
	};
	case "fso": {
		"rhsusf_army_ucp_fso" createUnit [ getMarkerPos "hold_unit", group player, _params, 0.60000002, _unitrank ];
	};
	case "commander": {
		"rhsusf_army_ucp_officer" createUnit [ getMarkerPos "hold_unit", group player, _params, 0.60000002, _unitrank ];
	};
	default { 
		"rhsusf_army_ucp_rifleman" createUnit [ getMarkerPos "hold_unit", group player, _params, 0.60000002, _unitrank ];
	};
};

_newunit = call compile _newunit;

waitUntil { alive _newunit };

removeAllWeapons _newunit;
removeAllItems _newunit;
removeAllAssignedItems _newunit;
removeUniform _newunit;
removeVest _newunit;
removeBackpack _newunit;
removeHeadgear _newunit;
removeGoggles _newunit;

setPlayable _newunit;
selectPlayer _newunit;
_newunit setName name _oldunit;

waitUntil { sleep 0.2; player == _newunit };

deleteVehicle _oldunit;

player setVariable ["St_class", _playerclass, true];
player setVariable ["St_team", _oldteam];

playableUnitOccupier_PV = player; publicVariableServer "playableUnitOccupier_PV";	
player addEventHandler ["Respawn", {
	playableUnitOccupier_PV = _this select 0; publicVariableServer "playableUnitOccupier_PV";
}];

player setPosATL _oldpos;
player setDir _olddir;

waitUntil { action_manager_dead };
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\action_manager.sqf";