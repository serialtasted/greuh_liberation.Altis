private [ "_launcherVehicles" ];

_launcherVehicles = [];

{
	if ( typeOf _x in fireworks_base ) then {
		_launcherVehicles pushBack _x;
	};
} forEach vehicles;

if ( (count _launcherVehicles) == 0 ) exitWith { hint "No available vehicles for the fireworks show to start!"; };

[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','red'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'rain','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'rain','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'rain','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 0.5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 3;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'rain','random'],"callFireworks",true,true] spawn BIS_fnc_MP;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 5;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1:
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1:
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1:
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1:
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1:
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1:
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1:
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1:
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1:
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 1:
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'random','random'],"callFireworks",true,true] spawn BIS_fnc_MP;

sleep 7:
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','red'],"callFireworks",true,true] spawn BIS_fnc_MP;
[[getPos (_launcherVehicles call BIS_fnc_selectRandom), 'normal','green'],"callFireworks",true,true] spawn BIS_fnc_MP;