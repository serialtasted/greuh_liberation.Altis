uiSleep 3;

{
	_antenna = false;
	_control = false;
	
	{
		if ( typeOf _x in [ "Land_TTowerBig_1_F", "Land_TTowerBig_2_F", "Land_Communication_F", "Land_jbad_Com_tower", "Land_Telek1", "Land_Vysilac_vez", "Land_A_TVTower_Base", "Land_Com_tower_ep1" ] ) then {
			_antenna = true;
		};
		
		if ( typeOf _x in [ "Land_TBox_F", "Land_spp_Transformer_F" ] ) then {
			_control = true;
		};
	} forEach nearestObjects [(markerpos _x), [], 100];
	
	if ( !_antenna ) then {
		_nextower = ([ "Land_TTowerBig_1_F", "Land_TTowerBig_2_F", "Land_jbad_Com_tower" ] call BIS_fnc_selectRandom) createVehicle (markerpos _x);
		_nextower setpos (markerpos _x);
		_nextower setDir (random 360);
		_nextower setVectorUp [0,0,1];
		_nextower addEventHandler ["HandleDamage", { 0 }];
		
		_nexhouse = createVehicle [([ "Land_cargo_addon02_V1_F", "Land_cargo_addon02_V2_F", "Land_Slum_House02_F", "Land_Slum_House01_F" ] call BIS_fnc_selectRandom), (markerpos _x), [], 20, "NONE"];
		_nexhouse setDir (random 360);
		_nexhouse setVectorUp [0,0,1];
	};
	
	if ( !_control ) then {
		_nexbox = createVehicle [([ "Land_TBox_F", "Land_spp_Transformer_F" ] call BIS_fnc_selectRandom), (markerpos _x), [], 10, "NONE"];
		_nexbox setDir (random 360);
		_nexbox setVectorUp [0,0,1];
	};
	
} foreach sectors_tower;