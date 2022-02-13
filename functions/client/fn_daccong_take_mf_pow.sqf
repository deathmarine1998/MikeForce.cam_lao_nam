params ["_unit"]; // the soldier to abduct

if(_unit call para_g_fnc_unit_is_incapacitated)then {
	private _unitName = name _unit;
	removeAllWeapons _unit;
	removeAllContainers _unit;
	removeGoggles _unit;
	removeHeadgear _unit;
	private _message = format["%1 is now a Dac Cong POW", _unitName];
	["DacCongPOW", [_message]] remoteExec ["para_c_fnc_show_notification", allPlayers];
	[player] remoteExec ["vn_mf_fnc_mikeforce_become_pow", _unit];
} else {
	["POWFailed"] call para_c_fnc_show_notification;
};
