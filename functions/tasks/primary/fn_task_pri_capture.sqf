/*
	File: fn_task_pri_capture.sqf
	Author: Spoffy
	Date: 2020-05-01
	Last Update: 2020-06-12
	Public: No

	Description:
		Primary task to take over a zone - clearing enemy forces out of it.
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

	private _zone = _taskDataStore getVariable "taskMarker";
	private _zonePosition = getMarkerPos _zone;

	//TODO - Add event handler to SiteDestroyed
	private _hqs = (localNamespace getVariable ["sites_hq", []]) inAreaArray _zone;
	private _hqPosition = if (count _hqs > 0) then {getPos (_hqs # 0)} else {_zonePosition};

	[[["kill_enemy", _zonePosition], ["destroy_sites", _zonePosition], ["destroy_enemy_supplies", _hqPosition]]] call _fnc_initialSubtasks;
}];

_taskDataStore setVariable ["kill_enemy", {
	params ["_taskDataStore"];

	private _zone = (_taskDataStore getVariable "taskMarker");

	private _playerCount = ({ isPlayer _x } count allUnits);
	private _enemyCount = ({!isPlayer _x } count allUnits);
	private _playerAdj = (_playerCount * 2) min 125 max 75;
	if ( (_playerAdj-(serverTime/60) <= 5)  || mf_s_cia_capture_zone_garrison )exitWith
	{
		_taskDataStore setVariable ["enemy_killed", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
		mf_s_cia_capture_zone_garrison = false;
	};
}];
//private _reinforcementPools = para_s_ai_obj_reinforcement_pools inAreaArray _zone;
//_reinforcementPools#0 setVariable ["remaining",((150 - ((diag_tickTime-vn_mf_sStartTime)/60))/150)];
//_reinforcementPools#1 setVariable ["remaining",((150 - ((diag_tickTime-vn_mf_sStartTime)/60))/150)];
//if (({_x getVariable ["remaining",0] > 0.4} count _reinforcementPools == 0) || (mf_s_cia_capture_zone))exitWith
_taskDataStore setVariable ["destroy_sites", {
	params ["_taskDataStore"];

	private _zone = (_taskDataStore getVariable "taskMarker");

	private _numberOfSites = count (localNamespace getVariable "sites" inAreaArray [markerPos _zone, 1200, 1200]);

	if ((_numberOfSites == 0) || (mf_s_cia_capture_zone_sites)) exitWith
	{
		_taskDataStore setVariable ["sites_destroyed", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
		
		mf_s_cia_dc_defend_sites = true;
		mf_s_cia_defend_sites = true;
	};
}];

_taskDataStore setVariable ["destroy_enemy_supplies", {
	params ["_taskDataStore"];

	private _zone = (_taskDataStore getVariable "taskMarker");
	private _numberOfHQs = count (localNamespace getVariable "sites_hq" inAreaArray [markerPos _zone, 1200, 1200]);

	if ((_numberOfHQs == 0) || (mf_s_cia_capture_zone_hq)) exitWith
	{
		_taskDataStore setVariable ["suppliesDestroyed", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
		
		//private _defSites = ["defend_sites", _zone] call vn_mf_fnc_task_create select 1;
		//mf_s_cia_defend_hq = true;
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

_taskDataStore setVariable ["FINISH", {
	[_taskDataStore getVariable "taskMarker"] call vn_mf_fnc_zones_capture_zone;
	//private _hold_zone = ["hold_zone", _taskDataStore getVariable "taskMarker"] call vn_mf_fnc_task_create select 1;
	private _recapture_zone = ["recapture_zone", _taskDataStore getVariable "taskMarker"] call vn_mf_fnc_task_create select 1;
	vn_mf_hStartTime = serverTime;
	mf_s_capturedZone = true;
}];
