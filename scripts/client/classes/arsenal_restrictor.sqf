waitUntil { !isNil "client_is_loaded" && !isNil "changing_class" };
waitUntil { client_is_loaded };

_usedTubes = [
	"rhs_weap_M136_used",
	"rhs_weap_M136_hedp_used",
	"rhs_weap_M136_hp_used",
	"rhs_weap_rsp30_white_used",
	"rhs_weap_rsp30_red_used",
	"rhs_weap_rsp30_green_used"
];

_notifyExplosives = [
	"rhs_mag_m67",
	"rhs_mag_m69",
	"rhs_mag_mk84",
	"rhs_mag_an_m8hc",
	"rhs_mag_an_m14_th3",
	"rhs_mag_m7a3_cs",
	"rhs_mag_mk3a2",
	"rhs_mag_m18_green",
	"rhs_mag_m18_purple",
	"rhs_mag_m18_red",
	"rhs_mag_m18_yellow",
	"Chemlight_green",
	"Chemlight_red",
	"Chemlight_yellow",
	"Chemlight_blue",
	"Laserbatteries",
	"ATMine_Range_Mag",
	"APERSMine_Range_Mag",
	"APERSBoundingMine_Range_Mag",
	"SLAMDirectionalMine_Wire_Mag",
	"APERSTripMine_Wire_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"SatchelCharge_Remote_Mag",
	"DemoCharge_Remote_Mag",
	"ACE_HandFlare_White",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Yellow", 
	"ACE_HuntIR_M203"
];

while { true } do {
	_unitPrimaryWeapon = primaryWeapon player;
	_unitHandgun = handgunWeapon player;
	_unitLauncher = secondaryWeapon player;
	_unitMagazines = magazines player;
	_unitHeadgear = headgear player;
	_unitUniform = uniform player;
	_unitVest = vest player;
	_unitBackpack = backpack player;
	_unitBinocular = binocular player;
	_unitItems = items player;
	_msg = "";
	
	waitUntil { 
		sleep 0.5;
		_magazinesDif = [_unitMagazines,(magazines player)] call BIS_fnc_areEqual;
		_itemsDif = [_unitItems,(items player)] call BIS_fnc_areEqual;
		(primaryWeapon player != _unitPrimaryWeapon || handgunWeapon player != _unitHandgun || secondaryWeapon player != _unitLauncher || !_magazinesDif || uniform player != _unitUniform || headgear player != _unitHeadgear || vest player != _unitVest || backpack player != _unitBackpack || binocular player != _unitBinocular || !_itemsDif) && !changing_class
	};
	
	if ( !( primaryWeapon player in arsenal_weapons ) && primaryWeapon player in all_arsenal_weapons && primaryWeapon player != "" ) then {
		_msg = format ["%1 is not allowed on your class.", ( (primaryWeapon player) call ISSE_Cfg_Weapons_GetName ) ];
		player removeWeapon (primaryWeapon player);
	};
	if ( !( handgunWeapon player in arsenal_weapons ) && handgunWeapon player in all_arsenal_weapons && handgunWeapon player != "" ) then {
		_msg = format ["%1 is not allowed on your class.", ( (handgunWeapon player) call ISSE_Cfg_Weapons_GetName ) ];
		player removeWeapon (handgunWeapon player);
	};
	if ( !( secondaryWeapon player in arsenal_weapons ) && secondaryWeapon player in all_arsenal_weapons && secondaryWeapon player != "" ) then {
		if ( !( secondaryWeapon player in _usedTubes ) ) then { _msg = format ["%1 is not allowed on your class.", ( (secondaryWeapon player) call ISSE_Cfg_Weapons_GetName ) ]; };
		player removeWeapon (secondaryWeapon player);
	};
	{
		if ( !( _x in arsenal_magazines ) && _x in all_arsenal_magazines ) then {
			if ( _x in _notifyExplosives ) then { _msg = format ["%1 is not allowed on your class.", ( _x call ISSE_Cfg_Magazine_GetName ) ]; };
			player removeMagazine _x;
		};
	} forEach magazines player;
	
	if ( !( headgear player in arsenal_items ) && headgear player in all_arsenal_items && headgear player != "" ) then {
		_msg = format ["%1 is not allowed on your class.", ( (headgear player) call ISSE_Cfg_Items_GetName )];
		removeHeadgear player;
	};
	if ( !( uniform player in arsenal_items ) && uniform player in all_arsenal_items && uniform player != "" ) then {
		_msg = format ["%1 is not allowed on your class.", ( (uniform player) call ISSE_Cfg_Items_GetName )];
		removeUniform player;
	};
	if ( !( vest player in arsenal_items ) && vest player in all_arsenal_items && vest player != "" ) then {
		_msg = format ["%1 is not allowed on your class.", ( (vest player) call ISSE_Cfg_Items_GetName )];
		removeVest player;
	};
	if ( !( backpack player in arsena_backpacks ) && backpack player in all_arsena_backpacks && backpack player != "" ) then {
		_msg = format ["%1 is not allowed on your class.", ( (backpack player) call ISSE_Cfg_Items_GetName )];
		removeBackpack player;
	};
	
	if ( !( binocular player in arsenal_weapons ) && binocular player in all_arsenal_weapons && binocular player != "" ) then {
		_msg = format ["%1 is not allowed on your class.", ( (binocular player) call ISSE_Cfg_Weapons_GetName )];
		player removeWeapon (binocular player);
	};
	
	{
		if ( !( _x in arsenal_items ) && _x in all_arsenal_items ) then {
			_msg = format ["%1 is not allowed on your class.", ( _x call ISSE_Cfg_Items_GetName )];
			player removeItem _x;
		};
	} forEach items player;
	
	systemChat _msg;
};