params["_weaponTurret"];
private _magsTurret = [];
private _magTurret = "";
private _magAmmo = 0;
private _turretPath = (assignedVehicleRole player)select 1;
private _classNameTurret = ((vehicle player) weaponsTurret _turretPath)#0;
private _nameTurret = getText(configFile >> "CfgWeapons" >> _classNameTurret >> "displayName");
private _allTurretMags = magazinesAllTurrets vehicle player;
{
	if(_x#1 isEqualTo _turretPath)then {
		_magsTurret pushBack _x;
	};
}forEach _allTurretMags;
if (count _magsTurret == 0) exitWith {
	["VehSalvNReload",[format["The %1 turret does not have any ammo",_nameTurret]]] call para_c_fnc_show_notification;
};
_magTurret = (_magsTurret#0)#0;
_magAmmo = (_magsTurret#0)#2;
if!(player canAddItemToBackpack _magTurret)then {
	["VehSalvNReload",["Not enough space to unload this ammo"]] call para_c_fnc_show_notification;
}else{
	["VehSalvNReloadDone",[format["You have removed 1 can of %1 with %2 rounds",_magTurret, _magAmmo]]] call para_c_fnc_show_notification;
	player addMagazine [_magTurret,_magAmmo];
	vehicle player removeMagazineTurret [_magTurret,_turretPath];
};

/*
private _magsAccepted = getArray(configFile >> "CfgWeapons" >> _classNameTurret >> "magazines");
private _magsTurretDetails = magazinesAmmo vehicle player;
if!(_magsTurretDetails isEqualTo [])then {
	_magTurret = (_magsTurretDetails#0)#0;
	if(_magTurret in _magsAccepted)then {
		_magAmmo = (_magsTurretDetails#0)#1;
	};
} else {
	_magsTurretDetails = vehicle player magazinesTurret _turretPath;
	_magTurret = _magsTurretDetails#0;
	_fullMagAmmo = getNumber(configFile >> "CfgMagazines" >> _magsAccepted#0 >> "count");
	_magAmmo = random (_fullMagAmmo) max (_fullMagAmmo*0.1);
	
};

if!(player canAddItemToBackpack _magTurret)exitWith {
	["VehSalvNReload",["Not enough space to unload this ammo"]] call para_c_fnc_show_notification;
};
if (count _magsTurret == 0) then
{
	["VehSalvNReload",[format["The %1 turret does not have any ammo",_nameTurret]]] call para_c_fnc_show_notification;
}
else
{
	["VehSalvNReloadDone",[format["You have removed 1 can of %1 with %2 rounds",_magTurret, _magAmmo]]] call para_c_fnc_show_notification;
	player addMagazine [_magTurret,_magAmmo];
	vehicle player removeMagazineTurret [_magTurret,_turretPath];
};*/