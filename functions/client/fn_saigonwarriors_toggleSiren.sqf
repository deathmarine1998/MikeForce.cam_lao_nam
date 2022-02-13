private ["_unit"];
//attach sound to vehicle

[player] spawn { 
 _player = (_this# 0); 
 _source = playSound3d [getMissionPath "\custom\sounds\siren.ogg", (vehicle _player), false, getPosASL (vehicle _player), 5, 1, 200, 0, false];
_source attachTo [_player,[0,25,0]];
 uisleep 2.9;  
 deleteVehicle _source;  

 _source2 = playSound3d [getMissionPath "\custom\sounds\siren.ogg", (vehicle _player), false, getPosASL (vehicle _player), 5, 1, 200, 0, false]; 
_source2 attachTo [_player,[0,25,0]]; 
 uisleep 2.9;  
 deleteVehicle _source2;  

 _source3 = playSound3d [getMissionPath "\custom\sounds\siren.ogg", (vehicle _player), false, getPosASL (vehicle _player), 5, 1, 200, 0, false]; 
_source3 attachTo [_player,[0,25,0]]; 
 uisleep 2.9;  
 deleteVehicle _source3; 

 _source4 = playSound3d [getMissionPath "\custom\sounds\siren.ogg", (vehicle _player), false, getPosASL (vehicle _player), 5, 1, 200, 0, false]; 
_source4 attachTo [_player,[0,25,0]]; 
 uisleep 2.9;  
 deleteVehicle _source4; 

_source5 = playSound3d [getMissionPath "\custom\sounds\siren.ogg", (vehicle _player), false, getPosASL (vehicle _player), 5, 1, 200, 0, false]; 
_source5 attachTo [_player,[0,25,0]]; 
 uisleep 2.9;  
 deleteVehicle _source5; 
};
