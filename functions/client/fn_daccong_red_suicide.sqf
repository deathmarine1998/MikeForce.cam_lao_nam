params ["_suicidee"];
DacCongRedSuicide = true;
if!(player isEqualTo _suicidee)exitWith {diag_log "Error on Abu Akbar"};
_nearPlayers = (getPos _suicidee) nearObjects ["Man", 75];
{
	if(isPlayer _x)then {
		["DacCongSapper"] remoteExec ["para_c_fnc_show_notification", _x];
	};
}forEach _nearPlayers;
uiSleep 5;
uiSleep random(4);
[_suicidee] remoteExecCall ["vn_mf_fnc_server_daccong_red_suicide", 2];
uisleep 5;
if(alive player)then{player setDammage 1};
uisleep 10;
DacCongRedSuicide = false;
