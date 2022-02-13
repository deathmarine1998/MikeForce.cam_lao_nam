if!(AttachedChemlight isEqualTo [])then{
	deleteVehicle AttachedChemlight;
};


private _chemlights = ["Chemlight_green","Chemlight_yellow","Chemlight_red","Chemlight_blue"];
private _object = player;
private _items = magazines _object;
private _availChems = _items arrayIntersect _chemlights;
private _chem = _availChems call BIS_fnc_selectRandom;
private _chemColour = [0.0, 1.0, 0.0];
if (count _availChems == 0) then 
{
	["NoChemlights", ["You have no chemlights!"]] call para_c_fnc_show_notification;
}else{
	if (_chem == "Chemlight_red") then {_chemColour = [1.0, 0.0, 0.0];};
	if (_chem == "Chemlight_green") then {_chemColour = [0.0, 1.0, 0.0];};
	if (_chem == "Chemlight_blue") then {_chemColour = [0.0, 0.0, 1.0];};
	if (_chem == "Chemlight_yellow") then {_chemColour = [0.5, 0.5, 0.0];};	
	_object removeItem _chem;
	_object playMove "AinvPknlMstpSnonWnonDr_medic3";

	_light = createVehicle ["#lightpoint", [0,0,0], [], 0, "NONE"];
	_light lightAttachObject [_object, [0.0,0.0,-2.5]];
	_light setLightBrightness 0.5;
	_light setLightAmbient _chemColour;
	_light setLightColor _chemColour;
	AttachedChemlight = _light;
	AttachedChemlightTimer = diag_tickTime;
};