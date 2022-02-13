REMOTEAMMOS = ["vn_mine_satchel_remote_02_ammo","vn_mine_m112_remote_ammo"];

REMOTECHARGES = ["ClaymoreDirectionalMine_Remote_Mag","SatchelCharge_Remote_Mag","DemoCharge_Remote_Mag","IEDUrbanBig_Remote_Mag","IEDLandBig_Remote_Mag","IEDUrbanSmall_Remote_Mag","IEDLandSmall_Remote_Mag","vn_mine_satchel_remote_02_mag","vn_mine_m112_remote_mag"];

[
	player,		// Object the action is attached to
	"Hack Remote Charge",		// Title of the action
	"custom\holdactions\holdAction_danger_ca.paa",	// Idle icon shown on screen
	"custom\holdactions\holdAction_danger_ca.paa",	// Progress icon shown on screen
	"( (typeOf cursorObject in REMOTEAMMOS) && (player distance cursorObject < 5) && (player getUnitTrait 'Engineer') && (count((items player) arrayIntersect ['vn_b_item_trapkit']) > 0) && (count((magazines player) arrayIntersect REMOTECHARGES) > 0))",	// Condition for the action to be shown
	"player distance cursorObject < 5",						// Condition for the action to progress
	{},	// Code executed when action starts
	{},	// Code executed on every progress tick
	{[cursorObject] call vn_mf_fnc_control_mine},// Code executed on completion
	{},	// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	13,													// Action duration [s]
	2,													// Priority
	false,											// Remove on completion
	false												// Show in unconscious state
] call BIS_fnc_holdActionAdd;
