params ["_cop"];

[
	//Version number. First is breaking changes, second is non-breaking.
	"1.0",
	//COP id
	_cop getVariable "para_g_cop_id",
	//COP name
	_cop getVariable "para_g_cop_name",
	//COP radius
	_cop getVariable "para_g_cop_radius",
	//COP supply values
	_cop getVariable "para_g_supply_source" getVariable "para_g_current_supplies",
	//COP position
	getPosASL _cop apply {_x toFixed 3}
]