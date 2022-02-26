private ["_player"];
//send the sound to the closest clients

{
	if(isPlayer _x)then {
		[] remoteExec ['VN_MF_FNC_muskets_bentham_creama', _x];
	};
} forEach ((getPos player) nearObjects ['Man', 1.7]);
