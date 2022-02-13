/*
	File: fn_player_health_stats.sqf
	Author: Aaron Clark <vbawol>
	Date: 2020-05-23
	Last Update: 2020-07-04
	Public: No
	
	Description:
		Downtick all players health each run
	
	Parameter(s):
		_hunger_loss_factor - Loss factor [Number, defaults to 1.0]
		_thirst_loss_factor - Loss factor [Number, defaults to 1.0]
		_hunger_loss_rate - Loss rate [Number, defaults to 0.005]
		_thirst_loss_rate - Loss rate [Number, defaults to 0.01]
		_hunger_min - Minimum [Number, defaults to 0]
		_thirst_min - Minimum [Number, defaults to 0]
		_hunger_max - Maximum [Number, defaults to 1]
		_thirst_max - Maximum [Number, defaults to 1]
		_hunger_attributes_config - Attributes [Array[], defaults to [[], []]]
		_thirst_attributes_config - Attributes [Array[], defaults to [[], []]]
	
	Returns: nothing
	
	Example(s):
		Call vn_mf_fnc_player_health_stats;
*/

params [
	["_hunger_loss_factor",1.0],
	["_thirst_loss_factor",1.0],
	["_hunger_loss_rate",0.005],
	["_thirst_loss_rate",0.01],
	["_hunger_min",0],
	["_thirst_min",0],
	["_hunger_max",1],
	["_thirst_max",1],
	["_hunger_attributes_config",[[],[]]],
	["_thirst_attributes_config",[[],[]]],
	["_health_attributes_config",[[],[]]],
	["_stamina_attributes_config",[[],[]]],
	["_animation_attributes_config",[[],[]]]
];

private _prefix = "vn_mf_db_";
private _config = (missionConfigFile >> "gamemode" >> "vars" >> "players");
private _blacklisted = getArray(_config >> "blacklisted");
private _debug = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "playerdbstats");
{
	private _player = _x;
	if (_player getVariable ["vn_mf_dyn_issetup", false]) then
	{
		private _player_thirst_factor = _thirst_loss_factor;
		private _player_hunger_factor = _hunger_loss_factor;
		private _attributes = _player getVariable ["vn_mf_db_attributes",[]];
		// example of now to handle _attributes: if afflicted with a diuretic increase thirst loss 100%
		// Thirst
		{
			if (_x in _attributes) then
			{
				_player_thirst_factor = _player_thirst_factor * ((_thirst_attributes_config select 1) select _forEachIndex);
			};
		} forEach (_thirst_attributes_config select 0);
		// Hunger
		{
			if (_x in _attributes) then
			{
				_player_hunger_factor = _player_hunger_factor * ((_hunger_attributes_config select 1) select _forEachIndex);
			};
		} forEach (_hunger_attributes_config select 0);
		// Health
		{
			if (_x in _attributes) then
			{
				_player setDamage ((damage _player) + ((_health_attributes_config select 1) select _forEachIndex));
			};
		} forEach (_health_attributes_config select 0);
		// Energy
		//private _timer = player getVariable["vn_mf_player_energy_stamina_timer", 0];
		//if(("energy" in _attributes) && !(_timer == 0))then 
		//{
		//	_player setVariable["vn_mf_player_energy_stamina_timer", diag_tickTime, true];
		//};
		// Stamina Max
		{
			if (_x in _attributes) then
			{
				_player setVariable["vn_mf_player_stamina_max", ((_stamina_attributes_config select 1) select _forEachIndex), true];
			};
		} forEach (_stamina_attributes_config select 0);
		// Animation Speed
		{
			if (_x in _attributes) then
			{
				_player setVariable["vn_mf_player_stamina_anim_speed", ((_animation_attributes_config select 1) select _forEachIndex), true];
			};
		} forEach (_animation_attributes_config select 0);
		// Reset Energy
		//if!("energy" in _attributes)then {
		//	if!(player getVariable "vn_mf_player_stamina_max" isEqualTo 120)then { _player setVariable["vn_mf_player_stamina_max", 120, true] };
		//	if!(player getVariable "vn_mf_player_stamina_anim_speed" isEqualTo 0.95)then { _player setVariable["vn_mf_player_stamina_anim_speed", 0.95, true] };
		//	if!(player getVariable "vn_mf_player_energy_stamina_timer" isEqualTo 0)then { _player setVariable["vn_mf_player_energy_stamina_timer", 0, true] };
		//};
		
		[[_player],"hunger",-(_hunger_loss_rate * _player_hunger_factor)] call vn_mf_fnc_change_player_stat;
		[[_player],"thirst",-(_thirst_loss_rate * _player_thirst_factor)] call vn_mf_fnc_change_player_stat;

		// force all players to save every 120 seconds to prevent roll back if server crashes
		// changed from 60 to 120s to cut each players db writes in half per hour
		// take 50 players and this goes from 3000 db writes per hour to 1500 db writes per hour
		_ticktime = diag_tickTime;
		_savetime = _player getVariable ["vn_mf_savetime",0];
		if (_ticktime > _savetime) then
		{
			_player setVariable ["vn_mf_savetime",_ticktime + 120];
			_uid = getPlayerUID _player;
			private _vardata = [];
			if !(isNull _player) then
			{
				private _stats = getArray(missionConfigFile >> "gamemode" >> "vars" >> "players" >> "stats");
				{
					private _varname = format["vn_mf_db_%1",_x];
					private _resp = _player getVariable _varname;
					
					if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]health_stats Name:%1 Data:%2", _varname,_resp] };
					if(_varname == "vn_mf_db_awards")then {
						private _awardArray = [];
						for "_i" from 0 to (count(_resp)-1) do {
							_awardArray pushBack ((_resp# _i)# 1);
						};
						_resp = _awardArray;
						if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]health_stats awards Name:%1 Data:%2", _varname,_resp] };
					};
					_vardata pushBack _resp;
				} forEach _stats;
				
				// save data
				["SET", (_uid + "_data"), _vardata] call para_s_fnc_profile_db;

				// save players loadout
				//["SET", (_uid + "_loadout"), getUnitLoadout _player] call para_s_fnc_profile_db;

				if(_debug isEqualTo 1) then { [_player,_uid,_vardata] call BIS_fnc_log };
			};
		};
	};

} forEach allPlayers;
