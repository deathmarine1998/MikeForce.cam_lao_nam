/*
	File: fn_create_aa_emplacement.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-01
	Public: No
	
	Description:
		Creates an AA emplacement (NVA) at the specified position.
	
	Parameter(s):
		_position - Position where to roughly spawn the AA emplacement [Position3D]
	
	Returns:
		Array in form of [[Vehicles created, units created, groups created], [AA Guns created]] [Array]
	
	Example(s):
		[[0,0,0], "heavy"] call vn_mf_fnc_create_aa_emplacement
*/

params ["_position"];

private _sitesCfg = (missionConfigFile >> "gamemode" >> "sites" >> "sitescfg");
private _worldCfg = format["vehicles_%1",toLower(worldName)];
private _vehCfg = getArray(_sitesCfg >> _worldCfg);
if((_vehCfg isEqualTo []) || !(_vehCfg isEqualType []))then {
	_vehCfg = ["vn_o_wheeled_z157_mg_01_vcmf", "vn_o_car_04_mg_01"];
};

private _vehType = selectrandom _vehCfg;

//private _crewedVehicle = [[_vehType, _position] call para_g_fnc_create_vehicle, [], grpNull];
private _crewedVehicle = [_position, RANDOM 360, _vehType, east] call BIS_fnc_spawnVehicle;
		private _createdThings = _crewedVehicle select 0;
		
		private _gunner = gunner _createdThings;
        private _driver = driver _createdThings;
		_gunner addMPEventHandler
		[
			"MPkilled",
			{
				_this spawn
				{
					_offr = vehicle (_this select 0);
					_driver = driver _offr;
					_driver leavevehicle _offr;
					[_driver] orderGetIn FALSE;
					_driver assignAsGunner _offr;
					[_driver] orderGetIn TRUE;
				};
			}
		];
		_wpPos = [_position, 100, 100, 6, 0, 0.5, 0] call BIS_fnc_findSafePos;
        private _wp = (_crewedVehicle select 2) addWaypoint [_wpPos, 0];
        _wp setwaypointtype "MOVE";
		
		_wpPos2 = [_wpPos, 100, 100, 6, 0, 0.5, 0] call BIS_fnc_findSafePos;
        private _wp2 = (_crewedVehicle select 2) addWaypoint [_wpPos2,2];
		_wp2 setwaypointtype "SAD";
		
		_wpPos3 = [_wpPos2, 100, 100, 6, 0, 0.5, 0] call BIS_fnc_findSafePos;
        private _wp3 = (_crewedVehicle select 2) addWaypoint [_wpPos3,3];
		_wp3 setwaypointtype "SAD";
		
		private _wpc = (_crewedVehicle select 2) addWaypoint [_wpPos,4];
		_wpc setwaypointtype "CYCLE";
        (_crewedVehicle select 2) deleteGroupWhenEmpty true;






private _vehicles = [_crewedVehicle select 0];
private _units = _crewedVehicle select 1;
private _groups = [_crewedVehicle select 2];

[[_vehicles, _units, _groups], [_crewedVehicle select 0]]