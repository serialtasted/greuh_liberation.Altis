/*
Author: SENSEI

Last modified: 7/22/2015

Description:  assigns TFAR radio and channels

Return: nothing
__________________________________________________________________*/
private ["_unitName","_unitTeam","_bItems"];

// remove any radios in inventory
{player unlinkItem _x} forEach (player call TFAR_fnc_radiosList);

_unitName = name player;
_unitTeam = player getVariable ["St_team", "PTr_alpha"];
_friendlyTeamName = "";

switch ( _unitTeam ) do {
	case "PTr_alpha": { _friendlyTeamName = "Squad Alpha"; };
	case "PTr_bravo": { _friendlyTeamName = "Squad Bravo"; };
	case "PTr_charlie": { _friendlyTeamName = "Squad Charlie"; };
	default { };
};

// if player on COMMAND Net - assign radio, set short wave channel (team ch) and set short wave additional channel (command ch)
if ( player getvariable ["SEN_commNet",""] isEqualTo "command" ) exitWith {
	player linkItem SEN_TFAR_SW;
	waitUntil {sleep 0.1; count (player call TFAR_fnc_radiosList) > 0};
	[(call TFAR_fnc_activeSwRadio), SEN_tfar_ch_sw] call TFAR_fnc_setSwChannel;
	[(call TFAR_fnc_activeSwRadio), SEN_tfar_add_sw] call TFAR_fnc_setAdditionalSwChannel;
	[(call TFAR_fnc_ActiveSWRadio), tf_default_radioVolume] call TFAR_fnc_setSwVolume;
	hintSilent format["Welcome %1\nYou have access to COMMAND and SQUAD communications network for %2.",_unitName,_friendlyTeamName];
	diag_log format["Welcome %1\nYou have access to COMMAND and SQUAD communications network for %2.",_unitName,_friendlyTeamName];
};

if ( player getvariable ["SEN_commNet",""] isEqualTo "support" ) exitWith {
	player linkItem SEN_TFAR_SW;
	waitUntil {sleep 0.1; count (player call TFAR_fnc_radiosList) > 0};
	[(call TFAR_fnc_activeSwRadio), SEN_tfar_ch_sw] call TFAR_fnc_setSwChannel;
	[(call TFAR_fnc_activeSwRadio), SEN_tfar_add_sw] call TFAR_fnc_setAdditionalSwChannel;
	[(call TFAR_fnc_ActiveSWRadio), tf_default_radioVolume] call TFAR_fnc_setSwVolume;
	
	if ( (player getvariable ["St_class",""]) != "pilot" && (player getvariable ["St_class",""]) != "crew" ) then {
		_bItems = backpackItems player;
		removeBackpack player;
		player addbackpack SEN_TFAR_LR;
		{player addItemToBackpack _x} forEach _bItems;
		[(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, SEN_tfar_ch_lr] call TFAR_fnc_setLrChannel;
		[(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, tf_default_radioVolume] call TFAR_fnc_setLrVolume;
	};
	
	hintSilent format["Welcome %1\nYou have access to SUPPORT and SQUAD communications network.",_unitName];
	diag_log format["Welcome %1\nYou have access to SUPPORT and SQUAD communications network.",_unitName];
};

if ( player getvariable ["SEN_commNet",""] isEqualTo "squad" ) exitWith {
	player linkItem SEN_TFAR_RF;
	waitUntil {sleep 0.1; count (player call TFAR_fnc_radiosList) > 0};
	[(call TFAR_fnc_activeSwRadio), SEN_tfar_ch_sw] call TFAR_fnc_setSwChannel;
	[(call TFAR_fnc_activeSwRadio), SEN_tfar_add_sw] call TFAR_fnc_setAdditionalSwChannel;
	[(call TFAR_fnc_ActiveSWRadio), tf_default_radioVolume] call TFAR_fnc_setSwVolume;
	hintSilent format["Welcome %1\nYou have access to SQUAD communications network for %2.",_unitName,_friendlyTeamName];
	diag_log format["Welcome %1\nYou have access to SQUAD communications network for %2.",_unitName,_friendlyTeamName];
};