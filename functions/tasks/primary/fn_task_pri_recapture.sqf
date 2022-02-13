
params ["_taskDataStore"];

_taskDataStore setVariable ["INIT", {
	params ["_taskDataStore"];

	private _zone = _taskDataStore getVariable "taskMarker";
	private _zonePosition = getMarkerPos _zone;

	[[["recapture_zone", _zonePosition]]] call _fnc_initialSubtasks;
}];

_taskDataStore setVariable ["recapture_zone", {
	params ["_taskDataStore"];

	private _zone = (_taskDataStore getVariable "taskMarker");
	_color = getMarkerColor _zone;
	if(_color == "ColorGreen")exitWith {};
	if ( _color == "ColorRed"  || mf_s_cia_recapture_zone )exitWith
	{
		_taskDataStore setVariable ["recapture_zone", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
		mf_s_cia_recapture_zone = false;
	};
}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];

	if (mf_s_cia_recaptured_zone || (_taskDataStore getVariable ["recapture_zone", false])) then {
		["SUCCEEDED"] call _fnc_finishTask;
		mf_s_cia_recaptured_zone = false;
	};
}];

_taskDataStore setVariable ["FINISH", {
	//[_taskDataStore getVariable "taskMarker"] call vn_mf_fnc_zones_held_zone;
}];
