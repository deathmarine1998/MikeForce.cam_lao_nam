/*
    File: fn_bf_respawn_register_respawn.sqf
    Author: Spoffy
    Date: 2020-10-17
    Last Update: 2020-10-17
    Public: No
    
    Description:
        Registers a building as a respawn point
    
    Parameter(s):
		_building
    
    Returns:
		None
    
    Example(s):
*/
params ["_building"];

if !(_building getVariable ["para_s_respawn_id", []] isEqualTo []) exitWith {diag_log "Paradigm: Warning: Attempt to re-register a respawn"};

if (_building getVariable ["para_s_building_id", ""] isEqualTo "")exitWith {
	diag_log format["[+]fn_bf_respawn_register_respawn DBG-2a register bldg as respawn point _bldgID:%1", (_building getVariable "para_s_building_id")];
};

if (_building getVariable ["para_g_objects", []] isEqualTo [])exitWith { 
	diag_log format["[+]fn_bf_respawn_register_respawn DBG-2b register bldg as respawn point _bldgPos:%1", (_building getVariable "para_g_objects" select 0)];
};
private _debug = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "building");
if(_debug isEqualTo 1) then { 
	diag_log format["[+]register_respawn building:%1 type:%2", _building, typeOf _building];
};

private _marker = createMarker [
    format ["building_respawn_%1", _building getVariable "para_s_building_id"],
    getPos (_building getVariable "para_g_objects" select 0)
];
_building setVariable ["para_s_respawn_marker", _marker];

//Register as a respawn position
private _side = west;
if((typeOf _building) isEqualTo "Land_vn_o_platform_04")then { _side = east };
_building setVariable ["para_s_respawn_id", 
    [_side, _marker] call BIS_fnc_addRespawnPosition
];
if(_side == west)then { [independent, _marker] call BIS_fnc_addRespawnPosition };

private _handler = ["onPlayerRespawn", [{
    params ["_handlerParams", "_eventParams"];
    _handlerParams params ["_building", "_marker"];
    _eventParams params ["_player", "_identity"];

    if (_identity isEqualTo _marker) then {
        diag_log format ["Player respawned at marker %1, pos %2", _marker, markerPos _marker];
        [_building, 50] call para_s_fnc_building_consume_supplies;
    };
}, [_building, _marker]]] call para_g_fnc_event_add_handler;

_building setVariable ["para_s_respawn_handler", _handler];