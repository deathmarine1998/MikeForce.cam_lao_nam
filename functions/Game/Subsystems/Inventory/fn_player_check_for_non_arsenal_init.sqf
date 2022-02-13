private _arsenal = getText(missionConfigFile >> "gamemode" >> "modded_ops" >> "arsenal_name");
private _cfg = missionConfigFile >> "vn_whitelisted_arsenal_loadouts" >> _arsenal;

InvCheckWpns = [];
InvCheckMags = [];
InvCheckItems = [];
InvCheckBpks = [];

private _weapons = getArray(_cfg >> "weapons");
{
	InvCheckWpns pushBack (_x# 0);
}forEach _weapons;
private _mags = getArray(_cfg >> "magazines");
{
	InvCheckMags pushBack (_x# 0);
}forEach _mags;
private _items = getArray(_cfg >> "items");
{
	InvCheckItems pushBack (_x# 0);
}forEach _items;
private _bpks = getArray(_cfg >> "backpacks");
{
	InvCheckBpks pushBack (_x# 0);
}forEach _bpks;

["Inventory", vn_mf_fnc_player_check_for_non_arsenal, [], 5] call para_g_fnc_scheduler_add_job;