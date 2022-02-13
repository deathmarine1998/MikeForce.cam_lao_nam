params ["_flagPole"];

private _zone = vn_mf_markers_zones select { 
 !([_flagPole] inAreaArray [markerPos _x, 1000, 1000, 0] isEqualTo []) 
};

localNamespace getVariable [_zone, []] set [struct_zone_m_captured, false];

_zone setMarkerColor "ColorRed";

private _split = _zone splitString "_";
_zoneName = [];
{
	if !(_x isEqualTo "zone")then
	{
		_zoneName pushBack _x;
	};
} forEach _split;
private _zoneFinalName = _zoneName joinString "_";

//Change Flag to DacCong
private _flagName = format["flag_%1",_zoneFinalName];
_flagName setMarkerType "vn_flag_vc";
_flagName setMarkerAlpha 0.7;

//Pop message for all
private _message = format["%1 has been recaptured by Dac Cong, get off your ass GIs", markerText _zone];
["DacCongCaptured", [_message]] remoteExec ["para_c_fnc_show_notification", allPlayers];

// Increase Max AI back to Bro Nation Max to hold the zone for Dac Cong
para_s_ai_obj_hard_ai_limit = para_s_ai_obj_bnmax_ai_limit;
