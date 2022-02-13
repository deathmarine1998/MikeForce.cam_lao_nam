/*
    File: fn_is_valid_axe_target.sqf
    Author: dent
    Date: 2021-07-09
    Last Update: 2021-07-09
    Public: Yes
    
    Description:
        Given a melee target, determine if the axe is appropriate to deal with it.
    
    Parameter(s):
        None
    
    Returns:
        None
    
    Example(s):
        [_target] call para_g_fnc_is_valid_axe_target
*/

params ["_target"];
private _info = (getModelInfo _target) select 1;
private _split = _info splitString "\.";
private _count= count(_split);
private _modelFileName = _split select (_count-2);

private _info = (getModelInfo cursorObject) select 1;
private _split = _info splitString "\.";
private _count= count(_split);
private _modelFileName = _split select (_count-2);
private _valid = [
    "vn_usaf_fueltank_75_01",
	"vn_us_fort_common_barrel_01"
];

_valid findIf { _x in _modelFileName } > -1
