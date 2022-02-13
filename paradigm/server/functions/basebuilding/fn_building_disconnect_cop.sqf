params ["_building"];

private _cop = _building getVariable ["para_g_cop", objNull];
if (isNull _cop) exitWith {};

[_building, "onCopDisconnected", [_building, _cop]] call para_s_fnc_building_fire_feature_event;

//Update references
_building setVariable ["para_g_cop", nil, true];
_cop setVariable ["para_g_buildings", (_cop getVariable "para_g_buildings") - [_building], true];

//Set the building to use its own supply source
//Will also disconnect it from its current supply source
[_building, _building getVariable "para_g_internal_supply_source"] call para_s_fnc_building_connect_supply_source;

