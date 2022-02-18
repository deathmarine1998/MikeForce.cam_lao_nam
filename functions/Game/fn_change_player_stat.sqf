params [
	"_players", 	// 0: ARRAY of OBJECTs - player objects
	"_name", 	// 1: STRING - stat name
	["_change", 1]	// 2: NUMBER - ammount to add
];
 // name here refers to the value being updates, do in the awards lookup we are looking up awards -> kills
private _config = (missionConfigFile >> "gamemode" >> "stats" >> _name);
private _awards = (missionConfigFile >> "gamemode" >> "awards" >> _name);
if (isClass _config) then
{
	private _min = getNumber(_config >> "min");
	private _max = getNumber(_config >> "max");
	private _default = getNumber(_config >> "default");
	private _key = format["vn_mf_db_%1",_name];
	private _debug = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "playerstats");
	if(_debug isEqualTo 1) then { 
		diag_log format["[+]change_stats key:%1 change:%2 default:%3 min:%4 max:%5", _key, _change, _default, _min, _max];
	};
	{
		private _player = _x;

		// make variable change
		if((_player getVariable _key) isEqualType [])exitWith {
			diag_log format["[+]change_stats key:%1 change:%2 default:%3 min:%4 max:%5", _key, _change, _default, _min, _max];
		};
		
		if(_debug isEqualTo 1) then { 
			diag_log format["[+]change_stats current key var before callingcurrent_stat_value: %1", (_player getVariable _key)];
		};
		private _current_stat_value = _player getVariable [_key,_default];
		
		if(_debug isEqualTo 1) then { 
			diag_log format["[+]change_stats current:%1 key:%2 default:%3", _current_stat_value, _key, _default];
		};
		private _new_stat_value = ((_current_stat_value + _change) min _max) max _min;
		
		private _vardata = [_key,_new_stat_value];
		private _payload = [];
		_player setVariable _vardata;
		_payload pushBack _vardata;

		// change rank
		private _rankConfig = (missionConfigFile >> "gamemode" >> "settings" >> "armarankfix");
		private _playerRank = toUpper(rank _player);
		private _playerRankLevel = getNumber(_rankConfig >> _playerRank);
		if (_name isEqualTo "rank") then
		{
			([_player] call vn_mf_fnc_unit_to_rank) params ["", "_rank", "_pointsneeded", "_armarank"];
			_newRank = toUpper _armarank;
			private _newRankLevel = getNumber(_rankConfig >> _newRank);
			if(_playerRankLevel < _newRankLevel)then {
				_player setUnitRank _newRank;
			};
		};

		// do awards logic here
		if (isClass _awards) then
		{
			private _player_groupid = groupId (group _player);
			{ //  forEach (configProperties [_awards]);
				private _award_name = configName _x;
				private _a_required_teams = getArray(_x >> "required_teams");
				private _award_scripted_requirement = getText(_x >> "required_code");
				private _a_levels = getArray(_x >> "levels"); // array of level definitions
				private _level_scripted_requirement = "";
				private _level_id = -1;
				// we find the player's current level by comparing the new stat value to the level's value  here we loop through all the levels
				{
					// forEach _a_levels consists of a number and a piece of evaluation code
					_x params ["_level_stat_requirement",["_level_scripted_requirements",""]];
					if (_new_stat_value >= _level_stat_requirement) then {
						_level_id = _forEachIndex; // index of the level
						_level_scripted_requirement = _level_scripted_requirements;
					};
				} forEach _a_levels;

				// check that player is in required group
				if ((_a_required_teams isEqualTo []) || _player_groupid in _a_required_teams ) then
				{
					// check that any required logic is met
					if ((_award_scripted_requirement isEqualTo "") || {call compile _award_scripted_requirement} ) then
					{
						// check that any extra required logic is met for level
						if ((_level_scripted_requirement isEqualTo "") || {call compile _level_scripted_requirement}) then
						{
							// make sure that level_id is higher than -1
							if (_level_id > -1) then
							{
								if(_debug isEqualTo 1) then { ("store award: " + _award_name) call BIS_fnc_log };
								private _awards_var = _player getVariable ["vn_mf_db_awards",vn_mf_default_awards];

								private _award_given = false;

								_existing_award = _awards_var findIf {(_x param [0,""]) isEqualTo _award_name};
								if !(_existing_award isEqualTo -1) then
								{
									_award_id = (_awards_var select _existing_award) select 1;
									if !(_award_id isEqualTo _level_id) then
									{
										_awards_var set [_existing_award, [_award_name,_level_id]];
										_award_given = true;
									};
								}
								else
								{
									("Error: this should not happen " + _award_name) call BIS_fnc_log;
								};

								if (_award_given) then
								{
									_player setVariable ["vn_mf_db_awards",_awards_var];
									_awardArray = [];
									for "_w" from 0 to (count(_awards_var)-1) do {
										_awardArray pushBack ((_awards_var# _w)# 1);
									};
									_payload pushBack ["vn_mf_db_awards",_awardArray];

									// send notification to player
									[
										configName _x,
										_level_id
									] remoteExecCall ["vn_mf_fnc_player_award",_player];
								};
							};
						}
						else
						{
							if(_debug isEqualTo 1) then { [_level_scripted_requirement] call BIS_fnc_log };
						};

					}
					else
					{
						if(_debug isEqualTo 1) then { [_award_scripted_requirement] call BIS_fnc_log };
					};
				}
				else
				{
					if(_debug isEqualTo 1) then { [_player_groupid,_a_required_teams] call BIS_fnc_log };
				};

			} forEach (configProperties [_awards]);

		};

		[_payload] remoteExecCall ["para_c_fnc_set_local_var",_player];

	} forEach _players;
};
