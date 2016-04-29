GRLIB_save_key = "GREUH_LIBERATION_SAVEGAME";							// change this value if you want different savegames on different map

_serverName = "";
if ( serverName isEqualTo "" ) then {
	_serverName = "SP";
} else {
	{ _serverName = format ["%1%2",_serverName,_x] } foreach (toArray serverName);
};
GRLIB_client_key = format ["GREUH_LIBERATION_CLIENT_%1", _serverName];	// change this value if you want different savegames on different map (unique per server)

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
GRLIB_blufor_cap = 100								* GRLIB_unitcap;
GRLIB_sector_cap = 180								* GRLIB_unitcap;
GRLIB_battlegroup_cap = 150							* GRLIB_unitcap;
GRLIB_patrol_cap = 150								* GRLIB_unitcap;
GRLIB_battlegroup_size = 6							* (sqrt GRLIB_unitcap) * (sqrt GRLIB_csat_aggressivity);
GRLIB_civilians_amount = 10	 						* GRLIB_civilian_activity;
GRLIB_fob_range = 100;
GRLIB_cleanup_delay = 1200;
GRLIB_surrender_chance = 80;
GRLIB_secondary_missions_costs = [ 10, 8, 10 ];
GRLIB_halo_altitude = 4000;
GRLIB_ignored_markers = [];

if ( GRLIB_blufor_cap > 100 ) then { GRLIB_blufor_cap = 100 }; // Don't forget that the human commander manages those, not the server

GRLIB_offload_diag = false;

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
SEN_TFAR_LR = "tf_rt1523g_big_rhs";
publicVariable "SEN_TFAR_LR";