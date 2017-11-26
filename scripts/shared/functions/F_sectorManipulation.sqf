params [ ["_liberate", false] ];

openMap [true, true];
hint format["Click on sector location."];

["mk_omsca", "onMapSingleClick", {
	private [ "_sector" ];
	_sector = [150, _pos] call F_getNearestSector;

	if ( _sector == "" ) exitWith { hint format["No sector could be found!"] };
	
	if ( _this select ((count _this) - 1) ) then {
		[ _sector ] spawn sector_liberated_remote_call
	} else {
		[ _sector ] spawn sector_lost_remote_call
	};
	
	openMap [false, false];
	["mk_omsca", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
	true;
}, [_liberate]] call BIS_fnc_addStackedEventHandler;