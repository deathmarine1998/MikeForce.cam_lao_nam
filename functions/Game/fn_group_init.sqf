/*
	File: fn_group_init.sqf
	Author: Aaron Clark <vbawol>
	Date: 2020-05-23
	Last Update: 2020-07-04
	Public: No
	
	Description:
		Creates and initialize groups and duty officers
	
	Parameter(s): none
	
	Returns: nothing
	
	Example(s):
		call vn_mf_fnc_group_init;
*/

vn_mf_duty_officers = [];

private _gamemode_config = (missionConfigFile >> "gamemode");
private _debug = getNumber(_gamemode_config >> "debug" >> "createAgent");

// Create all groups agents and join into all groups
private _groups = getArray(_gamemode_config >> "settings" >> "groups" );
{
	_x params ["_group_name", ["_class","vn_b_men_army_01"]];
	private _marker = "duty_officer_" + toLower(_group_name);
	private _location = getMarkerPos _marker;
	if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_group_init(dutyOfficer) DBG-1 _marker:%1 _location:%2 _group_name:%3", _marker, _location, _group_name] };
	if !(_location isEqualTo [0,0,0]) then
	{
		_side = west;
		if(_group_name isEqualTo "DacCong") then 
		{
			_side = east;
		};
		if(_group_name isEqualTo "Montagnard") then 
		{
			_side = independent;
		};
		// create duty officer
		private _grp = createGroup [_side, false];
		_grp setGroupIdGlobal [_group_name];

		// duty officer agent
		if!(toLower(worldName) in ["cam_lao_nam","vn_khe_sanh"])then { _class = getText(_gamemode_config >> "modded_ops" >> "duty_officer")};
		private _agent = createAgent [_class, _location, [], 0, "NONE"];
		_agent allowDamage false;
		_agent setDir (markerDir _marker);
		_id = _agent spawn {
			removeAllWeapons _this;
			_this switchmove "";
			uiSleep 1;
			_this enableSimulationGlobal false;
			_this disableAI "ALL";
			_this setCaptive true;
		};
		_agent setObjectTextureGlobal [2,"custom\loadingscreens\bronation_banner.paa"];
		//Set up custom interaction overlay
		_agent setVariable ["#para_InteractionOverlay_ConfigClass", "DutyOfficer", true];

		// set group name as global var and reference to group server side
		missionNamespace setVariable [_group_name,_grp,true];

		// save duty officers to array for later use
		vn_mf_duty_officers pushBack _agent;
	};
} forEach _groups;

// broadcast duty officers
publicVariable "vn_mf_duty_officers";


