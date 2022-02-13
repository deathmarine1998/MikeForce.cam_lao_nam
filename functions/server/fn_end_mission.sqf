/*
    File: fn_end_mission.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-01-29
    Last Update: 2020-03-10
    Public: No
    
    Description:
		End mission event.
		[!:info] The return of this function should be ignored.
    
    Parameter(s): none
    
    Returns:
		Script Handle [Script]
    
    Example(s):
		call vn_mf_fnc_end_mission
*/

// turn off scheduler
 vn_mf_monitorScheduler = false;
 vn_mf_runScheduler = false;

[] spawn {
	uiSleep 1;
	// wipe db
	//["CLEAR"] call para_s_fnc_profile_db;
	{
		localNamespace getVariable [_x, []] set [struct_zone_m_captured, false];
	} forEach vn_mf_markers_zones;
	uiSleep 5;
	"cleared db" call BIS_fnc_log;
	
	["SAVE"] call para_s_fnc_profile_db;
	uiSleep 5;
	"save cleared db" call BIS_fnc_log;
	
	// end mission
	'EveryoneWon' call BIS_fnc_endMissionServer;
	"Game ended!" call BIS_fnc_log;
};
