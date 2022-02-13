/*
	File: fn_create_mortar.sqf
	Author: Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-01
	Public: No
	
	Description:
		Creates a VC mortar at the specified position.
	
	Parameter(s):
		_position - Position where to roughly spawn the AA emplacement [Position3D]
	
	Returns:
		Array in from of [[Vehicles created, units created, groups created], [mortars]] [Array]
	
	Example(s):
		[[0,0,0], 10] call vn_mf_fnc_create_aa_emplacement
*/

params ["_position"];

private _sitesCfg = (missionConfigFile >> "gamemode" >> "sites" >> "sitescfg");
private _worldCfg = format["mortars_%1",toLower(worldName)];
private _mortarsCfg = getArray(_sitesCfg >> _worldCfg);
if((_mortarsCfg isEqualTo []) || !(_mortarsCfg isEqualType []))then {
	_mortarsCfg = ["vn_o_vc_static_mortar_type63", "vn_o_vc_static_mortar_type53", "vn_o_vc_static_d44_01"];
};
private _mortar = [[selectRandom _mortarsCfg, _position] call para_g_fnc_create_vehicle, [], grpNull];

private _vehicles = [_mortar select 0];
private _units = _mortar select 1;
private _groups = [_mortar select 2];

[[_vehicles, _units, _groups], [_mortar select 0]]