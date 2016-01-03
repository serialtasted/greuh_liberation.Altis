private [ "_isadmin", "_adminsonlist" ];

_isadmin = false;
_adminsonlist = [];

{
	if ( ( _x select 3 ) )  then {
		_adminsonlist pushBack ( (_x select 1) select 0);
	};
} forEach player_data;

if ( ( getPlayerUID player ) in _adminsonlist) then {
	_isadmin = true;
};

_isadmin