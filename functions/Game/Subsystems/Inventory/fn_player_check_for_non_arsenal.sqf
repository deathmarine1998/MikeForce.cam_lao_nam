/*
	fn_mikeforce_checkInv.sqf
	
	Description:
		This allows the arsenal.hpp to control all things arma on a player during gameplay
		We will only check the arsenal for weapon, mag
*/

private _gmCfg = missionConfigFile >> "gamemode";
private _debug = if(getNumber(_gmCfg >> "debug" >> "playerinvchecks") isEqualTo 1)then { true } else { false };
private _arsenal = getText(_gmCfg >> "modded_ops" >> "arsenal_name");
private _cfg = missionConfigFile >> "vn_whitelisted_arsenal_loadouts" >> _arsenal;
private _itemsArray = getArray(_cfg >> "items");

if(groupId group player in ["DacCong", "MACV", "DOD"])exitWith {};

//check weapons not team or rank - players use enemy weapons in times of need do not do team rank checks
{
	if!(_x in InvCheckWpns)then { 
		if(_debug)then { diag_log format["[+]fn_mikeforce_checkInv removed weapon:%1",_x] };
		player removeWeapon _x;
	};
}forEach (weapons player);

//check mags - because of the allowed weapons as such above allow the mags 
{
	if!(_x in InvCheckMags)then { 
		if(_debug)then { diag_log format["[+]fn_mikeforce_checkInv removed mag:%1",_x] };
		player removeMagazine _x;
	};
}forEach (magazines player);

//check backpack - do not do team rank checks as looted bodies will yield opfor classname backpackse
if( !(backpack player in InvCheckBpks) && !(backpack player isEqualTo "") )then {
	if(_debug)then { diag_log format["[+]fn_mikeforce_checkInv removed backpack:%1",(backpack player)] };
	removeBackpack player;
};

//check items
{
	if(_x == "") exitWith {};
	if(isClass(configFile >> "CfgWeapons" >> _x))then {
		if( !(_x in InvCheckWpns) && !(_x in InvCheckItems ) )then { 
			if(_debug)then { diag_log format["[+]fn_mikeforce_checkInv removed weapon:%1",_x] };
			player removeWeapon _x;
		};
	}else{
		if!(_x in InvCheckItems)then { 
			if(_debug)then { diag_log format["[+]fn_mikeforce_checkInv removed item:%1",_x] };
			player removeItem _x;
		};
	};
}forEach (items player);

//check items for team and ranks
{
	if(_x == "") exitWith {};
	_item = _x;
	_array = _itemsArray select { (_x#0) == _item };
	_teamRanks = (_array#0)#1;
	if(!(_x in InvCheckItems) || (_teamRanks#1 == -1))then { 
		if(_debug)then { diag_log format["[+]fn_mikeforce_checkInv removed linked item:%1",_x] };
		player unlinkItem _item;
		player removeItem _item;
	};
}forEach ([headgear player, goggles player, hmd player, binocular player, uniform player, vest player]+ assignedItems player + items player);

/*
private _allWpns = weapons player;
private _allMags = magazines player;
private _allItems = items player;
private _headStuff = [headgear player, goggles player, hmd player, binocular player];
private _headgear = headgear player;
private _googles = goggles player;
private _hmd = hmd player;
private _binos = binocular player;

_helmetArray = ((_itemsArray select { (_x#0) == _headgear })#0)#1;
if(_helmetArray#1 == -1)then { player unlinkItem _headgear;player removeItem _headgear };

_gogglesArray = ((_itemsArray select { (_x#0) == _googles })#0)#1;
if(_gogglesArray#1 == -1)then { player unlinkItem _goggles;player removeItem _goggles };

_hmdArray = _itemsArray select { (_x#0) == _hmd };
if(_hmdArray#1 == -1)then { player unlinkItem _hmd;player removeItem _hmd };

_binosArray = _itemsArray select { (_x#0) == _binos };
if(_binosArray#1 == -1)then { player unlinkItem _binos;player removeItem _binos };
*/

/*
{
	_itemsArray = getArray(_cfg >> "items");
	_itemsArray select {(_x#0) == _headgear};
}forEach [_headgear, _googles, _hmd, _binos];


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