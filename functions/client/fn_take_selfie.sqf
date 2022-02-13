private ["_camera"];
if(SelfieCamera isEqualTo [])then {

	player enablesimulation false; 
	showCinemaBorder true;
	_camera = "camera" camCreate (player modelToWorld [1,1,2]);
	_camera cameraEffect ["Internal","TOP"];  
	_camera camSetTarget vehicle player;  
	_camera camSetRelPos [0,2,2];  
	_camera camCommit 5;  
	SelfieCamera = _camera;
	waitUntil {camCommitted _camera};
	SelfieCameraTimer = diag_tickTime;
	SelfieSSTimer = diag_tickTime;
	cutText ['','WHITE IN'];
	playSound "Selfie";
};
