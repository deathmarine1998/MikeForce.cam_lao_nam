/*
    File: fn_veh_asset_unlock_vehicle.sqf
    Author: Spoffy
    Date: 2021-04-03
    Last Update: 2021-04-03
    Public: No
    
    Description:
        Unlocks a locked vehicle asset
    
    Parameter(s):
		_id - Id of the vehicle asset [Number]
    
    Returns:
		None
    
    Example(s):
		[22] call vn_mf_fnc_veh_asset_unlock_vehicle
*/

params [ ["_id", ""] ];

if(!(_id isEqualType "") || (_id isEqualTo ""))exitWith { diag_log "[DirtyDebug]veh_asset_unlock_vehicle _id:ANY" };
private _vehicle = [_id] call vn_mf_fnc_veh_asset_get_by_id select struct_veh_asset_info_m_vehicle;

if !(_vehicle getVariable ["vn_mf_g_veh_asset_locked", false]) exitWith {};

[_vehicle, false] remoteExec ["lockInventory", 0];
[_vehicle, "UNLOCKED"] remoteExec ["setVehicleLock", _vehicle];
_vehicle enableSimulationGlobal true;
_vehicle setVariable ["vn_mf_g_veh_asset_locked", false, true];
_vehicle setVariable ["vn_mf_g_veh_asset_lock_last_toggled", serverTime];
