params [ ["_effectType", "woodland"] ];

_colorPreset = [];
switch ( _effectType ) do {
	case "desert": { _colorPreset = [0.88, 0.88, 0, [0.2, 0.29, 0.4, -0.22], [1, 1, 1, 1.3], [0.15, 0.09, 0.09, 0.0]] };
	case "tropical": { _colorPreset = [0.9, 0.9, 0, [0, 0.1, 0.25, -0.14], [1, 1, 1, 1.26], [0.15, 0.09, 0.09, 0.0]] };
	case "winter": { _colorPreset = [0.88, 0.9, 0, [0.2, 0.2, 1.0, 0.0], [0.4, 0.75, 1.0, 0.60], [0.5,0.3,1.0,-0.1]] };
	case "woodland": { _colorPreset = [0.88, 0.88, 0, [0.2, 0.29, 0.4, -0.22], [1, 1, 1, 1.3], [0.15, 0.09, 0.09, 0.0]] };
};

"ColorCorrections" ppEffectEnable true;
"ColorCorrections" ppEffectAdjust _colorPreset;
"ColorCorrections" ppEffectCommit 0;