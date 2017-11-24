private [ "_maxdist", "_idxHarborMarker", "_truepos", "_price", "_pos", "_grp", "_classname", "_idx", "_unitrank", "_posfob", "_ghost_spot", "_vehicle", "_dist", "_actualdir", "_near_objects", "_near_objects_25", "_allowbis", "_allowcancel", "_debug_colisions", "_objectheight", "_builddone" ];

build_confirmed = 0;
build_done = false;
_maxdist = GRLIB_fob_range;
_truepos = [];
_debug_colisions = false;
_idxHarborMarker = 0;


GRLIB_preview_spheres = [];
while { count GRLIB_preview_spheres < 36 } do {
	GRLIB_preview_spheres pushback ( "Sign_Sphere100cm_F" createVehicleLocal [ 0, 0, 0 ] );
};

{ _x setObjectTexture [0, "#(rgb,8,8,3)color(0,1,0,1)"]; } foreach GRLIB_preview_spheres;

if (isNil "manned") then { manned = false };
if (isNil "gridmode" ) then { gridmode = 0 };
if (isNil "levelmode" ) then { levelmode = 0 };
if (isNil "heightmodifier" ) then { heightmodifier = 0 };
if (isNil "heightmodifierctrl" ) then { heightmodifierctrl = false };
if (isNil "repeatbuild" ) then { repeatbuild = false };
if (isNil "build_rotation" ) then { build_rotation = 0 };
if (isNil "buildtype_special" ) then { buildtype_special = 0 };

waitUntil { sleep 0.2; !isNil "dobuild" };

waitUntil {!isnull (finddisplay 46)};
(findDisplay 46) displayAddEventHandler ["MouseZChanged", "(_this select 1) call F_handleScrollWheel"];
(findDisplay 46) displayAddEventHandler ["KeyDown", "
	_keyDown = _this select 1; 
	if (_keyDown == " + str (29) + ") then { heightmodifierctrl = true }
	else { heightmodifierctrl = false };
"];

while { true } do {
	waitUntil { sleep 0.2; dobuild != 0 };
	build_confirmed = 1;
	build_invalid = 0;
	_allowbis = false;
	_allowcancel = false;
	_classname = "";
	_objectheight = 0;
	
	if ( buildtype_special != 0 ) then { buildtype = buildtype_special };
	
	switch ( buildtype ) do {
		case 99: {
			GRLIB_removeBoxes = "fobBox";
			_classname = FOB_typename;
		};
		case 100: {
			buildtype = 7;
			_allowcancel = true;
			_classname = (medical_type select buildindex) select 0;
			_price = (medical_type select buildindex) select 2;
			[_price, _classname, buildtype] remoteExec ["build_remote_call"];
		};
		case 101: {
			buildtype = 7;
			_allowcancel = true;
			_classname = ( (repair_type + (build_lists select buildtype)) select buildindex) select 0;
			_price = ((repair_type + (build_lists select buildtype)) select buildindex) select 2;
			[_price, _classname, buildtype] remoteExec ["build_remote_call"];
		};
		case 102: {
			buildtype = 7;
			_allowcancel = true;
			_classname = ((barracks_type select buildindex) select 0);
			_price = (barracks_type select buildindex) select 2;
			[_price, _classname, buildtype] remoteExec ["build_remote_call"];
		};
		default {
			_allowbis = true;
			_allowcancel = true;
			_classname = ((build_lists select buildtype) select buildindex) select 0;
			_price = ((build_lists select buildtype) select buildindex) select 2;
			[_price, _classname, buildtype] remoteExec ["build_remote_call"];
		};
	};

	if(buildtype == 1) then {
		_pos = [(getPosATL player select 0) + 1,(getPosATL player select 1) + 1, 0];
		_grp = group player;
		if ( manned ) then {
			_grp = createGroup GRLIB_side_friendly;
		};
		_aiunit = _classname createUnit [_pos, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"];
		_aiunit setVariable ["ALLOWRECYCLE", true, true];
		build_confirmed = 0;
	} else {
		if ( buildtype == 8 ) then {
			_pos = [(getPosATL player select 0) + 1,(getPosATL player select 1) + 1, 0];
			_grp = createGroup GRLIB_side_friendly;
			_grp setGroupId [format ["%1 %2",squads_names select buildindex, groupId _grp]];
			_idx = 0;
			{
				_unitrank = "private";
				if(_idx == 0) then { _unitrank = "sergeant"; };
				if(_idx == 1) then { _unitrank = "corporal"; };
				_aiunit = _x createUnit [_pos, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, _unitrank];
				_aiunit setVariable ["ALLOWRECYCLE", true, true];
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
			
			if !( _classname in (all_vehicles_classnames - static_vehicles_classnames) ) then {
				_dist = 0.6 * (sizeOf _classname);
				if (_dist < 3.5) then { _dist = 3.5 };
				_dist = _dist + 0.5;

				for [{_i=0}, {_i<5}, {_i=_i+1}] do {
					_vehicle setObjectTextureGlobal [_i, '#(rgb,8,8,3)color(0,1,0,0.8)'];
				};
				
				{ _x setObjectTexture [0, "#(rgb,8,8,3)color(0,1,0,1)"]; } foreach GRLIB_preview_spheres;

				while { build_confirmed == 1 && alive player } do {
					
					_truedir = 90 - (getdir player);
					
					if (buildtype == 6 || buildtype == 99) then {
						if ( _classname in light_objects ) then {
							_objectheight = ((getPosATL player) select 2) + heightmodifier;
						} else {
							_objectheight = heightmodifier;
						};
					} else {
						if ( _classname in light_objects ) then {
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
						_x setPosATL ( _truepos getPos [ _dist, _sphere_idx * 10 ] );
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

					if (count _near_objects == 0 && ((_truepos distance _posfob) < _maxdist) && ( ((!surfaceIsWater _truepos) && (!surfaceIsWater getPosATL player)) || (player distance ussfreedom) < 200 ) ) then {

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
						
						if ( ( ((surfaceIsWater _truepos) && (surfaceIsWater getPosATL player)) ) && (!(_classname isKindOf "Ship") && _classname in can_build_on_water) ) then {
						
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
							if( ((surfaceIsWater _truepos) || (surfaceIsWater getPosATL player)) && !(_classname isKindOf "Ship" && _classname in can_build_on_water) && (player distance ussfreedom) > 250 ) then {
								GRLIB_ui_notif = localize "STR_BUILD_ERROR_WATER";
							};
							if((_truepos distance _posfob) > _maxdist) then {
								GRLIB_ui_notif = format [localize "STR_BUILD_ERROR_DISTANCE",_maxdist];
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
			} else {
				
				if ( surfaceIsWater (getPos player) && (player distance ussfreedom) > 250  ) exitWith { 
					deleteVehicle _vehicle;
					[ ((build_lists select buildtype) select buildindex) select 2 ] remoteExec ["cancel_build_remote_call"];
					hint format["Can't call for a land vehicle on water!"];
				};
				
				_truepos = (player getPos [random 30, random 360]) findEmptyPosition [0, 60, _classname];
				if ( count _truepos == 0 ) then {
					_truepos = getPos player;
				};
				
				_vehicle setDir (random 360);
				_vehicle setPosATL _truepos;
				
				build_confirmed = 2;
			};

			if ( build_confirmed == 2 ) then {
			
				if ( ( ((surfaceIsWater _truepos) && (surfaceIsWater getPosATL player)) ) && (!(_classname isKindOf "Ship") && _classname in can_build_on_water) ) then {
					_vehpos = getPosASL _vehicle;
				} else {
					_vehpos = getPosATL _vehicle;
				};
				
				_vehdir = getdir _vehicle;
				deleteVehicle _vehicle;
				
				_size = (sizeOf _classname);
				_containerclass = "";
				if ( _size >= 0 && _size < 3 ) then { _containerclass = "Land_PlasticCase_01_medium_F" };
				if ( _size >= 3 && _size < 5 ) then { _containerclass = "Land_PlasticCase_01_large_F" };
				if ( _size >= 5 && _size < 10 ) then { _containerclass = "Land_Cargo10_military_green_F" };
				if ( _size >= 10 ) then { _containerclass = "Land_Cargo20_military_green_F" };
				
				_buildtime = 2;
				if ((round(sizeOf _classname) * 0.8) > 2) then { _buildtime = (round(sizeOf _classname) * 0.8) };
				
				_container = objNull;
				_typeofbuild = "";
				_waypoint = [0,0,0];
				_airportmarker = "";
				_harbormarker = "";
				_airportid = 0;
				
				if ( _classname in (all_vehicles_classnames - static_vehicles_classnames) ) then {
				
					_typeofbuild = "Calling for a";
					player playMoveNow "Acts_listeningToRadio_Loop";
					
					if ( _classname in can_parachute ) then {
						_flare = "F_40mm_Yellow" createVehicle [_truepos select 0, _truepos select 1, 0];
						_truepos = [ ((_truepos select 0) - (round(wind select 0) * 45)), ((_truepos select 1) - (round(wind select 1) * 45)), 300 ];
					} else { 
						if ( _classname in air_vehicles_classnames ) then {
							
							_airportmarker = ( [ sectors_airports , [ _truepos ] , { (markerpos _x) distance _input0 }, "ASCEND"] call BIS_fnc_sortBy ) select 0;
							_airportid = parseNumber ((_airportmarker splitString "_") select 1);
							
							_waypoint = _truepos;
							_spawnmarker = "blufor_airspawn";
							_truepos = [ (getMarkerPos _spawnmarker) select 0, (getMarkerPos _spawnmarker) select 1, 800 ];
							_vehdir = (markerDir "blufor_airspawn");
							_buildtime = _buildtime / 4;
						} else {
							if ( _classname isKindOf "Ship" ) then {
								_harbormarker = ( [ sectors_harbors , [ _truepos ] , { (markerpos _x) distance _input0 }, "ASCEND"] call BIS_fnc_sortBy ) select 0;
								_truepos = (getMarkerPos _harbormarker) findEmptyPosition [0, 20, "B_MRAP_01_F"];;
								_buildtime = _buildtime * 2;
							};
						};
					};
					
				} else {
				
					_typeofbuild = "Building";
					player playMoveNow "Acts_carFixingWheel";
					_container = _containerclass createVehicle ( _truepos findEmptyPosition [1, 10, _containerclass] );
					_container setDir (random 360);
					
				};
				
				build_done = false;
				
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
						
						_airnotifmsg = "";
						_harbornotifmsg = "";
						
						_vehicle = objNull;
						if ( _classname in air_vehicles_classnames ) then {
							_grp = createGroup GRLIB_side_friendly;
							_radius = 150;
							if ( _airportid == 6 ) then { _radius = 0 };
							_vehicle = createVehicle [_classname, _truepos, [], _radius, "FLY"];
							createVehicleCrew _vehicle;
							_vehicle setVariable ["isCallOut", true];
							
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
									_x addEventHandler ["GetOutMan", { deleteVehicle (_this select 0) }];
								} else {
									deleteVehicle _x;
								};
							} forEach crew _vehicle;
							
							if ( _vehicle isKindOf "Plane" ) then { _waypoint = (getMarkerPos _airportmarker) };
							
							_wp = _grp addWaypoint [_waypoint, 1];
							_wp setWaypointSpeed "FULL";
							_wp setWaypointBehaviour "SAFE";
							_wp setWaypointCombatMode "BLUE";
							if ( (typeOf _vehicle) in uavs ) then {
								_vehicle setVariable ["isCallOut", false];
								_vehicle flyInHeight 200;
								
								_wp setWaypointType "LOITER";
								_wp setWaypointLoiterType "CIRCLE_L";
								_wp setWaypointLoiterRadius 250;
							} else {
								_wp setWaypointType "GETOUT";
							};
							
							if ( _classname == FOB_box_typename ) then {
								[ [_vehicle, 1000 ] , "F_setMass" ] call BIS_fnc_MP;
							};
							
							_airnotifmsg = format ["Air vehicle is on the way!"];
							
							if ( _vehicle isKindOf "Plane" && !((typeOf _vehicle) in uavs) ) then {
								
								_vehicle land "LAND";
								if ( _airportid != 99 ) then {
									_vehicle landAt _airportid;
								} else {
									_vehicle landAt -1;
									[_vehicle] spawn {
										_vehicle = _this select 0;
										
										waitUntil { _vehicle distance2D ussfreedom < 300 || isTouchingGround _vehicle };
										
										_vel = velocity _vehicle;
										_dir = 0;
										if ( (direction ussfreedom) > 180 && (direction ussfreedom) < 360 ) then { _dir = (direction ussfreedom) - 120 }
										else { _dir = (direction ussfreedom) + 120 };
										_speed = 5;
										_vehicle setVelocity [
											(_vel select 0) - (sin _dir * _speed), 
											(_vel select 1) - (cos _dir * _speed), 
											(_vel select 2)
										];
										
										waitUntil { isTouchingGround _vehicle };
										
										sleep 1.5;
										_vehicle setVelocity [0,0,0];
									};
								};
								
								_airportname = "";
								switch (_airportid) do {
									case 99: {_airportname = "USS Freedom"};
									default {
										_nearest_sector = [2000, (getMarkerPos _airportmarker)] call F_getNearestSector;
										if ( _nearest_sector != "" ) then { _airportname = (markertext _nearest_sector) };
									};
								};
								
								_airnotifmsg = format ["%1 Heading to %2.", _airnotifmsg, _airportname];
							};
							
						} else {
							if ( _classname isKindOf "Ship" ) then {
								
								_vehicle = createVehicle [_classname, _truepos, [], 200, "NONE"];
								
								_markerHB = createMarkerLocal [format ["harbormarker%1",_idxHarborMarker], markers_reset];
								_markerHB setMarkerTypeLocal "b_naval";
								_markerHB setMarkerSizeLocal [ 0.7, 0.7 ];
								_markerHB setMarkerPosLocal _truepos;
								_markerHB setMarkerColorLocal "Default";
								_idxHarborMarker = _idxHarborMarker + 1;
								
								_harbornotifmsg = format ["Your ship has been delivered to %1.", mapGridPosition (markerpos _markerHB)];
								
								[_markerHB] spawn {
									sleep 120;
									deleteMarkerLocal (_this select 0) select 0;
								};
							} else {
								_vehicle = _classname createVehicle [0,0,0];
								_vehicle setPos _truepos;
							};
						};
						
						_vehicle allowDamage false;
						_vehicle setdir _vehdir;
						
						if ( _classname in can_parachute ) then {
							[objnull, _vehicle] call BIS_fnc_curatorobjectedited;
							["lib_hq_radio", ["Airdrop on the way. Watch your head soldier!"]] call BIS_fnc_showNotification;
						} else { 
							if ( _classname in air_vehicles_classnames ) then {
								["lib_hq_radio", [_airnotifmsg]] call BIS_fnc_showNotification;
							} else {
								if ( _classname isKindOf "Ship" ) then {
									["lib_hq_radio", [_harbornotifmsg]] call BIS_fnc_showNotification;
								};
							};
						};
						
						if ( ( ((surfaceIsWater _truepos) && (surfaceIsWater getPosATL player)) ) && (!(_classname isKindOf "Ship") && _classname in can_build_on_water) ) then {
							_vehicle setPosASL _truepos;
						} else {
							_vehicle setPosATL _truepos;
						};
						
						_vehicle setVariable ["truePos", _truepos, true];
						_vehicle setVariable ["trueDir", _vehdir, true];
						_vehicle setVariable ["ALLOWRECYCLE", true, true];
						
						clearWeaponCargoGlobal _vehicle;
						clearMagazineCargoGlobal _vehicle;
						clearItemCargoGlobal _vehicle;
						clearBackpackCargoGlobal _vehicle;
						
						[_vehicle, true] call F_initObjects;

						if ( (buildtype == 6 || buildtype == 99 || buildtype == 5) && ((levelmode % 2) == 1) ) then {
							_vehicle setVectorUp [0,0,1];
						} else {
							_vehicle setVectorUp surfaceNormal _truepos;
						};
						
						if ( (_classname in uavs) || manned ) then {
							[ _vehicle ] call F_forceBluforCrew;
						};

						_vehicle allowDamage true;
						_vehicle setDamage 0;
						
						if(buildtype == 99) then {
							_vehicle addEventHandler ["HandleDamage", { 0 }];
						};

						if (buildtype != 6) then {
							_vehicle addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
							{ _x addMPEventHandler ["MPKilled", {_this spawn kill_manager}]; } foreach (crew _vehicle);
						};
						
						build_done = true;
						player switchmove "";
						
						if(buildtype == 99) then {
							_new_fob = getPosATL player;
							[_new_fob, false] remoteExec ["build_fob_remote_call"];
							buildtype = 1;
						};
					},
					{
						_container = (_this select 0) select 3;
						if ( !isNull _container ) then { deleteVehicle _container };
						build_done = true;
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

			build_confirmed = 0;
		};
	};

	if ( repeatbuild ) then {
		waitUntil { build_done };
		sleep 0.5;
		dobuild = 1;
		repeatbuild = false;
	} else {
		dobuild = 0;
	};
	manned = false;
};