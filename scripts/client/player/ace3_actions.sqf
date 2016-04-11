// actions *ADM*
if ( [] call F_isAdmin ) then {
	_action = ["ADM","Admin Actions","",{},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	
		// force save
		_action = ["ADM_FORCESAVE","Force Save","",{trigger_server_save_force = true; publicVariable "trigger_server_save_force"; trigger_client_save_force = true; publicVariable "trigger_client_save_force"; },{true}] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions", "ADM"], _action] call ace_interact_menu_fnc_addActionToObject;
		
		// start fireworks
		_action = ["ADM_STARTSHOW","Start Fireworks Show","",{ execVM "scripts\misc\fireworksShow.sqf" },{true}] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions", "ADM"], _action] call ace_interact_menu_fnc_addActionToObject;
		
		// change time
		_action = ["ADM_CHANGETIME","Change Time","",{},{true}] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions", "ADM"], _action] call ace_interact_menu_fnc_addActionToObject;
		
			// morning
			_action = ["TIME_MORNING","Set to morning","",{ [7] remoteExec ["F_skipTime"] },{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions", "ADM", "ADM_CHANGETIME"], _action] call ace_interact_menu_fnc_addActionToObject;
			
			// midday
			_action = ["TIME_MIDDAY","Set to midday","",{ [12] remoteExec ["F_skipTime"] },{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions", "ADM", "ADM_CHANGETIME"], _action] call ace_interact_menu_fnc_addActionToObject;
			
			// dusk
			_action = ["TIME_DUSK","Set to dusk","",{ [16] remoteExec ["F_skipTime"] },{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions", "ADM", "ADM_CHANGETIME"], _action] call ace_interact_menu_fnc_addActionToObject;
			
			// night
			_action = ["TIME_NIGHT","Set to night","",{ [22] remoteExec ["F_skipTime"] },{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions", "ADM", "ADM_CHANGETIME"], _action] call ace_interact_menu_fnc_addActionToObject;
	
		if ( GRLIB_permissions_param ) then {
			_action = ["ADM_PERMS","Player Permissions","",{ execVM "scripts\client\commander\open_permissions.sqf"; },{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions", "ADM"], _action] call ace_interact_menu_fnc_addActionToObject;
		};
};

// actions *ME*
_action = ["ME",(name player),"",{},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	
	// save player
	_action = ["ME_SYNC","Save Player","",{ if ( vehicle player == player ) then { trigger_client_save_force = true; } else { [ "lib_client_saved_fail" ] call BIS_fnc_showNotification; }; },{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "ME"], _action] call ace_interact_menu_fnc_addActionToObject;
	
	// extended options "<t color='#FF8000'>-- Extended Options --</t>","GREUH\scripts\GREUH_dialog.sqf"
	_action = ["ME_EXTENDED","Extended Options","",{ execVM "GREUH\scripts\GREUH_dialog.sqf" },{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "ME"], _action] call ace_interact_menu_fnc_addActionToObject;
	
	// reset radio frequencies
	_action = ["ME_RESETFRQ","Reset Radio","",{ [] call F_resetComms },{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "ME"], _action] call ace_interact_menu_fnc_addActionToObject;