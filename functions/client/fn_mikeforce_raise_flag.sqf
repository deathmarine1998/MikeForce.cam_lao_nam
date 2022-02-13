params ["_flagPole"]; 

private _flagType = _flagPole getVariable ["flagRaised", ""];
if(_flagType isEqualTo "")then {
	[_flagPole, 'vn\objects_f_vietnam\flags\data\vn_flag_01_sog_co.paa'] remoteExec ["setFlagTexture"];
	_flagPole setVariable ["flagRaised","MikeForce", true];
	["MikeForceRaiseFlag", ["Defend this Flag and your AO!"]] remoteExec ["para_c_fnc_show_notification", allPlayers];
	[_flagPole] RemoteExecCall ["vn_mf_fnc_zones_mikeforce_recapture_zone", 2];
} else {
	["FlagPresent"] call para_c_fnc_show_notification;
};
