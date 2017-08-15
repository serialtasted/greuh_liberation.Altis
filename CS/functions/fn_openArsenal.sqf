private["_forceReplace"];
disableSerialization;

/*_forceReplace = [];
_forceReplace resize 1998;
for [{_i=0}, {_i<999}, {_i=_i+1}] do
{
	_forceReplace set [_i,["tf_anprc152_" + (str (_i+1)), "tf_anprc152"]]; 
	_forceReplace set [_i+999,["tf_rf7800str_" + (str (_i+1)), "tf_rf7800str"]];            
};

["Open",[nil,nil,nil,true,_forceReplace]] call XLA_fnc_arsenal;
*/

["Open",[nil,player]] call bis_fnc_arsenal;