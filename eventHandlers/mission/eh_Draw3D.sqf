/*
    File: eh_Draw3D.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-01-29
    Last Update: 2020-05-27
    Public: No

    Description:
	    Draw 3d Event Handler.

    Parameter(s): none

    Returns: nothing

    Example(s):
	    Not called directly.
*/

// do cool stuff here with drawIcon3D or drawLine3D
private _groupID = (groupId (group player));
if(_groupID in ["MikeForce","ACAV","GreenHornets","SpikeTeam"])exitWith {};
if(vehicle player != player) exitWith {};

private _dist = 30;
private _hlth = 0.8;
private _nameColor = [1, _hlth, 0.1, (1 - ((_x distance player) / _dist))];
private _iconColor = [1,1,1,0.7];
if(_groupID in ["MACVSOG","Montagnard","DacCong"])then { 
	_dist = 100;
	_hlth = ((0.8 - damage _x) max 0); 
};
if(player getUnitTrait 'medic')then { _hlth = ((0.8 - damage _x) max 0); };
if(mf_a_cia_esp)then { _dist = 1000; };
if!(_groupID in ["DacCong",""])then 
{
	{
		_pgroupID = (groupId (group _x));
		_pgroup_data = getArray(MissionConfigFile >> "gamemode" >> "settings" >> "teams" >> _pgroupID);
		_pgroup_data params["_pgroup_name","_pgroup_icon","_pgroup_name_short","_pgroup_name_long","_pgroup_color"];

		_tagcolor = [1, ((0.8 - damage _x) max 0), 0.1, (1 - ((_x distance player) / _dist))];
		_text = if(isPlayer _x)then { name _x } else { format["%1(AI)",name _x] };
		if(damage _x > 0.79)then { _pgroupID = [1, ((0.8 - damage _x) max 0), 0.1, (1 - ((_x distance player) / _dist))]};
		drawIcon3D ["", _tagcolor, [(visiblePositionasl _x select 0), (visiblePositionasl _x select 1), (ASLToATL (visiblePositionASL _x) select 2) + 2.25 ], 1.5, 1.5, 0, _text, 2, 0.03, "PuristaBold" ];
	} foreach ((allUnits - [player]) select { alive _x && (side group _x != east)});
} else {
	{
		_tagcolor = [1, ((0.8 - damage _x) max 0), 0.1, (1 - ((_x distance player) / _dist))];
		_text = if(isPlayer _x)then { name _x } else { format["%1(AI)",name _x] };
		drawIcon3D ["", _tagcolor, [(visiblePositionasl _x select 0), (visiblePositionasl _x select 1), (ASLToATL (visiblePositionASL _x) select 2) + 2.25 ], 1.5, 1.5, 0, _text, 2, 0.03, "PuristaBold" ];
	} foreach ((allUnits - [player]) select { alive _x && (side group _x == side group player)});
};


if(_groupID in ["Commander","Spectator"])then 
{
	{
		_tagcolor = [1, ((0.8 - damage _x) max 0), 0.1, (1 - ((_x distance player) / 75))];
		_text = if(isPlayer _x)then { name _x } else { format["%1(AI)",name _x] };
		drawIcon3D ["", _tagcolor, [(visiblePositionasl _x select 0), (visiblePositionasl _x select 1), (ASLToATL (visiblePositionASL _x) select 2) + 2.25 ], 1.5, 1.5, 0, _text, 2, 0.03, "PuristaBold" ];
	} foreach ((allUnits - [player]) select { alive _x && (side group _x == side group player)});
};
