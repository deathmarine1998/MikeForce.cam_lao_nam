params ["_pos", "_zoneName"];

private _config = missionConfigFile >> "gamemode" >> "settings" >> "aimarkers";
private _supply = getNumber(_config >> "tunnel_watersupply");
private _debug = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "aimarkers");

private _supplyAlpha = 0.5;
if(_supply isEqualTo 0)then {_supplyAlpha=0};

if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_zones_create_camp_site DBG-1 _supply:%1 _pos:%2", [_supply,_supplyAlpha], _pos] };

[
	"tunnel_watersupply",
	_pos,
	//Setup Code
	{
		params ["_siteStore"];
		private _siteId = _siteStore getVariable "site_id";
		private _sitePos = getPos _siteStore;
		private _spawnPos = [_sitePos #0, _sitePos #1, (_sitePos #2)+3];
		
		private _tunnelWS = "Land_vn_o_trapdoor_02" createVehicle _spawnPos;
		//private _result = [_spawnPos] call vn_mf_fnc_create_tunnel_watersupply;
		//private _createdThings = _result select 0;

		private _markerPos = _spawnPos getPos [10 + random 20, random 360];
		private _supplyMarker = createMarker [format ["Tunnel_WaterSupply_%1", _siteId], _markerPos];
		_supplyMarker setMarkerType "o_installation";
		_supplyMarker setMarkerText "Water Supply";
		_supplyMarker setMarkerAlpha _supplyAlpha;
		
		[_tunnelWS, true] call para_s_fnc_enable_dynamic_sim;
		
		_objectives = [];
		_objectives pushBack ([_tunnelWS] call para_s_fnc_ai_obj_request_crew);
		_objectives pushBack ([_spawnPos, 1, 1] call para_s_fnc_ai_obj_request_defend);

		_siteStore setVariable ["aiObjectives", _objectives];
		_siteStore setVariable ["markers", [_supplyMarker]];
		_siteStore setVariable ["supplys", [_tunnelWS]];
		_siteStore setVariable ["vehicles", [_tunnelWS]]; 
	},
	//Teardown condition check code
	{
		//Check if we need to teardown every 15 seconds.
		15 call _fnc_periodicallyAttemptTeardown;
	},
	//Teardown condition
	{
		params ["_siteStore"];
		//Teardown when destroyed
		(_siteStore getVariable "supplys" findIf {alive _x} == -1)
	},
	//Teardown code
	{
		params ["_siteStore"];

		{
			deleteMarker _x;
		} forEach (_siteStore getVariable "markers");

		{
			deleteVehicle _x;
		} forEach (_siteStore getVariable "vehicles");

		{
			[_x] call para_s_fnc_ai_obj_finish_objective;
		} forEach (_siteStore getVariable ["aiObjectives", []]);
	}
] call vn_mf_fnc_sites_create_site;