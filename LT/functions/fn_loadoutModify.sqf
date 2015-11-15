disableSerialization;

_control = ((findDisplay 2510) displayCtrl 2513);
if(lbCurSel _control == -1) exitWith {};
_modifyButton = _control lbData (lbCurSel _control);

_control = ((findDisplay 2510) displayCtrl 2511);
if(lbCurSel _control == -1) exitWith {};
_loadoutPosition = _control lbData (lbCurSel _control);

_loadoutPosition = parseNumber _loadoutPosition;

_dataLoadout = profileNamespace getVariable "bis_fnc_saveInventory_data";

_numberLoadouts = ((count _dataLoadout) / 2) - 1;
_loadoutNumber = (_loadoutPosition / 2);




switch (_modifyButton) do
{
	case "up":
	{
		if (_loadoutPosition != 0) then
		{

			_newData = [];


			for "_i" from 0 to _numberLoadouts do
			{
				_selectNum = _i * 2;

				if (_i != _loadoutNumber) then
				{

					if (_i == _loadoutNumber - 1) then
					{
						_newData = _newData + [_dataLoadout select _loadoutPosition];
						_newData = _newData + [_dataLoadout select (_loadoutPosition + 1)];

						_newData = _newData + [_dataLoadout select _selectNum];
						_newData = _newData + [_dataLoadout select (_selectNum + 1)];

					}
					else
					{
						_newData = _newData + [_dataLoadout select _selectNum];
						_newData = _newData + [_dataLoadout select (_selectNum + 1)];
					};
				};


			};

			profileNamespace setVariable ["bis_fnc_saveInventory_data", _newData];
			[(_loadoutNumber - 1)] call LT_FNC_modifyLoad;
		};
	};

	case "down":
	{
		if (_loadoutPosition != (_numberLoadouts * 2)) then
		{
			_newData = [];


			for "_i" from 0 to _numberLoadouts do
			{
				_selectNum = _i * 2;

				if (_i != _loadoutNumber) then
				{

					if (_i == _loadoutNumber + 1) then
					{
						_newData = _newData + [_dataLoadout select _selectNum];
						_newData = _newData + [_dataLoadout select (_selectNum + 1)];

						_newData = _newData + [_dataLoadout select _loadoutPosition];
						_newData = _newData + [_dataLoadout select (_loadoutPosition + 1)];

					}
					else
					{
						_newData = _newData + [_dataLoadout select _selectNum];
						_newData = _newData + [_dataLoadout select (_selectNum + 1)];
					};
				};


			};

			profileNamespace setVariable ["bis_fnc_saveInventory_data", _newData];
			[(_loadoutNumber + 1)] call LT_FNC_modifyLoad;
		};
	};

	case "top":
	{
		_newData = [];

		_newData = _newData + [_dataLoadout select _loadoutPosition];
		_newData = _newData + [_dataLoadout select (_loadoutPosition + 1)];

		for "_i" from 0 to _numberLoadouts do
		{
			_selectNum = _i * 2;

			if (_i != _loadoutNumber) then
			{
				_newData = _newData + [_dataLoadout select _selectNum];
				_newData = _newData + [_dataLoadout select (_selectNum + 1)];
			};
		};

		profileNamespace setVariable ["bis_fnc_saveInventory_data", _newData];
		[0] call LT_FNC_modifyLoad;

	};

	case "bottom":
	{
		_newData = [];

		for "_i" from 0 to _numberLoadouts do
		{
			_selectNum = _i * 2;

			if (_i != _loadoutNumber) then
			{
				_newData = _newData + [_dataLoadout select _selectNum];
				_newData = _newData + [_dataLoadout select (_selectNum + 1)];
			};
		};

		_newData = _newData + [_dataLoadout select _loadoutPosition];
		_newData = _newData + [_dataLoadout select (_loadoutPosition + 1)];

		profileNamespace setVariable ["bis_fnc_saveInventory_data", _newData];
		[_numberLoadouts] call LT_FNC_modifyLoad;
	};

	case "edit":
	{
		closeDialog 0;
		_loadoutName = profileNamespace getVariable "bis_fnc_saveInventory_data" select _loadoutPosition;
		
		_forceReplace = [];
		_forceReplace resize 1998;
		for [{_i=0}, {_i<999}, {_i=_i+1}] do
		{
			_forceReplace set [_i,["tf_anprc152_" + (str (_i+1)), "tf_anprc152"]]; 
			_forceReplace set [_i+999,["tf_rf7800str_" + (str (_i+1)), "tf_rf7800str"]];            
		};
		
		[player, [profileNamespace, _loadoutName], [], _forceReplace] call XLA_fnc_loadInventory;
		["Open",[nil,nil,nil,true,_forceReplace]] call XLA_fnc_arsenal;
	};

	case "delete":
	{

		_loadoutName = profileNamespace getVariable "bis_fnc_saveInventory_data" select _loadoutPosition;

		if(!createDialog "LT_prompt") exitWith {hint "LT_prompt ERROR";};

		waitUntil {!isNull (findDisplay 2550)};

		((findDisplay 2550) displayCtrl 2551) ctrlSetStructuredText parseText format["<t align='center'><t size='0.8px'>Are you sure you want to delete the loadout:</t></t><br/><t align='center'><t size='0.7px'>%1</t></t>", _loadoutName];

		((findDisplay 2550) displayCtrl 2552) ctrlSetText "Yes";

		((findDisplay 2550) displayCtrl 2553) ctrlSetText "No";

		waitUntil {!isNil "lt_prompt_choice"};
		if(lt_prompt_choice) then
		{
			_newData = [];

			for "_i" from 0 to _numberLoadouts do
			{
				_selectNum = _i * 2;

				if (_i != _loadoutNumber) then
				{
					_newData = _newData + [_dataLoadout select _selectNum];
					_newData = _newData + [_dataLoadout select (_selectNum + 1)];
				};
			};

			profileNamespace setVariable ["bis_fnc_saveInventory_data", _newData];
			[0] call LT_FNC_modifyLoad;

		};

		lt_prompt_choice = nil;
		_control = ((findDisplay 2510) displayCtrl 2513);
		_control lbSetCurSel -1;

	};

	default
	{
		/* STATEMENT */
	};
};