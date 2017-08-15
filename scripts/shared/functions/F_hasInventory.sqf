private [ "_maxBackpacks", "_maxMagazines", "_maxWeapons" ];
params [ "_className" ];

_maxBackpacks = getNumber (configFile >> "CfgVehicles" >> _className >> "transportmaxbackpacks");
_maxMagazines = getNumber (configFile >> "CfgVehicles" >> _className >> "transportmaxmagazines");
_maxWeapons = getNumber (configFile >> "CfgVehicles" >> _className >> "transportmaxweapons");
_return = if (_maxBackpacks > 0  || _maxMagazines > 0 || _maxWeapons > 0) then { true } else { false };

_return