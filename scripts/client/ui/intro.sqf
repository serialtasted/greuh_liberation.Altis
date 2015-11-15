private [ "_dialog", "_clientsave" ];

if ( isNil "cinematic_camera_started" ) then { cinematic_camera_started = false };
sleep 0.5;
waitUntil { time > 0 };

[] spawn cinematic_camera;

if ( GRLIB_introduction ) then {

	sleep 1;
	cutRsc ["intro1","PLAIN",1,true];
	sleep 5.5;
	cutRsc ["intro2","PLAIN",1,true];
	sleep 10;

};

showcaminfo = true;
dostartgame = 0;
howtoplay = 0;
_dialog = createDialog "liberation_menu";
waitUntil { dialog };
waitUntil { dostartgame == 1 || howtoplay == 1 || !dialog };

closeDialog 0;

classtogo = "";
_clientsave = profileNamespace getVariable GRLIB_client_key;
if ( isNil "_clientsave" ) then {
	[false] spawn St_fnc_openClassSelector;
};

waitUntil { classtogo != "" || !isNil "_clientsave" };

if ( howtoplay == 0 ) then {
	cinematic_camera_started = false;
};
introDone = true;
