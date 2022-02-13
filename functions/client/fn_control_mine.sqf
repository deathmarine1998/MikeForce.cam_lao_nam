params ["_mine"];

if(random(100)<10)exitWith { ["FailedAttempt",["You could not take control of the mine"]] call para_c_fnc_show_notification; };
player addOwnedMine _mine;
