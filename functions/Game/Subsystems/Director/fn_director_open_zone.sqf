/*
    File: fn_director_open_zone.sqf
    Author: Spoffy
    Date: 2020-12-22
    Last Update: 2020-12-22
    Public: No
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
    
    Example(s):
        [parameter] call vn_fnc_myFunction
*/
params ["_zone"];

if(_zone in mf_s_opened_zones) exitWith {};
//if!(mf_s_activeZones isEqualTo [])exitWith {};
if(count(mf_s_activeZones) >= mf_s_maxActiveZones) exitWith { diag_log format["[DirtyDebug]open_zones 2 zones opened  mf_s_activeZones:%1", mf_s_activeZones ] };
private _taskStore = ["capture_zone", _zone] call vn_mf_fnc_task_create select 1;
mf_s_activeZones pushBack [_zone, _taskStore];

if!(mf_s_copTasked)then {
	private _buildCOP = ["build_cop", _zone] call vn_mf_fnc_task_create select 1;
	mf_s_activeBuildReq pushback [_zone, _buildCOP];
	mf_s_copTasked = true;
};

if!(mf_s_baseTasked)then {
	private _buildFOB = ["build_fob", _zone] call vn_mf_fnc_task_create select 1;
	mf_s_activeBuildReq pushback [_zone, _buildFOB];
	mf_s_baseTasked = true;
};

mf_s_opened_zones pushBack _zone;
vn_mf_activeZones pushBack _zone;
publicVariable "vn_mf_activeZones";

private _loadSuccessful = [_zone] call vn_mf_fnc_sites_load;

if !(_loadSuccessful) then 
{
    //Generate sites
    [_zone] call vn_mf_fnc_sites_generate;
};

[] call vn_mf_fnc_sites_aa_reveal_targets;

// load Dac Cong Task Fuck Up Mike Force's day
private _defendHQ = [(["defend_hq", _zone, [["targetBase", vn_mf_hq_locations# 0], ["prepTime", mf_s_dir_attack_prep_time]]] call vn_mf_fnc_task_create) # 1];
