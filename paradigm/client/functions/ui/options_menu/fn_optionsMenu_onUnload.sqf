params ["_display", "_exitCode"];

private _changes = _display getVariable ["#changes", []];

switch (_exitCode) do {
	case 1: {
		{
			_x params ["_varname", "_newValue"];
			profileNamespace setVariable [_varname, _newValue];
			if(_varname == "para_maxViewdist")then {
				_rangeDist = getArray(missionConfigFile >> "para_CfgOptions" >> "para_maxViewDist" >> "range");
				if(!(_newValue > _rangeDist#1) && !(_newValue < _rangeDist#0))then {
					setViewDistance _newValue;
				};
			};
			if(_varname == "para_maxObjectViewdist")then {
				_rangeDist = getArray(missionConfigFile >> "para_CfgOptions" >> "para_maxObjectViewdist" >> "range");
				if(!(_newValue > _rangeDist#1) && !(_newValue < _rangeDist#0))then {
					setObjectViewDistance _newValue;
				};
			};
		} forEach _changes;
	};
	case 3: {
		private _config = missionConfigFile >> "para_CfgOptions";
		private _configs = "true" configClasses _config;
		{
			private _varname = getText (_x >> "variable");
			private _default = getNumber (_x >> "default");
			profileNamespace setVariable [_varname, _default];
		} forEach _configs;
	};
	default {};
};

saveProfileNamespace;
