{
	[[_x],"rank",2] call vn_mf_fnc_change_player_stat;
	//send message
	[{systemChat "Thanks for playing at Bro-Nation!"}] remoteExec ["call", _x]; 
}forEach allPlayers;