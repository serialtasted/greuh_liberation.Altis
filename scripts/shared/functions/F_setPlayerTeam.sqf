private [ "_oldTeam", "_holdTeam" ];
params [ "_unitTeam" ];

if (isNil "curTeam") then { curTeam = "MAIN"; };

//--------------------------------------------------------- populate variables with group members
_alphaTeam = missionNamespace getVariable "Alpha_Members";
_bravoTeam = missionNamespace getVariable "Bravo_Members";
_charlieTeam = missionNamespace getVariable "Charlie_Members";

_pilotTeam = missionNamespace getVariable "Pilot_Members";
_crewTeam = missionNamespace getVariable "Crew_Members";

//--------------------------------------------------------- removes player from team
_oldTeam = player getVariable ["St_team", _unitTeam];
_holdArray = [];

if ( _oldTeam isEqualTo "PTr_alpha" && !isNil { _alphaTeam } ) then {
	{
		if ( !( (name _x) isEqualTo (name player) ) && ( _x in allPlayers ) ) then {
			_holdArray pushBack _x;
		};
	} forEach _alphaTeam;
	
	missionNamespace setVariable ["Alpha_Members", _holdArray, true];
};
if ( _oldTeam isEqualTo "PTr_bravo" && !isNil { _bravoTeam } ) then {
	{
		if ( !( (name _x) isEqualTo (name player) ) && ( _x in allPlayers ) ) then {
			_holdArray pushBack _x;
		};
	} forEach _bravoTeam;
	
	missionNamespace setVariable ["Bravo_Members", _holdArray, true];
};
if ( _oldTeam isEqualTo "PTr_charlie" && !isNil { _charlieTeam } ) then {
	{
		if ( !( (name _x) isEqualTo (name player) ) && ( _x in allPlayers ) ) then {
			_holdArray pushBack _x;
		};
	} forEach _charlieTeam;
	
	missionNamespace setVariable ["Charlie_Members", _holdArray, true];
};

if ( _oldTeam isEqualTo "PTr_commander" ) then {
	missionNamespace setVariable ["ElComandante", [], true];
};

if ( _oldTeam isEqualTo "PTr_pilot" && !isNil { _pilotTeam } ) then {
	{
		if ( !( (name _x) isEqualTo (name player) ) && ( _x in allPlayers ) ) then {
			_holdArray pushBack _x;
		};
	} forEach _pilotTeam;
	
	missionNamespace setVariable ["Pilot_Members", _holdArray, true];
};
if ( _oldTeam isEqualTo "PTr_crew" && !isNil { _crewTeam } ) then {
	{
		if ( !( (name _x) isEqualTo (name player) ) && ( _x in allPlayers ) ) then {
			_holdArray pushBack _x;
		};
	} forEach _crewTeam;
	
	missionNamespace setVariable ["Crew_Members", _holdArray, true];
};

[player] joinSilent grpNull;

diag_log format ["-- You left squad %1", _oldTeam];

//--------------------------------------------------------- refresh variables
_alphaTeam = missionNamespace getVariable "Alpha_Members";
_bravoTeam = missionNamespace getVariable "Bravo_Members";
_charlieTeam = missionNamespace getVariable "Charlie_Members";

_pilotTeam = missionNamespace getVariable "Pilot_Members";
_crewTeam = missionNamespace getVariable "Crew_Members";

//--------------------------------------------------------- adds player to new team
player setVariable [ "St_team", _unitTeam ];

if ( _unitTeam isEqualTo "PTr_commander" ) then {
	[player] remoteExec ["unassignTeam"];
	missionNamespace setVariable ["ElComandante", [player], true];
};

if ( _unitTeam isEqualTo "PTr_alpha" ) then {
	_alphaTeam pushBack player;
	missionNamespace setVariable ["Alpha_Members", _alphaTeam, true];
	
	[player] joinSilent (_alphaTeam select 0);
	(_alphaTeam select 0) setGroupIdGlobal ["PTr_alpha"];
};
if ( _unitTeam isEqualTo "PTr_bravo" ) then {
	_bravoTeam pushBack player;
	missionNamespace setVariable ["Bravo_Members", _bravoTeam, true];
	
	[player] joinSilent (_bravoTeam select 0);
	(_bravoTeam select 0) setGroupIdGlobal ["PTr_bravo"];
};
if ( _unitTeam isEqualTo "PTr_charlie" ) then {
	_charlieTeam pushBack player;
	missionNamespace setVariable ["Charlie_Members", _charlieTeam, true];
	
	[player] joinSilent (_charlieTeam select 0);
	(_charlieTeam select 0) setGroupIdGlobal ["PTr_charlie"];
};

if ( _unitTeam isEqualTo "PTr_pilot" ) then {
	[player] remoteExec ["unassignTeam"];
	curTeam = "MAIN";
	
	_pilotTeam pushBack player;
	missionNamespace setVariable ["Pilot_Members", _pilotTeam, true];
	
	[player] joinSilent (_pilotTeam select 0);
	(_pilotTeam select 0) setGroupIdGlobal ["PTr_pilot"];
};
if ( _unitTeam isEqualTo "PTr_crew" ) then {
	[player] remoteExec ["unassignTeam"];
	curTeam = "MAIN";
	
	_crewTeam pushBack player;
	missionNamespace setVariable ["Crew_Members", _crewTeam, true];
	
	[player] joinSilent (_crewTeam select 0);
	(_crewTeam select 0) setGroupIdGlobal ["PTr_crew"];
};

[] call F_assignComms;

diag_log format ["-- You joined squad %1", groupId( group player )];