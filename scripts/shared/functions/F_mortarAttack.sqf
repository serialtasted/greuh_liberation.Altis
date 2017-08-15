/*////////////////////////////////////

Script by J.Shock

Open to editing and public use!!!

I do ask that this header remain with
the script.

*////////////////////////////////////


/*
To use the Simple Mortar Script (SMS):

1. Put down a marker and name it.

2. Alter the following call line to suit your needs, default values defined below:
	
null = ["markerName", 200, true, 2, 15, 30, 300] execVM "SHK_SMS.sqf";
			
			1 - Your marker's position (default is empty string, "")
			2 - Radius around marker for bombardment (default is 100m)
			3 - Use smoke rounds instead of HE (default false)
			4 - Number of bombardments (default 1)
			5 - Number of rounds (default 10)
			6 - Time before bombardment starts after script call (default 5 seconds)
			7 - If more than 1 bombardment, as defined by argument #4
				time between each bombardment (default 300 seconds, 5 minutes)

3. Enjoy the Show!
*/

_targetPos = [_this, 0, [0,0,0]] call BIS_fnc_param;
_radius = [_this, 1, 100] call BIS_fnc_param;
_useSmk = [_this, 2, false] call BIS_fnc_param;
_iter = [_this, 3, 1] call BIS_fnc_param;
_numRounds = [_this, 4, 10] call BIS_fnc_param;
_startTime = [_this, 5, 5] call BIS_fnc_param;
_timeBetween = [_this, 6, 300] call BIS_fnc_param;


if (isServer) then {

	if (_startTime > 0) then {
		sleep _startTime;
	};
	
	if !(_useSmk) then {
		for "_a" from 1 to 2 step 1 do
		{
			_pos = _targetPos getPos [random(_radius/2), random 360];
			
			if ( daytime > 5 && daytime < 20 ) then {
				_round = "SmokeShellRed" createVehicle [_pos select 0, _pos select 1, random[150,175,200]];
				_round setVelocity [random[15,20,25], random[15,20,25], random[10,15,20]];
			} else {
				_round = "F_40mm_Red" createVehicle [_pos select 0, _pos select 1, random[150,175,200]];
				_round setVelocity [random[15,20,25], random[15,20,25], random[10,15,20]];
			};
			
			sleep (random [1,3,5]);
		};
	};
	
	if (_startTime > 0) then {
		sleep (_startTime * 2);
	};
	
	for "_i" from 0 to _iter step 1 do {
	
		if (_useSmk) then {
			for "_s" from 0 to (_numRounds) step 1 do
			{
				_pos = _targetPos getPos [random(_radius), random 360];
				_round = "SmokeShell" createVehicle [_pos select 0, _pos select 1, random[150,175,200]];
				_round setVelocity [random[15,20,25], random[15,20,25], random[10,15,20]];
				
				sleep (random [1,3,5]);
			};
			
		} else {
		
			for "_m" from 0 to (_numRounds) step 1 do
			{
				_pos = _targetPos getPos [random(_radius), random 360];
				
				_center = createCenter sideLogic;    
				_group = createGroup _center;   
				_round = _group createUnit ["ModuleOrdnance_F",_pos , [], 0, ""];
				_rdm = round(random 2);
				if ( _rdm == 0 ) then {
					_round setvariable ["type", "ModuleOrdnanceHowitzer_F_Ammo", true];
				} else {
					_round setvariable ["type", "ModuleOrdnanceMortar_F_Ammo", true];
				};
				
				sleep (random [1,3,5]);
			};
		};
		
		if (_iter > 1) then {	
			sleep _timeBetween;
		};
		
	};

};