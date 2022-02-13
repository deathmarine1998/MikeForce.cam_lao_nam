/*
    File: critical_stats.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-03-11
    Last Update: 2020-06-07
    Public: No
    
    Description:
        Updates the critical stats HUD (Thirst/Hunger/...)
    
    Parameter(s): none
    
    Returns: nothing
    
    Example(s): none
*/

private _stats = getArray(missionConfigFile >> "gamemode" >> "health" >> "gui_progress_bars");
{
	_x params ["_sName", "_color"];

	private _ctrl = uiNamespace getVariable [format["vn_mf_db_%1_ctrl",_sName],controlNull];
	if !(isNull _ctrl) then
	{
		_var = player getVariable [format["vn_mf_db_%1",_sName], 1];

		private _pbgControl = uiNamespace getVariable [format ["#VN_MF_HngerThirstHUD_ProgressBackground_%1", _forEachIndex], controlNull];
		if (_var <= 0.25) then
		{
			_pbgControl ctrlSetBackgroundColor [1, 0, 0, 0.25];
			_pbgControl ctrlCommit 0;

			[_ctrl,_color] spawn {
				params ["_ctrl","_color"];
				_ctrl ctrlSetTextColor [1,0,0,0.5];
				uiSleep 0.5;
				_ctrl ctrlSetTextColor _color;
				uiSleep 0.5;
				_ctrl ctrlSetTextColor [1,0,0,0.5];
				uiSleep 0.5;
				_ctrl ctrlSetTextColor _color;
			};
		} else {
			_pbgControl ctrlSetBackgroundColor [1, 1, 1, 0.5];
			_pbgControl ctrlCommit 0;
		};
	};
} forEach _stats;

private _unitPos = getPos player;
private _config = (missionConfigFile >> "gamemode" >> "safezones" >> "safezonescfg");
private _markers = getArray(_config >> "markers");
{
	private _zonePos = getMarkerPos _x;
	private _zoneRadius = getNumber(_config >> _x);
	private _dist = _unitPos distance2D _zonePos;
	if(_dist < _zoneRadius)then {
		InSafeZone = true;
		InSafeZoneArea = _x;
	};	
}forEach _markers;

if!(InSafeZoneArea isEqualTo "")then {
	private _zonePos = getMarkerPos InSafeZoneArea;
	private _zoneRadius = getNumber(_config >> InSafeZoneArea);
	private _dist = _unitPos distance2D _zonePos;
	if(_dist > _zoneRadius)then {
		InSafeZone = false;
		InSafeZoneArea = "";
	};
};
