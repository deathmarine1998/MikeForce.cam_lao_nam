/*
    File: eh_EntityKilled.sqf
    Author: Aaron Clark <vbawol>
    Date: 2020-01-29
    Last Update: 2020-05-27
    Public: No

    Description:
		Entity death event handler for tracking stats.

    Parameter(s):
		_unit - entity that was killed [OBJECT]
		_killer - the killer (vehicle or person) [OBJECT]
		_instigator - person who pulled the trigger [OBJECT]
		_useEffects - destruction effects [BOOL]

    Returns: nothing

    Example(s):
    	Not called directly.
*/

params
[
	"_unit",
	"_killer",
	"_instigator",
	"_useEffects"
];


private _debugKills = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "killedstats");
if(_debugKills isEqualTo 1) then { diag_log format["[DirtyDebug]eh_EntityKilled DBG-1 _unit:%1 _killer:%2 _instigator:%3 _useEffects:%4", _unit, _killer, _instigator, _useEffects] };

private _kill_type = "deaths";
private _rankPoints = -1;
private _unitGroup = "AIGroup";
private _killerGroup = "AIGroup";

private _is_unit_player = isPlayer _unit;
// get player group
if(_is_unit_player)then{ 
	_unitUID = getPlayerUID _unit;
	//_unitGroup = _unit getVariable "vn_mf_db_player_group";
	(["GET", (_unitUID + "_team"), "MikeForce"] call para_s_fnc_profile_db) params ["","_unitTeam"];
	_unitGroup = _unitTeam;
};

private _is_killer_player = isPlayer _killer;
// get killer group
if(_is_killer_player)then{ 
	_killerUID = getPlayerUID _killer;
	//_killerGroup = _killer getVariable "vn_mf_db_player_group"};
	(["GET", (_killerUID + "_team"), "MikeForce"] call para_s_fnc_profile_db) params ["","_killerTeam"];
	_killerGroup = _killerTeam;
};


if(_debugKills isEqualTo 1) then { diag_log format["[DirtyDebug]eh_EntityKilled DBG-2 is_unit_player:%1 typeOfUnit:%2 unitGroup:%3 is_killer_player:%4 killerGroup:%5 useEffects:%6", _is_unit_player, (typeOf _unit), _unitGroup,_is_killer_player, _killerGroup, _killerGroup] };

if (isNull _instigator) then { _instigator = UAVControl vehicle _killer select 0 }; // UAV/UGV player operated road kill -
if (isNull _instigator) then { _instigator = _killer}; // player driven vehicle road kill

// record stats crew _killer is already in an ARRAY [] ..... _unit is not hence [_unit] for change stat
if (_is_unit_player) then
{
	// record player death
	[[_unit],_kill_type] call vn_mf_fnc_change_player_stat;
	// reset hunger and thirst
	[[_unit],"hunger"] call vn_mf_fnc_change_player_stat;
	[[_unit],"thirst"] call vn_mf_fnc_change_player_stat;
	
	//check death of unit here and what vehicle they were in
	
	if (_is_killer_player) then
	{
		// if _killer is self add 1 to : suicides
		if( (_unit isEqualTo _killer) || ((vehicle _unit) isEqualTo _killer) || (_unit isEqualTo (vehicle _killer)) )then
		{
			[crew _killer,"suicides"] call vn_mf_fnc_change_player_stat;
			[crew _killer,"rank",-1] call vn_mf_fnc_change_player_stat;
		}
		else
		{
			_kill_type = "kills";
			_rankPoints = 1;
			if (vehicle _unit isKindOf "Man") then
			{	
				// _unit is another player report as - friendlyfire
				if(_unitGroup isEqualTo "DacCong")then {
					if(_killerGroup isEqualTo "DacCong")then{
						_kill_type = "friendlyfire";
						_rankPoints = -10;
					}else{
						_kill_type = "kills";
						_rankPoints = 5;
					};
				}else{
					if(_killerGroup isEqualTo "DacCong")then {
						_kill_type = "kills";
						_rankPoints = 3;
					}else{
						_kill_type = "friendlyfire";
						_rankPoints = -10;
					};
				};
			} else {
				// if vehicle record as - vehiclekill
				_kill_type = "vehiclekills";
				_rankPoints = 1;
				if(vehicle _unit isKindOf "ship")then {	_kill_type = "boatkills";_rankPoints = 5;};
				if(vehicle _unit isKindOf "air")then { _kill_type = "chopperkills";_rankPoints = 5;};
				if(vehicle _unit isKindOf "air" && vehicle _killer isKindOf "air") then { _kill_type = "atoakills";_rankPoints = 15;};
				if(vehicle _unit isKindOf "vn_air_f4_base")then { _kill_type = "vehiclekills";_rankPoints = 10;};
				if(vehicle _unit isKindOf "car_f")then { _kill_type = "vehiclekills";_rankPoints = 10;};
				if(vehicle _unit isKindOf "tank")then {	_kill_type = "tankkills";_rankPoints = 15;};
			};
			[[_instigator],_kill_type] call vn_mf_fnc_change_player_stat;
			[[_instigator],"rank",_rankPoints] call vn_mf_fnc_change_player_stat;
			if(_kill_type isEqualTo "friendlyfire")then { 
				diag_log format["[DirtyDebug]FriendlyFire data: name:%1 obj:%2 (UID:%3) killed %4(UID:%5) _useEffects:%6",name _instigator, _instigator, getPlayerUID _instigator, name _unit, getPlayerUID _unit, _useEffects];
				["FriendlyFire", ["TeamKill Warning, PID and watch your fire!"]] remoteExec ["para_c_fnc_show_notification", _instigator];
			};
		};
	};
} else {
	// Should be AI deaths here
	if (_is_killer_player) then
	{

		if (vehicle _unit isKindOf "Man") then
		{
			// if _unit is AI check if civilian or enemy // TODO does not work on AI ??/
			if (_unit getVariable ["sideAtCreation", sideEmpty] isEqualTo civilian) then
			{
				// if civ record as - murder
				[crew _killer,"murders"] call vn_mf_fnc_change_player_stat;
				[crew _killer,"rank",-1] call vn_mf_fnc_change_player_stat;
				if(_killerGroup isEqualTo "TigerForce")then { [crew _killer,"rank",2] call vn_mf_fnc_change_player_stat };
			}
			else
			{
				if!(_killerGroup isEqualTo "DacCong")then{
					// if enemy record as - kill
					[crew _killer,"kills"] call vn_mf_fnc_change_player_stat;
					[crew _killer,"rank",1] call vn_mf_fnc_change_player_stat;
				} else {
					// if enemy record as - kill
					_kill_type = "friendlyfire";
					[crew _killer,_kill_type] call vn_mf_fnc_change_player_stat;
					[crew _killer,"rank",1] call vn_mf_fnc_change_player_stat;
				};
			};

		}
		else
		{
			// if vehicle record as - vehiclekill
			_kill_type = "vehiclekills";
			_rankPoints = 0;
			if(vehicle _unit isKindOf "ship")then {	
				_kill_type = "boatkills";
				_rankPoints = 5;
			};
			
			if(vehicle _unit isKindOf "air")then { 
				_kill_type = "chopperkills";
				_rankPoints = 5;
			};
			
			if(vehicle _unit isKindOf "air" && vehicle _killer isKindOf "air") then { 
				_kill_type = "atoakills";
				_rankPoints = 10;
			};
			
			if(vehicle _unit isKindOf "car_f")then {
				_kill_type = "vehiclekills";
				_rankPoints = 5;
			};
			
			if(vehicle _unit isKindOf "tank")then {
				_kill_type = "tankkills";
				_rankPoints = 10;
			};
			
			if(vehicle _unit isKindOf "")then {
				_kill_type = "";
				_rankPoints = 2;
			};
			
			
			if(vehicle _unit isKindOf "house")then { _kill_type = "destruction" };		
			if(vehicle _unit isKindOf "snake_random_f")then { _kill_type = "hunting"; deleteVehicle _unit; };
			if(vehicle _unit isKindOf "fowl_base_f")then { _kill_type = "hunting"; deleteVehicle _unit; };
			if(vehicle _unit isKindOf "rabbit_f")then { _kill_type = "hunting"; deleteVehicle _unit; };
			if(isNull _unit)then { _kill_type = "hunting"; deleteVehicle _unit; };
			
			[crew _killer,_kill_type] call vn_mf_fnc_change_player_stat;
			if(_rankPoints > 0)then {
				[crew _killer,"rank", _rankPoints] call vn_mf_fnc_change_player_stat;
			};
		};
	};
};

//["EntityKilled mEH: %1 - %2", _kill_type, _this] call BIS_fnc_logFormat;
