if ( !(isNil "GRLIB_param_wipe_savegame_1") && !(isNil "GRLIB_param_wipe_savegame_2") ) then {
	if ( GRLIB_param_wipe_savegame_1 == 1 && GRLIB_param_wipe_savegame_2 == 1 ) then {
		profileNamespace setVariable [ GRLIB_client_key,nil ];
		saveProfileNamespace;
	};
};

// FORCING TO WIPE CLIENT ON EACH LOGIN -- NO PERSISTENCE
//profileNamespace setVariable [ GRLIB_client_key,nil ];
//saveProfileNamespace;

private [ "_arsenalfile", "_damageHead", "_damageBody", "_damageRArm", "_damageLArm", "_damageRLeg", "_damageLLeg" ];

player_class = "";
player_position = [];
player_direction = 0;
player_inventory = [];
player_isunconscious = false;
player_team = "PTr_alpha";
player_stance = "";
player_damage = [0,0,0,0,0,0];
player_hasearplugs = false;

_damageHead = 0;
_damageBody = 0;
_damageRArm = 0;
_damageLArm = 0;
_damageRLeg = 0;
_damageLLeg = 0;

_isForce = false;

forceclassmanager = false;

trigger_client_save = false;
trigger_client_save_force = false;
greuh_liberation_client = profileNamespace getVariable GRLIB_client_key;

if ( !isNil "greuh_liberation_client" ) then {
	"dynamicBlur" ppEffectEnable true; // enables ppeffect
	"dynamicBlur" ppEffectAdjust [2]; // intensity of blur
	"dynamicBlur" ppEffectCommit 2; // time till vision is fully blurred
	titleText ["Loading Client Data...", "PLAIN", 0, true];
	diag_log "-- LOADING CLIENT --";
	
	player allowDamage false;
	player setVariable ["ace_medical_allowDamage", false];
	
	player_class = greuh_liberation_client select 0;
	player_position = greuh_liberation_client select 1;
	player_direction = greuh_liberation_client select 2;
	player_inventory = greuh_liberation_client select 3;
	player_isunconscious = greuh_liberation_client select 4;
	player_team = greuh_liberation_client select 5;
	player_stance = greuh_liberation_client select 6;
	player_damage = greuh_liberation_client select 7;
	
	if ( count greuh_liberation_savegame > 8 ) then {
		player_hasearplugs = greuh_liberation_client select 8;
	};
	
	player setPosATL player_position;
	player setDir player_direction;
	player playMove player_stance;
	
	if ( player_class isEqualTo "commander" ) then {
		{
			_playerclass = _x getVariable ["St_class", "assault"];
			
			if ( _playerclass isEqualTo "commander" && _x != player ) then {
				classtogo = "assault";
			};
		} forEach allPlayers;
	};
	
	forceclassmanager = true;
	
	waitUntil { sleep 0.2; !forceclassmanager };
	
	player allowDamage true;
	player setVariable ["ace_medical_allowDamage", true];
	if ( player_hasearplugs ) then {
		[player] call ace_hearing_fnc_putInEarplugs
	};
	
	// set damage head
	player spawn {
		_damageHead = (player getHitPointDamage "HitHead") + (player_damage select 0);
		[player, _damageHead, "head" , "bullet"] call ace_medical_fnc_addDamageToUnit;
	};
	
	// set damage body
	player spawn {
		_damageBody = (player getHitPointDamage "HitBody") + (player_damage select 1);
		[player, _damageBody, "body" , "bullet"] call ace_medical_fnc_addDamageToUnit;
	};
	
	// set damage right arm
	player spawn {
		_damageRArm = (player getHitPointDamage "HitRightArm") + (player_damage select 2);
		[player, _damageRArm, "hand_r" , "bullet"] call ace_medical_fnc_addDamageToUnit;
	};
	
	// set damage left arm
	player spawn {
		_damageLArm = (player getHitPointDamage "HitLeftArm") + (player_damage select 3);
		[player, _damageLArm, "hand_l" , "bullet"] call ace_medical_fnc_addDamageToUnit;
	};
	
	// set damage right leg
	player spawn {
		_damageRLeg = (player getHitPointDamage "HitRightLeg") + (player_damage select 4);
		[player, _damageRLeg, "leg_r" , "bullet"] call ace_medical_fnc_addDamageToUnit;
	};
	
	// set damage left leg
	player spawn {
		_damageLLeg = (player getHitPointDamage "HitLeftLeg") + (player_damage select 5);
		[player, _damageLLeg, "leg_l" , "bullet"] call ace_medical_fnc_addDamageToUnit;
	};
	
	if ( player_isunconscious ) then {
		player spawn {
			_sleep = 300 + random(300);
			[player, true, _sleep] call ace_medical_fnc_setUnconscious;
			sleep _sleep;
			[player, false] call ace_medical_fnc_setUnconscious;
			trigger_client_save = true;
		};
	} else {
		player setUnitPos "UP";
		waitUntil { unitPos player == "UP" };
		player setUnitPos "AUTO";
	};
	
	diag_log "** CLIENT LOADED **";
	titleFadeOut 4;
	"dynamicBlur" ppEffectEnable true; // enables ppeffect
	"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
	"dynamicBlur" ppEffectCommit 2; // time it takes to normal
};

[] spawn compileFinal preprocessFileLineNumbers "scripts\client\spawn\redeploy_manager.sqf";

uiSleep 1;
client_is_loaded = true;

while { true } do {
	waitUntil {
		sleep 0.3;
		trigger_client_save || trigger_client_save_force || GRLIB_endgame == 1
	};
	
	diag_log "-- SAVING CLIENT --";
	
	if ( GRLIB_endgame == 1 ) then {
		profileNamespace setVariable [ GRLIB_client_key, nil ];
		saveProfileNamespace;
		while { true } do { sleep 300; };
	} else {
		
		waitUntil { vehicle player == player && (player distance (getmarkerpos GRLIB_respawn_marker) > 50) };
		trigger_client_save = false;
		_isForce = trigger_client_save_force;
		trigger_client_save_force = false;
		
		player_class = player getVariable ["St_class", "assault"];
		
		player_position = [ (getPosATL player) select 0, (getPosATL player) select 1, (getPosATL player) select 2 ];
		player_direction = getDir player;
		
		player_inventory = [player] call F_getLoadout;
		
		player_isunconscious = player getVariable ["ACE_isUnconscious", false];
		
		player_team = player getVariable ["St_team", "PTr_alpha"];
		
		player_stance = animationState player;
		
		player_damage = [
			(player getHitPointDamage "HitHead"),
			(player getHitPointDamage "HitBody"),
			(player getHitPointDamage "HitRightArm"),
			(player getHitPointDamage "HitLeftArm"),
			(player getHitPointDamage "HitRightLeg"),
			(player getHitPointDamage "HitLeftLeg")
		];
		
		player_hasearplugs = player getVariable ["ACE_hasEarPlugsIn", false];
		
		//------------------------------------------------------------------------------------
		greuh_liberation_saveclient = [ player_class,player_position,player_direction,player_inventory,player_isunconscious,player_team,player_stance,player_damage, player_hasearplugs ];
		
		profileNamespace setVariable [ GRLIB_client_key, greuh_liberation_saveclient ];
		saveProfileNamespace;
		//------------------------------------------------------------------------------------
	};
	diag_log greuh_liberation_saveclient;
	diag_log "** CLIENT SAVED **";
	
	if ( _isForce ) then {
		[ "lib_client_saved_success" ] call BIS_fnc_showNotification;
	};
	
	waitUntil { 
		sleep 0.3;
		(player getVariable "ACE_isUnconscious") isEqualTo false
	};
};