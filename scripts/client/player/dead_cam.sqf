private [ "_cam" ];

if ( isNil "forceGiveUp" ) then { forceGiveUp = false };
if ( isNil "isAllDead" ) then { isAllDead = false };
if ( isNil "deadDiag" ) then { deadDiag = false };

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
	
	_cam camSetPos [(getPosASLW player) select 0, (getPosASLW player) select 1, ((getPosASLW player) select 2) + 250];
	_cam camCommit 1505;
	
	player spawn {
		_delayrespawn = 0;
		_playersalive = 0;
		while { _delayrespawn < 600 } do {
			sleep 1;
			_playersalive = count ( [ getpos player , 2500 ] call F_getNearbyPlayers );
			if ( (player getVariable ["ACE_isUnconscious", false] ) && _playersalive > 0 && !forceGiveUp ) then { _delayrespawn = _delayrespawn + 1 }
			else { _delayrespawn = 600 };
		};
		
		if ( player getVariable ["ACE_isUnconscious", false] ) then {
			forceGiveUp = true;
			if !( _playersalive > 0 ) then { isAllDead = true } else { isAllDead = false };
		};
	};
	
	if (dialog) then {
		closeDialog 0;
	};
	
	player call {
		
		waitUntil { !dialog };
		sleep 7;
	
		disableSerialization;
		deadDiag = true;
		
		_dialog = createDialog "St_DeadScreen";
		waitUntil { dialog };
		
		(findDisplay 2491) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"];
		
		_txtmsg = "";
		_controlText = ((findDisplay 2491) displayCtrl 2451);
		_controlButton = ((findDisplay 2491) displayCtrl 2450);
		_controlButton ctrlShow false;
		
		while { dialog && deadDiag } do {
			
			if ( !(player getVariable ["ACE_isUnconscious", false]) || damage player == 1 ) then { deadDiag = false };
			
			if ( forceGiveUp ) then { 
				_controlButton ctrlShow true;
				
				if ( isAllDead ) then {
					_txtmsg = format["All friendly units nearby are dead!"];
				} else {
					_txtmsg = format["It seems no one's coming to help you... #foreveralone"];
				};
			} else {
				_playersalive = count ( [ getpos player , 2500 ] call F_getNearbyPlayers );
				
				if ( _playersalive == 1 ) then {
					_txtmsg = format["There are %1 friendly unit nearby... Hang on soldier!", _playersalive];
				} else {
					_txtmsg = format["There are %1 friendly units nearby... Hang on soldier!", _playersalive];
				};
			};
			
			_controlText ctrlSetText toUpper(_txtmsg);
		};
	};
	
	waitUntil {	!(player getVariable ["ACE_isUnconscious", false]) || damage player == 1  };
	
	forceGiveUp = false;
	isAllDead = false;
	
	if (dialog) then {
		closeDialog 0;
	};
	
	"colorCorrections" ppEffectEnable FALSE;
	"filmGrain" ppEffectEnable FALSE;
	["EastWind"] call BIS_fnc_setPPeffectTemplate;
	_cam cameraEffect ["Terminate","back"];
	camDestroy _cam;
	camUseNVG false;
};