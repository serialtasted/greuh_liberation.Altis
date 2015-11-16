while { GRLIB_endgame == 0 } do {
	sleep GRLIB_save_interval;
	trigger_server_save = true;
	trigger_client_save = true; publicVariable "trigger_client_save";
};