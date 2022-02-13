//included by "ui_tr_base.hpp"

class vn_tr_disp_ciaPanel
{
	name = "vn_tr_disp_ciaPanel";
	//scriptName = "vn_tr_disp_ciaPanel";
	//scriptPath = "GUI";
	//If already opened -> Recalling it -> Reloading the Dialog (e.g. like updating the view, without "closing" it)
	onLoad = "[""onLoad"",_this,""vn_tr_disp_ciaPanel"",''] call 	(uinamespace getvariable 'BIS_fnc_initDisplay'); _this call vn_mf_fnc_tr_ciaPanel_init;";
	onUnload = "[""onUnload"",_this,""vn_tr_disp_ciaPanel"",''] call 	(uinamespace getvariable 'BIS_fnc_initDisplay'); [] spawn vn_mf_fnc_tr_overview_init;";
	idd = VN_TR_CIAPANEL_IDC;
	movingEnable = 1;
	enableSimulation = 1;
	
	
	class ControlsBackground
	{
		class folderBackground: vn_mf_RscPicture
		{
			idc = -1;
			x = VN_TR_FOLDER_X;
			y = VN_TR_FOLDER_Y;
			w = VN_TR_FOLDER_W;
			h = VN_TR_FOLDER_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,1};
			text = "\vn\ui_f_vietnam\ui\taskroster\img\tr_folder_background_sheetL.paa";
		};
		
		//MUST be in the background, otherwise it could "pop up", when clicking on it, covering up the cordles (silly Arma, y u do dis? :sad:)
		class vn_sheet_clean_R: vn_sheet_clean_R_base
		{
			idc = -1;
		};
	};
	
	
	
	class Controls
	{

		class vn_tr_ciaPanel: vn_tr_ciaPanel_base
		{
			idc = VN_TR_CIAPANEL_PHOENIX_PROGRAM_IDC;
		};
		
		class vn_tr_player_LB: vn_mf_RscListNBox //vn_mf_RscListBox
		{
			idc = VN_TR_CIAPANEL_PLAYER_LISTBOX_IDC;
			
			x = UIX_CL(17);
			y = UIY_CU(0.45);
			w = UIW(20);
			h = UIH(15);
			
			
			//columns[] = {	0,									1,						2,						3 };
			//columns[] = {	(Symbol: Support/Main/Seconday),	(Symbol: MissionType),	(Text: Description),	(Data/Placeholder)};
			columns[] = {0.0,UIW(2.25),UIW(4.25),UIW(5)};
			
			
			//colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,1};
			
			colorText[] = {0,0,0,1}; // Text and frame color
			colorSelect[] = {0,0,0,1}; // Text selection color
			colorSelect2[] = {0,0,0,1}; // Text selection color (oscillates between this and colorSelect)
			colorDisabled[] = {1,1,1,0.5}; // Disabled text color
			colorShadow[] = {0,0,0,0.5}; // Text shadow color (used only when shadow is 1)
			
			colorPicture[] = {0.2,0.2,0.2,1};
			colorPictureSelected[] = {0.9,0.9,0.9,1};
			colorPictureDisabled[] = {0,0,0,1};
			
			onLBSelChanged = "VN_MF_PHOENIX_PLAYER_LIST_BOX_SELECTION = _this;";
			onLBDblClick = "";
		};
		
		class Teleport2Player: vn_mf_RscButton
		{
			idc = VN_TR_CIAPANEL_TP2_PLAYER_IDC;
			text = "TP2PLAYER";
			x = UIX_CL(3);
			y = UIY_CU(3);
			w = UIW(4);
			h = UIH(1);
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			onMouseButtonClick = "player setPOS (getPos VN_MF_PHOENIX_PLAYER_LIST_BOX_SELECTION)";
		};

		//ALWAYS AT THE BOTTOM/LAST OF THE CONTROLS!
		class folder_cordels: vn_tr_cordels
		{};
	};
};