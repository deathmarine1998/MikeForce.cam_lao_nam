params ["_position"];

private _sitesCfg = (missionConfigFile >> "gamemode" >> "sites" >> "sitescfg");
private _worldCfg = format["helicopters_%1",toLower(worldName)];
private _vehCfg = getArray(_sitesCfg >> _worldCfg);

if((_vehCfg isEqualTo []) || !(_vehCfg isEqualType []))then {
	_vehCfg = ["vn_o_air_mi2_01_01","vn_o_air_mi2_01_01"];
};

private _vehType = selectrandom _vehCfg;

private _crewedVehicle = [[_vehType, _position] call para_g_fnc_create_vehicle, [], grpNull];

private _vehicles = [_crewedVehicle select 0];
private _units = _crewedVehicle select 1;
private _groups = [_crewedVehicle select 2];

[[_vehicles, _units, _groups], [_crewedVehicle select 0]]