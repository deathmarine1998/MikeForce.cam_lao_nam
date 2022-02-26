class wheel_menu_actions 
{
	class base_action 
	{
		//In what situations should the action be visible.
		//ALWAYS is always shown.
		//NO_TARGET is shown when the player isn't looking at an object.
		//Anything else means the action needs to be explicitly shown by the code, such as added to an object.
		visible = "";
		//Action is only visible when condition returns "true"
		condition = "true";
		//Text to display
		text = "";
		//Path to the icon to be shown
		icon = "";
		//Path to the icon to be shown when the entry is highlighted.
		icon_highlighted = "";
		//Arguments to pass to the function, compiled to code.
		arguments = "";
		//Function to call. Looked up in mission namespace.
		function = "";
		//Whether to spawn the function, or call it. 0 for call, 1 for spawn.
		spawn = 0;
		//Colors for the wheel menu
		color_codes[] = {{0.2,0.2,0.2,0.8}, {0.8,0.8,0.8,1}};
		//Colors for the icon
		icon_color_codes[] = {{0.6,0.6,0.6,0.8}, {1,1,1,0.95}};

	};

	//Put in earplugs
	class earplugs_in : base_action
	{
		visible = "ALWAYS";
		condition = "!(localNamespace getVariable ['vn_mf_earplugs', false])";
		text = "STR_VN_QOL_EARPLUGS_IN";
		icon = "\vn\ui_f_vietnam\ui\wheelmenu\img\icons\vn_ico_mf_ear_in_ca.paa";
		icon_highlighted = "";
		arguments = "true";
		function = "vn_mf_fnc_earplugs";
		spawn = 0;
	};

	//Remove earplugs
	class earplugs_out : base_action
	{
		visible = "ALWAYS";
		condition = "(localNamespace getVariable ['vn_mf_earplugs', false])";
		text = "STR_VN_QOL_EARPLUGS_OUT";
		icon = "\vn\ui_f_vietnam\ui\wheelmenu\img\icons\vn_ico_mf_ear_out_ca.paa";
		icon_highlighted = "";
		arguments = "false";
		function = "vn_mf_fnc_earplugs";
		spawn = 0;
	};

	//Add a sandbag to a building.
	class add_sandbag : base_action
	{
		visible = "ALWAYS";
		condition = "cursorTarget call para_g_fnc_is_resupply";
		text = $STR_vn_mf_add_sandbag;
		icon = "\vn\ui_f_vietnam\ui\wheelmenu\img\icons\vn_ico_mf_resupply_ca.paa";
		icon_highlighted = "";
		arguments = "cursorTarget";
		function = "para_c_fnc_resupply_building_with_sandbag";
		spawn = 0;
	};

	//Resupply a building with a crate
	class resupply : base_action
	{
		visible = "ALWAYS";
		condition = "cursorTarget call para_g_fnc_is_resupply";
		text = $STR_vn_mf_resupply;
		icon = "\vn\ui_f_vietnam\ui\wheelmenu\img\icons\vn_ico_mf_resupply_ca.paa";
		icon_highlighted = "";
		arguments = "cursorTarget";
		function = "para_c_fnc_resupply_building_with_crate";
		spawn = 0;
	};

	class dctakepow : base_action
	{
		visible = "ALWAYS";
		condition = "((player getVariable 'vn_mf_db_player_group') isEqualTo 'DacCong') && (cursorTarget call para_g_fnc_unit_is_incapacitated) && ((player distance cursorTarget) < 5)";
		text = "Take Prisoner";
		icon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa";
		icon_highlighted = "";
		arguments = "cursorTarget";
		function = "vn_mf_fnc_daccong_take_mf_pow";
		spawn = 0;
	};
	
	class moveOutAI : base_action
	{
		visible = "ALWAYS";
		condition = "((player getVariable 'vn_mf_db_player_group') isEqualTo 'DacCong') && !(isPlayer cursorTarget) && (cursorObject isKindof 'Man')";
		text = "Move AI Out";
		icon = "\a3\ui_f\data\IGUI\Cfg\Actions\getout_ca.paa";
		icon_highlighted = "";
		arguments = "cursorTarget";
		function = "vn_mf_fnc_daccong_move_out_ai_crew";
		spawn = 0;
	};
	
	class groupUpAI : base_action
	{
		visible = "ALWAYS";
		condition = "((player getVariable 'vn_mf_db_player_group') isEqualTo 'DacCong') && !(isPlayer cursorTarget) && (cursorObject isKindof 'Man')";
		text = "GroupUp AI";
		icon = "\a3\ui_f\data\IGUI\Cfg\Targeting\SeekerLocked_ca.paa";
		icon_highlighted = "";
		arguments = "cursorTarget";
		function = "vn_mf_fnc_daccong_group_up_ai";
		spawn = 0;
	};

	class mftakepow : base_action
	{
		visible = "ALWAYS";
		condition = "!((player getVariable 'vn_mf_db_player_group') isEqualTo 'DacCong') && ((cursorTarget getVariable 'vn_mf_db_player_group') isEqualTo 'DacCong') && (cursorTarget call para_g_fnc_unit_is_incapacitated) && ((player distance cursorTarget) < 5)";
		text = "Take Prisoner";
		icon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa";
		icon_highlighted = "";
		arguments = "cursorTarget";
		function = "vn_mf_fnc_mikeforce_take_dc_pow";
		spawn = 0;
	};
	
	class enableCopilot : base_action
	{
		visible = "ALWAYS";
		condition = "((player getVariable 'vn_mf_db_player_group') isEqualTo ['MACV','SatansAngels']) && (driver vehicle player != player)";
		text = "Enable Copilot";
		icon = "\a3\ui_f\data\IGUI\Cfg\Targeting\SeekerLocked_ca.paa";
		icon_highlighted = "";
		arguments = "cursorTarget";
		function = "vn_mf_fnc_greenhornets_enable_copilot";
		spawn = 0;
		color_codes[] = {{0.2,0.9,0.2,0.8}, {0.8,0.8,0.8,1}};
	};
		
	class delVehicle : base_action
	{
		visible = "ALWAYS";
		condition = "((player getVariable 'vn_mf_db_player_group') isEqualTo 'MACV') && (cursorTarget isKindOf 'Land_vn_building_base')";
		text = "Delete Buildable";
		icon = "\a3\ui_f\data\IGUI\Cfg\Targeting\SeekerLocked_ca.paa";
		icon_highlighted = "";
		arguments = "cursorTarget";
		function = "vn_mf_fnc_macv_delete_vehicle";
		spawn = 0;
		color_codes[] = {{0.9,0.9,0.2,0.8}, {0.8,0.8,0.8,1}};
	};

	class wreckVehicle : base_action
	{
		visible = "ALWAYS";
		condition = "((player getVariable 'vn_mf_db_player_group') isEqualTo 'MACV') && (typeOf cursorTarget == 'vn_us_komex_medium_01')";
		text = "Recover Wreck";
		icon = "\a3\ui_f\data\IGUI\Cfg\Targeting\KnownTarget_ca.paa";
		icon_highlighted = "";
		arguments = "cursorTarget";
		function = "vn_mf_fnc_macv_recover_wreck";
		spawn = 0;
		color_codes[] = {{0.9,0.9,0.2,0.8}, {0.8,0.8,0.8,1}};
	};
	
	class deleteFOB : base_action
	{
		visible = "ALWAYS";
		condition = "((player getVariable 'vn_mf_db_player_group') isEqualTo 'DOD')";
		text = "Delete FOB";
		icon = "\a3\ui_f\data\IGUI\Cfg\Targeting\KnownTarget_ca.paa";
		icon_highlighted = "";
		arguments = "cursorTarget";
		function = "vn_mf_fnc_macv_delete_fob";
		spawn = 0;
		color_codes[] = {{0.9,0.9,0.2,0.8}, {0.8,0.8,0.8,1}};
	};
	
	class suicideVest : base_action
	{
		visible = "ALWAYS";
		condition = "((player getVariable 'vn_mf_db_player_group') isEqualTo 'DacCong') && ((vest player) isKindOf 'vn_o_vest_08') && !(player call para_g_fnc_unit_is_incapacitated) && !(DacCongRedSuicide)";
		text = "Red Suicide";
		icon = "\a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoThrow_ca.paa";
		icon_highlighted = "";
		arguments = "player";
		function = "vn_mf_fnc_daccong_red_suicide";
		spawn = 1;
		color_codes[] = {{0.9,0.2,0.2,0.8}, {0.8,0.8,0.8,1}};
	};

	class raiseFlagMF : base_action
	{
		visible = "ALWAYS";
		condition = "!((player getVariable 'vn_mf_db_player_group') isEqualTo 'DacCong') && (typeOf cursorTarget == 'vn_flagpole_f')";
		text = "Raise Flag";
		icon = "custom\wheelmenu\raiseflag.paa";
		icon_highlighted = "";
		arguments = "cursorTarget";
		function = "vn_mf_fnc_mikeforce_raise_flag";
		spawn = 0;
	};
	
	class lowerFlagMF : base_action
	{
		visible = "ALWAYS";
		condition = "!((player getVariable 'vn_mf_db_player_group') isEqualTo 'DacCong') && (typeOf cursorTarget == 'vn_flagpole_f')";
		text = "Lower Flag";
		icon = "custom\wheelmenu\lowerflag.paa";
		icon_highlighted = "";
		arguments = "cursorTarget";
		function = "vn_mf_fnc_mikeforce_lower_flag";
		spawn = 0;
	};
	
	class raiseFlagDC : base_action
	{
		visible = "ALWAYS";
		condition = "((player getVariable 'vn_mf_db_player_group') isEqualTo 'DacCong') && (typeOf cursorTarget == 'vn_flagpole_f')";
		text = "Raise Flag";
		icon = "custom\wheelmenu\raiseflag.paa";
		icon_highlighted = "";
		arguments = "cursorTarget";
		function = "vn_mf_fnc_daccong_raise_flag";
		spawn = 0;
	};
	
	class lowerFlagDC : base_action
	{
		visible = "ALWAYS";
		condition = "((player getVariable 'vn_mf_db_player_group') isEqualTo 'DacCong') && (typeOf cursorTarget == 'vn_flagpole_f')";
		text = "Lower Flag";
		icon = "custom\wheelmenu\lowerflag.paa";
		icon_highlighted = "";
		arguments = "cursorTarget";
		function = "vn_mf_fnc_daccong_lower_flag";
		spawn = 0;
	};
	
	class DestroyDCRespawn : base_action
	{
		visible = "ALWAYS";
		condition = "!((player getVariable 'vn_mf_db_player_group') isEqualTo 'DacCong') && (typeOf cursorTarget == 'Land_vn_o_platform_04')";
		text = "Destroy Respawn";
		icon = "\a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoThrow_ca.paa";
		icon_highlighted = "";
		arguments = "cursorTarget";
		function = "vn_mf_fnc_destroy_respawn";
		spawn = 1;
	};
	
	class DestroyMFRespawn : base_action
	{
		visible = "ALWAYS";
		condition = "((player getVariable 'vn_mf_db_player_group') isEqualTo 'DacCong') && (typeOf cursorTarget == 'Land_vn_guardhouse_01')";
		text = "Destroy Respawn";
		icon = "\a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoThrow_ca.paa";
		icon_highlighted = "";
		arguments = "cursorTarget";
		function = "vn_mf_fnc_destroy_respawn";
		spawn = 1;
	};
	
	class toggleSiren : base_action
	{
		visible = "nope";
		condition = "((player getVariable 'vn_mf_db_player_group') isEqualTo 'MilitaryPolice')";
		text = "Siren";
		icon = "custom\wheelmenu\mpsiren.paa";
		icon_highlighted = "";
		arguments = "player";
		function = "vn_mf_fnc_militarypolice_toggleSiren";
		spawn = 0;
		color_codes[] = {{0.2,0.9,0.2,0.8}, {0.8,0.8,0.8,1}};
	};

	class Bentham : base_action
	{
		visible = "ALWAYS";
		condition = "(((player getVariable 'vn_mf_db_player_group') in ['MACV','DOD']) && (name cursorObject isEqualTo 'Cpt.Bentham'))";
		text = "CLICK IT!";
		icon = "\a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoThrow_ca.paa";
		icon_highlighted = "";
		arguments = "player";
		function = "vn_mf_fnc_macv_grief_bentham";
		spawn = 0;
		color_codes[] = {{0.2,0.9,0.2,0.8}, {0.8,0.8,0.8,1}};
	};
	
	class PressCorpDressup : base_action
	{
		visible = "ALWAYS";
		condition = "((player getVariable 'vn_mf_db_player_group') == 'PressCorp')";
		text = "Press Uniform";
		icon = "custom\taskroster\presscorp_HL.paa";
		icon_highlighted = "";
		arguments = "player";
		function = "vn_mf_fnc_presscorp_getDressed";
		spawn = 0;
		color_codes[] = {{0.2,0.9,0.2,0.8}, {0.8,0.8,0.8,1}};
	};
	class DriverRemoveAmmo1 : base_action
	{
		visible = "ALWAYS";
		condition = "((vehicle player != player)&&(driver vehicle player == player)&&(!isNil {vehicle player weaponsTurret[-1]})&&(!isNil {(vehicle player weaponsTurret[-1]) select 0})&&!((vehicle player magazinesTurret[-1]) isEqualTo []))";
		text = "Unload Ammo";
		icon = "custom\wheelmenu\ammo_unload.paa";
		icon_highlighted = "custom\wheelmenu\ammo_unload_HL.paa";
		arguments = "(vehicle player weaponsTurret[-1]) select 0";
		function = "vn_mf_fnc_vehicle_removeDriverAmmo";
		spawn = 0;
	};
	
	class DriverRemoveAmmo2 : base_action
	{
		visible = "ALWAYS";
		condition = "if(count (vehicle player weaponsTurret[-1]) > 1)then{(!isNil {(vehicle player weaponsTurret[-1]) select 1} && !((vehicle player magazinesTurret[-1]) isEqualTo []))}else{false}";
		text = "Unload Ammo";
		icon = "custom\wheelmenu\ammo_unload.paa";
		icon_highlighted = "custom\wheelmenu\ammo_unload_HL.paa";
		arguments = "(vehicle player weaponsTurret[-1]) select 1";
		function = "vn_mf_fnc_vehicle_removeDriverAmmo";
		spawn = 0;
	};
	
	class DriverRearmTurret1 : base_action
	{
		visible = "ALWAYS";
		condition = "((vehicle player != player)&&(driver vehicle player == player)&&(!isNil {vehicle player weaponsTurret[-1]})&&(!isNil {(vehicle player weaponsTurret[-1]) select 0}))";
		text = "Load Ammo[D1]";
		icon = "custom\wheelmenu\ammo_reload.paa";
		icon_highlighted = "custom\wheelmenu\ammo_reload_HL.paa";
		arguments = "(vehicle player weaponsTurret[-1]) select 0";
		function = "vn_mf_fnc_vehicle_checkDriverAmmo";
		spawn = 0;
	};
	
	class DriverRearmTurret2 : base_action
	{
		visible = "ALWAYS";
		condition = "if(count (vehicle player weaponsTurret[-1]) > 1)then{(!isNil {(vehicle player weaponsTurret[-1]) select 1})}else{false}";
		text = "Load Ammo[D2]";
		icon = "custom\wheelmenu\ammo_reload.paa";
		icon_highlighted = "custom\wheelmenu\ammo_reload_HL.paa";
		arguments = "(vehicle player weaponsTurret[-1]) select 1";
		function = "vn_mf_fnc_vehicle_checkDriverAmmo";
		spawn = 0;
	};
	
	class DriverRearmTurret3 : base_action
	{
		visible = "ALWAYS";
		condition = "if(count (vehicle player weaponsTurret[-1]) > 2)then{(!isNil {(vehicle player weaponsTurret[-1]) select 2})}else{false}";
		text = "Load Ammo[D3]";
		icon = "custom\wheelmenu\ammo_reload.paa";
		icon_highlighted = "custom\wheelmenu\ammo_reload_HL.paa";
		arguments = "(vehicle player weaponsTurret[-1]) select 2";
		function = "vn_mf_fnc_vehicle_checkDriverAmmo";
		spawn = 0;
	};
	
	class DriverRearmTurret4 : base_action
	{
		visible = "ALWAYS";
		condition = "if(count (vehicle player weaponsTurret[-1]) > 3)then{(!isNil {(vehicle player weaponsTurret[-1]) select 3})}else{false}";
		text = "Load Ammo[D4]";
		icon = "custom\wheelmenu\ammo_reload.paa";
		icon_highlighted = "custom\wheelmenu\ammo_reload_HL.paa";
		arguments = "(vehicle player weaponsTurret[-1]) select 3";
		function = "vn_mf_fnc_vehicle_checkDriverAmmo";
		spawn = 0;
	};
	
	class Gunner0RemoveTurretAmmo : base_action
	{
		visible = "ALWAYS";
		condition = "(vehicle player != player) && (gunner vehicle player == player) && (((assignedVehicleRole player) select 1) isEqualTo [0])  && !(vehicle player isKindOf 'tank')";
		text = "Unload Turret[0]";
		icon = "custom\wheelmenu\ammo_unload.paa";
		icon_highlighted = "custom\wheelmenu\ammo_unload_HL.paa";
		arguments = "((vehicle player) weaponsTurret ((assignedVehicleRole player) select 1))";
		function = "vn_mf_fnc_vehicle_removeTurretAmmo";
		spawn = 0;
	};
	
	class Gunner0RearmTurret : base_action
	{
		visible = "ALWAYS";
		condition = "(vehicle player != player) && (gunner vehicle player == player) && (((assignedVehicleRole player) select 1) isEqualTo [0])  && !(vehicle player isKindOf 'tank')";
		text = "Load Turret[0]";
		icon = "custom\wheelmenu\ammo_reload.paa";
		icon_highlighted = "custom\wheelmenu\ammo_reload_HL.paa";
		arguments = "((vehicle player) weaponsTurret ((assignedVehicleRole player) select 1))";
		function = "vn_mf_fnc_vehicle_checkTurretAmmo";
		spawn = 0;
	};
	
	class Gunner1UnloadTurret : base_action
	{
		visible = "ALWAYS";
		condition = "((vehicle player != player) && (gunner vehicle player == player) && (((assignedVehicleRole player) select 1) isEqualTo [1]) && !(vehicle player isKindOf 'tank'))";
		text = "Unload Turret[1]";
		icon = "custom\wheelmenu\ammo_unload.paa";
		icon_highlighted = "custom\wheelmenu\ammo_unload_HL.paa";
		arguments = "((vehicle player) weaponsTurret ((assignedVehicleRole player) select 1))";
		function = "vn_mf_fnc_vehicle_removeTurretAmmo";
		spawn = 0;
	};
	
	class Gunner1RearmTurret : base_action
	{
		visible = "ALWAYS";
		condition = "((vehicle player != player) && (gunner vehicle player == player) && !(vehicle player isKindOf 'tank') && (((assignedVehicleRole player) select 1) isEqualTo [1]))";
		text = "Load Turret[1]";
		icon = "custom\wheelmenu\ammo_reload.paa";
		icon_highlighted = "custom\wheelmenu\ammo_reload_HL.paa";
		arguments = "((vehicle player) weaponsTurret ((assignedVehicleRole player) select 1))";
		function = "vn_mf_fnc_vehicle_checkTurretAmmo";
		spawn = 0;
	};
	
	class Gunner2UnloadTurret : base_action
	{
		visible = "ALWAYS";
		condition = "(vehicle player != player) && (((assignedVehicleRole player) select 1) isEqualTo [2])";
		text = "Unload Turret[2]";
		icon = "custom\wheelmenu\ammo_unload.paa";
		icon_highlighted = "custom\wheelmenu\ammo_unload_HL.paa";
		arguments = "((vehicle player) weaponsTurret ((assignedVehicleRole player) select 1))";
		function = "vn_mf_fnc_vehicle_removeTurretAmmo";
		spawn = 0;
	};
	
	class Gunner2RearmTurret : base_action
	{
		visible = "ALWAYS";
		condition = "(vehicle player != player) && (((assignedVehicleRole player) select 1) isEqualTo [2])";
		text = "Load Turret[2]";
		icon = "custom\wheelmenu\ammo_reload.paa";
		icon_highlighted = "custom\wheelmenu\ammo_reload_HL.paa";
		arguments = "((vehicle player) weaponsTurret ((assignedVehicleRole player) select 1))";
		function = "vn_mf_fnc_vehicle_checkTurretAmmo";
		spawn = 0;
	};
	
	class Gunner3UnloadTurret : base_action
	{
		visible = "ALWAYS";
		condition = "(vehicle player != player) && (((assignedVehicleRole player) select 1) isEqualTo [3])";
		text = "Unload Turret[3]";
		icon = "custom\wheelmenu\ammo_unload.paa";
		icon_highlighted = "custom\wheelmenu\ammo_unload_HL.paa";
		arguments = "((vehicle player) weaponsTurret ((assignedVehicleRole player) select 1))";
		function = "vn_mf_fnc_vehicle_removeTurretAmmo";
		spawn = 0;
	};
	
	class Gunner3RearmTurret : base_action
	{
		visible = "ALWAYS";
		condition = "(vehicle player != player) && (((assignedVehicleRole player) select 1) isEqualTo [3])";
		text = "Load Turret[3]";
		icon = "custom\wheelmenu\ammo_reload.paa";
		icon_highlighted = "custom\wheelmenu\ammo_reload_HL.paa";
		arguments = "((vehicle player) weaponsTurret ((assignedVehicleRole player) select 1))";
		function = "vn_mf_fnc_vehicle_checkTurretAmmo";
		spawn = 0;
	};
	
	class TankGunnerRearm : base_action
	{
		visible = "ALWAYS";
		condition = "((vehicle player != player) && (((assignedVehicleRole player)select 1) isEqualTo [0]) && (!isNil {vehicle player weaponsTurret[0]}) && !((vehicle player magazinesTurret[0]) isEqualTo []) && (!isNil {(vehicle player weaponsTurret[0]) select 0}))";
		text = "Load Ammo[G]";
		icon = "custom\wheelmenu\ammo_reload.paa";
		icon_highlighted = "custom\wheelmenu\ammo_reload_HL.paa";
		arguments = "((vehicle player weaponsTurret[0]) select 0)";
		function = "vn_mf_fnc_vehicle_checkTurretAmmo";
		spawn = 0;
	};
	
	class TankCommanderRearm : base_action
	{
		visible = "ALWAYS";
		condition = "((vehicle player != player) && (((assignedVehicleRole player)select 1) isEqualTo [0,0]) && (!isNil {vehicle player weaponsTurret[0,0]}) && (commander vehicle player == player) && (!isNil {(vehicle player weaponsTurret[0,0]) select 0})&& (player getVariable 'TurnedOut'))";
		text = "Load Ammo[C]";
		icon = "custom\wheelmenu\ammo_reload.paa";
		icon_highlighted = "custom\wheelmenu\ammo_reload_HL.paa";
		arguments = "((vehicle player weaponsTurret[0,0]) select 0)";
		function = "vn_mf_fnc_vehicle_checkTurretAmmo";
		spawn = 0;
	};
	
	class TankCommanderUnload : base_action
	{
		visible = "ALWAYS";
		condition = "((vehicle player != player) && (((assignedVehicleRole player)select 1) isEqualTo [0,0]) && (!isNil {vehicle player weaponsTurret[0,0]}) && (commander vehicle player == player) && !((vehicle player magazinesTurret[0,0]) isEqualTo []) && (!isNil {(vehicle player weaponsTurret[0,0]) select 0})&& (player getVariable 'TurnedOut'))";
		text = "Unload Ammo[C]";
		icon = "custom\wheelmenu\ammo_unload.paa";
		icon_highlighted = "custom\wheelmenu\ammo_unload_HL.paa";
		arguments = "((vehicle player weaponsTurret[0,0]) select 0)";
		function = "vn_mf_fnc_vehicle_removeTurretAmmo";
		spawn = 0;
	};
	

	class AirPylonRearm : base_action
	{
		visible = "ALWAYS";
		condition = "((cursorObject isKindOf 'Air') && !(cursorObject isKindOf 'helicopter') && !((cursorObject weaponsTurret[0]) isEqualTo []) && (!isNil {cursorObject weaponsTurret[0]}) && (!isNil {(cursorObject weaponsTurret[0]) select 0}) && (player getUnitTrait 'Engineer'))";
		text = "Load Bombs";
		icon = "custom\wheelmenu\ammo_reload.paa";
		icon_highlighted = "custom\wheelmenu\ammo_reload_HL.paa";
		arguments = "((cursorObject weaponsTurret[0]) select 0)";
		function = "vn_mf_fnc_vehicle_checkTurretAmmo";
		spawn = 0;
	};
};