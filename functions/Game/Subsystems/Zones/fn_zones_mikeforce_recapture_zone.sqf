params ["_flagPole"];

private _zone = vn_mf_markers_zones select { 
 !([_flagPole] inAreaArray [markerPos _x, 1000, 1000, 0] isEqualTo []) 
};

localNamespace getVariable [_zone, []] set [struct_zone_m_captured, true];

_zone setMarkerColor "ColorYellow";

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
private _message = format["%1 has been recaptured by Mike Force, hold off last reinforcements!", markerText _zone];
["ZoneCaptured", [_message]] remoteExec ["para_c_fnc_show_notification", allPlayers];

