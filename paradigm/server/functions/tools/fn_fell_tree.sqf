params ["_hitObject", ["_hitPosAGL", []], ["_greenHorn", ""]];

if !(_hitPosAGL isEqualType []) then {
	// Clean height data (breaks terrain obj search)
	private _objectPos = getPosASL _hitObject;
	private _hitPosAGL = ASLToAGL _objectPos;
};

if (isNil "para_s_tools_chopped_trees") then {para_s_tools_chopped_trees = []};

if (!([_hitObject] call para_g_fnc_is_valid_axe_target)) exitWith {};
if!(_greenHorn isEqualTo "")then {
	// Add deforestation stat
	[[_greenHorn],"rank",1] call vn_mf_fnc_change_player_stat;
	[[_greenHorn],"deforestation"] call vn_mf_fnc_change_player_stat;
};
hideObjectGlobal _hitObject;

para_s_tools_chopped_trees pushBack _hitPosAGL;
["SET", "chopped_trees", [para_s_tools_chopped_trees]] call para_s_fnc_profile_db;