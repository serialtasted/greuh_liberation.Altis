params [ [ "_source_position", (getpos player) ] ];
private [ "_retvalue", "_alltrucks" ];

_alltrucks = [];
_retvalue = [];

{
	if ( _x isKindOf Build_truck_typename ) then {
		_alltrucks pushBack _x;
	};
} foreach vehicles;

if ( count _alltrucks > 0 ) then {
	_retvalue = ( [ _alltrucks , [] , { _source_position distance _x } , 'ASCEND' ] call BIS_fnc_sortBy ) select 0;
} else {
	_retvalue = [0,0,0];
};

_retvalue
