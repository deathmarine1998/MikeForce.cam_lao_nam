/*
    File: fn_set_local_var.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-04-16
    Last Update: 2020-05-28
    Public: No

    Description:
		Sets local var for an array of data and executes event handler fnc if exists.

    Parameter(s):
		_variables - [_varname, _vardata] [ARRAY, defaults to []]
			_varname - Variable name [String]
			_vardata - Variable value [Any]

    Returns: nothing

    Example(s):
		[[["vn_mf_varname","vardata"],["vn_mf_varname","vardata"]]] remoteExecCall ["para_c_fnc_set_local_var",_player];
*/

params
[
	["_variables",[],[[]]]	// 0 : ARRAY of _variables
];
{
	_x params ["_varname", "_vardata"];
	private _awards = getArray(missionConfigFile >> "gamemode" >> "vars" >> "players" >> "awards");
	if(_varname == "vn_mf_db_awards")then {
		private _awardArray = [];
		for "_i" from 0 to (count(_vardata)-1) do {
			_awardArray pushBack [_awards# _i, _vardata# _i];
		};
		_vardata = _awardArray;
	};
	player setVariable [_varname,_vardata];

	// trigger vars EH code
	_function = getText(missionConfigFile >> "gamemode" >> "vars" >> "tracking" >> _varname >> "script");
	_fnc = missionNamespace getVariable [_function,{}];
	if !(_fnc isEqualTo {}) then
	{
		[_varname,_vardata] call _fnc
	};
} forEach _variables;
