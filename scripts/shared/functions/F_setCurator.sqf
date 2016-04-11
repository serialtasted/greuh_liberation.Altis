private [ "_msg" ];
params [ "_unit", "_assign" ];

_msg = "";

if ( _assign ) then { 
	[_unit, masterCurator] remoteExec ["assignCurator",2];
	_msg = format [ "%1 is now the new Commander in charge.", ( name _unit ) ];
} else {
	unassignCurator masterCurator;
	[masterCurator] remoteExec ["unassignCurator",2];
	_msg = format [ "%1 is no longer the Commander in charge.", ( name _unit ) ];
};

[_msg] remoteExec ["systemChat"];
