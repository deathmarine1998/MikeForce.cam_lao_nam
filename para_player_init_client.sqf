/*
/*
	File: para_player_init_client.sqf
	Author: Spoffy
	Date: 2020-10-12
	Last Update: 2020-10-12
	Public: Yes
	
	Description:
		Called on the client after player_init_server has finished.
		Serverside player initialisation is done at this point.
		It is safe to access the player object in this function.
		Used for setting up UI elements, local event handlers, etc.

		Load order:
			- para_player_preload_client.sqf - Called as soon as possible on the client.
			- para_player_loaded_client.sqf - Called on client as soon as the player is ready
			- para_player_init_server.sqf - Serverside player initialisation.
			- para_player_init_client.sqf - Clientside player initialisation.
			- para_player_postinit_server.sqf - Called on server once all player initialisation is done.
	
	Parameter(s):
		_player - Player to initialise [OBJECT]
		_didJIP - Whether the player joined in progress [BOOLEAN]
	
	Returns:
		None
	
	Example(s):
		//description.ext
		use_paradigm_init = 1;
*/

params ["_player", "_didJIP"];


private _uid = getPlayerUID _player;
private _group_ID = _player getVariable ["vn_mf_db_player_group", "MikeForce"];
private _config = (missionConfigFile >> "gamemode" >> "whitelisting");
private _whitelisting = (getNumber(_config >> "whitelisting") isEqualTo 1);
private _type = typeOf _player;
if(_type isEqualTo "vn_o_men_nva_dc_09") then { 
	private _teamMembers = getArray(_config >> "daccong" >> "members");
	if(_whitelisting && !(_uid in _teamMembers))then {
		["changeteam", ["MikeForce"]] call para_c_fnc_call_on_server;
		endMission "ReservedDacCong";
	} else {
		_group_ID = "DacCong";
	};
};

if(_type isEqualTo "C_journalist_F") then { endMission "ReservedPress" };

if(_type isEqualTo "vn_i_men_sf_12") then { 
	private _teamMembers = getArray(_config >> "montagnard" >> "members");
	if(_whitelisting && !(_uid in _teamMembers))then {
		["changeteam", ["MikeForce"]] call para_c_fnc_call_on_server;
		endMission "ReservedMontagnard";
	} else {
		_group_ID = "Montagnard";
	};
};
_charCheck = getArray(missionConfigFile >> "gamemode" >> "modded_ops" >> "characterClass_check");
if!(_group_ID in ["Montagnard","DacCong"])then {
	if!(_type in _charCheck)then {
		//kick player here
		diag_log "player is not a proper character setup in the mission by MF or BroNation";
	};
};

if(_group_ID in ["MikeForce", "ACAV", "GreenHornets", "SpikeTeam", "BNCadet"])then {
	[player, "BroNation"] call BIS_fnc_setUnitInsignia;
};

//Diary entries
player createDiaryRecord ["Diary", [localize "STR_vn_mf_howtobuild", localize "STR_vn_mf_howtobuild_long"], taskNull, "", false];
player createDiaryRecord ["Diary", [localize "STR_vn_mf_zoneprogression", localize "STR_vn_mf_zoneprogression_long"], taskNull, "", false];
player createDiaryRecord ["Diary", [localize "STR_vn_mf_other_keys", localize "STR_vn_mf_other_keys_long"], taskNull, "", false];
player createDiaryRecord ["Diary", [localize "STR_vn_mf_bn_faq", localize "STR_vn_mf_bn_faq_long"], taskNull, "", false];
player createDiaryRecord ["Diary", [localize "STR_vn_mf_bn_guidelines", localize "STR_vn_mf_bn_guidelines_long"], taskNull, "", false];
//This diary entry goes last to be first on the list
player createDiaryRecord ["Diary", [localize "STR_vn_mf_bronation", localize "STR_vn_mf_bronation_long"], taskNull, "", false];

// Instantiate the main scheduler
[] call para_g_fnc_scheduler_subsystem_init;

// display initial loading text
[parseText format["<t font='tt2020base_vn' color='#F5F2D0'>%1</t>",localize "STR_vn_mf_loading1"]] call vn_mf_fnc_update_loading_screen;

uiSleep 0.4;
progressLoadingScreen 0.2;
[parseText format["<t font='tt2020base_vn' color='#F5F2D0'>%1</t>",localize "STR_vn_mf_loading2"]] call vn_mf_fnc_update_loading_screen;

uiSleep 0.4;
progressLoadingScreen 0.25;
// add display event handlers
call para_c_fnc_init_display_event_handler;
[parseText format["<t font='tt2020base_vn' color='#F5F2D0'>%1</t>",localize "STR_vn_mf_loading3"]] call vn_mf_fnc_update_loading_screen;

uiSleep 0.4;
progressLoadingScreen 0.3;
// add player event handlers
call para_c_fnc_init_player_event_handlers;
[parseText format["<t font='tt2020base_vn' color='#F5F2D0'>%1</t>",localize "STR_vn_mf_loading4"]] call vn_mf_fnc_update_loading_screen;

uiSleep 0.4;
progressLoadingScreen 0.35;
// add self actions
call vn_mf_fnc_action_drink_water;
[parseText format["<t font='tt2020base_vn' color='#F5F2D0'>%1</t>",localize "STR_vn_mf_loading5"]] call vn_mf_fnc_update_loading_screen;

uiSleep 0.4;
progressLoadingScreen 0.4;
// add self actions
call vn_mf_fnc_action_eat_food;
[parseText format["<t font='tt2020base_vn' color='#F5F2D0'>%1</t>",localize "STR_vn_mf_loading6"]] call vn_mf_fnc_update_loading_screen;

// add new task actions
call vn_mf_fnc_action_load_actions;

uiSleep 0.4;
progressLoadingScreen 0.45;
// create UI
0 spawn vn_mf_fnc_ui_create;
[parseText format["<t font='tt2020base_vn' color='#F5F2D0'>%1</t>",localize "STR_vn_mf_loading7"]] call vn_mf_fnc_update_loading_screen;

uiSleep 0.4;
progressLoadingScreen 0.5;
// master loop
0 spawn para_c_fnc_compiled_loop_init;
[parseText format["<t font='tt2020base_vn' color='#F5F2D0'>%1</t>",localize "STR_vn_mf_loading8"]] call vn_mf_fnc_update_loading_screen;

uiSleep 0.4;
progressLoadingScreen 0.55;
[parseText format["<t font='tt2020base_vn' color='#F5F2D0'>%1</t>",localize "STR_vn_mf_loading9"]] call vn_mf_fnc_update_loading_screen;

uiSleep 0.4;
progressLoadingScreen 0.6;
//Setup teleporters
call vn_mf_fnc_action_teleport;

call vn_mf_fnc_action_trait;
[parseText format["<t font='tt2020base_vn' color='#F5F2D0'>%1</t>",localize "STR_vn_mf_loading10"]] call vn_mf_fnc_update_loading_screen;

// apply health effects
call vn_mf_fnc_health_effects;

private _respawnDelay = ["respawn_delay", 20] call BIS_fnc_getParamValue;
setplayerrespawntime _respawnDelay;

uiSleep 0.4;
progressLoadingScreen 0.65;
[parseText format["<t font='tt2020base_vn' color='#F5F2D0'>%1</t>",localize "STR_vn_mf_loading11"]] call vn_mf_fnc_update_loading_screen;

// Start player marker subsystem
private _useMarkers = (["allow_map_markers", 1] call BIS_fnc_getParamValue) > 0;
if (_useMarkers) then {
	call vn_mf_fnc_player_markers_subsystem_init;
};

uiSleep 0.4;
progressLoadingScreen 0.7;
[parseText format["<t font='tt2020base_vn' color='#F5F2D0'>%1</t>",localize "STR_vn_mf_loading12"]] call vn_mf_fnc_update_loading_screen;

// Initalize marker info UI
[] call para_c_fnc_zone_marker_init;
// Start AI processing for local player, if we're not a LAN server (as then serverside processing will kick in)
if (!isServer) then {
	call para_g_fnc_ai_create_behaviour_execution_loop;
};

uiSleep 0.4;
progressLoadingScreen 0.75;
[parseText format["<t font='tt2020base_vn' color='#F5F2D0'>%1</t>",localize "STR_vn_mf_loading13"]] call vn_mf_fnc_update_loading_screen;

// Set up automatic view distance scaling for performance
[] call para_c_fnc_perf_enable_dynamic_view_distance;

// starting rank
vn_mf_starting_rank = player getVariable ["vn_mf_db_rank",0];

uiSleep 0.4;
progressLoadingScreen 0.8;
[parseText format["<t font='tt2020base_vn' color='#F5F2D0'>%1</t>",localize "STR_vn_mf_loading14"]] call vn_mf_fnc_update_loading_screen;

// init awards array
vn_mf_default_awards = [];
{
    vn_mf_default_awards pushBack [configName _x, -1];
} forEach ("isClass(_x)" configClasses (missionConfigFile >> "gamemode" >> "awards_config"));

uiSleep 0.4;
progressLoadingScreen 0.9;
[parseText format["<t font='tt2020base_vn' color='#F5F2D0'>%1</t>",localize "STR_vn_mf_loading15"]] call vn_mf_fnc_update_loading_screen;

// initialize tools controller
call para_c_fnc_tool_controller_init;

uiSleep 0.4;
progressLoadingScreen 1.0;
[parseText format["<t font='tt2020base_vn' color='#F5F2D0'>%1</t>",localize "STR_vn_mf_loading17"]] call vn_mf_fnc_update_loading_screen;

//LOADING COMPLETE
//Start tidying up ready for play.

// end loading screen
uiSleep 0.4;
endLoadingScreen;
enableEnvironment false; //disable animals

// Fade in
cutText ["", "BLACK IN", 4];
// Bring sound back to normal
4 fadeSound 1;
// Fade out the music
8 fadeMusic 0;
// Restore the music volume in the near future.
[] spawn {sleep 8; playMusic ""; 2 fadeMusic 1};
// Re-enable simulation
player enableSimulation true;

// display location after a little delay
uiSleep 4;
LastKnownNearLocation = "";
call vn_mf_fnc_display_location_time;

[] spawn
{
	while {true} do 
	{
		uiSleep 2;
		[] call para_c_fnc_set_aperture_based_on_light_level;
	};
};

[] spawn
{
	uiSleep 2;
	createDialog "para_WelcomeScreen";
	/*private _version = getText(missionConfigFile >> "version");
	private _lastVersion = (["GET", "last_version", ""] call para_s_fnc_profile_db) select 1;
	//Open welcome screen for new players
	private _versionHasChanged =
		_lastVersion == "" ||
		(["para_enableWelcomeScreen"] call para_c_fnc_optionsMenu_getValue) == 1 ||
		_lastVersion != _version;

	if (_versionHasChanged) then {
		createDialog "para_WelcomeScreen";
		["SET", "last_version", _version] call para_s_fnc_profile_db;
	};*/
};


//DEV (ToDo): Until client Scheduler is added:
[]spawn
{
	systemchat "starting infopanel handler loop";
	"para_infopanel" cutRsc ["para_infopanel", "PLAIN", -1, true];
	while{true}do
	{
		uisleep 1;
		[] call para_c_fnc_infopanel_handler;
	};
};

//Place on team to ensure they are not groupless
["changeteam", [_group_ID]] call para_c_fnc_call_on_server;

// Start player stamina subsystem
call vn_mf_fnc_player_stamina_subsystem_init;

// Add custom chat for team
call vn_mf_fnc_custom_chat_update;

// Setup starting traits for players
call vn_mf_fnc_apply_unit_traits;

// No Fire Zones init
LastNoFireMessage = 0;

// DacCong ai grouping
DacCongAIGroup = [];

// DacCong Red Suicide
DacCongRedSuicide = false;

// Prisoner of War
PrisonerOfWar = false;

// Incapacitated Timer
Incapacitated = false;
IncapacitatedTimer = 0;
FinalIncapTimer = 0;
IncapTimerCounter = 0;

// Chemlights
AttachedChemlight = [];
AttachedChemlightTimer = 0;

// Selfie Camera
SelfieCamera = [];
SelfieCameraTimer = 0;
SelfieSSTimer = 0;

// Play Possum
PlayPossum = false;
PlayingDeadStart = 0;
PossumActionIds = [];

// Dance
IsDancing = false;

// Start player inventory checks
call vn_mf_fnc_player_check_for_non_arsenal_init;

[] spawn {call vn_mf_fnc_admin_arsenal};
[true,30,false,true,30,3,true,[]] execVM "WerthlesHeadless.sqf";
