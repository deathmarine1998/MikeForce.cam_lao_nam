params ["_position"];

private _tunnel = [["Land_vn_o_trapdoor_01", _position] call para_g_fnc_create_vehicle, [], grpNull];
		
private _vehicles = [_tunnel select 0];
private _units = _tunnel select 1;
private _groups = [_tunnel select 2];

[[_vehicles, _units, _groups], [_tunnel select 0]]