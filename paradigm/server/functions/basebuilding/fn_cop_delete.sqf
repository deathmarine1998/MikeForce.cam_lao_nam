params ["_cop"];

{
	[_x] call para_s_fnc_building_disconnect_cop;
} forEach (_cop getVariable "para_g_buildings");

//Delete base marker if it exists
private _copMarker = _base getVariable ["para_g_cop_marker", ""];
private _outpostMarker = _base getVariable ["para_g_outpost_marker", ""];
{ deleteMarker _x } forEach [_copMarker, _outpostMarker];
[_outpostMarker] call para_c_fnc_zone_marker_delete;

para_g_cops = para_g_cops - [_cop];

deleteVehicle _cop;

publicVariable "para_g_cops";