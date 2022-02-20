private ["_unit"];
//attach sound to vehicle

private _group_ID = player getVariable "vn_mf_db_player_group";

if(_group_ID == "SaigonWarriors") then {
	[player] spawn { 

		_loop = 0;
		while {_loop < 3} do
		{
			_player = (_this# 0); 
			playSound3d [getMissionPath "\custom\sounds\siren.ogg", (vehicle _player), false, getPosASL (vehicle _player), 5, 1, 200, 0, false];
			uisleep 2.9;  

			_loop = _loop + 1;
		};
	};
};
