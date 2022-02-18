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

//Markers which has corresponding players in the game.
private _activePlayerMarkers = [];
private _activeVehicleMarkers = [];

private _gamemodeConfig = missionConfigFile >> "gamemode";
private _pmConfig = _gamemodeConfig >> "settings" >> "playermarkers";
private _debug = getNumber(_gamemodeConfig >> "debug" >> "playermarkers");

private _playerGroup = "MikeForce";
private _playerGroup = player getVariable ["vn_mf_db_player_group", "MikeForce"];
private _playerMarker = format ["player_marker_%1", getPlayerUID player];
private _playerSide = side player;
private _playerMarkerType = "b_inf";
if(player getUnitTrait "Medic")then { _playerMarkerType = "b_med" };
if(player getUnitTrait "Engineer")then { _playerMarkerType = "b_maint" };
if(player getUnitTrait "ExplosiveSpecialist")then { _playerMarkerType = "b_Ordnance" };
if(player getUnitTrait "vn_artillery")then { _playerMarkerType = "b_art" };
_playerMarker setMarkerTypeLocal _playerMarkerType;

//Vehicles which have players in.
vn_mf_player_markers_manned_vehicles = [];
vn_mf_player_markers_daccong = [];
vn_mf_vehicle_markers_daccong = [];
_opFor = ((allUnits - [player]) select { alive _x && (side group _x == east)});
_bluFor = ((allUnits - [player]) select { alive _x && (side group _x in [west, independent, civilian])});

if(_playerGroup == "DacCong")then {
	{ deleteMarkerLocal (format ["player_marker_%1", getPlayerUID _x]) } forEach _bluFor;
	_playerMarkers = _opFor;
}else{
	{ deleteMarkerLocal (format ["player_marker_%1", getPlayerUID _x]) } forEach _opFor;
	_playerMarkers = _bluFor;
};


{
	private _unit = _x;
	private _unitMarker = format ["player_marker_%1", getPlayerUID _unit];
	private _unitGroup = _unit getVariable ["vn_mf_db_player_group", "MikeForce"];
	private _unitSide = side _unit;
	
	private _unitGroupColor = "ColorBLUFOR";
	if(_unitGroup == "DacCong") then { _unitGroupColor = "ColorEAST"; vn_mf_player_markers_daccong pushBack _unitMarker; };
	if(_unitGroup == "SaigonWarriors") then { _unitGroupColor = "ColorBlue" };
	if(_unitGroup in ["GreenHornets","SatansAngels","Muskets"]) then { _unitGroupColor = "ColorGreen" };
	if(_unitGroup in ["ACAV","BlackHorse","Frogmen"])then { _unitGroupColor = "ColorOrange" };
	if(_unitGroup == "MACVSOG")then { _unitGroupColor = "ColorYellow" };
	if(_unitGroup in ["SpikeTeam", "TigerForce", "Montagnard"])then { _unitGroupColor = "colorIndependent" };
	if(_debug isEqualTo 1) then { diag_log format["[+]fn_player_markers_job DBG-1a _unit:%1 _unitGroup:%2 _unitGroupColor:%3 _unitMarker:%4 markershape:%5 ", _unit, _unitGroup, _unitGroupColor, _unitMarker, markerShape _unitMarker] };
	
	private _markerType = "b_inf";
	if(_unit getUnitTrait "Medic")then { _markerType = "b_med" };
	if(_unit getUnitTrait "Engineer")then { _markerType = "b_maint" };
	if(_unit getUnitTrait "ExplosiveSpecialist")then { _markerType = "b_Ordnance" };
	if(_unit getUnitTrait "vn_artillery")then { _markerType = "b_art" };

	if(_debug isEqualTo 1) then { diag_log format["[+]fn_player_markers_job DBG-1b _unit:%1 _markerType:%2", _unit, _markerType] };

	if (markerShape _unitMarker == "")then 
	{
		if(_playerGroup == "DacCong") then 
		{
			if(_unitGroup == "DacCong") then 
			{
				createMarkerLocal [_unitMarker, [0,0,0]];
				if(_debug isEqualTo 1) then { diag_log format["[+]fn_player_markers_job DBG-2 Dac Cong created new marker _unitMarker:%1 _unitGroupColor:%2", _unitMarker, _unitGroupColor] };
				_unitMarker setMarkerTextLocal name _unit;
				_unitMarker setMarkerShapeLocal "ICON";
				_unitMarker setMarkerTypeLocal _markerType;
				_unitMarker setMarkerAlphaLocal 1;
			} else {
				_unitMarker setMarkerAlphaLocal 0;
				//deleteMarker _unitMarker;
			};
		} else {
			if!(_unitGroup == "DacCong")then 
			{
				createMarkerLocal [_unitMarker, [0,0,0]];
				if(_debug isEqualTo 1) then { diag_log format["[+]fn_player_markers_job DBG-2 MikeForce created new marker _unitMarker:%1 _unitGroupColor:%2", _unitMarker, _unitGroupColor] };
				_unitMarker setMarkerTextLocal name _unit;
				_unitMarker setMarkerShapeLocal "ICON";
				_unitMarker setMarkerTypeLocal _markerType;
				_unitMarker setMarkerAlphaLocal 1;
			} else {
				_unitMarker setMarkerAlphaLocal 0;
				//deleteMarker _unitMarker;
			};
		};
	};
	_activePlayerMarkers pushBack _unitMarker;

	private _healthState = lifeState _unit;
	private _incapacitated = alive _unit && (_unit getVariable ["vn_revive_incapacitated", false] || _healthState == "INCAPACITATED");

	if (alive _unit) then {
		if (_incapacitated) then {
			if(_playerGroup == "DacCong")then 
			{
				if(_unitGroup == "DacCong")then { _unitMarker setMarkerColorLocal "ColorRed" };
			}else{
				if!(_unitGroup == "DacCong")then { _unitMarker setMarkerColorLocal "ColorRed" };
			};
		} else {
			_unitMarker setMarkerColorLocal _unitGroupColor;
		};
	} else {
		_unitMarker setMarkerColorLocal "ColorGrey";
	};

	//Special case if player is in vehicle.
	if (vehicle _unit != _unit) then {
		if(_playerGroup == "DacCong")then 
		{
			if(_unitGroup == "DacCong")then {
				vn_mf_player_markers_manned_vehicles pushBackUnique vehicle _unit;
				_unitMarker setMarkerAlphaLocal 0;
			};
		}else{
			if!(_unitGroup == "DacCong")then {
				vn_mf_player_markers_manned_vehicles pushBackUnique vehicle _unit;
				_unitMarker setMarkerAlphaLocal 0;
			};
		};
	} else {
		if(_playerGroup == "DacCong")then 
		{
			if(_unitGroup == "DacCong")then { _unitMarker setMarkerAlphaLocal 1 };
		}else{
			if!(_unitGroup == "DacCong")then { _unitMarker setMarkerAlphaLocal 1 };
		};
	};
} forEach _playerMarkers; //allPlayers;

if(_debug isEqualTo 1) then { diag_log format["[+]fn_player_markers_job DBG-3 finished allPlayers markers Player:%1", player] };

//Add markers for vehicles.
{
	private _vehicle = _x;
	private _crew = crew _vehicle select { isPlayer _x };
	if(_debug isEqualTo 1) then { diag_log format["[+]fn_player_markers_job DBG-4 vehicles markers _vehicle:%1 _crew:%2", _vehicle, _crew] };
	//If somehow we've got a vehicle in this list with no player crew.
	if (_crew isEqualTo []) exitWith {};

	private _vehicleMarker = format ["player_marker_vehicle_%1", netId _vehicle];
	_activeVehicleMarkers pushBack _vehicleMarker;
	
	if(_debug isEqualTo 1) then { diag_log format["[+]fn_player_markers_job DBG-4a vehicles markers _vehicle:%1 _vehicleMarker:%2", _vehicle, _vehicleMarker] };

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
	if(_vehicleGroup == "DacCong") then { _vehicleGroupColor = "ColorEAST"; vn_mf_vehicle_markers_daccong pushBack _vehicleMarker; };
	if(_vehicleGroup == "SaigonWarriors") then { _vehicleGroupColor = "ColorBlue" };
	if(_vehicleGroup in ["GreenHornets","SatansAngels","Muskets"]) then { _vehicleGroupColor = "ColorGreen" };
	if(_vehicleGroup in ["ACAV","BlackHorse","Frogmen"])then { _vehicleGroupColor = "ColorOrange" };
	if(_vehicleGroup == "MACVSOG")then { _vehicleGroupColor = "ColorYellow" };
	if(_vehicleGroup in ["SpikeTeam", "TigerForce", "Montagnard"])then { _vehicleGroupColor = "colorIndependent" };
	if(_debug isEqualTo 1) then { diag_log format["[+]fn_player_markers_job DBG-4a vehicles markers _vehicleGroup:%1 _markerType:%2 _vehicleGroupColor:%3 _driverType:%4", _vehicleGroup, _vehicleGroupColor, _driverType] };
	
	//Easiest way to check if it exists
	if (markerShape _vehicleMarker == "") then 
	{
		if(_playerGroup == "DacCong") then
		{
			if(_vehicleGroup == "DacCong") then
			{
				createMarkerLocal [_vehicleMarker, [0,0,0]];
				if(_debug isEqualTo 1) then { diag_log format["[+]fn_player_markers_job DBG-4b Dac Cong created new marker _vehicleMarker:%1 _vehicleGroupColor:%2", _vehicleMarker, _vehicleGroupColor] };
				_vehicleMarker setMarkerShapeLocal "ICON";
				_vehicleMarker setMarkerAlphaLocal 1;
				_vehicleMarker setMarkerTypeLocal _markerType;
				_vehicleMarker setMarkerColorLocal _vehicleGroupColor;
				if(_debug isEqualTo 1) then { diag_log format["[+]fn_player_markers_job DBG-4c MikeForce created new marker _vehicleMarker:%1 _markerType:%2", _vehicleMarker, _markerType] };
			};
			if!(_vehicleGroup == "DacCong")then {
				_vehicleMarker setMarkerAlphaLocal 0;
				//deleteMarker _vehicleMarker;
			};
		} 
		else 	
		{
			if!(_vehicleGroup == "DacCong") then
			{
				createMarkerLocal [_vehicleMarker, [0,0,0]];
				if(_debug isEqualTo 1) then { diag_log format["[+]fn_player_markers_job DBG-4d MikeForce created new marker _vehicleMarker:%1 _vehicleGroupColor:%2", _vehicleMarker, _vehicleGroupColor]; };
				_vehicleMarker setMarkerShapeLocal "ICON";
				_vehicleMarker setMarkerAlphaLocal 1;
				_vehicleMarker setMarkerTypeLocal _markerType;
				_vehicleMarker setMarkerColorLocal _vehicleGroupColor;
				if(_debug isEqualTo 1) then { diag_log format["[+]fn_player_markers_job DBG-4e MikeForce created new marker _vehicleMarker:%1 _markerType:%2", _vehicleMarker, _markerType]; };
			};
			if(_vehicleGroup == "DacCong") then {
				_vehicleMarker setMarkerAlphaLocal 0;
				//deleteMarker _vehicleMarker;
			};
		};
	};

	private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
	_vehicleMarker setMarkerTextLocal format [localize "STR_vn_mf_player_markers_vehicle_marker", _vehicleName, _driverType, _vehicleDriverName, count _crew];
	if(_debug isEqualTo 1) then { diag_log format["[+]fn_player_markers_job DBG-4e MikeForce created new marker _vehicle:%1 _vehicleName:%2 crewcount:%3", _vehicle, _vehicleName, count _crew]; };
} forEach vn_mf_player_markers_manned_vehicles;

if(_debug isEqualTo 1) then { diag_log format["[+]fn_player_markers_job DBG-5 finished vehicles markers Player:%1", player]; };

//Prune markers for players that have left.
private _inactiveMarkers = (vn_mf_player_markers - _activePlayerMarkers) + (vn_mf_player_markers_vehicle_markers - _activeVehicleMarkers);

{
	deleteMarker _x;
} forEach _inactiveMarkers;

vn_mf_player_markers = _activePlayerMarkers;
vn_mf_player_markers_vehicle_markers = _activeVehicleMarkers;

//Remove opposite teams markers
private _removeMarkersDaccong = getArray(missionConfigFile >> "gamemode" >> "settings" >> "playermarkers" >> "daccong");
private _removeMarkersNotDaccong = getArray(missionConfigFile >> "gamemode" >> "settings" >> "playermarkers" >> "notdaccong");

if(_playerGroup == "DacCong")then
{
	{
		deleteMarkerLocal _x;
	} forEach _removeMarkersDaccong;
} else {
	{
		deleteMarkerLocal _x;
	} forEach _removeMarkersNotDaccong;
};


if!((player getVariable "vn_mf_db_player_group") == "DacCong")then {
	{ _x setMarkerAlphaLocal 0;deleteMarker _x; }forEach vn_mf_player_markers_daccong;
	{ _x setMarkerAlphaLocal 0;deleteMarker _x; }forEach vn_mf_vehicle_markers_daccong;
};
