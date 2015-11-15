/* --------------------------------------------------------------------------------
[TAA] Realistic_Repair
BY [TAA]Jérôme 
Thanks to Black Puma and  Jimi Vacarians  for the tips !
http://www.taa-arma.fr/
-----------------------------------------------------------------------------------
*/

private ["_params", "_action"];

// Parameters passed by the action
_params = _this select 3;
_action = _params select 0;

if (_action == "action_check") then
{
	[cursorTarget] spawn TAA_vehicle_informations;
};

if (_action == "action_repair") then
{
	[cursorTarget] spawn TAA_vehicle_repairing;
};

if (_action == "action_stop") then
{
	[cursorTarget] spawn TAA_standby_repairing;
};

if (_action == "action_resume") then
{
	[cursorTarget] spawn TAA_resume_reparation;
};

if (_action == "action_cancel") then
{
	[cursorTarget] spawn TAA_cancel;
};

if (_action == "action_check_amount_Canister") then
{
	[cursorTarget] spawn TAA_Canister_Statute;
};

if (_action == "action_refuel") then
{
	[cursorTarget] spawn TAA_Refuel;
};

if (_action == "action_refill") then
{
	[cursorTarget] spawn TAA_Refill;
};

if (_action == "action_check_air") then
{
	[cursorTarget] spawn TAA_air_informations;
};

if (_action == "action_repair_air") then
{
	[cursorTarget] spawn TAA_Air_Repairing;
};