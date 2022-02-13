params ["_flagPole"]; 

private _flagType = _flagPole getVariable ["flagRaised", ""];
if(_flagType isEqualTo "MikeForce")then {
	[_flagPole, ''] remoteExec ["setFlagTexture"];
	_flagPole setVariable ["flagRaised", "", true];
	["DacCongLowerFlag", ["The GIs flag has been torn down!"]] remoteExec ["para_c_fnc_show_notification", allPlayers];
} else {
	["FlagNotPresent"] call para_c_fnc_show_notification;
};
