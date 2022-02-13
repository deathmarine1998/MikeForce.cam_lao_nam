params ["_radio"];

private _player = player; 

[_radio, _player] remoteExecCall ["vn_mf_fnc_server_gather_intel", 2];
