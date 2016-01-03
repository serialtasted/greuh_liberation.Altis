private [ "_maxdist", "_truepos", "_price", "_pos", "_grp", "_classname", "_idx", "_unitrank", "_posfob", "_ghost_spot", "_vehicle", "_dist", "_actualdir", "_near_objects", "_near_objects_25", "_allowbis", "_allowcancel", "_debug_colisions" ];

build_confirmed = 0;
_maxdist = GRLIB_fob_range;
_truepos = [];
_debug_colisions = false;

GRLIB_preview_spheres = [];
while { count GRLIB_preview_spheres < 36 } do {
	GRLIB_preview_spheres pushback ( "Sign_Sphere100cm_F" createVehicleLocal [ 0, 0, 0 ] );
};

{ _x setObjectTexture [0, "#(rgb,8,8,3)color(0,1,0,1)"]; } foreach GRLIB_preview_spheres;

if (isNil "manned") then { manned = false };
if (isNil "gridmode" ) then { gridmode = 0 };
if (isNil "levelmode" ) then { levelmode = 0 };
if (isNil "repeatbuild" ) then { repeatbuild = false };
if (isNil "build_rotation" ) then { build_rotation = 0 };

waitUntil { sleep 0.2; !isNil "dobuild" };

while { true } do {
	waitUntil { sleep 0.2; dobuild != 0 };
	build_confirmed = 1;
	build_invalid = 0;
	_allowbis = false;
	_allowcancel = false;
	_classname = "";
	
	switch ( buildtype ) do {
		case 99: {
			GRLIB_removeBoxes = "fobBox";
			_classname = FOB_typename;
		};
		case "ammoDevice": {
			GRLIB_removeBoxes = "deviceBox";
			buildtype = 6;
			_classname = AmmoFactory_device_typename;
		};
		case "solarPanel": {
			GRLIB_removeBoxes = "solarBox";
			buildtype = 6;
			_classname = AmmoFactory_solar_typename;
		};
		case "generator": {
			GRLIB_removeBoxes = "generatorBox";
			buildtype = 6;
			_classname = AmmoFactory_generator_typename;
		};
		default {
			_allowbis = true;
			_allowcancel = true;
			_classname = (((build_lists select buildtype) select buildindex) select 0);
			_price = ((build_lists select buildtype) select buildindex) select 2;
			[ [ _price, _classname, buildtype ] , "build_remote_call" ] call BIS_fnc_MP;
		};
	};

	if(buildtype == 1) then {
		_pos = [(getPosATL player select 0) + 1,(getPosATL player select 1) + 1, 0];
		_grp = group player;
		if ( manned ) then {
			_grp = createGroup WEST;
		};
		_classname createUnit [_pos, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"];
		build_confirmed = 0;
	} else {
		if ( buildtype == 8 ) then {
			_pos = [(getPosATL player select 0) + 1,(getPosATL player select 1) + 1, 0];
			_grp = createGroup WEST;
			_grp setGroupId [format ["%1 %2",squads_names select buildindex, groupId _grp]];
			_idx = 0;
			{
				_unitrank = "private";
				if(_idx == 0) then { _unitrank = "sergeant"; };
				if(_idx == 1) then { _unitrank = "corporal"; };
				_x createUnit [_pos, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, _unitrank];
				_idx = _idx + 1;

			} foreach _classname;
			build_confirmed = 0;
		} else {
			_posfob = getPosATL player;
			if (buildtype != 99) then {
				_posfob = [] call F_getNearestFob;
			};

			_idactcancel = -1;
			_idactsnap = -1;
			_idactlevel = -1;
			_idactplacebis = -1;
			if (buildtype != 99 && _allowcancel) then {
				_idactcancel = player addAction ["<t color='#B0FF00'>" + localize "STR_CANCEL" + "</t> <img size='2' image='res\ui_cancel.paa'/>","scripts\client\build\build_cancel.sqf","",-725,false,true,"","build_confirmed == 1"];
			};
			if (buildtype == 6 && _allowbis) then {
				_idactplacebis = player addAction ["<t color='#B0FF00'>" + localize "STR_PLACEMENT_BIS" + "</t> <img size='2' image='res\ui_confirm.paa'/>","scripts\client\build\build_place_bis.sqf","",-785,false,false,"","build_invalid == 0 && build_confirmed == 1"];
			};
			if (buildtype == 6 || buildtype == 99) then {
				_idactsnap = player addAction ["<t color='#B0FF00'>" + localize "STR_GRID" + "</t>","scripts\client\build\do_grid.sqf","",-735,false,false,"","build_confirmed == 1"];
				_idactlevel = player addAction ["<t color='#B0FF00'>" + localize "STR_LEVEL" + "</t>","scripts\client\build\do_level.sqf","",-735,false,false,"","build_confirmed == 1"];
			};
			_idactrotate = player addAction ["<t color='#B0FF00'>" + localize "STR_ROTATION" + "</t> <img size='2' image='res\ui_rotation.paa'/>","scripts\client\build\build_rotate.sqf","",-750,false,false,"","build_confirmed == 1"];
			_idactplace = player addAction ["<t color='#B0FF00'>" + localize "STR_PLACEMENT" + "</t> <img size='2' image='res\ui_confirm.paa'/>","scripts\client\build\build_place.sqf","",-775,false,true,"","build_invalid == 0 && build_confirmed == 1"];

			_ghost_spot = (getmarkerpos "ghost_spot") findEmptyPosition [0,100];

			_vehicle = _classname createVehicleLocal _ghost_spot;
			_vehicle allowdamage false;
			_vehicle setVehicleLock "LOCKED";
			_vehicle enableSimulationGlobal false;

			_dist = 0.6 * (sizeOf _classname);
			if (_dist < 3.5) then { _dist = 3.5 };
			_dist = _dist + 0.5;

			for [{_i=0}, {_i<5}, {_i=_i+1}] do {
				_vehicle setObjectTextureGlobal [_i, '#(rgb,8,8,3)color(0,1,0,0.8)'];
			};
			
			{ _x setObjectTexture [0, "#(rgb,8,8,3)color(0,1,0,1)"]; } foreach GRLIB_preview_spheres;

			while { build_confirmed == 1 && alive player } do {
				_truedir = 90 - (getdir player);
				_objectheight = 0;
				
				if ( _classname in light_objects ) then {
					_objectheight = (getPosATL player) select 2;
				};
				
				_cursorObject = typeOf cursorTarget;
				if (Build_helper_typename == _cursorObject) then {
					_truepos = [((getPosATL cursorTarget) select 0) + (_dist * (cos _truedir)), ((getPosATL cursorTarget) select 1) + (_dist * (sin _truedir)), (getPosATL cursorTarget) select 2];
				} else {
					_truepos = [((getPosATL player) select 0) + (_dist * (cos _truedir)), ((getPosATL player) select 1) + (_dist * (sin _truedir)), _objectheight];
				};
				
				_actualdir = ((getdir player) + build_rotation);
				if ( _classname == "Land_Cargo_Patrol_V1_F" || _classname == "Land_PortableLight_single_F" ) then { _actualdir = _actualdir + 180 };
				if ( _classname == FOB_typename ) then { _actualdir = _actualdir + 270 };

				while { _actualdir > 360 } do { _actualdir = _actualdir - 360 };
				while { _actualdir < 0 } do { _actualdir = _actualdir + 360 };
				if ( ((buildtype == 6) || (buildtype == 99)) && ((gridmode % 2) == 1) ) then {
					if ( _actualdir >= 22.5 && _actualdir <= 67.5 ) then { _actualdir = 45 };
					if ( _actualdir >= 67.5 && _actualdir <= 112.5 ) then { _actualdir = 90 };
					if ( _actualdir >= 112.5 && _actualdir <= 157.5 ) then { _actualdir = 135 };
					if ( _actualdir >= 157.5 && _actualdir <= 202.5 ) then { _actualdir = 180 };
					if ( _actualdir >= 202.5 && _actualdir <= 247.5 ) then { _actualdir = 225 };
					if ( _actualdir >= 247.5 && _actualdir <= 292.5 ) then { _actualdir = 270 };
					if ( _actualdir >= 292.5 && _actualdir <= 337.5 ) then { _actualdir = 315 };
					if ( _actualdir <= 22.5 || _actualdir >= 337.5 ) then { _actualdir = 0 };
				};

				_sphere_idx = 0;
				{
					_x setPosATL ( [ _truepos, _dist, _sphere_idx * 10 ] call BIS_fnc_relPos );
					_sphere_idx = _sphere_idx + 1;
				} foreach GRLIB_preview_spheres;

				_vehicle setdir _actualdir;

				_near_objects = (_truepos nearobjects ["AllVehicles", _dist]) ;
				_near_objects = _near_objects + (_truepos nearobjects [FOB_box_typename, _dist]);
				_near_objects = _near_objects + (_truepos nearobjects [Arsenal_typename, _dist]);

				_near_objects_25 = (_truepos nearobjects ["AllVehicles", 50]) ;
				_near_objects_25 = _near_objects_25 + (_truepos nearobjects [FOB_box_typename, 50]);
				_near_objects_25 = _near_objects_25 + (_truepos nearobjects [Arsenal_typename, 50]);

				if(	buildtype != 6 && buildtype != 5) then {
					_near_objects = _near_objects + (_truepos nearobjects ["Static", _dist]);
					_near_objects_25 = _near_objects_25 + (_truepos nearobjects ["Static", 50]);
				};
				
				_remove_objects = [];
				{
					if (typeOf _x in GRLIB_ignore_colisions_when_building || _x == player || _x == _vehicle) then {
						_remove_objects pushBack _x;
					};
				} forEach _near_objects;
				
				_remove_objects_25 = [];
				{
					if (typeOf _x in GRLIB_ignore_colisions_when_building || _x == player || _x == _vehicle) then {
						_remove_objects_25 pushBack _x;
					};
				} forEach _near_objects_25;

				_near_objects = _near_objects - _remove_objects;
				_near_objects_25 = _near_objects_25 - _remove_objects_25;

				if ( count _near_objects == 0 ) then {
					{
						_dist22 = 0.6 * (sizeOf (typeof _x));
						if ( _dist22 < 1 ) then { _dist22 = 1 };
						if (_truepos distance _x < _dist22) then {
							_near_objects pushback _x;
						};
					} foreach _near_objects_25;


				};

				if ( count _near_objects != 0 ) then {
					GRLIB_conflicting_objects = _near_objects;
				} else {
					GRLIB_conflicting_objects = [];
				};

				if (count _near_objects == 0 && ((_truepos distance _posfob) < _maxdist || _classname in AmmoFactory_allclasses) && (  ((!surfaceIsWater _truepos) && (!surfaceIsWater getPosATL player)) || (_classname in boats_names) ) ) then {

					if ( (buildtype == 6 || buildtype == 99 || buildtype == 5) && ((gridmode % 2) == 1) ) then {
						_vehicle setPosATL [round (_truepos select 0),round (_truepos select 1), _truepos select 2];
					} else {
						_vehicle setPosATL _truepos;
					};
					if ( (buildtype == 6 || buildtype == 99 || buildtype == 5) && ((levelmode % 2) == 1) ) then {
						_vehicle setVectorUp [0,0,1];
					} else {
						_vehicle setVectorUp surfaceNormal position _vehicle;
					};
					
					if(build_invalid == 1) then {
						GRLIB_ui_notif = "";
						{ _x setObjectTexture [0, "#(rgb,8,8,3)color(0,1,0,1)"]; } foreach GRLIB_preview_spheres;
					};
					build_invalid = 0;

				} else {
					if ( build_invalid == 0 ) then {
						{ _x setObjectTexture [0, "#(rgb,8,8,3)color(1,0,0,1)"]; } foreach GRLIB_preview_spheres;
					};
					_vehicle setPosATL _ghost_spot;
					build_invalid = 1;
					if(count _near_objects > 0) then {
						GRLIB_ui_notif = format [localize "STR_PLACEMENT_IMPOSSIBLE",count _near_objects, round _dist];
						
						if (_debug_colisions) then {
							private [ "_objs_classnames" ];
							_objs_classnames = [];
							{ _objs_classnames pushback (typeof _x) } foreach _near_objects;
							hint format [ "Colisions : %1", _objs_classnames ];
						};
					};
					if( ((surfaceIsWater _truepos) || (surfaceIsWater getPosATL player)) && !(_classname in boats_names)) then {
						GRLIB_ui_notif = localize "STR_BUILD_ERROR_WATER";
					};
					if((_truepos distance _posfob) > _maxdist) then {
						GRLIB_ui_notif = format [localize "STR_BUILD_ERROR_DISTANCE",_maxdist];
					};

				};
				sleep 0.05;
			};

			GRLIB_ui_notif = "";

			{ _x setPosATL [ 0,0,0 ] } foreach GRLIB_preview_spheres;

			if ( !alive player || build_confirmed == 3 ) then {
				deleteVehicle _vehicle;
				[ [ ((build_lists select buildtype) select buildindex) select 2 ] , "cancel_build_remote_call" ] call BIS_fnc_MP;
			};

			if ( build_confirmed == 2 ) then {
				_vehpos = getPosATL _vehicle;
				_vehdir = getdir _vehicle;
				deleteVehicle _vehicle;
				sleep 0.1;
				_vehicle = _classname createVehicle _truepos;
				_vehicle allowDamage false;
				_vehicle setdir _vehdir;
				_vehicle setPosATL _truepos;
				
				_vehicle setVariable ["truePos", _truepos, true];
				_vehicle setVariable ["trueDir", _vehdir, true];
				
				clearWeaponCargoGlobal _vehicle;
				clearMagazineCargoGlobal _vehicle;
				clearItemCargoGlobal _vehicle;
				clearBackpackCargoGlobal _vehicle;
				
				if ( _classname == "C_Offroad_01_repair_F" ) then {
					[
						_vehicle,
						nil,
						[
							"HideDoor1", 1,
							"HideDoor2", 1,
							"HideGlass2", 1,
							"HideDoor3", 0,
							"Proxy", 0,
							"Destruct", 0
						]
					] call BIS_fnc_initVehicle;
				};
				
				if ( _classname == "B_G_Offroad_01_repair_F" ) then {
					[
						_vehicle,
						nil,
						[
							"HideDoor1", 0,
							"HideDoor2", 0,
							"HideGlass2", 1,
							"HideDoor3", 0,
							"Proxy", 0,
							"Destruct", 0
						]
					] call BIS_fnc_initVehicle;
				};
				
				if ( (buildtype == 6 || buildtype == 99 || buildtype == 5) && ((levelmode % 2) == 1) ) then {
					_vehicle setVectorUp [0,0,1];
				} else {
					_vehicle setVectorUp surfaceNormal _truepos;
				};
				
				if ( (_classname in uavs) || manned ) then {
					[ _vehicle ] call F_forceBluforCrew;
				};

				/*if ( _classname == FOB_box_typename ) then {
					[ [_vehicle, 3000 ] , "F_setMass" ] call BIS_fnc_MP;
				};*/
				
				if ( _classname in  [ ammobox_b_typename, ammobox_o_typename, "B_Slingload_01_Ammo_F","JNS_Skycrane_Pod_Ammo_BLU_Green", "B_Slingload_01_Medevac_F", "JNS_Skycrane_Pod_Medical_BLU_Green", "B_Slingload_01_Fuel_F", "JNS_Skycrane_Pod_Fuel_BLU_Green", "B_Slingload_01_Repair_F", "JNS_Skycrane_Pod_Repair_BLU_Green" ] ) then {
					_vehicle setVariable ["ace_cargo_size", -1];
				};
				
				if ( _classname == Build_helper_typename ) then {
					_vehicle setVectorUp [0,0,1];
					_vehicle allowDamage false;
				};
				
				if ( _classname == Medical_typename ) then {
					_vehicle setVariable["ace_medical_isMedicalFacility", true, true];
				};
				
				if ( _classname == Repair_typename ) then {
					_vehicle setVariable ["ACE_isRepairFacility", 1, true];					
				};

				sleep 0.3;
				_vehicle allowDamage true;
				_vehicle setDamage 0;
				
				if ( _classname in ammo_vehicles ) then {
					_vehicle setAmmoCargo 1;
				};
				
				if ( _classname in fuel_vehicles ) then {
					_vehicle setFuelCargo 1;
				};
				
				if ( _classname in repair_vehicles ) then {
					_vehicle setRepairCargo 1;
					_vehicle addItemCargoGlobal ["Toolkit", 25];
					["AddCargoByClass", ["ACE_Wheel", _vehicle, 6]] call ace_common_fnc_globalEvent;
					["AddCargoByClass", ["ACE_Track", _vehicle, 6]] call ace_common_fnc_globalEvent;
					_vehicle setVariable ["ACE_isRepairVehicle", 1, true];
				};
				
				if ( _classname in medical_vehicles ) then {
					_vehicle addItemCargoGlobal ["ACE_fieldDressing", 300];
					_vehicle addItemCargoGlobal ["ACE_elasticBandage", 320];
					_vehicle addItemCargoGlobal ["ACE_bloodIV", 200];
					_vehicle addItemCargoGlobal ["ACE_bloodIV_500", 260];
					_vehicle addItemCargoGlobal ["ACE_bloodIV_250", 280];
					_vehicle addItemCargoGlobal ["ACE_bodyBag", 310];
					_vehicle addItemCargoGlobal ["ACE_epinephrine", 560];
					_vehicle addItemCargoGlobal ["ACE_morphine", 560];
					
					if(ace_medical_level == 2) then {
						_vehicle addItemCargoGlobal ["ACE_atropine", 560];
						_vehicle addItemCargoGlobal ["ACE_quikclot", 250];
						_vehicle addItemCargoGlobal ["ACE_packingBandage", 430];
						_vehicle addItemCargoGlobal ["ACE_personalAidKit", 290];
						_vehicle addItemCargoGlobal ["ACE_plasmaIV", 240];
						_vehicle addItemCargoGlobal ["ACE_plasmaIV_500", 270];
						_vehicle addItemCargoGlobal ["ACE_plasmaIV_250", 290];
						_vehicle addItemCargoGlobal ["ACE_salineIV", 250];
						_vehicle addItemCargoGlobal ["ACE_salineIV_500", 250];
						_vehicle addItemCargoGlobal ["ACE_salineIV_250", 270];
						_vehicle addItemCargoGlobal ["ACE_surgicalKit", 300];
						_vehicle addItemCargoGlobal ["ACE_tourniquet", 420];
					};
					
					_vehicle setVariable ["ace_medical_medicClass", 1, true];
				};
				
				if ( _vehicle isKindOf "Plane" ) then {
					[_vehicle] execVM "scripts\misc\pushback.sqf";
				};
				
				if ( _vehicle isKindOf "AllVehicles" ) then {
					[_vehicle] execVM "IgiLoad\IgiLoad.sqf";
				};
				
				if ( _classname in fuel_cannister ) then {
					[[_vehicle, true, [0.3, 0, 0.3], 90], "ace_dragging_fnc_setCarryable", true, false] call BIS_fnc_MP;
					[_vehicle] execVM "scripts\misc\repair\TAA_Database.sqf";
				};
				
				if ( _classname in repair_container ) then {
					_vehicle setRepairCargo 1;
					_vehicle addItemCargoGlobal ["Toolkit", 25];
				};
				
				if ( _classname in disable_damage ) then {
					_vehicle allowDamage false;
				};
				
				if ( _classname in carryable_objects ) then {
					[[_vehicle, true, [0, 1, 0], 180], "ace_dragging_fnc_setCarryable", true, false] call BIS_fnc_MP;
				};
				
				if ( _classname in draggable_objects ) then {
					[[_vehicle, true, [0, 1, 0], 180], "ace_dragging_fnc_setDraggable", true, false] call BIS_fnc_MP;
				};

				if (buildtype != 6) then {
					_vehicle addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
					{ _x addMPEventHandler ["MPKilled", {_this spawn kill_manager}]; } foreach (crew _vehicle);
				};
			};

			if ( _idactcancel != -1 ) then {
				player removeAction _idactcancel;
			};
			if ( _idactsnap != -1 ) then {
				player removeAction _idactsnap;
			};
			if ( _idactlevel != -1 ) then {
				player removeAction _idactlevel;
			};
			if ( _idactplacebis != -1 ) then {
				player removeAction _idactplacebis;
			};
			player removeAction _idactrotate;
			player removeAction _idactplace;

			if(buildtype == 99) then {
				_new_fob = getPosATL player;
				[ [ _new_fob, false ] , "build_fob_remote_call" ] call BIS_fnc_MP;
				buildtype = 1;
			};

			build_confirmed = 0;
		};
	};

	if ( repeatbuild ) then {
		dobuild = 1;
		repeatbuild = false;
	} else {
		dobuild = 0;
	};
	manned = false;
};