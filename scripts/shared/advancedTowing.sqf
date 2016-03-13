/*
The MIT License (MIT)

Copyright (c) 2016 Seth Duda

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
{

diag_log "Advanced Towing Loading...";

if(!isNil "SA_TOW_INIT") exitWith {};

SA_TOW_INIT = true;


SA_Simulate_Towing = {

	params ["_vehicle","_vehicleHitchModelPos","_cargo","_cargoHitchModelPos","_ropeLength"];
	
	private ["_lastCargoHitchPosition","_lastCargoVectorDir","_cargoLength","_maxDistanceToCargo","_lastMovedCargoPosition","_cargoHitchPoints"];
	private ["_vehicleHitchPosition","_cargoHitchPosition","_newCargoHitchPosition","_cargoVector","_movedCargoVector","_attachedObjects"];
	private ["_newCargoDir","_lastCargoVectorDir","_newCargoPosition","_doExit","_cargoPosition","_vehiclePosition","_maxVehicleSpeed","_vehicleMass","_cargoMass"];
	
	if(local _vehicle && !local _cargo) then {
		[_cargo, clientOwner] remoteExec ["setOwner", 2];
	};
	
	_vehicleHitchModelPos set [2,0];
	_cargoHitchModelPos set [2,0];
	
	_lastCargoHitchPosition = _cargo modelToWorld _cargoHitchModelPos;
	_lastCargoVectorDir = vectorDir _cargo;
	_lastMovedCargoPosition = getPos _cargo;
	
	_cargoHitchPoints = [_cargo] call SA_Get_Hitch_Points;
	_cargoLength = (_cargoHitchPoints select 0) distance (_cargoHitchPoints select 1);
	
	_vehicleMass = 1 max (getMass _vehicle);
	_cargoMass = getMass _cargo;
	if(_cargoMass == 0) then {
		_cargoMass = _vehicleMass;
	};
	
	_maxDistanceToCargo = _ropeLength;

	_doExit = false;
	
	while {!_doExit} do {

		_vehicleHitchPosition = _vehicle modelToWorld _vehicleHitchModelPos;
		_vehicleHitchPosition set [2,0];
		_cargoHitchPosition = _lastCargoHitchPosition;
		_cargoHitchPosition set [2,0];
		
		_maxVehicleSpeed = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "maxSpeed");
		
		_cargoPosition = getPos _cargo;
		_vehiclePosition = getPos _vehicle;
		
		if(_vehicleHitchPosition distance _cargoHitchPosition > _maxDistanceToCargo) then {
		
			// Calculated simulated towing position + direction
			_newCargoHitchPosition = _vehicleHitchPosition vectorAdd ((_vehicleHitchPosition vectorFromTo _cargoHitchPosition) vectorMultiply _ropeLength);
			_cargoVector = _lastCargoVectorDir vectorMultiply _cargoLength;
			_movedCargoVector = _newCargoHitchPosition vectorDiff _lastCargoHitchPosition;
			_newCargoDir = vectorNormalized (_cargoVector vectorAdd _movedCargoVector);
			_lastCargoVectorDir = _newCargoDir;
			_newCargoPosition = _newCargoHitchPosition vectorAdd (_newCargoDir vectorMultiply -(vectorMagnitude _cargoHitchModelPos));
			_cargo allowDamage false;
			_cargo setVectorDir _newCargoDir;
			_cargo setPos _newCargoPosition;
			_cargo allowDamage true;
			_lastCargoHitchPosition = _newCargoHitchPosition;
			_maxDistanceToCargo = _vehicleHitchPosition distance _newCargoHitchPosition;
			_lastMovedCargoPosition = _cargoPosition;

			_massAdjustedMaxSpeed = (0.1 * _maxVehicleSpeed) max ((0.75 * _maxVehicleSpeed) * ( 1 min (_vehicleMass / _cargoMass) ));			
			if(speed _vehicle > (_massAdjustedMaxSpeed)+0.1 && _massAdjustedMaxSpeed > 0) then {
				_vehicle setVelocity ((vectorNormalized (velocity _vehicle)) vectorMultiply (_massAdjustedMaxSpeed/3.6));
			};
			
		} else {
		
			if(_lastMovedCargoPosition distance _cargoPosition > 2) then {
				_lastCargoHitchPosition = _cargo modelToWorld _cargoHitchModelPos;
				_lastCargoVectorDir = vectorDir _cargo;
			};
			
		};
		
		if(!local _vehicle) then {
			_this remoteExec ["SA_Simulate_Towing", _vehicle]; 
			_doExit = true;
		};
		
		if( count (ropeAttachedObjects _vehicle) == 0 ) then {
			_doExit = true;
		} else {
			_attachedObjects = ropeAttachedObjects _vehicle;
			if( (attachedTo (_attachedObjects select 0)) != _cargo ) then {
				_doExit = true;
			};
		};
		
		sleep 0.01;
		
	};	
	
};

SA_Get_Hitch_Points = {
	params ["_vehicle"];
	private ["_centerOfMass","_bbr","_p1","_p2","_rearCorner","_rearCorner2","_frontCorner","_frontCorner2","_rearHitchPoint"];
	private ["_frontHitchPoint","_maxWidth","_widthOffset","_maxLength","_lengthOffset","_sideLeftPoint","_sideRightPoint"];
	_centerOfMass = getCenterOfMass _vehicle;
	_bbr = boundingBoxReal _vehicle;
	_p1 = _bbr select 0;
	_p2 = _bbr select 1;
	_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
	_widthOffset = ((_maxWidth / 2) - abs ( _centerOfMass select 0 )) * 0.75;
	_maxLength = abs ((_p2 select 1) - (_p1 select 1));
	_lengthOffset = ((_maxLength / 2) - abs (_centerOfMass select 1 )) * 0.75;
	_rearCorner = [(_centerOfMass select 0) + _widthOffset, (_centerOfMass select 1) - _lengthOffset, _centerOfMass select 2];
	_rearCorner2 = [(_centerOfMass select 0) - _widthOffset, (_centerOfMass select 1) - _lengthOffset, _centerOfMass select 2];
	_frontCorner = [(_centerOfMass select 0) + _widthOffset, (_centerOfMass select 1) + _lengthOffset, _centerOfMass select 2];
	_frontCorner2 = [(_centerOfMass select 0) - _widthOffset, (_centerOfMass select 1) + _lengthOffset, _centerOfMass select 2];
	_rearHitchPoint = ((_rearCorner vectorDiff _rearCorner2) vectorMultiply 0.5) vectorAdd  _rearCorner2;
	_frontHitchPoint = ((_frontCorner vectorDiff _frontCorner2) vectorMultiply 0.5) vectorAdd  _frontCorner2;
	_sideLeftPoint = ((_frontCorner vectorDiff _rearCorner) vectorMultiply 0.5) vectorAdd  _frontCorner;
	_sideRightPoint = ((_frontCorner2 vectorDiff _rearCorner2) vectorMultiply 0.5) vectorAdd  _frontCorner2;
	[_frontHitchPoint,_rearHitchPoint,_sideLeftPoint,_sideRightPoint];
};

SA_Attach_Tow_Ropes = {
	params ["_cargo","_player"];
	_vehicle = _player getVariable ["SA_Tow_Ropes_Vehicle", objNull];
	if(!isNull _vehicle) then {
		if(local _vehicle) then {
			private ["_towRopes","_vehicleHitch","_cargoHitch","_objDistance","_ropeLength"];
			_towRopes = _vehicle getVariable ["SA_Tow_Ropes",[]];
			if(count _towRopes == 1) then {
				/*_closestCargoHitch = [0,0,0];
				_closestDistance = -1;
				{
					_distanceToHitch = player distance (_cargo modelToWorld _x);
					if(_closestDistance < 0 || _distanceToHitch < _closestCargoHitch) then {
						_closestCargoHitch = _x;
						_closestDistance = _distanceToHitch;
					};
				} forEach ([_cargo] call SA_Get_Hitch_Points);
				_cargoHitch = _closestCargoHitch;
				*/
				_cargoHitch = ([_cargo] call SA_Get_Hitch_Points) select 0;
				_vehicleHitch = ([_vehicle] call SA_Get_Hitch_Points) select 1;
				_ropeLength = (ropeLength (_towRopes select 0));
				_objDistance = ((_vehicle modelToWorld _vehicleHitch) distance (_cargo modelToWorld _cargoHitch));
				if( _objDistance > _ropeLength ) then {
					"The tow ropes are too short. Move vehicle closer." remoteExec ["hint", _player]; 
				} else {		
					[_vehicle,_player] call SA_Drop_Tow_Ropes;
					_helper = "Land_Can_V2_F" createVehicle position _cargo;
					_helper attachTo [_cargo, _cargoHitch];
					hideObject _helper;
					_helper remoteExec ["hideObjectGlobal",2];
					[_helper, [0,0,0], [0,0,-1]] ropeAttachTo (_towRopes select 0);
					[_vehicle,_vehicleHitch,_cargo,_cargoHitch,_ropeLength] spawn SA_Simulate_Towing;
				};
			};
		} else {
			_this remoteExecCall ["SA_Attach_Tow_Ropes", _vehicle]; 
		};
	};
};

SA_Take_Tow_Ropes = {
	params ["_vehicle","_player"];
	if(local _vehicle) then {
		diag_log format ["Take Tow Ropes Called %1", _this];
		private ["_existingTowRopes","_hitchPoint","_rope"];
		_existingTowRopes = _vehicle getVariable ["SA_Tow_Ropes",[]];
		if(count _existingTowRopes == 0) then {
			_hitchPoint = [_vehicle] call SA_Get_Hitch_Points select 1;
			_rope = ropeCreate [_vehicle, _hitchPoint, 10];
			_vehicle setVariable ["SA_Tow_Ropes",[_rope],true];
			_this call SA_Pickup_Tow_Ropes;
		};
	} else {
		_this remoteExecCall ["SA_Take_Tow_Ropes", _vehicle]; 
	};
};

SA_Put_Away_Tow_Ropes = {
	params ["_vehicle","_player"];
	if(local _vehicle) then {
		private ["_existingTowRopes","_hitchPoint","_rope"];
		_existingTowRopes = _vehicle getVariable ["SA_Tow_Ropes",[]];
		if(count _existingTowRopes > 0) then {
			_this call SA_Pickup_Tow_Ropes;
			_this call SA_Drop_Tow_Ropes;
			{
				ropeDestroy _x;
			} forEach _existingTowRopes;
			_vehicle setVariable ["SA_Tow_Ropes",nil,true];
		};
	} else {
		_this remoteExecCall ["SA_Put_Away_Tow_Ropes", _vehicle]; 
	};
};

SA_Pickup_Tow_Ropes = {
	params ["_vehicle","_player"];
	if(local _vehicle) then {
		private ["_attachedObj","_helper"];
		{
			_attachedObj = _x;
			{
				_attachedObj ropeDetach _x;
			} forEach (_vehicle getVariable ["SA_Tow_Ropes",[]]);
		} forEach ropeAttachedObjects _vehicle;
		_helper = "Land_Can_V2_F" createVehicle position _player;
		{
			[_helper, [0, 0, 0], [0,0,-1]] ropeAttachTo _x;
			_helper attachTo [_player, [-0.1, 0.1, 0.15], "Pelvis"];
		} forEach (_vehicle getVariable ["SA_Tow_Ropes",[]]);
		hideObject _helper;
		_helper remoteExec ["hideObjectGlobal",2];
		_player setVariable ["SA_Tow_Ropes_Vehicle", _vehicle,true];
		_player setVariable ["SA_Tow_Ropes_Pick_Up_Helper", _helper,true];
	} else {
		_this remoteExecCall ["SA_Pickup_Tow_Ropes", _vehicle]; 
	};
};

SA_Drop_Tow_Ropes = {
	params ["_vehicle","_player"];
	if(local _vehicle) then {
		private ["_helper"];
		_helper = (_player getVariable ["SA_Tow_Ropes_Pick_Up_Helper", objNull]);
		if(!isNull _helper) then {
			{
				_helper ropeDetach _x;
			} forEach (_vehicle getVariable ["SA_Tow_Ropes",[]]);
			detach _helper;
			deleteVehicle _helper;
		};
		_player setVariable ["SA_Tow_Ropes_Vehicle", nil,true];
		_player setVariable ["SA_Tow_Ropes_Pick_Up_Helper", nil,true];
	} else {
		_this remoteExecCall ["SA_Drop_Tow_Ropes", _vehicle]; 
	};
};

SA_Attach_Tow_Ropes_Action = {
	private ["_vehicle","_towVehicle"];
	_vehicle = cursorTarget;
	_towVehicle = player getVariable ["SA_Tow_Ropes_Vehicle", objNull];
	if(!isNull _towVehicle && !isNull _vehicle) then {
		if([_towVehicle,_vehicle] call SA_Is_Supported_Cargo && vehicle player == player && player distance _vehicle < 10 && _towVehicle != _vehicle) then {
			[_vehicle,player] call SA_Attach_Tow_Ropes;
		} else {
			false;
		};
	} else {
		false;
	};
};

SA_Attach_Tow_Ropes_Action_Check = {
	private ["_vehicle","_towVehicle"];
	_vehicle = cursorTarget;
	_towVehicle = player getVariable ["SA_Tow_Ropes_Vehicle", objNull];
	if(!isNull _towVehicle && !isNull _vehicle) then {
		[_towVehicle,_vehicle] call SA_Is_Supported_Cargo && vehicle player == player && player distance _vehicle < 10 && _towVehicle != _vehicle;	
	} else {
		false;
	};
};

SA_Attach_Tow_Ropes_Action_Disabled_Check = {
	private ["_vehicle","_towVehicle"];
	_vehicle = cursorTarget;
	_towVehicle = player getVariable ["SA_Tow_Ropes_Vehicle", objNull];
	if(!isNull _towVehicle && !isNull _vehicle) then {
		not([_towVehicle,_vehicle] call SA_Is_Supported_Cargo) && vehicle player == player && player distance _vehicle < 10 && _towVehicle != _vehicle;	
	} else {
		false;
	};
};

SA_Take_Tow_Ropes_Action_Check = {
	private ["_vehicle"];
	_vehicle = cursorTarget;
	if([_vehicle] call SA_Is_Supported_Vehicle) then {
		_existingTowRopes = _vehicle getVariable ["SA_Tow_Ropes",[]];
		_towVehicle = player getVariable ["SA_Tow_Ropes_Vehicle", objNull];
		vehicle player == player && player distance _vehicle < 10 && (count _existingTowRopes) == 0 && isNull _towVehicle;
	} else {
		false;
	};
};

SA_Put_Away_Tow_Ropes_Action_Check = {
	private ["_vehicle"];
	_vehicle = cursorTarget;
	if([_vehicle] call SA_Is_Supported_Vehicle) then {
		_existingTowRopes = _vehicle getVariable ["SA_Tow_Ropes",[]];
		vehicle player == player && player distance _vehicle < 10 && (count _existingTowRopes) > 0;
	} else {
		false;
	};
};

SA_Drop_Tow_Ropes_Action_Check = {
	!isNull (player getVariable ["SA_Tow_Ropes_Vehicle", objNull]) && vehicle player == player;
};

SA_Pickup_Tow_Ropes_Action_Check = {
	isNull (player getVariable ["SA_Tow_Ropes_Vehicle", objNull]) && count (missionNamespace getVariable ["SA_Nearby_Tow_Vehicles",[]]) > 0 && vehicle player == player;
};

SA_Pickup_Tow_Ropes_Action = {
	private ["_nearbyTowVehicles"];
	_nearbyTowVehicles = missionNamespace getVariable ["SA_Nearby_Tow_Vehicles",[]];
	if(count _nearbyTowVehicles > 0) then {
		[_nearbyTowVehicles select 0, player] call SA_Pickup_Tow_Ropes;
	};
};

SA_Drop_Tow_Ropes_Action = {
	private ["_vehicle"];
	_vehicle = player getVariable ["SA_Tow_Ropes_Vehicle", objNull];
	if(!isNull _vehicle) then {
		[_vehicle, player] call SA_Drop_Tow_Ropes;
	};
};

SA_TOW_SUPPORTED_VEHICLES = [
	"Tank", "Car", "Ship"
];

SA_Is_Supported_Vehicle = {
	params ["_vehicle","_isSupported"];
	_isSupported = false;
	if(not isNull _vehicle) then {
		{
			if(_vehicle isKindOf _x) then {
				_isSupported = true;
			};
		} forEach SA_TOW_SUPPORTED_VEHICLES;
	};
	_isSupported;
};

SA_TOW_RULES = [
	["Tank","CAN_TOW","Tank"],
	["Tank","CAN_TOW","Car"],
	["Tank","CAN_TOW","Ship"],
	["Tank","CAN_TOW","Air"],
	["Tank","CAN_TOW","Cargo_base_F"],
	["Car","CAN_TOW","Car"],
	["Car","CAN_TOW","Ship"],
	["Car","CAN_TOW","Air"],
	["Car","CANT_TOW","Helicopter"],
	["Truck_F","CAN_TOW","Helicopter"],
	["Truck_F","CAN_TOW","Cargo_base_F"],
	["Ship","CAN_TOW","Ship"]
];

SA_TOW_RULES_OVERRIDE = [];

SA_Is_Supported_Cargo = {
	params ["_vehicle","_cargo"];
	private ["_canTow"];
	_canTow = false;
	if(not isNull _vehicle && not isNull _cargo) then {
		{
			if(_vehicle isKindOf (_x select 0)) then {
				if(_cargo isKindOf (_x select 2)) then {
					if( (toUpper (_x select 1)) == "CAN_TOW" ) then {
						_canTow = true;
					} else {
						_canTow = false;
					};
				};
			};
		} forEach (SA_TOW_RULES + SA_TOW_RULES_OVERRIDE);
	};
	_canTow;
};

SA_Take_Tow_Ropes_Action = {
	private ["_vehicle"];
	_vehicle = cursorTarget;
	if([_vehicle] call SA_Is_Supported_Vehicle) then {
		[_vehicle,player] call SA_Take_Tow_Ropes;
	};
};


SA_Put_Away_Tow_Ropes_Action = {
	private ["_vehicle"];
	_vehicle = cursorTarget;
	if([_vehicle] call SA_Is_Supported_Vehicle) then {
		[_vehicle,player] call SA_Put_Away_Tow_Ropes;
	};
};

if(hasInterface) then {

	player addAction ["Deploy Tow Ropes", { 
		[] call SA_Take_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call SA_Take_Tow_Ropes_Action_Check"];

	player addEventHandler ["Respawn", {
		player addAction ["Deploy Tow Ropes", { 
			[] call SA_Take_Tow_Ropes_Action;
		}, nil, 0, false, true, "", "call SA_Take_Tow_Ropes_Action_Check"];
	}];
	
	player addAction ["Put Away Tow Ropes", { 
		[] call SA_Put_Away_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call SA_Put_Away_Tow_Ropes_Action_Check"];

	player addEventHandler ["Respawn", {
		player addAction ["Put Away Tow Ropes", { 
			[] call SA_Put_Away_Tow_Ropes_Action;
		}, nil, 0, false, true, "", "call SA_Put_Away_Tow_Ropes_Action_Check"];
	}];

	player addAction ["Attach To Tow Ropes", { 
		[] call SA_Attach_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call SA_Attach_Tow_Ropes_Action_Check"];

	player addEventHandler ["Respawn", {
		player addAction ["Attach To Tow Ropes", { 
			[] call SA_Attach_Tow_Ropes_Action;
		}, nil, 0, false, true, "", "call SA_Attach_Tow_Ropes_Action_Check"];
	}];
	
	player addAction ["Cannot Attach Tow Ropes", { 
		hint "Your vehicle is not strong enough to tow this. Find a larger vehicle!"; 
	}, nil, 0, false, true, "", "call SA_Attach_Tow_Ropes_Action_Disabled_Check"];

	player addEventHandler ["Respawn", {
		player addAction ["Cannot Attach Tow Ropes", { 
			hint "Your vehicle is not strong enough to tow this. Find a larger vehicle!"; 
		}, nil, 0, false, true, "", "call SA_Attach_Tow_Ropes_Action_Disabled_Check"];
	}];

	player addAction ["Drop Tow Ropes", { 
		[] call SA_Drop_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call SA_Drop_Tow_Ropes_Action_Check"];

	player addEventHandler ["Respawn", {
		player addAction ["Drop Tow Ropes", { 
			[] call SA_Drop_Tow_Ropes_Action;
		}, nil, 0, false, true, "", "call SA_Drop_Tow_Ropes_Action_Check"];
	}];

	player addAction ["Pickup Tow Ropes", { 
		[] call SA_Pickup_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call SA_Pickup_Tow_Ropes_Action_Check"];

	player addEventHandler ["Respawn", {
		player addAction ["Pickup Tow Ropes", { 
			[] call SA_Pickup_Tow_Ropes_Action;
		}, nil, 0, false, true, "", "call SA_Pickup_Tow_Ropes_Action_Check"];
	}];
	
};

SA_Find_Nearby_Tow_Vehicles = {
	private ["_nearVehicles","_nearVehiclesWithTowRopes","_vehicle","_ends","_end1","_end2"];
	_nearVehicles = [];
	{
		_nearVehicles append  (position player nearObjects [_x, 30]);
	} forEach SA_TOW_SUPPORTED_VEHICLES;
	_nearVehiclesWithTowRopes = [];
	{
		_vehicle = _x;
		{
			_ends = ropeEndPosition _x;
			if(count _ends == 2) then {
				_end1 = _ends select 0;
				_end2 = _ends select 1;
				if(((position player) distance _end1) < 5 || ((position player) distance _end2) < 5 ) then {
					_nearVehiclesWithTowRopes pushBack _vehicle;
				}
			};
		} forEach (_vehicle getVariable ["SA_Tow_Ropes",[]]);
	} forEach _nearVehicles;
	_nearVehiclesWithTowRopes;
};


if(!isDedicated) then {
	[] spawn {
		while {true} do {
			missionNamespace setVariable ["SA_Nearby_Tow_Vehicles", (call SA_Find_Nearby_Tow_Vehicles)];
			sleep 2;
		};
	};
};

diag_log "Advanced Towing Loaded";

} remoteExecCall ["bis_fnc_call", 0,true]; 
