
params
[
	["_variables",[],[[]]]	// 0 : ARRAY of _variables
];

private _config = (missionConfigFile >> "gamemode" >> "vars"); // >> "players");
private _debug = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "playerdbstats");
private _public_vars = getArray(_config >> "players" >> "publicvars");
private _stats = getArray(_config >> "players" >> "stats");
private _awards = getArray(_config >> "players" >> "awards");
{
	_varname = format["vn_mf_db_%1",_stats# _forEachIndex];
	_vardata = _x;
	if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]recv_db_stats Name:%1 Data:%2", _varname, _vardata] };
	if(_varname == "vn_mf_db_awards")then { 
		private _awardArray = [];
		for "_i" from 0 to (count(_vardata)-1) do {
			_awardArray pushBack [_awards# _i,_vardata# _i];
		};
		if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]recv_db_stats Name:%1 Data:%2", _varname,_vardata] };
		_vardata = _awardArray;
	};
	player setVariable [_varname,_vardata];
	
	// trigger vars EH code
	_function = getText(_config >> "tracking" >> _varname >> "script");
	_fnc = missionNamespace getVariable [_function,{}];
	if !(_fnc isEqualTo {}) then
	{
		[_varname,_vardata] call _fnc
	};
} forEach _variables;