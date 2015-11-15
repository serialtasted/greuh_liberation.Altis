params [ "_sector" ];
private [ "_crates_amount", "_spawnpos", "_i", "_spawnclass" ];

if ( isNil "GRLIB_military_sectors_already_activated" ) then { GRLIB_military_sectors_already_activated = [] };

if ( !( _sector in GRLIB_military_sectors_already_activated )) then {

	GRLIB_military_sectors_already_activated pushback _sector;

	_crates_amount = ceil (((0.5 * GRLIB_sector_military_value) + (random (0.5 * GRLIB_sector_military_value ))) * GRLIB_resources_multiplier);
	if ( _crates_amount > 6 ) then { _crates_amount = 6 };

	for [ {_i=0}, {_i < (_crates_amount + 1) }, {_i=_i+1} ] do {

		_spawnclass = ammobox_o_typename;
		if ( _i == 0 ) then {
			_spawnclass = opfor_ammobox_transport;
		};

		_spawnpos = [0,0,0];
		while { surfaceIsWater _spawnpos } do {
			_spawnpos =  ( [ ( markerpos _sector), random 50, random 360 ] call BIS_fnc_relPos ) findEmptyPosition [5, 100, 'B_Heli_Transport_01_F'];
			if ( count _spawnpos == 0 ) then { _spawnpos = [0,0,0]; };
		};

		_newbox = _spawnclass createVehicle _spawnpos;
		_newbox setVariable ["ace_cargo_size", -1];
		_newbox setpos _spawnpos;
		_newbox setdir (random 360);
		clearWeaponCargoGlobal _newbox;
		clearMagazineCargoGlobal _newbox;
		clearItemCargoGlobal _newbox;
		clearBackpackCargoGlobal _newbox;

		if ( _i != 0 ) then {
			[ [_newbox, 500 ] , "F_setMass" ] call BIS_fnc_MP;
		};
	};
};