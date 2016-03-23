[(call TFAR_fnc_activeSwRadio), SEN_tfar_ch_sw] call TFAR_fnc_setSwChannel;
[(call TFAR_fnc_activeSwRadio), SEN_tfar_add_sw] call TFAR_fnc_setAdditionalSwChannel;
[(call TFAR_fnc_ActiveSWRadio), tf_default_radioVolume] call TFAR_fnc_setSwVolume;

if ( (backpack player) isEqualTo SEN_TFAR_LR ) then {
	[(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, SEN_tfar_ch_lr] call TFAR_fnc_setLrChannel;
	[(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, tf_default_radioVolume] call TFAR_fnc_setLrVolume;
};

systemChat format["Your radio frequencies have been reseted to the default values."];