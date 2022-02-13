/*
    File: eh_GetInMan.sqf
    Author: Spoffy
    Date: 2020-03-27
    Last Update: 2020-05-29
    Public: No
    
    Description:
        Fires on the 'GetInMan' event on the client
    
    Parameter(s):
		_unit - Unit the event handler is assigned to [Object]
		_role - Can be either "driver", "gunner" or "cargo" [String]
		_vehicle - Vehicle the unit entered [Object]
		_turret - Turret path [Array]
    
    Returns: nothing
    
    Example(s): none
*/

params ["_unit", "_role", "_vehicle", "_turret"];

private _debugVeh = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "playervehicles");
if(_debugVeh isEqualTo 1) then { diag_log format["[DirtyDebug]eh_GetInMan _unit:%1 _role:%2 _veh:%3 _turret:%4",_unit, _role, _vehicle, _turret] };

if !([_unit, _role, _vehicle] call vn_mf_fnc_player_can_enter_vehicle) then {
	moveOut _unit;
	if(isCopilotEnabled _vehicle)then { _vehicle enableCopilot false };
};