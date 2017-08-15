params [ "_liberate" ];

hint format["Open map and click on sector location."];

["mk_omsca", "onMapSingleClick", {
	_sector = [150, _pos] call F_getNearestSector;

	if ( _sector == "" ) exitWith { hint format["No sector could be found!"] };

	if ( _this ) then {
		[ _sector ] spawn sector_liberated_remote_call
	} else {
		blufor_sectors = blufor_sectors - [ _sector ];
		publicVariable "blufor_sectors";
		[ [ _sector, 2 ] , "remote_call_sector" ] call BIS_fnc_MP;
		reset_battlegroups_ai = true;
		trigger_server_save = true;
		[] call recalculate_caps;
		stats_sectors_lost = stats_sectors_lost + 1;
	};
	
	["mk_omsca", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
	true;
}, _liberate] call BIS_fnc_addStackedEventHandler;