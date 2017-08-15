waitUntil { !isNil "save_is_loaded" };
waitUntil { !isNil "combat_readiness" };
if ( isNil "attack_in_progress" ) then { attack_in_progress = false };

while { true } do {
	waitUntil { combat_readiness >= 10 && !attack_in_progress };
	diag_log format["### VALIDATING AMBIENT COMBAT"];
	
	_alphaTeam = missionNamespace getVariable "Alpha_Members";
	_bravoTeam = missionNamespace getVariable "Bravo_Members";
	_charlieTeam = missionNamespace getVariable "Charlie_Members";
	
	_selectedUnit = objNull; 
	while { isNull _selectedUnit } do {
		_n = floor(random 3) + 1;
		switch (_n) do {
			case 1: { if ( count _alphaTeam > 0 ) then { _selectedUnit = _alphaTeam select 0 } };
			case 2: { if ( count _bravoTeam > 0 ) then { _selectedUnit = _bravoTeam select 0 } };
			case 3: { if ( count _charlieTeam > 0 ) then { _selectedUnit = _charlieTeam select 0 } };
		};
	};
	
	_randomInt = random[2,3,5];
	for "_i" from 2 to _randomInt do {
		[400,600,0,0,5,[1,1,0],_selectedUnit,"default",1,3400,"this addMPEventHandler ['MPKilled', {_this spawn kill_manager}]",["AWARE","SAD"],false] spawn F_LVambientCombat;
		sleep 8;
	};
	
	diag_log format["### AMBIENT COMBAT SPAWNED"];
	
	_minTime = 600;
	_maxTime = 720;
	if ( combat_readiness >= 35 ) then { _minTime = 420 };
	if ( combat_readiness >= 60 ) then { _minTime = 300 };
	if ( combat_readiness >= 95 ) then { _minTime = 180 };
	
	_timeDelay = round(random [_minTime, _maxTime - _minTime, _maxTime]);
	sleep _timeDelay;
};