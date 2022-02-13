/*
	File: fn_create_camp_buildings.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-01
	Public: No
	
	Description:
		Creates a 'camp' environment at the given position.
	
	Parameter(s):
		_position - Position of the camp [Position3D]
	
	Returns:
		Array containing the camp building [Array]
	
	Example(s): none
*/

params ["_position"];

private _object = getText(missionConfigFile >> "gamemode" >> "sites" >> "sitescfg" >> "camp_object");
private _tent = [[_object, _position] call para_g_fnc_create_vehicle, [], grpNull];
private _campfire = createVehicle ["vn_campfire_burning_f", (_tent select 0) getPos [5, random 360], [], 5, "NONE"];

private _vehicles = [_tent select 0, _campfire];
private _units = _tent select 1;
private _groups = [_tent select 2];

[[_vehicles, _units, _groups], [_tent select 0]]