params ["_pos", "_copName", ["_copRadius", para_g_max_cop_radius], ["_initialSupplies", 0], "_id"];

if (isNil "_id") then
{
    // Create building IDs.
    (["GET", "cop_counter", 0] call para_s_fnc_profile_db) params ["","_copCounter"];
    _id = _copCounter + 1;
    (["SET", "cop_counter", _id] call para_s_fnc_profile_db);
};

//Create the base. Using a simple object, as we want to use the position.
private _cop = createSimpleObject ["a3\weapons_f\empty.p3d", AGLToASL _pos];
_cop setVariable ["para_g_cop_id", _id, true];
//TODO - Make bases upgradable, etc.
_cop setVariable ["para_g_cop_radius", _copRadius, true];

if (isNil "_copName") then 
{
    private _number = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
    private _phoenetic = ["Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", "Indigo", "Juliet", "Kilo", "Lima", "Mike", "November", "Oscar", "Papa", "Quebec", "Romeo", "Siera", "Tango", "Uniform", "Victor", "Whisky", "Xray", "Yankee", "Zulu"];
    _copName = selectRandom _phoenetic + "-" + selectRandom _number + selectRandom _number;
};
_cop setVariable ["para_g_cop_name", _copName, true];

_copMarkerName = "cop_" + _copName;
//Todo: set markers in side chat - will need a way to determine side (team) of base
_hqMarker = createMarkerLocal [_copMarkerName, _cop];
//Todo: vary marker type (colour) based on side
_hqMarker setMarkerTypeLocal "b_installation";
// Set color and send to clients
_hqMarker setMarkerText _copName;

_copGMarkerName = "outpost_" + _copName;
_baseMarker = createMarkerLocal [_copGMarkerName, _cop];
_baseMarker setMarkerSizeLocal [250, 250];
_baseMarker setMarkerShapeLocal "ELLIPSE";
_baseMarker setMarkerAlphaLocal 0.25;
// Set color and send to clients
_baseMarker setMarkerColor "colorBLUFOR";

_cop setVariable ["para_g_cop_marker", _copMarkerName, true];
_cop setVariable ["para_g_outpost_marker", _copGMarkerName, true];
[_baseMarker, "cop", [_copName]] call para_c_fnc_zone_marker_add;


//TODO - Make these parameters? I'm not quite sure how this should work.
[_cop, 10000, _initialSupplies] call para_s_fnc_supply_source_create;
_cop setVariable ["para_g_supply_source", _cop, true];
_cop setVariable ["para_g_buildings", [], true];

para_g_cops pushBack _cop;
publicVariable "para_g_cops";

//Base created, now claim any unclaimed nearby buildings
{
    if !(_x getVariable ["para_g_cop", objNull] isEqualTo _cop) then {
        [_x, _cop] call para_s_fnc_building_connect_cop;
    };
} forEach (para_l_buildings inAreaArray [_pos, _copRadius, _copRadius]);

_cop
