if ( isNil "al_monsoon_om" ) then { al_monsoon_om = false; };
if ( isNil "al_duststorm_on" ) then { al_duststorm_on = false; };
if ( isNil "tornadosino" ) then { tornadosino = "goof"; };

while { true } do { 
	if ( (fog > 0.2) && !al_monsoon_om && !al_duststorm_on && (tornadosino isEqualTo "goof") ) then { 
		5 setFog 0.2;
	};
	sleep 30;
};