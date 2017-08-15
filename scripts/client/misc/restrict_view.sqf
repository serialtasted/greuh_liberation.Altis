waitUntil { !isNil "save_is_loaded" };

[{
	if ( player distance ( [] call F_getNearestFob ) > GRLIB_fob_range && player distance ( getpos startbase ) > (GRLIB_fob_range + 200) ) then {
		if (cameraOn isEqualTo (vehicle player) && {cameraView isEqualTo "EXTERNAL"}) then {
			player switchCamera "INTERNAL";
		};
	};
}, 0.1, []] call CBA_fnc_addPerFrameHandler;