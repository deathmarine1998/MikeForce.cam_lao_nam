MINEAMMOS=["ATMine_Range_Ammo","APERSMine_Range_Ammo","APERSBoundingMine_Range_Ammo","SLAMDirectionalMine_Wire_Ammo","APERSTripMine_Wire_Ammo","UnderwaterMine_Range_Ammo","UnderwaterMineAB_Range_Ammo","UnderwaterMinePDM_Range_Ammo","SatchelCharge_Remote_Ammo","DemoCharge_Remote_Ammo","ClaymoreDirectionalMine_Remote_Ammo","IEDUrbanBig_Remote_Ammo","IEDLandBig_Remote_Ammo","IEDUrbanSmall_Remote_Ammo","IEDLandSmall_Remote_Ammo","vn_mine_m18_ammo","vn_mine_m18_x3_ammo","vn_mine_m14_ammo","vn_mine_m16_ammo","vn_mine_tripwire_m16_02_ammo","vn_mine_tripwire_m16_04_ammo","vn_mine_tripwire_f1_02_ammo","vn_mine_tripwire_f1_04_ammo","vn_mine_tripwire_m49_02_ammo","vn_mine_tripwire_m49_04_ammo","vn_mine_tripwire_arty_ammo","vn_mine_satchel_remote_02_ammo","vn_mine_tm57_ammo","vn_mine_m15_ammo","vn_mine_m112_remote_ammo","vn_mine_punji_01_ammo","vn_mine_punji_02_ammo","vn_mine_punji_03_ammo","APERSMineDispenser_Mine_Ammo","APERSMineDispenser_Ammo","TrainingMine_Ammo"];

[
	player,		// Object the action is attached to
	"Deactivate Mine",		// Title of the action
	"custom\holdactions\holdAction_danger_ca.paa",	// Idle icon shown on screen
	"custom\holdactions\holdAction_danger_ca.paa",	// Progress icon shown on screen
	"( (typeOf cursorObject in MINEAMMOS) && (player distance cursorObject < 5) && (player getUnitTrait 'Engineer') && (count((items player) arrayIntersect ['MineDetector','vn_b_item_trapkit']) > 0))",	// Condition for the action to be shown
	"player distance cursorObject < 5",						// Condition for the action to progress
	{},	// Code executed when action starts
	{},	// Code executed on every progress tick
	{[cursorObject] call vn_mf_fnc_deactivate_mine},// Code executed on completion
	{},	// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	13,													// Action duration [s]
	2,													// Priority
	false,											// Remove on completion
	false												// Show in unconscious state
] call BIS_fnc_holdActionAdd;
