private[ "_unitrank" ];
params [ "_canclose" ];

CSclosed = false;
_unitrank = [player] call F_getPlayerRank;
disableSerialization;

while { !CSclosed } do {
	_dialog = createDialog "St_ClassSelector";

	waitUntil { dialog };
	
	_control = ((findDisplay 2490) displayCtrl 2414); if ( _canclose ) then { _control ctrlShow true; } else { _control ctrlShow false; };

	while { dialog && ( !CSclosed ) } do {
		_limitAssault = -99;
		_limitGrenadier = round( ( 2 * (count allPlayers) / 10 ) );
		_limitMedic = round( ( 2 * (count allPlayers) / 10 ) );
		_limitEngineer = round( ( 2 * (count allPlayers) / 10 ) );
		_limitAT = round( ( 1 * (count allPlayers) / 10 ) );
		_limitAA = round( ( 1 * (count allPlayers) / 10 ) );
		_limitAR = round( ( 2 * (count allPlayers) / 10 ) );
		_limitJTAC = round( ( 1 * (count allPlayers) / 10 ) );
		_limitMarksman = round( ( 1 * (count allPlayers) / 10 ) );
		_limitSniper = round( ( 2 * (count allPlayers) / 10 ) );
		_limitPilot = round( ( 3 * (count allPlayers) / 10 ) );
		_limitCrew = round( ( 3 * (count allPlayers) / 10 ) );
		_limitFSO = round( ( 1 * (count allPlayers) / 10 ) );
		_limitCommander = 1;
		
		_playersAssault = "";
		_playersGrenadier = "";
		_playersMedic = "";
		_playersEngineer = "";
		_playersAT = "";
		_playersAA = "";
		_playersAR = "";
		_playersJTAC = "";
		_playersMarksman = "";
		_playersSniper = "";
		_playersPilot = "";
		_playersCrew = "";
		_playersFSO = "";
		_playersCommander = "";

		if ( _limitAssault <= 1 && _limitAssault != -99 ) then { _limitAssault = 1; };
		if ( _limitGrenadier <= 1 && _limitGrenadier != -99 ) then { _limitGrenadier = 1; };
		if ( _limitMedic <= 1 && _limitMedic != -99 ) then { _limitMedic = 2; };
		if ( _limitEngineer <= 1 && _limitEngineer != -99 ) then { _limitEngineer = 1; };
		if ( _limitAT <= 1 && _limitAT != -99 ) then { _limitAT = 1; };
		if ( _limitAA <= 1 && _limitAA != -99 ) then { _limitAA = 1; };
		if ( _limitAR <= 1 && _limitAR != -99 ) then { _limitAR = 1; };
		if ( _limitJTAC <= 1 && _limitJTAC != -99 ) then { _limitJTAC = 1; };
		if ( _limitMarksman <= 1 && _limitMarksman != -99 ) then { _limitMarksman = 1; };
		if ( _limitSniper <= 1 && _limitSniper != -99 ) then { _limitSniper = 1; };
		if ( _limitPilot <= 1 && _limitPilot != -99 ) then { _limitPilot = 2; };
		if ( _limitCrew <= 1 && _limitCrew != -99 ) then { _limitCrew = 1; };
		if ( _limitFSO <= 1 && _limitFSO != -99 ) then { _limitFSO = 1; };
		if ( _limitCommander <= 1 && _limitCommander != -99 ) then { _limitCommander = 1; };

		{
			
			_playerclass = _x getVariable ["St_class", "assault"];
			
			switch ( _playerclass ) do {
				case "assault": { if ( _limitAssault != -99 ) then { _limitAssault = _limitAssault - 1; }; if ( _playersAssault == "" ) then { _playersAssault = format["» %1", (name _x)]; } else { _playersAssault = format["%1\n» %2", _playersAssault, (name _x)]; }; };
				case "grenadier": { if ( _limitGrenadier != -99 ) then { _limitGrenadier = _limitGrenadier - 1; }; if ( _playersGrenadier == "" ) then { _playersGrenadier = format["» %1", (name _x)]; } else { _playersGrenadier = format["%1\n» %2", _playersGrenadier, (name _x)]; }; };
				case "medic": { if ( _limitMedic != -99 ) then { _limitMedic = _limitMedic - 1; }; if ( _playersMedic == "" ) then { _playersMedic = format["» %1", (name _x)]; } else { _playersMedic = format["%1\n» %2", _playersMedic, (name _x)]; }; };
				case "engineer": { if ( _limitEngineer != -99 ) then { _limitEngineer = _limitEngineer - 1; }; if ( _playersEngineer == "" ) then { _playersEngineer = format["» %1", (name _x)]; } else { _playersEngineer = format["%1\n» %2", _playersEngineer, (name _x)]; }; };
				case "at": { if ( _limitAT != -99 ) then { _limitAT = _limitAT - 1; }; if ( _playersAT == "" ) then { _playersAT = format["» %1", (name _x)]; } else { _playersAT = format["%1\n» %2", _playersAT, (name _x)]; }; };
				case "aa": { if ( _limitAA != -99 ) then { _limitAA = _limitAA - 1; }; if ( _playersAA == "" ) then { _playersAA = format["» %1", (name _x)]; } else { _playersAA = format["%1\n» %2", _playersAA, (name _x)]; }; };
				case "ar": { if ( _limitAR != -99 ) then { _limitAR = _limitAR - 1; }; if ( _playersAR == "" ) then { _playersAR = format["» %1", (name _x)]; } else { _playersAR = format["%1\n» %2", _playersAR, (name _x)]; }; };
				case "jtac": { if ( _limitJTAC != -99 ) then { _limitJTAC = _limitJTAC - 1; }; if ( _playersJTAC == "" ) then { _playersJTAC = format["» %1", (name _x)]; } else { _playersJTAC = format["%1\n» %2", _playersJTAC, (name _x)]; }; };
				case "marksman": { if ( _limitMarksman != -99 ) then { _limitMarksman = _limitMarksman - 1; }; if ( _playersMarksman == "" ) then { _playersMarksman = format["» %1", (name _x)]; } else { _playersMarksman = format["%1\n» %2", _playersMarksman, (name _x)]; }; };
				case "sniper": { if ( _limitSniper != -99 ) then { _limitSniper = _limitSniper - 1; }; if ( _playersSniper == "" ) then { _playersSniper = format["» %1", (name _x)]; } else { _playersSniper = format["%1\n» %2", _playersSniper, (name _x)]; }; };
				case "pilot": { if ( _limitPilot != -99 ) then { _limitPilot = _limitPilot - 1; }; if ( _playersPilot == "" ) then { _playersPilot = format["» %1", (name _x)]; } else { _playersPilot = format["%1\n» %2", _playersPilot, (name _x)]; }; };
				case "crew": { if ( _limitCrew != -99 ) then { _limitCrew = _limitCrew - 1; }; if ( _playersCrew == "" ) then { _playersCrew = format["» %1", (name _x)]; } else { _playersCrew = format["%1\n» %2", _playersCrew, (name _x)]; }; };
				case "fso": { if ( _limitFSO != -99 ) then { _limitFSO = _limitFSO - 1; }; if ( _playersFSO == "" ) then { _playersFSO = format["» %1", (name _x)]; } else { _playersFSO = format["%1\n» %2", _playersFSO, (name _x)]; }; };
				case "commander": { if ( _limitCommander != -99 ) then { _limitCommander = _limitCommander - 1; }; if ( _playersCommander == "" ) then { _playersCommander = format["» %1", (name _x)]; } else { _playersCommander = format["%1\n» %2", _playersCommander, (name _x)]; }; };
				default {};
			};
			
		} forEach allPlayers;

		_controlText = ((findDisplay 2490) displayCtrl 1014); _controlButton = ((findDisplay 2490) displayCtrl 2400); if ( _unitrank >= 0 ) then { if ( _limitAssault <= 0 && _limitAssault != -99 ) then { _controlText ctrlSetText "Available kits: 0"; _controlButton ctrlEnable false; } else { if ( _limitAssault != -99 ) then { _available = format [ "Available kits: %1", _limitAssault ]; _controlText ctrlSetText _available; } else { _controlText ctrlSetText "Available kits: ∞"; }; _controlButton ctrlEnable true; }; } else { _controlText ctrlSetText "Rank too low"; _controlButton ctrlEnable false; }; if ( _playersAssault != "" ) then { _controlButton ctrlSetTooltip (_playersAssault); } else { _controlButton ctrlSetTooltip (""); };
		_controlText = ((findDisplay 2490) displayCtrl 1015); _controlButton = ((findDisplay 2490) displayCtrl 2401); if ( _unitrank >= 1 ) then { if ( _limitGrenadier <= 0 && _limitGrenadier != -99 ) then { _controlText ctrlSetText "Available kits: 0"; _controlButton ctrlEnable false; } else { if ( _limitGrenadier != -99 ) then { _available = format [ "Available kits: %1", _limitGrenadier ]; _controlText ctrlSetText _available; } else { _controlText ctrlSetText "Available kits: ∞"; }; _controlButton ctrlEnable true; }; } else { _controlText ctrlSetText "Rank too low"; _controlButton ctrlEnable false; }; if ( _playersGrenadier != "" ) then { _controlButton ctrlSetTooltip (_playersGrenadier); } else { _controlButton ctrlSetTooltip (""); };
		_controlText = ((findDisplay 2490) displayCtrl 1016); _controlButton = ((findDisplay 2490) displayCtrl 2402); if ( _unitrank >= 2 ) then { if ( _limitMedic <= 0 && _limitMedic != -99 ) then { _controlText ctrlSetText "Available kits: 0"; _controlButton ctrlEnable false; } else { if ( _limitMedic != -99 ) then { _available = format [ "Available kits: %1", _limitMedic ]; _controlText ctrlSetText _available; } else { _controlText ctrlSetText "Available kits: ∞"; }; _controlButton ctrlEnable true; }; } else { _controlText ctrlSetText "Rank too low"; _controlButton ctrlEnable false; }; if ( _playersMedic != "" ) then { _controlButton ctrlSetTooltip (_playersMedic); } else { _controlButton ctrlSetTooltip (""); };
		_controlText = ((findDisplay 2490) displayCtrl 1017); _controlButton = ((findDisplay 2490) displayCtrl 2403); if ( _unitrank >= 1 ) then { if ( _limitEngineer <= 0 && _limitEngineer != -99 ) then { _controlText ctrlSetText "Available kits: 0"; _controlButton ctrlEnable false; } else { if ( _limitEngineer != -99 ) then { _available = format [ "Available kits: %1", _limitEngineer ]; _controlText ctrlSetText _available; } else { _controlText ctrlSetText "Available kits: ∞"; }; _controlButton ctrlEnable true; }; } else { _controlText ctrlSetText "Rank too low"; _controlButton ctrlEnable false; }; if ( _playersEngineer != "" ) then { _controlButton ctrlSetTooltip (_playersEngineer); } else { _controlButton ctrlSetTooltip (""); };
		_controlText = ((findDisplay 2490) displayCtrl 1018); _controlButton = ((findDisplay 2490) displayCtrl 2404); if ( _unitrank >= 2 ) then { if ( _limitAT <= 0 && _limitAT != -99 ) then { _controlText ctrlSetText "Available kits: 0"; _controlButton ctrlEnable false; } else { if ( _limitAT != -99 ) then { _available = format [ "Available kits: %1", _limitAT ]; _controlText ctrlSetText _available; } else { _controlText ctrlSetText "Available kits: ∞"; }; _controlButton ctrlEnable true; }; } else { _controlText ctrlSetText "Rank too low"; _controlButton ctrlEnable false; }; if ( _playersAT != "" ) then { _controlButton ctrlSetTooltip (_playersAT); } else { _controlButton ctrlSetTooltip (""); };
		_controlText = ((findDisplay 2490) displayCtrl 1019); _controlButton = ((findDisplay 2490) displayCtrl 2405); if ( _unitrank >= 2 ) then { if ( _limitAA <= 0 && _limitAA != -99 ) then { _controlText ctrlSetText "Available kits: 0"; _controlButton ctrlEnable false; } else { if ( _limitAA != -99 ) then { _available = format [ "Available kits: %1", _limitAA ]; _controlText ctrlSetText _available; } else { _controlText ctrlSetText "Available kits: ∞"; }; _controlButton ctrlEnable true; }; } else { _controlText ctrlSetText "Rank too low"; _controlButton ctrlEnable false; }; if ( _playersAA != "" ) then { _controlButton ctrlSetTooltip (_playersAA); } else { _controlButton ctrlSetTooltip (""); };
		_controlText = ((findDisplay 2490) displayCtrl 1020); _controlButton = ((findDisplay 2490) displayCtrl 2406); if ( _unitrank >= 1 ) then { if ( _limitAR <= 0 && _limitAR != -99 ) then { _controlText ctrlSetText "Available kits: 0"; _controlButton ctrlEnable false; } else { if ( _limitAR != -99 ) then { _available = format [ "Available kits: %1", _limitAR ]; _controlText ctrlSetText _available; } else { _controlText ctrlSetText "Available kits: ∞"; }; _controlButton ctrlEnable true; }; } else { _controlText ctrlSetText "Rank too low"; _controlButton ctrlEnable false; }; if ( _playersAR != "" ) then { _controlButton ctrlSetTooltip (_playersAR); } else { _controlButton ctrlSetTooltip (""); };
		_controlText = ((findDisplay 2490) displayCtrl 1021); _controlButton = ((findDisplay 2490) displayCtrl 2407); if ( _unitrank >= 3 ) then { if ( _limitJTAC <= 0 && _limitJTAC != -99 ) then { _controlText ctrlSetText "Available kits: 0"; _controlButton ctrlEnable false; } else { if ( _limitJTAC != -99 ) then { _available = format [ "Available kits: %1", _limitJTAC ]; _controlText ctrlSetText _available; } else { _controlText ctrlSetText "Available kits: ∞"; }; _controlButton ctrlEnable true; }; } else { _controlText ctrlSetText "Rank too low"; _controlButton ctrlEnable false; }; if ( _playersJTAC != "" ) then { _controlButton ctrlSetTooltip (_playersJTAC); } else { _controlButton ctrlSetTooltip (""); };
		_controlText = ((findDisplay 2490) displayCtrl 1022); _controlButton = ((findDisplay 2490) displayCtrl 2408); if ( _unitrank >= 2 ) then { if ( _limitMarksman <= 0 && _limitMarksman != -99 ) then { _controlText ctrlSetText "Available kits: 0"; _controlButton ctrlEnable false; } else { if ( _limitMarksman != -99 ) then { _available = format [ "Available kits: %1", _limitMarksman ]; _controlText ctrlSetText _available; } else { _controlText ctrlSetText "Available kits: ∞"; }; _controlButton ctrlEnable true; }; } else { _controlText ctrlSetText "Rank too low"; _controlButton ctrlEnable false; }; if ( _playersMarksman != "" ) then { _controlButton ctrlSetTooltip (_playersMarksman); } else { _controlButton ctrlSetTooltip (""); };
		_controlText = ((findDisplay 2490) displayCtrl 1023); _controlButton = ((findDisplay 2490) displayCtrl 2409); if ( _unitrank >= 3 ) then { if ( _limitSniper <= 0 && _limitSniper != -99 ) then { _controlText ctrlSetText "Available kits: 0"; _controlButton ctrlEnable false; } else { if ( _limitSniper != -99 ) then { _available = format [ "Available kits: %1", _limitSniper ]; _controlText ctrlSetText _available; } else { _controlText ctrlSetText "Available kits: ∞"; }; _controlButton ctrlEnable true; }; } else { _controlText ctrlSetText "Rank too low"; _controlButton ctrlEnable false; }; if ( _playersSniper != "" ) then { _controlButton ctrlSetTooltip (_playersSniper); } else { _controlButton ctrlSetTooltip (""); };
		_controlText = ((findDisplay 2490) displayCtrl 1024); _controlButton = ((findDisplay 2490) displayCtrl 2410); if ( _unitrank >= 4 || [ player, 2 ] call F_fetchPermission ) then { if ( _limitPilot <= 0 && _limitPilot != -99 ) then { _controlText ctrlSetText "Available kits: 0"; _controlButton ctrlEnable false; } else { if ( _limitPilot != -99 ) then { _available = format [ "Available kits: %1", _limitPilot ]; _controlText ctrlSetText _available; } else { _controlText ctrlSetText "Available kits: ∞"; }; _controlButton ctrlEnable true; }; } else { _controlText ctrlSetText "Rank too low"; _controlButton ctrlEnable false; }; if ( _playersPilot != "" ) then { _controlButton ctrlSetTooltip (_playersPilot); } else { _controlButton ctrlSetTooltip (""); };
		_controlText = ((findDisplay 2490) displayCtrl 1025); _controlButton = ((findDisplay 2490) displayCtrl 2411); if ( _unitrank >= 3 || [ player, 1 ] call F_fetchPermission ) then { if ( _limitCrew <= 0 && _limitCrew != -99 ) then { _controlText ctrlSetText "Available kits: 0"; _controlButton ctrlEnable false; } else { if ( _limitCrew != -99 ) then { _available = format [ "Available kits: %1", _limitCrew ]; _controlText ctrlSetText _available; } else { _controlText ctrlSetText "Available kits: ∞"; }; _controlButton ctrlEnable true; }; } else { _controlText ctrlSetText "Rank too low"; _controlButton ctrlEnable false; }; if ( _playersCrew != "" ) then { _controlButton ctrlSetTooltip (_playersCrew); } else { _controlButton ctrlSetTooltip (""); };
		_controlText = ((findDisplay 2490) displayCtrl 1026); _controlButton = ((findDisplay 2490) displayCtrl 2412); if ( _unitrank >= 3 ) then { if ( _limitFSO <= 0 && _limitFSO != -99 ) then { _controlText ctrlSetText "Available kits: 0"; _controlButton ctrlEnable false; } else { if ( _limitFSO != -99 ) then { _available = format [ "Available kits: %1", _limitFSO ]; _controlText ctrlSetText _available; } else { _controlText ctrlSetText "Available kits: ∞"; }; _controlButton ctrlEnable true; }; } else { _controlText ctrlSetText "Rank too low"; _controlButton ctrlEnable false; }; if ( _playersFSO != "" ) then { _controlButton ctrlSetTooltip (_playersFSO); } else { _controlButton ctrlSetTooltip (""); };
		_controlText = ((findDisplay 2490) displayCtrl 1027); _controlButton = ((findDisplay 2490) displayCtrl 2413); if ( _unitrank >= 5 ) then { if ( _limitCommander <= 0 && _limitCommander != -99 ) then { _controlText ctrlSetText "Available kits: 0"; _controlButton ctrlEnable false; } else { if ( _limitCommander != -99 ) then { _available = format [ "Available kits: %1", _limitCommander ]; _controlText ctrlSetText _available; } else { _controlText ctrlSetText "Available kits: ∞"; }; _controlButton ctrlEnable true; }; } else { _controlText ctrlSetText "Rank too low"; _controlButton ctrlEnable false; }; if ( _playersCommander != "" ) then { _controlButton ctrlSetTooltip (_playersCommander); } else { _controlButton ctrlSetTooltip (""); };
		
		sleep 0.2;
	};
};