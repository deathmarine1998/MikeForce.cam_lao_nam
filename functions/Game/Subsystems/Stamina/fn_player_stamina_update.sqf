if!(vehicle player == player)exitWith {};

if(isNil "vn_mf_player_stamina_timer")then { vn_mf_player_stamina_timer = 0 };

if((diag_TickTime - vn_mf_player_stamina_timer) > 0.5)then { vn_mf_player_stamina_timer = diag_TickTime };

private _animSpd = player getVariable["vn_mf_player_stamina_anim_speed",0.95];
player setAnimSpeedCoef _animSpd;

private _attributes = _player getVariable ["vn_mf_db_attributes",[]];
private _staminaMax = _player getVariable["vn_mf_player_stamina_max", 100];
if("energy" in _attributes)exitWith { player setStamina _staminaMax };

private _currentStamina = (getStamina player) min (_staminaMax);
if((speed player == 0) && !(_currentStamina >= _staminaMax))then {
	player setStamina (_currentStamina + vn_mf_player_stamina_regen);
}else{
	player setStamina (_currentStamina + vn_mf_player_stamina_depletion_offset);
};
