
/*
 * Task Parameters:
 *    None
 * Subtask Parameters:
 * 	  None
 * Runtime Parameters:
 *    None
 */

params ["_taskDataStore"];

_taskDataStore setVariable ["INIT", {
	params ["_taskDataStore"];

	[[
		["build"]
	]] call _fnc_initialSubtasks;
}];

_taskDataStore setVariable ["build", {
	params ["_taskDataStore"];

	if (mf_s_cia_place_flag || mf_s_baseFlagBuilt) then {
		["SUCCEEDED"] call _fnc_finishSubtask;
		["SUCCEEDED"] call _fnc_finishTask;
		mf_s_cia_place_flag = false;
	};
}];

_taskDataStore setVariable ["FINISH", {
	mf_s_flagPlaced = true;
}];
