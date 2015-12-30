/* --------------------------------------------------------------------------------
[TAA] Realistic_Repair
BY [TAA]Jérôme 
Thanks to Black Puma and  Jimi Vacarians  for the tips !!
http://www.taa-arma.fr/
-----------------------------------------------------------------------------------
Version 1.1 */

waitUntil { !isNil "client_is_loaded" };
waitUntil { client_is_loaded };

Class_allowed = [ "engineer" ];
Player_class = player getVariable ["St_class", "assault"];

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
	if (TAAFuelSystem) then
	{
		[] spawn TAA_Fuel_Containers_Action;
	};
	
	[] spawn TAA_Repairman_Actions;
	sleep 2;
	
	while { true } do {
		waitUntil { alive player && Player_class != player getVariable ["St_class", "assault"] };
		Player_class = player getVariable ["St_class", "assault"];
	};
};
