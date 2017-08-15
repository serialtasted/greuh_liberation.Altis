private ["_aircraft_nocopilot","_restricted_static", "_prevpos"];
_restricted_static = ["RHS_M252_WD","RHS_M119_WD"];
_aircraft_nocopilot = [];

{
	_aircraft_nocopilot pushBack (_x select 0);
} forEach air_vehicles;

while { true } do {
	waitUntil { alive player };
	
	_prevpos = assignedVehicleRole player;
	
	waitUntil { sleep 0.2;
		(vehicle player != player) && ( ( ( vehicle player ) getCargoIndex player ) < 0 )
	};
	
	_iampilot = false;
	_iamcrew = false;
	_iamfso = false;
	if ( ( player getVariable ["St_class", "assault"] ) == "pilot" ) then { _iampilot = true; };
	if ( ( player getVariable ["St_class", "assault"] ) == "crew" ) then { _iamcrew = true; };
	if ( ( player getVariable ["St_class", "assault"] ) == "fso" ) then { _iamfso = true; };

	if(vehicle player != player) then {
		_veh = vehicle player;
		
		if((_veh isKindOf "Helicopter" || _veh isKindOf "Plane") && !(_veh isKindOf "ParachuteBase")) then {
			if(({typeOf _veh == _x} count _aircraft_nocopilot) > 0) then {
				_forbidden = [_veh turretUnit [0]];
				if(player in _forbidden) then {
					if (!_iampilot) then {
						hint "Co-pilot is disabled on this vehicle.";
						if (isTouchingGround _veh || isNil "_prevpos") then {
							player action ["getOut",_veh];
						} else {
							if ( toLower(_prevpos select 0) isEqualTo "turret" ) then {
								player action ["moveToTurret",_veh,_prevpos select 1];
							} else {
								player action ["moveToCargo",_veh,_prevpos select 1];
							};
						};
					};
				};
			};
			if(!_iampilot) then {
				_forbidden = [driver _veh];
				if (player in _forbidden) then {
					hint "You must be a pilot to fly this aircraft.";
					if (isTouchingGround _veh || isNil "_prevpos") then {
						player action ["getOut", _veh];
					} else {
						if ( toLower(_prevpos select 0) isEqualTo "turret" ) then {
							player action ["moveToTurret",_veh,_prevpos select 1];
						} else {
							player action ["moveToCargo",_veh,_prevpos select 1];
						};
					};
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
		
		if(typeOf _veh in _restricted_static) then {
			if(!_iamfso) then {
				_forbidden = [_veh turretUnit [0]];
				if (player in _forbidden) then {
					hint "You must be a fire support officer to operate this weapon.";
					player action ["getOut", _veh];
				};
			};
		};
	};
};