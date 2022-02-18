/*
    File: eh_Killed.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-05-13
    Last Update: 2020-05-26
    Public: No

    Description:
		Player Killed Event Handler.

    Parameter(s):
		_unit - Description [DATATYPE, defaults to DEFAULTVALUE]
		_killer - Description [DATATYPE, defaults to DEFAULTVALUE]
		_instigator - Description [DATATYPE, defaults to DEFAULTVALUE]
		_useEffects - Description [DATATYPE, defaults to DEFAULTVALUE]

    Returns: nothing

    Example(s):
		Not called directly.
*/

params
[
	"_unit",
	"_killer",
	"_instigator",
	"_useEffects"
];

// disable build mode
para_l_buildmode = nil;
para_l_placing = false;

// turn off debug monitor to prevent control lock
// call vn_mf_fnc_enable_debug_monitor;
if!(isNil "vn_mf_enable_debug_monitor") then
{
	vn_mf_enable_debug_monitor = nil;
	hintSilent "Debug Monitor: disabled";
};


// enable user input if died immediately
disableUserInput false;

private _debugKills = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "killedstats");
if(_debugKills isEqualTo 1) then { diag_log format["[+]eh_Killed DBG-1 _unit:%1 _killer:%2 _instigator:%3 _useEffects:%4", _unit, _killer, _instigator, _useEffects] };
