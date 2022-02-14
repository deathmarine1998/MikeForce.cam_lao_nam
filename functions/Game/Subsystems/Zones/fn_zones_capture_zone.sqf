/*
	File: fn_zones_capture_zone.sqf
	Author: Spoffy
	Date: 2020-12-19
	Last Update: 2020-12-19
	Public: Yes
	
	Description:
		Marks a zone as captured
	
	Parameter(s):
		_zone - Zone name [String]
	
	Returns:
		None
	
	Example(s):
		["zone_ba_ria"] call vn_mf_fnc_zones_capture_zone;
*/

params ["_zone"];

//Moved to last 20 minutes
localNamespace getVariable [_zone, []] set [struct_zone_m_captured, true];

_zone setMarkerColor "ColorGreen";
_zone setMarkerBrush "DiagGrid";

private _split = _zone splitString "_";
_zoneName = [];
{
	if !(_x isEqualTo "zone")then
	{
		_zoneName pushBack _x;
	};
} forEach _split;
private _zoneFinalName = _zoneName joinString "_";

//Change Flag to USA
private _flagName = format["flag_%1",_zoneFinalName];
_flagName setMarkerType "flag_USA";
_flagName setMarkerAlpha 0.7;

//Pop message for all
private _message = format["Mike Force now controls %1! Great job boys!", markerText _zone];
["ZoneCaptured", [_message]] remoteExec ["para_c_fnc_show_notification", allPlayers];

// Increase Max AI back to Bro Nation Max
para_s_ai_obj_hard_ai_limit = para_s_ai_obj_bnmax_ai_limit;
// call restart after captured
//mf_s_capturedZoneTime = serverTime;
//CAPTUREZONE = _zone;
//CAPTUREFLAGNAME = _flagName;
//[] call para_s_fnc_restart_after_capture_init;

//remove daccong spawn points for AO here
{
	if(((_x #2) isEqualTo _zone) || ((_x #2) isEqualTo "DCPLACED"))then {
		(_x #1) call BIS_fnc_removeRespawnPosition;
	};
}forEach DCRespawnPoints;
DCRespawnCounter = 0;

//_zone setMarkerColor "ColorGreen";
[_zone, "zone_captured"] call para_c_fnc_zone_marker_add;