choiceslist = [];

GRLIB_force_redeploy = false;

waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "save_is_loaded" };

_spawn_str = "";

waitUntil { !isNil "introDone" };
waitUntil { introDone };
waitUntil { !isNil "cinematic_camera_stop" };
waitUntil { cinematic_camera_stop };

_basenamestr = "";
if ( GRLIB_isAtlasPresent ) then {
	_basenamestr = "BLUFOR LHD";
} else {
	_basenamestr = "BASE CHIMERA";
};

while { true } do {
	waitUntil {
		sleep 0.1;
		( GRLIB_force_redeploy || (player distance (getmarkerpos "respawn_west") < 30) ) && vehicle player == player && alive player && !dialog && howtoplay == 0
	};

	GRLIB_force_redeploy = false;
	
	if ( !GRLIB_fatigue ) then {
		player enableStamina false;
	};
	player setCustomAimCoef 0.25;
	
	[] call F_assignComms;

	_dialog = createDialog "liberation_deploy";
	deploy = 0;
	_oldsel = -999;

	showCinemaBorder false;
	camUseNVG false;
	respawn_camera = "camera" camCreate (getposASLW lhd);
	respawn_object = "Sign_Arrow_Blue_F" createVehicleLocal (getposASLW lhd);
	respawn_object hideObject true;
	respawn_camera camSetTarget respawn_object;
	respawn_camera cameraEffect ["internal","back"];
	respawn_camera camcommit 0;

	waitUntil { dialog };

	((findDisplay 5201) displayCtrl 201) ctrlAddEventHandler [ "mouseButtonDblClick" , { deploy = 1; } ];

	while { dialog && alive player && deploy == 0 } do {
		choiceslist = [ [ _basenamestr, getpos lhd ] ];
		
		if ( PARAMS_AllowFOBDeploy == 1 || count allPlayers <= 5 ) then {
			for [{_idx=0},{_idx < count GRLIB_all_fobs},{_idx=_idx+1}] do {
				choiceslist = choiceslist + [[format [ "FOB %1 - %2", (military_alphabet select _idx),mapGridPosition (GRLIB_all_fobs select _idx) ],GRLIB_all_fobs select _idx]];
			};
		};

		_respawn_trucks = call F_getMobileRespawns;
		
		if ( PARAMS_AllowMobileDeploy == 1 || count allPlayers <= 3 ) then {
			for [ {_idx=0},{_idx < count _respawn_trucks},{_idx=_idx+1} ] do {
				choiceslist = choiceslist + [[format [ "%1 - %2", localize "STR_RESPAWN_TRUCK",mapGridPosition (getpos (_respawn_trucks select _idx)) ],getpos (_respawn_trucks select _idx),(_respawn_trucks select _idx)]];
			};
		};

		lbClear 201;
		{
			lbAdd [201, (_x select 0)];
		} foreach choiceslist;

		if ( lbCurSel 201 == -1 ) then {
			 lbSetCurSel [201,0];
		};

		if ( lbCurSel 201 != _oldsel ) then {
			_oldsel = lbCurSel 201;
			_objectpos = ((choiceslist select _oldsel) select 1);
			if ( surfaceIsWater _objectpos) then {
				respawn_object setposasl [_objectpos select 0, _objectpos select 1, 15];
			} else {
				respawn_object setpos ((choiceslist select _oldsel) select 1);
			};
			_startdist = 120;
			_enddist = 120;
			_alti = 35;
			if (((choiceslist select (lbCurSel 201)) select 0) == "BLUFOR LHD") then {
				_startdist = 200;
				_enddist = 300;
				_alti = 30;
			};

			"spawn_marker" setMarkerPosLocal (getpos respawn_object);
			ctrlMapAnimClear ((findDisplay 5201) displayCtrl 251);
			((findDisplay 5201) displayCtrl 251) ctrlMapAnimAdd [1.33, 1.2, getpos respawn_object];
			((findDisplay 5201) displayCtrl 251) ctrlMapAnimAdd [1.33, 0.25, getpos respawn_object];
			ctrlMapAnimCommit ((findDisplay 5201) displayCtrl 251);

			respawn_camera camSetPos [(getpos respawn_object select 0) - 70, (getpos respawn_object select 1) + _startdist, (getpos respawn_object select 2) + _alti];
			respawn_camera camcommit 0;
			respawn_camera camSetPos [(getpos respawn_object select 0) - 70, (getpos respawn_object select 1) - _enddist, (getpos respawn_object select 2) + _alti];
			respawn_camera camcommit 90;
		};
		
		sleep 0.1;
	};
	
	if (deploy == 1) then {
		_idxchoice = lbCurSel 201;
		_spawn_str = (choiceslist select _idxchoice) select 0;

		if (((choiceslist select _idxchoice) select 0) == _basenamestr) then {
			call respawn_lhd;
		} else {
			if (count (choiceslist select _idxchoice) == 3) then {
				_truck = (choiceslist select _idxchoice) select 2;
				player setpos ([_truck, 5 + (random 3), random 360] call BIS_fnc_relPos)
			} else {
				_destpos = ((choiceslist select _idxchoice) select 1);
				player setpos [((_destpos select 0) + 5) - (random 10),((_destpos select 1) + 5) - (random 10),0];
			};
		};
	};
	
	if (dialog) then {
		closeDialog 0;
	};

	if (!dialog || !alive player || deploy == 1) then {
		respawn_camera cameraEffect ["Terminate","back"];
		camDestroy respawn_camera;
		deleteVehicle respawn_object;
		camUseNVG false;
		"spawn_marker" setMarkerPosLocal markers_reset;
	};

	if (alive player && deploy == 1) then {
		[_spawn_str] spawn spawn_camera;
	};
};