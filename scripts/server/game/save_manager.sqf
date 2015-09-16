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

_classnames_to_save = _classnames_to_save + _classnames_to_save_blu + militia_vehicles + opfor_vehicles + opfor_troup_transports + opfor_air + opfor_choppers;

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

	if ( count greuh_liberation_savegame > 11 ) then {
		GRLIB_vehicle_to_military_base_links = greuh_liberation_savegame select 11;
	};

	stats_saves_loaded = stats_saves_loaded + 1;

	{
		_nextclass = _x select 0;

		if ( _nextclass in _classnames_to_save ) then {
			_nextpos = _x select 1;
			_nextdir = _x select 2;
			_hascrew = false;
			if ( count _x > 3 ) then {
				_hascrew = _x select 3;
			};
			_nextbuilding = _nextclass createVehicle _nextpos;
			_nextbuilding setVectorUp [0,0,1];
			_nextbuilding setpos _nextpos;
			_nextbuilding setdir _nextdir;
			_nextbuilding setVectorUp [0,0,1];
			_nextbuilding setpos _nextpos;
			_nextbuilding setdir _nextdir;
			_nextbuilding setdamage 0;
			if ( _hascrew ) then {
				createVehicleCrew _nextbuilding;
			};

			if ( !(_nextclass in no_kill_handler_classnames ) ) then {
				_nextbuilding addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
			};
		};

	} foreach buildings_to_save;

	setDate [date_year, date_month, date_day, time_of_day, date select 4];
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

uiSleep 0.5;
save_is_loaded = true; publicVariable "save_is_loaded";

while { true } do {
	waitUntil {
		sleep 0.3;
		trigger_server_save || GRLIB_endgame == 1;
	};

	if ( GRLIB_endgame == 1 ) then {
		profileNamespace setVariable [ GRLIB_save_key, nil ];
		saveProfileNamespace;
		while { true } do { sleep 300; };
	} else {

		trigger_server_save = false;
		buildings_to_save = [];

		_all_buildings = [];
		{
			_fobpos = _x;
			_nextbuildings = [ _fobpos nearobjects (GRLIB_fob_range * 2), {
				((typeof _x) in _classnames_to_save ) &&
				( alive _x) &&
				( speed _x < 5 ) &&
				( isNull  attachedTo _x ) &&
				(((getpos _x) select 2) < 10 )
 				} ] call BIS_fnc_conditionalSelect;

			_all_buildings = _all_buildings + _nextbuildings;
		} foreach GRLIB_all_fobs;

		{
			_nextclass = typeof _x;
			_nextpos = [(getpos _x) select 0, (getpos _x) select 1, 0];
			_nextdir = getdir _x;
			_hascrew = false;
			if ( _nextclass in _classnames_to_save_blu ) then {
				if ( ( { !isPlayer _x } count (crew _x) ) > 0 ) then {
					_hascrew = true;
				};
			};
			buildings_to_save pushback [ _nextclass,_nextpos,_nextdir,_hascrew ];
		} foreach _all_buildings;

		time_of_day = date select 3;

		stats_saves_performed = stats_saves_performed + 1;

		if ( count GRLIB_all_fobs < 26 ) then { // Tentative protection for a very rare bug (one occurence all time, non reproductible) that can destroy savegames

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

			greuh_liberation_savegame = [ blufor_sectors, GRLIB_all_fobs, buildings_to_save, time_of_day,combat_readiness, date select 0, date select 1, date select 2, resources_ammo, _stats,
			[ infantry_weight, armor_weight, air_weight ], GRLIB_vehicle_to_military_base_links ];

			profileNamespace setVariable [ GRLIB_save_key, greuh_liberation_savegame ];
			saveProfileNamespace;
		};
	};
};