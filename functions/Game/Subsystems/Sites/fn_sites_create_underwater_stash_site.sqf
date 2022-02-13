params ["_pos"];

private _config = missionConfigFile >> "gamemode" >> "settings" >> "aimarkers";
private _stash = getNumber(_config >> "underwaterstash");
private _debug = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "aimarkers");

private _stashAlpha = 0.5;
if(_stash isEqualTo 0)then {_stashAlpha=0};

if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_zones_create_camp_site DBG-1 _stash:%1 _pos:%2", [_stash,_stashAlpha], _pos] };

[
	"underwater_stash",
	_pos,
	//Setup Code
	{
		params ["_siteStore"];
		private _siteId = _siteStore getVariable "site_id";
		private _sitePos = getPos _siteStore;
		private _spawnPos = _sitePos;

		private _result = [_spawnPos] call vn_mf_fnc_create_underwater_stash;
		private _createdThings = _result select 0;

		private _markerPos = _spawnPos getPos [10 + random 20, random 360];
		private _stashMarker = createMarker [format ["UnderwaterStash_%1", _siteId], _markerPos];
		_stashMarker setMarkerType "o_installation";
		_stashMarker setMarkerText "Tunnel";
		_stashMarker setMarkerAlpha _stashAlpha;
		
		private _vehicles = _createdThings select 0;
		{
			//Disable weapon dissassembly - statics don't get deleted properly when disassembled, so it breaks the site/mission.
			_x enableWeaponDisassembly false;
		} forEach _vehicles;
		private _groups = _createdThings select 1;
		{
			[_x, true] call para_s_fnc_enable_dynamic_sim;
		} forEach (_vehicles + _groups);

		private _stashs = _result select 1;
		private _objectives = [];
		{
			_objectives pushBack ([_x] call para_s_fnc_ai_obj_request_crew);
		} forEach _stashs;
		_objectives pushBack ([_spawnPos, 1, 1] call para_s_fnc_ai_obj_request_defend);

		_siteStore setVariable ["aiObjectives", _objectives];
		_siteStore setVariable ["markers", [_stashMarker]];
		_siteStore setVariable ["stashs", _stashs];
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
		//Teardown when destroyed
		(_siteStore getVariable "stashs" findIf {alive _x} == -1)
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