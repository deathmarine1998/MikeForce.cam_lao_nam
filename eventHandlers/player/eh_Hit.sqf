params ["_unit", "_source", "_damage", "_instigator"];
if((InSafeZone)&&!(InSafeZoneArea isEqualTo ""))then { _unit setDammage ((damage _unit)-_damage) };
_unit setDammage ((damage _unit)-(_damage/3))