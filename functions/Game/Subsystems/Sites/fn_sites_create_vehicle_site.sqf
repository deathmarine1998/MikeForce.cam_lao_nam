params ["_pos", "_zoneName"];
private _debug = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "aimarkers");
if(_debug isEqualTo 1) then { diag_log format["[+]fn_zones_create_vehicle_site DBG-1 _zoneName:%1 _pos:%2", _zoneName, _pos] };
// _result return will be Array format [createdVehicle, crew, group]:
// createdVehicle: Object - the created vehicle
// crew: Array of Objects - the vehicle's crew members
// group: Group - created or passed group
[
	"vehicle",
	_pos,
	//Setup Code
	{
		params ["_siteStore"];
		private _siteId = _siteStore getVariable "site_id";
		private _sitePos = getPos _siteStore;
		private _spawnPos = _sitePos;
		
		private _sitesCfg = (missionConfigFile >> "gamemode" >> "sites" >> "sitescfg");
		private _worldCfg = format["vehicles_%1",toLower(worldName)];
		private _vehType = getArray(_sitesCfg >> _worldCfg);
		private _result = [_pos, RANDOM 360, selectrandom _vehType, east] call BIS_fnc_spawnVehicle;
		private _vehicle = _result#0;
		private _groups = _result#2;
		private _crew = _result#1;
		
		//private _createdThings = _result select 0;
		
		private _gunner = gunner _vehicle;
        private _driver = driver _vehicle;
		_gunner addMPEventHandler
		[
			"MPkilled",
			{
				_this spawn
				{
					_offr = vehicle (_this select 0);
					_driver = driver _offr;
					_driver leavevehicle _offr;
					[_driver] orderGetIn FALSE;
					_driver assignAsGunner _offr;
					[_driver] orderGetIn TRUE;
				};
			}
		];
		_wpPos = [_spawnPos, 100, 100, 6, 0, 0.5, 0] call BIS_fnc_findSafePos;
        private _wp = _groups addWaypoint [_wpPos, 0];
        _wp setwaypointtype "MOVE";
		
		_wpPos2 = [_wpPos, 100, 100, 6, 0, 0.5, 0] call BIS_fnc_findSafePos;
        private _wp2 = _groups addWaypoint [_wpPos2,2];
		_wp2 setwaypointtype "SAD";
		
		_wpPos3 = [_wpPos2, 100, 100, 6, 0, 0.5, 0] call BIS_fnc_findSafePos;
        private _wp3 = _groups addWaypoint [_wpPos3,3];
		_wp3 setwaypointtype "SAD";
		
		private _wpc = _groups addWaypoint [_wpPos,4];
		_wpc setwaypointtype "CYCLE";
        _groups deleteGroupWhenEmpty true;
		
		[_groups, true] call para_s_fnc_enable_dynamic_sim;
		private _objectives = [];
		_objectives pushBack ([_vehicle] call para_s_fnc_ai_obj_request_crew);
		_objectives pushBack ([_spawnPos, 1, 1] call para_s_fnc_ai_obj_request_defend);

		_siteStore setVariable ["aiObjectives", _objectives];
		_siteStore setVariable ["vehicle", _vehicle];
		_siteStore setVariable ["units", [_result select 1]]; 
		_siteStore setVariable ["groups", _groups];
	},
	//Teardown condition check code
	{
		//Check if we need to teardown every 15 seconds.
		15 call _fnc_periodicallyAttemptTeardown;
	},
	//Teardown condition
	{
		params ["_siteStore"];
		//Teardown when all guns destroyed
		!(alive (_siteStore getVariable "vehicle"))
	},
	//Teardown code
	{
		params ["_siteStore"];
		deleteVehicle (_siteStore getVariable "vehicle");

		{
			[_x] call para_s_fnc_ai_obj_finish_objective;
		} forEach (_siteStore getVariable ["aiObjectives", []]);
	}
] call vn_mf_fnc_sites_create_site;