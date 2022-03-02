class CfgFunctions
{
	#include "..\paradigm\client\functions.hpp"
	#include "..\paradigm\server\functions.hpp"

	class vn_mf
	{
		class init
		{
			class pre_init
			{
				preinit = 1;
			};
			class post_init
			{
				postinit = 1;
			};
			class adv_revive_params {};
		};
		class client
		{
			class admin_arsenal {};
			class debug_monitor {};
			class apply_unit_traits {};
			class enable_debug_monitor {};
			class enable_task_roster {};
			class enable_keydown_escape {};
			class task_client_on_task_completed {};
			class task_client_on_task_created {};
			class update_loading_screen {};
			class display_location_time {};
			class health_effects {};
			class earplugs {};
			class training {};
			class client_teleport {};
			class client_request_supplies {};
			class player_award {};
			class consume {};
			class goto_prisoner_of_war {};
			class macv_delete_vehicle {};
			class macv_recover_wreck {};
			class macv_delete_fob {};
			class presscorp_spectate {};
			class presscorp_getDressed {};
			class daccong_move_out_ai_crew {};
			class daccong_take_mf_pow {};
			class daccong_become_pow {};
			class daccong_group_up_ai {};
			class daccong_red_suicide {};
			class daccong_raise_flag {};
			class daccong_lower_flag {};
			class holster_weapon {};
			class greenhornets_enable_copilot {};
			class advsling_releshy_cargo {};
			class mikeforce_become_pow {};
			class mikeforce_take_dc_pow {};
			class mikeforce_raise_flag {};
			class mikeforce_lower_flag {};
			class custom_chat_update {};
			class escape_menu {};
			class attach_chemlight {};
			class take_selfie {};
			class client_request_drinks {};
			class destroy_tunnel {};
			class destroy_camp {};
			class destroy_respawn {};
			class destroy_radio {};
			class destroy_tunnel_watersupply {};
			class gather_intel {};
			class deactivate_mine {};
			class control_mine {};
			class militarypolice_toggleSiren {};
			class macv_grief_bentham {};
			class muskets_bentham_creama {};
			class vehicle_checkDriverAmmo{};
			class vehicle_checkTurretAmmo{};
			class vehicle_removeDriverAmmo{};
			class vehicle_removeTurretAmmo{};
			class play_possum {};
			class play_dance_move {}; 
			class weapon_melee {};
		};
		class helpers
		{
			class init_mission_handlers {};
			class units_on_team {};
			class zone_marker_to_name {};
		};
		class rehandler
		{
			class supporttaskcreate {};
			class changeteam {};
			class eatdrink {};
			class teleport {};
			class supplyrequest {};
			class settrait {};
			class setlocaleh {};
			class packageforslingloading {};
		};

		class game
		{
			// client
			class action_drink_water {};
			class action_eat_food {};
			class action_supplies {};
			class action_drinks {};
			class action_teleport {};
			class action_trait {};
			class armor_calc {};
			class ui_sub_menu {};
			class ammo_repack {};
			class ammo_remove {};
			class unit_to_rank {};
			class player_rank_up {};
			class ui_create {};
			class ui_update {};
			class unit_next_rank {};
			class points_to_next_rank {};
			class action_load_actions {};
			class action_destroy_camp {};
			class action_destroy_respawn {};
			class action_destroy_tunnel {};
			class action_destroy_radio {};
			class action_destroy_tunnel_watersupply {};
			class action_gather_intel {};
			class action_control_mine {};
			class action_deactivate_mine {};

			// both
			class get_gamemode_value {};
			class check_enemy_units_alive {};
			class progress_to_color_config {};
			class player_can_enter_vehicle {};

			// server
			class lock_vehicle_to_teams {};
			class force_team_change {};
			class group_init {};
			class marker_init {};
			class respawn_points_init {};
			class player_on_team {};
			class player_health_stats {};
			class player_within_radius {};
			class save_time_elapsed {};
			class override_crate_contents {};

			// stats
			class change_player_stat {};
			class stats_init {};

			//Tasks
			class task_complete {};
			class task_create {};
			class task_is_completed {};
			class task_refresh_tasks_client {};
			class task_subtask_complete {};
			class task_subtask_create {};
			class task_update_clients {};


			//Zones
			class zone_create_assets_for_completed_zone {};
		};

		class mods
		{
			class init_comms {};
		};

		class paradigm_interop
		{
			class get_squad_composition {};
			class harass_filter_target_players {};
			class harass_get_enemy_side {};
			class valid_attack_angles {};
		};

		class server
		{
			class end_mission {};
		};

		class tasks
		{
			class create_support_default { file = "functions\tasks\task_creation\fn_create_support_default.sqf"; };

			class simple_task_system { file = "functions\tasks\fn_simple_task_system.sqf"; };
			class state_machine_task_system { file = "functions\tasks\fn_state_machine_task_system.sqf"; };

			class task_defend_counterattack { file = "functions\tasks\defend\fn_task_defend_counterattack.sqf";};
			class task_defend_base { file = "functions\tasks\defend\fn_task_defend_base.sqf";};
			class task_defend_cop { file = "functions\tasks\defend\fn_task_defend_cop.sqf";};

			class task_destroy_aa_site { file = "functions\tasks\destroy\fn_task_destroy_aa_site.sqf";};
			class task_destroy_artillery_site { file = "functions\tasks\destroy\fn_task_destroy_artillery_site.sqf";};
			class task_destroy_camp { file = "functions\tasks\destroy\fn_task_destroy_camp.sqf";};
			class task_destroy_tunnel { file = "functions\tasks\destroy\fn_task_destroy_tunnel.sqf";};
			class task_destroy_tunnel_watersupply { file = "functions\tasks\destroy\fn_task_destroy_tunnel_watersupply.sqf";};

			class task_pri_build_fob { file = "functions\tasks\primary\fn_task_pri_build_fob.sqf"; };
			class task_pri_build_cop { file = "functions\tasks\primary\fn_task_pri_build_cop.sqf"; };
			class task_pri_capture { file = "functions\tasks\primary\fn_task_pri_capture.sqf"; };
			class task_pri_hold { file = "functions\tasks\primary\fn_task_pri_hold.sqf"; };
			class task_pri_place_flag { file = "functions\tasks\primary\fn_task_pri_place_flag.sqf"; };

			class task_sec_spike_wiretap { file = "functions\tasks\secondary\fn_task_sec_spike_wiretap.sqf";};
			class task_sec_kill_officer { file = "functions\tasks\secondary\fn_task_sec_kill_officer.sqf";};
			
			class task_sup_brightlight { file = "functions\tasks\support\fn_task_sup_brightlight.sqf"; };
			class task_sup_cas { file = "functions\tasks\support\fn_task_sup_cas.sqf"; };
			class task_sup_destroy_target { file = "functions\tasks\support\fn_task_sup_destroy_target.sqf"; };
			class task_sup_transport { file = "functions\tasks\support\fn_task_sup_transport.sqf"; };
			class task_sup_resupply { file = "functions\tasks\support\fn_task_sup_resupply.sqf";};
			class task_zone_connector { file = "functions\tasks\fn_zone_connector.sqf";};
			
			class task_defend_hq { file = "functions\tasks\defend\fn_task_defend_hq.sqf";};
			class task_defend_sites { file = "functions\tasks\defend\fn_task_defend_sites.sqf";};
			class task_pri_recapture { file = "functions\tasks\primary\fn_task_pri_recapture.sqf"; };
		};

		class Create
		{
			file = "functions\Game\Create";
			class create_aa_emplacement {};
			class create_camp_buildings {};
			class create_hq_buildings {};
			class create_mortar {};
			class create_supply_officer {};
			class spawn_object {};
			class spawn_civilian {};
			class create_bar_tender {};
			class create_tunnel_entrance {};
			class create_tunnel_watersupply {};
			class create_roaming_vehicles {};
			class create_roaming_helicopters {};
		};

		///////////////////////////
		//  Subsystem functions  //
		///////////////////////////

		//Gameplay director, responsible for main game progression and flow.
		class Director
		{
			file = "functions\Game\Subsystems\Director";
			class director_init {};
			class director_job {};
			class director_check_mission_end {};
			class director_open_connected_zones {};
			class director_open_zone {};
			class director_zones_in_range_of_bases {};
			class director_zones_in_range_of_outposts {};
		};

		class Inventory
		{
			file = "functions\Game\Subsystems\Inventory";
			class player_check_for_non_arsenal_init {};
			class player_check_for_non_arsenal {};
		};
		
		class Player_Markers
		{
			file = "functions\Game\Subsystems\Player_Markers";
			class player_markers_job {};
			class player_markers_subsystem_init {};
			class player_markers_update_positions {};
		};

		class Sites
		{
			file = "functions\Game\Subsystems\Sites";
			class sites_attempt_teardown {};
			class sites_create_site {};
			class sites_generate {};
			class sites_init {};
			class sites_load {};
			class sites_teardown_site {};
			
			//Specific types of site
			class sites_create_aa_site {};
			class sites_create_artillery_site {};
			class sites_create_hq {};
			class sites_create_camp_site {};
			class sites_create_tunnel_site {};
			class sites_create_tunnel_watersupply_site {};
			class sites_create_vehicle_site {};
			class sites_create_helicopter_site {};
			
			//Supporting functions
			class sites_aa_reveal_targets {};
		};
		
		class Stamina
		{
			file = "functions\Game\Subsystems\Stamina";
			class player_stamina_subsystem_init {};
			class player_stamina_update {};
		};
		
		class Zones
		{
			file = "functions\Game\Subsystems\Zones";
			class zones_capture_zone {};
			class zones_held_zone {};
			class zones_init {};
			class zones_load_zone {};
			class zones_manager_job {};
			class zones_save_zone {};
		};

		class Vehicle_Asset_Manager
		{
			file = "functions\Game\Subsystems\Vehicle_Asset_Manager";
			class veh_asset_add_package_action {};
			class veh_asset_add_unlock_action {};
			class veh_asset_add_vehicle {};
			class veh_asset_get_by_id {};
			class veh_asset_init_vehicle {};
			class veh_asset_key {};
			class veh_asset_job {};
			class veh_asset_lock_vehicle {};
			class veh_asset_marker_create {};
			class veh_asset_marker_delete {};
			class veh_asset_marker_update_position {};
			class veh_asset_package_wreck {};
			class veh_asset_remove_vehicle {};
			class veh_asset_respawn {};
			class veh_asset_set_active {};
			class veh_asset_set_disabled {};
			class veh_asset_set_idle {};
			class veh_asset_set_repairing {};
			class veh_asset_set_respawning {};
			class veh_asset_set_wrecked {};
			class veh_asset_subsystem_init {};
			class veh_asset_unlock_vehicle {};
			class veh_asset_respawn_job {};
		};

		class Vehicle_Creation_Detection
		{
			file = "functions\Game\Subsystems\Vehicle_Creation_Detection";
			class veh_create_detection_job {};
			class veh_create_detection_subsystem_init {};
		};

		//////////////////////////////////////////
		//UI/TASK ROSTER STUFF:
		class TaskRoster
		{
			/* TaskRoster: */
			class tr_cleanRightSheet {file = "functions\ui\taskroster\fn_tr_cleanRightSheet.sqf";};
			class tr_init {file = "functions\ui\taskroster\fn_tr_init.sqf";};
			class tr_overview_init {file = "functions\ui\taskroster\fn_tr_overview_init.sqf";};
			class tr_overview_team_update {file = "functions\ui\taskroster\fn_tr_overview_team_update.sqf";};

			/* Main Info: */
			class tr_mainInfo_show {file = "functions\ui\taskroster\fn_tr_mainInfo_show.sqf";};

			/* Mission List */
			class tr_zone_change {file = "functions\ui\taskroster\fn_tr_zone_change.sqf";};
			class tr_missions_fill {file = "functions\ui\taskroster\fn_tr_missions_fill.sqf";};
			class tr_missions_show {file = "functions\ui\taskroster\fn_tr_missions_show.sqf";};
			class tr_mission_setActive {file = "functions\ui\taskroster\fn_tr_mission_setActive.sqf";};
			class tr_listboxtask_select {file = "functions\ui\taskroster\fn_tr_listboxtask_select.sqf";};

			/* Support Task Stuff */
			class tr_supportTask_show {file = "functions\ui\taskroster\fn_tr_supportTask_show.sqf";};
			class tr_supportTask_selectTask {file = "functions\ui\taskroster\fn_tr_supportTask_selectTask.sqf";};
			class tr_supportTask_selectTeam {file = "functions\ui\taskroster\fn_tr_supportTask_selectTeam.sqf";};
			class tr_supportTask_selectPosition {file = "functions\ui\taskroster\fn_tr_supportTask_selectPosition.sqf";};
			class tr_supportTask_selectPosition_accept {file = "functions\ui\taskroster\fn_tr_supportTask_selectPosition_accept.sqf";};
			class tr_supportTask_create {file = "functions\ui\taskroster\fn_tr_supportTask_create.sqf";};
			class tr_supportTask_map_hide {file = "functions\ui\taskroster\fn_tr_supportTask_map_hide.sqf";};
			class tr_getMapPosClick {file = "functions\ui\taskroster\fn_tr_getMapPosClick.sqf";};

			/* Team selection */
			class tr_selectTeam {file = "functions\ui\taskroster\fn_tr_selectTeam.sqf";};
			class tr_selectTeam_init {file = "functions\ui\taskroster\fn_tr_selectTeam_init.sqf";};
			class tr_selectTeam_set {file = "functions\ui\taskroster\fn_tr_selectTeam_set.sqf";};

			/* CIA Phoenix Panel */
			class tr_ciaPanel {file = "functions\ui\phoenix\fn_tr_ciaPanel.sqf";};
			class tr_ciaPanel_init {file = "functions\ui\phoenix\fn_tr_ciaPanel_init.sqf";};
			
			/* Character Info */
			class tr_characterInfo_show {file = "functions\ui\taskroster\fn_tr_characterInfo_show.sqf";};
			class tr_characterInfo_ribbon_enter {file = "functions\ui\taskroster\fn_tr_characterInfo_ribbon_enter.sqf";};
			class tr_characterInfo_ribbon_exit {file = "functions\ui\taskroster\fn_tr_characterInfo_ribbon_exit.sqf";};
			class tr_characterInfo_ribbon_setIcon {file = "functions\ui\taskroster\fn_tr_characterInfo_ribbon_setIcon.sqf";};
		};


		//////////////////////////////////////////

		class TimerOverlay
		{
			file = "functions\ui\TimerOverlay";
			class timerOverlay_hideTimer {};
			class timerOverlay_setGlobalTimer {};
			class timerOverlay_setTimer {};
			class timerOverlay_showTimer {};
			class timerOverlay_removeGlobalTimer {};
			class timerOverlay_removeTimer {};
		};

		class zone_marker
		{
			file = "functions\ui\zone_marker";
			class zone_marker_captured_zone_info {};
			class zone_marker_hostile_zone_info {};
		};

		class DisplayExample
		{
			file = "functions\ui\Example";
			class vn_mf_RscDisplayExample;
		};
	};
};