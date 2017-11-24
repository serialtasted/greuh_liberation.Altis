diag_log format [ "Spawning civilians at %1", time ];

params [ "_sector" ];
private [ "_sectorpos", "_idx", "_nbcivs", "_spread", "_spawnpos", "_grp", "_createdcivs", "_nextciv", "_roadsArray", "_road" ];

_createdcivs = [];
_sectorpos = getMarkerPos _sector;

_idx = 0;
_nbcivs = round ((3 + (floor (random 7))) * GRLIB_civilian_activity);
_spread = 1;
if ( _sector in sectors_bigtown ) then {
	_nbcivs = _nbcivs + 10;
	_spread = 2.5;
};

_nbcivs = _nbcivs * ( sqrt ( GRLIB_unitcap ) );

while { _idx < _nbcivs } do {
	_spawnpos = [(((_sectorpos select 0) + (75 * _spread)) - (random (150 * _spread))),(((_sectorpos select 1) + (75 * _spread)) - (random (150 * _spread))),0];
	_grp = createGroup GRLIB_side_civilian;
	(civilians select (floor (random (count civilians)))) createUnit [_spawnpos, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"];
	_nextciv = ((units _grp) select 0);
	_createdcivs pushBack _nextciv;
	[_grp] call add_civ_waypoints;
	_idx = _idx + 1;
};

if ( GRLIB_civ_penalties > 0 ) then {
	_numUnits = count (units _grp);
	_numSB = 0;
	_chance = 0;
	
	if ( _sector in blufor_sectors ) then {
		_chance = round( (( combat_readiness * (civ_aggression * 0.60) ) * GRLIB_civ_penalties) / 100 );
	} else {
		_chance = round( (( combat_readiness * civ_aggression ) * GRLIB_civ_penalties) / 100 );
	};
	
	{
		if ( _numSB < _chance && ceil(random 3) == 1 ) then {
			[_x] spawn F_suicideBomber;
			_numSB = _numSB + 1;
		};
	} forEach units _grp;
};

_roadsArray = [_sectorpos select 0, _sectorpos select 1] nearRoads (GRLIB_capture_size * 2);
while {(count _roadsArray) > 0} do {
	_road = selectRandom _roadsArray;
	_roadsArray = _roadsArray select {_x distance2D _road > (ceil ((random (800 - 300)) + 300))};
	_count = 0;
	while { _count == 0 } do {
		_position = ((getPos _road) getPos [ random [8,10,12], random 360 ]) findEmptyPosition [1, 10, "B_MRAP_01_F"];
		
		if !(_position isEqualTo []) then {
			_vehicle = (selectRandom civilian_vehicles) createVehicle _position;
			_vehicle setDir (round (random 360));
			_vehicle setVectorUp surfaceNormal position _vehicle;
			
			_count = _count + 1;
		};
	};
};

diag_log format [ "Done Spawning civilians at %1", time ];

_createdcivs
