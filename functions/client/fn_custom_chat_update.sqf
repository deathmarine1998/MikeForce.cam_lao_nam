// Add custom channel based on group
private _group_ID = player getVariable "vn_mf_db_player_group";
if!(_group_ID == "DacCong")then {
	for "_i" from 1 to 9 do {
		_i radioChannelAdd [player];
		(_i+5) enableChannel [false,false];
	};
	10 radioChannelRemove [player];
};

switch(_group_ID) do
{
	case "DacCong" : {
		10 radioChannelAdd [player];
		15 enableChannel [true,true];
		for "_i" from 1 to 9 do {
			_i radioChannelRemove [player];
		};
	};

	case "MACV" : {
		for "_i" from 1 to 9 do {
			(_i+5) enableChannel [true,true];
		};
	};

	case "633rdCSG": {
		6 enableChannel [true,false];
		7 enableChannel [true,false];
		8 enableChannel [true,false];
		9 enableChannel [true,false];
		10 enableChannel [false,false];
		11 enableChannel [true,true];
	};

	case "MikeForce": {
		6 enableChannel [true,true];
		7 enableChannel [true,false];
		8 enableChannel [true,false];
		9 enableChannel [true,false];
		10 enableChannel [false,false];
	};

	case "GreenHornets": {
		6 enableChannel [true,false];
		7 enableChannel [true,true];
		8 enableChannel [true,false];
		9 enableChannel [true,false];
		10 enableChannel [false,false];
	};

	case "ACAV" : {
		6 enableChannel [true,false];
		7 enableChannel [true,false];
		8 enableChannel [true,true];
		9 enableChannel [true,false];
		10 enableChannel [false,false];
		11 enableChannel [false,false];
	};

	case "SpikeTeam" : {
		9 enableChannel [true,true];
		10 enableChannel [false,false];
		14 enableChannel [true,false];		
	};

	case "TigerForce" : {
		9 enableChannel [true,true];
		10 enableChannel [false,false];
		14 enableChannel [true,false];	
	};

	case "BlackHawk" : {
		8 enableChannel [true,true];
		10 enableChannel [false,false];
		11 enableChannel [false,false];
	};

	case "Muskets" : {
		7 enableChannel [true,false];
		10 enableChannel [false,false];
		12 enableChannel [true,true];
	};

	case "SatansAngels" : {
		7 enableChannel [true,false];
		10 enableChannel [false,false];
		12 enableChannel [true,true];
	};

	case "MilitaryPolice" : {
		6 enableChannel [true,false];
		7 enableChannel [true,false];
		8 enableChannel [true,false];
		9 enableChannel [true,false];
		10 enableChannel [false,false];
		13 enableChannel [true,true];
	};

	case "EasyCompany" : {
		6 enableChannel [true,true];
		7 enableChannel [true,false];
		8 enableChannel [true,false];
		9 enableChannel [true,false];
		10 enableChannel [false,false];
	};

	default {
		6 enableChannel [false,false];
		7 enableChannel [false,false];
		8 enableChannel [false,false];
		9 enableChannel [false,false];
		10 enableChannel [false,false];
		13 enableChannel [false,false];
	};
};
/*
_customChannels = getArray(missionConfigFile >> "gamemode" >> "customchat" >> "channels");

{
	_x params ["_chanID", "_chanName", "_chanColor"];
	private _handled = false;
	
	diag_log format["[+]fn_custom_chat_update DBG-1 _chanID:%1 _customChannels:%2", _chanID, _chanName];
	private _playerGroup = (_group_ID in ["MikeForce","ACAV","GreenHornets"]);
	private _channelGroup = (_chanName in ["MikeForce","ACAV","GreenHornets"]);

	private _playerGroupAC = (_group_ID in ["ACAV","BlackHawk"]);
	private _channelGroupAC = (_chanName in ["ACAV","BlackHawk"]);
	
	private _playerGroupST = (_group_ID in ["SpikeTeam","TigerForce","Montagnard"]);
	private _channelGroupST = (_chanName in ["SpikeTeam","TigerForce","Montagnard"]);
	
	private _playerGroupGH = (_group_ID in ["Muskets","SatansAngels"]);
	private _channelGroupGH = (_chanName in ["Muskets","SatansAngels"]);
	
	private _enabledChannel = _chanID + 5;
	
	if!(_group_ID isEqualTo _chanName)then{
		_enabledChannel enableChannel [false, false];
	};
	
	if(_group_ID isEqualTo "MACV")then {
		diag_log format["[+]fn_custom_chat_update DBG-2 MACV _chanID:%1 _customChannels:%2", _chanID, _chanName];
		if!(_chanName isEqualTo "DacCong")then {
			_enabledChannel enableChannel [true, true];
		_handled = true;
	};

	if(_playerGroup && _channelGroup)then {
		if(_group_ID isEqualTo _chanName)then{
			_enabledChannel enableChannel [true, true];
		} else {
			_enabledChannel enableChannel [true, false];
		};
		_handled = true;
	};
	
	if(_playerGroupST && _channelGroupST)then {
		if(_group_ID isEqualTo _chanName)then{
			_enabledChannel enableChannel [true, true];
		} else {
			_enabledChannel enableChannel [true, false];
		};
		_handled = true;
	};
	
	if(_playerGroupGH && _channelGroupGH)then {
		if(_group_ID isEqualTo _chanName)then{
			_enabledChannel enableChannel [true, true];
		} else {
			_enabledChannel enableChannel [true, false];
		};
		_handled = true;
	};
	
	if(_playerGroupAC && _channelGroupAC)then {
		if(_group_ID isEqualTo _chanName)then{
			_enabledChannel enableChannel [true, true];
		} else {
			_enabledChannel enableChannel [true, false];
		};
		_handled = true;
	};
	
	if!(_handled)then {
		if(_group_ID isEqualTo _chanName)then {	
			_enabledChannel enableChannel [true, true];
		}else{
			_enabledChannel enableChannel [false, false];
		};
	};

}forEach _customChannels;
*/