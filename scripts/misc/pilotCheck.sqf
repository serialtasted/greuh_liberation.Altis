_aircraft_nocopilot = ["B_Heli_Light_01_F","B_Heli_Light_01_armed_F","RHS_UH60M","JNS_Skycrane_Medical_BLU_Grey","RHS_CH_47F","USAF_CV22","B_Heli_Attack_01_F","RHS_AH1Z_wd_GS","RHS_AH64D_wd","JS_JC_FA18F","USAF_C17","USAF_C130J","USAF_C130J_Cargo","JNS_Skycrane_BLU_Grey"];

while { true } do {
	waitUntil { alive player };

	waitUntil { sleep 0.2;
		vehicle player == player
	};
	
	waitUntil { sleep 0.2;
		(vehicle player != player) && ( ( (vehicle player ) getCargoIndex player ) < 0 );
	};
	
	_iampilot = false;
	_iamcrew = false;
	if ( ( player getVariable ["St_class", "assault"] ) == "pilot" ) then { _iampilot = true; };
	if ( ( player getVariable ["St_class", "assault"] ) == "crew" ) then { _iamcrew = true; };

	if(vehicle player != player) then {
		_veh = vehicle player;
		
		if((_veh isKindOf "Helicopter" || _veh isKindOf "Plane") && !(_veh isKindOf "ParachuteBase")) then {
			if(({typeOf _veh == _x} count _aircraft_nocopilot) > 0) then {
				_forbidden = [_veh turretUnit [0]];
				if(player in _forbidden) then {
					if (!_iampilot) then {
						hint "Co-pilot is disabled on this vehicle.";
						player action ["getOut",_veh];
					};
				};
			};
			if(!_iampilot) then {
				_forbidden = [driver _veh];
				if (player in _forbidden) then {
					hint "You must be a pilot to fly this aircraft.";
					player action ["getOut", _veh];
				};
			};
		};
		
		if(_veh isKindOf "Tank") then {
			if(!_iamcrew) then {
				_forbidden = [driver _veh, _veh turretUnit [0], _veh turretUnit [1]];
				if (player in _forbidden) then {
					hint "You must be a crew member to operate this vehicle.";
					player action ["getOut", _veh];
				};
			};
		};
	};
};