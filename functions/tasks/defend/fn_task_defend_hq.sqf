params ["_taskDataStore"];

_taskDataStore setVariable ["INIT", {
	params ["_taskDataStore"];

	//Required parameters
	private _targetBase = _taskDataStore getVariable "targetBase";
	private _prepTime = _taskDataStore getVariable "prepTime";

	_taskDataStore setVariable ["startTime", serverTime];
	private _attackTime = serverTime + _prepTime;
	_taskDataStore setVariable ["attackTime", _attackTime];

	private _attackPos = getPos _targetBase;
	_attackPos set [2, 0];
	_taskDataStore setVariable ["attackPos", _attackPos];

	//private _hqRadius = _targetBase getVariable "para_g_hq_radius";
	_taskDataStore setVariable ["attackAreaSize", [150, 150]];

	//if (_prepTime > 0) then 
	//{
	//	["MFAttackPreparing", ["", (_prepTime / 60) toFixed 0]] remoteExec ["para_c_fnc_show_notification", 0];
	//	["Attack on HQ In", _attackTime, true] call vn_mf_fnc_timerOverlay_setGlobalTimer;
	//};

	[[
		["prepare_hq", _attackPos]
	]] call _fnc_initialSubtasks;
}];

_taskDataStore setVariable ["prepare_hq", {
	params ["_taskDataStore"];

	if (_taskDataStore getVariable "attackTime" > serverTime) exitWith {};

	["SUCCEEDED", [["defend_hq", _taskDataStore getVariable "attackPos"]]] call _fnc_finishSubtask;
}];

_taskDataStore setVariable ["defend_hq", {
	params ["_taskDataStore"];
	
	private _startTime = _taskDataStore getVariable "startTime";
	
	if (mf_s_cia_dc_defend_hq
		|| serverTime - _startTime > (_taskDataStore getVariable ["holdDuration", 1800]) 
	    || isNull (_taskDataStore getVariable "attackObjective")
	) then {
		_taskDataStore setVariable ["areaDefended", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
		mf_s_cia_defend_hq = true;
	};
}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];

	if (_taskDataStore getVariable ["areaDefended", false] || mf_s_cia_defend_hq) then {
		["SUCCEEDED"] call _fnc_finishTask;
		//mf_s_cia_defend_hq = false;
	};
}];

_taskDataStore setVariable ["FINISH", {
	params ["_taskDataStore"];
	[_taskDataStore getVariable "attackObjective"] call para_s_fnc_ai_obj_finish_objective;
	mf_s_hqDefended = true;
}];

