params ["_request", "_agent"];

private _kittybarDropsConfig = (missionConfigFile >> "gamemode" >> "kittybardrops");
private _booze = getText(_kittybarDropsConfig >> _request >> "className");
private _inHand = getText(_kittybarDropsConfig >> _request >> "inHandItem");

player addMagazine [_booze,1];

BOOZEBOTTLE = _inHand createVehicle position player;  
BOOZEBOTTLE attachTo [player, [0.04, -0.1, -0.05], "RightHandMiddle1",true];  
BOOZEBOTTLE setVectorDirAndUp [[0.5, 0.5, 0], [-0.5, 0.5, 0]];
