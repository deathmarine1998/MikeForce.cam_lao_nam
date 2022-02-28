/*
    File: eh_HandleDisconnect.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-03-01
    Last Update: 2020-05-27
    Public: No

    Description:
		Handle Disconnect Event Handler that saves player vars on disconnect.

    Parameter(s):
		_unit - unit formerly occupied by player [OBJECT]
		_id - unique DirectPlay ID [NUMBER]
		_uid - getPlayerUID of player [STRING]
		_name - profileName of the leaving player [STRING]

    Returns:
    	Always returns false [BOOL]

    Example(s):
    	Not called directly.
*/

params
[
	"_unit",
	"_id",
	"_uid",
	"_name"
];
private _prefix = "vn_mf_db_";

private _config = (missionConfigFile >> "gamemode" >> "vars" >> "players");
private _debug = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "playerdbstats");
private _blacklisted = getArray(_config >> "blacklisted");
private _stats = getArray(_config >> "stats");
private _awards = getArray(_config >> "awards");
private _vardata = [];
if !(isNull _unit) then
{
	private _stats = getArray(missionConfigFile >> "gamemode" >> "vars" >> "players" >> "stats");
	{
		private _varname = format["vn_mf_db_%1",_x];
		private _resp = _unit getVariable _varname;
		if(_debug isEqualTo 1) then { diag_log format["[+]handleDisconnect Name:%1 Data:%2", _varname,_resp] };
		if(_varname == "vn_mf_db_awards")then {
			private _awardArray = [];
			for "_i" from 0 to (count(_resp)-1) do {
				_awardArray pushBack ((_resp select _i) select 1);
			};
			_resp = _awardArray;
			if(_debug isEqualTo 1) then { diag_log format["[+]handleDisconnect awards Name:%1 Data:%2", _varname,_resp] };
		};
		_vardata pushBack _resp;
	} forEach _stats;

	// save data
	["SET", (_uid + "_data"), _vardata] call para_s_fnc_profile_db;

	// save players loadout
	["SET", (_uid + "_loadout"), getUnitLoadout _unit] call para_s_fnc_profile_db;

	// delete unit
	deleteVehicle _unit;
};

["%1 _vardata %2",_this, _vardata] call BIS_fnc_logFormat;

false
