/*
    File: fn_sites_generate.sqf
    Author: Spoffy
    Date: 2020-12-11
    Last Update: 2020-12-11
    Public: No
    
    Description:
		Places new sites down on the map procedurally. 
    
    Parameter(s):
		None
    
    Returns:
		None
    
    Example(s):
		[] call vn_mf_fnc_sites_generate
*/

params ["_zone"];

private _attempts = 7;

//Simple approach for now - surround hostile zones with AA and artillery.
//private _zonesToGenerateIn = mf_s_zones select {!(_x select struct_zone_m_captured)};
private _zoneData = [_zone] call vn_mf_fnc_zones_load_zone;

private _fnc_findPos = {
	params ["_startPos", "_minDist", "_maxDist"];
	private _result = _startPos;
	for "_i" from 1 to _attempts do
	{
		_result = _startPos getPos [_minDist + random (_maxDist - _minDist), random 360];
		if!(surfaceIsWater _result)exitWith { _i = (_attempts+1)};
	};
	_result
};

private _fnc_findPosWater = {
	params ["_startPos", "_minDist", "_maxDist"];
	private _result = _startPos;
	for "_i" from 1 to _attempts do
	{
		_result = _startPos getPos [_minDist + random (_maxDist - _minDist), random 360];
		if(surfaceIsWater _result)exitWith { _i = (_attempts+1)};
	};
	_result
};

private _fnc_findPosRoad = {
	params ["_startPos", "_minDist", "_maxDist"];
	private _result = _startPos;
	for "_i" from 1 to 30 do
	{
		_result = _startPos getPos [_minDist + random (_maxDist - _minDist), random 360];
		if(isOnRoad _result)exitWith { _i = (_attempts+1)};
	};
	_result
};

// #CLN_RedDirt isOnRoad position
//{
	//private _zoneData = _x;
	private _center = markerPos (_zoneData select struct_zone_m_marker);
	private _size = markerSize (_zoneData select struct_zone_m_marker);
	private _sizeX = _size select 0;
	//Create initial AA emplacements
	for "_i" from 1 to (1 + ceil random (mf_s_max_aa_per_zone - 1)) do
	{
		private _aaSite = [_center, (_sizeX/3), (_sizeX/1.15)] call _fnc_findPos;
		if!(surfaceIsWater _aaSite)then {
			[_aaSite, _zone] call vn_mf_fnc_sites_create_aa_site;
		};
	};

	//Create initial artillery emplacements
	for "_i" from 1 to (1 + ceil random (mf_s_max_artillery_per_zone - 1)) do
	{
		private _artySite = [_center, (_sizeX/3), (_sizeX/1.15)] call _fnc_findPos;
		if!(surfaceIsWater _artySite)then {
			[_artySite, _zone] call vn_mf_fnc_sites_create_artillery_site;
		};
	};
	
	/*
	for "_i" from 1 to (1 + ceil random (mf_s_max_camps_per_zone - 1)) do
	{
		//[_zoneData] call vn_mf_fnc_sites_create_camp;
		private _campSite = [_center, (_sizeX/3), (_sizeX/1.15)] call _fnc_findPos;
		if!(surfaceIsWater _campSite)then {
			[_campSite, _zone] call vn_mf_fnc_sites_create_camp_site;
		};
	};
	
	for "_i" from 1 to (1 + ceil random (mf_s_max_tunnels_per_zone - 1)) do
	{
		private _tunnelSite = [_center, (_sizeX/3), (_sizeX/1.15)] call _fnc_findPos;
		if!(surfaceIsWater _tunnelSite)then {
			[_tunnelSite, _zone] call vn_mf_fnc_sites_create_tunnel_site;
		};
	};
	
	for "_i" from 1 to (1 + ceil random (mf_s_max_tunnels_watersupply_per_zone - 1)) do
	{
		private _tunnelWaterSupply = [_center, _sizeX, _sizeX] call _fnc_findPosWater;
		if(surfaceIsWater _tunnelWaterSupply)then {
			[_tunnelWaterSupply, _zone] call vn_mf_fnc_sites_create_tunnel_watersupply_site;
		};
	};
	*/
	
	for "_i" from 1 to (1 + ceil random (mf_s_max_vehicles_per_zone - 1)) do
	{
		private _vehicleSite = [_center, _sizeX, _sizeX] call _fnc_findPosRoad;
		if(isOnRoad _vehicleSite)then {
			[_vehicleSite, _zone] call vn_mf_fnc_sites_create_vehicle_site;
		};
	};
	
	for "_i" from 1 to (1 + ceil random (mf_s_max_helicopters_per_zone - 1)) do
	{
		private _helicopterSite = [_center, _sizeX, _sizeX] call _fnc_findPosRoad;
		if(isOnRoad _helicopterSite)then {
			[_helicopterSite, _zone] call vn_mf_fnc_sites_create_helicopter_site;
		};
	};
	
	//Create zone HQ
	private _hqPosition = _center;
	for "_i" from 0 to 40 do {
		private _testPosition = _hqPosition getPos [100, random 360];
		_testPosition = (selectBestPlaces [_testPosition, 200, "-(houses + 10 * waterDepth)", 10, 1]) select 0 select 0;
		if !(_testPosition isFlatEmpty [0, -1, 0.5, 50, 0] isEqualTo []) exitWith {
			_hqPosition = _testPosition + [0];
		};
	};
	[_hqPosition, _zone] call vn_mf_fnc_sites_create_hq;
	
	mf_s_loaded_sites pushBack _zone;
//} forEach _zonesToGenerateIn;