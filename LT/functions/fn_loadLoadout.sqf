private["_control","_targetUserData", "_index", "_targetUser", "_length", "_selectData","_forceReplace"];
disableSerialization;

_center = (missionnamespace getvariable ["XLA_fnc_arsenal_center",player]);
/*_forceReplace = [];
_forceReplace resize 1998;
for [{_i=0}, {_i<999}, {_i=_i+1}] do
{
	_forceReplace set [_i,["tf_anprc152_" + (str (_i+1)), "tf_anprc152"]]; 
	_forceReplace set [_i+999,["tf_rf7800str_" + (str (_i+1)), "tf_rf7800str"]];            
};
[_center, [profileNamespace, _loadoutName], [], _forceReplace] call XLA_fnc_loadInventory;
*/

_control = ((findDisplay 2580) displayCtrl 2801);
if(lbCurSel _control == -1) exitWith {};
_loadoutNumber = _control lbData (lbCurSel _control);

_loadoutName = profileNamespace getVariable "bis_fnc_saveInventory_data" select ((parseNumber _loadoutNumber));

[_center, [profileNamespace, _loadoutName]] call XLA_fnc_loadInventory;

hint format ["%1 loaded", _loadoutName];

closeDialog 0;