// actions *ADM*
if ( [] call F_isAdmin ) then {
	_action = ["ADM","Admin Actions","",{},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	
		// force save
		_action = ["ADM_FORCESAVE","Force Save","",{trigger_server_save = true; trigger_client_save = true; publicVariable "trigger_server_save"; publicVariable "trigger_client_save"; ["Client settings saved", "hintsilent", true] call BIS_fnc_MP; player spawn {sleep 3; hintsilent "Server settings saved";};},{true}] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions", "ADM"], _action] call ace_interact_menu_fnc_addActionToObject;
		
		// start fireworks
		_action = ["ADM_STARTSHOW","Start Fireworks Show","",{ execVM "scripts\misc\fireworksShow.sqf" },{true}] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions", "ADM"], _action] call ace_interact_menu_fnc_addActionToObject;
		
		// change time
		_action = ["ADM_CHANGETIME","Change Time","",{},{true}] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions", "ADM"], _action] call ace_interact_menu_fnc_addActionToObject;
		
			// morning
			_action = ["TIME_MORNING","Set to morning","",{ [7,"F_skipTime", true, false, true] spawn BIS_fnc_MP },{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions", "ADM", "ADM_CHANGETIME"], _action] call ace_interact_menu_fnc_addActionToObject;
			
			// midday
			_action = ["TIME_MIDDAY","Set to midday","",{ [12,"F_skipTime", true, false, true] spawn BIS_fnc_MP },{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions", "ADM", "ADM_CHANGETIME"], _action] call ace_interact_menu_fnc_addActionToObject;
			
			// dusk
			_action = ["TIME_DUSK","Set to dusk","",{ [16,"F_skipTime", true, false, true] spawn BIS_fnc_MP },{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions", "ADM", "ADM_CHANGETIME"], _action] call ace_interact_menu_fnc_addActionToObject;
			
			// night
			_action = ["TIME_NIGHT","Set to night","",{ [22,"F_skipTime", true, false, true] spawn BIS_fnc_MP },{true}] call ace_interact_menu_fnc_createAction;
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
	_action = ["ME_SYNC","Save Player","",{ if ( vehicle player == player ) then { trigger_client_save = true; hintsilent "Client settings saved"; } else { hintsilent "You can't save when inside a vehicle"; }; },{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "ME"], _action] call ace_interact_menu_fnc_addActionToObject;
	
	// extended options "<t color='#FF8000'>-- Extended Options --</t>","GREUH\scripts\GREUH_dialog.sqf"
	_action = ["ME_EXTENDED","Extended Options","",{ execVM "GREUH\scripts\GREUH_dialog.sqf" },{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "ME"], _action] call ace_interact_menu_fnc_addActionToObject;