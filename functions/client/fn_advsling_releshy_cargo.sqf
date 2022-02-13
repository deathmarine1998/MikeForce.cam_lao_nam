params ["_vehicle"];

private _vehicle = vehicle player;
private _cargo = call ASL_Release_Cargo_Action_Check;
if((driver _vehicle == player) && (_cargo))then {
	
	if([_vehicle] call ASL_Can_Release_Cargo) then {
		private _activeRopes = [_vehicle] call ASL_Get_Active_Ropes_With_Cargo;
		if(count _activeRopes == 1) then {
			[_vehicle,player,(_activeRopes select 0) select 0] call ASL_Release_Cargo;
		};
		if(count _activeRopes == 2) then {
			[_vehicle,player,(_activeRopes select 0) select 0] call ASL_Release_Cargo;
			[_vehicle,player,(_activeRopes select 1) select 0] call ASL_Release_Cargo;
		};
		if(count _activeRopes == 3) then {
			[_vehicle,player,(_activeRopes select 0) select 0] call ASL_Release_Cargo;
			[_vehicle,player,(_activeRopes select 1) select 0] call ASL_Release_Cargo;
			[_vehicle,player,(_activeRopes select 2) select 0] call ASL_Release_Cargo;
		};
	};
};