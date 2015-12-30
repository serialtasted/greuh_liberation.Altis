// actions *ADM*
if ( [] call F_isAdmin ) then {
	_action = ["ADM","Admin Actions","",{},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	
	_action = ["ADM_FORCESAVE","Force Sync","",{trigger_server_save = true; trigger_client_save = true; publicVariable "trigger_server_save"; publicVariable "trigger_client_save"; ["Client settings synced", "hintsilent", true] call BIS_fnc_MP; player spawn {sleep 3; hintsilent "Server settings synced";};},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "ADM"], _action] call ace_interact_menu_fnc_addActionToObject;
	
	_action = ["ADM_STARTSHOW","Start Fireworks Show","",{_null = [] execVM "scripts\misc\fireworksShow.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "ADM"], _action] call ace_interact_menu_fnc_addActionToObject;
	
	if ( GRLIB_permissions_param ) then {
		_action = ["ADM_PERMS","Player Permissions","",{execVM "scripts\client\commander\open_permissions.sqf";},{true}] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions", "ADM"], _action] call ace_interact_menu_fnc_addActionToObject;
	};
};

// actions *ME*
_action = ["ME",(name player),"",{},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["ME_SYNC","Sync Player","",{ if ( vehicle player == player ) then { trigger_client_save = true; hintsilent "Client settings synced"; } else { hintsilent "You can't sync settings when inside a vehicle"; }; },{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "ME"], _action] call ace_interact_menu_fnc_addActionToObject;