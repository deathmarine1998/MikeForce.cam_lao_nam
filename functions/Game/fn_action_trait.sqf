/*
	File: fn_action_trait.sqf
	Author: Aaron Clark <vbawol>
	Date: 2020-05-23
	Last Update: 2021-11-14
	Public: No
	
	Description:
		Adds action to set unit traits
	
	Parameter(s):
		_ - not used but passed from menu [any]
		_argments - location and agent [Array]
	
	Returns: nothing
	
	Example(s):
		call vn_mf_fnc_action_trait
*/

vn_mf_fnc_client_trait = {
	private _names = getArray (missionConfigFile >> 'gamemode' >> 'traits' >> 'names');
	private _trait = _names# (_this#0);
	if!(player getUnitTrait _trait)then {
		['settrait', _this] call para_c_fnc_call_on_server;
	} else {
		['TrainingFailedAlreadyTrained', ['Training was already completed!']] call para_c_fnc_show_notification;
	};
};

private _traits = getArray (missionConfigFile >> "gamemode" >> "traits" >> "texts");
private _names = getArray (missionConfigFile >> "gamemode" >> "traits" >> "names");
private _images = getArray (missionConfigFile >> "gamemode" >> "traits" >> "images");
private _airSupport = ["enable_air_support", 1] call BIS_fnc_getParamValue;
private _artySupport = ["enable_arty_support", 1] call BIS_fnc_getParamValue;
{
	private _agent = _x;
	{
		private _trait_name = _names select _forEachIndex;
		private _image = _images select _forEachIndex;
		if !(_trait_name == "radioOperator" && (_airSupport == 0 && _artySupport == 0)) then {
			//if (player getUnitTrait _trait_name)then { _image = "custom\wheelmenu\greencheckmark.paa"; };
			//if !(player getUnitTrait _trait_name)then 
			//{
				[
					_agent,
					true,
					_image,
					"",
					[_forEachIndex, _agent],
					format [localize "STR_vn_mf_training", _x call BIS_fnc_localize],
					"vn_mf_fnc_client_trait"
				] call para_c_fnc_wheel_menu_add_obj_action;
			//};
		};
	} forEach _traits;
} forEach vn_mf_duty_officers;
