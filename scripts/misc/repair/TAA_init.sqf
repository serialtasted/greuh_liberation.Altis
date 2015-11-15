/* --------------------------------------------------------------------------------
[TAA] Realistic_Repair
BY [TAA]Jérôme 
Thanks to Black Puma and  Jimi Vacarians  for the tips !!
http://www.taa-arma.fr/
-----------------------------------------------------------------------------------
Version 1.1 */
// Set true to activate the Fuel system , false do the opposite. 
TAAFuelSystem = true;

//Set true to show Percentage of damage , set false if you want to see the State instead of the Percentage of damage.
TAAShowPercentOfDamage = false;

call compile preprocessFile "scripts\misc\repair\TAA_realistic_repair.sqf";
call compile preprocessFile "scripts\misc\repair\TAA_realistic_repair_air.sqf";
call compile preprocessFile "scripts\misc\repair\TAA_Fuel_system.sqf";

if (isDedicated) exitWith {};

[] spawn
{	
	waitUntil {player == player};
	
	Class_allowed = ["rhsusf_army_ucp_engineer"]; // set the class that can repair vehicle , don't put class that can already repair with the repairs default option. Check https://community.bistudio.com/wiki/Arma_3_Assets 
						
	if (typeOf player in  Class_allowed ) then 
	{
		[] spawn TAA_Repairman_Actions;
		sleep 2;
	};
	
	if (TAAFuelSystem) then
	{
		[] spawn TAA_Fuel_Containers_Action;
	};
	
	player addEventHandler 
	[
		"Respawn", 
		{ 
			[] execVM "scripts\misc\repair\TAA_init.sqf";
		}
	];
	
};
