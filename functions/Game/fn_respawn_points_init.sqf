/*
    File: fn_respawn_points_init.sqf
    Author: Spoffy
    Date: 2020-10-10
    Last Update: 2020-10-10
    Public: No
    
    Description:
		Sets up main mission respawn points
    
    Parameter(s):
		None
    
    Returns:
		None
    
    Example(s):
		[] call vn_mf_fnc_respawn_points_init
*/

private _debug = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "zoneMarkers");

private _indpRespawnMarker = createMarker ["indp_respawn_666", [15882.1,18089.6,0.1]];
_indpRespawnMarker setMarkerAlpha 0;
private _respawnID = [independent, _indpRespawnMarker] call BIS_fnc_addRespawnPosition;

vn_indp_respawn_points = vn_indp_markers_base_respawns apply
{
	[independent, _x, markerText _x] call BIS_fnc_addRespawnPosition;
	if (_debug isEqualTo 1) then { diag_log format["[+]fn_respawn_points_init DBG-1 MikeForce marker:%1", _x] };
};
vn_mf_respawn_points = vn_mf_markers_base_respawns apply 
{ 
	[west, _x, markerText _x] call BIS_fnc_addRespawnPosition;
	[independent, _x, markerText _x] call BIS_fnc_addRespawnPosition;
	if (_debug isEqualTo 1) then { diag_log format["[+]fn_respawn_points_init DBG-1 MikeForce marker:%1", _x] };
};

vn_dc_respawn_points = vn_dc_markers_base_respawns apply 
{ 
	[east, _x, markerText _x] call BIS_fnc_addRespawnPosition;
	if (_debug isEqualTo 1) then { diag_log format["[+]fn_respawn_points_init DBG-2 DacCong marker:%1", _x] };
};