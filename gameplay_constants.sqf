_worldName = worldName;
_serverName = "";
if ( serverName isEqualTo "" ) then {
	_serverName = "SP";
} else {
	{ _serverName = format ["%1%2",_serverName,_x] } foreach (toArray serverName);
};

_worldDesert = [ "takistan", "lythium" ];
_worldTropical = [ "tanoa" ];
_worldWinter = [  ];
_worldWoodland = [ "altis", "chernarus", "chernarus_summer", "xcam_taunus" ];
_chernarusVersions = [ "chernarus", "chernarus_summer" ];

GRLIB_worldName = toLower(_worldName);
if ( GRLIB_worldName in _chernarusVersions ) then { _worldName = "Chernarus" };

GRLIB_save_key = format ["A3_LIBERATION_SAVEGAME_%1", _worldName];
GRLIB_client_key = format ["A3_LIBERATIONrv2_CLIENT_%1_%2", _worldName, _serverName];

GRLIB_worldType = "";
if ( GRLIB_worldName in _worldDesert ) then { GRLIB_worldType = "desert" };
if ( GRLIB_worldName in _worldTropical ) then { GRLIB_worldType = "tropical" };
if ( GRLIB_worldName in _worldWinter ) then { GRLIB_worldType = "winter" };
if ( GRLIB_worldName in _worldWoodland ) then { GRLIB_worldType = "woodland" };

GRLIB_side_friendly = WEST;
GRLIB_side_friendly_s = "WEST";
GRLIB_side_enemy = EAST;
GRLIB_side_enemy_s = "EAST";
GRLIB_side_resistance = RESISTANCE;
GRLIB_side_resistance_s = "RESISTANCE";
GRLIB_side_civilian = CIVILIAN;
GRLIB_side_civilian_s = "CIVILIAN";
GRLIB_respawn_marker = "respawn_west";
GRLIB_color_friendly = "ColorBLUFOR";
GRLIB_color_enemy = "ColorOPFOR";
GRLIB_color_enemy_bright = "ColorRED";

GRLIB_save_interval = 45;
GRLIB_sector_size = 1000;
GRLIB_capture_size = 175;
GRLIB_radiotower_size = 2500;
GRLIB_recycling_percentage = 0.65;
GRLIB_endgame = 0;
GRLIB_vulnerability_timer = 1200;
GRLIB_defended_buildingpos_part = 0.6;
GRLIB_sector_military_value = 3;
GRLIB_secondary_objective_impact = 0.6;
GRLIB_blufor_cap = 150								* GRLIB_unitcap;
GRLIB_sector_cap = 175								* GRLIB_unitcap;
GRLIB_battlegroup_cap = 150							* GRLIB_unitcap;
GRLIB_patrol_cap = 150								* GRLIB_unitcap;
GRLIB_battlegroup_size = 4							* (sqrt GRLIB_unitcap) * (sqrt GRLIB_csat_aggressivity);
GRLIB_civilians_amount = 8	 						* GRLIB_civilian_activity;
GRLIB_fob_range = 150;
GRLIB_cleanup_delay = 1200;
GRLIB_surrender_chance = 75;
GRLIB_secondary_missions_costs = [ 15, 10, 8 ];
GRLIB_halo_altitude = 3000;
GRLIB_civ_killing_penalty = 20;
GRLIB_ignored_markers = [];

unitcap_respawns_limit = 25;
unitcap = unitcap_respawns_limit;

if ( GRLIB_blufor_cap > 300 ) then { GRLIB_blufor_cap = 100 }; // Don't forget that the human commander manages those, not the server

GRLIB_offload_diag = false;
GRLIB_delay_allow_defenders = true;

// TFAR defenitions
tf_give_personal_radio_to_regular_soldier = false;
publicVariable "tf_give_personal_radio_to_regular_soldier";
tf_no_auto_long_range_radio = true;
publicVariable "tf_no_auto_long_range_radio";
tf_give_microdagr_to_soldier = false;
publicVariable "tf_give_microdagr_to_soldier";
tf_same_sw_frequencies_for_side = true;
publicVariable "tf_same_sw_frequencies_for_side";
tf_same_lr_frequencies_for_side = true;
publicVariable "tf_same_lr_frequencies_for_side";
tf_default_radioVolume = 6;
publicVariable "tf_default_radioVolume";
SEN_TFAR_RF = "tf_rf7800str";
publicVariable "SEN_TFAR_RF";
SEN_TFAR_SW = "tf_anprc152";
publicVariable "SEN_TFAR_SW";
SEN_TFAR_LR = "";
if ( GRLIB_worldType == "desert" ) then { SEN_TFAR_LR = "tfw_ilbe_dd_d" };
if ( GRLIB_worldType == "tropical" ) then { SEN_TFAR_LR = "tfw_ilbe_dd_gr" };
if ( GRLIB_worldType == "winter" ) then { SEN_TFAR_LR = "tfw_ilbe_dd_gr" };
if ( GRLIB_worldType == "woodland" ) then { SEN_TFAR_LR = "tfw_ilbe_dd_gr" };
publicVariable "SEN_TFAR_LR";

diag_log format["-- WORLD KEYS --"];
diag_log format["SAVE KEY   ------- %1", GRLIB_save_key];
diag_log format["CLIENT KEY ------- %1", GRLIB_client_key];
diag_log format["WORLD NAME ------- %1", GRLIB_worldName];
diag_log format["WORLD TYPE ------- %1", GRLIB_worldType];