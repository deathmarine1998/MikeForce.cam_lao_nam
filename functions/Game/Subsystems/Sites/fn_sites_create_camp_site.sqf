params ["_pos", "_zoneName"];

private _config = missionConfigFile >> "gamemode" >> "settings" >> "aimarkers";
private _camp = getNumber(_config >> "camps");
private _debug = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "aimarkers");

private _campAlpha = 0.5;
if(_camp isEqualTo 0)then {_campAlpha=0};

if(_debug isEqualTo 1) then { diag_log format["[+]fn_zones_create_camp_site DBG-1 _camp:%1 _pos:%2", [_camp,_campAlpha], _pos] };

[
	"camp",
	_pos,
	//Setup Code
	{
		params ["_siteStore"];
		private _siteId = _siteStore getVariable "site_id";
		private _sitePos = getPos _siteStore;
		private _spawnPos = _sitePos;

		private _result = [_spawnPos] call vn_mf_fnc_create_camp_buildings;
		private _createdThings = _result select 0;

		private _markerPos = _spawnPos getPos [10 + random 20, random 360];
		private _campMarker = createMarker [format ["Camp_%1", _siteId], _markerPos];
		_campMarker setMarkerType "o_recon";
		_campMarker setMarkerText "Camp";
		_campMarker setMarkerAlpha _campAlpha;

		//Create a Dac Cong HQ Spawn Marker
		private _campRespawnMarker = createMarker [format ["sites_tunnel_respawn_%1", _siteId], _markerPos];
		_campRespawnMarker setMarkerType "o_service";
		_campRespawnMarker setMarkerAlpha 0;
		private _respawnID = [east, _campRespawnMarker] call BIS_fnc_addRespawnPosition;
		private _respawnObj = createVehicle ["Land_vn_o_platform_04", _markerPos, [], 5, "NONE"];
		DCRespawnPoints pushBack [_campRespawnMarker,_respawnID,_zoneName];
		
		private _vehicles = _createdThings select 0;
		_vehicles pushBack _respawnObj;
		private _groups = _createdThings select 1;
		{
			[_x, true] call para_s_fnc_enable_dynamic_sim;
		} forEach (_vehicles + _groups);

		private _camps = _result select 1;
		private _objectives = [];
		{
			_objectives pushBack ([_x] call para_s_fnc_ai_obj_request_crew);
		} forEach _camps;
		_objectives pushBack ([_spawnPos, 1, 1] call para_s_fnc_ai_obj_request_defend);

		_siteStore setVariable ["aiObjectives", _objectives];
		_siteStore setVariable ["markers", [_campMarker]];
		_siteStore setVariable ["camps", _camps];
		_siteStore setVariable ["vehicles", _vehicles]; 
		_siteStore setVariable ["units", (_createdThings select 1)]; 
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
		(_siteStore getVariable "camps" findIf {alive _x} == -1)
	},
	//Teardown code
	{
		params ["_siteStore"];

		{
			deleteMarker _x;
		} forEach (_siteStore getVariable "markers");

		{
			deleteVehicle _x;
		} forEach ((_siteStore getVariable "vehicles") + (_siteStore getVariable "units"));

		{
			[_x] call para_s_fnc_ai_obj_finish_objective;
		} forEach (_siteStore getVariable ["aiObjectives", []]);
	}
] call vn_mf_fnc_sites_create_site;