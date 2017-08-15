private [ "_idact_carshopmenu", "_idact_medicalmenu", "_idact_barracksmenu", "_idact_build",  "_idact_arsenal", "_idact_buildfob", "_idact_medical", "_idact_redeploy", "_idact_tutorial", "_idact_squad", "_idact_repackage", "_idact_halo", "_idact_secondary", "_distfob", "_distarsenal",  "_distbuildfob", "_distspptbuilding", "_distspawn", "_distredeploy", "_distammofactory" ];

action_manager_alive = true;
action_manager_dead = false;

_idact_build = -1;
_idact_arsenal = -1;
_idact_buildfob = -1;
_idact_redeploy = -1;
_idact_tutorial = -1;
_idact_squad = -1;
_idact_repackage = -1;
_idact_halo = -1;
_idact_secondary = -1;
_idact_medical = -1;

_idact_carshopmenu = -1;
_idact_medicalmenu = -1;
_idact_barracksmenu = -1;

_distfob = GRLIB_fob_range;
_distarsenal = 3;
_distbuildfob = 10;
_distspawn = 10;
_distredeploy = 10;
_distammofactory = 5;
_distspptbuilding = 3;

GRLIB_removeBoxes = "";

waitUntil { !isNil "build_confirmed" };
waitUntil { !isNil "one_synchro_done" };
waitUntil { one_synchro_done };

while { action_manager_alive } do {

	_nearfob = [] call F_getNearestFob;
	_fobdistance = 9999;
	if ( count _nearfob == 3 ) then {
		_fobdistance = player distance _nearfob;
	};

	_neararsenal = [ ( (getPosATL player) nearobjects [ Arsenal_typename, _distarsenal ]), { getObjectType _x >= 8 } ] call BIS_fnc_conditionalSelect;
	_nearfobbox = ( (getPosATL player) nearEntities [ [ FOB_box_typename, FOB_truck_typename ] , _distbuildfob ] );
	_nearspawn = ( (getPosATL player) nearEntities [ [ Respawn_truck_typename, huron_typename ] , _distspawn ] ); // USAGE: count _nearspawn != 0
	_nearmedical = ( (getPosATL player) nearobjects [ Medical_typename , _distspptbuilding ] );
	_nearcarshop = ( (getPosATL player) nearobjects [ Repair_typename , _distspptbuilding ] );
	_nearbarracks = ( (getPosATL player) nearobjects [ Barracks_typename , _distspptbuilding ] );
	
	switch ( GRLIB_removeBoxes ) do {
		case "fobBox": {
			if ( count _nearfobbox > 0 ) then {
				deletevehicle (_nearfobbox select 0);
			};
		};
		default {};
	};
	
	if ( GRLIB_removeBoxes != "" ) then {
		GRLIB_removeBoxes = "";
	};

	/*if ( (player distance startbase) < 200 && alive player && vehicle player == player ) then {
		if ( _idact_tutorial == -1 ) then {
			_idact_tutorial = player addAction ["<t color='#80FF80'>" + localize "STR_TUTO_ACTION" + "</t>","howtoplay = 1","",-600,false,true,"",""];
		};
	} else {
		if ( _idact_tutorial != -1 ) then {
			player removeAction _idact_tutorial;
			_idact_tutorial = -1;
		};
	};*/
	
	if ( (_fobdistance < _distredeploy || (player distance startbase) < 200) && alive player && vehicle player == player && GRLIB_halo_param > 0 && count allPlayers <= 8 ) then {
		if ( _idact_halo == -1 ) then {
			_idact_halo = player addAction ["<t color='#80FF80'>" + localize "STR_HALO_ACTION" + "</t> <img size='2' image='res\ui_redeploy.paa'/>","scripts\client\spawn\do_halo.sqf","",-749,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_halo != -1 ) then {
			player removeAction _idact_halo;
			_idact_halo = -1;
		};
	};

	if ( (_fobdistance < _distredeploy || (player distance startbase) < 200) && alive player && vehicle player == player && (GRLIB_allow_redeploy == 2 || count allPlayers <= 2) && GRLIB_allow_redeploy != 0 ) then {
		if ( _idact_redeploy == -1 ) then {
			_idact_redeploy = player addAction ["<t color='#80FF80'>" + localize "STR_DEPLOY_ACTION" + "</t> <img size='2' image='res\ui_redeploy.paa'/>","scripts\client\actions\redeploy.sqf","",-750,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_redeploy != -1 ) then {
			player removeAction _idact_redeploy;
			_idact_redeploy = -1;
		};
	};

	if ( ( (count _nearbarracks != 0 || count _neararsenal != 0) || (player distance startbase) < 20) && alive player && vehicle player == player ) then {
		if (_idact_arsenal == -1) then {
			_idact_arsenal = player addAction ["<t color='#FFFF00'>" + localize "STR_ARSENAL_ACTION" + "</t> <img size='2' image='res\ui_arsenal.paa'/>","[] call F_openArmoury","",-980,true,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_arsenal != -1 ) then {
			player removeAction _idact_arsenal;
			_idact_arsenal = -1;
		};
	};

	if ( (_fobdistance < _distfob || /*count _nearfobbox != 0 ||*/ (player distance startbase) < 200 ) && alive player && vehicle player == player && ( ( [ player, 3 ] call F_fetchPermission ) || ( player == ( [] call F_getCommander ) || [] call F_isAdmin ) ) ) then {
		if ( _idact_build == -1 ) then {
			_idact_build = player addAction ["<t color='#FFFF00'>" + localize "STR_BUILD_ACTION" + "</t> <img size='2' image='res\ui_build.paa'/>","scripts\client\build\open_build_menu.sqf","",-985,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_build != -1 ) then {
			player removeAction _idact_build;
			_idact_build = -1;
		};
	};

	if ( count _nearfobbox != 0 && alive player && vehicle player == player && !(surfaceIsWater getPos player) && ((player distance startbase) > 1000) && ( ( [ player, 3 ] call F_fetchPermission ) || ( player == ( [] call F_getCommander ) || [] call F_isAdmin ) )) then {
		if ( _idact_buildfob == -1 ) then {
			_idact_buildfob = player addAction ["<t color='#FFFF00'>" + localize "STR_FOB_ACTION" + "</t> <img size='2' image='res\ui_deployfob.paa'/>","scripts\client\build\do_build_fob.sqf","",-990,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_buildfob != -1 ) then {
			player removeAction _idact_buildfob;
			_idact_buildfob = -1;
		};
	};
	
	if (  _fobdistance < _distredeploy  && alive player && vehicle player == player && [] call F_isAdmin ) then {
		if ( _idact_repackage == -1 ) then {
			_idact_repackage = player addAction ["<t color='#FFFF00'>" + localize "STR_FOB_REPACKAGE" + "</t> <img size='2' image='res\ui_deployfob.paa'/>","scripts\client\actions\do_repackage_fob.sqf","",-991,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_repackage != -1 ) then {
			player removeAction _idact_repackage;
			_idact_repackage = -1;
		};
	};
	
	if ( (count _nearmedical != 0 || (player distance medicalpod) < 5 ) && alive player && vehicle player == player ) then {
		if ( _idact_medical == -1 ) then {
			_idact_medical = player addAction ["<t color='#FF2626'>" + "-- GET MEDICAL ATTENTION" + "</t> <img size='2' image='res\ui_medical.paa'/>", {
					player playMoveNow "ainvpknlmstpslaywrfldnon_medic";
					[
						15,
						[],
						{
							[objNull, player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
							hintSilent "You're good to go soldier. Try to be more careful next time.";
							player switchmove "";
						},
						{

						},
						"Receiving Medical Attention..."
					] call ace_common_fnc_progressBar;
				},"",0,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_medical != -1 ) then {
			player removeAction _idact_medical;
			_idact_medical = -1;
		};
	};
	
	if ( ( count GRLIB_all_fobs > 0 ) && ( GRLIB_endgame == 0 ) && (_fobdistance < _distredeploy || (player distance startbase) < 200) && alive player && vehicle player == player && ( ( [ player, 5 ] call F_fetchPermission ) || ( player == ( [] call F_getCommander ) || [] call F_isAdmin ) ) ) then {
		if ( _idact_secondary == -1 ) then {
			_idact_secondary = player addAction ["<t color='#FFFF00'>" + localize "STR_SECONDARY_OBJECTIVES" + "</t> <img size='2' image='\a3\ui_f\data\gui\cfg\CommunicationMenu\call_ca.paa'/>","scripts\client\ui\secondary_ui.sqf","",-993,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_secondary != -1 ) then {
			player removeAction _idact_secondary;
			_idact_secondary = -1;
		};
	};
	
	// MODULAR FOB ACTIONS
	
	if ( count _nearcarshop != 0 && alive player && vehicle player == player && ( (player getVariable ["St_class", "assault"]) == "engineer" || (player getVariable ["St_class", "assault"]) == "crew" || (player == [] call F_getCommander) ) ) then {
		if ( _idact_carshopmenu == -1 ) then {
			_idact_carshopmenu = player addAction ["<t color='#94EDE4'>" + "-- OPEN REPAIR FACILITY MENU" + "</t> <img size='2' image='res\ui_menu.paa'/>","scripts\client\build\open_build_menu.sqf",["repairFacility"],0,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_carshopmenu != -1 ) then {
			player removeAction _idact_carshopmenu;
			_idact_carshopmenu = -1;
		};
	};
	
	if ( count _nearmedical != 0 && alive player && vehicle player == player && ( (player getVariable ["St_class", "assault"]) == "medic" || (player == [] call F_getCommander) ) ) then {
		if ( _idact_medicalmenu == -1 ) then {
			_idact_medicalmenu = player addAction ["<t color='#94EDE4'>" + "-- OPEN MEDICAL FACILITY MENU" + "</t> <img size='2' image='res\ui_menu.paa'/>","scripts\client\build\open_build_menu.sqf",["medicalFacility"],0,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_medicalmenu != -1 ) then {
			player removeAction _idact_medicalmenu;
			_idact_medicalmenu = -1;
		};
	};
	
	if ( count _nearbarracks != 0 && alive player && vehicle player == player ) then {
		if ( _idact_barracksmenu == -1 ) then {
			_idact_barracksmenu = player addAction ["<t color='#94EDE4'>" + "-- OPEN BARRACKS MENU" + "</t> <img size='2' image='res\ui_menu.paa'/>","scripts\client\build\open_build_menu.sqf",["barracksFacility"],0,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_barracksmenu != -1 ) then {
			player removeAction _idact_barracksmenu;
			_idact_barracksmenu = -1;
		};
	};

	sleep 1;
};

action_manager_dead = true;