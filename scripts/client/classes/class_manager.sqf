private [ "_arsenalfile", "_customclassesCT", "_currentclass", "_oldclass", "_actionsAdded", "_defaultTeam" ];

_customclassesCT = [ "pilot", "crew", "commander" ];
_actionsAdded = false;
_defaultTeam = "";

changing_class = false;

waitUntil { sleep 0.2; !isNil "classtogo" };

arsenal_items = [];
arsenal_weapons = [];
arsena_backpacks = [];
arsenal_magazines = [];

while {true} do {

	waitUntil { sleep 0.2; classtogo != "" || forceclassmanager };
	
	changing_class = true;
	_oldclass = player getVariable ["St_class", "assault"];
	
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
	
	if ( classtogo != "" ) then {
		player setVariable ["St_class", classtogo, true];
		
		_arsenalfile = "scripts\client\classes\arsenal\" +  classtogo + "_US.sqf";
		[] call compileFinal preprocessFileLineNumbers _arsenalfile;
		
		comment "Default items for all classes";

		player addWeapon "RH_usp";
		player addHandgunItem "RH_12Rnd_45cal_usp";
		player addHandgunItem "RH_m6x";
		
		for "_i" from 1 to 2 do {player addItemToUniform "RH_12Rnd_45cal_usp";};
		player addItemToUniform "rhs_mag_m18_purple";
		player addItemToUniform "ACE_HandFlare_Green";
		
		for "_i" from 1 to 3 do {player addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};

		player addItemToUniform "ACE_Flashlight_XL50";
		player addItemToUniform "ACE_IR_Strobe_Item";
		player addItemToUniform "ACE_EarPlugs";
		player addItemToUniform "ACE_microDAGR";
		
		player linkItem "ACE_NVG_Wide";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		
		classtogo = "";
	} else {
		player setVariable ["St_class", player_class, true];
		
		_arsenalfile = "scripts\client\classes\arsenal\" +  player_class + "_US.sqf";
		[] call compileFinal preprocessFileLineNumbers _arsenalfile;
		
		[player, player_inventory] call F_setLoadout;
		
		forceclassmanager = false;
	};
	
	_currentclass = player getVariable ["St_class", "assault"];
	
	player setVariable ["Ace_medical_medicClass", 1];
	player setVariable ["ACE_IsEngineer", 0];
	
	switch ( _currentclass ) do {
		case "medic": {
			player setVariable ["ACE_medical_medicClass", 2];
		};
		case "engineer": {
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
	
	if ( typeof player == "rhsusf_army_ucp_officer" ) then {
		[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\delete_groups.sqf";
	};
	
	if ( !_actionsAdded ) then {
		_actionsAdded = true;
		[] call compileFinal preprocessFileLineNumbers "scripts\client\player\ace3_actions.sqf";
		[] spawn compileFinal preprocessFileLineNumbers "scripts\misc\pilotCheck.sqf";
		[] spawn compileFinal preprocessFileLineNumbers "scripts\misc\lowerWeapon.sqf";
	};
	
	_msg = format ["You have chosen %1 as your class. Good luck on the battlefield, Soldier!", toUpper(_currentclass)];
	titleText [_msg, "PLAIN DOWN"];
	changing_class = false;
	
};

