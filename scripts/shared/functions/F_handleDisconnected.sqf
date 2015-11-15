private [ "_holdArray","_deadUnit" ];
params [ "_unit" ];

// populate variables with group members
_alphaTeam = missionNamespace getVariable "Alpha_Members";
_bravoTeam = missionNamespace getVariable "Bravo_Members";
_charlieTeam = missionNamespace getVariable "Charlie_Members";

_commander = missionNamespace getVariable "ElComandante";
_pilotTeam = missionNamespace getVariable "Pilot_Members";
_crewTeam = missionNamespace getVariable "Crew_Members";

_allTeams = _alphaTeam + _bravoTeam + _charlieTeam + _commander + _pilotTeam + _crewTeam;

// init vars
_holdArray = [];
_deadUnit = objNull;

// look for _deadUnit
{
	if ( !(_x in allPlayers) ) then {
		_deadUnit = _x;
	};
} forEach _allTeams;

// remove _deadUnit from team
if ( _deadUnit in _alphaTeam ) then {
	{
		if ( _x != _deadUnit ) then {
			_holdArray pushBack _x;
		};
	} forEach _alphaTeam;
	
	missionNamespace setVariable ["Alpha_Members", _holdArray, true];
};
if ( _deadUnit in _bravoTeam ) then {
	{
		if ( _x != _deadUnit ) then {
			_holdArray pushBack _x;
		};
	} forEach _bravoTeam;
	
	missionNamespace setVariable ["Bravo_Members", _holdArray, true];
};
if ( _deadUnit in _charlieTeam ) then {
	{
		if ( _x != _deadUnit ) then {
			_holdArray pushBack _x;
		};
	} forEach _charlieTeam;
	
	missionNamespace setVariable ["Charlie_Members", _holdArray, true];
};

if ( _deadUnit in _commander ) then {	
	missionNamespace setVariable ["ElComandante", [], true];
};

if ( _deadUnit in _pilotTeam ) then {
	{
		if ( _x != _deadUnit ) then {
			_holdArray pushBack _x;
		};
	} forEach _pilotTeam;
	
	missionNamespace setVariable ["Pilot_Members", _holdArray, true];
};
if ( _deadUnit in _crewTeam ) then {
	{
		if ( _x != _deadUnit ) then {
			_holdArray pushBack _x;
		};
	} forEach _crewTeam;
	
	missionNamespace setVariable ["Crew_Members", _holdArray, true];
};

// remove _unit body
deleteVehicle _unit;

diag_log format ["-- %1 has been deleted", _deadUnit];