/*
    File: once_a_minute.sqf
    Author: Aaron Clark
    Date: 2020-07-25
    Last Update: 2020-07-25
    Public: No

    Description:
	No description added yet.

    Parameter(s): none

    Returns: nothing

    Example(s):
    	Not called directly.
*/

//Ensure snakes are active before running the handler
private _activeSnakes = (["snake_bite_chance", 50] call BIS_fnc_getParamValue) > 0;
if (_activeSnakes) then {
  // tame a random snake
  call vn_mf_fnc_snake_handler;
};

{
	if(diag_tickTime - (_x# 1) > 59)then {
		deleteVehicle (_x# 0);
	};
} forEach GroundWeaponHolders;

private _timer = player getVariable["vn_mf_player_energy_stamina_timer", 0];
private _attributes = player getVariable ["vn_mf_db_attributes",[]];
private _elapsed = diag_tickTime - _timer;
if("energy" in _attributes)then 
{ 
	if(_elapsed < 60)then { vn_mf_player_stamina_anim_speed = 1.15 };
	if(_elapsed < 120)then { vn_mf_player_stamina_anim_speed = 1.1 };
	if(_elapsed < 180)then { vn_mf_player_stamina_anim_speed = 1.05 };
	if(_elapsed < 240)then { vn_mf_player_stamina_anim_speed = 1 };
};
NoEnergy = false;
if( ("energy" in _attributes) && (_timer == 0) )then { NoEnergy = true };
if( ("energy" in _attributes) && (_elapsed > 500) && !(_timer == 0) )then { NoEnergy = true };

if(NoEnergy)then 
{
	player setVariable["vn_mf_player_energy_stamina_timer", 0];
	player setVariable["vn_mf_player_stamina_max", 120];
	player setVariable["vn_mf_player_stamina_anim_speed", 0.95];
	["eatdrink", [0,0,"vn_fake_prop_energy_remover"]] call para_c_fnc_call_on_server;
	vn_mf_player_stamina_anim_speed = 0.95;	
};