private [ "_idact_build",  "_idact_arsenal", "_idact_buildfob", "_idact_builddevice", "_idact_buildsolar", "_idact_medical", "_idact_sparewheel", "_idact_sparetrack", "_idact_fuelbarrel", "_idact_fuelsling", "_idact_fuelcannister", "_idact_buildgenerator", "_idact_redeploy", "_idact_tutorial", "_distfob", "_distarsenal",  "_distbuildfob", "_distspptbuilding", "_distspawn", "_distredeploy", "_distammofactory", "_distsatbox" ];

action_manager_alive = true;
action_manager_dead = false;

_idact_build = -1;
_idact_arsenal = -1;
_idact_buildfob = -1;
_idact_builddevice = -1;
_idact_buildsolar = -1;
_idact_buildgenerator = -1;
_idact_redeploy = -1;
_idact_tutorial = -1;
_idact_squad = -1;
_idact_repackage = -1;
_idact_halo = -1;
_idact_secondary = -1;
_idact_medical = -1;

_idact_sparewheel = -1;
_idact_sparetrack = -1;
_idact_fuelbarrel = -1;
_idact_fuelsling = -1;
_idact_fuelcannister = -1;

_distfob = GRLIB_fob_range;
_distarsenal = 3;
_distbuildfob = 10;
_distspawn = 10;
_distredeploy = 20;
_distammofactory = 5;
_distspptbuilding = 3;
_distsatbox = 2;

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
	_nearbuildtruck = ( (getPosATL player) nearobjects [ Build_truck_typename , _distbuildfob ] );
	_nearspawn = ( (getPosATL player) nearEntities [ [ Respawn_truck_typename, huron_typename ] , _distspawn ] ); // USAGE: count _nearspawn != 0
	_neardevicebox = ( (getPosATL player) nearEntities [ [ AmmoFactory_box_typename select 0, AmmoFactory_box_typename select 1, AmmoFactory_truck_typename select 0, AmmoFactory_truck_typename select 1 ] , _distammofactory ] );
	_nearsolarbox = ( (getPosATL player) nearobjects [ AmmoFactory_solarBox_typename , _distammofactory ] );
	_neargeneratorbox = ( (getPosATL player) nearobjects [ AmmoFactory_generatorBox_typename , _distammofactory ] );
	_nearmedical = ( (getPosATL player) nearobjects [ Medical_typename , _distspptbuilding ] );
	_nearcarshop = ( (getPosATL player) nearobjects [ Repair_typename , _distspptbuilding ] );
	
	switch ( GRLIB_removeBoxes ) do {
		case "fobBox": {
			if ( count _nearfobbox > 0 ) then {
				deletevehicle (_nearfobbox select 0);
			};
		};
		case "deviceBox": {
			if ( count _neardevicebox > 0 ) then {
				deletevehicle (_neardevicebox select 0);
			};
		};
		case "solarBox": {
			if ( count _nearsolarbox > 0 ) then {
				deletevehicle (_nearsolarbox select 0);
			};
		};
		case "generatorBox": {
			if ( count _neargeneratorbox > 0 ) then {
				deletevehicle (_neargeneratorbox select 0);
			};
		};
		default {};
	};
	
	if ( GRLIB_removeBoxes != "" ) then {
		GRLIB_removeBoxes = "";
	};

	if ( (player distance lhd) < 200 && alive player && vehicle player == player ) then {
		if ( _idact_tutorial == -1 ) then {
			_idact_tutorial = player addAction ["<t color='#80FF80'>" + localize "STR_TUTO_ACTION" + "</t>","howtoplay = 1","",-600,false,true,"",""];
		};
	} else {
		if ( _idact_tutorial != -1 ) then {
			player removeAction _idact_tutorial;
			_idact_tutorial = -1;
		};
	};
	
	if ( (_fobdistance < _distredeploy || (player distance lhd) < 200 || (player distance nimitz) < 200) && alive player && vehicle player == player && GRLIB_halo_param > 0 ) then {
		if ( _idact_halo == -1 ) then {
			_idact_halo = player addAction ["<t color='#80FF80'>" + localize "STR_HALO_ACTION" + "</t> <img size='2' image='res\ui_redeploy.paa'/>","scripts\client\spawn\do_halo.sqf","",-749,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_halo != -1 ) then {
			player removeAction _idact_halo;
			_idact_halo = -1;
		};
	};

	if ( (_fobdistance < _distredeploy || (player distance lhd) < 200 || (player distance nimitz) < 200) && alive player && vehicle player == player && (PARAMS_AllowRedeploy == 1 || count allPlayers <= 2) && PARAMS_AllowRedeploy != -1 ) then {
		if ( _idact_redeploy == -1 ) then {
			_idact_redeploy = player addAction ["<t color='#80FF80'>" + localize "STR_DEPLOY_ACTION" + "</t> <img size='2' image='res\ui_redeploy.paa'/>","scripts\client\actions\redeploy.sqf","",-750,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_redeploy != -1 ) then {
			player removeAction _idact_redeploy;
			_idact_redeploy = -1;
		};
	};

	if ( (_fobdistance < _distredeploy || ( count _neararsenal != 0 || count _neardevicebox != 0 ) || (player distance lhd) < 200  || (player distance nimitz) < 200) && alive player && vehicle player == player ) then {
		if (_idact_arsenal == -1) then {
			_idact_arsenal = player addAction ["<t color='#FFFF00'>" + localize "STR_ARSENAL_ACTION" + "</t> <img size='2' image='res\ui_arsenal.paa'/>","fnc\fn_openArmoury.sqf","",-980,true,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_arsenal != -1 ) then {
			player removeAction _idact_arsenal;
			_idact_arsenal = -1;
		};
	};

	if ( (_fobdistance < _distfob || count _nearbuildtruck != 0 || (player distance nimitz) < 70) && alive player && vehicle player == player && ( ( [ player, 3 ] call F_fetchPermission ) || ( player == ( [] call F_getCommander ) || [] call F_isAdmin ) ) ) then {
		if ( _idact_build == -1 ) then {
			_idact_build = player addAction ["<t color='#FFFF00'>" + localize "STR_BUILD_ACTION" + "</t> <img size='2' image='res\ui_build.paa'/>","scripts\client\build\open_build_menu.sqf","",-985,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_build != -1 ) then {
			player removeAction _idact_build;
			_idact_build = -1;
		};
	};

	if ( count _nearfobbox != 0 && alive player && vehicle player == player && !(surfaceIsWater getpos player) && ((player distance lhd) > 1000) && ((player distance nimitz) > 1000) && ( ( [ player, 3 ] call F_fetchPermission ) || ( player == ( [] call F_getCommander ) || [] call F_isAdmin ) )) then {
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
	
	if ( count _neardevicebox != 0 && alive player && vehicle player == player && ( [ player, 5 ] call F_fetchPermission ) ) then {
		if ( _idact_builddevice == -1 ) then {
			_idact_builddevice = player addAction ["<t color='#FFFF00'>" + "-- BUILD FACTORY DEVICE" + "</t> <img size='2' image='res\ui_build.paa'/>","scripts\client\build\do_build_device.sqf","",-985,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_builddevice != -1 ) then {
			player removeAction _idact_builddevice;
			_idact_builddevice = -1;
		};
	};
	
	if ( count _neargeneratorbox != 0 && alive player && vehicle player == player && ( [ player, 5 ] call F_fetchPermission ) ) then {
		if ( _idact_buildgenerator == -1 ) then {
			_idact_buildgenerator = player addAction ["<t color='#FFFF00'>" + "-- BUILD POWER GENERATOR" + "</t> <img size='2' image='res\ui_build.paa'/>","scripts\client\build\do_build_generator.sqf","",-985,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_buildgenerator != -1 ) then {
			player removeAction _idact_buildgenerator;
			_idact_buildgenerator = -1;
		};
	};
	
	if ( count _nearsolarbox != 0 && alive player && vehicle player == player && ( [ player, 5 ] call F_fetchPermission ) ) then {
		if ( _idact_buildsolar == -1 ) then {
			_idact_buildsolar = player addAction ["<t color='#FFFF00'>" + "-- BUILD SOLAR PANEL" + "</t> <img size='2' image='res\ui_build.paa'/>","scripts\client\build\do_build_solar.sqf","",-985,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_buildsolar != -1 ) then {
			player removeAction _idact_buildsolar;
			_idact_buildsolar = -1;
		};
	};
	
	if ( count _nearcarshop != 0 && alive player && vehicle player == player && ( player getVariable ["St_class", "assault"] ) == "engineer" ) then {
		if ( _idact_sparewheel == -1 ) then {
			_idact_sparewheel = player addAction ["<t color='#9D162E'>" + "-- GET SPARE WHEEL" + "</t>",{ buildtype = "spareWheel"; dobuild = 1; },"",0,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_sparewheel != -1 ) then {
			player removeAction _idact_sparewheel;
			_idact_sparewheel = -1;
		};
	};
	
	if ( count _nearcarshop != 0 && alive player && vehicle player == player && ( player getVariable ["St_class", "assault"] ) == "engineer" ) then {
		if ( _idact_sparetrack == -1 ) then {
			_idact_sparetrack = player addAction ["<t color='#9D162E'>" + "-- GET SPARE TRACK" + "</t>",{ buildtype = "spareTrack"; dobuild = 1; },"",0,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_sparetrack != -1 ) then {
			player removeAction _idact_sparetrack;
			_idact_sparetrack = -1;
		};
	};
	
	if ( count _nearmedical != 0 && alive player && vehicle player == player ) then {
		if ( _idact_medical == -1 ) then {
			_idact_medical = player addAction ["Provide Medical Attention", {
					[
						20,
						[],
						{
							[objNull, player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
							hintSilent "You're good to go soldier. Try to be more careful next time.";
						},
						{

						},
						"Providing Medical Attention..."
					] call ace_common_fnc_progressBar;
				},"",0,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_medical != -1 ) then {
			player removeAction _idact_medical;
			_idact_medical = -1;
		};
	};
	
	if ( ( count GRLIB_all_fobs > 0 ) && ( GRLIB_endgame == 0 ) && (_fobdistance < _distredeploy || (player distance lhd) < 200 || (player distance nimitz) < 200) && alive player && vehicle player == player && ( ( [ player, 5 ] call F_fetchPermission ) || ( player == ( [] call F_getCommander ) || [] call F_isAdmin ) ) ) then {
		if ( _idact_secondary == -1 ) then {
			_idact_secondary = player addAction ["<t color='#FFFF00'>" + localize "STR_SECONDARY_OBJECTIVES" + "</t>","scripts\client\ui\secondary_ui.sqf","",-993,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_secondary != -1 ) then {
			player removeAction _idact_secondary;
			_idact_secondary = -1;
		};
	};

	sleep 1;
};

action_manager_dead = true;