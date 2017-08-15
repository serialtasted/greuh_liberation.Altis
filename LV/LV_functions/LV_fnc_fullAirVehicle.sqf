//ARMA3Alpha function LV_fnc_fullAirVehicle v1.0 - by SPUn / lostvar
//Spawns random vehicle full of random units and returns driver 
private ["_BLUhq","_BLUgrp","_veh","_grp","_OPFhq","_OPFgrp","_INDhq","_INDgrp","_man1","_man","_i","_pos","_side","_BLUveh","_OPFveh","_INDveh","_men","_pos1","_veh1","_vehSpots","_vehicle","_vCrew","_allUnitsArray","_crew","_driver"];
_pos = _this select 0;
_side = _this select 1;

_BLUveh = BLU_AirVehHeli;
_OPFveh = OPF_AirVehHeli;
_INDveh = IND_AirVehHeli;

_heliOrPlane = floor(random 5);
if(_heliOrPlane > 3)then{
	_BLUveh = BLU_AirVehPlane;
	_OPFveh = OPF_AirVehPlane;
	_INDveh = IND_AirVehPlane;
};

_men = [];
_veh = [];

switch(_side)do{
	case 0:{
		_BLUhq = createCenter west;
		_BLUgrp = createGroup west;
		_veh = _BLUveh;
		_grp = _BLUgrp;
	};
	case 1:{
		_OPFhq = createCenter east;
		_OPFgrp = createGroup east;
		_veh = _OPFveh;
		_grp = _OPFgrp;
	};
	case 2:{
		_INDhq = createCenter resistance;
		_INDgrp = createGroup resistance;
		_veh = _INDveh;
		_grp = _INDgrp;
	};
};

_pos1 = _pos;
_veh1 = _veh select (floor(random(count _veh)));
_vehSpots = getNumber (configFile >> "CfgVehicles" >> _veh1 >> "transportSoldier");

_vehicle = createVehicle [_veh1, _pos1, [], 0, "FLY"];
createVehicleCrew _vehicle;
_grparray = [];
{
	_grparray pushBack _x;
	_grparray join _grp;
	
	_x setVariable [ "SAVEUNIT", false ];
	_x addEventHandler ["GetOutMan", { deleteVehicle (_this select 0) }];
} forEach crew _vehicle;

_driver = driver _vehicle;
_driver