params ["_position"];

private _tunnelWS = "Land_vn_o_trapdoor_02" createVehicle _position;
//private _tunnel = [["Land_vn_o_trapdoor_02", _position] call para_g_fnc_create_vehicle, [], grpNull];
//if!(underwater _tunnel)then { _tunnel setPosATL _position };
//private _newPos = AGLToASL ((_tunnel # 0) modelToWorld [0,0,-0.1]);
//(_tunnel # 0) setPosATL _newPos;
		
private _vehicles = _tunnelWS; //[_tunnel select 0];
private _units = [];// _tunnel select 1;
private _groups = []; //[_tunnel select 2];

[[_vehicles, _units, _groups], [_tunnel select 0]]