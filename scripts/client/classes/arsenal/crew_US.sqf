/*
Whitelist Arsenal items and weapons

Created by: Serialtasted
*/

// set default loadout if classtogo is different from -1
if ( classtogo != "" ) then {

	comment "Add containers";
	player forceAddUniform "rhs_uniform_cu_ucp";
	player addVest "rhsusf_iotv_ucp";
	for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	player addHeadgear "rhsusf_cvc_green_helmet";

	comment "Add weapons";
	player addWeapon "rhs_weap_m16a4";
	player addPrimaryWeaponItem "FHQ_acc_LLM01L";
	player addPrimaryWeaponItem "FHQ_optic_AIM";
	
};



arsenal_weapons = [
	"Binocular",
	
	"rhs_weap_m16a4",
	"RH_usp",
	
	// flares
	"rhs_weap_rsp30_green"
];

arsenal_magazines = [
	"RH_12Rnd_45cal_usp",
	"rhs_mag_m18_purple",
	"ACE_HandFlare_Green",
	"rhs_mag_30Rnd_556x45_Mk318_Stanag"
];

arsenal_items = [
	"itemMap",
	"itemCompass",
	"itemWatch",
	
	"FHQ_acc_LLM01L",
	"FHQ_optic_AIM",
	
	"rhsusf_cvc_helmet",
	"rhsusf_cvc_green_helmet",
	
	"rhs_uniform_cu_ocp",
	"rhs_uniform_cu_ucp",
	
	"ACE_NVG_Wide",
	
	"RH_m6x",
	
	"ACE_Flashlight_XL50",
	"ACE_IR_Strobe_Item",
	"ACE_EarPlugs",
	
	"ACE_microDAGR",
	
	"ACE_elasticBandage",
	"ACE_morphine"
];

arsena_backpacks = [
	// parachute
	"B_Parachute"
];