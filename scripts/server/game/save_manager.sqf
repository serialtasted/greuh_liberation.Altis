//******************************************************************
//WARNING /!\ - ONLY UNCOMMENT TO RESET GAME IN EDITOR!!!!!!!!!
//
//GRLIB_param_wipe_savegame_1 = 1;GRLIB_param_wipe_savegame_2 = 1;GRLIB_build_first_fob=true;
//
//WARNING /!\ - ONLY UNCOMMENT TO RESET GAME IN EDITOR!!!!!!!!!
//******************************************************************

if ( !(isNil "GRLIB_param_wipe_savegame_1") && !(isNil "GRLIB_param_wipe_savegame_2") ) then {
	if ( GRLIB_param_wipe_savegame_1 == 1 && GRLIB_param_wipe_savegame_2 == 1 ) then {
		profileNamespace setVariable [ GRLIB_save_key,nil ];
		saveProfileNamespace;
	};
};

date_year = date select 0;
date_month = date select 1;
date_day = date select 2;
blufor_sectors = [];
GRLIB_all_fobs = [];
buildings_to_save= [];
mines_to_save = [];
combat_readiness = 0;
saved_ammo_res = 0;
stats_opfor_soldiers_killed = 0;
stats_opfor_killed_by_players = 0;
stats_blufor_soldiers_killed = 0;
stats_player_deaths = 0;
stats_opfor_vehicles_killed = 0;
stats_opfor_vehicles_killed_by_players = 0;
stats_blufor_vehicles_killed = 0;
stats_blufor_soldiers_recruited = 0;
stats_blufor_vehicles_built = 0;
stats_civilians_killed = 0;
stats_civilians_killed_by_players = 0;
stats_sectors_liberated = 0;
stats_playtime = 0;
stats_spartan_respawns = 0;
stats_secondary_objectives = 0;
stats_hostile_battlegroups = 0;
stats_ieds_detonated = 0; publicVariable "stats_ieds_detonated";
stats_saves_performed = 0;
stats_saves_loaded = 0;
stats_reinforcements_called = 0;
stats_prisonners_captured = 0;
stats_blufor_teamkills = 0;
stats_vehicles_recycled = 0;
stats_ammo_spent = 0;
stats_sectors_lost = 0;
stats_fobs_built = 0;
stats_fobs_lost = 0;
stats_readiness_earned = 0;
infantry_weight = 33;
armor_weight = 33;
air_weight = 33;
GRLIB_vehicle_to_military_base_links = [];
GRLIB_permissions = [];
ai_groups = [];
saved_intel_res = 0;
GRLIB_player_scores = [];

no_kill_handler_classnames = [FOB_typename, huron_typename];
_classnames_to_save = [FOB_typename, huron_typename];
_classnames_to_save_blu = [];
{
	no_kill_handler_classnames pushback (_x select 0);
	_classnames_to_save pushback (_x select 0);
} foreach buildings;

{
	_classnames_to_save_blu pushback (_x select 0);
} foreach (static_vehicles + air_vehicles + heavy_vehicles + light_vehicles + support_vehicles);

_classnames_to_save = _classnames_to_save + _classnames_to_save_blu + all_hostile_classnames;

trigger_server_save = false;
greuh_liberation_savegame = profileNamespace getVariable GRLIB_save_key;

if ( !isNil "greuh_liberation_savegame" ) then {

	blufor_sectors = greuh_liberation_savegame select 0;
	GRLIB_all_fobs = greuh_liberation_savegame select 1;
	buildings_to_save = greuh_liberation_savegame select 2;
	time_of_day = greuh_liberation_savegame select 3;
	combat_readiness = greuh_liberation_savegame select 4;
	date_year = greuh_liberation_savegame select 5;
	date_month = greuh_liberation_savegame select 6;
	date_day = greuh_liberation_savegame select 7;
	saved_ammo_res = greuh_liberation_savegame select 8;

	if ( "capture_13_1_2_26_25" in blufor_sectors ) then { // Patching Molos Airfield which was a town instead of a factory
		blufor_sectors = blufor_sectors - [ "capture_13_1_2_26_25" ];
		blufor_sectors = blufor_sectors + [ "factory666" ];
	};

	if ( count greuh_liberation_savegame > 9 ) then {
		_stats = greuh_liberation_savegame select 9;
		stats_opfor_soldiers_killed = _stats select 0;
		stats_opfor_killed_by_players = _stats select 1;
		stats_blufor_soldiers_killed = _stats select 2;
		stats_player_deaths = _stats select 3;
		stats_opfor_vehicles_killed = _stats select 4;
		stats_opfor_vehicles_killed_by_players = _stats select 5;
		stats_blufor_vehicles_killed = _stats select 6;
		stats_blufor_soldiers_recruited = _stats select 7;
		stats_blufor_vehicles_built = _stats select 8;
		stats_civilians_killed = _stats select 9;
		stats_civilians_killed_by_players = _stats select 10;
		stats_sectors_liberated = _stats select 11;
		stats_playtime = _stats select 12;
		stats_spartan_respawns = _stats select 13;
		stats_secondary_objectives = _stats select 14;
		stats_hostile_battlegroups = _stats select 15;
		stats_ieds_detonated = _stats select 16; publicVariable "stats_ieds_detonated";
		stats_saves_performed = _stats select 17;
		stats_saves_loaded = _stats select 18;
		stats_reinforcements_called = _stats select 19;
		stats_prisonners_captured = _stats select 20;
		stats_blufor_teamkills = _stats select 21;
		stats_vehicles_recycled = _stats select 22;
		stats_ammo_spent = _stats select 23;
		stats_sectors_lost = _stats select 24;
		stats_fobs_built = _stats select 25;
		stats_fobs_lost = _stats select 26;
		stats_readiness_earned = _stats select 27;
	};

	if ( count greuh_liberation_savegame > 10 ) then {
		_weights = greuh_liberation_savegame select 10;
		infantry_weight = _weights select 0;
		armor_weight = _weights select 1;
		air_weight = _weights select 2;
	};

	if ( count greuh_liberation_savegame > 11 && !GRLIB_param_resetelite ) then {
		GRLIB_vehicle_to_military_base_links = greuh_liberation_savegame select 11;
	};

	if ( count greuh_liberation_savegame > 12 ) then {
		GRLIB_permissions = greuh_liberation_savegame select 12;
	};
	
	if ( count greuh_liberation_savegame > 13 ) then {
		ai_groups = greuh_liberation_savegame select 13;
	};

	if ( count greuh_liberation_savegame > 14 ) then {
		saved_intel_res = greuh_liberation_savegame select 14;
	};
	
	if ( count greuh_liberation_savegame > 15 ) then {
 		GRLIB_player_scores = greuh_liberation_savegame select 15;
 	};
	
	if ( count greuh_liberation_savegame > 16 ) then {
 		mines_to_save = greuh_liberation_savegame select 16;
 	};

	setDate [date_year, date_month, date_day, time_of_day, 0];
	
	_correct_fobs = [];
	{
		_next_fob = _x;
		_keep_fob = true;
		{
			if ( _next_fob distance (markerpos _x) < 50 ) exitWith { _keep_fob = false };
		} foreach sectors_allSectors;
		if ( _keep_fob ) then { _correct_fobs pushback _next_fob };
	} foreach GRLIB_all_fobs;
	GRLIB_all_fobs = _correct_fobs;

	stats_saves_loaded = stats_saves_loaded + 1;

	{
		_nextclass = _x select 0;
		varNextPos = [];
		varNextDir = 0;

		if ( _nextclass in _classnames_to_save ) then {
			varNextPos = [] + (_x select 1);
			varNextDir = 0 + (_x select 2);
			_hascrew = false;
			if ( count _x > 3 ) then {
				_hascrew = _x select 3;
			};
			
			_vectorup = _x select 4;
			if ( isNil { _vectorup select 1 }) then {
				_vectorup = [0,0,1];
			};
			
			diag_log format["OBJ: %1 | NEXTPOS: %2 | NEXTDIR: %3", _nextclass, varNextPos, varNextDir];
			
			_nextbuilding = _nextclass createVehicle varNextPos;
			_nextbuilding setPosATL varNextPos;
			_nextbuilding setVariable ["truePos", varNextPos, true];
			_nextbuilding setdir varNextDir;
			_nextbuilding setVariable ["trueDir", varNextDir, true];
			_nextbuilding setdamage 0;
			
			//TO DO: LOAD VEHICLES
			
			if ( _hascrew ) then {
				[ _nextbuilding ] call F_forceBluforCrew;
			};
			
			_nextbuilding setVectorUp _vectorup;

			if ( !(_nextclass in no_kill_handler_classnames ) ) then {
				_nextbuilding addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
			};
			
			if ( _nextclass in all_hostile_classnames ) then {
				_nextbuilding setVariable [ "GRLIB_captured", 1, true ];
			};
		};
	} foreach buildings_to_save;
	
	_mines = [] + mines_to_save;
	{
		_nextclass = _x select 0;
		varNextPos = [];
		varNextDir = 0;
		
		if ( _nextclass in GRLIB_mines_to_be_saved ) then {
			varNextPos = [] + (_x select 1);
			varNextDir = 0 + (_x select 2);
			
			_minename = "";
			switch ( _nextclass ) do {
				case "ATMine_Range_Ammo": { _minename = "ATMine"; };
				case "APERSMine_Range_Ammo": { _minename = "APERSMine"; };
				case "APERSBoundingMine_Range_Ammo": { _minename = "APERSBoundingMine"; };
				case "SLAMDirectionalMine_Wire_Ammo": { _minename = "SLAMDirectionalMine"; };
				case "SLAMDirectionalMine_Magnetic_Ammo": { _minename = "SLAMDirectionalMine"; };
				case "APERSTripMine_Wire_Ammo": { _minename = "APERSTripMine"; };
			};
			
			_mine = createMine [ _minename, [varNextPos select 0, varNextPos select 1, 0], [], 0];
			_mine setdir varNextDir;
			_mine setdamage 0;
		};
	} foreach _mines;

	sleep 0.1;

	{
		private [ "_nextgroup", "_grp" ];
		_nextgroup = _x;
		_grp = createGroup WEST;

		{
			private [ "_nextunit", "_nextobj"];
			_nextunit = _x;
			varNextPos = [(_nextunit select 1) select 0, (_nextunit select 1) select 1, ((_nextunit select 1) select 2) + 0.2];
			varNextDir = _nextunit select 2;
			(_nextunit select 0) createUnit [ varNextPos, _grp, 'this addMPEventHandler ["MPKilled", {_this spawn kill_manager}] '];
			_nextobj = ((units _grp) select ((count (units _grp)) - 1));
			_nextobj setPosATL varNextPos;
			_nextobj setDir varNextDir;
		} foreach _nextgroup;
	} foreach ai_groups;
};

publicVariable "blufor_sectors";
publicVariable "GRLIB_all_fobs";

if ( count GRLIB_vehicle_to_military_base_links == 0 ) then {
	private [ "_assigned_bases", "_assigned_vehicles", "_nextbase", "_nextvehicle" ];
	_assigned_bases = [];
	_assigned_vehicles = [];

	while { count _assigned_bases < count sectors_military && count _assigned_vehicles < count elite_vehicles } do {
		_nextbase =  ( [ sectors_military, { !(_x in _assigned_bases) } ] call BIS_fnc_conditionalSelect ) call BIS_fnc_selectRandom;
		_nextvehicle =  ( [ elite_vehicles, { !(_x in _assigned_vehicles) } ] call BIS_fnc_conditionalSelect ) call BIS_fnc_selectRandom;
		_assigned_bases pushback _nextbase;
		_assigned_vehicles pushback _nextvehicle;
		GRLIB_vehicle_to_military_base_links pushback [_nextvehicle, _nextbase];
	};
} else {
	_classnames_to_check = GRLIB_vehicle_to_military_base_links;
	{
		if ( ! ( [ _x select 0 ] call F_checkClass ) ) then {
			GRLIB_vehicle_to_military_base_links = GRLIB_vehicle_to_military_base_links - [_x];
		};
	} foreach _classnames_to_check;
};
publicVariable "GRLIB_vehicle_to_military_base_links";

publicVariable "GRLIB_permissions";

uiSleep 1;
save_is_loaded = true; publicVariable "save_is_loaded";

while { true } do {
	waitUntil {
		sleep 0.3;
		trigger_server_save || GRLIB_endgame == 1;
	};
	
	diag_log "-- SAVING GAME --";

	if ( GRLIB_endgame == 1 ) then {
		profileNamespace setVariable [ GRLIB_save_key, nil ];
		saveProfileNamespace;
		while { true } do { sleep 300; };
	} else {

		trigger_server_save = false;
		buildings_to_save = [];
		ai_groups = [];
		
		_all_buildings = [];
		{
			_fobpos = _x;
			
			{
				_nextgroup = _x;
				if (  side _nextgroup == WEST ) then {
					if ( { isPlayer _x } count ( units _nextgroup ) == 0 ) then {
						if ( { alive _x } count ( units _nextgroup ) > 0  ) then {
							if ( _fobpos distance (leader _nextgroup) < GRLIB_fob_range * 2 ) then {
								private [ "_grouparray" ];
								_grouparray = [];
								{
									if ( alive _x && (vehicle _x == _x ) ) then {
										_grouparray pushback [ typeof _x, getPosATL _x, getDir _x ];
									};
								} foreach (units _nextgroup);

								ai_groups pushback _grouparray;
							};
						};
					};
				};
			} foreach allGroups;
		} foreach GRLIB_all_fobs;
		
		{
			if ( _x in sectors_military ) then {
				_sectorpos = markerpos _x;
				_nextbuildings = [ _sectorpos nearobjects (GRLIB_capture_size * 2), {
					((typeof _x) in AmmoFactory_allclasses ) &&
					( alive _x) &&
					( speed _x < 5 ) &&
					( isNull  attachedTo _x ) &&
					(((getpos _x) select 2) < 10 ) &&
					( getObjectType _x >= 8 )
					} ] call BIS_fnc_conditionalSelect;

				_all_buildings = _all_buildings + _nextbuildings;
			};
		} foreach blufor_sectors;
		
		_nextbuildings = [ allMissionObjects "", {
			( ((typeof _x) in _classnames_to_save) && !((typeof _x) in AmmoFactory_allclasses) ) &&
			( alive _x) &&
			( speed _x < 5 ) &&
			( isNull  attachedTo _x ) &&
			( ( (getPos _x) select 2 ) < 30 ) &&
			( getObjectType _x >= 8 ) &&
			( (count(_x getVariable ["truePos", []]) > 0) || ((typeof _x) in GRLIB_mines_to_be_saved) )
		} ] call BIS_fnc_conditionalSelect;
		
		_all_buildings = _all_buildings + _nextbuildings;
		
		{
			_building = _x;
			_nextclass = typeof _building;
			
			varNextPos = [];
			varNextDir = 0;
			
			if ( _building isKindOf "AllVehicles" || (_building getVariable ["ace_dragging_canCarry", false] || _building getVariable ["ace_dragging_canDrag", false]) ) then {
				if ( _building isKindOf "Air" ) then {
					if ( isTouchingGround _building || speed _building < 5 ) then {
						varNextPos = [] + (getPosATL _building);
						varNextDir = 0 + (getDir _building);
					} else {
						varNextPos = [] + (_building getVariable "truePos");
						varNextDir = 0 + (_building getVariable "trueDir");
					};
				} else {
					varNextPos = [] + (getPosATL _building);
					varNextDir = 0 + (getDir _building);
				};
			} else {
				varNextPos = [] + (_building getVariable "truePos");
				varNextDir = 0 + (_building getVariable "trueDir");
			};
			
			_hascrew = false;
			_vectorup = vectorUp _building;
			
			_excludemag = [];
			_vehammo = [];
			_curmag = "";
			{
				_weapon = _x;
				_rounds = _building ammo _weapon;
				_mags = 0;
				_prevmag = "";
				
				{
					_curmag = _x;
					if ((_curmag isEqualTo _prevmag || _prevmag isEqualTo "") && !(_curmag in _excludemag)) then { _mags = _mags + 1; _prevmag = _curmag; };
				} forEach magazines _building;
				
				_excludemag pushBack _prevmag;
				_vehammo pushBack [_weapon, _rounds, _mags];
			} forEach weapons _building;
			
			_vehcargoammo = getAmmoCargo _building;
			_vehfuel = fuel _building;
			_vehcargofuel = getFuelCargo _building;
			
			_vehweaponcargo = getWeaponCargo _building;
			_vehmagazinecargo = getMagazineCargo _building;
			_vehbackpackcargo = getBackpackCargo _building;
			_vehitemcargo = getItemCargo _building;
			
			_vehdamage = damage _building;
			
			if ( _nextclass in _classnames_to_save_blu ) then {
				if ( ( { !isPlayer _building } count (crew _building) ) > 0 ) then {
					_hascrew = true;
				};
			};
			buildings_to_save pushback [ _nextclass,varNextPos,varNextDir,_hascrew,_vectorup,[_vehammo,_vehcargoammo,_vehfuel,_vehcargofuel,_vehweaponcargo,_vehmagazinecargo,_vehbackpackcargo,_vehitemcargo,_vehdamage] ];
		} foreach _all_buildings;
		
		_mines = [ allMissionObjects "", { (typeof _x) in GRLIB_mines_to_be_saved } ] call BIS_fnc_conditionalSelect;
		diag_log format["MINES: %1",_mines];
		{
			_mine = _x;
			_nextclass = typeof _mine;
			
			varNextPos = [] + [(getPosATL _mine) select 0, (getPosATL _mine) select 1, 0];
			varNextDir = 0 + getDir _mine;
			
			mines_to_save pushback [ _nextclass,varNextPos,varNextDir ];
		} foreach _mines;

		time_of_day = date select 3;

		stats_saves_performed = stats_saves_performed + 1;
		
		private [ "_newscores", "_knownplayers", "_playerindex", "_nextplayer" ];
		_knownplayers = [];
		_newscores = [] + GRLIB_player_scores;
		{ _knownplayers pushback (_x select 0) } foreach GRLIB_player_scores;

		{
			_nextplayer = _x;

			if ( score _nextplayer >= 20 ) then {
				_playerindex = _knownplayers find (getPlayerUID _nextplayer);
				if ( _playerindex >= 0 ) then {
					_newscores set [ _playerindex, [ getPlayerUID _x, score _x] ];
				} else {
					_newscores pushback [ getPlayerUID _x, score _x ];
				};
			};
		} foreach allPlayers;
		GRLIB_player_scores = _newscores;

		_stats = [];
		_stats pushback stats_opfor_soldiers_killed;
		_stats pushback stats_opfor_killed_by_players;
		_stats pushback stats_blufor_soldiers_killed;
		_stats pushback stats_player_deaths;
		_stats pushback stats_opfor_vehicles_killed;
		_stats pushback stats_opfor_vehicles_killed_by_players;
		_stats pushback stats_blufor_vehicles_killed;
		_stats pushback stats_blufor_soldiers_recruited;
		_stats pushback stats_blufor_vehicles_built;
		_stats pushback stats_civilians_killed;
		_stats pushback stats_civilians_killed_by_players;
		_stats pushback stats_sectors_liberated;
		_stats pushback stats_playtime;
		_stats pushback stats_spartan_respawns;
		_stats pushback stats_secondary_objectives;
		_stats pushback stats_hostile_battlegroups;
		_stats pushback stats_ieds_detonated;
		_stats pushback stats_saves_performed;
		_stats pushback stats_saves_loaded;
		_stats pushback stats_reinforcements_called;
		_stats pushback stats_prisonners_captured;
		_stats pushback stats_blufor_teamkills;
		_stats pushback stats_vehicles_recycled;
		_stats pushback stats_ammo_spent;
		_stats pushback stats_sectors_lost;
		_stats pushback stats_fobs_built;
		_stats pushback stats_fobs_lost;
		_stats pushback stats_readiness_earned;

		greuh_liberation_savegame = [ blufor_sectors, GRLIB_all_fobs, buildings_to_save, time_of_day,round combat_readiness, date select 0, date select 1, date select 2, round resources_ammo, _stats,
		[ round infantry_weight, round armor_weight, round air_weight ], GRLIB_vehicle_to_military_base_links, GRLIB_permissions, ai_groups, resources_intel, GRLIB_player_scores, mines_to_save ];

		profileNamespace setVariable [ GRLIB_save_key, greuh_liberation_savegame ];
		saveProfileNamespace;
	};
	
	diag_log "** GAME SAVED **";
	systemChat "** GAME SAVED **";
};