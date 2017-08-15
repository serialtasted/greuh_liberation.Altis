class St_DeadScreen {
	idd = 2491;
	name = "St_DeadScreen";
	movingenable = false;
	enablesimulation = true;

	class controls {	
		class btn_giveup : CS_RscButtonMenu  {
			idc = 2450;
			x = 0.45 * safezoneW + safezoneX;
			y = 0.75 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
			text = "Respawn";
			onButtonClick = " deadDiag = false; player setDamage 1; closeDialog 0; ";
		};
		class txt_revivelabel : CS_RscText{
			idc = 2451;
			type =  CT_STATIC;
			style = ST_CENTER;
			colorText[] = COLOR_WHITE;
			colorBackground[] = COLOR_NOALPHA;
			font = FontM;
			sizeEx = 0.02 * safezoneH;
			shadow = 0.5;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.025 * safezoneH;
			text = "";
		};
		class txt_woundlabel : CS_RscText {
			idc = 2452;
			type =  CT_STATIC;
			style = ST_CENTER;
			colorText[] = COLOR_WHITE;
			colorBackground[] = COLOR_NOALPHA;
			font = FontM;
			sizeEx = 0.04 * safezoneH;
			shadow = 0.5;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.07 * safezoneH;
			text = $STR_REVIVE_LABEL;
		};
	};
};