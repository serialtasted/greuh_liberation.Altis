private [ "_cam" ];

while { true } do {
	waitUntil {	player getVariable ["ACE_isUnconscious", false] };
	
	trigger_client_save = true;
	
	showCinemaBorder false;
	camUseNVG false;
	_cam = "camera" camCreate (getPosASLW player);
	_cam camSetTarget player;
	_cam cameraEffect ["internal","back"];
	_cam camSetPos [(getPosASLW player) select 0, (getPosASLW player) select 1, (getPosASLW player) select 2];
	
	if ( (date select 3) < 4 || (date select 3) >= 20 ) then { camUseNVG true; } else { camUseNVG false; };
	
	"filmGrain" ppEffectAdjust [0.3, 2, 4, 0.5, 0.5, true];
	"filmGrain" ppEffectCommit 0;
	"filmGrain" ppEffectEnable TRUE;

	"colorCorrections" ppEffectAdjust [1, 1.6, -0.35, [1, 1, 1, 0], [1, 1, 1, 0], [0.75, 0.25, 0, 1.0]];
	"colorCorrections" ppEffectCommit 0;
	"colorCorrections" ppEffectEnable TRUE;

	_randomsound1 = ceil (random 6);
	_randomsound2 = ceil (random 3);
	_deathsound = format ["A3\sounds_f\characters\human-sfx\P0%1\Hit_Max_%2.wss",_randomsound1,_randomsound2];

	playSound3D [_deathsound, player, false, getPos player, 1, 1, 0];
	
	_cam camCommit 0;
	
	//"SmokeShellOrange" createVehicle [(getPosATL player) select 0, (getPosATL player) select 1, (getPosATL player) select 2];
	
	_cam camSetPos [(getPosASLW player) select 0, (getPosASLW player) select 1, ((getPosASLW player) select 2) + 250];
	_cam camCommit 1505;
	
	player spawn {
		
		private _delayrespawn = 0;
		while { _delayrespawn < 600 } do {
			sleep 1;
			if ( player getVariable ["ACE_isUnconscious", false] ) then { _delayrespawn = _delayrespawn + 1 }
			else { _delayrespawn = 600 };
		};
		
		if ( player getVariable ["ACE_isUnconscious", false] ) then {
			_dialog = createDialog "St_DeadScreen";
			waitUntil { dialog };
		};
		
	};
	
	waitUntil {	player getVariable ["ACE_isUnconscious", true] isEqualTo false	};
	
	if ( dialog ) then {
		closeDialog 0;
	};
	
	"colorCorrections" ppEffectEnable FALSE;
	"filmGrain" ppEffectEnable FALSE;
	["EastWind"] call BIS_fnc_setPPeffectTemplate;
	_cam cameraEffect ["Terminate","back"];
	camDestroy _cam;
	camUseNVG false;
};