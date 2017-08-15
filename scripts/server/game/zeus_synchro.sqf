waitUntil { !isNil "huron_typename" };
if ( isNil "forceZeusDebug" ) then { forceZeusDebug = false };

_vehicleClassnames = [huron_typename];


{
	_vehicleClassnames = _vehicleClassnames + [_x select 0];
} foreach (light_vehicles + heavy_vehicles + air_vehicles + static_vehicles + support_vehicles) ;

while { true } do {

	waitUntil { sleep 0.3; count allCurators > 0 };

	_zeusunits = [];
	_units_to_remove = [];
	
	{
		if ( (side group _x == GRLIB_side_friendly ) && ( _x distance startbase > 1000 ) && alive _x ) then {
			_zeusunits pushback _x;
		} else {
			_units_to_remove pushback _x;
		};
	} foreach allUnits;

	{
		if ((typeof _x in _vehicleClassnames ) && (typeof _x != ammobox_o_typename) && (( _x distance startbase > 1000 ) || (typeof _x == huron_typename)) && alive _x ) then {
			_zeusunits pushback _x;
		} else {
			_units_to_remove pushback _x;
		};
	} foreach vehicles;
	
	{
		if ( !(alive _x) ) then {
			_units_to_remove pushback _x;
		};
	} foreach (curatorEditableObjects (allCurators select 0));

	_zeusunits = _zeusunits + switchableUnits;
	_zeusunits = _zeusunits + playableUnits;
	_zeusunits = _zeusunits - (curatorEditableObjects (allCurators select 0));

	
	
	
	/*
	{
		_x addCuratorEditableObjects [_zeusunits,true];
	} foreach allCurators;
	
	masterCurator removeCuratorEditableObjects [_units_to_remove,true];
	masterCurator  setCuratorCoef ["edit", -1e8];
	masterCurator  setCuratorCoef ["place", -1e8];
	masterCurator  setCuratorCoef ["synchronize", 0];
	masterCurator  setCuratorCoef ["delete", 0];
	masterCurator  setCuratorCoef ["destroy", -1e8];	
	*/
	
	{
		_zgm = _x;
		_zgm addCuratorEditableObjects [_zeusunits,true];
		_zgm removeCuratorEditableObjects [_units_to_remove,true];
		_price = -1e8;
		
		if( (getPlayerUID player) == "_SP_PLAYER_" || forceZeusDebug ) then {
			_zgm addCuratorEditableObjects [allUnits,true];
			_zgm addCuratorEditableObjects [vehicles,true];
			_price = 0;
		};

		_zgm  setCuratorCoef ["edit", _price];
		_zgm  setCuratorCoef ["place", _price];
		_zgm  setCuratorCoef ["synchronize", 0];
		_zgm  setCuratorCoef ["delete", 0];
		_zgm  setCuratorCoef ["destroy", _price];

	} foreach allCurators;

	sleep 10;
};