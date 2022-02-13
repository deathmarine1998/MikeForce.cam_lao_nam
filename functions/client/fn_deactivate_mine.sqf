params ["_mine"];

private _mName = typeOf _mine;
private _mines = getArray(missionConfigFile >> "gamemode" >> "settings" >> "mines" >> "ammomags");
private _mineArray = _mines select { _x#0 isEqualTo _mName };
if!(player canAddItemToBackpack _mineArray#0#1)then {
	if!(player canAddItemToVest _mineArray#0#1)then {
		["NotEnoughSpace",["Not enough space to pickup the explosive"]] call para_c_fnc_show_notification;
	};
} else {
	deleteVehicle _mine;
	player addMagazine _mineArray#0#1;
	private _nearPlayers = (getPos _mine) nearObjects ["Man", 15];
	{
		if(isPlayer _x)then {
			["MineDeactivated"] remoteExec ["para_c_fnc_show_notification", _x];
		};
	}forEach _nearPlayers;
};
