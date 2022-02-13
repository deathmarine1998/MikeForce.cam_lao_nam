/*
    File: fn_sites_init.sqf
    Author: Spoffy
    Date: 2020-12-11
    Last Update: 2020-12-11
    Public: Yes
    
    Description:
        Starts the sites system, which is responsible for managing all of the AI controlled installations and building new ones.
    
    Parameter(s):
        None
    
    Returns:
        None
    
    Example(s):
        [] call vn_mf_fnc_sites_init
		
No longer used, moved settings to server init and called by each opening of zone
*/
/*
mf_s_max_camps_per_zone = 4;
mf_s_max_aa_per_zone = 6;
mf_s_max_artillery_per_zone = 5;
mf_s_max_fortifications_per_zone = 0;
mf_s_max_tunnels_per_zone = 3;
mf_s_max_roadblocks_per_zone = 2;
mf_s_max_tunnels_watersupply_per_zone = 2;
mf_s_max_vehicles_per_zone = 2;
mf_s_loaded_sites = [];
DCRespawnPoints = [];

localNamespace setVariable ["sites", []];


private _loadSuccessful = [] call vn_mf_fnc_sites_load;

if !(_loadSuccessful) then 
{
    //Generate sites
    [] call vn_mf_fnc_sites_generate;
};

[] call vn_mf_fnc_sites_aa_reveal_targets;
*/