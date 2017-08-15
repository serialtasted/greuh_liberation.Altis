// actions *ADM*
if ( [] call F_isAdmin ) then {
	_action = ["ADM","Admin Actions","res\ace3menu\ui_admin.paa",{},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	
		// force save
		_action = ["ADM_FORCESAVE","Force Save","res\ace3menu\ui_save.paa",{trigger_server_save_force = true; publicVariable "trigger_server_save_force"; trigger_client_save_force = true; publicVariable "trigger_client_save_force"; },{true}] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions", "ADM"], _action] call ace_interact_menu_fnc_addActionToObject;
		
		// reload whitelist
		//_action = ["ADM_WHITELIST","Reload Whitelist","res\ace3menu\ui_whitelist.paa",{ [] remoteExec ["Whitelist"] },{true}] call ace_interact_menu_fnc_createAction;
		//[player, 1, ["ACE_SelfActions", "ADM"], _action] call ace_interact_menu_fnc_addActionToObject;
		
		if((getPlayerUID player) == "_SP_PLAYER_" || (getPlayerUID player) == "76561198035670394") then {
			// sector options
			_action = ["ADM_SECTOR","Sector Options","",{},{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions", "ADM"], _action] call ace_interact_menu_fnc_addActionToObject;
			
				// liberate
				_action = ["SECTOR_LIBERATE","Liberate nearest sector","",{ [true] spawn F_sectorManipulation },{true}] call ace_interact_menu_fnc_createAction;
				[player, 1, ["ACE_SelfActions", "ADM", "ADM_SECTOR"], _action] call ace_interact_menu_fnc_addActionToObject;
				
				// lose
				_action = ["SECTOR_LOSE","Lose nearest sector","",{ [false] spawn F_sectorManipulation },{true}] call ace_interact_menu_fnc_createAction;
				[player, 1, ["ACE_SelfActions", "ADM", "ADM_SECTOR"], _action] call ace_interact_menu_fnc_addActionToObject;
		};
		
		// change time
		_action = ["ADM_CHANGETIME","Change Time","res\ace3menu\ui_time.paa",{},{true}] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions", "ADM"], _action] call ace_interact_menu_fnc_addActionToObject;
		
			// night
			_action = ["TIME_NIGHT","Set to night","res\ace3menu\ui_time_night.paa",{ [22] remoteExec ["F_skipTime"] },{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions", "ADM", "ADM_CHANGETIME"], _action] call ace_interact_menu_fnc_addActionToObject;
			
			// dusk
			_action = ["TIME_DUSK","Set to dusk","res\ace3menu\ui_time_dusk.paa",{ [16] remoteExec ["F_skipTime"] },{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions", "ADM", "ADM_CHANGETIME"], _action] call ace_interact_menu_fnc_addActionToObject;
			
			// midday
			_action = ["TIME_MIDDAY","Set to midday","res\ace3menu\ui_time_midday.paa",{ [12] remoteExec ["F_skipTime"] },{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions", "ADM", "ADM_CHANGETIME"], _action] call ace_interact_menu_fnc_addActionToObject;
			
			// morning
			_action = ["TIME_MORNING","Set to morning","res\ace3menu\ui_time_morning.paa",{ [7] remoteExec ["F_skipTime"] },{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions", "ADM", "ADM_CHANGETIME"], _action] call ace_interact_menu_fnc_addActionToObject;
		
		// set specops mode ON
		_action = ["SPECOPS_ON","SpecOps Mode ON","res\ace3menu\ui_blackops.paa",{ [missionNamespace, ["specops_mode", 1]] remoteExec ["setVariable", 0, true]  },{ (missionNamespace getVariable ["specops_mode", 0]) isEqualTo 0 }] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions", "ADM"], _action] call ace_interact_menu_fnc_addActionToObject;

		// set specops mode OFF
		_action = ["SPECOPS_OFF","SpecOps Mode OFF","res\ace3menu\ui_blackops.paa",{ [missionNamespace, ["specops_mode", 0]] remoteExec ["setVariable", 0, true] },{ (missionNamespace getVariable ["specops_mode", 0]) isEqualTo 1 }] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions", "ADM"], _action] call ace_interact_menu_fnc_addActionToObject;
	
		if ( GRLIB_permissions_param ) then {
			_action = ["ADM_PERMS","Player Permissions","res\ace3menu\ui_permissions.paa",{ execVM "scripts\client\commander\open_permissions.sqf"; },{true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions", "ADM"], _action] call ace_interact_menu_fnc_addActionToObject;
		};
};

// actions *ME*
_action = ["ME",(name player),"res\ace3menu\ui_user.paa",{},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	
	// save player
	_action = ["ME_SYNC","Save Player","res\ace3menu\ui_save.paa",{ if ( vehicle player == player ) then { trigger_client_save_force = true; } else { [ "lib_client_saved_fail" ] call BIS_fnc_showNotification; }; },{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "ME"], _action] call ace_interact_menu_fnc_addActionToObject;
	
	// reset radio frequencies
	_action = ["ME_RESETFRQ","Reset Radio","res\ace3menu\ui_radio.paa",{ [] call F_resetComms },{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "ME"], _action] call ace_interact_menu_fnc_addActionToObject;