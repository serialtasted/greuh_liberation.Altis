private [ "_msg" ];
params [ "_unit", "_assign" ];

_msg = "";

if ( _assign ) then { 
	[ [_unit, masterCurator], "assignCurator", false, false ] call BIS_fnc_MP;
	_msg = format [ "%1 is now the new Commander in charge.", ( name _unit ) ];
} else {
	unassignCurator masterCurator;
	[ masterCurator, "unassignCurator", false, false ] call BIS_fnc_MP;
	_msg = format [ "%1 is no longer the Commander in charge.", ( name _unit ) ];
};

[ _msg, "systemChat", true, false ] call BIS_fnc_MP;