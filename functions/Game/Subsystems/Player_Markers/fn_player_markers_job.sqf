/*
	File: fn_player_markers_job.sqf
	Author: Spoffy
	Date: 2020-05-29
	Last Update: 2020-07-03
	Public: No
	
	Description:
	    Called periodically to maintain player markers. 
	
	Parameter(s): none
	
	Returns: nothing
	
	Example(s):
	    call vn_mf_fnc_player_markers_job
*/

// Config and debug
private _gamemodeConfig = missionConfigFile >> "gamemode";
private _debug = getNumber(_gamemodeConfig >> "debug" >> "playermarkers");
private _teamsCfg = _gamemodeConfig >> "settings" >> "teams";

//Markers which has corresponding players in the game.
private _activeMFPlayerMarkers = [];
private _activeMFVehicleMarkers = [];
private _activeDCPlayerMarkers = [];
private _activeDCVehicleMarkers = [];

// Group and Side
private _playerGroup = "MikeForce";
_playerGroup = player getVariable ["vn_mf_db_player_group", "MikeForce"];

// Clear known other team markers
if(_playerGroup != "DacCong")then {
	{ _x setMarkerAlphaLocal 0 } forEach vn_dc_player_markers;
	{ _x setMarkerAlphaLocal 0 } forEach vn_dc_player_markers_vehicle_markers;
};
if(_playerGroup == "DacCong")then {
	{ _x setMarkerAlphaLocal 0 } forEach vn_mf_player_markers;
	{ _x setMarkerAlphaLocal 0 } forEach vn_mf_player_markers_vehicle_markers;
};

private _traitsCfg = _gamemodeConfig >> "traits";
private _traits = getArray(_traitsCfg >> "traits");
private _mkrTypeMF = getArray(_traitsCfg >> "markersMF");
private _mkrTypeDC = getArray(_traitsCfg >> "markersDC");
private _mfPIcons = if(_playerGroup != "DacCong")then { _mkrTypeMF } else { _mkrTypeDC };

private _playerMarker = format ["player_marker_%1", getPlayerUID player];
private _playerMarkerType = if(_playerGroup != "DacCong")then { "b_inf" } else { "o_inf" };
{
	if(player getUnitTrait _x)then { _playerMarkerType = _mfPIcons# _forEachIndex; };
}forEach _traits;
_playerMarker setMarkerTypeLocal _playerMarkerType;

//Vehicles which have players in.
vn_mf_player_markers_manned_vehicles = [];
vn_dc_player_markers_manned_vehicles = [];

{
	private _unit = _x;
	private _unitMarker = format ["player_marker_%1", getPlayerUID _unit];

	private _unitGroup = _unit getVariable ["vn_mf_db_player_group", "MikeForce"];
	private _unitGroupColor = if(_unitGroup != "DacCong")then { "ColorBLUFOR" } else { "ColorOPFOR" };
	private _team = getArray(_teamsCfg >> _unitGroup);
	_unitGroupColor = _team#5;
	_unitMarker setMarkerColorLocal _unitGroupColor;

	if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_job DBG-1a _unit:%1 _unitGroup:%2 _unitGroupColor:%3 _unitMarker:%4 markershape:%5 ", _unit, _unitGroup, _unitGroupColor, _unitMarker, markerShape _unitMarker] };

	private _markerType = if(_unitGroup != "DacCong")then { "b_inf" } else { "o_inf" };
	{
		if(_unit getUnitTrait _x)then { _markerType = _mfPIcons# _forEachIndex; };
	}forEach _traits;
	if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_job DBG-1b _unit:%1 _markerType:%2", _unit, _markerType] };

	if (markerShape _unitMarker == "")then 
	{
		createMarkerLocal [_unitMarker, [0,0,0]];
		if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_job DBG-2 Dac Cong created new marker _unitMarker:%1 _unitGroupColor:%2", _unitMarker, _unitGroupColor] };
		_unitMarker setMarkerTextLocal name _unit;
		_unitMarker setMarkerShapeLocal "ICON";
		_unitMarker setMarkerTypeLocal _markerType;
		_unitMarker setMarkerColorLocal _unitGroupColor;
		_unitMarker setMarkerAlphaLocal 1;
	};
	if(_unitGroup != "DacCong")then { _activeMFPlayerMarkers pushBack _unitMarker }else{ _activeDCPlayerMarkers pushBack _unitMarker };

	private _healthState = lifeState _unit;
	private _incapacitated = alive _unit && (_unit getVariable ["vn_revive_incapacitated", false] || _healthState == "INCAPACITATED");

	if (alive _unit) then {
		if (_incapacitated) then {
			_unitMarker setMarkerColorLocal "ColorRed";
		} else {
			_unitMarker setMarkerColorLocal _unitGroupColor;
		};
	} else {
		_unitMarker setMarkerColorLocal "ColorGrey";
	};

	//Special case if player is in vehicle.
	private _vehGroup = "MikeForce";
	_vehGroup = (driver vehicle _unit) getVariable ["vn_mf_db_player_group", "MikeForce"];
	if (vehicle _unit != _unit) then {
		if(_vehGroup == "DacCong")then { vn_dc_player_markers_manned_vehicles pushBackUnique vehicle _unit; };
		if(_vehGroup != "DacCong")then { vn_mf_player_markers_manned_vehicles pushBackUnique vehicle _unit; };
		_unitMarker setMarkerAlphaLocal 0;
	} else {
		if((_playerGroup != "DacCong") && ( _unitGroup != "DacCong"))then { _unitMarker setMarkerAlphaLocal 1; } else { _unitMarker setMarkerAlphaLocal 1; };
	};
} forEach allPlayers;

if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_job DBG-3 finished allPlayers markers Player:%1", player] };

//Add markers for vehicles.

{
	if(_playerGroup == "DacCong")exitWith {};
	//if(_playerSide == east)exitWith {};
	private _vehicle = _x;
	private _crew = crew _vehicle select { isPlayer _x };
	if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_job DBG-4 vehicles markers _vehicle:%1 _crew:%2", _vehicle, _crew] };
	//If somehow we've got a vehicle in this list with no player crew.
	if (_crew isEqualTo []) exitWith {};

	private _vehicleMarker = format ["player_marker_vehicle_%1", netId _vehicle];
	_activeMFVehicleMarkers pushBack _vehicleMarker;
	
	if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_job DBG-4a vehicles markers _vehicle:%1 _vehicleMarker:%2", _vehicle, _vehicleMarker] };

	private _driverType = "Driver:";
	private _markerType = "b_motor_inf";
	private _vehicleDriverName = name (driver _vehicle);
	if (_vehicle isKindOf "Helicopter")then { _markerType = "b_air"; _driverType = "Pilot:" };
	if (_vehicle isKindOf "Plane")then { _markerType = "b_plane"; _driverType = "Pilot:" };
	
	private _vehicleGroup = (driver _vehicle) getVariable ["vn_mf_db_player_group", "MikeForce"];
	if !((typeOf _vehicle) find "static_" isEqualTo -1)then { 
		_markerType = "b_mortar";
		_driverType = "Gunner:";
		_vehicleDriverName = name _vehicle;
		_vehicleGroup = _vehicle getVariable ["vn_mf_db_player_group", "MikeForce"];
	};
	
	private _vehicleGroupColor = "ColorBLUFOR";
	private _team = getArray(_teamsCfg >> _vehicleGroup);
	_vehicleGroupColor = _team#5;
	_vehicleMarker setMarkerColorLocal _vehicleGroupColor;
	
	if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_job DBG-4a vehicles markers _vehicleGroup:%1 _markerType:%2 _vehicleGroupColor:%3 _driverType:%4", _vehicleGroup, _vehicleGroupColor, _driverType] };
	
	//Easiest way to check if it exists
	if (markerShape _vehicleMarker == "") then 
	{
		createMarkerLocal [_vehicleMarker, [0,0,0]];
		_vehicleMarker setMarkerShapeLocal "ICON";
		_vehicleMarker setMarkerAlphaLocal 1;
		_vehicleMarker setMarkerTypeLocal _markerType;
		_vehicleMarker setMarkerColorLocal _vehicleGroupColor;
		if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_job DBG-4e MikeForce created new marker _vehicleMarker:%1 _markerType:%2", _vehicleMarker, _markerType, _vehicleGroupColor]; };
	};	
		
	private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
	if(count _crew > 1)then {
		_vehicleMarker setMarkerTextLocal format [localize "STR_vn_mf_player_markers_vehicle_marker", _vehicleName, _driverType, _vehicleDriverName, count _crew];
	} else {
		_vehicleMarker setMarkerTextLocal format [localize "STR_vn_mf_player_markers_vehicle_marker_lonewolf", _vehicleName, _driverType, _vehicleDriverName];
	};
	
	if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_job DBG-4e MikeForce created new marker _vehicle:%1 _vehicleName:%2 crewcount:%3", _vehicle, _vehicleName, count _crew]; };
} forEach vn_mf_player_markers_manned_vehicles;	
		
{
	if(_playerGroup != "DacCong")exitWith {};
	//if(_playerSide in [west,independent,civilian])exitWith {};
	private _vehicle = _x;
	private _crew = crew _vehicle select { isPlayer _x };
	if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_job DBG-4 vehicles markers _vehicle:%1 _crew:%2", _vehicle, _crew] };
	//If somehow we've got a vehicle in this list with no player crew.
	if (_crew isEqualTo []) exitWith {};

	private _vehicleMarker = format ["player_marker_vehicle_%1", netId _vehicle];
	_activeDCVehicleMarkers pushBack _vehicleMarker;
	
	if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_job DBG-4a vehicles markers _vehicle:%1 _vehicleMarker:%2", _vehicle, _vehicleMarker] };

	private _driverType = "Driver:";
	private _markerType = "b_motor_inf";
	private _vehicleDriverName = name (driver _vehicle);
	if (_vehicle isKindOf "Helicopter")then { _markerType = "b_air"; _driverType = "Pilot:" };
	if (_vehicle isKindOf "Plane")then { _markerType = "b_plane"; _driverType = "Pilot:" };
	
	private _vehicleGroup = (driver _vehicle) getVariable ["vn_mf_db_player_group", "DacCong"];
	if !((typeOf _vehicle) find "static_" isEqualTo -1)then { 
		_markerType = "b_mortar";
		_driverType = "Gunner:";
		_vehicleDriverName = name _vehicle;
		_vehicleGroup = _vehicle getVariable ["vn_mf_db_player_group", "DacCong"];
	};
	
	private _vehicleGroupColor = "ColorOPFOR";
	private _team = getArray(_teamsCfg >> _vehicleGroup);
	_vehicleGroupColor = _team#5;
	_vehicleMarker setMarkerColorLocal _vehicleGroupColor;

	if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_job DBG-4b Dac Cong created new marker _vehicleMarker:%1 _vehicleGroupColor:%2", _vehicleMarker, _vehicleGroupColor] };
	
	//Easiest way to check if it exists
	if (markerShape _vehicleMarker == "") then 
	{
		createMarkerLocal [_vehicleMarker, [0,0,0]];
		_vehicleMarker setMarkerShapeLocal "ICON";
		_vehicleMarker setMarkerAlphaLocal 1;
		_vehicleMarker setMarkerTypeLocal _markerType;
		_vehicleMarker setMarkerColorLocal _vehicleGroupColor;
		if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_job DBG-4c MikeForce created new marker _vehicleMarker:%1 _markerType:%2", _vehicleMarker, _markerType] };
	};
	
	private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
	if(count _crew > 1)then {
		_vehicleMarker setMarkerTextLocal format [localize "STR_vn_mf_player_markers_vehicle_marker", _vehicleName, _driverType, _vehicleDriverName, count _crew];
	} else {
		_vehicleMarker setMarkerTextLocal format [localize "STR_vn_mf_player_markers_vehicle_marker_lonewolf", _vehicleName, _driverType, _vehicleDriverName];
	};

	if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_job DBG-4e MikeForce created new marker _vehicle:%1 _vehicleName:%2 crewcount:%3", _vehicle, _vehicleName, count _crew]; };
} forEach vn_dc_player_markers_manned_vehicles;

if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_job DBG-5 finished vehicles markers Player:%1", player]; };

//Prune markers for players that have left.
private _inactiveMarkers = (vn_mf_player_markers - _activeMFPlayerMarkers) + (vn_mf_player_markers_vehicle_markers - _activeMFVehicleMarkers);
private _inactiveDCMarkers = (vn_dc_player_markers - _activeDCPlayerMarkers) + (vn_dc_player_markers_vehicle_markers - _activeDCVehicleMarkers);
{ deleteMarker _x } forEach _inactiveMarkers;
{ deleteMarker _x } forEach _inactiveDCMarkers;

vn_mf_player_markers = _activeMFPlayerMarkers;
vn_mf_player_markers_vehicle_markers = _activeMFVehicleMarkers;
vn_dc_player_markers = _activeDCPlayerMarkers;
vn_dc_player_markers_vehicle_markers = _activeDCVehicleMarkers;

//Remove opposite teams markers
private _removeMarkersDaccong = getArray(missionConfigFile >> "gamemode" >> "settings" >> "playermarkers" >> "daccong");
private _removeMarkersNotDaccong = getArray(missionConfigFile >> "gamemode" >> "settings" >> "playermarkers" >> "notdaccong");

if(_playerGroup == "DacCong")then
{
	{
		_x setMarkerAlphaLocal 0;
	} forEach _removeMarkersDaccong;
} else {
	{
		_x setMarkerAlphaLocal 0;
	} forEach _removeMarkersNotDaccong;
};


