//player addEventHandler ["HandleDamage", {

params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

if!(_damage == 0)then {
	diag_log format["[+]Handle Damage %1 - sel:%2 - dmg:%3 - src:%4 - proj:%5 - hitIndex:%6 - inst:%7 - hitPnt:%8",_unit, _selection, _damage, _source, _projectile, _hitIndex, _instigator, _hitPoint];
};

//};