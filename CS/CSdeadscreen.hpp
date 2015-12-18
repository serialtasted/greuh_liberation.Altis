class St_DeadScreen {
	idd = 2490;
	name = "St_DeadScreen";
	movingenable = false;
	enablesimulation = true;
	
	class controls {		
		class btn_giveup: CS_RscButtonMenu
		{
			idc = 2414;
			text = "Give Up";
			colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5 };
			onButtonClick = " player setDamage 1; closeDialog 0; ";
			x = 0.8625;
			y = 0.985;
			w = 0.125;
			h = 0.04;
		};
	};
};