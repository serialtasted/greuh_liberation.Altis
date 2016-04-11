waitUntil { !isNil "save_is_loaded" };

[{
	_vehplayer = vehicle player;
	_allowed = [driver _vehplayer];
	
	if ( player distance ( [] call F_getNearestFob ) > GRLIB_fob_range && player distance ( getpos lhd ) > (GRLIB_fob_range + 50) && player distance ( getpos nimitz ) > (GRLIB_fob_range + 200) ) then {
		if ( cameraView == "External" && _vehplayer == cameraOn ) then {
			//if ( !( _vehplayer isKindOf "Tank" ) || !( player in _allowed ) ) then {
				_vehplayer switchCamera "Internal";
			//};
		};
	};
}, 0.1, []] call CBA_fnc_addPerFrameHandler;