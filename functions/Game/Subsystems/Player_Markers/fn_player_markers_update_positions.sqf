/*
	File: fn_player_markers_update_positions.sqf
	Author: Spoffy
	Date: 2020-05-29
	Last Update: 2020-07-03
	Public: No
	
	Description:
	    Updates the positions of all player markers.
	
	Parameter(s): none
	
	Returns: nothing
	
	Example(s):
	    call vn_mf_fnc_player_markers_update_positions
*/


private _debug = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "playermarkers");

{
	private _playerGroup = player getVariable ["vn_mf_db_player_group", "MikeForce"];
	private _unitGroup = _x getVariable ["vn_mf_db_player_group", "MikeForce"];
	private _unitMarker = format ["player_marker_%1", getPlayerUID _x];
	if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_update_positions DBG-1 unit:%1 _playerGroup:%2 _unitGroup:%3 _unitMarker:%4 _unitPos:%5", _x, _playerGroup, _unitGroup, _unitMarker, getPos _x]; };
	if(_playerGroup == "DacCong")then
	{
		if(_unitGroup != "DacCong")then { 
			_unitMarker setMarkerAlphaLocal 0;
			//deleteMarker _unitMarker; 
		};
	}else{
		if(_unitGroup == "DacCong")then { 
			_unitMarker setMarkerAlphaLocal 0;
			//deleteMarker _unitMarker; 
		};
	};
	if!((markerAlpha _unitMarker) isEqualTo 0)then {
		_unitMarker setMarkerPosLocal getPos _x;
		if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_update_positions DBG-1 unit:%1 _unitMarker:%2 _unitPos:%3", _x, _unitMarker, getPos _x]; };
	};
} forEach allPlayers;

{
	private _vehicleMarker = format ["player_marker_vehicle_%1", netId _x];
	if!((markerAlpha _vehicleMarker) isEqualTo 0)then {
		_vehicleMarker setMarkerPosLocal getPos _x;
		if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_update_positions DBG-1 vehicle:%1 _vehicleMarker:%2 _vehiclePos:%3", _x, _vehicleMarker, getPos _x]; };
	};
} forEach vn_mf_player_markers_manned_vehicles;

{
	private _vehicleMarker = format ["player_marker_vehicle_%1", netId _x];
	if!((markerAlpha _vehicleMarker) isEqualTo 0)then {
		_vehicleMarker setMarkerPosLocal getPos _x;
		if(_debug isEqualTo 1) then { diag_log format["[DirtyDebug]fn_player_markers_update_positions DBG-1 vehicle:%1 _vehicleMarker:%2 _vehiclePos:%3", _x, _vehicleMarker, getPos _x]; };
	};
} forEach vn_dc_player_markers_manned_vehicles;