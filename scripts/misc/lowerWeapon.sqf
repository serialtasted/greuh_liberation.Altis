if ( isNil "greuh_liberation_client" ) then {
	if ( primaryWeapon player != "" ) then {
		player playMove "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";
		waitUntil { animationState player != "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon" };
		player playMove "AmovPercMstpSlowWrflDnon";
	} else {
		player playMove "AmovPercMstpSrasWpstDnon_AmovPercMstpSlowWpstDnon";
		waitUntil { animationState player != "AmovPercMstpSrasWpstDnon_AmovPercMstpSlowWpstDnon" };
		player playMove "AmovPercMstpSlowWpstDnon";
	};
};

while { true } do {
	_oldvehicle = vehicle player;
	waitUntil { vehicle player != _oldvehicle };
	if ( vehicle player == player && alive player && !surfaceIsWater position player ) then {
		if ( primaryWeapon player != "" ) then {
			player playMove "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";
			waitUntil { animationState player != "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon" };
			player playMove "AmovPercMstpSlowWrflDnon";
		} else {		
			player playMove "AmovPercMstpSrasWpstDnon_AmovPercMstpSlowWpstDnon";
			waitUntil { animationState player != "AmovPercMstpSrasWpstDnon_AmovPercMstpSlowWpstDnon" };
			player playMove "AmovPercMstpSlowWpstDnon";
		};
	};
};