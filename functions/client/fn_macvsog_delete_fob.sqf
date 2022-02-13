_objects = position player nearObjects 250;
{
  deleteVehicle _x;
}forEach _objects;