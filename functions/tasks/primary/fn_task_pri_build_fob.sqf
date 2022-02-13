/*
	File: fn_task_pri_build.sqf
	Author: Spoffy
	Date: 2020-05-22
	Last Update: 2020-05-22
	Public: No

	Description:
		Primary task to build an FOB near to a zone.
		Uses the state machine task system.

	Parameter(s):
		_taskDataStore - Namespace for storing task info [Object]

	Returns: nothing

	Example(s):
		Not directly called.
*/

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

	private _possibleBases = [] call vn_mf_fnc_director_zones_in_range_of_bases;

	if (mf_s_cia_build_fob || !(_possibleBases isEqualTo [])) then {
		["SUCCEEDED"] call _fnc_finishSubtask;
		["SUCCEEDED"] call _fnc_finishTask;
		mf_s_cia_build_fob = false;
	};
}];

_taskDataStore setVariable ["FINISH", {
	["BaseBuilt"] remoteExec ["para_c_fnc_show_notification", allPlayers];
	mf_s_baseBuilt = true;
}];
