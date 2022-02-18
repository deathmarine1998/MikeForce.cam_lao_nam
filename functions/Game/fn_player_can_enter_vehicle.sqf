/*
	File: fn_player_can_enter_vehicle.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-04
	Public: No
	
	Description:
		Check if the player can enter the vehicle.
	
	Parameter(s):
	_player - Player that wants to enter [Object]
	_role - Role in the vehicle they want to enter [String]
	_vehicle - Vehicle that the player is entering [Object]
	
	Returns:
		Can they enter the vehicle? [Boolean]
	
	Example(s): none
*/


params ["_player", "_role", "_vehicle"];

private _debugVeh = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "playervehicles");
if(_debugVeh isEqualTo 1) then { diag_log format["[+]fn_player_can_enter_vehicle DBG-1 _player:%1 _role:%2 _veh:%3",_player, _role, _vehicle] };

private _teamsVehicleIsLockedTo = [];

if ((_role == "gunner") && (_vehicle isKindOf "vn_air_f4_base"))exitWith {
	_teamsVehicleIsLockedTo = _vehicle getVariable ["teamLock", []] apply {missionNamespace getVariable [_x, grpNull]};
	if (_teamsVehicleIsLockedTo isEqualTo [] || group _player in _teamsVehicleIsLockedTo) exitWith {
		true
	};
	["VehicleLockedToRank", ["Satans Angels Squadron members only, apply in discord"]] remoteExec ["para_c_fnc_show_notification", _player];
	false
};
private _isCopilot = (getNumber ([_vehicle, _vehicle unitTurret _player] call BIS_fnc_turretConfig >> "isCopilot") > 0);

if (_role == "driver" || _isCopilot) exitWith {

	_teamsVehicleIsLockedTo = _vehicle getVariable ["teamLock", []] apply {missionNamespace getVariable [_x, grpNull]};
	if (_teamsVehicleIsLockedTo isEqualTo [] || group _player in _teamsVehicleIsLockedTo) exitWith {
		true
	};
	["VehicleLockedToTeam"] remoteExec ["para_c_fnc_show_notification", _player];
	false
};

true