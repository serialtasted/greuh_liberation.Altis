private [ "_oldbuildtype", "_cfg", "_initindex", "_dialog", "_iscommandant", "_squadname", "_buildpages", "_build_list", "_classnamevar", "_entrytext", "_icon", "_affordable", "_affordable_crew", "_selected_item", "_linked", "_linked_unlocked", "_base_link", "_link_color", "_link_str" ];

if ( ( [ getpos player , 400 , GRLIB_side_enemy  ] call F_getUnitsCount ) > 4 ) exitWith { hint localize "STR_BUILD_ENEMIES_NEARBY"; };

if ( isNil "buildtype" ) then { buildtype = 1 };
if ( isNil "buildtype_special" ) then { buildtype = 0 };
if ( isNil "buildindex" ) then { buildindex = -1 };
dobuild = 0;
_oldbuildtype = -1;
_cfg = configFile >> "cfgVehicles";
_initindex = buildindex;

_dialog = createDialog "liberation_build";
waitUntil { dialog };

buildtype = 2;
buildtype_special = 0;

_isFob = false;
_isStartBase = false;
_isUSSFreedom = false;
_isTruck = false;
_isBarracks = false;
_isSpecial = false;
_howSpecial = "";
if ( count (_this select 3) > 0 ) then { 
	_howSpecial = (_this select 3) select 0;
	_isSpecial = true;
	
	switch ( _howSpecial ) do {
		case "medicalFacility":{ buildtype = 7; buildtype_special = 100; };
		case "repairFacility":{ buildtype = 7; buildtype_special = 101; };
		case "barracksFacility":{ buildtype = 7; buildtype_special = 102; _isBarracks = true; };
		default{ };
	};
} else {
	if ( (player distance ussfreedom) < (2 * GRLIB_fob_range) ) then {
		_isUSSFreedom = true;
		buildtype = 4;
	} else { 
		if ( (player distance startbase) < (2 * GRLIB_fob_range) ) then {
			_isStartBase = true;
			buildtype = 2;
		} else {
			if ( (player distance ([] call F_getNearestFob)) < (2 * GRLIB_fob_range) || (player distance startbase) < (2 * GRLIB_fob_range) ) then {
				_isFob = true;
			} else {
				_isTruck = true;
				buildtype = 6;
			};
		};
	};
};

if (_isFob || _isStartBase) then { // LIGHT VEH
	ctrlShow [ 103, true ];
	ctrlShow [ 1035, true ];
} else {
	ctrlShow [ 103, false ];
	ctrlShow [ 1035, false ];
};
ctrlShow [ 104, _isFob ]; // HEAVY VEH
ctrlShow [ 1045, _isFob ];
if (_isFob || _isUSSFreedom || _isStartBase) then { // AIR VEH
	ctrlShow [ 105, true ];
	ctrlShow [ 1055, true ];
} else {
	ctrlShow [ 105, false ];
	ctrlShow [ 1055, false ];
};
ctrlShow [ 1106, _isFob ]; // STATICS
ctrlShow [ 11065, _isFob ];
if (_isFob || _isSpecial) then { // LOGISTICS
	ctrlShow [ 107, true ];
	ctrlShow [ 1075, true ];
} else {
	ctrlShow [ 107, false ];
	ctrlShow [ 1075, false ];
};
if (_isFob || _isTruck) then { // BUILDINGS
	ctrlShow [ 109, true ];
	ctrlShow [ 1095, true ];
} else {
	ctrlShow [ 109, false ];
	ctrlShow [ 1095, false ];
};

_iscommandant = false;
if ( player == [] call F_getCommander && _isBarracks ) then {
	_iscommandant = true;
};
ctrlShow [ 102, _iscommandant ]; // UNITS
ctrlShow [ 1025, _iscommandant ];
ctrlShow [ 108, _iscommandant ]; // SQUADS
ctrlShow [ 1085, _iscommandant ];
ctrlShow [ 121, _iscommandant ]; // BUILD CREW BTN

_squadname = "";
_buildpages = [
localize "STR_BUILD1",
localize "STR_BUILD2",
localize "STR_BUILD3",
localize "STR_BUILD4",
localize "STR_BUILD5",
localize "STR_BUILD6",
localize "STR_BUILD7",
localize "STR_BUILD8"
];

while { dialog && alive player && (dobuild == 0 || buildtype == 1)} do {
	
	_build_list = [];
	
	if ( _isSpecial || buildtype == 7 ) then {
		switch ( _howSpecial ) do {
			case "medicalFacility":{
				_build_list = medical_type;
			};
			case "repairFacility":{
				_build_list = repair_type;
			};
			case "barracksFacility":{ 
				_build_list = barracks_type;
			};
			default{ 
				while { count _build_list < (count (build_lists select buildtype)) - 2 } do {
					_build_list pushback ((build_lists select buildtype) select (count _build_list));
				};
			};
		};
	} else {
		_build_list = build_lists select buildtype;
	};

	if (_oldbuildtype != buildtype || synchro_done ) then {
		synchro_done = false;
		_oldbuildtype = buildtype;

		lbClear 110;
		{
			ctrlSetText [ 151, _buildpages select ( buildtype - 1 ) ];
			if ( buildtype != 8 ) then {
				_classnamevar = (_x select 0);
				_entrytext = getText (_cfg >> _classnamevar >> "displayName");
				if ( _classnamevar == FOB_box_typename ) then {
					_entrytext = localize "STR_FOBBOX";
				};
				if ( _classnamevar == Arsenal_typename ) then {
					_entrytext = localize "STR_ARSENAL_BOX";
				};
				if ( _classnamevar == Respawn_truck_typename ) then {
					_entrytext = localize "STR_RESPAWN_TRUCK";
				};
				if ( _classnamevar == FOB_truck_typename ) then {
					_entrytext = localize "STR_FOBTRUCK";
				};
				if ( _classnamevar == Medical_typename ) then {
					_entrytext = localize "STR_MEDICAL_FACILITY";
				};
				if ( _classnamevar == Repair_typename ) then {
					_entrytext = localize "STR_REPAIR_FACILITY";
				};
				if ( _classnamevar == Barracks_typename ) then {
					_entrytext = localize "STR_BARRACKS_FACILITY";
				};
				if ( _classnamevar == Build_helper_typename ) then {
					_entrytext = localize "STR_BUILD_HELPER";
				};
				if ( _classnamevar == "Flag_Red_F" ) then {
					_entrytext = "Flag (PT)";
				};
				if ( _classnamevar == "Flag_Green_F" ) then {
					_entrytext = "Flag (PTrangers)";
				};
				if ( _classnamevar == "Box_NATO_Wps_F" ) then {
					_entrytext = "Medical Supplies Box (Basic)";
				};
				((findDisplay 5501) displayCtrl (110)) lnbAddRow [ _entrytext, format [ "%1" ,_x select 1], format [ "%1" ,_x select 2], format [ "%1" ,_x select 3]];

				_icon = getText ( _cfg >> (_x select 0) >> "icon");
				if(isText  (configFile >> "CfgVehicleIcons" >> _icon)) then {
					_icon = (getText (configFile >> "CfgVehicleIcons" >> _icon));
				};
				lnbSetPicture  [110, [((lnbSize 110) select 0) - 1, 0],_icon];
			} else {
				if ( ((lnbSize  110) select 0) <= count squads_names ) then {
					_squadname = squads_names select ((lnbSize  110) select 0);
				} else {
					_squadname = "";
				};
				((findDisplay 5501) displayCtrl (110)) lnbAddRow  [_squadname, format [ "%1" ,_x select 1], format [ "%1" ,_x select 2], format [ "%1" ,_x select 3]];
			};

			_affordable = true;
			if(
				((_x select 1 > 0) && ((_x select 1) > (infantry_cap - resources_infantry))) ||
				((_x select 2 > 0) && ((_x select 2) > resources_ammo)) ||
				((_x select 3 > 0) && ((_x select 3) > (fuel_cap - resources_fuel)))
				) then {
				_affordable = false;
			};

			if ( _affordable ) then {
				((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 0], [1,1,1,1]];
				((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 1], [1,1,1,1]];
				((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 2], [1,1,1,1]];
				((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 3], [1,1,1,1]];
			} else {
				((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 0], [0.4,0.4,0.4,1]];
				((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 1], [0.4,0.4,0.4,1]];
				((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 2], [0.4,0.4,0.4,1]];
				((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 3], [0.4,0.4,0.4,1]];
			};

		} foreach _build_list;
	};

	if(_initindex != -1) then {
		lbSetCurSel [110, _initindex];
		_initindex = -1;
	};

	_selected_item = lbCurSel 110;
	_affordable = false;
	_squad_full = false;
	if ((buildtype == 1) && (count (units group player) >= GRLIB_max_squad_size)) then {
		_squad_full = true;
	};
	_linked = false;
	_linked_unlocked = true;
	_base_link = "";
	if (dobuild == 0 && _selected_item != -1 && (_selected_item < (count _build_list)) && !(buildtype == 1 && (count (units group player)) >= 10 )) then {
		_build_item = _build_list select _selected_item;
		if (
				((_build_item select 1 == 0 ) || ((_build_item select 1) <= (infantry_cap - resources_infantry))) &&
				((_build_item select 2 == 0 ) || ((_build_item select 2) <= resources_ammo)) &&
				((_build_item select 3 == 0 ) || ((_build_item select 3) <= (fuel_cap - resources_fuel)))
		) then {
			_affordable = true;
		};

		if ( buildtype != 8 ) then {
			{ if ( ( _build_item select 0 ) == ( _x select 0 ) ) exitWith { _base_link = _x select 1; _linked = true; } } foreach GRLIB_vehicle_to_military_base_links;

			if ( _linked ) then {
				if ( !(_base_link in blufor_sectors) ) then { _linked_unlocked = false };
			};
		};
	};

	_affordable_crew = _affordable;
	if ( unitcap >= ([] call F_localCap)) then {
		_affordable_crew = false;
		if (buildtype == 1 || buildtype == 8) then {
			_affordable = false;
		};
	};

	ctrlEnable [ 120, _affordable && _linked_unlocked && !(_squad_full) ];
	ctrlEnable [ 121, _affordable_crew && _linked_unlocked ];

	ctrlSetText [131, format [ "%1 : %2/%3" , localize "STR_MANPOWER" , (floor resources_infantry), infantry_cap]] ;
	ctrlSetText [132, format [ "%1 : %2" , localize "STR_AMMO" , (floor resources_ammo)] ];
	ctrlSetText [133, format [ "%1 : %2/%3" , localize "STR_FUEL" , (floor resources_fuel), fuel_cap] ];
	ctrlSetText [134, format [ "%1 : %2/%3" , localize "STR_UNITCAP" , unitcap, ([] call F_localCap)] ];

	_link_color = "#0040e0";
	_link_str = localize "STR_VEHICLE_UNLOCKED";
	if (!_linked_unlocked) then { _link_color = "#e00000"; _link_str = localize "STR_VEHICLE_LOCKED"; };
	if ( _linked ) then {
		((findDisplay 5501) displayCtrl (161)) ctrlSetStructuredText parseText ( "<t color='" + _link_color + "' align='center'>" + _link_str +  "<br/>" + ( markerText _base_link ) + "</t>" );
	} else {
		((findDisplay 5501) displayCtrl (161)) ctrlSetStructuredText parseText "";
	};

	buildindex = _selected_item;

	if(buildtype == 1 && dobuild != 0) then {
		ctrlEnable [120, false];
		ctrlEnable [121, false];
		sleep 1;
		dobuild = 0;
	};

	sleep 0.1;
};

if (!alive player || dobuild != 0) then { closeDialog 0 };