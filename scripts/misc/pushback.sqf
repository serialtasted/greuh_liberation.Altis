/*************************
--	Pushback script		--
--	Version : 1.0		--
--	Author : Jack Ost	--
--	All rights reserved	--
*************************/


//Tableau avions déséquilibrés
planesArray = ["USAF_AC130U","LDL_C130J","USAF_A10","USAF_MC130","USAF_C130J","USAF_C130J_Cargo"];
//Vitesse en km/h
speedo = (6)-1; 
//Moteur éteint
_OnOff = false;
//Initialisation Variable classname
vehType = typeOf (_this select 0);


actionON = (_this select 0) addAction [
	"<t color='#00FF00'>pushback ON</t>",{
	//Initialisation Variable Moteur Allumé (boolean) 
	_OnOff = isEngineOn (_this select 0);
	//Initialisation Variable de direction (return array)
	_dir = direction (_this select 0);
	//Initialisation Variable de désactivation (boolean)
	des = false;
	//Condition moteur allumé ou éteint
	if(_OnOff) then [{
			//Condition vitesse nulle
			if((velocity (_this select 0) select 2) == 0) then [ 
				{	
					//Suppression de l'action
					(_this select 0) removeAction actionON;
					//Démarrage progressif
					for 'i' from 1 to 80 do {
						(_this select 0) setVelocity [-(i/3*(sin _dir)), -(i/3*(cos _dir)), 0];
					};
					//Ajout du menu de désenclenchement
					_actionOFF = (_this select 0) addAction ["<t color='#FF0000'>pushback OFF</t>", "des = true;",[1],0,false,true,"","driver  _target == _this"];
					//Enclenchement du reverse thrust
					while {!des} do {
						(_this select 0) setVelocity [-((speedo/3)*(sin _dir)), -((speedo/3)*(cos _dir)), 0];
						_dir = direction (_this select 0);
						sleep 0.001;
						//test avion déséquilibré
						if (vehType in planesArray) then [{
							(_this select 0) setvectorup [0,0,1];},{}
						];
					};
					//Suppression du menu de désenclechement
					(_this select 0) removeAction _actionOFF;
					0 = [(_this select 0),10] execVM "scripts\misc\pushback.sqf";
				} , { hint "You must be stopped"; }
			];
		} , { hint "Turn on the engines !"; }
	];
	}
//Vérification slot de pilote
,[1],0,false,true,"","driver  _target == _this"];