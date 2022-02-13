// Location updates
call vn_mf_fnc_display_location_time;

// Escape menu overrides
if(!isNull (findDisplay 49))then {
	call vn_mf_fnc_escape_menu;
};
if((IncapacitatedTimer isEqualTo 0) && (IncapTimerCounter isEqualTo 0))then{
	if(player call para_g_fnc_unit_is_incapacitated)then {
		disableUserInput !userInputDisabled;
		IncapacitatedTimer = diag_tickTime;
		Incapacitated = true;
		IncapTimerCounter = 1;
	};
};
if!(IncapacitatedTimer isEqualTo 0)then {
	private _countDown = diag_tickTime - IncapacitatedTimer;
	if((_countDown > 5) && userInputDisabled)then {
		disableUserInput !userInputDisabled;
	};
	if!(FinalIncapTimer < 0)then{
		FinalIncapTimer = floor(41 - _countdown);
	} else {
		FinalIncapTimer = 0;
		IncapacitatedTimer = 0;
	};
};
if((Incapacitated) && (FinalIncapTimer isEqualTo 0))then {
	if!(player call para_g_fnc_unit_is_incapacitated)then {
		Incapacitated = false;
		IncapTimerCounter = 0;
	};
};
// Chemlight decay
if!(AttachedChemlight isEqualTo [])then  
{
	if((diag_tickTime - AttachedChemlightTimer) > 90)then { AttachedChemlight setLightBrightness 0.475 };
	if((diag_tickTime - AttachedChemlightTimer) > 120)then { AttachedChemlight setLightBrightness 0.45 };
	if((diag_tickTime - AttachedChemlightTimer) > 150)then { AttachedChemlight setLightBrightness 0.425 };
	if((diag_tickTime - AttachedChemlightTimer) > 180)then { AttachedChemlight setLightBrightness 0.4 };
	if((diag_tickTime - AttachedChemlightTimer) > 210)then { AttachedChemlight setLightBrightness 0.35 };
	if((diag_tickTime - AttachedChemlightTimer) > 240)then { AttachedChemlight setLightBrightness 0.3 };
	if((diag_tickTime - AttachedChemlightTimer) > 270)then { AttachedChemlight setLightBrightness 0.25 };
	if((diag_tickTime - AttachedChemlightTimer) > 300)then 
	{
		AttachedChemlightTimer = 0;
		deleteVehicle AttachedChemlight;
		AttachedChemlight = [];
	};
};

// Selfie Burst Shot
if!(SelfieCamera isEqualTo [])then 
{
	private _date = [systemTime #1, systemTime #2, systemTime #0] joinString "_";
	private _time = [systemTime #3, systemTime #4] joinString "-";
	private _dateTime = [_date, _time] joinString "_";
	private _fileName = format["Bro-Nation\%1.png", _dateTime];
	if((diag_tickTime - SelfieSSTimer) > 1.5)then{
		screenshot _fileName;
		SelfieSSTimer = diag_tickTime;
	};
	
	if((diag_tickTime - SelfieCameraTimer) > 5.5)then 
	{ 
		player enablesimulation true;
		SelfieCamera cameraEffect ["terminate","back"];
		camDestroy SelfieCamera;
		SelfieCamera = [];
		SelfieCameraTimer = 0;
		SelfieSSTimer = 0;
	};
};
