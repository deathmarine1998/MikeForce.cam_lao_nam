/*
    File: fn_supplyrequest.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-01-29
    Last Update: 2020-05-29
    Public: No
    
    Description:
        Moves player to another camp or location.
		[!:warning] The `_player` variable is passsed from the parent scope!
		[!:warning] This function should not be called directly!
    
    Parameter(s):
		_supply - Supply classname [String]
		_officer - Officier [Object]
    
    Returns: nothing
    
    Example(s): none
*/

params ["_supply","_officer"];

// make sure player is witin 20m of a supply officer
if !([_officer] inAreaArray [getPos _player, 20, 20, 0, false, 20] isEqualTo []) then
{
	private _dropMarker = _officer getVariable ["vn_mf_supply_drop_marker", "supply_drop_1"];
	private _spawnPos = getMarkerPos _dropMarker;
	private _nearby = _spawnPos nearSupplies 10;
	if (count _nearby > 5) exitWith
	{
		{["TaskFailed",["",localize "STR_vn_mf_supplydroponstandby"]] call para_c_fnc_show_notification} remoteExecCall ["call",_player];
	};

	private _dropConfig = (missionConfigFile >> "gamemode" >> "supplydrops" >> _supply);

	if !(isClass _dropConfig) exitWith {};

	private _object = createVehicle [getText (_dropConfig >> "className"), _spawnPos, [], 1, "NONE"];
	_object setMass ((getMass _object) min 2500);
	_object setVariable ["supply_drop_config", _dropConfig, true];
	_cfg = "crateConfig";
	if!(toLower(worldName) in ["cam_lao_nam","khe_sanh"])then {
		_cfg = format["crateConfig_%1", toLower(worldName)];
	};
	if (isText(_dropConfig >> _cfg)) then 
	{
		[_object, getText(_dropConfig >> _cfg), true] call vn_mf_fnc_override_crate_contents;
	};
	_extraItems = getArray(_dropConfig >> "extraItems");
	{
		if (_x isEqualType [] && {count _x == 2} && {_x select 0 isEqualType ""} && {_x select 1 isEqualType 0}) then {
			_object addItemCargoGlobal [_x select 0, _x select 1];
		};
	}forEach _extraItems;
	_extraAmmo = getArray(_dropConfig >> "extraMagazines");
	{
		if (_x isEqualType [] && {count _x == 2} && {_x select 0 isEqualType ""} && {_x select 1 isEqualType 0}) then {
			_object addMagazineCargoGlobal [_x select 0, _x select 1];
		};
	}forEach _extraAmmo;
	
	[_object, false] call para_s_fnc_allow_damage_persistent;

	[	
		[getText (_dropConfig >> "name")],
		{
			["TaskSucceeded",["",format[localize "STR_vn_mf_dropincomming", localize (_this select 0)]]] call para_c_fnc_show_notification
		}
	] remoteExecCall ["call",_player];
};
