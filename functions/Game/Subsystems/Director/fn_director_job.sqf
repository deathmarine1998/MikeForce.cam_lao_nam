/*
    File: fn_director_job.sqf
    Author: Spoffy
    Date: 2020-12-08
    Last Update: 2020-12-08
    Public: No
    
    Description:
		Periodic job that runs the gameplay director.
    
    Parameter(s):
		None
    
    Returns:
		None

    Example(s):
		["gameplay_director", vn_mf_fnc_director_job, [], 30] call para_g_fnc_scheduler_add_job;
*/

////////////////////////////////////////
// New task handling - Main game flow //
////////////////////////////////////////
if((diag_tickTime - vn_mf_sStartTime) < 101)exitWith {};
if(((diag_tickTime - vn_mf_sStartTime) >= 100) && !(mf_s_startup))then {
	if!(mf_s_startup_zones isEqualTo [])then {
		{
			[_x] call vn_mf_fnc_director_open_zone;
		}forEach mf_s_startup_zones;
	};
	mf_s_startup = true;
};

private _completedZones = mf_s_activeZones select {[_x # 1] call vn_mf_fnc_task_is_completed};
mf_s_activeZones = mf_s_activeZones - _completedZones;
if ( (count(_completedZones) > 0) && ( count(mf_s_activeZones) < 2) ) then 
{
	[] call vn_mf_fnc_director_open_connected_zones;
};

///////////////////////
// Mission end state //
///////////////////////

[] call vn_mf_fnc_director_check_mission_end;

////////////////
// AI Actions //
////////////////

// AI action system.
// AI periodically makes "actions" or "moves" against the players.
// This section of code handles deciding which move to make, executing those moves, and monitoring their progress.


if ([mf_s_dir_current_action # 0] call vn_mf_fnc_task_is_completed && serverTime > mf_s_dir_next_action_time) then 
{
	//Action has fired, we're waiting for completion
	if (mf_s_dir_action_fired) exitWith 
	{
		mf_s_dir_next_action_time = serverTime + mf_s_dir_action_delay;
		["Next Intel", mf_s_dir_next_action_time, true] call vn_mf_fnc_timerOverlay_setGlobalTimer;
		mf_s_dir_action_fired = false;
	};

	private _zonesWithPlayerCount = mf_s_zone_markers apply { [count (allPlayers inAreaArray _x), _x] };
	_zonesWithPlayerCount sort false;
	
	private _selectedZone = _zonesWithPlayerCount # 0;

	if (_selectedZone # 0 == 0) exitWith {};
	//moved this diag_log line due to rpt spam even if the player count was 0
	diag_log format ["VN MikeForce: Director: Selected Zone: %1", str _selectedZone];
	private _selectedZoneMarker = _selectedZone # 1;
	
	//If cops near zone, attack them.
	private _nearbyCOPs = para_g_cops inAreaArray _selectedZoneMarker;
	if ((count _nearbyCOPs > 0) && !mf_s_copDefended)then {
		private _copsWithBuildingCount = _nearbyCOPs apply { [count (_x getVariable "para_g_buildings"), _x] };
		_copsWithBuildingCount sort false;
		private _largestCOP = _copsWithBuildingCount select 0 select 1;
		mf_s_dir_current_action = [(["defend_cop", _selectedZoneMarker, [["targetBase", _largestCOP], ["prepTime", mf_s_dir_attack_prep_time]]] call vn_mf_fnc_task_create) # 1];
	};
	
	if((mf_s_copDefended) || (count _nearbyCOPs == 0))then {
		//If bases in zone, attack them.
		private _nearbyBases = para_g_bases inAreaArray _selectedZoneMarker;
		if (count _nearbyBases > 0)then {
			//Launch an FOB attack.
			private _basesWithBuildingCount = _nearbyBases apply { [count (_x getVariable "para_g_buildings"), _x] };
			_basesWithBuildingCount sort false;
			private _largestBase = _basesWithBuildingCount select 0 select 1;
			mf_s_dir_current_action = [(["defend_base", _selectedZoneMarker, [["targetBase", _largestBase], ["prepTime", mf_s_dir_attack_prep_time]]] call vn_mf_fnc_task_create) # 1];
		} else {
			mf_s_dir_current_action = [(["defend_counterattack", _selectedZoneMarker, [["prepTime", mf_s_dir_attack_prep_time]]] call vn_mf_fnc_task_create) # 1];
		};
	};
	
	if(mf_s_baseBuilt)then {
		private _killOfficer = ["secondary_st3", _selectedZoneMarker] call vn_mf_fnc_task_create select 1;
	};
	
	if((mf_s_capturedZone) && !(mf_s_flagPlaced))then {
		private _placeFlag = ["place_flag", _selectedZoneMarker] call vn_mf_fnc_task_create select 1;
	};

	//Hide timer
	[] call vn_mf_fnc_timerOverlay_removeGlobalTimer;
	mf_s_dir_action_fired = true;
};

//Check if AI knows about players
//Check if those players are in a zone
//If so, start timer
//to start with, maybe actually just check if players are in the zone?