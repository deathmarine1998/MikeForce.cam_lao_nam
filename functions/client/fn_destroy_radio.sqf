params ["_radio"];

private _ready2Blow = false;
private _explosives = getArray(missionConfigFile >> "gamemode" >> "sites" >> "sitescfg" >> "explosives");
private _explosives4 = getArray(missionConfigFile >> "gamemode" >> "sites" >> "sitescfg" >> "explosives4");
private _player = player; 
private _items = magazines _player; 
private _availExpl = _items arrayIntersect _explosives;
if!(_availExpl isEqualTo [])then {
	_player removeMagazine (_availExpl select 0);
	_ready2Blow = true;
} else {
	_allMags = magazinesAmmo _player; 
	_availExpl4 = _allMags select { _x#0 in _explosives4 };
	if(count(_availExpl4) >= 4)then {
		for "_i" from 0 to 3 do {
			_player removeMagazine ((_availExpl4#_i)#0);
		};
		_ready2Blow = true;
	};
};

if(_ready2Blow)then {
	private _nearPlayers = (getPos _radio) nearObjects ["Man", 50];
	{
		if(isPlayer _x)then {
			["FireInTheHole"] remoteExec ["para_c_fnc_show_notification", _x];
		};
	}forEach _nearPlayers;
	uisleep 15;
	[_radio, _player] remoteExecCall ["vn_mf_fnc_server_destroy_hq", 2];
} else {
	["NoSatchels"] call para_c_fnc_show_notification;
};