while { true } do {
	
	waitUntil { alive player };

	waitUntil { sleep 0.2;
		vehicle player == player
	};

	waitUntil { sleep 0.2;
		(vehicle player != player) && ( ( (vehicle player ) getCargoIndex player ) < 0 );
	};
	
	// setup vehicle radio if present
	if ( (vehicle player) call TFAR_fnc_hasVehicleRadio ) then {
		[(player call TFAR_fnc_vehicleLr) select 0, (player call TFAR_fnc_vehicleLr) select 1, SEN_tfar_ch_lr] call TFAR_fnc_setLrChannel;
	};
	
};