params["_weaponTurret"];
private _ammoCount = 0;
private _classNameTurret = _weaponTurret;
private _nameTurret = getText(configFile >> "CfgWeapons" >> _classNameTurret >> "displayName");
private _ammoTurret = getArray(configFile >> "CfgWeapons" >> _classNameTurret >> "magazines");
private _turretPath = (assignedVehicleRole player)select 1;
private _items = magazines player;
private _availAmmo = _items arrayIntersect _ammoTurret;
if (count _availAmmo == 0) then
{
	["VehSalvNReload",[format["You need a can of %1 or any of its variants",_ammoTurret select 0]]] call para_c_fnc_show_notification;
}
else
{
	private _ammo = _availAmmo select 0;
	private _magazinesAmmoFull = magazinesAmmoFull player;
	{
		if((_x select 0) isEqualTo _ammo) then {
			_ammoCount = _x select 1;
			_magazinesAmmoFull = [];
		};
	}forEach _magazinesAmmoFull;
	["VehSalvNReloadDone",[format["You have added 1 can of %1 with %2 rounds",_ammo, _ammoCount]]] call para_c_fnc_show_notification;
	(vehicle player) addMagazineTurret [_ammo,_turretPath,_ammoCount];
	player removeMagazine _ammo;
};