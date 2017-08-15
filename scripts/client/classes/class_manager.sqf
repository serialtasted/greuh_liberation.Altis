private [ "_arsenalfile", "_customclassesCT", "_currentclass", "_oldclass", "_actionsAdded", "_defaultTeam", "_specopsState", "_playerclass", "_firstRun" ];

_customclassesCT = [ "pilot", "crew", "commander" ];
_actionsAdded = false;
_defaultTeam = "";
_firstRun = true;

changing_class = false;
allowclasschange = true;
timelefttochange = 60;

waitUntil { sleep 0.2; !isNil "classtogo" };

arsenal_items = [];
arsenal_weapons = [];
arsenal_backpacks = [];
arsenal_magazines = [];
specops_gear = [];
specops_gear_backpacks = [];

baseUniform = "gear_OCP_kit01";
baseVest = "gear_platecarrier_OCP_08";
baseHeadGear = "gear_ECH_OCP_12";

while {true} do {
	_specopsState = missionNamespace getVariable ["specops_mode", 0];
	waitUntil { sleep 0.2; classtogo != "" || forceclassmanager || _specopsState != missionNamespace getVariable ["specops_mode", 0] };
	
	if ( classtogo == "" && _specopsState != missionNamespace getVariable ["specops_mode", 0] ) then {
		
		// clean arsenal list
		[player, arsenal_items,false] call BIS_fnc_removeVirtualItemCargo;
		[player, arsenal_weapons,false] call BIS_fnc_removeVirtualWeaponCargo;
		[player, arsenal_backpacks,false] call BIS_fnc_removeVirtualBackpackCargo;
		[player, arsenal_magazines,false] call BIS_fnc_removeVirtualMagazineCargo;
		sleep 0.2;
		
		// run class arsenal file
		_playerclass = player getVariable ["St_class", "assault"];
		_arsenalfile = format["scripts\client\classes\arsenal_%1\%2_US.sqf", GRLIB_worldType, _playerclass];
		[] call compileFinal preprocessFileLineNumbers _arsenalfile;
		[] call F_setArsenalSpecials;
		
		// add new items to arsenal list
		[player, arsenal_items,false,false] call BIS_fnc_addVirtualItemCargo;
		[player, arsenal_weapons,false,false] call BIS_fnc_addVirtualWeaponCargo;
		[player, arsenal_backpacks,false,false] call BIS_fnc_addVirtualBackpackCargo;
		[player, arsenal_magazines,false,false] call BIS_fnc_addVirtualMagazineCargo;
		
		// message the player
		if ( missionNamespace getVariable ["specops_mode", 0] isEqualTo 1 ) then { hint parseText format["SpecOps Mode:<br/><t color='#00CC00' size='1.5'>Enabled</t>"] }
		else { hint parseText format["SpecOps Mode:<br/><t color='#CC0000' size='1.5'>Disabled</t>"] };
		
	} else {
	
		if ( !allowclasschange && !forceclassmanager && !(classtogo isEqualTo "reload") ) then {
			
			classtogo = "";
			_header = format["Can't change class right now"];
			_timeleft = format["(%1 seconds left)", timelefttochange];
			_message = format["You can't change class this fast. You must wait 60 seconds between changes."];
			hint parseText format["<t size='1.3'>%1</t><br/>%2<br/><br/><t size='0.8'>%3</t>", _header, _timeleft, _message]
		
		} else {
			
			if ( classtogo isEqualTo "reload" ) then { classtogo = player getVariable ["St_class", "assault"] };
		
			changing_class = true;
			_oldclass = player getVariable ["St_class", "assault"];
			
			// set stamina and adjust aim coef
			if ( !GRLIB_fatigue ) then {
				player enableStamina false;
			};
			player setCustomAimCoef 0.25;
			
			// remove unit loadout
			removeAllWeapons player;
			removeAllItems player;
			removeAllAssignedItems player;
			removeUniform player;
			removeVest player;
			removeBackpack player;
			removeHeadgear player;
			removeGoggles player;
			
			// change to new class
			if ( _oldclass in _customclassesCT ) then {
				_defaultTeam = "PTr_alpha"; // defaults team if in custom team
			};
			
			// clean arsenal list
			[player, arsenal_items,false] call BIS_fnc_removeVirtualItemCargo;
			[player, arsenal_weapons,false] call BIS_fnc_removeVirtualWeaponCargo;
			[player, arsenal_backpacks,false] call BIS_fnc_removeVirtualBackpackCargo;
			[player, arsenal_magazines,false] call BIS_fnc_removeVirtualMagazineCargo;
			sleep 0.2;
			
			if ( classtogo != "" ) then {
				player setVariable ["St_class", classtogo, true];
				
				// run class arsenal file
				_arsenalfile = format["scripts\client\classes\arsenal_%1\%2_US.sqf", GRLIB_worldType, classtogo];
				[] call compileFinal preprocessFileLineNumbers _arsenalfile;
				[] call F_setArsenalSpecials;
				
				comment "Default items for all classes";
				
				if ( (handgunWeapon player) isEqualTo "" ) then {
					player addWeapon "rhsusf_weap_glock17g4";
					player addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";
				};
				
				for "_i" from 1 to 2 do {player addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";};
				player addItemToUniform "SmokeShellPurple";
				player addItemToUniform "ACE_HandFlare_Green";
				
				for "_i" from 1 to 9 do {player addItemToUniform "ACE_elasticBandage";};
				for "_i" from 1 to 4 do {player addItemToUniform "ACE_morphine";};

				player addItemToUniform "ACE_Flashlight_XL50";
				player addItemToUniform "ACE_IR_Strobe_Item";
				player addItemToUniform "ACE_EarPlugs";
				player addItemToUniform "ACE_microDAGR";
				
				player linkItem "NVGoggles_OPFOR";
				player linkItem "ItemMap";
				player linkItem "ItemCompass";
				player linkItem "ItemWatch";
				
				classtogo = "";
			} else {
				player setVariable ["St_class", player_class, true];
				
				// run class arsenal file
				_arsenalfile = format["scripts\client\classes\arsenal_%1\%2_US.sqf", GRLIB_worldType, player_class];
				[] call compileFinal preprocessFileLineNumbers _arsenalfile;
				[] call F_setArsenalSpecials;
				
				[player, player_inventory] call F_setLoadout;
				
				forceclassmanager = false;
			};
			
			// add new items to arsenal list
			[player, arsenal_items,false,false] call BIS_fnc_addVirtualItemCargo;
			[player, arsenal_weapons,false,false] call BIS_fnc_addVirtualWeaponCargo;
			[player, arsenal_backpacks,false,false] call BIS_fnc_addVirtualBackpackCargo;
			[player, arsenal_magazines,false,false] call BIS_fnc_addVirtualMagazineCargo;
			
			// remove arsenal action from player
			player removeAction (player getVariable ["bis_fnc_arsenal_action", 0]);
			player setVariable ["bis_fnc_arsenal_action", 0];
			
			_currentclass = player getVariable ["St_class", "assault"];
			
			player setVariable ["Ace_medical_medicClass", 1];
			player setVariable ["ACE_IsEngineer", 0];
			
			switch ( _currentclass ) do {
				case "medic": {
					player setVariable ["ACE_medical_medicClass", 2];
				};
				case "engineer": {
					player setVariable ["ACE_IsEngineer", 2];
				};
				case "crew": {
					player setVariable ["ACE_IsEngineer", 1];
				};
				default {};
			};
			
			if ( _actionsAdded ) then {
				if ( _currentclass isEqualTo "commander" ) then {
					["PTr_commander"] call F_setPlayerTeam;
				};
				if ( _currentclass isEqualTo "crew" ) then {
					["PTr_crew"] call F_setPlayerTeam;
				};
				if ( _currentclass isEqualTo "pilot" ) then {
					["PTr_pilot"] call F_setPlayerTeam;
				};
				if ( !(_currentclass in _customclassesCT) && _oldclass in _customclassesCT ) then { 
					[_defaultTeam] call F_setPlayerTeam;
				};
			} else {
				[player_team] call F_setPlayerTeam;
			};
			
			if ( _currentclass isEqualTo "commander" ) then { [player,true] call F_setCurator; } else { if ( _oldclass isEqualTo "commander" ) then { [player,false] call F_setCurator; } };
			
			if ( !_actionsAdded ) then {
				_actionsAdded = true;
				[] call compileFinal preprocessFileLineNumbers "scripts\client\player\ace3_actions.sqf";
			};
			
			sleep 2;
			
			// assign radio and frequencies
			[] call F_assignComms;
			
			// set unit rank
			[] call F_setRank;
			
			// set unit insignia
			[ player, format["%1FlagWS", [player] call F_getPlayerCountry] ] remoteExecCall ["BIS_fnc_setUnitInsignia", 0, true];
			
			_msg = format ["You have chosen %1 as your class. Good luck on the battlefield, Soldier!", toUpper(_currentclass)];
			titleText [_msg, "PLAIN DOWN"];
			changing_class = false;
			
			if ( !_firstRun ) then {
				allowclasschange = false;
				player spawn {
					while {timelefttochange > 0} do {
						sleep 1;
						timelefttochange = timelefttochange - 1;
					};
					timelefttochange = 60;
					allowclasschange = true;
				};
			};
			
			_firstRun = false;
			forceLowerWeapon = true;
			
		};
	};
	
	if ( missionNamespace getVariable ["specops_mode", 0] isEqualTo 0 ) then {
		if ( (uniform player) in specops_gear ) then {
			private _uniformItems = uniformItems player;
			removeUniform player;
			if ( baseUniform != "" ) then { 
				player forceAddUniform baseUniform;
				{player addItemToUniform _x} forEach _uniformItems;
			};
		};
		if ( (vest player) in specops_gear ) then {
			private _vestItems = vestItems player;
			removeVest player;
			if ( baseVest != "" ) then { 
				player addVest baseVest;
				{player addItemToVest _x} forEach _vestItems;
			};
		};
		if ( (backpack player) in specops_gear_backpacks ) then {
			private _backpackItems = backpackItems player;
			removeBackpack player;
			if ( baseBackpack != "" ) then { 
				player addBackpack baseBackpack;
				{player addItemToBackpack _x} forEach _backpackItems;
			};
		};
		if ( (headgear player) in specops_gear ) then {
			removeHeadgear player;
			if ( baseHeadGear != "" ) then { 
				player addHeadgear baseHeadGear;
			};
		};
		if ( "NVGogglesB_blk_F" in (assignedItems player) ) then {
			player unlinkItem  "NVGogglesB_blk_F";
			player linkItem "NVGoggles_OPFOR";
		};
	};
};

