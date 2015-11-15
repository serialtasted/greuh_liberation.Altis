while { GRLIB_endgame == 0 } do {
	sleep GRLIB_save_interval;
	trigger_server_save = true;
	sleep 0.3;
	trigger_client_save = true;
};