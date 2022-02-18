/*
    File: para_player_init_server.sqf
    Author: Spoffy
    Date: 2020-10-12
    Last Update: 2020-10-12
    Public: Yes

    Description:
		Called on the server immediately after preinit_client, and before init_client.
		Perform server-side player initialisation here.
		It is safe to access the player object in this function.

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

params [["_player", objNull, [objNull]], ["_didJIP", true, [true]]];

diag_log format ["Mike Force: Player init server - %1", _player];

private _initialised = _player getVariable "para_s_player_initialised";
// prevent repeated execution of init
if !(isNil "_initialised") exitWith {};

// hide player character so they cant be TKd
_player hideObjectGlobal true;

private _uid = getPlayerUID _player;
(["GET", (_uid + "_data"), []] call para_s_fnc_profile_db) params ["","_object_data"];

//New Player stats default
if(_object_data isEqualTo []) then {
	_statsdefault = getArray(missionConfigFile >> "gamemode" >> "vars" >> "statsdefault");
	//_statsdefault = [ "MikeForce",0,"0",1,1,[],0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[] ];
	_object_data = _statsdefault;
};

_object_data params [ ["_group_ID","MikeForce",[""]],["_rank", 0, [0]],["_serial", "0", [""]],["_hunger", 1, [0]],["_thirst", 1, [0]],["_attributes", [], [[]]],["_deaths", 0, [0]],["_suicides", 0, [0]],["_friendlyfire", 0, [0]],["_murders", 0, [0]],["_kills", 0, [0]],["_vehiclekills", 0, [0]],["_tankkills", 0, [0]],["_boatkills", 0, [0]],["_chopperkills", 0, [0]],["_atoakills", 0, [0]],["_destruction", 0, [0]],["_deforestation", 0, [0]],["_hunting", 0, [0]],["_hqdestroyed", 0, [0]],["_revives", 0, [0]],["_zonesentered", 0, [0]],["_zonescaptured", 0, [0]],["_taskscomplete", 0, [0]],["_teamtaskscomplete", 0, [0]],["_supplytaskscomplete", 0, [0]],["_supporttaskscomplete", 0, [0]],["_awards", [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], [[]]],["_friends", [], [[]]] ];

_awards params [ ["_purple_heart", -1, [0]], ["_rvn_wound_medal", -1, [0]], ["_distinguished_service_cross", -1, [0]], ["_vietnam_gallantry_cross", -1, [0]], ["_rvn_defense_medal", -1, [0]], ["_combat_infantryman_badge", -1, [0]], ["_bronze_star", -1, [0]], ["_silver_star", -1, [0]], ["_air_medal", -1, [0]], ["_distinguished_service_order", -1, [0]], ["_congressional_medalofhonor", -1, [0]], ["_air_cross_of_gallantry", -1, [0]], ["_vietnam_tet_campaign_commemorative_medal", -1, [0]], ["_rvn_special_service_medal", -1, [0]], ["_national_defense_service_medal", -1, [0]], ["_distinguished_flying_cross", -1, [0]], ["_army_commendation_medal", -1, [0]], ["_air_force_good_conduct_medal", -1, [0]], ["_air_force_cross", -1, [0]], ["_special_operations_medal", -1, [0]], ["_army_presidential_unit_citation", -1, [0]], ["_usaf_outstanding_unit_award", -1, [0]], ["_meritorious_unit_citation", -1, [0]], ["_meritorious_service_medal", -1, [0]], ["_joint_service_commendation_medal", -1, [0]], ["_legion_of_merit", -1, [0]], ["_vietnam_service_medal", -1, [0]], ["_republic_of_vietnam_campaign_medal", -1, [0]], ["_gulf_of_tonkin_vietnam_commemorative_medal", -1, [0]], ["_navy_cross", -1, [0]], ["_rvn_training_service_medal", -1, [0]], ["_rvn_technical_service_medal", -1, [0]], ["_rvn_military_merit_first_republic_medal", -1, [0]], ["_rvn_civil_action_unit_citation", -1, [0]] ];

_checked_awards = [_purple_heart, _rvn_wound_medal, _distinguished_service_cross, _vietnam_gallantry_cross, _rvn_defense_medal, _combat_infantryman_badge, _bronze_star, _silver_star, _air_medal, _distinguished_service_order, _congressional_medalofhonor, _air_cross_of_gallantry, _vietnam_tet_campaign_commemorative_medal, _rvn_special_service_medal, _national_defense_service_medal, _distinguished_flying_cross, _army_commendation_medal, _air_force_good_conduct_medal, _air_force_cross, _special_operations_medal, _army_presidential_unit_citation, _usaf_outstanding_unit_award, _meritorious_unit_citation, _meritorious_service_medal, _joint_service_commendation_medal, _legion_of_merit, _vietnam_service_medal, _republic_of_vietnam_campaign_medal, _gulf_of_tonkin_vietnam_commemorative_medal, _navy_cross, _rvn_training_service_medal, _rvn_technical_service_medal, _rvn_military_merit_first_republic_medal, _rvn_civil_action_unit_citation];

_checked_object_data = [_group_ID, _rank, _serial, _hunger, _thirst, _attributes, _deaths, _suicides, _friendlyfire, _murders, _kills, _vehiclekills, _tankkills, _boatkills, _chopperkills, _atoakills, _destruction, _deforestation, _hunting, _hqdestroyed, _revives, _zonesentered, _zonescaptured, _taskscomplete, _teamtaskscomplete, _supplytaskscomplete, _supporttaskscomplete, _checked_awards, _friends];

private _config = (missionConfigFile >> "gamemode" >> "vars" >> "players");
private _public_vars = getArray(_config >> "publicvars");
private _stats = getArray(_config >> "stats");
private _blacklisted_vars = getArray(_config >> "blacklisted");
private _awards = getArray(_config >> "awards");
private _debug = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "playerinitserver");

_local_vars = [];
_awardArray = [];
_local_var_count = 0;
_saved_var_count = 0;
//if!(_object_data isEqualTo []) then 
if!(_checked_object_data isEqualTo []) then 
{
	//_saved_vars = _object_data;
	_saved_vars = _checked_object_data;
	{
		_varname = format["vn_mf_db_%1",_x];
		_vardata = _saved_vars# _saved_var_count;
		_saved_var_count = _saved_var_count + 1;
		if (!isNil "_vardata" && !(_varname in _blacklisted_vars)) then
		{
			if (_varname in _public_vars) then {
				_player setVariable [_varname,_vardata,true];
			} else {
				if(_varname == "vn_mf_db_awards")then { 
					_awardArray = [];
					for "_i" from 0 to (count(_vardata)-1) do {
						_awardArray pushBack [_awards# _i,_vardata# _i];
					};
					if(_debug isEqualTo 1) then { diag_log format["[+]p_init_server Name:%1 Data:%2", _varname,_vardata] };
					_vardata = _awardArray;
				};
				_player setVariable [_varname,_vardata];
			};
		};
	} forEach _stats;
};

//Setup new players database profile
//if(_object_data isEqualTo []) then 
if(_checked_object_data isEqualTo []) then 
{
	//defaults found in vars.hpp
	private _statsdefault = getArray(_config >> "statsdefault");
	["SET", (_uid + "_data"), _statsdefault] call para_s_fnc_profile_db;
	{
		_varname = format["vn_mf_db_%1",_x];
		_vardata = _statsdefault # _forEachIndex;
		if (!isNil "_vardata" && !(_varname in _blacklisted_vars)) then
		{
			if (_varname in _public_vars) then {
				_player setVariable [_varname,_vardata,true];
			} else {
				if(_varname == "vn_mf_db_awards")then { 
					_awardArray = [];
					for "_j" from 0 to (count(_vardata)-1) do {
						_awardArray pushBack [_awards# _j,_vardata# _j];
					};
					if(_debug isEqualTo 1) then { diag_log format["[+]recv_db_stats Name:%1 Data:%2", _varname,_vardata] };
					_vardata = _awardArray;
				};
				_player setVariable [_varname,_vardata];
			};
		};
	} forEach _stats;
	//_object_data = _statsdefault;
	_checked_object_data = _statsdefault;
};

// set new enlisted number
private _enlisted = _player getVariable ["vn_mf_db_serial","0"];
if (_enlisted isEqualTo "0") then {
	private _warcodes = [17,19,20,22,26,38,44]; //[51,52,53,54,55,56];
	// increment enlisted count server side
	vn_mf_enlisted_counter = vn_mf_enlisted_counter + 1;
	["SET", "enlisted_counter", vn_mf_enlisted_counter] call para_s_fnc_profile_db;
	private _serial = format["US %1 %2",selectRandom _warcodes,vn_mf_enlisted_counter];
	_player setVariable ["vn_mf_db_serial",_serial];
	//_object_data set[2, _serial];
	_checked_object_data set[2, _serial]; 
};

// last group
_group_ID = _player getVariable ["vn_mf_db_player_group", "MikeForce"];

// check that group is found and is proper type
private _type = typeOf _player;
	
if( (_group_ID == "DacCong")&&(_type != "vn_o_men_nva_dc_09") )then { _group_ID = "MikeForce";_checked_object_data set[0, "MikeForce"];  };
if( (_group_ID == "PressCorp")&&(_type != "C_journalist_F") )then { _group_ID = "MikeForce";_checked_object_data set[0, "MikeForce"];  };
if( (_group_ID == "Montagnard")&&(_type != "vn_i_men_sf_12") )then { _group_ID = "MikeForce";_checked_object_data set[0, "MikeForce"];  };

private _wlCfg = (missionConfigFile >> "gamemode" >> "whitelisting");
private _whitelisting = if(getNumber(_wlCfg >> "whitelisting" ) isEqualTo 1)then { true }else{ false };
if(_type == "vn_o_men_nva_dc_09")then { 
	private _teamMembers = getArray(_wlCfg >> "daccong" >> "members");
	if(_whitelisting && !(_uid in _teamMembers))then {
		_group_ID = "MikeForce";_checked_object_data set[0, "MikeForce"];
		["ReservedDacCong"] remoteExec ["endMission", _player];
	} else {
		_group_ID = "DacCong";_checked_object_data set[0, "DacCong"];
	};
};

if(_type == "vn_i_men_sf_12")then { 
private _teamMembers = getArray(_wlCfg >> "montagnard" >> "members");
	if(_whitelisting && !(_uid in _teamMembers))then {
		_group_ID = "MikeForce";_checked_object_data set[0, "MikeForce"];
		["ReservedMontagnard"] remoteExec ["endMission", _player];
	} else {
		_group_ID = "Montagnard";_checked_object_data set[0, "Montagnard"];
	};
};

// join player to last known group
private _selected_group = missionNamespace getVariable [_group_ID,grpNull];

// check that group is not full and swaps to Mike Force if full
if (count units _selected_group >= (missionNamespace getVariable ["vn_mf_max_players_" + _group_ID, 99])) then { 
    _selected_group = missionNamespace getVariable ["MikeForce", grpNull];
};

if (!isNull _selected_group && {_selected_group isEqualType grpNull}) then
{
	["Joining player to team %1, with group %2", _group_ID, _selected_group] call BIS_fnc_logFormat;
	[_player, _selected_group] call vn_mf_fnc_force_team_change;
} else
{
	"DEBUG: ERROR - group does not exist!!!" call BIS_fnc_log;
};

//Set new team after logging in
["SET", (_uid + "_team"), _group_ID] call para_s_fnc_profile_db;

// add players stats to scoreboard
//values: Array - killsInfantry , killsSoft(vehicles), killsArmor, killsAir, killed
//reset if they are rejoining, if there is no score then its null :)
private _curKills = (getPlayerScores _player) #0;
private _curVehKills = (getPlayerScores _player) #1;
private _curTankKills = (getPlayerScores _player) #2;
private _curChopperKills = (getPlayerScores _player) #3;
private _curDeaths = (getPlayerScores _player) #4;
_player addPlayerScores [-_curKills, -_curVehKills, -_curTankKills, -_curChopperKills, -_curDeaths];
//if!(_group_ID == "DacCong")then {
	private _kills = _player getVariable ["vn_mf_db_kills",0];
	private _vehKills = _player getVariable ["vn_mf_db_vehiclekills",0];
	private _chopperKills = _player getVariable ["vn_mf_db_chopperkills",0];
	private _tankKills = _player getVariable ["vn_mf_db_tankkills",0];
	private _suicides = _player getVariable ["vn_mf_db_suicides",0];
	private _deaths = _player getVariable ["vn_mf_db_deaths",0];
	private _totalDeaths = _suicides + _deaths;
	_player addPlayerScores [_kills, _vehKills, _tankKills, _chopperKills, _totalDeaths];
//};

// load last loadout DO NOT ACTIVATE, DACCONG respawn as MikeForce with DC loadouts
//(["GET", (_uid + "_loadout"), []] call para_s_fnc_profile_db) params ["","_loadout"];
//if !(_loadout isEqualTo []) then
//{
//	_player setUnitLoadout [_loadout, false];
//};

// restore players rank
([_player] call vn_mf_fnc_unit_to_rank) params ["", "", "", "_rank"];
_rank = toUpper _rank;
if !(rank _player isEqualTo _rank) then
{
	_player setUnitRank _rank;
};

enableEnvironment false; //disable animals

// start player at correct camp for team
//For now, we're just hardcoding this.
private _playerGroup = _player getVariable ["vn_mf_db_player_group", "MikeForce"];
private _respawnMarker = format ["mf_respawn_%1", _playerGroup];
if(_playerGroup == "DacCong") then
{
	_respawnMarker = "mf_dc_respawn_daccong";
};
_player setPos getMarkerPos _respawnMarker;

// unhide player character
_player hideObjectGlobal false;

// add event handlers from the harass subsystem.
[_player] call para_s_fnc_harass_add_player_event_handlers;

// send all variables to player
[_checked_object_data] remoteExecCall ["para_c_fnc_recv_db_stats",_player];
//[_object_data] remoteExecCall ["para_c_fnc_recv_db_stats",_player];

// TEMP - remove by Feb
// Ensures good database save if it was borked during play test
["SET", (_uid + "_data"), _checked_object_data] call para_s_fnc_profile_db;

_player setVariable ["para_s_player_initialised", true];
_player setVariable ["vn_mf_dyn_issetup", true];