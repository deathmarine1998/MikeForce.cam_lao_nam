//private _msgs = ["Mike Force Held The Zone!","30 Minutes left to recover wrecks","20 Minutes left to RTB","10 Minutes left until Server Restart","5 Minutes left until restart","2 Minutes left until restart. We Recommend Logging Out","No Time Left! Server Restarting NOW."];
private _msgs = ["Mike Force Held The Zone!","20 Minutes left to recover wrecks","15 Minutes left to RTB","10 Minutes left until Server Restart","5 Minutes left until restart","2 Minutes left until restart. We Recommend Logging Out","No Time Left! Server Restarting NOW."];
private _message = "";
private _startTimer = serverTime - mf_s_heldZoneTime;
private _timeLeft = 20 - (round(_startTimer/60));
if((_timeLeft > 18) && !(CAPTURERESTART20MIN))then { CAPTURERESTART20MIN = true;_message = _msgs#0 };
if((_timeLeft == 18) && (CAPTURERESTART20MIN) && !(CAPTURERESTART19MIN))then { CAPTURERESTART19MIN = true;_message =_msgs#1 };
if((_timeLeft == 15) && !(CAPTURERESTART15MIN))then { CAPTURERESTART15MIN = true;_message = _msgs#2 };
if((_timeLeft == 10) && !(CAPTURERESTART10MIN))then { CAPTURERESTART10MIN = true;_message = _msgs#3 };
if((_timeLeft == 5) && !(CAPTURERESTART5MIN))then { CAPTURERESTART5MIN = true;_message = _msgs#4 };
if((_timeLeft == 2) && !(CAPTURERESTART2MIN))then { CAPTURERESTART2MIN = true;_message = _msgs#5 };

if(CAPTURERESTART1MIN)then { [] call vn_mf_fnc_server_rcon_event_kickAllrestart };
if((_timeLeft == 1) && !(CAPTURERESTART1MIN))then { CAPTURERESTART1MIN = true;_message =_msgs#6 };

if!(_message == "")then {
	["DefendTheAORestart", [_message]] remoteExec ["para_c_fnc_show_notification", allPlayers];
	diag_log format["[+]restart_after_capture remaining:%1 msg:%2", _timeLeft, _message];
};

