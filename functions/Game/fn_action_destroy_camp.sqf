[
	player,		// Object the action is attached to
	localize "STR_vn_mf_destroy_camp",		// Title of the action
	"custom\holdactions\holdAction_destroy_ca.paa",	// Idle icon shown on screen
	"custom\holdactions\holdAction_destroy_ca.paa",	// Progress icon shown on screen
	"(typeOf cursorObject == 'Land_vn_o_shelter_06' && player distance cursorObject < 5)",	// Condition for the action to be shown
	"player distance cursorObject < 5",						// Condition for the action to progress
	{},	// Code executed when action starts
	{},	// Code executed on every progress tick
	{[cursorTarget] spawn vn_mf_fnc_destroy_camp},// Code executed on completion
	{},	// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	7,													// Action duration [s]
	100,													// Priority
	false,											// Remove on completion
	false												// Show in unconscious state
] call BIS_fnc_holdActionAdd;
