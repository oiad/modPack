class ZSC_Money_Display {
	idd = -1;
	fadeout = 0;
	fadein = 0;
	duration = 20;
	name= "ZSC_Money_Display";
	onLoad = "uiNamespace setVariable ['ZSC_Money_Display', _this select 0]";
	class controlsBackground {
		class ZSC_Status
		{
			idc = 4900;
			type = 13;
			size = 0.040;
            x = safezoneX + (safezoneW -0.35);
        	y = safezoneY + 0.43 * safezoneW;
			w = 0.35; h = 0.20;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "";
			style = 0x02;
			shadow = 2;
			font = "Zeppelin32";
			sizeEx = 0.023;
			class Attributes {
				align = "right";
			};
		};
	};
};
