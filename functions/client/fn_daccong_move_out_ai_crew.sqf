params ["_vehicle"]; // the vehicle to clear crew


private _daccong = player;
{
	moveOut _x
} forEach crew _vehicle;