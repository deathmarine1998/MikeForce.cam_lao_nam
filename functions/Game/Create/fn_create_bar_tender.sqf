params ["_bartenderMarker"];

private _dropMarker = "bartender_drop" + (_bartenderMarker select [count "bartender"]);
private _bartender = missionNamespace getVariable [_bartenderMarker, objNull];
private _debugAgent = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "createAgent");

if(_debugAgent isEqualTo 1) then { diag_log format["[+]fn_create_bartender DBG-1 _bartenderMarker:%1 _dropMarker:%2 _bartender:%3", _bartenderMarker, _dropMarker, _bartender] };


if (isNull _bartender) then {
	_bartender = createAgent ["vn_c_men_20", getMarkerPos _bartenderMarker, [], 0, "NONE"];
	_bartender setDir markerDir _bartenderMarker;
	//removeHeadgear _bartender;
	//removeGoggles _bartender;
	_bartender removeWeapon (primaryWeapon _bartender);
	_bartender removeWeapon (secondaryWeapon _bartender);
	_bartender removeWeapon (handgunWeapon _bartender);
	_bartender allowDamage false;
	_bartender setObjectTextureGlobal [2,"custom\taskroster\montagnard_HL.paa"];
	missionNamespace setVariable [_bartenderMarker, _bartender, true];
	//Set up the supply officer interaction overlay
	_bartender setVariable ["#para_InteractionOverlay_ConfigClass", "Bartender", true];
	_position = [15822.1,7163.66,0];
	if(toLower(worldName) == "vn_khe_sanh")then { _position = [10763.3,3231.27,0.989227]; };
	_bartender setPos _position;
	
	_id = _bartender spawn {
		removeAllWeapons _this;
		_this switchmove "";
		uiSleep 1;
		_this enableSimulationGlobal false;
		_this disableAI "ALL";
	};
};

_bartender setVariable ["vn_mf_bartender_drop_marker", _dropMarker, true];

//Stacked JIP call
//This stops any other JIP calls on that object overwriting this one.
[
	[
		[_bartender, _bartenderMarker], 
		{
			params ["_bartender", "_bartenderMarker"];

			["Bartender: %1, marker: %2", _bartender, _bartenderMarker] call BIS_fnc_logFormat;

			[_bartender] call vn_mf_fnc_action_drinks;

			private _marker = createMarkerLocal [_bartenderMarker + "_local", getMarkerPos _bartenderMarker];
			_marker setMarkerColorLocal "colorIndependent";
			_marker setMarkerTypeLocal "mil_dot";
			//_marker setMarkerTextLocal (localize "STR_vn_mf_bartender");
		}
	],
	"call",
	0,
	_bartender
] call para_s_fnc_remoteExec_jip_obj_stacked;