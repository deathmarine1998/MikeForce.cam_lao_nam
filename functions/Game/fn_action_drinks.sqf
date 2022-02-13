params ["_object"];

private _kittybarDropsConfig = (missionConfigFile >> "gamemode" >> "kittybardrops");

private _kittybardrops = "true" configClasses _kittybarDropsConfig;
// add supply officer actions
{
	private _request = configName _x;
    private _name = localize getText (_x >> "name");
	private _icon = getText (_x >> "icon");

	[
		_object,
		true,
		_icon,
		"",
		[_request, _object],
		_name,
		"vn_mf_fnc_client_request_drinks"
	] call para_c_fnc_wheel_menu_add_obj_action;
} forEach _kittybardrops;