/* --------------------------------------------------------------------------------
[TAA] Realistic_Repair
BY [TAA]Jérôme 
Thanks to Black Puma and Jimi Vacarians  for the tips !
http://www.taa-arma.fr/
-----------------------------------------------------------------------------------
*/

/*
**************************************************************************************************************************************************************************************************************
***************************************************************************************** AIR VEHICLE ********************************************************************************************************
**************************************************************************************************************************************************************************************************************
*/

TAA_air_informations =
{
	private ["_veh","_vehname"];
	_veh = _this select 0;
	_vehname = getText ( configFile >> "CfgVehicles" >> typeOf(_veh) >> "displayName");
	//HitEngine,HitEngine2,HitEngine3,HitHRotor,HitVRotor,HitFuel,HitAvionics,HitHull,HitGear
	
	AIR_ENGINE_STAT = _veh getHitPointDamage ("HitEngine");
	if ( isNil {_veh getHitPointDamage ("HitEngine")}) then
	{
		AIR_ENGINE_STAT = parseText "None";
		AIRENGI1 = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitEngine")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			AIR_ENGINE_STAT = round ( AIR_ENGINE_STAT * 100 );
		}
		else
		{
			AIR_ENGINE_STAT = 100 - (round ( AIR_ENGINE_STAT * 100 ));
		};
		AIRENGI1 = true;
	};

	AIR_ENGINE_STAT2 = _veh getHitPointDamage ("HitEngine2");
	if ( isNil {_veh getHitPointDamage ("HitEngine2")}) then
	{
		AIR_ENGINE_STAT2 = parseText "None";
		AIRENGI2 = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitEngine2")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			AIR_ENGINE_STAT2 = round ( AIR_ENGINE_STAT2 * 100 );
		}
		else
		{
			AIR_ENGINE_STAT2 = 100 - (round ( AIR_ENGINE_STAT2 * 100 ));
		};
		AIRENGI2 = true;
	};

	AIR_ENGINE_STAT3 = _veh getHitPointDamage ("HitEngine3");
	if ( isNil {_veh getHitPointDamage ("HitEngine3")}) then
	{
		AIR_ENGINE_STAT3 = parseText "None";
		AIRENGI3 = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitEngine3")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			AIR_ENGINE_STAT3 = round ( AIR_ENGINE_STAT3 * 100 );
		}
		else
		{
			AIR_ENGINE_STAT3 = 100 - (round ( AIR_ENGINE_STAT3 * 100 ));
		};
		AIRENGI3 = true;
	};
	
	MAIN_ROTOR_STAT = _veh getHitPointDamage ("HitHRotor");
	if ( isNil {_veh getHitPointDamage ("HitHRotor")}) then
	{
		MAIN_ROTOR_STAT = parseText "None";
		MROTOR = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitHRotor")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			MAIN_ROTOR_STAT = round ( MAIN_ROTOR_STAT * 100 );
		}
		else
		{
			MAIN_ROTOR_STAT = 100 - (round ( MAIN_ROTOR_STAT * 100 ));
		};
		MROTOR = true;
	};
	
	TAIL_ROTOR_STAT = _veh getHitPointDamage ("HitVRotor");
	if ( isNil {_veh getHitPointDamage ("HitVRotor")}) then
	{
		TAIL_ROTOR_STAT = parseText "None";
		TROTOR = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitVRotor")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			TAIL_ROTOR_STAT = round ( TAIL_ROTOR_STAT * 100 );
		}
		else
		{
			TAIL_ROTOR_STAT = 100 - (round ( TAIL_ROTOR_STAT * 100 ));
		};
		TROTOR = true;
	};
	
	AIR_FUEL_STAT = _veh getHitPointDamage ("HitFuel");
	if ( isNil {_veh getHitPointDamage ("HitFuel")}) then
	{
		AIR_FUEL_STAT = parseText "None";
		AIRFUEL = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitFuel")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			AIR_FUEL_STAT = round ( AIR_FUEL_STAT * 100 );
		}
		else
		{
			AIR_FUEL_STAT = 100 - (round ( AIR_FUEL_STAT * 100 ));
		};
		AIRFUEL = true;
	};
	
	AVIONICS_STAT = _veh getHitPointDamage ("HitAvionics");
	if ( isNil {_veh getHitPointDamage ("HitAvionics")}) then
	{
		AVIONICS_STAT = parseText "None";
		AVNICS = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitAvionics")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			AVIONICS_STAT = round ( AVIONICS_STAT * 100 );
		}
		else
		{
			AVIONICS_STAT = 100 - (round ( AVIONICS_STAT * 100 ));
		};
		AVNICS = true;
	};

	AIR_HULL_STAT = _veh getHitPointDamage ("HitHull");
	if ( isNil {_veh getHitPointDamage ("HitHull")}) then
	{
		AIR_HULL_STAT = parseText "None";
		AIRHULL = false;
	};
	if ( !isNil {_veh getHitPointDamage ("HitHull")}) then
	{
		if (TAAShowPercentOfDamage) then
		{
			AIR_HULL_STAT = round ( AIR_HULL_STAT * 100 );
		}
		else
		{
			AIR_HULL_STAT = 100 - (round ( AIR_HULL_STAT * 100 ));
		};
		AIRHULL = true;
	};
	
	OIL_STAT = Fuel _veh;
	OIL_STAT = round ( OIL_STAT * 100 );	
	
	//								Yellow									Blue Light																					Green
	_text1 = parseText Format["<t color='#FFFF00'>Type of Aircraft :</t><t color='#00FFFF'> %1</t>%<br /><t color='#FFFF00'>-------------------------------</t><br /><t color='#00FF00'><t align='right'>Percentage of damages</t></t><br />" ,_vehname];
	_text2 = parseText Format["Engine 1 : <t color='#ff0000'><t align='right'>%1</t></t><br />" ,AIR_ENGINE_STAT];
	_text3 = parseText Format["Engine 2 : <t color='#ff0000'><t align='right'>%1</t></t><br />" ,AIR_ENGINE_STAT2];
	_text4 = parseText Format["Engine 3 : <t color='#ff0000'><t align='right'>%1</t></t><br />" ,AIR_ENGINE_STAT3];
	_text5 = parseText Format["Main Rotor : <t color='#ff0000'><t align='right'>%1</t></t><br />" ,MAIN_ROTOR_STAT];
	_text6 = parseText Format["Tail Rotor : <t color='#ff0000'><t align='right'>%1</t></t><br />" ,TAIL_ROTOR_STAT];
	_text7 = parseText Format["Fuel Tank : <t color='#ff0000'><t align='right'>%1</t></t><br />" ,AIR_FUEL_STAT];
	_text8 = parseText Format["Hull : <t color='#ff0000'><t align='right'>%1</t></t><br />" ,AIR_HULL_STAT];
	_text9 = parseText Format["Avionics : <t color='#ff0000'><t align='right'>%1</t></t><br />" ,AVIONICS_STAT];
	_text10 = parseText Format["<t color='#FFFF00'>-------------------------------</t><br />Fuel Level : <t color='#00FFFF'><t align='right'>%1</t>",OIL_STAT];
	
	if (!TAAShowPercentOfDamage) then
	{
		_text1 = parseText Format["<t color='#FFFF00'>Type of Aircraft :</t><t color='#00FFFF'> %1</t>%<br /><t color='#FFFF00'>-------------------------------</t><br /><t color='#FFA500'><t align='right'>State</t></t><br />" ,_vehname];
		_text2 = parseText Format["Engine 1 : <t color='#00FF00'><t align='right'>%1</t></t><br />" ,AIR_ENGINE_STAT];
		_text3 = parseText Format["Engine 2 : <t color='#00FF00'><t align='right'>%1</t></t><br />" ,AIR_ENGINE_STAT2];
		_text4 = parseText Format["Engine 3 : <t color='#00FF00'><t align='right'>%1</t></t><br />" ,AIR_ENGINE_STAT3];
		_text5 = parseText Format["Main Rotor : <t color='#00FF00'><t align='right'>%1</t></t><br />" ,MAIN_ROTOR_STAT];
		_text6 = parseText Format["Tail Rotor : <t color='#00FF00'><t align='right'>%1</t></t><br />" ,TAIL_ROTOR_STAT];
		_text7 = parseText Format["Fuel Tank : <t color='#00FF00'><t align='right'>%1</t></t><br />" ,AIR_FUEL_STAT];
		_text8 = parseText Format["Hull : <t color='#00FF00'><t align='right'>%1</t></t><br />" ,AIR_HULL_STAT];
		_text9 = parseText Format["Avionics : <t color='#00FF00'><t align='right'>%1</t></t><br />" ,AVIONICS_STAT];
		_text10 = parseText Format["<t color='#FFFF00'>-------------------------------</t><br />Fuel Level : <t color='#00FFFF'><t align='right'>%1</t>",OIL_STAT];
	};
	
	if (!AIRENGI1) then
	{
		_text2 = parseText Format[""];
	};
	
	if (!AIRENGI2) then
	{
		_text3 = parseText Format[""];
	};
	
	if (!AIRENGI3) then
	{
		_text4 = parseText Format[""];
	};
	
	if (!MROTOR) then
	{
		_text5 = parseText Format[""];
	};
	
	if (!TROTOR) then
	{
		_text6 = parseText Format[""];
	};
	
	if (!AIRFUEL) then
	{
		_text7 = parseText Format[""];
	};
	
	if (!AVNICS) then
	{
		_text9 = parseText Format[""];
	};
	
	if (!AIRHULL) then
	{
		_text8 = parseText Format[""];
	};
	
	if (!TAAFuelSystem ) then
	{
		_text10 = parseText Format[""];
	};
	
	hint "Checking Aircraft .";
	sleep 0.5;
	hint "Checking Aircraft ..";
	sleep 0.5;
	hint "Checking Aircraft ...";
	sleep 0.5;
	hint "Checking Aircraft ....";
	sleep 0.5;
	hint "";
	
	_textf = composeText [_text1,_text2,_text3,_text4,_text5,_text6,_text7,_text8,_text9,_text10]; 
	[_textf , "[TAA] Realistic Repair ", true, false] call BIS_fnc_GUImessage;
	
	Aircrafthasbeencheck = true;
	vehiclehasbeencheckforrefuel = true;
	if ( OIL_STAT == 100 ) then
	{
		TankFULL = true;
	}
	else
	{
		TankFULL = false;
	};	
};

TAA_Air_Repairing =
{
	if ("ToolKit" in (items player)) then
	{
		_Time_For_Repair_Air = 0;
		if (TAAShowPercentOfDamage) then{
		if (AIRENGI1) then
		{
			if ( AIR_ENGINE_STAT != 0 ) then
			{
				if ( AIR_ENGINE_STAT >= 50 ) then
				{
					if ( AIR_ENGINE_STAT > 80 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_over80;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_between50and80;
					};
				};
				if ( AIR_ENGINE_STAT < 50 ) then
				{
					if ( AIR_ENGINE_STAT > 25 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_between25and50;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_below25;
					};
				};
			};	
		};	
		
		
		if (AIRENGI2) then
		{
			if ( AIR_ENGINE_STAT2 != 0 ) then
			{
				if ( AIR_ENGINE_STAT2 >= 50 ) then
				{
					if ( AIR_ENGINE_STAT2 > 80 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_over80;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_between50and80;
					};
				};
				if ( AIR_ENGINE_STAT2 < 50 ) then
				{
					if ( AIR_ENGINE_STAT2 > 25 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_between25and50;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_below25;
					};
				};
			};	
		};		
		
		
		if (AIRENGI3) then
		{
			if ( AIR_ENGINE_STAT3 != 0 ) then
			{
				if ( AIR_ENGINE_STAT3 >= 50 ) then
				{
					if ( AIR_ENGINE_STAT3 > 80 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_over80;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_between50and80;
					};
				};
				if ( AIR_ENGINE_STAT3 < 50 ) then
				{
					if ( AIR_ENGINE_STAT3 > 25 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_between25and50;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_below25;
					};
				};
			};	
		};
		
		
		if (MROTOR) then
		{
			if ( MAIN_ROTOR_STAT != 0 ) then
			{
				if ( MAIN_ROTOR_STAT >= 50 ) then
				{
					if ( MAIN_ROTOR_STAT > 80 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Main_Rotor_damage_over80;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Main_Rotor_damage_between50and80;
					};
				};
				if ( MAIN_ROTOR_STAT < 50 ) then
				{
					if ( MAIN_ROTOR_STAT > 25 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Main_Rotor_damage_between25and50;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Main_Rotor_damage_below25;
					};
				};
			};	
		};
		
		
		if (TROTOR) then
		{
			if ( TAIL_ROTOR_STAT != 0 ) then
			{
				if ( TAIL_ROTOR_STAT >= 50 ) then
				{
					if ( TAIL_ROTOR_STAT > 80 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Tail_Rotor_damage_over80;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Tail_Rotor_damage_between50and80;
					};
				};
				if ( TAIL_ROTOR_STAT < 50 ) then
				{
					if ( TAIL_ROTOR_STAT > 25 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Tail_Rotor_damage_between25and50;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Tail_Rotor_damage_below25;
					};
				};
			};	
		};
		
		
		if (AIRFUEL) then
		{
			if ( AIR_FUEL_STAT != 0 ) then
			{
				if ( AIR_FUEL_STAT >= 50 ) then
				{
					if ( AIR_FUEL_STAT > 80 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Fuel_damage_over80;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Fuel_damage_between50and80;
					};
				};
				if ( AIR_FUEL_STAT < 50 ) then
				{
					if ( AIR_FUEL_STAT > 25 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Fuel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Fuel_damage_below25;
					};
				};
			};	
		};		
		
		
		if (AVNICS) then
		{
			if (AVIONICS_STAT != 0 ) then
			{
				if ( AVIONICS_STAT >= 50 ) then
				{
					if ( AVIONICS_STAT > 80 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Avionics_damage_over80;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Avionics_damage_between50and80;
					};
				};
				if ( AVIONICS_STAT < 50 ) then
				{
					if ( AVIONICS_STAT > 25 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Avionics_damage_between25and50;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Avionics_damage_below25;
					};
				};
			};	
		};			
		
		
		if (AIRHULL) then
		{
			if ( AIR_HULL_STAT != 0 ) then
			{
				if ( AIR_HULL_STAT >= 50 ) then
				{
					if ( AIR_HULL_STAT > 60 ) then
					{
						if ( AIR_HULL_STAT > 70 ) then
						{
							if ( AIR_HULL_STAT > 80 ) then
							{
								if ( AIR_HULL_STAT > 90 ) then
								{
									_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between80and90;
								}
								else
								{	
									_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between90and100;
								};
							}
							else
							{
								_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between70and80;
							};
						}
						else
						{
							_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between60and70;
						};
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between50and60;
					};
				};
				if ( AIR_HULL_STAT < 50 ) then
				{
					if ( AIR_HULL_STAT < 40 ) then
					{
						if ( AIR_HULL_STAT < 30 ) then
						{
							if ( AIR_HULL_STAT < 20 ) then
							{
								if ( AIR_HULL_STAT < 10 ) then
								{
									_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between0and10;
								}
								else
								{
									_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between10and20;
								};
							}
							else
							{
								_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between20and30;
							};
						}
						else
						{
							_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between30and40;
						};
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between40and50;
					};
				};
			};
		};
		}// ********************************************************************************************************************************************************************
		else{ //Change if you want to see the state ********************************************************************************************************************************************************************
		if (AIRENGI1) then // ********************************************************************************************************************************************************************
		{
			if ( AIR_ENGINE_STAT != 100 ) then
			{
				if ( AIR_ENGINE_STAT <= 50 ) then
				{
					if ( AIR_ENGINE_STAT < 20 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_over80;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_between50and80;
					};
				};
				if ( AIR_ENGINE_STAT > 50 ) then
				{
					if ( AIR_ENGINE_STAT < 75 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_between25and50;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_below25;
					};
				};
			};	
		};	
		
		
		if (AIRENGI2) then
		{
			if ( AIR_ENGINE_STAT2 != 100 ) then
			{
				if ( AIR_ENGINE_STAT2 <= 50 ) then
				{
					if ( AIR_ENGINE_STAT2 < 20 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_over80;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_between50and80;
					};
				};
				if ( AIR_ENGINE_STAT2 > 50 ) then
				{
					if ( AIR_ENGINE_STAT2 < 75 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_between25and50;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_below25;
					};
				};
			};	
		};		
		
		
		if (AIRENGI3) then
		{
			if ( AIR_ENGINE_STAT3 != 100 ) then
			{
				if ( AIR_ENGINE_STAT3 <= 50 ) then
				{
					if ( AIR_ENGINE_STAT3 < 20 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_over80;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_between50and80;
					};
				};
				if ( AIR_ENGINE_STAT3 > 50 ) then
				{
					if ( AIR_ENGINE_STAT3 < 75 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_between25and50;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Engine_damage_below25;
					};
				};
			};	
		};
		
		
		if (MROTOR) then
		{
			if ( MAIN_ROTOR_STAT != 100 ) then
			{
				if ( MAIN_ROTOR_STAT <= 50 ) then
				{
					if ( MAIN_ROTOR_STAT < 20 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Main_Rotor_damage_over80;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Main_Rotor_damage_between50and80;
					};
				};
				if ( MAIN_ROTOR_STAT > 50 ) then
				{
					if ( MAIN_ROTOR_STAT < 75 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Main_Rotor_damage_between25and50;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Main_Rotor_damage_below25;
					};
				};
			};	
		};
		
		
		if (TROTOR) then
		{
			if ( TAIL_ROTOR_STAT != 100 ) then
			{
				if ( TAIL_ROTOR_STAT <= 50 ) then
				{
					if ( TAIL_ROTOR_STAT < 20 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Tail_Rotor_damage_over80;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Tail_Rotor_damage_between50and80;
					};
				};
				if ( TAIL_ROTOR_STAT > 50 ) then
				{
					if ( TAIL_ROTOR_STAT < 75 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Tail_Rotor_damage_between25and50;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Tail_Rotor_damage_below25;
					};
				};
			};	
		};
		
		
		if (AIRFUEL) then
		{
			if ( AIR_FUEL_STAT != 100 ) then
			{
				if ( AIR_FUEL_STAT <= 50 ) then
				{
					if ( AIR_FUEL_STAT < 20 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Fuel_damage_over80;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Fuel_damage_between50and80;
					};
				};
				if ( AIR_FUEL_STAT > 50 ) then
				{
					if ( AIR_FUEL_STAT < 75 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Fuel_damage_between25and50;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Fuel_damage_below25;
					};
				};
			};	
		};		
		
		
		if (AVNICS) then
		{
			if (AVIONICS_STAT != 100 ) then
			{
				if ( AVIONICS_STAT <= 50 ) then
				{
					if ( AVIONICS_STAT < 20 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Avionics_damage_over80;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Avionics_damage_between50and80;
					};
				};
				if ( AVIONICS_STAT > 50 ) then
				{
					if ( AVIONICS_STAT < 75 ) then
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Avionics_damage_between25and50;
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Avionics_damage_below25;
					};
				};
			};	
		};			
		
		
		if (AIRHULL) then
		{
			if ( AIR_HULL_STAT != 100 ) then
			{
				if ( AIR_HULL_STAT <= 50 ) then
				{
					if ( AIR_HULL_STAT < 40 ) then
					{
						if ( AIR_HULL_STAT < 30 ) then
						{
							if ( AIR_HULL_STAT < 20 ) then
							{
								if ( AIR_HULL_STAT < 10 ) then
								{
									_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between80and90;
								}
								else
								{	
									_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between90and100;
								};
							}
							else
							{
								_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between70and80;
							};
						}
						else
						{
							_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between60and70;
						};
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between50and60;
					};
				};
				if ( AIR_HULL_STAT > 50 ) then
				{
					if ( AIR_HULL_STAT > 60 ) then
					{
						if ( AIR_HULL_STAT > 70 ) then
						{
							if ( AIR_HULL_STAT > 80 ) then
							{
								if ( AIR_HULL_STAT > 90 ) then
								{
									_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between0and10;
								}
								else
								{
									_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between10and20;
								};
							}
							else
							{
								_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between20and30;
							};
						}
						else
						{
							_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between30and40;
						};
					}
					else
					{
						_Time_For_Repair_Air = _Time_For_Repair_Air + Air_Hull_damage_between40and50;
					};
				};
			};
		}; 
		};
		Repair_Time = _Time_For_Repair_Air;
		call TAA_reparation_timer;
	}
	else
	{
		TAA_NO_TOOLKIT call TAA_text;
	};	
};

TAA_Air_statute =
{
	private ["_target"];
	_target = cursorTarget;
	_return = false;
	if ( alive player && (damage _target) < 1 && !vehicleisbeingrepaired) then
	{
		_return = true;
	}
	else
	{
		_return = false;
	};
	_return
};