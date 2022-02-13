params ["_zone"];

_zone setMarkerColor "ColorGreen";
_zone setMarkerBrush "Solid";

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
private _message = format["Mike Force has held onto %1!", markerText _zone];
["ZoneCaptured", [_message]] remoteExec ["para_c_fnc_show_notification", allPlayers];

// Increase Max AI back to Bro Nation Max
para_s_ai_obj_hard_ai_limit = 1;
// call restart after captured
mf_s_heldZoneTime = diag_tickTime;
CAPTUREZONE = _zone;
CAPTUREFLAGNAME = _flagName;
[] call para_s_fnc_restart_after_hold_init;

//remove daccong spawn points for AO here
{
	if(((_x #2) isEqualTo _zone) || ((_x #2) isEqualTo "DCPLACED"))then {
		(_x #1) call BIS_fnc_removeRespawnPosition;
	};
}forEach DCRespawnPoints;
DCRespawnCounter = 0;