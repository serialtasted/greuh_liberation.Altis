private ["_bomber", "_targetSide", "_explosiveClass", "_nearUnits"];

_bomber = _this select 0;
_explosiveClass = ["Rocket_03_HE_F","M_Mo_82mm_AT_LG","HelicopterExploSmall"];
_nearUnits = [];
_runCode = true;

_bomber setVariable ["isBomber", true];

while {alive _bomber && _runCode} do
{
	_nearUnits = [ _bomber nearEntities ["Man", 70], { (side _x) == GRLIB_side_friendly && isPlayer _x } ] call BIS_fnc_conditionalSelect;
	if (count _nearUnits != 0) then { _runCode = false };
};

_bomber addVest "V_HarnessOGL_gry";
_targetPos = position (_nearUnits select 0);

while { _bomber distance _targetPos > 20 } do
{
	_targetPos = position (_nearUnits select 0);
	[_bomber] join grpNull;
	_grp = group _bomber;
	_wp = _grp addWaypoint [_targetPos, 2];
	_wp setWaypointSpeed "FULL";
	_wp setWaypointBehaviour "CARELESS";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointType "MOVE";
	
	sleep 3;
};

waitUntil {_bomber distance _targetPos < (random 10) || !alive _bomber};

if ( alive _bomber ) then {
	if (round(random(1)) == 0) then { [ _bomber, "shout1" ] remoteExec ["say3D", 0] }
	else { [ _bomber, "shout2" ] remoteExec ["say3D", 0] };
	_bomber addRating -10000000;
};

sleep (random 2);

_explosiveBlast = selectRandom _explosiveClass;
createVehicle[_explosiveBlast,(getPosATL _bomber),[],0,""];