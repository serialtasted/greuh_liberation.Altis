waitUntil { !isNil "chosen_weather" };
waitUntil { !isNil "al_monsoon_om" };

while { true } do {
	waitUntil { chosen_weather != 99 };
	3600 setOvercast chosen_weather;
	if ( overcast < 0.65 ) then { 2 setRain 0 };
	if ( overcast >= 0.65 && overcast < 0.85 ) then { 2 setRain 0.3 };
	if ( overcast >= 0.85 ) then { 2 setRain 0.6 }; // Removed heavy rain due to severe fps issues
	
	waitUntil { chosen_weather == 99; sleep 5; };
};