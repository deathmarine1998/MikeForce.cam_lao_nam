/*
	File: fn_director_init.sqf
	Author: Spoffy
	Date: 2020-12-08
	Last Update: 2020-12-08
	Public: Yes
	
	Description:
		Initialises the gameplay director subsystem
		This subsystem is responsible for handling primary tasks, and directing mission flow.
	
	Parameter(s):
		None
	
	Returns:
		None
	
	Example(s):
		[] call vn_mf_fnc_director_init;
*/

//Array in format - [Task Object]
mf_s_activeZones = [];
mf_s_maxActiveZones = 2;
mf_s_baseZoneUnlockDistance = 1000;
mf_s_copZoneUnlockDistance = 2000;
mf_s_activeBuildReq = [];

mf_s_copTasked = false;
mf_s_copBuilt = false;
mf_s_copDefended = false;

mf_s_baseTasked = false;
mf_s_baseBuilt = false;
mf_s_baseDefended = false;
mf_s_baseFlagBuilt = false;

mf_s_capturedZone = false;
mf_s_capturedZoneTime = 0;

mf_s_heldZone = false;
mf_s_heldZoneTime = 0;

mf_s_flagPlaced = false;
//Delay between actions.
mf_s_dir_action_delay = 1200;
mf_s_dir_current_action = [objNull];
mf_s_dir_next_action_time = serverTime;
mf_s_dir_attack_prep_time = 600;
mf_s_dir_action_fired = true; //Mark it as dispatched, so we reset back to a new timer.

private _szones = format["starting_zones_%1",worldName];
mf_s_dir_new_campaign_starting_zones = getArray(missionConfigFile >> "map_config" >> _szones);
mf_s_startup_zones = [];
mf_s_startup = false;

private _connectedZones = [];
private _zones = format["zones_%1",toLower(worldName)];
private _capturedZones = (mf_s_zones select {_x select struct_zone_m_captured}) apply {_x select struct_zone_m_marker};
private _count = count(mf_s_dir_new_campaign_starting_zones);
if!(_count > 5)then {
	{
		localNamespace getVariable [_x, []] set [struct_zone_m_captured, true];
		_connectedZones append (getArray (missionConfigFile >> "map_config" >> _zones >> _x) apply {_x # 0});
	} forEach _capturedZones;

	_connectedZones = _connectedZones arrayIntersect _connectedZones;

	mf_s_startup_zones = _connectedZones - _capturedZones;
} else {
	{
		localNamespace getVariable [_x, []] set [struct_zone_m_captured, true];
		mf_s_dir_new_campaign_starting_zones = mf_s_dir_new_campaign_starting_zones - [_x];
	} forEach _capturedZones;
	mf_s_startup_zones = mf_s_dir_new_campaign_starting_zones;
};

if(mf_s_startup_zones isEqualTo [])then {mf_s_startup_zones = mf_s_dir_new_campaign_starting_zones};

//Create tasks for any zones that aren't captured, but are connected a captured zone.
//[] call vn_mf_fnc_director_open_connected_zones;
//If none can be opened, we're at game start - need to open one manually.
//private _szones = format["starting_zones_%1",worldName];
//if((mf_s_activeZones isEqualTo []) && (count(_capturedZones) isEqualTo 0)) then 
//{
//	{
//		[_x] call vn_mf_fnc_director_open_zone;
//	} forEach (getArray (missionConfigFile >> "map_config" >> _szones));
//};

CAPTUREZONE = "";

mf_s_cia_capture_zone_garrison = false;
mf_s_cia_capture_zone_sites = false;
mf_s_cia_capture_zone_hq = false;
mf_s_cia_capture_zone = false;
mf_s_cia_hold_zone = false;
mf_s_cia_defend_counterattack = false;
mf_s_cia_build_cop = false;
mf_s_cia_defend_cop = false;
mf_s_cia_build_fob = false;
mf_s_cia_defend_fob = false;
mf_s_cia_kill_officer = false;
mf_s_cia_place_flag = false;
mf_s_cia_recapture_zone = false;
mf_s_cia_recaptured_zone = false;
//DacCong vars
mf_s_cia_dc_defend_hq = false;
mf_s_cia_dc_defend_sites = false;
mf_s_cia_defend_hq = false;
mf_s_cia_defend_sites = false;


["gameplay_director", vn_mf_fnc_director_job, [], 15] call para_g_fnc_scheduler_add_job;