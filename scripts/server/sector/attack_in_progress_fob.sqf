params [ "_thispos" ];
private [ "_attacktime", "_ownership", "_grp" ];

sleep 5;

_ownership = [ _thispos ] call F_sectorOwnership;
if ( _ownership != GRLIB_side_enemy ) exitWith {};

if ( GRLIB_blufor_defenders ) then {
	//_grp = creategroup GRLIB_side_friendly;
	//{ _x createUnit [ _thispos, _grp,'this addMPEventHandler ["MPKilled", {_this spawn kill_manager}]']; } foreach blufor_squad_inf;
	//sleep 3;
	//_grp setCombatMode "GREEN";
	//_grp setBehaviour "COMBAT";
	
	_force = 0;
	_useair = false;
	if ( combat_readiness >= 35 ) then { _force = 5 * floor(count blufor_sectors / 10) };
	if ( combat_readiness >= 60 ) then { _force = 7 * floor(count blufor_sectors / 10) };
	if ( combat_readiness >= 95 ) then { _force = 9 * floor(count blufor_sectors / 10) };
	if ( combat_readiness >= 70 && ((count blufor_sectors / (count sectors_factory + count sectors_military + count sectors_tower)) * 100) >= 25 ) then { _useair = true };
	[
		_thispos,
		GRLIB_side_friendly,
		15,
		[true,false],
		[true,false,_useair],
		false,
		[3,_force],
		[0, floor(_force/2)],
		"default",
		nil,
		"this addMPEventHandler ['MPKilled', {_this spawn kill_manager}]",
		1
	] spawn F_LVmilitarize;
};

sleep 60;

_ownership = [ _thispos ] call F_sectorOwnership;
if ( _ownership == GRLIB_side_friendly ) exitWith {
	if ( GRLIB_blufor_defenders ) then {
		/*{
			if ( alive _x ) then { deleteVehicle _x };
		} foreach units _grp;*/
		
		nul = [LVgroup1] execVM "LV\LV_functions\LV_fnc_removeGroupV2.sqf";
	};
};

[ [ _thispos , 1 ] , "remote_call_fob" ] call BIS_fnc_MP;
_attacktime = GRLIB_vulnerability_timer;

while { _attacktime > 0 && ( _ownership == GRLIB_side_enemy || _ownership == GRLIB_side_resistance ) } do {
	_ownership = [ _thispos ] call F_sectorOwnership;
	_attacktime = _attacktime - 1;
	sleep 1;
};

waitUntil {
	sleep 1;
	[ _thispos ] call F_sectorOwnership != GRLIB_side_resistance;
};

if ( GRLIB_endgame == 0 ) then {
	if ( _attacktime <= 1 && ( [ _thispos ] call F_sectorOwnership == GRLIB_side_enemy ) ) then {
		[ [ _thispos , 2 ] , "remote_call_fob" ] call BIS_fnc_MP;
		sleep 3;
		GRLIB_all_fobs = GRLIB_all_fobs - [_thispos];
		publicVariable "GRLIB_all_fobs";
		reset_battlegroups_ai = true;
		[_thispos] call destroy_fob;
		trigger_server_save = true;
		[] call recalculate_caps;
		stats_fobs_lost = stats_fobs_lost + 1;
	} else {
		[ [ _thispos , 3 ] , "remote_call_fob" ] call BIS_fnc_MP;
		{ [_x] spawn prisonner_ai; } foreach ( [ _thispos nearEntities [ "Man", GRLIB_capture_size * 0.8], { side group _x == GRLIB_side_enemy } ] call BIS_fnc_conditionalSelect );
	};
};

sleep 60;

if ( GRLIB_blufor_defenders ) then {
	/*{
		if ( alive _x ) then { deleteVehicle _x };
	} foreach units _grp;*/
	
	nul = [LVgroup1] execVM "LV\LV_functions\LV_fnc_removeGroupV2.sqf";
};