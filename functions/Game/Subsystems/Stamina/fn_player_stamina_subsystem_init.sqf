private _staminaSettings = (missionConfigFile >> "gamemode" >> "settings" >> "stamina");
private _staminaRegen = getNumber(_staminaSettings >> "staminaRegen");
private _staminaDepletionOffset = getNumber(_staminaSettings >> "staminaDepletionOffset");
private _staminaMax = getNumber(missionConfigFile >> "gamemode" >> "settings" >> "stamina" >> "staminaMax");

vn_mf_player_stamina_regen = _staminaRegen;
vn_mf_player_stamina_depletion_offset = _staminaDepletionOffset;
player setVariable["vn_mf_player_stamina_max", _staminaMax];
vn_mf_player_stamina_timer = 0;
player setVariable["vn_mf_player_stamina_anim_speed", 0.95];
player setVariable["vn_mf_player_energy_stamina_timer", 0];

vn_mf_player_stamina_eachFrame_handler = addMissionEventHandler ["EachFrame", vn_mf_fnc_player_stamina_update];