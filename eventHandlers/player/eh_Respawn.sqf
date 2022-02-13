/*
    File: eh_Respawn.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-05-13
    Last Update: 2020-05-26
    Public: No

    Description:
	    Respawn Event Handler.

    Parameter(s):
        _unit - Alive Player [OBJECT, defaults to DEFAULTVALUE]
        _corpse - Dead Player [OBJECT, defaults to DEFAULTVALUE]

    Returns: nothing

    Example(s):
	    Not called directly.
*/

params
[
	"_unit",
	"_corpse"
];


// restart master loop
0 spawn para_c_fnc_compiled_loop_init;

// update UI
["vn_mf_db_thirst",1] call vn_mf_fnc_ui_update;
["vn_mf_db_hunger",1] call vn_mf_fnc_ui_update;

//Get back our custom chat
[] call vn_mf_fnc_custom_chat_update;

// add new task actions
call vn_mf_fnc_action_load_actions;