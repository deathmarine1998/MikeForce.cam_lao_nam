disableSerialization;
waitUntil {!isNull (findDisplay 49)};
private _display = findDisplay 49;
private _controlTitle = _display displayCtrl 523;
_controlTitle ctrlSetText "BRO-NATION";
_controlTitle ctrlCommit 0;

private _controlRespawn = _display displayCtrl 1010;
private _respawnText = "SUICIDE";
private _countDown = 0;
private _respawnEnabled = true;
if(FinalIncapTimer > 0)then {
	_respawnText = format["=== INCAP TIMER === %1s ===", FinalIncapTimer];
	_respawnEnabled = false;
};
_controlRespawn ctrlSetText _respawnText;
_controlRespawn ctrlEnable _respawnEnabled;

_controlConfigure = _display displayCtrl 101; // do nothing

_controlSave = _display displayCtrl 103;
_controlSave ctrlEnable false;
_controlSave ctrlSetText "OPT-OUT";
_controlSave ctrlCommit 0;

_controlAbort = _display displayCtrl 104;
_controlAbort ctrlEnable true;
_controlAbort ctrlSetText "VOLUNTARY AWOL";
_controlAbort ctrlCommit 0;

_controlFldManual = _display displayCtrl 122; // do nothing

private _config = (missionConfigFile >> "gamemode" >> "whitelisting");
private _dod = getArray(_config >> "dod" >> "members");
if((getPlayerUID player) in _dod) then { 
	_controlSave ctrlEnable true;
	_controlSave ctrlSetText "Spectate";
	_controlSave ctrlSetEventHandler ["ButtonClick", "[] call vn_mf_fnc_presscorp_spectate"];
	_controlSave ctrlCommit 0;
};

if((player getVariable "vn_mf_db_player_group") in ["DOD", "PressCorp"])then {
	_controlSave ctrlEnable true;
	_controlSave ctrlSetText "Spectate";
	_controlSave ctrlSetEventHandler ["ButtonClick", "[] call vn_mf_fnc_presscorp_spectate"];
	_controlSave ctrlCommit 0;
};

false