class RscDisplaySimpleAmmoRepacker
{
	// GUI GRID
	#define GUI_GRID_X	(0)
	#define GUI_GRID_Y	(0)
	#define GUI_GRID_W	(0.025)
	#define GUI_GRID_H	(0.04)
	#define GUI_GRID_WAbs	(1)
	#define GUI_GRID_HAbs	(1)
	#define LIGHT 1,1,1,0.9
	#define DARK 0,0,0,0.9
	#define YELLOW 1,0.812,0.067,1
	idd = 291;
	onLoad = "uiNamespace setVariable ['RscDisplaySimpleAmmoRepacker', _this select 0]; [_this] ExecVM 'scarCODE\SimpleAmmoRepacker\sqf\onLoad.sqf'; playSound ['ZoomIn', true]";
	onUnLoad = "uiNamespace setVariable ['RscDisplaySimpleAmmoRepacker', displayNull]; playSound ['ZoomOut', true]";
	class RscPicture
	{
		deletable = 0;
		fade = 0;
		access = 0;
		type = 0;
		style = 2096;
		colorBackground[] = {0,0,0,0};
		colorText[] = {1,1,1,0.9};
		font = "PuristaMedium";
		sizeEx = 0;
		lineSpacing = 0;
		text = "";
		fixedWidth = 0;
		shadow = 0;
		tooltipColorText[] = {1,1,1,0.9};
		tooltipColorBox[] = {1,1,1,0.9};
		tooltipColorShade[] = {0,0,0,0.65};
	};
	class RscText
	{
		deletable = 0;
		fade = 0;
		access = 0;
		type = 0;
		colorBackground[] = {0,0,0,0};
		colorText[] = {1,1,1,0.9};
		text = "";
		fixedWidth = 0;
		style = 0;
		shadow = 0;
		colorShadow[] = {0,0,0,0.5};
		font = "PuristaLight";
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		linespacing = 1;
		tooltipColorText[] = {1,1,1,0.9};
		tooltipColorBox[] = {0,0,0,0};
		tooltipColorShade[] = {0,0,0,0.7};
	};
	class IGUIBack
	{
		type = 0;
		style = 128;
		text = "";
		colorText[] = {0,0,0,0};
		font = "PuristaMedium";
		sizeEx = 0;
		shadow = 0;
		colorbackground[] = {DARK};
	};
	class RscCombo
	{
		default = 0;
		maxHistoryDelay = 1;
		class ComboScrollBar
		{
			color[] =  {1,1,1,0.9};
			colorBackground[] = {0,0,0,0.3};
			width = 0.021;
			autoScrollEnabled = 0;

			colorActive[] = {1,1,1,0.9};
			colorDisabled[] = {1,1,1,0.3};
			thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
			arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		};
		style = "0x10 + 0x200";
		type = 4;
		font = "PuristaMedium";
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		shadow = 0;
		colorSelectBackground[] = {1,1,1,0.85};
		arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
		arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
		wholeHeight = 0.45;
		colorActive[] = {1,0,0,1};
		colorDisabled[] = {1,1,1,0.4};
		soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundselect",0.1,1};
		soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
		soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
		colorSelect[] = {0,0,0,1};
		colorText[] = {1,1,1,0.9};
		colorBackground[] = {0,0,0,0.8};
		colorScrollbar[] = {1,0,0,1};
		colorPicture[] = {1,1,1,0.9};
		colorPictureSelected[] = {1,1,1,0.9};
		colorPictureDisabled[] = {1,1,1,0.25};
		colorPictureRight[] = {1,1,1,0.9};
		colorPictureRightSelected[] = {1,1,1,0.9};
		colorPictureRightDisabled[] = {1,1,1,0.25};
		tooltipColorText[] = {1,1,1,0.9};
		tooltipColorBox[] = {1,1,1,0.9};
		tooltipColorShade[] = {0,0,0,0.65};
	};
	class RscButton
	{
		action = "";
		deletable = 0;
		fade = 0;
		access = 0;
		type = 1;
		default = 0;
		colorDisabled[] = {1,1,1,0.25};
		colorBackground[] = {0,0,0,0.7};
		colorBackgroundDisabled[] = {0,0,0,0.3};
		colorBackgroundActive[] = {0,0,0,1};
		colorFocused[] = {0,0,0,1};
		colorShadow[] = {0,0,0,0};
		colorBorder[] = {0,0,0,1};
		colorText[] = {YELLOW};
		style = 2;
		shadow = 0;
		font = "PuristaLight";
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		offsetX = 0;
		offsetY = 0;
		offsetPressedX = 0;
		offsetPressedY = 0;
		borderSize = 0;
		soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
		soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
		soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
		soundEscape[] =	{"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
	};
	class controls
	{
		class icon: RscPicture
		{
			style = 2096;
			fade = 1;
			idc = 1200;
			x = -6 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 6 * GUI_GRID_H;
			colorText[] = {1,1,1,0.9};
			colorBackground[] = {0,0,0,0};
		};
		class bgTitle: IGUIBack
		{
			idc = 2201;
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 20.17 * GUI_GRID_H + GUI_GRID_Y;
			w = 29 * GUI_GRID_W;
			h = 1.2 * GUI_GRID_H;
			colorBackground[] = {LIGHT};
			fade = 1;
		};
		class title: RscText
		{
			idc = 1000;
			text = "Simples Ammo reembalador"; //--- ToDo: Localize;
			x = 0.21 * GUI_GRID_W + GUI_GRID_X;
			y = 19.72 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			colorText[] = {DARK};
			fade = 1;
			font = "PuristaMedium";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
		};
		class bg: IGUIBack
		{
			idc = 2200;
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 0 * GUI_GRID_H;
			colorBackground[] = {0.09,0.09,0.09,0.95};
			fade = 1;
		};
		class comboSelectMag: RscCombo
		{
			idc = 2100;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22 * GUI_GRID_H + GUI_GRID_Y;
			w = 23 * GUI_GRID_W;
			h = 1.3 * GUI_GRID_H;
			colorBackground[] = {DARK};
			fade = 1;
			onLBSelChanged = "if (ctrlEnabled (_this select 0)) then { if (_this select 1 >= 0) then { _this ExecVM 'scarCODE\SimpleAmmoRepacker\sqf\onLbSelChanged.sqf' }}";
		};
		class submit: RscButton
		{
			idc = 1600;
			x = 24.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1.3 * GUI_GRID_H;
			colorBackground[] = {DARK};
			fade = 1;
			text = "Repack"; //--- ToDo: Localize;
		};
		class output: RscText
		{
			fade = 1;
			font = "PuristaLight";
			idc = 1001;
			text = "Loading..."; //--- ToDo: Localize;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 24.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 31 * GUI_GRID_W;
			h = 1.2 * GUI_GRID_H;
			colorText[] = {YELLOW};
			colorBackground[] = {DARK};
		};
	};
};
