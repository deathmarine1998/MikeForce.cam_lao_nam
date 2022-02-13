private _message = "";
private _startTimer = diag_tickTime; 
private _elapsed = round(_startTimer/60); 
private _timeLeft = 300 - _elapsed;


private _message = "";
private _hour = systemTime select 3;
private _minute = systemTime select 4;
private _restarts = getArray(missionConfigFile >> "gamemode" >> "settings" >> "restartmsgs" >> "restart_times");
if(_restarts isEqualTo [])then { _restarts = [02,06,10,14,18,22] };
{
	if(_hour == (_x-1))then { 
		if((_minute == 45) && !(DIRTYRESTART15MIN))then { DIRTYRESTART15MIN = true;_message = "15 minutes left" };
		if((_minute == 46) && !(DIRTYRESTART15MIN))then { DIRTYRESTART15MIN = true;_message = "15 minutes left" };
		
		if((_minute == 50) && !(DIRTYRESTART10MIN))then { DIRTYRESTART10MIN = true;_message = "10 minutes left" };
		if((_minute == 51) && !(DIRTYRESTART10MIN))then { DIRTYRESTART10MIN = true;_message = "10 minutes left" };
		
		if((_minute == 55) && !(DIRTYRESTART05MIN))then { DIRTYRESTART05MIN = true;_message = "5 minutes left" };
		if((_minute == 56) && !(DIRTYRESTART05MIN))then { DIRTYRESTART05MIN = true;_message = "5 minutes left" };
		
		if((_minute == 57) && !(DIRTYRESTART03MIN))then {
			DIRTYRESTART03MIN = true;
			_message = "3 minutes left";
		};
		if((_minute == 58) && !(DIRTYRESTART02MIN))then {
			DIRTYRESTART02MIN = true;
			_message = "Less Than 2mins left. LOG OUT NOW";
			"#lock" call vn_mf_fnc_server_rcon_event_sendCommand;
		};
		if((_minute == 59) && (DIRTYRESTART02MIN))then {
			DIRTYRESTART01MIN = true;
			_message = "No Time Left! Server Restarting Shortly.";
		};
	};
	if((_hour == _x) && (DIRTYRESTART02MIN))then {
		DIRTYRESTART01MIN = true;
		_message = "No Time Left! Server Restarting NOW.";
	};	
}forEach _restarts;

if!(_message == "")then {
	["ServerRestart", [_message]] remoteExec ["para_c_fnc_show_notification", allPlayers];
};

if(DIRTYRESTART01MIN)then { [] call vn_mf_fnc_server_rcon_event_kickAllrestart };