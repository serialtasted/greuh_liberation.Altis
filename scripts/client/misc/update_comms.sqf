while { true } do {
	_leader = leader group player;
	waitUntil { _leader != leader group player };
	
	if ( (_leader == player || (leader group player) == player) && !changing_class ) then {
		[] call F_assignComms;
	};
};