
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

	private _possibleOutposts = [] call vn_mf_fnc_director_zones_in_range_of_outposts;

	if (mf_s_cia_build_cop || !(_possibleOutposts isEqualTo [])) then {
		["SUCCEEDED"] call _fnc_finishSubtask;
		["SUCCEEDED"] call _fnc_finishTask;
		mf_s_cia_build_cop = false;
	};
}];

_taskDataStore setVariable ["FINISH", {
	["CopBuilt"] remoteExec ["para_c_fnc_show_notification", allPlayers];
	mf_s_copBuilt = true;
}];
