
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

	[[["kill_enemy", _zonePosition]]] call _fnc_initialSubtasks;
}];

_taskDataStore setVariable ["kill_enemy", {
	params ["_taskDataStore"];

	private _zone = (_taskDataStore getVariable "taskMarker");

	private _playerCount = ({ isPlayer _x } count allUnits);
	private _enemyCount = ({!isPlayer _x } count allUnits);
	private _playerAdj = (_playerCount * 2) min 75 max 45;
	if ( (_playerAdj-((serverTime-vn_mf_hStartTime)/60) <= 5)  || mf_s_cia_capture_zone_garrison )exitWith
	{
		_taskDataStore setVariable ["enemy_killed", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};
}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];

	if (mf_s_cia_hold_zone || (_taskDataStore getVariable ["enemy_killed", false])) then {
		["SUCCEEDED"] call _fnc_finishTask;
		mf_s_cia_hold_zone = false;
		
		mf_s_cia_recapture_zone = true;
		mf_s_cia_recaptured_zone = true;
	};
}];

_taskDataStore setVariable ["FINISH", {
	[_taskDataStore getVariable "taskMarker"] call vn_mf_fnc_zones_held_zone;
}];
