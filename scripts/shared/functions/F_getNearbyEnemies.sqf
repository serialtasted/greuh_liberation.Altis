params [ "_searchposition", "_distance"];

[ allUnits, { alive _x && ( side _x == GRLIB_side_enemy || side _x == GRLIB_side_resistance ) && _x distance _searchposition < _distance && !(captive _x) } ] call BIS_fnc_conditionalSelect