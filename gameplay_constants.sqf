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
GRLIB_terror_civilians = [];
GRLIB_terror_enabled = false;

GRLIB_markerToTask = [];

GRLIB_taskDescriptions = [
	["kill bandits", "Local town authority asked us to purge unclean in bandit's camp location nearby", "Eliminate bandits camp"],
	["destroy roadblock", "Town major notified us that OPFOR roadblock nearby causes heavy business losses to his town - road mostly closed for his drivers to pass government convoys. The best time to ambush something.", "Capture and ambush"],
	["comm array", "People of nearby town are very unhappy of small military communications post situated near the town. It was illegally powered from city's electrical network causing major issues with network stabiliity inside the town and lots of burned toasters. Locals will be pleased if you solve this problem.", "Destroy communications post"],
	["demolitions", "As town elder said, bunch of hobos turned peaceful area near his town into disgusting slums. Locals did their best to kick hobos off, but they always returned back. We were asked to blow off that place to hell. Elder notified us that his people saw a pistol under the jacket of one of hobos. We don't think they are armed, but you never know.", "Peaceful demolitions"],
	["deliver wheels", "Today morning your usual routine of checking nearby towns requests was suddenly broken by rude man's voice, calling from a radio tuned on town major's frequency. 'Owner of this voice must be made of iron' - you thought - 'This request definitely needs some attention'.\n 'Hello, son. This is Tom... *cough* Corporal MacGrant speaking. Aside that your goddamn war is freaking out my citizens, it is messing with our business. You may think, rednecks like us don't have any obligations, but hell you are wrong. One of my trucks is out of duty because some goddamn cowboy shot two tyres and I don't have a spare. Thankfully, driver was not injured, he's a good fella.'\n Then iron man turned into Watto - junk dealer from Tatooine - and continued: 'So, could you be so kind and deliver 4 brand new truck wheels to my fellow town. You are not with army, I know you have new things all around. That small ddonation will help to arrange deal between us. MacGrant over.'", "Wheels of Freedom"],
	["roadblock small", "We were tasked to eliminate roadblock near the town. Destroy all defenders and prevent OPFOR from restoring checkpoint functionality by destroying all fortifications.", "Destroy roadblock"],
	["food order", "Local government in attempt to weak and frighten local cities cut food supplies from capitals. This is one of examples: the city is slowly dying without food and they need something bigger than our military rations. A government food storage nearby could solve their problems. The single obstackle that it is very well defended. Grab at least 5 food supplies and deliver to city center.", "Feed the city"],
	["escape", "Help town elder's sons escape from Altis", "Running men"]
]; 

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

diag_log format["SAVE KEY   ------- %1", GRLIB_save_key];
diag_log format["CLIENT KEY ------- %1", GRLIB_client_key];
diag_log format["WORLD NAME ------- %1", GRLIB_worldName];
diag_log format["WORLD TYPE ------- %1", GRLIB_worldType];