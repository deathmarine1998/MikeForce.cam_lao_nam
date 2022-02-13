private ["_interactedItem","_item","_magazineSize","_magazineSizeMax","_magazinesAmmoFull"];

_item = "";
_interactedItem = uiNamespace getVariable ["vn_mf_interacted_item",[]];
if !(_interactedItem isEqualTo []) then {
	_item = _interactedItem select 1;
};
_total = count((magazines player) select { _x == _item });
player removeMagazines _item;

_lootPos = getPos player;
_loot = createVehicle ["GroundWeaponHolder_Scripted", [0,0,0], [], 0, "can_collide"];
_loot setPos [_lootPos# 0, _lootPos# 1, 0];
_loot addMagazineCargoGlobal [_item, _total];
GroundWeaponHolders pushBack [_loot, diag_tickTime];
