private [ "_maxdist", "_truepos", "_price", "_pos", "_grp", "_classname", "_idx", "_unitrank", "_posfob", "_ghost_spot", "_vehicle", "_dist", "_actualdir", "_near_objects", "_near_objects_25", "_allowbis", "_allowcancel", "_debug_colisions", "_objectheight" ];

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
if (isNil "heightmodifier" ) then { heightmodifier = 0 };
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
	_objectheight = 0;
	
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
		case "spareWheel": {
			buildtype = 6;
			_classname = "ACE_Wheel";
		};
		case "spareTrack": {
			buildtype = 6;
			_classname = "ACE_Track";
		};
		case "fuelBarrel": {
			buildtype = 6;
			_classname = "Land_MetalBarrel_F";
		};
		case "fuelSling": {
			buildtype = 6;
			_classname = "FlexibleTank_01_forest_F";
		};
		case "fuelCannister": {
			buildtype = 6;
			_classname = "Land_CanisterFuel_F";
		};
		default {
			_allowbis = true;
			_allowcancel = true;
			_classname = (((build_lists select buildtype) select buildindex) select 0);
			_price = ((build_lists select buildtype) select buildindex) select 2;
			[_price, _classname, buildtype] remoteExec ["build_remote_call"];
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
			_grp setCombatMode "GREEN";
			_grp setBehaviour "AWARE";
			build_confirmed = 0;
		} else {
			_posfob = getPosATL player;
			if (buildtype != 99) then {
				_posfob = [] call F_getNearestFob;
			};

			_idactcancel = -1;
			_idactsnap = -1;
			_idactlevel = -1;
			_idactraise = -1;
			_idactlower = -1;
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
				
				if ( heightmodifier < 2 && _idactraise == -1 && (buildtype == 6 || buildtype == 99)) then {
					_idactraise = player addAction ["<t color='#B0FF00'>" + localize "STR_OBJUP" + "</t>","scripts\client\build\do_objup.sqf","",-735,false,false,"","build_confirmed == 1"];
				} else {
					if ( heightmodifier >= 2 ) then { player removeAction _idactraise; _idactraise = -1;  };
				};
				
				if ( heightmodifier > -2 && _idactlower == -1 && (buildtype == 6 || buildtype == 99)) then {
					_idactlower = player addAction ["<t color='#B0FF00'>" + localize "STR_OBJDOWN" + "</t>","scripts\client\build\do_objdown.sqf","",-735,false,false,"","build_confirmed == 1"];
				} else {
					if ( heightmodifier <= -2 ) then { player removeAction _idactlower; _idactlower = -1; };
				};
				
				_truedir = 90 - (getdir player);
				
				if (buildtype == 6 || buildtype == 99) then {
					if ( _classname in light_objects ) then {
						_objectheight = ((getPosATL player) select 2) + heightmodifier;
					} else {
						_objectheight = heightmodifier;
					};
				} else {
					if ( _classname in light_objects || (player distance nimitz) < 200 ) then {
						_objectheight = ((getPosATL player) select 2);
					} else {
						_objectheight = 0;
					};
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
				
				if(	buildtype != 6 ) then {
					_near_objects = _near_objects + (_truepos nearobjects ["Static", _dist]);
					_near_objects_25 = _near_objects_25 + (_truepos nearobjects ["Static", 50]);
				};
				
				private _remove_objects = [];
				{
					if ((_x isKindOf "Animal") || (_x isKindOf "StaticWeapon") || ((typeof _x) in GRLIB_ignore_colisions_when_building) || (_x == player) || (_x == _vehicle )) then {
						_remove_objects pushBack _x;
					};
				} forEach _near_objects;
				
				private _remove_objects_25 = [];
				{
					if ((_x isKindOf "Animal") || (_x isKindOf "StaticWeapon") || ((typeof _x) in GRLIB_ignore_colisions_when_building) || (_x == player) || (_x == _vehicle )) then {
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

				if (count _near_objects == 0 && ( ((!surfaceIsWater _truepos) && (!surfaceIsWater getPosATL player)) || (player distance nimitz) < 60 ) ) then {

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
					
					if ( ( ((surfaceIsWater _truepos) && (surfaceIsWater getPosATL player)) ) && (_classname isKindOf "Ship") ) then {
					
						_vehicle setPosASL _truepos;
						_vehicle setVectorUp [0,0,1];
						
						if(build_invalid == 1) then {
							GRLIB_ui_notif = "";
							{ _x setObjectTexture [0, "#(rgb,8,8,3)color(0,1,0,1)"]; } foreach GRLIB_preview_spheres;
						};
						build_invalid = 0;
						
					} else {
						
						GRLIB_ui_notif = format ["You're too further away from the allowed build radius."];
						
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
						if( ((surfaceIsWater _truepos) || (surfaceIsWater getPosATL player)) && !(_classname isKindOf "Ship") && (player distance nimitz) > 60 ) then {
							GRLIB_ui_notif = localize "STR_BUILD_ERROR_WATER";
						};
						
					};
					
				};
				sleep 0.05;
			};

			GRLIB_ui_notif = "";

			{ _x setPosATL [ 0,0,0 ] } foreach GRLIB_preview_spheres;

			if ( !alive player || build_confirmed == 3 ) then {
				deleteVehicle _vehicle;
				[ ((build_lists select buildtype) select buildindex) select 2 ] remoteExec ["cancel_build_remote_call"];
			};

			if ( build_confirmed == 2 ) then {
			
				if ( ( ((surfaceIsWater _truepos) && (surfaceIsWater getPosATL player)) ) && (_classname isKindOf "Ship") ) then {
					_vehpos = getPosASL _vehicle;
				} else {
					_vehpos = getPosATL _vehicle;
				};
				
				_vehdir = getdir _vehicle;
				deleteVehicle _vehicle;
				
				_size = (sizeOf _classname);
				_containerclass = "";
				if ( _size >= 0 && _size < 1 ) then { _containerclass = "Land_PlasticCase_01_small_F" };
				if ( _size >= 1 && _size < 3 ) then { _containerclass = "Land_PlasticCase_01_medium_F" };
				if ( _size >= 3 && _size < 5 ) then { _containerclass = "Land_PlasticCase_01_large_F" };
				if ( _size >= 5 && _size < 10 ) then { _containerclass = "Land_Cargo10_military_green_F" };
				if ( _size >= 10 && _size < 15 ) then { _containerclass = "Land_Cargo20_military_green_F" };
				if ( _size >= 15 ) then { _containerclass = "Land_Cargo40_military_green_F" };
				
				_buildtime = 2;
				if ((round(sizeOf _classname) * 0.8) > 2) then { _buildtime = (round(sizeOf _classname) * 0.8) };
				
				_container = objNull;
				_typeofbuild = "";
				_waypoint = [0,0,0];
				_airportmarker = "";
				_airportid = 0;
				
				if ( _classname in (all_vehicles_classnames - static_vehicles_classnames) ) then {
				
					_typeofbuild = "Calling for a";
					player playMoveNow "Acts_listeningToRadio_Loop";
					
					if ( _classname in can_parachute ) then { 
						_truepos = [ ((_truepos select 0) - (round(wind select 0) * 85)), ((_truepos select 1) - (round(wind select 1) * 85)), 300 ];
					} else { 
						if ( _classname in air_vehicles_classnames ) then {
							
							_airportmarker = ( [ sectors_airports , [ _truepos ] , { (markerpos _x) distance _input0 }, "ASCEND"] call BIS_fnc_sortBy ) select 0;
							_airportid = parseNumber ((_airportmarker splitString "_") select 1);
							
							_waypoint = _truepos;
							_truepos = [ (getMarkerPos "blufor_airspawn") select 0, (getMarkerPos "blufor_airspawn") select 1, 800 ];
							_vehdir = (markerDir "blufor_airspawn");
							_buildtime = _buildtime / 4;
						} else {
							_buildtime = _buildtime * 2;
						};
					};
					
				} else {
				
					_typeofbuild = "Building";
					player playMoveNow "Acts_carFixingWheel";
					_container = _containerclass createVehicle _truepos;
					_container setDir (random 360);
					
				};
				
				[
					_buildtime,
					[_classname, _truepos, _vehdir, _container, _waypoint, _airportmarker, _airportid],
					{
						_classname = (_this select 0) select 0;
						_truepos = (_this select 0) select 1;
						_vehdir = (_this select 0) select 2;
						_container = (_this select 0) select 3;
						_waypoint = (_this select 0) select 4;
						_airportmarker = (_this select 0) select 5;
						_airportid = (_this select 0) select 6;
						
						if ( !isNull _container ) then { deleteVehicle _container };
						
						_airnotifmsg = "Air vehicle is on the way!";
						
						_vehicle = objNull;
						if ( _classname in air_vehicles_classnames ) then {
							_grp = createGroup west;
							_vehicle = createVehicle [_classname, _truepos, [], 10, "FLY"];
							createVehicleCrew _vehicle;
							
							_driverseat = [driver _vehicle];
							_grparray = [];
							{
								if ( _x in _driverseat ) then {
									_grparray pushBack _x;
									_grparray join _grp;
									
									removeAllWeapons _x;
									removeAllItems _x;
									removeVest _x;
									removeBackpack _x;
									
									_x setVariable [ "SAVEUNIT", false ];
									[_x, ["<t color='#FFFF00'>" + "-- DISMISS PILOT" + "</t>", "scripts\client\ai\pilotdismiss.sqf", [_x, _grp]]] remoteExec ["addAction", 0, true];
								} else {
									deleteVehicle _x;
								};
							} forEach crew _vehicle;
							
							if ( _vehicle isKindOf "Plane" ) then { _waypoint = (getMarkerPos _airportmarker) };
							
							_wp = _grp addWaypoint [_waypoint, 1];
							_wp setWaypointType "GETOUT";
							_wp setWaypointSpeed "FULL";
							_wp setWaypointBehaviour "SAFE";
							_wp setWaypointCombatMode "BLUE";
							
							if ( _vehicle isKindOf "Plane" ) then {
								_vehicle land "LAND";
								_vehicle landAt _airportid;
								
								_airportname = "";
								switch (_airportid) do {
									case 0: {_airportname = "Altis International Airport"};
									case 1: {_airportname = "Therisa Airfield"};
									case 2: {_airportname = "Abdera Airfield"};
									case 3: {_airportname = "Selakano Airfield"};
									case 4: {_airportname = "Molos Airfield"};
									case 5: {_airportname = "Almyra Salt Lake Airstrip"};
								};
								
								_airnotifmsg = _airnotifmsg + format [" Heading to %1.", _airportname];
							};
							
						} else {
							_vehicle = _classname createVehicle [0,0,0];
							_vehicle setPos _truepos;
						};
						
						_vehicle allowDamage false;
						_vehicle setdir _vehdir;
						
						if ( _classname in can_parachute ) then {
							[objnull, _vehicle] call BIS_fnc_curatorobjectedited;
							["lib_hq_radio", ["Airdrop on the way. Watch your head soldier!"]] call BIS_fnc_showNotification;
							
							_smoke = createVehicle ["SmokeshellBlue", position _vehicle, [], 0, "CAN_COLLIDE"];
							_smoke AttachTo [_vehicle,[0,0,0]];
						} else { 
							if ( _classname in air_vehicles_classnames ) then {
								["lib_hq_radio", [_airnotifmsg]] call BIS_fnc_showNotification;
							};
						};
						
						if ( ( ((surfaceIsWater _truepos) && (surfaceIsWater getPosATL player)) ) && (_classname isKindOf "Ship") ) then {
							_vehicle setPosASL _truepos;
						} else {
							_vehicle setPosATL _truepos;
						};
						
						_vehicle setVariable ["truePos", _truepos, true];
						_vehicle setVariable ["trueDir", _vehdir, true];
						
						clearWeaponCargoGlobal _vehicle;
						clearMagazineCargoGlobal _vehicle;
						clearItemCargoGlobal _vehicle;
						clearBackpackCargoGlobal _vehicle;
						
						if ( _vehicle isKindOf "Helicopter" ) then {
							[_vehicle] remoteExec ["ace_fastroping_fnc_equipFRIES"];
						};
						
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
						
						if ( _classname in [ "B_Slingload_01_Ammo_F","JNS_Skycrane_Pod_Ammo_BLU_Green", "B_Slingload_01_Medevac_F", "JNS_Skycrane_Pod_Medical_BLU_Green", "B_Slingload_01_Fuel_F", "JNS_Skycrane_Pod_Fuel_BLU_Green", "B_Slingload_01_Repair_F", "JNS_Skycrane_Pod_Repair_BLU_Green" ] ) then {
							_vehicle setVariable ["ace_cargo_size", -1, true];
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

						_vehicle allowDamage true;
						_vehicle setDamage 0;
						
						if(buildtype == 99) then {
							_vehicle addEventHandler ["HandleDamage", { 0 }];
						};
						
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
						}else{
							if ( _vehicle isKindOf "Land" ) then { _vehicle addItemCargoGlobal ["Toolkit", 2]; };
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
						
						if ( _classname in fuel_cannister ) then {
							[_vehicle, true, [0.3, 0, 0.3], 90] remoteExec ["ace_dragging_fnc_setCarryable"];
							[_vehicle, true, 1] remoteExec ["ace_cargo_fnc_makeLoadable"];
							[_vehicle] execVM "scripts\misc\repair\TAA_Database.sqf";
						};
						
						if ( _classname in repair_container ) then {
							_vehicle setRepairCargo 1;
							_vehicle addItemCargoGlobal ["Toolkit", 25];
						};
						
						if ( _classname in disable_damage ) then {
							_vehicle addEventHandler ["HandleDamage", {0}];
						};
						
						if ( _classname in carryable_objects ) then {
							[_vehicle, true, [0, 1, 0], 180] remoteExec ["ace_dragging_fnc_setCarryable"];
							[_vehicle, true, 1] remoteExec ["ace_cargo_fnc_makeLoadable"];
						};

						if ( _classname in draggable_objects ) then {
							[_vehicle, true, [0, 1, 0], 180] remoteExec ["ace_dragging_fnc_setDraggable"];
							[_vehicle, true, 3] remoteExec ["ace_cargo_fnc_makeLoadable"];
						};
						
						if ( _classname isEqualTo "Flag_Red_F" ) then {
							_vehicle setFlagTexture "res\flag_portugal_co.paa";
							_vehicle setFlagSide west;
						};
						
						if ( _classname isEqualTo "Flag_Green_F" ) then {
							_vehicle setFlagTexture "res\flag_ptrangers_co.paa";
							_vehicle setFlagSide west;
						};

						if (buildtype != 6) then {
							_vehicle addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
							{ _x addMPEventHandler ["MPKilled", {_this spawn kill_manager}]; } foreach (crew _vehicle);
						};
						
						player switchmove "";
					},
					{
						_container = (_this select 0) select 3;
						if ( !isNull _container ) then { deleteVehicle _container };
						player switchmove "";
						
						_msg = format ["Action cancelled"];
						titleText [_msg, "PLAIN DOWN"];
					},
					format["%1 %2...", _typeofbuild, getText (configFile >> "cfgVehicles" >> _classname >> "displayName")]
				] call ace_common_fnc_progressBar;
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
			if ( _idactraise != -1 ) then {
				player removeAction _idactraise;
			};
			if ( _idactlower != -1 ) then {
				player removeAction _idactlower;
			};
			if ( _idactplacebis != -1 ) then {
				player removeAction _idactplacebis;
			};
			player removeAction _idactrotate;
			player removeAction _idactplace;

			if(buildtype == 99) then {
				_new_fob = getPosATL player;
				[_new_fob, false] remoteExec ["build_fob_remote_call"];
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