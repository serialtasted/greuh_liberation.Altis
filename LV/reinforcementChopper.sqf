/*
				***		ARMA3Alpha REINFORCEMENT CHOPPER SCRIPT v2.0 - by SPUn / lostvar	***
	
				Spawns chopper which transports infantry group to position and leaves after that
				
		Calling the script:
		
			default: 		nul = [this] execVM "LV\reinforcementChopper.sqf";
			custom: 		nul = [spot,exact,side,type,captive,patrol,target,direction,distance,precise,
								cycle,groupSize,skills,smoke,group,custom init,ID,MP] execVM "LV\reinforcementChopper.sqf";
								
	Parameters:
	
	spot 	= 	landing spot 	(name of marker or object or unit, or position array) 									DEFAULT: this
	exact 	= 	true or false 	(true = tries landing exactly on *spot, false = finds place where it fits) 				DEFAULT: true
	side 	= 	1 or 2 or 3		(1 = west, 2 = east, 3 = independent)													DEFAULT: 2
	type 	= 	number 			(Depends on side)																		DEFAULT: 1
				WEST: 1 = B_Heli_Light_01_armed_F, 2 = B_Heli_Light_01_F, 3 = B_Heli_Transport_01_F
				EAST: 1 = O_Heli_Attack_02_F, 2 = O_Heli_Attack_02_black_F, 3 = O_Heli_Light_02_F, 4 = O_Heli_Light_02_unarmed_F
				INDEPENDENT: 1 = I_Heli_Transport_02_F
	captive = 	true/false 		(if true, enemies wont notice them before chopper has landed) 							DEFAULT: false
	patrol 	= 	true/false 		(if false, units wont patrol in any way <- handy if you set (group player) as *group) 	DEFAULT: true
	target 	= 	patrol target 	(patrolling target for infantry group, options:											DEFAULT: player
								unit 	= 	units name, ex: enemyunit1
								marker 	= 	markers' name, ex: "marker01" (remember quotes with markers!)
								marker array = array of markers in desired order, ex: ["marker01","marker02","marker03"]
								group	= 	groups name, ex: (group enemy1)	OR BlueGroup17
								group array, ex: [(group player), (group blue2)]
								["PATROL",center position,radius] = uses patrol-vD.sqf, ex: ["PATROL",(getPos player),150]
	direction 	= 	"random" or 0-360 (direction where chopper comes from, use quotes with random!) 									DEFAULT: "random"
	distance 	= 	number (from how far KA60 comes from) 																				DEFAULT: 1500
	precise 	= 	true or false (true = heli will land even in middle of war, false = heli might have air fights etc before landing) 	DEFAULT: true
	cycle 		= 	true or false (if true and target is array of markers, unit will cycle these markers) 								DEFAULT: false
	groupSize 	= 	1-8 (infantry groups' size) 																						DEFAULT: 8
	skills 		= 	"default" 	(default AI skills) 																					DEFAULT: "default"
				or	number	=	0-1.0 = this value will be set to all AI skills, ex: 0.8
				or	array	=	all AI skills invidiually in array, values 0-1.0, order:
						[aimingAccuracy, aimingShake, aimingSpeed, spotDistance, spotTime, courage, commanding, general, endurance, reloadSpeed] 
						ex: 	[0.75,0.5,0.6,0.85,0.9,1,1,0.75,1,1] 					
	smoke		=	[LZ smoke, cover smokes, flare, chemlights] (if chopper uses these on landing spot)									DEFAULT: [false,false,false,false]
	group 		= 	group name OR nil (if you want units in existing group, set it here. if this is left empty, new group is made) 		DEFAULT: nil
	custom init = 	"init commands" (if you want something in init field of units, put it here) 										DEFAULT: nil
					NOTE: Keep it inside quotes, and if you need quotes in init commands, you MUST use ' or "" instead of ",
						 ex: "hint 'this is hint';"
	ID 			= 	number (if you want to delete units this script creates, you'll need ID number for them)							DEFAULT: nil
	MP			= 	true/false	true = 'landing spot' will automatically be one of alive non-captive players								DEFAULT: false
	
	EXAMPLE: 	nul = [player,false,2,3,false,true,player,"random",1000,true,false,8,0.75,[false,true,false,true],nil,nil,33,false] execVM "LV\reinforcementChopper.sqf";
*/
if (!isServer)exitWith{};
private ["_BLUmen3","_mp","_smoke","_INDchoppers","_BLUchoppers","_OPFchoppers","_OPFarrays","_BLUarrays","_INDgrp","_INDhq","_INDmen","_OPFmen2","_BLUmen2","_captive","_patrol","_heliT","_chopperTypes","_chopperType","_setInit2","_setInit","_c0","_customInit","_tPos","_exactPos","_skls","_skills","_grpSize","_cycle","_precise","_man2","_direction","_distance","_targetM","_i2","_heliPad","_targetPos","_side","_targetMarker","_BLUmen","_OPFmen","_men","_hq","_grp1","_grp2","_man1","_man","_dir","_range","_pos","_heli","_vehSpots","_i","_wp1"];

//Extra options:
_doorHandling = true;
//

//Check parameters:
_tPos = if (count _this > 0) then {_this select 0};
_exactPos = if (count _this > 1) then {_this select 1; }else{true;};
_side = if (count _this > 2) then {_this select 2; }else{EAST;};
_chopperType = if (count _this > 3) then {_this select 3; }else{3;};
_captive = if (count _this > 4) then {_this select 4; }else{false;};
_patrol = if (count _this > 5) then {_this select 5; }else{true;};
_targetMarker = if (count _this > 6) then {_this select 6; }else{player;};
_direction = if (count _this > 7) then {_this select 7; }else{"random";};
_distance = if (count _this > 8) then {_this select 8; }else{1500;};
_precise = if (count _this > 9) then {_this select 9; }else{true;};
_cycle = if (count _this > 10) then {_this select 10; }else{false;};
_grpSize = if (count _this > 11) then {_this select 11; }else{8;};
_skills = if (count _this > 12) then {_this select 12; }else{"default";};
_smoke = if (count _this > 13) then {_this select 13; }else{[false,false,false,false];};
_grp2 = if (count _this > 14) then {_this select 14; }else{nil;};
_customInit = if (count _this > 15) then {_this select 15; }else{nil;};
_grpId = if (count _this > 16) then { _this select 16;} else {nil};
_mp = if (count _this > 17) then { _this select 17;} else {false};

if(_mp)then{if(isNil("LV_GetPlayers"))then{LV_GetPlayers = compile preprocessFile "LV\LV_functions\LV_fnc_getPlayers.sqf";};};

_tempPos = [0,0,0];

if(_mp)then{
	_tPos = call LV_GetPlayers;
	_tempPos = getPos(_tPos call BIS_fnc_selectRandom);
}else{
	//Check if spot is marker, object, or position array:
	if(_tPos in allMapMarkers)then{
		_tempPos = getMarkerPos _tPos;
	}else{
		if (typeName _tPos == "ARRAY") then{
			_tempPos = _tPos;
		}else{
			_tempPos = getPos _tPos;
		};
	};
};

_targetPos = _tempPos findEmptyPosition [ 0, 100, "Land_HelipadSquare_F" ];

//LZ smoke
if((_smoke select 0))then{
	[_targetPos,_distance] spawn {
		private["_targetPos","_a","_timesLimit","_distance"];
		_targetPos = _this select 0;
		_distance = _this select 1;
		_a = 0;
		_timesLimit = ceil(_distance / 1000);
		while{_a < _timesLimit}do{
			_smoke1 = "SmokeShellGreen" createVehicle _targetPos;
			sleep 50;
			_a = _a + 1;
		};
	};
};

//Chemlights
if((_smoke select 3))then{
		[_targetPos] spawn {
		private["_targetPos","_a","_dir"];
		_targetPos = _this select 0;
		_dir = 0;
		_a = 0;
		while{_a < 8}do{
			_sPos = [(_targetPos select 0) + (sin _dir) * 12, (_targetPos select 1) + (cos _dir) * 12, 0];
			_smoke1 = "Chemlight_yellow" createVehicle _sPos;
			_a = _a + 1;
			_dir = _dir + (360 / 8);
		};
	};
};

//Prepare functions:
if(isNil("LV_ACskills"))then{LV_ACskills = compile preprocessFile "LV\LV_functions\LV_fnc_ACskills.sqf";};
if(isNil("LV_RandomSpot"))then{LV_RandomSpot = compile preprocessFile "LV\LV_functions\LV_fnc_randomSpot.sqf";};
if(isNil("LV_vehicleInit"))then{LV_vehicleInit = compile preprocessFile "LV\LV_functions\LV_fnc_vehicleInit.sqf";};

//Unit arrays:
_BLUmen = [
	blufor_squad_leader,
	blufor_rifleman,
	blufor_machinegunner,
	blufor_medic,
	blufor_explosives,
	blufor_grenadier,
	blufor_marksman,
	blufor_at,
	blufor_aa
];
_BLUmen2 = [];
_BLUmen3 = [];
_BLUarrays = [_BLUmen];

_OPFmen = [
	opfor_squad_leader,
	opfor_rifleman,
	opfor_grenadier,
	opfor_machinegunner,
	opfor_medic,
	opfor_rpg,
	opfor_aa,
	opfor_engineer
];
_OPFmen2 = [];
_OPFarrays = [_OPFmen];

_INDmen = [];

_BLUchoppers = ["RHS_MELB_MH6M","RHS_CH_47F","RHS_UH60M"];
_OPFchoppers = ["I_Heli_light_03_unarmed_F","rhsgref_cdf_reg_Mi8amt"];
_INDchoppers = ["I_Heli_Transport_02_F"];

_chopperTypes = [];

//Side related group creation:
switch(_side)do{
	case WEST:{
		_hq = createCenter west;
		_grp1 = createGroup west;
		if(isNil("_grp2"))then{_grp2 = createGroup west;}else{_grp2 = _grp2;};
		_men = (_BLUarrays call BIS_fnc_selectRandom);
		_chopperTypes = _BLUchoppers;
	};
	case EAST:{
		_hq = createCenter east;
		_grp1 = createGroup east;
		if(isNil("_grp2"))then{_grp2 = createGroup east;}else{_grp2 = _grp2;};
		_men = (_OPFarrays call BIS_fnc_selectRandom);
		_chopperTypes = _OPFchoppers;
	};
	case RESISTANCE:{
		_hq = createCenter resistance;
		_grp1 = createGroup resistance;
		if(isNil("_grp2"))then{_grp2 = createGroup resistance;}else{_grp2 = _grp2;};
		_men = _INDmen;
		_chopperTypes = _INDchoppers;
	};
};

//If *exact* is false, find landing spot which is not close another ones:
if(!_exactPos)then{
	if(isNil("REKA60padArray"))then{REKA60padArray = [];};
	_finding = 1;
	_ra = 1;
	while{_finding > 0}do{
		
		_tPos = [];
		while{count _tPos < 1}do{
			_spot = [_targetPos, _ra] call LV_RandomSpot;
			_tPos = _spot isflatempty [5,0,0.3,4,0,false,objnull];
			_ra = _ra + 5;
		};
		
		sleep 0.001;
		_targetPos = _tPos;
		_e1 = 0;
		_finding = 0;
		
		while{_e1<(count REKA60padArray)}do{
			if(((REKA60padArray select _e1) distance _targetPos)<15)then{_finding = 1;};
			_e1 = _e1 + 1;
		};
	};
	REKA60padArray set [(count REKA60padArray), _targetPos];
};

_heliT = _chopperTypes select (_chopperType - 1);
_heliPad = createVehicle ["Land_HelipadEmpty_F", _targetPos, [], 0, "NONE"];

if(typeName _direction == "STRING")then{_dir = random 360;}else{_dir = _direction;};
_range = _distance;
_pos = [(_targetPos select 0) + (sin _dir) * _range, (_targetPos select 1) + (cos _dir) * _range, 800];

_heli = createVehicle [_heliT, _pos, [], 0, "FLY"];
createVehicleCrew _heli;
(crew _heli) joinSilent _grp1;

_driverseat = [driver _heli];
{
	if ( _x in _driverseat ) then {
		_x setVariable [ "SAVEUNIT", false ];
	} else {
		deleteVehicle _x;
	};
} forEach crew _heli;

_crewcount = count crew _heli;

(driver _heli) setUnitRank "SERGEANT";
if(_precise)then{(driver _heli) setBehaviour "CARELESS";};

//Flare
if((_smoke select 2))then{
	[_targetPos,_heli] spawn {
		private["_targetPos"];
		_targetPos = _this select 0;
		_heli = _this select 1;
		
		waitUntil { _heli distance _targetPos < 500 };
		_flare = "F_40mm_Yellow" createVehicle [_targetPos select 0, _targetPos select 1, 0];
	};
};

[(driver _heli),_heli,_targetPos,_heliPad] spawn {
	_man = _this select 0;
	_heli = _this select 1;
	_targetPos = _this select 2;
	_heliPad = _this select 3;
	waitUntil {sleep 1; !isNil "_man" && !isNil "_heli"};
	waitUntil {sleep 1; !alive _man || !canMove _heli || isNil "_man" || isNil "_heli"};
	if (true) exitWith {
		if (!isNil "_targetPos" && !isNil "REKA60padArray") then {
			if ((_heli distance _targetPos) > 50)then{REKA60padArray = REKA60padArray - [_targetPos];};
		};
		if(_heli distance _targetPos > 200)then{
			sleep 15;
			{
				deleteVehicle _x;
			} forEach crew _heli;
			sleep 15;
			_heli setDamage 1;
			deleteVehicle _heliPad;
		};
	};
};

if(_grpSize > (getNumber (configFile >> "CfgVehicles" >> _heliT >> "transportSoldier")))then{
	_vehSpots = getNumber (configFile >> "CfgVehicles" >> _heliT >> "transportSoldier");
}else{
	_vehSpots = _grpSize;
};

_i = 1; 
for "_i" from 1 to _vehSpots do {
	_man1 = _men select (floor(random(count _men)));
	_man2 = _grp2 createUnit [_man1, _pos, [], 0, "NONE"];
	_man2 setVariable [ "SAVEUNIT", false ];
	if(typeName _skills != "STRING")then{_skls = [_man2,_skills] call LV_ACskills;};
	_man2 moveInCargo _heli;
	if(!isNil("_customInit"))then{ 
		[_man2,_customInit] spawn LV_vehicleInit;
	};
};
if((_vehSpots == 0)&&(_grpSize > 0))then{
	_man1 = _men select (floor(random(count _men)));
	_man2 = _grp2 createUnit [_man1, _pos, [], 0, "NONE"];
	if(typeName _skills != "STRING")then{_skls = [_man2,_skills] call LV_ACskills;};
	_man2 moveInTurret [_heli, [0]];
	if(!isNil("_customInit"))then{ 
		[_man2,_customInit] spawn LV_vehicleInit;
	}; 
};

if(!isNil("_grpId"))then{
	call compile format ["LVgroup%1 = _grp2",_grpId];
};

if(_captive)then{
	{ _x setCaptive true; }forEach units _grp1;
	{ _x setCaptive true; }forEach units _grp2;
};

_heli doMove _targetPos;
while { _heli distance _targetPos > 230 } do { sleep 4; };

//doStop _heli;
//_heli land "GET OUT"; //you can also try "LAND"/"GET OUT" (then it wont land, only hovers)
sleep 3;
[_heli,35,getPosATL _heliPad] call AR_Rappel_All_Cargo;

while { (getPos _heli) select 2 > 40 } do { sleep 2; };

if((_smoke select 1))then{//Cover smoke
	[_targetPos,_heli] spawn {
		private["_targetPos","_a","_dir","_heli"];
		_targetPos = _this select 0;
		_heli = _this select 1;
		_dir = 0;
		_a = 0;
		while{_a < 16}do{
			_sPos = [((getPos _heli) select 0) + (sin _dir) * 12, ((getPos _heli) select 1) + (cos _dir) * 12, ((getPos _heli) select 2)];
			_smoke1 = "SmokeShell" createVehicle _sPos;
			_a = _a + 1;
			_dir = _dir + (360 / 16);
		};
	};
};

//waitUntil{isTouchingGround _heli};

if(_captive)then{
	{ _x setCaptive false; }forEach units _grp1;
	{ _x setCaptive false; }forEach units _grp2;
};

//_grp2 leaveVehicle _heli;

while { (count (crew _heli)) > _crewcount } do { sleep 3; };

{
	unassignVehicle _x;
	//doGetOut _x; 
	_x setBehaviour "AWARE";
} forEach units _grp2;
_grp2 setCombatMode "RED";

sleep 8;

_wp = _grp1 addWaypoint [_pos, 1];
_wp setWaypointSpeed "FULL";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointCombatMode "BLUE";
deleteVehicle _heliPad;

if(_patrol)then{
	if(typeName _targetMarker == "ARRAY")then{ //TARGET is array
		if((!((_targetMarker select 0) in allMapMarkers))&&(!((_targetMarker select 0) in allGroups)))then{
			if((typeName (_targetMarker select 0)) == "STRING")then{
				if((_targetMarker select 0) == "PATROL")then{ ////USE patrol-vD.sqf
					{
						_cPosition = _targetMarker select 1;
						_cRadius = _targetMarker select 2;
						nul = [_x,_cPosition,_cRadius,_doorHandling] execVM "LV\patrol-vD.sqf";
					}forEach units _grp2;
				};
			};
		}else{ //TARGET is array of Markers or Groups
			{ 
				_x setVariable ["target0",_targetMarker,false];
				_x setVariable ["mDis0", 1000, false];
				if(_cycle)then{
					nul = [_x,true] execVM "LV\LV_functions\LV_fnc_follow.sqf";
				}else{
					nul = [_x,false] execVM "LV\LV_functions\LV_fnc_follow.sqf";
				};
				sleep 2;
			}forEach units _grp2;
		};
	}else{
		if(_targetMarker in allMapMarkers)then{ /////TARGET is single Marker
			//{ _x doMove getMarkerPos _targetMarker; } forEach units _grp2;
			_wp = _grp2 addWaypoint [_targetPos, 15];
			_wp setWaypointSpeed "NORMAL";
			_wp setWaypointBehaviour "AWARE";
			_wp setWaypointCombatMode "WHITE";
			_wp setWaypointType "HOLD";
		}else{
				{ ////TARGET is single Unit/Object
					_x setVariable ["target0",_targetMarker,false];
					_x setVariable ["mDis0", 1000, false];
					nul = [_x] execVM "LV\LV_functions\LV_fnc_follow.sqf";
				}forEach units _grp2;
		};
	};
}else{
	//If patrol is set to false, units will idle. Additionally you can set custom actions here:
	
};

[_grp2] spawn {
	_grp2 = _this select 0;
	sleep 600;
	diag_log "## CHECKING FOR ATTACK";
	waitUntil { !attack_in_progress; sleep 15; };
	sleep 180;
	diag_log "## REMOVING UNITS";
	
	{
		deleteVehicle _x;
	} forEach units _grp2;
};

[_heli] spawn {
	sleep 60;
	_heli = _this select 0;
	{
		deleteVehicle _x;
	} forEach crew _heli;
	deleteVehicle _heli;
};

waitUntil { _heli distance _targetPos > (_distance - 500) };

if((!_exactPos)&&((_heli distance _targetPos) > 50))then{REKA60padArray = REKA60padArray - [_targetPos];};

diag_log "## REMOVE HELIRAPEL";
{
	deleteVehicle _x;
} forEach crew _heli;
deleteVehicle _heli;