kill_manager = compileFinal preprocessFileLineNumbers "scripts\shared\kill_manager.sqf";

build_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\build_remote_call.sqf";
build_fob_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\build_fob_remote_call.sqf";
cancel_build_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\cancel_build_remote_call.sqf";
prisonner_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\prisonner_remote_call.sqf";
recycle_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\recycle_remote_call.sqf";
reinforcements_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\reinforcements_remote_call.sqf";
sector_liberated_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\sector_liberated_remote_call.sqf";

remote_call_sector = compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_sector.sqf";
remote_call_fob = compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_fob.sqf";
remote_call_battlegroup = compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_battlegroup.sqf";
remote_call_endgame = compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_endgame.sqf";
remote_call_prisonner = compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_prisonner.sqf";
remote_call_switchmove = compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_switchmove.sqf";

[] spawn compileFinal preprocessFileLineNumbers "scripts\shared\scan_skill.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\shared\diagnostics.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\shared\manage_weather.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\shared\configFunctions.sqf";