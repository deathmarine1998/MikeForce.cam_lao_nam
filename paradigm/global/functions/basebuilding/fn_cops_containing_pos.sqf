private _pos = _this;

//Filter it down to start with, so we don't search every base on the map.
private _candidates = para_g_cops inAreaArray [_pos, para_g_max_cop_radius, para_g_max_cop_radius];
//Select only the ones we're actually inside.
_candidates select {_x distance2D _pos < _x getVariable "para_g_cop_radius"};