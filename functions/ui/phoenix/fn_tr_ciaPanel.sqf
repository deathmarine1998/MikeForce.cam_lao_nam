
disableSerialization;
#include "..\..\..\config\ui\ui_def_base.inc"

params["_team"];

private _config = (missionConfigFile >> "gamemode" >> "vars" >> "players");
private _uid = getPlayerUID player;

private _command = getArray(_config >> "macv");
if((_team == "MACV") && !(_uid in _command))exitWith {
	[
		[
			"MACV-SOG Command",
			"You are not authorized to join Command on this server."
		]
	] call para_c_fnc_postNotification;
};
private _tigerforce = getArray(_config >> "tigerforce");
if((_team == "TigerForce") && !(_uid in _tigerforce) && !(_uid in _command))exitWith {
	[
		[
			"Tiger Force",
			"You are not authorized to join Tiger Force. Join discord and A3 Units, links in Welcome Screen."
		]
	] call para_c_fnc_postNotification;
};
private _satansangels = getArray(_config >> "satansangels");
if((_team == "SatansAngels") && !(_uid in _satansangels) && !(_uid in _command))exitWith {
	[
		[
			"Satans Angels Tactical Fighter Squad",
			"You are not authorized to join Satans Angels. Join discord and A3 Units, links in Welcome Screen."
		]
	] call para_c_fnc_postNotification;
};


if (_team == "SpikeTeam") exitWith {
	[
		[
			"Coming Soon!",
			"Spike Team is currently in development, and will be coming soon to a Mike Force near you."
		]
	] call para_c_fnc_postNotification;
};

vn_tr_groupID = _team;
_group_data = getArray(MissionConfigFile >> "gamemode" >> "settings" >> "teams" >> _team);
_group_name = _group_data#0;
_group_img = _group_data#1;

// _display = uinamespace getvariable ["vn_tr_disp_selectTeam", DisplayNull];
//set standard Missionname (Briefing Text)
VN_TR_SELECTTEAM_TEAM_NAME_CTRL ctrlSetStructuredText parsetext _group_name;
//Img on the lext side
VN_TR_SELECTTEAM_TEAM_LOGO_CTRL ctrlSetText _group_img;

_playerCount = 0;
{
	if(groupID _x isEqualTo _team)exitWith
	{
		_playerCount = count units _x;
	};
}forEach allGroups;
VN_TR_SELECTTEAM_TEAM_PLAYERCOUNT_CTRL ctrlSetStructuredText parsetext format["Active Players: %1", _playerCount];


//DISABLED, can easily be re-enabled, if we want to change the text on the left side too.
/*
_text = composeText ["The Viet Cong controls this province.", lineBreak, "Your Mobile Strike Force must take control of the populace and destroy the Viet Cong"];
VN_TR_SELECTTEAM_TEAM_DESC_CTRL ctrlSetStructuredText _text;

_text = composeText [
						"Capture and hold all zones in this province.",
						lineBreak,
						lineBreak,
						"Each team has unique tasks which help capture a zone.",
						lineBreak,
						lineBreak,
						"Request Support from the other teams to help achieve your goals.",
						lineBreak,
						lineBreak,
						"Complete tasks to gain rank, improved weapons, equipment and vehicles.",
						lineBreak,
						lineBreak,
						"Working together as a unified force will secure the province more quickly.",
						lineBreak,
						lineBreak,
						"Good luck out there, you're going to need it!"];
VN_TR_SELECTTEAM_TEAM_TEXT_CTRL ctrlSetStructuredText _text;
*/


















