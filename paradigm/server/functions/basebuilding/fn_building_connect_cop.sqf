params ["_building", "_cop"];

_cop setVariable ["para_g_buildings", (_cop getVariable "para_g_buildings") + [_building], true];

_building setVariable ["para_g_cop", _cop, true];

//Set the building to use the bases' supply source
[_building, _cop getVariable "para_g_supply_source"] call para_s_fnc_building_connect_supply_source;

[_building, "onCopConnected", [_building, _cop]] call para_s_fnc_building_fire_feature_event;