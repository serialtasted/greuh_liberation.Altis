private [ "_launcherVehicles" ];

_launcherVehicles = [];

{
	if ( typeOf _x in fireworks_base ) then {
		_launcherVehicles pushBack _x;
	};
} forEach vehicles;

if ( (count _launcherVehicles) == 0 ) exitWith { hint "No available vehicles for the fireworks show to start!"; };

[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','red'] remoteExec ["callFireworks"];

sleep 5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];

sleep 1;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];

sleep 1;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];

sleep 1;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];

sleep 1;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'rain','random'] remoteExec ["callFireworks"];

sleep 1;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 1;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'rain','random'] remoteExec ["callFireworks"];

sleep 1;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 1;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'rain','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];

sleep 5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 0.5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 3;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 1;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 1;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'rain','random'] remoteExec ["callFireworks"];
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'] remoteExec ["callFireworks"];

sleep 5;
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];

sleep 1:
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];

sleep 1:
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];

sleep 1:
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];

sleep 1:
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];

sleep 1:
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];

sleep 1:
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];

sleep 1:
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];

sleep 1:
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];

sleep 1:
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];

sleep 1:
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'] remoteExec ["callFireworks"];

sleep 7:
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','red'] remoteExec ["callFireworks"];
[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','green'] remoteExec ["callFireworks"];