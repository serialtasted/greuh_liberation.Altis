private ["_nimspots", "_wires", "_wiresPos", "_pos", "_v", 
	 "_appSpeed", "_sinkRate", "_dir", "_plane"];

_plane = [_this, 0, ObjNull] call BIS_fnc_param;

_appSpeed = 200 / 3.6;

_plane allowDamage false;
_plane animate ["tailhook", 1];
(driver _plane) action ["LANDGEAR", _plane];
_plane action ["LANDGEAR", _plane];
(driver _plane) action ["FLAPSDOWN", _plane];
_plane action ["FLAPSDOWN", _plane];
_plane land "LAND";

[_plane] spawn TTT_fnc_arrest;

_nimspots = ["nimspots"] call TTT_fnc_global;
_wires = ["jdgNimArrestor"] call TTT_fnc_global;
_wiresPos = getPosASL _wires;

_plane engineOn true;

// bring plane on course
_dir = [_plane, _wiresPos] call BIS_fnc_dirTo;
_plane setDir _dir;

// keep plane upright during landing
[_plane] spawn {
  private ["_plane"];
  _plane = _this select 0;
  while {speed _plane > 10} do {
    [_plane, 0, 0] call BIS_fnc_setPitchBank;    
    sleep 0.01; 
  };
};


while {_plane distance _wiresPos > 20} do {
  _pos = getPosASL _plane;
  _dir = getDir _plane;

  // sink faster when higher up
  if (_pos select 2 > 100) then {
    _sinkRate = _appSpeed * 1.5;
  } else {
    _sinkRate = _appSpeed;
  };
  // fly straight if too low
  if (_pos select 2 < 100 and _plane distance _wiresPos > 800) then {
    _sinkRate = 0;
  };

  _v = [_pos, _wiresPos] call BIS_fnc_vectorFromXToY;
  _v = [ (_v select 0) * _appSpeed, 
         (_v select 1) * _appSpeed, 
         (_v select 2) * _sinkRate];
  _plane setVelocity _v;

  sleep 0.05;
};

// delete crew for safer landing ...
{ deleteVehicle _x } forEach crew _plane;


// safety delay
sleep 10;
_plane engineOn false;
_plane animate ["tailhook", 0];
_plane setVariable ["NimitzTailhook", nil, true];