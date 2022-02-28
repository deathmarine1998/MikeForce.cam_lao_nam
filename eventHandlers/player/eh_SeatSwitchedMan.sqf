/*
    File: eh_SeatSwitchedMan.sqf
    Author: Spoffy
    Date: 2020-03-27
    Last Update: 2020-05-29
    Public: No
    
    Description:
        Fires on the 'SeatSwitchedMan' event on the client
    
    Parameter(s):
		_unit1 - Unit switching seat [Object]
		_unit2 - Unit with which unit1 is switching seat [Object]
		_vehicle - Vehicle where switching seats is taking place [Object]
    
    Returns: nothing
    
    Example(s): none
*/

params ["_unit1", "_unit2", "_vehicle"];

private _role = assignedVehicleRole _unit1 select 0;

private _debugVeh = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "playervehicles");
if(_debugVeh isEqualTo 1) then { diag_log format["[+]eh_SeatSwitchedMan _unit1:%1 _unit2:%2 _role:%3 _vehicle:%4",_unit, _unit2, _role, _vehicle] };

if ((_role == "driver") && (isEngineOn _vehicle))exitWith{
	//Try not to kill them while flying and taking over dead pilot
};

if !([_unit1, _role, _vehicle] call vn_mf_fnc_player_can_enter_vehicle) then {
	//Try to move them to safety - we don't want people falling out of helicopters if we can avoid it!Agreed
	moveOut _unit1;
	if (_unit1 moveInCargo _vehicle) isEqualTo false then {
		if (_unit1 moveInGunner _vehicle) isEqualTo false then {
			if (_unit1 moveInCommander _vehicle) isEqualTo false then {
				_unit1 allowDamage false;
				moveOut _vehicle;
				_unit1 setPOS (getMarkerPos "mf_respawn_greenhornets");
				_unit1 allowDamage true;
				//Maybe we should teleport them to the ground here?[DONE] Or give them a parachute?[FUTURE]
			};
		};
	};
};
