_distredeploy = 20;
_nearfob = [] call F_getNearestFob;
_fobdistance = 9999;
if ( count _nearfob == 3 ) then {
	_fobdistance = player distance _nearfob;
};

disableSerialization;

_dialog = createDialog "LT_MainMenu";

waitUntil { dialog };

_control = ((findDisplay 2400) displayCtrl 2403);
if ( _fobdistance < _distredeploy || (player distance lhd) < 200  || (player distance nimitz) < 200 ) then { 
	_control ctrlEnable true;
	_control ctrlSetTooltip ("");
} else {
	_control ctrlEnable false;
	_control ctrlSetTooltip ("Only available at the FOB");
};