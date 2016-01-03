#include "CScommon.hpp"

class St_ClassSelector {
	idd = 2490;
	name = "St_ClassSelector";
	movingenable = false;
	enablesimulation = true;
	
	class controlsBackground {
		class CS_RscTitleBackground: CS_RscText
		{
			colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])" };
			idc = -1;
			x = 0.0125;
			y = 0;
			w = 0.974999;
			h = 0.095;
		};
		class MainBackground: CS_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.0125;
			y = 0.1;
			w = 0.975;
			h = 0.88;
		};
	};
	
	class controls {
		// ---------------------------------------------------- WINDOW TITLE
		class CS_Title: CS_RscText
		{
			idc = -1;
			text = "Pick your class:";
			x = 0.014;
			y = 0;
			w = 0.5;
			h = 0.095;
			sizeEx = 0.05;
		};
		
		// ---------------------------------------------------- PANELS
		class block_assault: CS_RscText
		{
			colorBackground[] = {0.2,0.2,0.2,0.5};
			idc = 2201;
			x = 0.0375;
			y = 0.14;
			w = 0.45;
			h = 0.1;
		};
		class block_grenadier: CS_RscText
		{
			colorBackground[] = {0.2,0.2,0.2,0.5};
			idc = 2202;
			x = 0.5125;
			y = 0.14;
			w = 0.45;
			h = 0.1;
		};
		class block_medic: CS_RscText
		{
			colorBackground[] = {0.2,0.2,0.2,0.5};
			idc = 2200;
			x = 0.0375;
			y = 0.26;
			w = 0.45;
			h = 0.1;
		};
		class block_engineer: CS_RscText
		{
			colorBackground[] = {0.2,0.2,0.2,0.5};
			idc = 2203;
			x = 0.5125;
			y = 0.26;
			w = 0.45;
			h = 0.1;
		};
		class block_at: CS_RscText
		{
			colorBackground[] = {0.2,0.2,0.2,0.5};
			idc = 2204;
			x = 0.0375;
			y = 0.38;
			w = 0.45;
			h = 0.1;
		};
		class block_aa: CS_RscText
		{
			colorBackground[] = {0.2,0.2,0.2,0.5};
			idc = 2205;
			x = 0.5125;
			y = 0.38;
			w = 0.45;
			h = 0.1;
		};
		class block_ar: CS_RscText
		{
			colorBackground[] = {0.2,0.2,0.2,0.5};
			idc = 2206;
			x = 0.0375;
			y = 0.5;
			w = 0.45;
			h = 0.1;
		};
		class block_jtac: CS_RscText
		{
			colorBackground[] = {0.2,0.2,0.2,0.5};
			idc = 2207;
			x = 0.5125;
			y = 0.5;
			w = 0.45;
			h = 0.1;
		};
		class block_marksman: CS_RscText
		{
			colorBackground[] = {0.2,0.2,0.2,0.5};
			idc = 2208;
			x = 0.0375;
			y = 0.62;
			w = 0.45;
			h = 0.1;
		};
		class block_sniper: CS_RscText
		{
			colorBackground[] = {0.2,0.2,0.2,0.5};
			idc = 2209;
			x = 0.5125;
			y = 0.62;
			w = 0.45;
			h = 0.1;
		};
		class block_pilot: CS_RscText
		{
			colorBackground[] = {0.2,0.2,0.2,0.5};
			idc = 2210;
			x = 0.0375;
			y = 0.74;
			w = 0.45;
			h = 0.1;
		};
		class block_crew: CS_RscText
		{
			colorBackground[] = {0.2,0.2,0.2,0.5};
			idc = 2211;
			x = 0.5125;
			y = 0.74;
			w = 0.45;
			h = 0.1;
		};
		class block_fso: CS_RscText
		{
			colorBackground[] = {0.2,0.2,0.2,0.5};
			idc = 2212;
			x = 0.0375;
			y = 0.86;
			w = 0.45;
			h = 0.1;
		};
		class block_commander: CS_RscText
		{
			colorBackground[] = {0.2,0.2,0.2,0.5};
			idc = 2213;
			x = 0.5125;
			y = 0.86;
			w = 0.45;
			h = 0.1;
		};
		
		// ---------------------------------------------------- LABELS
		
		// Kit Name
		class txt_assault: CS_RscText
		{
			idc = 1000;
			text = "Assault";
			x = 0.05;
			y = 0.16;
			w = 0.30;
			h = 0.025;
			sizeEx = 0.03;
		};
		class txt_grenadier: CS_RscText
		{
			idc = 1001;
			text = "Grenadier";
			x = 0.525;
			y = 0.16;
			w = 0.30;
			h = 0.025;
			sizeEx = 0.03;
		};
		class txt_medic: CS_RscText
		{
			idc = 1002;
			text = "Medic";
			x = 0.05;
			y = 0.28;
			w = 0.30;
			h = 0.02;
			sizeEx = 0.03;
		};
		class txt_engineer: CS_RscText
		{
			idc = 1003;
			text = "Engineer";
			x = 0.525;
			y = 0.28;
			w = 0.30;
			h = 0.025;
			sizeEx = 0.03;
		};
		class txt_at: CS_RscText
		{
			idc = 1004;
			text = "Anti-Tank Rifleman";
			x = 0.05;
			y = 0.4;
			w = 0.30;
			h = 0.025;
			sizeEx = 0.03;
		};
		class txt_aa: CS_RscText
		{
			idc = 1005;
			text = "Anti-Aircraft Rifleman";
			x = 0.525;
			y = 0.4;
			w = 0.30;
			h = 0.025;
			sizeEx = 0.03;
		};
		class txt_ar: CS_RscText
		{
			idc = 1006;
			text = "Auto-Rifleman";
			x = 0.05;
			y = 0.52;
			w = 0.30;
			h = 0.025;
			sizeEx = 0.03;
		};
		class txt_jtac: CS_RscText
		{
			idc = 1007;
			text = "Joint Terminal Attak Controller";
			x = 0.525;
			y = 0.52;
			w = 0.30;
			h = 0.025;
			sizeEx = 0.03;
		};
		class txt_marksman: CS_RscText
		{
			idc = 1008;
			text = "Marksman  / Spotter";
			x = 0.05;
			y = 0.64;
			w = 0.30;
			h = 0.025;
			sizeEx = 0.03;
		};
		class txt_sniper: CS_RscText
		{
			idc = 1009;
			text = "Recon Sniper / Spotter";
			x = 0.525;
			y = 0.64;
			w = 0.30;
			h = 0.025;
			sizeEx = 0.03;
		};
		class txt_pilot: CS_RscText
		{
			idc = 1010;
			text = "Pilot";
			x = 0.05;
			y = 0.76;
			w = 0.30;
			h = 0.025;
			sizeEx = 0.03;
		};
		class txt_crew: CS_RscText
		{
			idc = 1011;
			text = "Crew";
			x = 0.525;
			y = 0.76;
			w = 0.30;
			h = 0.025;
			sizeEx = 0.03;
		};
		class txt_fso: CS_RscText
		{
			idc = 1012;
			text = "Fire Support Officer";
			x = 0.05;
			y = 0.88;
			w = 0.30;
			h = 0.025;
			sizeEx = 0.03;
		};
		class txt_commander: CS_RscText
		{
			idc = 1013;
			text = "Commander";
			x = 0.525;
			y = 0.88;
			w = 0.30;
			h = 0.025;
			sizeEx = 0.03;
		};
		
		// Kit Availability
		class counter_assault: CS_RscText
		{
			idc = 1014;
			text = "Available kits: %1";
			x = 0.05;
			y = 0.2;
			w = 0.25;
			h = 0.02;
			sizeEx = 0.025;
			
			colorText[] = {1,1,1,1};
		};
		class counter_grenadier: CS_RscText
		{
			idc = 1015;
			text = "Available kits: %1";
			x = 0.525;
			y = 0.2;
			w = 0.25;
			h = 0.02;
			sizeEx = 0.025;
			
			colorText[] = {1,1,1,1};
		};
		class counter_medic: CS_RscText
		{
			idc = 1016;
			text = "Available kits: %1";
			x = 0.05;
			y = 0.32;
			w = 0.25;
			h = 0.02;
			sizeEx = 0.025;
			
			colorText[] = {1,1,1,1};
		};
		class counter_engineer: CS_RscText
		{
			idc = 1017;
			text = "Available kits: %1";
			x = 0.525;
			y = 0.32;
			w = 0.25;
			h = 0.02;
			sizeEx = 0.025;
			
			colorText[] = {1,1,1,1};
		};
		class counter_at: CS_RscText
		{
			idc = 1018;
			text = "Available kits: %1";
			x = 0.05;
			y = 0.44;
			w = 0.25;
			h = 0.02;
			sizeEx = 0.025;
			
			colorText[] = {1,1,1,1};
		};
		class counter_aa: CS_RscText
		{
			idc = 1019;
			text = "Available kits: %1";
			x = 0.525;
			y = 0.44;
			w = 0.25;
			h = 0.02;
			sizeEx = 0.025;
			
			colorText[] = {1,1,1,1};
		};
		class counter_ar: CS_RscText
		{
			idc = 1020;
			text = "Available kits: %1";
			x = 0.05;
			y = 0.56;
			w = 0.25;
			h = 0.02;
			sizeEx = 0.025;
			
			colorText[] = {1,1,1,1};
		};
		class counter_jtac: CS_RscText
		{
			idc = 1021;
			text = "Available kits: %1";
			x = 0.525;
			y = 0.56;
			w = 0.25;
			h = 0.02;
			sizeEx = 0.025;
			
			colorText[] = {1,1,1,1};
		};
		class counter_marksman: CS_RscText
		{
			idc = 1022;
			text = "Available kits: %1";
			x = 0.05;
			y = 0.68;
			w = 0.25;
			h = 0.02;
			sizeEx = 0.025;
			
			colorText[] = {1,1,1,1};
		};
		class counter_sniper: CS_RscText
		{
			idc = 1023;
			text = "Available kits: %1";
			x = 0.525;
			y = 0.68;
			w = 0.25;
			h = 0.02;
			sizeEx = 0.025;
			
			colorText[] = {1,1,1,1};
		};
		class counter_pilot: CS_RscText
		{
			idc = 1024;
			text = "Available kits: %1";
			x = 0.05;
			y = 0.8;
			w = 0.25;
			h = 0.02;
			sizeEx = 0.025;
			
			colorText[] = {1,1,1,1};
		};
		class counter_crew: CS_RscText
		{
			idc = 1025;
			text = "Available kits: %1";
			x = 0.525;
			y = 0.8;
			w = 0.25;
			h = 0.02;
			sizeEx = 0.025;
			
			colorText[] = {1,1,1,1};
		};
		class counter_fso: CS_RscText
		{
			idc = 1026;
			text = "Available kits: %1";
			x = 0.05;
			y = 0.92;
			w = 0.25;
			h = 0.02;
			sizeEx = 0.025;
			
			colorText[] = {1,1,1,1};
		};
		class counter_commander: CS_RscText
		{
			idc = 1027;
			text = "Available kits: %1";
			x = 0.525;
			y = 0.92;
			w = 0.25;
			h = 0.02;
			sizeEx = 0.025;
			
			colorText[] = {1,1,1,1};
		};
		
		// ---------------------------------------------------- BUTTONS
		class btn_assault: CS_RscButtonMenu
		{
			idc = 2400;
			text = "Select";
			colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5 };
			onButtonClick = " CSclosed = true; classtogo = 'assault'; closeDialog 0; ";
			x = 0.35;
			y = 0.16;
			w = 0.125;
			h = 0.04;
		};
		class btn_grenadier: CS_RscButtonMenu
		{
			idc = 2401;
			text = "Select";
			colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5 };
			onButtonClick = " CSclosed = true; classtogo = 'grenadier'; closeDialog 0; ";
			x = 0.825;
			y = 0.16;
			w = 0.125;
			h = 0.04;
		};
		class btn_medic: CS_RscButtonMenu
		{
			idc = 2402;
			text = "Select";
			colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5 };
			onButtonClick = " CSclosed = true; classtogo = 'medic'; closeDialog 0; ";
			x = 0.353535;
			y = 0.279461;
			w = 0.125;
			h = 0.04;
		};
		class btn_engineer: CS_RscButtonMenu
		{
			idc = 2403;
			text = "Select";
			colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5 };
			onButtonClick = " CSclosed = true; classtogo = 'engineer'; closeDialog 0; ";
			x = 0.825;
			y = 0.28;
			w = 0.125;
			h = 0.04;
		};
		class btn_at: CS_RscButtonMenu
		{
			idc = 2404;
			text = "Select";
			colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5 };
			onButtonClick = " CSclosed = true; classtogo = 'at'; closeDialog 0; ";
			x = 0.35;
			y = 0.4;
			w = 0.125;
			h = 0.04;
		};
		class btn_aa: CS_RscButtonMenu
		{
			idc = 2405;
			text = "Select";
			colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5 };
			onButtonClick = " CSclosed = true; classtogo = 'aa'; closeDialog 0; ";
			x = 0.825;
			y = 0.4;
			w = 0.125;
			h = 0.04;
		};
		class btn_ar: CS_RscButtonMenu
		{
			idc = 2406;
			text = "Select";
			colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5 };
			onButtonClick = " CSclosed = true; classtogo = 'ar'; closeDialog 0; ";
			x = 0.35;
			y = 0.52;
			w = 0.125;
			h = 0.04;
		};
		class btn_jtac: CS_RscButtonMenu
		{
			idc = 2407;
			text = "Select";
			colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5 };
			onButtonClick = " CSclosed = true; classtogo = 'jtac'; closeDialog 0; ";
			x = 0.825;
			y = 0.52;
			w = 0.125;
			h = 0.04;
		};
		class btn_marksman: CS_RscButtonMenu
		{
			idc = 2408;
			text = "Select";
			colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5 };
			onButtonClick = " CSclosed = true; classtogo = 'marksman'; closeDialog 0; ";
			x = 0.35;
			y = 0.64;
			w = 0.125;
			h = 0.04;
		};
		class btn_sniper: CS_RscButtonMenu
		{
			idc = 2409;
			text = "Select";
			colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5 };
			onButtonClick = " CSclosed = true; classtogo = 'sniper'; closeDialog 0; ";
			x = 0.82197;
			y = 0.648148;
			w = 0.125;
			h = 0.04;
		};
		class btn_pilot: CS_RscButtonMenu
		{
			idc = 2410;
			text = "Select";
			colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5 };
			onButtonClick = " CSclosed = true; classtogo = 'pilot'; closeDialog 0; ";
			x = 0.35;
			y = 0.76;
			w = 0.125;
			h = 0.04;
		};
		class btn_crew: CS_RscButtonMenu
		{
			idc = 2411;
			text = "Select";
			colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5 };
			onButtonClick = " CSclosed = true; classtogo = 'crew'; closeDialog 0; ";
			x = 0.825;
			y = 0.76;
			w = 0.125;
			h = 0.04;
		};
		class btn_fso: CS_RscButtonMenu
		{
			idc = 2412;
			text = "Select";
			colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5 };
			onButtonClick = " CSclosed = true; classtogo = 'fso'; closeDialog 0; ";
			x = 0.35;
			y = 0.88;
			w = 0.125;
			h = 0.04;
		};
		class btn_commander: CS_RscButtonMenu
		{
			idc = 2413;
			text = "Select";
			colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5 };
			onButtonClick = " CSclosed = true; classtogo = 'commander'; closeDialog 0; ";
			x = 0.825;
			y = 0.88;
			w = 0.125;
			h = 0.04;
		};
		class btn_close: CS_RscButtonMenu
		{
			idc = 2414;
			text = "Cancel";
			onButtonClick = " CSclosed = true; closeDialog 0; ";
			x = 0.8625;
			y = 0.985;
			w = 0.125;
			h = 0.04;
		};
	};
};