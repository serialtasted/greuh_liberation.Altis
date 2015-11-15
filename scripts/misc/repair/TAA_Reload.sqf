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
	waitUntil {player == player};
	
					//Explosive Spécialist
	//_Class_allowed = ["B_soldier_exp_F"]; // set the class that can repair vehicle , don't put class that can already repair with the repairs default option. Check https://community.bistudio.com/wiki/Arma_3_Assets
							
	if (typeOf player in  Class_allowed) then  
	{
		call TAA_Repairman_Actions;	
	};
	
	/*player addEventHandler 
	[
		"Respawn", 
		{ 
			[] execVM "scripts\misc\repair\TAA_init.sqf";
		}
	];*/
};