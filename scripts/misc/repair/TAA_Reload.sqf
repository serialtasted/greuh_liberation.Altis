/* --------------------------------------------------------------------------------
[TAA] Realistic_Repair
BY [TAA]Jérôme 
Thanks to Black Puma and  Jimi Vacarians  for the tips !
http://www.taa-arma.fr/
-----------------------------------------------------------------------------------
RELOAD THE SCRIPT WHEN REPAIRMAN CANCEL REPAIRATION
*/
call compile preprocessFile "scripts\misc\repair\TAA_realistic_repair.sqf";

if (isDedicated) exitWith {};

[] spawn
{	
	waitUntil { alive player };
							
	if (Player_class in Class_allowed) then  
	{
		call TAA_Repairman_Actions;	
	};
};