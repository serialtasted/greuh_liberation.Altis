/* --------------------------------------------------------------------------------
[TAA] Realistic_Repair
BY [TAA]Jérôme 
Thanks to Black Puma and  Jimi Vacarians  for the tips !!
http://www.taa-arma.fr/
-----------------------------------------------------------------------------------
*/

#define TAA_Vehicle_Fuel "Vehicle Has Been Refueled"
#define TAA_Refill_Canister "Canister Has Been Refilled"

TAA_text2 = 
{
	 [ format["<t size='0.75' color='#00FF00'>%1</t>",_this], 0,1,5,0,0,301] spawn bis_fnc_dynamicText;
};

TAA_Fuel_Containers_Action =
{
	add6Exist = true;
	add8Exist = true;
	add9Exist = true;
	
	add6 = player addAction ["Check Canister's Gasoline", "scripts\misc\repair\TAA_repair_handle_action.sqf", ["action_check_amount_Canister"], 10, true, true, "", "true"]; 
	add8 = player addAction ["Refuel vehicle", "scripts\misc\repair\TAA_repair_handle_action.sqf", ["action_refuel"], 10, true, true, "", "call TAA_level_Tanker_check"];
	add9 = player addAction ["Refill Canister", "scripts\misc\repair\TAA_repair_handle_action.sqf", ["action_refill"], 10, true, true, "", "call TAA_Refill_Check"];
	
	while { true} do 
	{
		private ["_Objects","_detection","_detection2"];
		//_Objects = ["Land_CanisterFuel_F"];
		detection5 = nearestObjects [player, ["Land_CanisterFuel_F"], 1];//Canister detection
		_detection7 = nearestObjects [player, ["Car","Truck","Tank"], 5];
		_detection8 = nearestObjects [player, ["B_Truck_01_fuel_F","Land_MetalBarrel_F","FlexibleTank_01_forest_F"], 5];
		_detectionair = nearestObjects [player, ["Air"], 8];
		 
		if (count detection5 > 0 ) then
		{
			if(!add6Exist) then {
				add6 = player addAction ["Check Canister's Gasoline", "scripts\misc\repair\TAA_repair_handle_action.sqf", ["action_check_amount_Canister"], 10, true, true, "", "true"];
				add6Exist = true;
			};
		}
        else
        {
			if(add6Exist) then {
            	player removeAction add6;
            	add6Exist = false;
				CanisterChecked = false;
			};
		};
		
		if ((count detection5 > 0 && count _detection7 > 0) || (count detection5 > 0 && count _detectionair > 0)) then
		{
			if(!add8Exist) then {
				add8 = player addAction ["Refuel vehicle", "scripts\misc\repair\TAA_repair_handle_action.sqf", ["action_refuel"], 10, true, true, "", "call TAA_level_Tanker_check"];
				add8Exist = true;					//orange
			};
		}
		else
		{
			if(add8Exist) then {
				player removeAction add8;
				add8Exist = false;
			};
		};
		if (count detection5 > 0 && count _detection8 > 0) then
		{
			if(!add9Exist) then {
				add9 = player addAction ["Refill Canister", "scripts\misc\repair\TAA_repair_handle_action.sqf", ["action_refill"], 10, true, true, "", "call TAA_Refill_Check"];
				add9Exist = true;					//orange
			};
		}
		else
		{
			if(add9Exist) then {
				player removeAction add9;
				add9Exist = false;
			};
		};
	sleep 0.5;
	};
};

TAA_Canister_Statute =
{
	_Fuel_level_canister = detection5 select 0;
	cannisterID = _Fuel_level_canister;
	_Fuel_level_canister= _Fuel_level_canister getVariable "NewCanister";
	NewCanister = _Fuel_level_canister;
	_fuel = parseText Format["<t color='#FFFF00'>Canister's quantity of gasoline :</t><br /><t color='#00FF00'>%1</t><t color='#00FF00'>/10", _Fuel_level_canister];
	_fuelf = composeText [_fuel]; 
	[_fuelf , "[TAA] Fuel System ", true, false] call BIS_fnc_GUImessage;
	if ( _Fuel_level_canister == 0 ) then
	{
		CanisterEmpty = true;
	}
	else
	{	
		CanisterEmpty = false;
	};
	if(  _Fuel_level_canister < 10 ) then
	{
		CanisterFull = false;
	}
	else
	{
		CanisterFull = true;
	};
	CanisterChecked = true;
};

 TAA_Refuel =
 {
	private ["_veh"];
	_veh = _this select 0;
	if ( (OIL_STAT + NewCanister) > 100 ) then
	{
		overage = (OIL_STAT + NewCanister) - 100;
		_veh setFuel ( ((OIL_STAT + NewCanister) - overage) / 100 );
		cannisterID setvariable ["NewCanister",overage,true];
	}
	else
	{
		_veh setFuel ( (OIL_STAT + NewCanister) / 100 );
		NewCanister = NewCanister - 10;
		cannisterID setvariable ["NewCanister",0,true];
	};
	TAA_Vehicle_Fuel call TAA_text2;
	CanisterChecked = false;
	vehiclehasbeencheckforrefuel = false;
};
 
 TAA_level_Tanker_check = 
 {
	private ["_target"];
	_target = cursorTarget;
	_return = false;
	if ( !TankFULL && !CanisterEmpty && CanisterChecked && vehiclehasbeencheckforrefuel ) then
	{
		_return = true;
	}
	else
	{
		_return = false;
	};
	_return
 };
 
 TAA_Refill_Check =
 {
	private ["_target"];
	_target = cursorTarget;
	_return = false;
	if ( !CanisterFull && CanisterChecked ) then
	{
		_return = true;
	}
	else
	{
		_return = false;
	};
	_return
 };
 
 TAA_Refill =
 {
	cannisterID setvariable ["NewCanister",10,true];
	CanisterChecked = false;
	TAA_Refill_Canister call TAA_text2;
 };