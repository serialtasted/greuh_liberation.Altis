class spacer1 {
	title = "---------------------- Mission Parameters ----------------------";
	
	values[] = {1};
	texts[] = {""};
	default = 1;
	paramCode = "";
};
class Unitcap{
	title = $STR_PARAMS_UNITCAP;
	values[] = {50,75,100,125,150,200};
	texts[] = {$STR_PARAMS_UNITCAP1,$STR_PARAMS_UNITCAP2,$STR_PARAMS_UNITCAP3,$STR_PARAMS_UNITCAP4,$STR_PARAMS_UNITCAP5,$STR_PARAMS_UNITCAP6};
	default = 75;
	paramCode = "";
};
class Difficulty {
	title = $STR_PARAMS_DIFFICULTY;
	values[] = { 50, 75, 100, 125, 150, 250, 400, 1000 };
	texts[] = { $STR_PARAMS_DIFFICULTY1, $STR_PARAMS_DIFFICULTY2, $STR_PARAMS_DIFFICULTY3, $STR_PARAMS_DIFFICULTY4, $STR_PARAMS_DIFFICULTY5, $STR_PARAMS_DIFFICULTY6, $STR_PARAMS_DIFFICULTY7, $STR_PARAMS_DIFFICULTY8 };
	default = 250;
	paramCode = "";
};
class Aggressivity{
	title = $STR_AGGRESSIVITY_PARAM;
	values[] = {25,50,100,250,400};
	texts[] = {$STR_AGGRESSIVITY_PARAM0, $STR_AGGRESSIVITY_PARAM1,$STR_AGGRESSIVITY_PARAM2,$STR_AGGRESSIVITY_PARAM3,$STR_AGGRESSIVITY_PARAM4};
	default = 250;
	paramCode = "";
};
class AdaptToPlayercount{
	title = $STR_PARAM_ADAPT_TO_PLAYERCOUNT;
	values[] = {1,0};
	texts[] = {$STR_PARAMS_ENABLED,$STR_PARAMS_DISABLED};
	default = 1;
	paramCode = "";
};
class DayDuration {
	title = $STR_PARAMS_DAYDURATION;
	values[] = { 48, 24, 16, 12, 9.6, 8, 6.8, 6, 4.8, 4, 3, 2.4, 2, 1.6, 1, 0.66, 0.5, 0.375, 0.25, 0.1875, 0.125, 0.11 };
	texts[] = { "0.5", "1", "1.5", "2", "2.5", "3","3.5","4","5","6","8","10","12","15","24","36","48","64","96","128","192","240" };
	default = 4;
	paramCode = "";
};
class ShorterNights {
	title = $STR_SHORTER_NIGHTS_PARAM;
	values[] = {1,0};
	texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
	default = 0;
	paramCode = "";
};
class Weather {
	title = $STR_WEATHER_PARAM;
	values[] = { 1,2,3 };
	texts[] = { $STR_WEATHER_PARAM1, $STR_WEATHER_PARAM2, $STR_WEATHER_PARAM3 };
	default = 3;
	paramCode = "";
};
class ResourcesMultiplier {
	title = $STR_PARAMS_RESOURCESMULTIPLIER;
	values[] = { 0.25, 0.5, 0.75, 1, 1.25, 1.5, 2, 3, 5, 10, 20, 50 };
	texts[] = { "x0.25", "x0.5", "x0.75", "x1", "x1.25","x1.5","x2","x3","x5","x10","x20","x50" };
	default = 1;
	paramCode = "";
};
class Fatigue {
	title = $STR_PARAMS_FATIGUE;
	values[] = { 0, 1 };
	texts[] = { $STR_PARAMS_DISABLED, $STR_PARAMS_ENABLED };
	default = 0;
	paramCode = "";
};
class AmmoBounties{
	title = $STR_AMMO_BOUNTIES;
	values[] = {1,0};
	texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
	default = 1;
	paramCode = "";
};
class Civilians{
	title = $STR_PARAMS_CIVILIANS;
	values[] = {0,50,100,200};
	texts[] = {$STR_PARAMS_CIVILIANS1,$STR_PARAMS_CIVILIANS2,$STR_PARAMS_CIVILIANS3,$STR_PARAMS_CIVILIANS4};
	default = 0;
	paramCode = "";
};
class TeamkillPenalty{
	title = $STR_PARAM_TEAMKILL_PENALTY;
	values[] = {1,0};
	texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
	default = 1;
	paramCode = "";
};
class PassiveIncome{
	title = $STR_PARAM_PASSIVE_INCOME;
	values[] = {1,0};
	texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
	default = 0;
	paramCode = "";
};
class DisableRemoteSensors{
 	title = "Disable Remote Sensors (experimental!)";
 	values[] = {0,1,2};
 	texts[] = {"No","Disable for clients without local AIs","Disable for all clients"};
 	default = 1;
	paramCode = "";
 };
class spacer4 {
   title = "---------------------- Deploy Parameters ----------------------";
   values[] = {1};
   texts[] = {""};
   default = 1;
   paramCode = "";
};
class AllowRedeploy{
	title = "Allow redeploy (Always possible when less than 2 players online)";
	values[] = {1,0,-1};
	texts[] = { $STR_YES, $STR_NO, $STR_ALWAYS_NO };
	default = 0;
	paramCode = "";
};
class AllowFOBDeploy{
	title = "Allow deploy at FOB (Always possible when less than 5 players online)";
	values[] = {1,0,-1};
	texts[] = { $STR_YES, $STR_NO, $STR_ALWAYS_NO };
	default = 1;
	paramCode = "";
};
class AllowMobileDeploy{
	title = "Allow deploy at Mobile FOB (Always possible when less than 3 players online)";
	values[] = {1,0,-1};
	texts[] = { $STR_YES, $STR_NO, $STR_ALWAYS_NO };
	default = -1;
	paramCode = "";
};
class HaloJump{
	title = $STR_HALO_PARAM;
	values[] = {1,5,10,15,20,30,0};
	texts[] = { $STR_HALO_PARAM1, $STR_HALO_PARAM2, $STR_HALO_PARAM3, $STR_HALO_PARAM4, $STR_HALO_PARAM5, $STR_HALO_PARAM6, $STR_PARAMS_DISABLED };
	default = 15;
	paramCode = "";
};
class spacer2 {
   title = "---------------------- ACE 3 Parameters ----------------------";
   values[] = {1};
   texts[] = {""};
   default = 1;
   paramCode = "";
};
class param13 {
   title = "* requires Advanced Medical Level";
   values[] = {1};
   texts[] = {""};
   default = 1;
   paramCode = "";
};
class param14 {
   title = "Medical Level";
   values[] = {1,2};
   texts[] = {"Basic","Advanced"};
   default = 1;
   paramCode = "ace_medical_level = %1;";
};
class param15 {
   title = "Advanced Wounds *";
   values[] = {0,1};
   texts[] = {"Off","On"};
   default = 0;
   paramCode = "ace_medical_enableAdvancedWounds = %1;";
};
class param16 {
   title = "Player Damage Threshold";
   values[] = {8,12,16};
   texts[] = {"Low","Medium","High"};
   default = 12;
   paramCode = "ace_medical_playerDamageThreshold = ((%1)*0.1);";
};
class param17 {
   title = "Max Revive Time (minutes)";
   values[] = {60,300,600,900};
   texts[] = {"1","5","10","15"};
   default = 900;
   paramCode = "ace_medical_maxReviveTime = %1;";
};
class param18 {
   title = "Personal Aid Kit Usage *";
   values[] = {0,1,2};
   texts[] = {"Anyone","Medic Only","Doctor Only"};
   default = 2;
   paramCode = "ace_medical_medicSetting_PAK = %1;";
};
class param19 {
   title = "Consume Personal Aid Kit *";
   values[] = {0,1};
   texts[] = {"No","Yes"};
   default = 1;
   paramCode = "ace_medical_consumeItem_PAK = %1;";
};
class param20 {
   title = "Personal Aid Kit Usage Location *";
   values[] = {0,1,2,3,4};
   texts[] = {"Anywhere","Medical Vehicles","Medical Facilities","Medical Vehicles and Facilities","Disabled"};
   default = 0;
   paramCode = "ace_medical_useLocation_PAK = %1;";
};
class param21 {
   title = "Personal Aid Kit Usage Condition *";
   values[] = {0,1};
   texts[] = {"Usable Any Time","Usable on Stable Patient"};
   default = 1;
   paramCode = "ace_medical_useCondition_PAK = %1;";
};
class param22 {
   title = "Surgical Kit Usage *";
   values[] = {0,1,2};
   texts[] = {"Anyone","Medic Only","Doctor Only"};
   default = 2;
   paramCode = "ace_medical_medicSetting_SurgicalKit = %1;";
};
class param23 {
   title = "Consume Surgical Kit *";
   values[] = {0,1};
   texts[] = {"No","Yes"};
   default = 1;
   paramCode = "ace_medical_consumeItem_SurgicalKit = %1;";
};
class param24 {
   title = "Surgical Kit Usage Location *";
   values[] = {0,1,2,3,4};
   texts[] = {"Anywhere","Medical Vehicles","Medical Facilities","Medical Vehicles and Facilities","Disabled"};
   default = 3;
   paramCode = "ace_medical_useLocation_SurgicalKit = %1;";
};
class param25 {
   title = "Surgical Kit Usage Condition *";
   values[] = {0,1};
   texts[] = {"Usable Any Time","Usable on Stable Patient"};
   default = 1;
   paramCode = "ace_medical_useCondition_SurgicalKit = %1;";
};
class param26 {
   title = "Max View Distance (meters)";
   values[] = {3000,6000,9000};
   texts[] = {"3000","6000","9000"};
   default = 6000;
   paramCode = "ace_viewdistance_limitViewDistance = %1;";
};
class param27 {
   title = "Advanced Ballistics";
   values[] = {0,1};
   texts[] = {"Off","On"};
   default = 1;
   paramCode = "ace_advanced_ballistics_enabled = %1;";
};
class param28 {
   title = "Track Friendly Forces";
   values[] = {0,1};
   texts[] = {"Off","On"};
   default = 0;
   paramCode = "ace_map_BFT_Enabled = %1;";
};
class spacer3{
	title = "----------------- Permissions and Other stuff -----------------";
	values[] = { "" };
	texts[] = { "" };
	default = "";
	paramCode = "";
};
class CleanupVehicles {
	title = $STR_CLEANUP_PARAM;
	values[] = { 0,1,2,4,12,24,48 };
	texts[] = { $STR_PARAMS_DISABLED, $STR_CLEANUP_PARAM1, $STR_CLEANUP_PARAM2, $STR_CLEANUP_PARAM3, $STR_CLEANUP_PARAM4, $STR_CLEANUP_PARAM5, $STR_CLEANUP_PARAM6 };
	default = 12;
	paramCode = "";
};
class Permissions{
	title = $STR_PERMISSIONS_PARAM;
	values[] = {1,0};
	texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
	default = 1;
	paramCode = "";
};
class Introduction {
	title = $STR_PARAMS_INTRO;
	values[] = { 1, 0 };
	texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
	default = 1;
	paramCode = "";
};
class DeploymentCinematic {
	title = $STR_PARAMS_DEPLOYMENTCAMERA;
	values[] = { 1, 0 };
	texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
	default = 1;
	paramCode = "";
};
class FirstFob {
	title = $STR_PARAMS_FIRSTFOB;
	values[] = { 1, 0 };
	texts[] = { $STR_YES, $STR_NO };
	default = 0;
	paramCode = "";
};
class spacer99{
	title = "----------------- CAREFULL WITH THIS SECTION -----------------";
	values[] = { "" };
	texts[] = { "" };
	default = "";
	paramCode = "";
};
class WipeSave1{
	title = $STR_WIPE_TITLE;
	values[] = {0,1};
	texts[] =  {$STR_WIPE_NO,$STR_WIPE_YES};
	default = 0;
	paramCode = "";
};
class WipeSave2{
	title = $STR_WIPE_TITLE_2;
	values[] = {0,1};
	texts[] = {$STR_WIPE_NO,$STR_WIPE_YES};
	default = 0;
	paramCode = "";
};
class ResetEliteVehs{
	title = "Reset elite vehicles assignments";
	values[] = {0,1};
	texts[] = {$STR_NO,$STR_YES};
	default = 0;
	paramCode = "";
};