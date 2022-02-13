mf_obj2remove = getArray(missionConfigFile >> "gamemode" >> "settings" >> "blacklisted" >> "objects");

["cleanup_arsenal", para_s_fnc_cleanup_arsenal, [], 420] call para_g_fnc_scheduler_add_job;