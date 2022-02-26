/*
	fn_mikeforce_checkInv.sqf
*/

private _cfg = missionConfigFile >> "vn_whitelisted_arsenal_loadouts" >> "vn_mikeforce";
private _allWpns = weapons player;
private _allMags = magazines player;
private _allItems = items player;
private _headStuff = [headgear player, goggles player, hmd player, binocular player];
private _headgear = headgear player;
private _googles = goggles player;
private _hmd = hmd player;
private _binos = binocular player;

{
	if!(_x in InvCheckWpns)then { player removeWeapon _x };
}forEach _allWpns;

{
	if!(_x in InvCheckMags)then { player removeMagazine _x };
}forEach _allMags;

{
	if!(_x in InvCheckItems)then { player removeItem _x };
}forEach _allItems;

{
	if!(_x in InvCheckItems)then { player removeItem _x };
}forEach _headStuff;
/*
private _unitGroup = groupId group player;
if!(_unitGroup in ["DacCong", "MACV", "DOD", "Montagnard"])then {
	{
		private _wCfg = (getNumber(_cfg >> "weapons" >> _x)) select 1;
		if(_wCfg isEqualTo -1)then { player removeWeapon _x };
	}forEach _allWpns;
	{
		private _mCfg = (getNumber(_cfg >> "magazines" >> _x)) select 1;
		if(_mCfg isEqualTo -1)then { player removeMagazine _x };
	}forEach _allMags;
	{
		private _iCfg = (getNumber(_cfg >> "items" >> _x)) select 1;
		if(_iCfg isEqualTo -1)then { player removeItem _x };
	}forEach _allItems;
	{
		private _mCfg = (getNumber(_cfg >> "items" >> _x)) select 1;
		if(_mCfg isEqualTo -1)then { player removeItem _x };
	}forEach _headStuff;
};*/