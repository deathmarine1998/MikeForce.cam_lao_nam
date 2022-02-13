private _message = "";
private _startTimer = serverTime - mf_s_capturedZoneTime;
private _hard_ai = para_s_ai_obj_hard_ai_limit;
private _elapsed = round(_startTimer/60);
private _timeLeft = 60 - _elapsed;
if((_timeLeft > 58) && !(CAPTURERESTART60MIN))then { 
	CAPTURERESTART60MIN = true;
	_message = "Defend The Zone         You have 1 hour!";
};
if((_timeLeft == 58) && !(CAPTURERESTART59MIN))then {
	CAPTURERESTART59MIN = true;
	_message = "Do not let Dac Cong raise their flag";
};
if((_timeLeft == 55) && !(CAPTURERESTART55MIN))then {
	CAPTURERESTART55MIN = true;
	_message = "55 Minutes left to hold the Zone";
};
if((_timeLeft == 50) && !(CAPTURERESTART50MIN))then {
	CAPTURERESTART50MIN = true;
	_message = "50 Minutes left for DacCong to capture the Zone";
	_hard_ai = 110;
};
if((_timeLeft == 40) && !(CAPTURERESTART40MIN))then {
	CAPTURERESTART40MIN = true;
	_message = "40 Minutes left to hold the Zone";
	_hard_ai = 100;
};
if((_timeLeft == 30) && !(CAPTURERESTART30MIN))then {
	CAPTURERESTART30MIN = true;
	_message = "30 Minutes left to recover wrecks";
	_hard_ai = 90;
};
if((_timeLeft == 20) && !(CAPTURERESTART20MIN))then {
	CAPTURERESTART20MIN = true;
	_message = "20 Minutes left to build up for the next AO";
	_hard_ai = 70;
};
if((_timeLeft == 15) && !(CAPTURERESTART15MIN))then {
	CAPTURERESTART15MIN = true;
	_message = "15 Minutes left to RTB";
	CAPTUREZONE setMarkerColor "ColorGreen";
	CAPTUREZONE setMarkerBrush "Solid";
	localNamespace getVariable [CAPTUREZONE, []] set [struct_zone_m_captured, true];
	_hard_ai = 50;
};

if((_timeLeft == 10) && !(CAPTURERESTART10MIN))then {
	CAPTURERESTART10MIN = true;
	_message = "10 Minutes left until Server Restart";
	_hard_ai = 40;
};

if((_timeLeft == 5) && !(CAPTURERESTART5MIN))then { CAPTURERESTART5MIN = true;_message = "5 Minutes left until restart" };
if((_timeLeft == 2) && !(CAPTURERESTART2MIN))then { CAPTURERESTART2MIN = true;_message = "2 Minutes left until restart. We Recommend Logging Out" };

if(CAPTURERESTART1MIN)then { [] call vn_mf_fnc_server_rcon_event_kickAllrestart };
if((_timeLeft == 1) && !(CAPTURERESTART1MIN))then { CAPTURERESTART1MIN = true;_message = "No Time Left! Server Restarting NOW." };

para_s_ai_obj_hard_ai_limit = _hard_ai;

if!(_message == "")then {
	["DefendTheAORestart", [_message]] remoteExec ["para_c_fnc_show_notification", allPlayers];
	diag_log format["[DirtyDebug]restart_after_capture remaining:%1 msg:%2", _timeLeft, _message];
};

