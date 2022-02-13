/*
    File: fn_apply_unit_traits.sqf
    Author: Spoffy
    Date: 2020-05-15
    Last Update: 2020-11-10
    Public: No

    Description:
        Sets starting traits.

    Parameter(s): none

    Returns: nothing

    Example(s): none
*/

private _debug = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "traits");

private _dt = [0.8,0.6,1,false,false,false,false];
private _group_ID = player getVariable ["vn_mf_db_player_group", "MikeForce"];
private _tCfg = getArray(missionConfigFile >> "gamemode" >> "traits" >> "UnitTraitsSettings" >> _group_ID);
if!(_tCfg isEqualTo [])then {
	_dt = _tCfg;
	_dt set [3, if(_tCfg#3 == "false")then { false } else { true }];
	_dt set [4, if(_tCfg#4 == "false")then { false } else { true }];
	_dt set [5, if(_tCfg#5 == "false")then { false } else { true }];
	_dt set [6, if(_tCfg#6 == "false")then { false } else { true }];
};

player setUnitTrait ["camouflageCoef", _dt# 0];
player setUnitTrait ["audibleCoef", _dt# 1];
player setUnitTrait ["loadCoef", _dt# 2];
player setUnitTrait ["engineer", _dt# 3];
player setUnitTrait ["explosiveSpecialist", _dt# 4];
player setUnitTrait ["medic", _dt# 5];
player setUnitTrait ["UAVHacker", _dt# 6];
