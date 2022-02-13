private _objects = [];
private _nearWpnHldrs = [];
private _nearEntities = [];
private _deadObjs = [];
private _blklstObjs = [];
private _allDeadMissionObj = [];
//private _cfg = missionConfigFile >> "gamemode" >> "settings";
//private _cleanUpAreas = getArray(_cfg >> "cleanuparsenal" >> "markers");
{
	private _mkPos = getMarkerPos _x;
	_objects = _mkPos nearObjects 50;
	_nearWpnHldrs = _nearWpnHldrs + _objects;
	_entities = _mkPos nearObjects ["Man",50];
	_nearEntities = _nearEntities + _entities;
	_deadObjs = nearestObjects [_mkPos, ["Man","ReammoBox_F","Slingload_base_F","vn_m72_used"], 150];
	_blklstObjs = nearestObjects [_mkPos, mf_obj2remove, 100];
}forEach vn_mf_markers_arsenals; // _cleanUpAreas;

{
  if((typeOf _x) isEqualTo "GroundWeaponHolder")then {deleteVehicle _x};
}forEach _nearWpnHldrs;

{
  if!(alive _x)then {deleteVehicle _x};
}forEach _nearEntities + _deadObjs;

{
	deleteVehicle _x;
}forEach _blklstObjs;

_allDeadMissionObj = [];
_deadObjs = [];
for "_i" from 0 to (count(vn_mf_markers_zones)-1) do
{
	private _zMrkrPos = getMarkerPos (vn_mf_markers_zones# _i);
	//diag_log format["[DirtyDebug]cleanup_arsenal zone:%1 mrkrPos:%2",(vn_mf_markers_zones# _i), _zMrkrPos];
	_deadObjs = (nearestObjects [_zMrkrPos, ["Man","ReammoBox_F","Slingload_base_F","StaticWeapon","vn_o_vc_spiderhole_01","vn_m72_used"], 1000]) select { !alive _x };
	_allDeadMissionObj append _deadObjs;
};

{
	deleteVehicle _x;
}forEach _allDeadMissionObj;

_allDeadMissionObj = [];
_deadObjs = [];
for "_j" from 0 to (count(vn_mf_markers_supply_officer_initial)-1) do
{
	private _sMrkrPos = getMarkerPos (vn_mf_markers_supply_officer_initial# _j);
	_deadObjs = (nearestObjects [_sMrkrPos, ["Man","ReammoBox_F","Slingload_base_F","StaticWeapon","vn_o_vc_spiderhole_01","vn_m72_used"], 200]) select { !alive _x };
	_allDeadMissionObj append _deadObjs;
};

{
	deleteVehicle _x;
}forEach _allDeadMissionObj;













