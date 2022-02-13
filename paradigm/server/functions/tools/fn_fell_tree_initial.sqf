params ["_hitPos"];
if((_hitPos isEqualTo "") || (_hitPos isEqualTo []))exitWith { diag_log "Issue with saved tree location" };
private _hitObject = (nearestTerrainObjects [_hitPos, [], 1,false,true]) select 0;

if (!isNil "_hitObject") then {
    [_hitObject, _hitPos, ""] call para_s_fnc_fell_tree;
};
