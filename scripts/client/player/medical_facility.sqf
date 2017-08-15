private [ "_nearmedical", "_awaitTime" ];

while { true } do {
	waitUntil {	player getVariable ["ACE_isUnconscious", false] };
	
	player spawn {
		waitUntil { ( ((player distance medicalpod) < 5) || !(player getVariable ["ACE_isUnconscious", false]) ) };
		if ( player getVariable ["ACE_isUnconscious", false] ) then {
			player moveInCargo medicalpod;
		};
	};
	
	waitUntil {
		_nearmedical = ( (getPosATL player) nearobjects [ Medical_typename , 2 ] );
		(count _nearmedical != 0 && vehicle player == player) || ((vehicle player) getVariable["ace_medical_medicClass", 0] == 1 && vehicle player != player)
	};
	
	if ( player getVariable ["ACE_isUnconscious", false] && alive player ) then {
		_awaitTime = random[30, 60, 90];
		titleText ["Receiving Medical Attention...", "PLAIN", (_awaitTime)/10, true];
		sleep _awaitTime;
		[objNull, player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
		hintSilent "You're good to go soldier. Try to be more careful next time.";
		titleFadeOut 2;
		
		sleep 5;
		if ( (vehicle player) == medicalpod ) then { moveOut player };
	};
	
	
	waitUntil {	!(player getVariable ["ACE_isUnconscious", true]) };
};