/*
Author: SENSEI

Last modified: 8/5/2015

Description: TFAR clientside settings

		NOTE: created with TFAR 0.9.8 / TS 3.0.16
__________________________________________________________________*/
waitUntil {sleep 0.1; !isNil "SEN_TFAR_SW"};
// channels are zero based!! 0 means team is on ch 1

// COMMAND Net
_tfr_ch_command = 5;

// SUPPORT Net
_tfr_ch_support = 6; // LR

// SQUAD Net
_tfr_ch_alpha = 0;
_tfr_ch_bravo = 1;
_tfr_ch_charlie = 2;

_tfr_ch_crew = 3;
_tfr_ch_pilot = 4;

_default_add = -1;

// set defaults
// SEN_tfar_ch_sw = squad/team ch on short wave radio
// ex. All members of Alpha squad are on ch 2 by default

// SEN_tfar_add_sw = additional ch for short wave radio depending on comm net
// ex. plt_co is part of COMMAND Net, so additional ch is 6 by default

// SEN_tfar_ch_lr = long range radio default ch.
// players on SUPPORT Net are given LR radios by default

call {
	if (player getvariable ["St_team",""] isEqualTo "PTr_commander") exitWith {
		SEN_tfar_ch_sw = _tfr_ch_command;
		SEN_tfar_add_sw = _default_add;
		SEN_tfar_ch_lr = _tfr_ch_support;
	};
	
	if (player getvariable ["St_team",""] isEqualTo "PTr_alpha") exitWith {
		if (player getvariable ["SEN_commNet",""] isEqualTo "command") then {
			SEN_tfar_ch_sw = _tfr_ch_alpha;
			SEN_tfar_add_sw = _tfr_ch_command;
		} else {
			SEN_tfar_ch_sw = _tfr_ch_alpha;
			SEN_tfar_add_sw = _default_add;
		};
		SEN_tfar_ch_lr = _tfr_ch_support;
	};
	if (player getvariable ["St_team",""] isEqualTo "PTr_bravo") exitWith {
		if (player getvariable ["SEN_commNet",""] isEqualTo "command") then {
			SEN_tfar_ch_sw = _tfr_ch_bravo;
			SEN_tfar_add_sw = _tfr_ch_command;
		} else {
			SEN_tfar_ch_sw = _tfr_ch_bravo;
			SEN_tfar_add_sw = _default_add;
		};
		SEN_tfar_ch_lr = _tfr_ch_support;
	};
	if (player getvariable ["St_team",""] isEqualTo "PTr_charlie") exitWith {
		if (player getvariable ["SEN_commNet",""] isEqualTo "command") then {
			SEN_tfar_ch_sw = _tfr_ch_charlie;
			SEN_tfar_add_sw = _tfr_ch_command;
		} else {
			SEN_tfar_ch_sw = _tfr_ch_charlie;
			SEN_tfar_add_sw = _default_add;
		};
		SEN_tfar_ch_lr = _tfr_ch_support;
	};

	if (player getvariable ["St_team",""] isEqualTo "PTr_crew") exitWith {
		SEN_tfar_ch_sw = _tfr_ch_crew;
		SEN_tfar_add_sw = _default_add;
		SEN_tfar_ch_lr = _tfr_ch_support;
	};
	if (player getvariable ["St_team",""] isEqualTo "PTr_pilot") exitWith {
		SEN_tfar_ch_sw = _tfr_ch_pilot;
		SEN_tfar_add_sw = _default_add;
		SEN_tfar_ch_lr = _tfr_ch_support;
	};
};
[] call F_setRadioTFAR;