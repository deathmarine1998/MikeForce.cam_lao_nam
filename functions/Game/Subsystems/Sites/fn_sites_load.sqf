/*
    File: fn_sites_load.sqf
    Author: Spoffy
    Date: 2020-12-11
    Last Update: 2020-12-11
    Public: No
    
    Description:
		Loads saved sites.
    
    Parameter(s):
		None
    
    Returns:
		Load successful [BOOL]
    
    Example(s):
		[] call vn_mf_fnc_sites_load;
*/

params ["_zone"];
_return = false;

if(_zone in mf_s_loaded_sites)then { _return = true };

_return
