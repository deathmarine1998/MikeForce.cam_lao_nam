#include "\a3\ui_f\hpp\definedikcodes.inc"

//--- Key down actions:
class vn_mf_keydown_escape_action
{
	defaultKey = DIK_ESC;
	shift = "false";
	ctrl = "false";
	alt = "false";
	function = "para_c_fnc_abort_building";
	down = 1;
	displayName = "";
	access = 0;
};
class para_keydown_open_wheel_menu
{
	defaultKey = DIK_6;
	shift = "false";
	ctrl = "false";
	alt = "false";
	function = "para_c_fnc_wheel_menu_open";
	down = 1;
	displayName = $STR_vn_mf_keybindings_selector;
	access = 1;
};
class para_vote_1
{
	defaultKey = DIK_F1;
	shift = "false";
	ctrl = "false";
	alt = "false";
	function = "para_c_fnc_vote_1";
	down = 1;
	displayName = "Vote for Option #1";
	access = 1;
};
class para_vote_2
{
	defaultKey = DIK_F2;
	shift = "false";
	ctrl = "false";
	alt = "false";
	function = "para_c_fnc_vote_2";
	down = 1;
	displayName = "Vote for Option #2";
	access = 1;
};

class para_vote_3
{
	defaultKey = DIK_F3;
	shift = "false";
	ctrl = "false";
	alt = "false";
	function = "para_c_fnc_openVoteMenu";
	down = 1;
	displayName = "Open Voting Menu";
	access = 1;
};

class vn_mf_interactionOverlay_toggle
{
	defaultKey = DIK_7; // 7
	shift = "false";
	ctrl = "false";
	alt = "false";
	function = "para_c_fnc_interactionOverlay_toggle";
	down = 1;
	displayName = $STR_vn_mf_keybindings_interactionOverlay_toggle;
	access = 1;
};

class vn_mf_siren_toggle
{
	defaultKey = DIK_8; // 8
	shift = "false";
	ctrl = "false";
	alt = "false";
	function = "vn_mf_fnc_saigonwarriors_toggleSiren";
	down = 1;
	displayName = $STR_vn_mf_keybindings_siren_toggle;
	access = 1;
};

//--- Key up actions:
class vn_mf_debug_monitor_action
{
	defaultKey = DIK_GRAVE;
	shift = "false";
	ctrl = "false";
	alt = "false";
	function = "vn_mf_fnc_enable_debug_monitor";
	down = 0;
	displayName = $STR_vn_mf_keybindings_debug_monitor;
	access = 1;
};
class vn_mf_task_roster_action
{
	defaultKey = DIK_H;
	shift = "false";
	ctrl = "false";
	alt = "true";
	function = "vn_mf_fnc_enable_task_roster";
	down = 0;
	displayName = $STR_vn_mf_keybindings_task_roster;
	access = 1;
};
class vn_mf_build_mode_action_up
{
	defaultKey = DIK_N;
	shift = "false";
	ctrl = "false";
	alt = "true";
	function = "para_c_fnc_toggle_buildmode";
	down = 0;
	displayName = $STR_vn_mf_keybindings_build_mode;
	access = 1;
};
class vn_mf_quick_build
{
	defaultKey = DIK_N; // CTRL + N
	shift = "false";
	ctrl = "true";
	alt = "false";
	function = "para_c_fnc_buildingMenu_quickBuild";
	down = 0;
	displayName = "Quick Build /loc";
	access = 1;
};
class vn_mf_holster_weapon
{
	defaultKey = DIK_H; // SHIFT + H
	shift = "true";
	ctrl = "false";
	alt = "false";
	function = "vn_mf_fnc_holster_weapon";
	down = 0;
	displayName = "Holster Weapon";
	access = 1;
};

class vn_mf_take_selfie
{
	defaultKey = DIK_F; // SHIFT + CTRL + F
	shift = "true";
	ctrl = "true";
	alt = "false";
	function = "vn_mf_fnc_take_selfie";
	down = 0;
	displayName = "Take Selfie";
	access = 1;
};

class vn_mf_advsling_release_cargo
{
	defaultKey = DIK_4; // SHIFT + 4
	shift = "true";
	ctrl = "false";
	alt = "false";
	function = "vn_mf_fnc_advsling_releshy_cargo";
	down = 0;
	displayName = "Release Cargo(ADVSL)";
	access = 1;
};

class vn_mf_play_possum
{
	defaultKey = DIK_T; // ALT + T
	shift = "false";
	ctrl = "false";
	alt = "true";
	function = "vn_mf_fnc_play_possum";
	down = 0;
	displayName = "Play Possum[DPCG]";
	access = 1;
};

class vn_mf_melee
{
	defaultKey = DIK_T; // CTRL + T
	shift = "false";
	ctrl = "true";
	alt = "false";
	function = "vn_mf_fnc_weapon_melee";
	down = 0;
	displayName = "Single Click Melee";
	access = 1;
};

class vn_mf_dance
{
	defaultKey = DIK_SEMICOLON; // ALT + ;
	shift = "false";
	ctrl = "false";
	alt = "true";
	function = "vn_mf_fnc_play_dance_move";
	down = 0;
	displayName = "Dance MF";
	access = 1;
};