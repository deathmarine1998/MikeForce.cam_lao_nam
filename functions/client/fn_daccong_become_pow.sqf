params ["_abductor"];

private _abductee = player;
PrisonerOfWar = true;
private _cells = format["armyprisoncells_%1",toLower(worldName)];
private _prisonLocs = getArray(missionConfigFile >> "gamemode" >> "settings" >> "powcages" >> _cells);
private _prisonClothes = getArray(missionConfigFile >> "gamemode" >> "settings" >> "powcages" >> "armyprisonclothes");

removeAllAssignedItems _abductee;
removeAllWeapons _abductee;
removeAllContainers _abductee;
removeGoggles _abductee;
removeHeadgear _abductee;
_abductee setPOS (selectRandom _prisonLocs);
_abductee forceAddUniform (selectRandom _prisonClothes);
_abductee addItem "FirstAidKit";
_abductee addItem "FirstAidKit";
_abductee addItem "FirstAidKit";
_abductee addItem "FirstAidKit";
_abductee setDir 90;
["DCCaptured"] call para_c_fnc_show_notification;