/*
	File: fn_player_markers_subsystem_init.sqf
	Author: Spoffy
	Date: 2020-05-29
	Last Update: 2020-07-03
	Public: No
	
	Description:
	    Initialises the player marker subsystem. This subsystem puts markers on each player on the map, as appropriate.
	    This subsystem runs *locally*, and should run once on each client.
	
	Parameter(s): none
	
	Returns: nothing
	
	Example(s):
	    call vn_mf_fnc_player_markers_subsystem_init
*/

vn_mf_player_markers = [];
vn_mf_player_markers_manned_vehicles = [];
vn_mf_player_markers_vehicle_markers = [];

vn_dc_player_markers = [];
vn_dc_player_markers_manned_vehicles = [];
vn_dc_player_markers_vehicle_markers = [];

vn_mf_daccong_objective_artillery_markers = [];
vn_mf_daccong_objective_aa_markers = [];
vn_mf_daccong_objective_aa_zone_markers = [];
vn_mf_daccong_objective_hqsupplies_markers = [];
vn_mf_arsenal_markers = [];

// Gather required markers for modification locally
{
	if (_x find "Artillery_" isEqualTo 0)then { vn_mf_daccong_objective_artillery_markers pushBack _x };
	if ((_x find "AA_" isEqualTo 0) && !(_x find "AA_zone_" isEqualTo 0))then { vn_mf_daccong_objective_aa_markers pushBack _x };
	if (_x find "AA_zone_" isEqualTo 0)then { vn_mf_daccong_objective_aa_zone_markers pushBack _x };
	if (_x find "HQ_" isEqualTo 0)then { vn_mf_daccong_objective_hqsupplies_markers pushBack _x };
	if (_x find "arsenal_" isEqualTo 0)then { vn_mf_arsenal_markers pushBack _x };
}forEach allMapMarkers;

vn_mf_player_markers_marker_management_loop = [] spawn {
	while {isNil "abortMarkerManagement"} do {
		call vn_mf_fnc_player_markers_job;
		uisleep 2;
	};
};
vn_mf_player_markers_eachFrame_handler = addMissionEventHandler ["EachFrame", vn_mf_fnc_player_markers_update_positions];