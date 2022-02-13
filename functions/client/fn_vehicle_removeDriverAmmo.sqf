params["_classNameTurret"];
private _nameTurret = getText(configFile >> "CfgWeapons" >> _classNameTurret >> "displayName");
private _magsTurretDetails = magazinesAmmo vehicle player;
private _magsTurret = (_magsTurretDetails select 0) select 0;
private _magAmmo = (_magsTurretDetails select 0) select 1;
if (count _magsTurretDetails == 0) then
{
	["VehSalvNReload",[format["The %1 turret does not have any ammo",_nameTurret]]] call para_c_fnc_show_notification;
}
else
{
	["VehSalvNReloadDone",[format["You have removed 1 can of %1 with %2 rounds",_magsTurret, _magAmmo]]] call para_c_fnc_show_notification;
	player addMagazine [_magsTurret,_magAmmo];
	(vehicle player) removeMagazineTurret [_magsTurret,[-1]];
};