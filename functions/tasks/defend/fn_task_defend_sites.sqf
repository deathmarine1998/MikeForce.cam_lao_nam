params ["_taskDataStore"];

_taskDataStore setVariable ["INIT", {
	params ["_taskDataStore"];

	//Required parameters
	private _targetBase = (_taskDataStore getVariable "taskMarker");
	
	_taskDataStore setVariable ["startTime", serverTime];
	private _attackTime = serverTime + 1200;
	_taskDataStore setVariable ["attackTime", _attackTime];

	private _attackPos = getMarkerPos _targetBase;
	_attackPos set [2, 0];
	_taskDataStore setVariable ["attackPos", _attackPos];

	_taskDataStore setVariable ["attackAreaSize", [150, 150]];

	[[
		["prepare_sites", _attackPos]
	]] call _fnc_initialSubtasks;
}];

_taskDataStore setVariable ["prepare_sites", {
	params ["_taskDataStore"];

	if (_taskDataStore getVariable "attackTime" > serverTime) exitWith {};

	["SUCCEEDED", [["defend_sites", _taskDataStore getVariable "attackPos"]]] call _fnc_finishSubtask;
}];

_taskDataStore setVariable ["defend_sites", {
	params ["_taskDataStore"];

	private _startTime = _taskDataStore getVariable "startTime";

	//Area has been held long enough, or they've killed enough attackers for the AI objective to complete.
	if (mf_s_cia_dc_defend_sites
		|| serverTime - _startTime > (_taskDataStore getVariable ["holdDuration", 1800]) 
	    || isNull (_taskDataStore getVariable "attackObjective")
	) then {
		_taskDataStore setVariable ["areaDefended", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
		mf_s_cia_defend_sites = true;
	};

}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];

	if (_taskDataStore getVariable ["areaDefended", false] || mf_s_cia_defend_sites) then {
		["SUCCEEDED"] call _fnc_finishTask;
		//mf_s_cia_defend_sites = false;
	};
}];

_taskDataStore setVariable ["FINISH", {
	params ["_taskDataStore"];
	[_taskDataStore getVariable "attackObjective"] call para_s_fnc_ai_obj_finish_objective;
	mf_s_sitesDefended = true;
}];
