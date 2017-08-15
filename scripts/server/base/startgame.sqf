waitUntil { time > 1 };
waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "save_is_loaded" };

private [ "_fobbox" ];

medicalpod setVariable ["ace_medical_medicClass", 1, true];
medicalpod enableRopeAttach false;
medicalpod lock 2;
[medicalpod,[0,"res\tex\pod_ext01_co.paa"]] remoteExec ["setObjectTexture",0,true];
[medicalpod,[1,"res\tex\pod_ext02_co.paa"]] remoteExec ["setObjectTexture",0,true];
medicalpod setVariable ['ace_dragging_canCarry', false]; 
medicalpod setVariable ['ace_dragging_canDrag', false]; 
medicalpod setVariable ['ace_cargo_canLoad', 0];

if ( count GRLIB_all_fobs == 0 ) then {

	if ( GRLIB_build_first_fob ) then {
		_potentialplaces = [];
		{
			_nextsector = _x;
			_acceptsector = true;
			{
				if ( ( ( markerPos _nextsector ) distance ( markerPos _x ) ) < 1600 ) then {
					_acceptsector = false;
				};
			} foreach sectors_allSectors;

			if ( _acceptsector ) then {
				_potentialplaces pushBack _nextsector;
			};
		} foreach sectors_opfor;

		_spawnplace = _potentialplaces call BIS_fnc_selectRandom;
		[ markerPos _spawnplace, true ] remoteExec ["build_fob_remote_call"];

	} else {
		while { count GRLIB_all_fobs == 0 } do {

			_fobbox = FOB_box_typename createVehicle (getposATL base_boxspawn);
			_fobbox setposATL (getposATL base_boxspawn);
			_fobbox setdir getDir base_boxspawn;
			
			sleep 1;
			
			_fobbox enableSimulationGlobal true;
			_fobbox allowDamage true;
			clearItemCargoGlobal _fobbox;
			clearBackpackCargoGlobal _fobbox;
			clearMagazineCargoGlobal _fobbox;
			clearWeaponCargoGlobal _fobbox;
			[ [_fobbox, 1000 ] , "F_setMass" ] call BIS_fnc_MP;

			sleep 3;

			waitUntil {
				sleep 1;
				!(alive _fobbox) || count GRLIB_all_fobs > 0
			};

			sleep 15;

		};

		deleteVehicle _fobbox;
	};
};