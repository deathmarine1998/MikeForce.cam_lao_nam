/*
    File: fn_zone_marker_cop_info.sqf
    Author: Alablm
    Date: 2021-11-06
    Last Update: 2021-12-03
    Public: No

    Description:
        Internal use. Updates the zone marker hashMap with hostile zone info

    Parameter(s):
        _marker - Zone marker [STRING, defaults to nil]

    Returns:
        Information about the zone [TEXT]

    Example(s):
        ["base_locationName"] call para_c_fnc_zone_marker_cop_info;
*/
params ["_marker", ["_params", []]];

_params params [["_copName", _marker]];

// Capitalize name
private _formattedCopName = toUpper _copName;
// Aquire supply info
private _cop = nearestObject [getMarkerPos _marker, "Building"]; // Find nearest building to marker - should always return the basestarter
[_cop] call para_c_fnc_buildable_resupply_info params [["_percentFull", "Initializing"], "_currentSupplies", "_suppliesUntilFull", "_lifetimeSecs"];
private _info = "";
if (_percentFull isEqualType 6.9) then {
  _info = [
    _formattedCopName,
    format [localize "STR_para_overlay_buildable_percentage_filled", _percentFull * 100 toFixed 1],
    format [localize "STR_para_overlay_buildable_current_supplies", _currentSupplies toFixed 1],
    format [localize "STR_para_overlay_buildable_supplies_until_full", _suppliesUntilFull toFixed 1],
    format [localize "STR_para_overlay_buildable_lifetime", str floor (_lifetimeSecs / 3600), str floor ((_lifetimeSecs % 3600) / 60)]
  ];
} else {
  _info = [
    _formattedCopName,
    format [localize "STR_para_overlay_buildable_percentage_filled", _percentFull],
    format [localize "STR_para_overlay_buildable_current_supplies", _percentFull],
    format [localize "STR_para_overlay_buildable_supplies_until_full", _percentFull],
    format [localize "STR_para_overlay_buildable_lifetime", _percentFull]
  ];
};
_info
