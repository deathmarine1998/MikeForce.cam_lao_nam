params ["_serializedCOP"];

private _version = _serializedCOP select 0;
if (_version == "1.0") exitWith
{
	_serializedCOP params 
	[
		"_version",
		"_id",
		"_name",
		"_radius",
		"_internalSupplies",
		"_pos"
	];

	[_pos apply {parseNumber _x}, _name, _radius, _internalSupplies, _id] call para_s_fnc_cop_create
};