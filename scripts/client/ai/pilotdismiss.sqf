_unit = (_this select 3) select 0;
_grp = (_this select 3) select 1;

_unit playAction "Salute";
player playAction "Salute";
sleep 2;
player playAction "Stand";

_wp = _grp addWaypoint [[((position _unit) select 0) + 300, ((position _unit) select 1) + 300, 0], 1];
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "FULL";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointCombatMode "BLUE";

sleep 40;

deleteVehicle _unit;