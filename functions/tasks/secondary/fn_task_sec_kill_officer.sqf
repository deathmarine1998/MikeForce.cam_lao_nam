/*
    File: fn_task_sec_kill_officer.sqf
    Author: Spoffy
    Date: 2020-01-29
    Last Update: 2020-06-20
    Public: No

    Description:
        Find and kill the enemy officer.
		Uses the state machine task system.

    Parameter(s):
		_taskDataStore - Namespace for storing task info. [Object]

    Returns: nothing

    Example(s):
        Not directly called.
*/

/*
 * Task Parameters:
 *    None
 * Subtask Parameters:
 *	  None
 * Runtime Parameters:
 *    pos - Position to enemy officer at
 */

params ["_dataStore"];

_dataStore setVariable ["INIT", {
	params ["_taskDataStore"];

	private _zonePos = getMarkerPos (_taskDataStore getVariable "taskMarker");
	private _spawnPos =_taskDataStore getVariable ["pos", [_zonePos, 500, 1000, 0, 0] call BIS_fnc_findSafePos];

	if (count _spawnPos == 2) then {_spawnPos pushBack 0};

	private _buildings = [_spawnPos] call vn_mf_fnc_create_camp_buildings;

	private _officerGroup = [east] call para_g_fnc_create_group;
	private _officer = [_officerGroup, selectRandom units_vc_officer, _spawnPos getPos [random 5, random 360], [], 5, "NONE"] call para_g_fnc_create_unit;

	_taskDataStore setVariable ["campPos", _spawnPos];
	_taskDataStore setVariable ["officer", _officer];
	_taskDataStore setVariable ["buildings", _buildings];

	//Add inaccuracy to the marker, to force them to search.
	private _markerPos = [[[_spawnPos, 200]]] call BIS_fnc_randomPos;
	
	[[["kill_officer", _markerPos]]] call _fnc_initialSubtasks;
}];

_dataStore setVariable ["kill_officer", {
	params ["_taskDataStore"];

	if (alive (_taskDataStore getVariable "officer")) exitWith {};
	
	if (mf_s_cia_kill_officer || !(alive (_taskDataStore getVariable "officer")))then {
		["SUCCEEDED"] call _fnc_finishSubtask;
		["SUCCEEDED"] call _fnc_finishTask;
	};
}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];

	if( (_taskDataStore getVariable ["enemy_killed", false] && _taskDataStore getVariable ["suppliesDestroyed", false]	&& _taskDataStore getVariable ["sites_destroyed", false]) || (mf_s_cia_capture_zone) )then 
	{
		["SUCCEEDED"] call _fnc_finishTask;
		mf_s_cia_capture_zone = false;
	};
}];

_dataStore setVariable ["FINISH", {
	params ["_taskDataStore"];

	[_taskDataStore getVariable ["officer", objNull]] call para_s_fnc_cleanup_add_items;
	[_taskDataStore getVariable ["buildings", []]] call para_s_fnc_cleanup_add_items;
}];