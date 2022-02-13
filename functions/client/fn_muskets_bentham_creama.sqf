private ["_player"];
//attach sound to vehicle

_source = playSound3d [getMissionPath "\custom\sounds\HeyBenthamWheresMyCreama.ogg", player];
_source spawn 
{
	sleep 4.2;
	deleteVehicle _this;
};