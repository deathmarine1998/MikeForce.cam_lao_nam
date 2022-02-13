/*
    File: fn_building_system_init.sqf
    Author: Spoffy
    Date: 2020-08-21
    Last Update: 2020-08-21
    Public: Yes
    
    Description:
		Initalises the building system
    
    Parameter(s):
		None
    
    Returns:
		None
    
    Example(s):
		[] call para_s_fnc_building_system_init
*/

para_g_max_base_radius = 250;
publicVariable "para_g_max_base_radius";

para_g_max_cop_radius = 1500;
publicVariable "para_g_max_cop_radius";

mf_s_baseFlagBuilt = false;

// init buildables type arrays
private _gamemode_config = (missionConfigFile >> "gamemode");
private _buildables_config = (_gamemode_config >> "buildables");
private _classes = "isClass _x" configClasses (_buildables_config);
private _types = [];
{
	private _buildable_type = getText(_x >> "type");
	if !(_buildable_type in _types) then
	{
		_types pushBack _buildable_type;
		missionNamespace setVariable [format["para_buildings_%1",_buildable_type],[]];
	};
} forEach _classes;

//All bases
para_g_bases = [];
para_g_cops = [];

//All buildings
para_l_buildings = [];

//Load any saved bases.
[] call para_s_fnc_basebuilding_load;