params ["_hitObject"];

private _building = _hitObject getVariable ["para_g_building", objNull];
["building_on_hit", [_building, -0.5]] call para_c_fnc_call_on_server;
false