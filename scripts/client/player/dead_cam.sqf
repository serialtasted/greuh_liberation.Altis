private [ "_cam" ];

while { true } do {
	waitUntil {
		player getVariable ["ACE_isUnconscious", false]
	};
	
	trigger_client_save = true;
	
	showCinemaBorder false;
	camUseNVG false;
	_cam = "camera" camCreate (getPosASLW player);
	_cam camSetTarget player;
	_cam cameraEffect ["internal","back"];
	_cam camSetPos [(getPosASLW player) select 0, (getPosASLW player) select 1, (getPosASLW player) select 2];
	_cam camCommit 0;
	
	"SmokeShellOrange" createVehicle [(getPosATL player) select 0, (getPosATL player) select 1, (getPosATL player) select 2];
	
	_cam camSetPos [(getPosASLW player) select 0, (getPosASLW player) select 1, ((getPosASLW player) select 2) + 250];
	_cam camCommit 1505;
	
	player spawn {
		sleep 300;
		if ( player getVariable ["ACE_isUnconscious", false] ) then {
			_dialog = createDialog "St_DeadScreen";
			waitUntil { dialog };
		};
	};
	
	waitUntil {
		!( player getVariable ["ACE_isUnconscious", true] )
	};
	
	
	
	_cam cameraEffect ["Terminate","back"];
	camDestroy _cam;
};