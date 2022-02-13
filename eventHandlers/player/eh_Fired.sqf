params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

private _unitPos = getPos _unit;
private _config = (missionConfigFile >> "gamemode" >> "safezones" >> "safezonescfg");
private _markers = getArray(_config >> "markers");

if (isNil "LastNoFireMessage") then {
	LastNoFireMessage = 0;
};

{
	private _zonePos = getMarkerPos _x;
	private _zoneRadius = getNumber(_config >> _x);
	private _dist = _unitPos distance2D _zonePos;
	if(_dist < _zoneRadius)then {
		deleteVehicle _projectile;
		if((diag_TickTime - LastNoFireMessage) > 5)then {
			["NoFireZone"] call para_c_fnc_show_notification;
			LastNoFireMessage = diag_TickTime;
		};
		_markers = []; 
	};	
}forEach _markers;