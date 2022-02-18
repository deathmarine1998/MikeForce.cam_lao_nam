/*
	File: fn_create_supply_officer.sqf
	Author: Aaron Clark, Spoffy
	Date: 2020-05-23
	Last Update: 2020-07-01
	Public: No

	Description:
		Creates a supply officer at the given supply officer marker.
	
	Parameter(s):
		_marker - Supply officer marker [String]
	
	Returns: nothing
	
	Example(s): none
*/

params ["_officerMarker"];

//Turn supply_officer_initial_1 into supply_drop_initial_1
private _dropMarker = "supply_drop" + (_officerMarker select [count "supply_officer"]);
private _officer = missionNamespace getVariable [_officerMarker, objNull];
private _debugAgent = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "createagent");

if(_debugAgent isEqualTo 1) then { diag_log format["[+]fn_create_supply_officer DBG-1 _officerMarker:%1 _dropMarker:%2 _officer:%3", _officerMarker, _dropMarker, _officer] };

private _groupColor = "ColorBlack";
private _officerType = getText(missionConfigFile >> "gamemode" >> "modded_ops" >> "supply_officer"); //"vn_b_men_aircrew_02";

if(_officerMarker == "supply_officer_initial_4") then 
{
	_groupColor = "ColorEAST";
	_officerType = "vn_o_men_nva_marine_01";
};
if(_debugAgent isEqualTo 1) then { diag_log format["[+]fn_create_supply_officer DBG-2 _officerMarker:%1 _groupColor:%2 _officerType:%3", _officerMarker, _groupColor, _officerType] };

if (isNull _officer) then {
	_officer = createAgent [_officerType, getMarkerPos _officerMarker, [], 0, "NONE"];
	_officer setDir markerDir _officerMarker;
	removeHeadgear _officer;
	removeGoggles _officer;
	_officer removeWeapon (primaryWeapon _officer);
	_officer removeWeapon (secondaryWeapon _officer);
	_officer removeWeapon (handgunWeapon _officer);
	_officer allowDamage false;
	_officer switchMove "";
	_officer setCaptive true;
	_officer enableSimulationGlobal false;
	_officer setObjectTextureGlobal [2,"custom\loadingscreens\bronation_banner.paa"];
	missionNamespace setVariable [_officerMarker, _officer, true];
	
	_id = _officer spawn {
		removeAllWeapons _this;
		_this switchmove "";
		uiSleep 1;
		_this enableSimulationGlobal false;
		_this disableAI "ALL";
	};

	//Set up the supply officer interaction overlay
	_officer setVariable ["#para_InteractionOverlay_ConfigClass", "SupplyOfficer", true];
};

_officer setVariable ["vn_mf_supply_drop_marker", _dropMarker, true];

//Stacked JIP call
//This stops any other JIP calls on that object overwriting this one.
[
	[
		[_officer, _officerMarker], 
		{
			params ["_officer", "_officerMarker"];

			["Offier: %1, marker: %2", _officer, _officerMarker] call BIS_fnc_logFormat;

			[_officer] call vn_mf_fnc_action_supplies;

			private _marker = createMarkerLocal [_officerMarker + "_local", getMarkerPos _officerMarker];
			_marker setMarkerColorLocal _groupColor;
			_marker setMarkerTypeLocal "mil_dot";
			//_marker setMarkerTextLocal (localize "STR_vn_mf_supply_officer");
		}
	],
	"call",
	0,
	_officer
] call para_s_fnc_remoteExec_jip_obj_stacked;