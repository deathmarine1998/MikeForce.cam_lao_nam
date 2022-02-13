params ["_flagPole"]; 

private _flagType = _flagPole getVariable ["flagRaised", ""];
if(_flagType isEqualTo "")then {
	[_flagPole, 'vn\objects_f_vietnam\flags\data\vn_flag_01_vc_co.paa'] remoteExec ["setFlagTexture"];
	_flagPole setVariable ["flagRaised","DacCong", true];
	["DacCongRaiseFlag", ["DacCong has raised their flag and stolen the AO!"]] remoteExec ["para_c_fnc_show_notification", allPlayers];
	[_flagPole] RemoteExecCall ["vn_mf_fnc_zones_daccong_capture_zone", 2];
} else {
	["FlagPresent"] call para_c_fnc_show_notification;
};
