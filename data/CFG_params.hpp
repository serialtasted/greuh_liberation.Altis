class spacer1 {
	title = "---------------------- Mission Parameters ----------------------";
	
	values[] = {1};
	texts[] = {""};
	default = 1;
};
class Unitcap{
	title = $STR_PARAMS_UNITCAP;
	values[] = {50,75,100,125,150,200};
	texts[] = {$STR_PARAMS_UNITCAP1,$STR_PARAMS_UNITCAP2,$STR_PARAMS_UNITCAP3,$STR_PARAMS_UNITCAP4,$STR_PARAMS_UNITCAP5,$STR_PARAMS_UNITCAP6};
	default = 75;
};
class Difficulty {
	title = $STR_PARAMS_DIFFICULTY;
	values[] = { 50, 75, 100, 125, 150, 250, 400, 1000 };
	texts[] = { $STR_PARAMS_DIFFICULTY1, $STR_PARAMS_DIFFICULTY2, $STR_PARAMS_DIFFICULTY3, $STR_PARAMS_DIFFICULTY4, $STR_PARAMS_DIFFICULTY5, $STR_PARAMS_DIFFICULTY6, $STR_PARAMS_DIFFICULTY7, $STR_PARAMS_DIFFICULTY8 };
	default = 250;
};
class Aggressivity{
	title = $STR_AGGRESSIVITY_PARAM;
	values[] = {25,50,100,250,400};
	texts[] = {$STR_AGGRESSIVITY_PARAM0, $STR_AGGRESSIVITY_PARAM1,$STR_AGGRESSIVITY_PARAM2,$STR_AGGRESSIVITY_PARAM3,$STR_AGGRESSIVITY_PARAM4};
	default = 100;
};
class AdaptToPlayercount{
	title = $STR_PARAM_ADAPT_TO_PLAYERCOUNT;
	values[] = {1,0};
	texts[] = {$STR_PARAMS_ENABLED,$STR_PARAMS_DISABLED};
	default = 1;
};
class DayDuration {
	title = $STR_PARAMS_DAYDURATION;
	values[] = { 48, 24, 16, 12, 9.6, 8, 6.8, 6, 4.8, 4, 3, 2.4, 2, 1.6, 1, 0.66, 0.5, 0.375, 0.25, 0.1875, 0.125, 0.11 };
	texts[] = { "0.5", "1", "1.5", "2", "2.5", "3","3.5","4","5","6","8","10","12","15","24","36","48","64","96","128","192","240" };
	default = 4;
};
class ShorterNights {
	title = $STR_SHORTER_NIGHTS_PARAM;
	values[] = {1,0};
	texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
	default = 0;
};
class Weather {
	title = $STR_WEATHER_PARAM;
	values[] = { 1,2,3 };
	texts[] = { $STR_WEATHER_PARAM1, $STR_WEATHER_PARAM2, $STR_WEATHER_PARAM3 };
	default = 3;
};
class ResourcesMultiplier {
	title = $STR_PARAMS_RESOURCESMULTIPLIER;
	values[] = { 25, 50, 75, 100, 125, 150, 200, 300, 500, 1000, 2000, 5000 };
	texts[] = { "x0.25", "x0.5", "x0.75", "x1", "x1.25","x1.5","x2","x3","x5","x10","x20","x50" };
	default = 100;
};
class Fatigue {
	title = $STR_PARAMS_FATIGUE;
	values[] = { 0, 1 };
	texts[] = { $STR_PARAMS_DISABLED, $STR_PARAMS_ENABLED };
	default = 0;
};
class AmmoBounties{
	title = $STR_AMMO_BOUNTIES;
	values[] = {1,0};
	texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
	default = 1;
};
class Civilians{
	title = $STR_PARAMS_CIVILIANS;
	values[] = {0,50,150,500};
	texts[] = {$STR_PARAMS_CIVILIANS1,$STR_PARAMS_CIVILIANS2,$STR_PARAMS_CIVILIANS3,$STR_PARAMS_CIVILIANS4};
	default = 50;
};
class CivPenalties{
 	title = $STR_CIV_PENALTIES;
 	values[] = { 0, 25, 50, 75, 100, 125, 150, 200, 300 };
 	texts[] = { $STR_PARAMS_DISABLED, "x0.25", "x0.5", "x0.75", "x1", "x1.25","x1.5","x2","x3" };
 	default = 150;
};
class TeamkillPenalty{
	title = $STR_PARAM_TEAMKILL_PENALTY;
	values[] = {1,0};
	texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
	default = 1;
};
class PassiveIncome{
	title = $STR_PARAM_PASSIVE_INCOME;
	values[] = {1,0};
	texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
	default = 1;
};
class DisableRemoteSensors{
	title = "Disable Remote Sensors (experimental!)";
	values[] = {0,1,2};
	texts[] = {"No","Disable for clients without local AIs","Disable for all clients"};
	default = 1;
};
class BluforDefenders{
	title = $STR_PARAM_BLUFOR_DEFENDERS;
	values[] = {1,0};
	texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
	default = 1;
};
class Autodanger{
	title = $STR_PARAM_AUTODANGER;
	values[] = {1,0};
	texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
	default = 1;
};
class spacer4 {
	title = "---------------------- Deploy Parameters ----------------------";
	values[] = {1};
	texts[] = {""};
	default = 1;
};
class AllowRedeploy{
	title = "Allow redeploy (Always possible when less than 2 players online)";
	values[] = {2,1,0};
	texts[] = { $STR_YES, $STR_NO, $STR_ALWAYS_NO };
	default = 1;
};
class AllowFOBDeploy{
	title = "Allow deploy at FOB (Always possible when less than 5 players online)";
	values[] = {2,1,0};
	texts[] = { $STR_YES, $STR_NO, $STR_ALWAYS_NO };
	default = 1;
};
class AllowMobileDeploy{
	title = "Allow deploy at Mobile FOB (Always possible when less than 3 players online)";
	values[] = {2,1,0};
	texts[] = { $STR_YES, $STR_NO, $STR_ALWAYS_NO };
	default = 0;
};
class HaloJump{
	title = $STR_HALO_PARAM;
	values[] = {1,5,10,15,20,30,0};
	texts[] = { $STR_HALO_PARAM1, $STR_HALO_PARAM2, $STR_HALO_PARAM3, $STR_HALO_PARAM4, $STR_HALO_PARAM5, $STR_HALO_PARAM6, $STR_PARAMS_DISABLED };
	default = 15;
};
class spacer2 {
   title = "---------------------- ACE 3 Parameters ----------------------";
   values[] = {1};
   texts[] = {""};
   default = 1;
};
class spacer3 {
   title = "* requires Advanced Medical Level";
   values[] = {1};
   texts[] = {""};
   default = 1;
};
class ace_medical_level {
   title = "Medical Level";
   values[] = {1,2};
   texts[] = {"Basic","Advanced"};
   default = 1;
};
class ace_medical_enableAdvancedWounds {
   title = "Advanced Wounds *";
   values[] = {0,1};
   texts[] = {"Off","On"};
   default = 0;
};
class ace_medical_playerDamageThreshold {
   title = "Player Damage Threshold";
   values[] = {8,12,16};
   texts[] = {"Low","Medium","High"};
   default = 12;
};
class ace_medical_maxReviveTime {
   title = "Max Revive Time (minutes)";
   values[] = {600,3000,6000,9000};
   texts[] = {"1","5","10","15"};
   default = 9000;
};
class ace_medical_medicSetting_PAK {
   title = "Personal Aid Kit Usage *";
   values[] = {0,1,2};
   texts[] = {"Anyone","Medic Only","Doctor Only"};
   default = 2;
};
class ace_medical_consumeItem_PAK {
   title = "Consume Personal Aid Kit *";
   values[] = {0,1};
   texts[] = {"No","Yes"};
   default = 1;
};
class ace_medical_useLocation_PAK {
   title = "Personal Aid Kit Usage Location *";
   values[] = {0,1,2,3,4};
   texts[] = {"Anywhere","Medical Vehicles","Medical Facilities","Medical Vehicles and Facilities","Disabled"};
   default = 0;
};
class ace_medical_useCondition_PAK {
   title = "Personal Aid Kit Usage Condition *";
   values[] = {0,1};
   texts[] = {"Usable Any Time","Usable on Stable Patient"};
   default = 1;
};
class ace_medical_medicSetting_SurgicalKit {
   title = "Surgical Kit Usage *";
   values[] = {0,1,2};
   texts[] = {"Anyone","Medic Only","Doctor Only"};
   default = 2;
};
class ace_medical_consumeItem_SurgicalKit {
   title = "Consume Surgical Kit *";
   values[] = {0,1};
   texts[] = {"No","Yes"};
   default = 1;
};
class ace_medical_useLocation_SurgicalKit {
   title = "Surgical Kit Usage Location *";
   values[] = {0,1,2,3,4};
   texts[] = {"Anywhere","Medical Vehicles","Medical Facilities","Medical Vehicles and Facilities","Disabled"};
   default = 3;
};
class ace_medical_useCondition_SurgicalKit {
   title = "Surgical Kit Usage Condition *";
   values[] = {0,1};
   texts[] = {"Usable Any Time","Usable on Stable Patient"};
   default = 1;
};
class ace_advanced_ballistics_enabled {
   title = "Advanced Ballistics";
   values[] = {0,1};
   texts[] = {"Off","On"};
   default = 1;
};
class ace_map_BFT_Enabled {
   title = "Track Friendly Forces";
   values[] = {0,1};
   texts[] = {"Off","On"};
   default = 0;
};
class spacer5{
	title = "----------------- Permissions and Other stuff -----------------";
	values[] = { "" };
	texts[] = { "" };
	default = "";
};
class CleanupVehicles {
	title = $STR_CLEANUP_PARAM;
	values[] = { 0,1,2,4,12,24,48 };
	texts[] = { $STR_PARAMS_DISABLED, $STR_CLEANUP_PARAM1, $STR_CLEANUP_PARAM2, $STR_CLEANUP_PARAM3, $STR_CLEANUP_PARAM4, $STR_CLEANUP_PARAM5, $STR_CLEANUP_PARAM6 };
	default = 4;
};
class Permissions{
	title = $STR_PERMISSIONS_PARAM;
	values[] = {1,0};
	texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
	default = 1;
};
class Introduction {
	title = $STR_PARAMS_INTRO;
	values[] = { 1, 0 };
	texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
	default = 1;
};
class DeploymentCinematic {
	title = $STR_PARAMS_DEPLOYMENTCAMERA;
	values[] = { 1, 0 };
	texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
	default = 1;
};
class FirstFob {
	title = $STR_PARAMS_FIRSTFOB;
	values[] = { 1, 0 };
	texts[] = { $STR_YES, $STR_NO };
	default = 0;
};
class MaximumFobs{
 	title = $STR_PARAM_FOBS_COUNT;
 	values[] = {3,5,7,10,15,20,26};
 	texts[] = {3,5,7,10,15,20,26};
 	default = 3;
};
class MaxSquadSize{
	title = $STR_PARAM_SQUAD_SIZE;
	values[] = {0,1,2,4,6,8,10,12,16,20,24,30,36};
	texts[] = {0,1,2,4,6,8,10,12,16,20,24,30,36};
	default = 10;
};
class spacer99{
	title = "----------------- CAREFULL WITH THIS SECTION -----------------";
	values[] = { "" };
	texts[] = { "" };
	default = "";
};
class WipeSave1{
	title = $STR_WIPE_TITLE;
	values[] = {0,1};
	texts[] =  {$STR_WIPE_NO,$STR_WIPE_YES};
	default = 0;
};
class WipeSave2{
	title = $STR_WIPE_TITLE_2;
	values[] = {0,1};
	texts[] = {$STR_WIPE_NO,$STR_WIPE_YES};
	default = 0;
};
class ResetBuildings{
	title = "Recycle buildings (Keep FOBs)";
	values[] = {0,1,2,3};
	texts[] = {$STR_NO,"Recycle all buidings and vehicles","Recycle all buidings, keep vehicles","Recycle all vehicles, keep buildings"};
	default = 0;
};
class RemoveUnits{
	title = "Remove placed units (Doesn't recycle them)";
	values[] = {0,1};
	texts[] = {$STR_NO,$STR_YES};
	default = 0;
};
class ResetEliteVehs{
	title = "Reset elite vehicles assignments";
	values[] = {0,1};
	texts[] = {$STR_NO,$STR_YES};
	default = 0;
};