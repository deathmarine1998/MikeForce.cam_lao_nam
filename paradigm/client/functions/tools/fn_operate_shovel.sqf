/*
    File: fn_operate_shovel.sqf
    Author: dent
    Date: 2021-07-08
    Last Update: Date: 2021-07-08
    Public: Yes
    
    Description:
        Executes "Shovel" behaviour for building.
    
    Parameter(s):
        _hitObject object to be built
    
    Returns:
        None
    
    Example(s):
        [_thingToWhack] call para_c_fnc_operate_shovel
*/

params ["_hitObject"];
// systemchat "SHOVEL";
private _building = _hitObject getVariable ["para_g_building", objNull];
private _change = 0.2;
private _group_ID = player getVariable ["vn_mf_db_player_group", "MikeForce"];
if!(_group_ID in ["MikeForce", "ACAV", "GreenHornets", "SpikeTeam", "BNCadet"])then { _change = 0.34 };
["building_on_hit", [_building, _change]] call para_c_fnc_call_on_server;
false