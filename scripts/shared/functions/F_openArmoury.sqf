_nearbarracks = ( (getPosATL player) nearobjects [ Barracks_typename , 3 ] );

disableSerialization;

_dialog = createDialog "LT_MainMenu";

waitUntil { dialog };

_control = ((findDisplay 2400) displayCtrl 2403);
if ( count _nearbarracks != 0 || (player distance startbase) < 200 ) then { 
	_control ctrlEnable true;
	_control ctrlSetTooltip ("");
} else {
	_control ctrlEnable false;
	_control ctrlSetTooltip ("Only available at Barracks");
};