/**
    File: fn_bugReport_init.sqf
    Author: Heyoxe
    Date: 2020-04-02
    Last Update: 2021-04-02
    Public: No
    
    Description: ![See fn_bugReport_show]
    
    Parameter(s): ![fn_bugReport_show]
    
    Returns: ![NOT_DOCUMENTED]
    
    Example(s): ![NOT_DOCUMENTED]
*/

/*
    Known bugs:
        - Issue with scrolling when writing text
*/
params [
    ["_display", displayNull, [displayNull]],
    ["_callback", { systemChat format ["[DEBUG] Bug report sent => %1", [_metadata, _super, _text]]; }, [{}]],
    ["_text", "", [""]],
    ["_metadata", createHashMap, [createHashMap]]
];

private _skip = false;
if (_display isEqualTo displayNull) then {
	createDialog "para_RscBugReport";
} else {
	_display = _display createDisplay "para_RscBugReport";
    _skip = true;
};

if (!_skip) then { _display = findDisplay 126037 };
private _controls = [ 10, 20, 30, 40, 50, 60 ] apply { _display displayCtrl _x };
_controls params [ "_ctrlHint", "_ctrlInput", "_ctrlSubmit", "_ctrlGroup", "_ctrlDummy", "_ctrlCopy" ];

_ctrlSubmit ctrlEnable false;

private _super = createHashMap;
_super set ["prodVn", productVersion];
_super set ["language", language];
_super set ["res", getResolution];
_super set ["UID", getPlayerUID player];
_super set ["profName", profileName];
_super set ["UTC", systemTimeUTC];
_super set ["Time", systemTime];
_super set ["tickTime", diag_tickTime];
_super set ["svrTime", serverTime];
_super set ["svrName", serverName];

_super set ["Pos", getPos player];
_super set ["AimPos", unitAimPosition player];
_super set ["EyePos", eyePos player];
_super set ["WpnDir", player weaponDirection currentWeapon player];
_super set ["CamViewDir", getCameraViewDirection player];
_super set ["FPS", diag_fps];
_super set ["StreamFrndlyUI", isStreamFriendlyUIEnabled];
_super set ["#supportInfo", count supportInfo ""];
_super set ["__A3_DEBUG__", [false, true]#__A3_DEBUG__];
_super set ["__DATE_STR_ISO8601__", __DATE_STR_ISO8601__];
_super set ["cheatsEnabled", cheatsenabled];

// "\vn\vn_versioning\scripts\vn_version.inc"
#if __has_include("\vn\vn_versioning\scripts\vn_version.inc")
    #include "\vn\vn_versioning\scripts\vn_version.inc"
    _super set ["#REVISION", STR_VN_REV];
    systemChat str [STR_VN_REV];
#else
    _super set ["#REVISION", "0.00.000000"];
#endif

private _data = createHashMap;
_data set ["#metadata", _metadata];
_data set ["#super", _super];

_display setVariable ["#metadata", _metadata];
_display setVariable ["#super", _super];
_display setVariable ["#callback", _callback];

_ctrlDummy ctrlEnable false;
_ctrlDummy ctrlShow false;

_ctrlInput ctrlSetText _text;
_ctrlHint ctrlShow (ctrlText _ctrlInput isEqualTo "");

_ctrlCopy ctrlSetText (str _data);
// _ctrlCopy ctrlAddEventHandler ["SetFocus", {
//     params ["_control"];
//     _control ctrlSetTextSelection [0, (count ctrlText _control)];
// }];
// _ctrlCopy ctrlAddEventHandler ["KillFocus", {
//     params ["_control"];
//     _control ctrlSetTextSelection [0, 0];
// }];

_ctrlSubmit ctrlAddEventHandler ["ButtonClick", {
    params ["_control"];
    private _display = ctrlParent _control;
    private _input = _display displayCtrl 20;
    private _text = ctrlText _input;


    private _metadata = _display getVariable "#metadata";
    private _super = _display getVariable "#super";
    private _callback = _display getVariable "#callback";

    _super set ["#sentTimeUTC", systemTimeUTC];
    if (_text isNotEqualTo "") then {
        [_metadata, _super, _text] call _callback;
    };

    private _log = format ["[DirtyBugsNSuggs] Bug Report Saved => %1", [_metadata, _super, _text]];
	diag_log _log;
	
	_log = format ["[DirtyBugsNSuggs] Bug Report Received from %1 => %2", profileName, [systemTimeUTC, getPos player, _text]];
	[_log] remoteExec ["diag_log", 2];
    closeDialog 1;
    _display closeDisplay 1;
	
}];

_ctrlInput ctrlAddEventHandler ["KeyDown", {
    params ["_control", "_key", "_shift", "_ctrl", "_alt"];

    if (_key isEqualTo DIK_ESCAPE) exitWith { false };
    _this spawn para_c_fnc_bugReport_onKeyDown;
    private _isNewLine = _key in [DIK_RETURN, DIK_NUMPADENTER];
    if (_isNewLine) exitWith { true };
}];

_ctrlInput ctrlAddEventHandler ["KeyDown", {
    params ["_control", "_key", "_shift", "_ctrl", "_alt"];
    private _display = ctrlParent _control;
    private _ctrlHint = _display displayCtrl 10;
    private _ctrlSubmit = _display displayCtrl 30;
    _ctrlHint ctrlShow (ctrlText _control isEqualTo "");
    _ctrlSubmit ctrlEnable (ctrlText _control isNotEqualTo "");
}];

_ctrlInput ctrlAddEventHandler ["KeyUp", {
    params ["_control", "_key", "_shift", "_ctrl", "_alt"];
    private _display = ctrlParent _control;
    private _ctrlHint = _display displayCtrl 10;
    private _ctrlSubmit = _display displayCtrl 30;
    _ctrlHint ctrlShow (ctrlText _control isEqualTo "");
    _ctrlSubmit ctrlEnable (ctrlText _control isNotEqualTo "");
}];

ctrlSetFocus _ctrlInput;