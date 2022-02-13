private _healthState = lifeState player;
private _incapacitated = alive player && (player getVariable ["vn_revive_incapacitated", false] || _healthState == "INCAPACITATED");

if(vehicle player != player) exitWith {};
if(_incapacitated) exitWith {};

private _dancemoves = [ ["acts_dance_01","s"], ["acts_dance_02","s"], ["AmovPercMstpSnonWnonDnon_exerciseKata", "p"] ];
if!(IsDancing)then {
	private _move = selectRandom(_dancemoves);
	if(_move# 1 isEqualTO "s")then {
		player switchMove _move#0
	} else {
		player playMove _move#0
	};
	IsDancing = true;
}else{
	player switchMove "";
	IsDancing = false;
};
