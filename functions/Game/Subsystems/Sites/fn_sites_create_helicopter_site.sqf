params ["_pos", "_zoneName"];

private _debug = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "aimarkers");


if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_zones_create_helicopter_site DBG-1 _zoneName:%1 _pos:%2", _zoneName, _pos] };

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
		private _worldCfg = format["helicopters_%1",toLower(worldName)];
		private _vehType = getArray(_sitesCfg >> _worldCfg);
		private _result = [_pos, RANDOM 360, selectrandom _vehType, east] call BIS_fnc_spawnVehicle;
		// _result returns as [O Alpha 1-6:1,[O Alpha 1-6:1,O Alpha 1-6:2,O Alpha 1-6:3],O Alpha 1-6]
		// vehicle(object), crew(array), group(group)
		private _vehicle = _result#0;
		private _groups = _result#2;
		private _crew = _result#1;
		//_pilot = _crew#0;
		//_copilot = _crew#1;
		private _chief = _crew#2;
		_chief assignAsGunner _vehicle;
		
		_groups setCombatMode "RED";
		_groups setCombatBehaviour "COMBAT";
		{ _x setSkill 1 } forEach _crew;
		
		_wpPos = [_spawnPos, 250, 250, 6, 0, 0.5, 0] call BIS_fnc_findSafePos;
		// add find active zone
        private _wp = _groups addWaypoint [_wpPos, 0];
		_wp setWaypointType "SAD";
		[_groups, 0] setWaypointSpeed "FULL";
		
		_wpPos2 = [_wpPos, 250, 250, 6, 0, 0.5, 0] call BIS_fnc_findSafePos;
        private _wp2 = _groups addWaypoint [_wpPos2,1];
		_wp2 setwaypointtype "SAD";
		[_groups, 1] setWaypointSpeed "FULL";
		
		_wpPos3 = [_wpPos2, 250, 250, 6, 0, 0.5, 0] call BIS_fnc_findSafePos;
        private _wp3 = _groups addWaypoint [_wpPos3,2];
		_wp3 setwaypointtype "SAD";
		[_groups, 2] setWaypointSpeed "FULL";

		private _wpc = _groups addWaypoint [_wpPos3,3];
		_wpc setwaypointtype "CYCLE";
		[_groups, 3] setWaypointSpeed "FULL";
		
        _groups deleteGroupWhenEmpty true;

		[_groups, true] call para_s_fnc_enable_dynamic_sim;
		private _objectives = [];
		_objectives pushBack ([_vehicle] call para_s_fnc_ai_obj_request_crew);
		_objectives pushBack ([_spawnPos, 1, 1] call para_s_fnc_ai_obj_request_defend);

		_siteStore setVariable ["aiObjectives", _objectives];
		_siteStore setVariable ["vehicle", _vehicle];
		_siteStore setVariable ["units", (_result select 1)]; 
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
		//Teardown when the vehicle is destroyed
		//(_siteStore getVariable "crewedVeh" findIf {alive _x} == -1)
		!(alive (_siteStore getVariable "vehicle"))
	},
	//Teardown code
	{
		params ["_siteStore"];

		{
			deleteVehicle _x;
		} forEach ((_siteStore getVariable "vehicles") + (_siteStore getVariable "units"));

		{
			[_x] call para_s_fnc_ai_obj_finish_objective;
		} forEach (_siteStore getVariable ["aiObjectives", []]);
	}
] call vn_mf_fnc_sites_create_site;