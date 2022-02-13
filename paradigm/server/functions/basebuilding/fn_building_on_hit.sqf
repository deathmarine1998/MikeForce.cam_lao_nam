/*
    File: fn_building_on_hit.sqf
    Author: Spoffy
    Date: 2020-09-05
    Last Update: 2020-09-05
    Public: No
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
    
    Example(s):
        [parameter] call vn_fnc_myFunction
*/

params ["_building", ["_change", 0.2]];

if (isNull _building || _building getVariable ["para_s_building_id", objNull] isEqualType objNull) exitWith {
	diag_log format ["WARNING: Paradigm: Building on hit called without a valid building by %1", _player];
};

//Commented out waiting on scripted handler being added to handgun weapons
//TODO - This //"vn_m_hammer"
//if (!isNull _building/* && {currentWeapon _unit == "vn_m_shovel_01"}*/) then {

[_building, _change] call para_s_fnc_building_add_build_progress;