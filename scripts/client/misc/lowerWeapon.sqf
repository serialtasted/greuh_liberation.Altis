if ( isNil "forceLowerWeapon" ) then { forceLowerWeapon = false };

waitUntil { !isNil "client_is_loaded" };
waitUntil { client_is_loaded && (player distance (getmarkerpos GRLIB_respawn_marker) > 50) };
waitUntil { (animationState player == "amovpercmstpsraswrfldnon" || animationState player == "amovpercmstpsraswpstdnon") };

while { true } do {
	_oldvehicle = vehicle player;
	waitUntil { vehicle player != _oldvehicle || forceLowerWeapon };
	waitUntil { 
		animationState player == "amovpercmstpsraswrfldnon" 
		|| animationState player == "amovpercmstpsraswpstdnon"
		|| animationState player == "amovpknlmstpsraswrfldnon"
		|| animationState player == "amovpknlmstpsraswpstdnon"
	};
	
	if ( stance player == "STAND" ) then {
		
		if ( vehicle player == player && alive player && isTouchingGround player && !(_oldvehicle isKindOf "StaticWeapon") ) then {
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
		
	} else {
	
		if ( stance player == "CROUCH" ) then {
			
			if ( vehicle player == player && alive player && isTouchingGround player && !(_oldvehicle isKindOf "StaticWeapon") ) then {
				if ( primaryWeapon player != "" ) then {
					player playMove "AmovPknlMstpSrasWrflDnon_AmovPknlMstpSlowWrflDnon";
					waitUntil { animationState player != "AmovPknlMstpSrasWrflDnon_AmovPknlMstpSlowWrflDnon" };
					player playMove "AmovPknlMstpSlowWrflDnon";
				} else {		
					player playMove "AmovPknlMstpSrasWpstDnon_AmovPknlMstpSlowWpstDnon";
					waitUntil { animationState player != "AmovPknlMstpSrasWpstDnon_AmovPknlMstpSlowWpstDnon" };
					player playMove "AmovPknlMstpSlowWpstDnon";
				};
			};
			
		};
		
	};
	
	forceLowerWeapon = false;
};