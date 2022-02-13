class CfgNotifications 
{
	#include "..\paradigm\Client\configs\notifications.hpp"

	class BaseAttackImminent
	{
		title = $STR_vn_mf_notification_title_base_attack;
		description = $STR_vn_mf_notification_desc_base_attack_imminent;
		priority = 7;
		color[] = {0.8,0.06,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};

	class BaseAttackPreparing
	{
		title = $STR_vn_mf_notification_title_base_attack;
		description = $STR_vn_mf_notification_desc_base_attack_preparing;
		priority = 7;
		color[] = {0.8,0.5,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class CopAttackImminent
	{
		title = $STR_vn_mf_notification_title_cop_attack;
		description = $STR_vn_mf_notification_desc_cop_attack_imminent;
		priority = 7;
		color[] = {0.8,0.06,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};

	class CopAttackPreparing
	{
		title = $STR_vn_mf_notification_title_cop_attack;
		description = $STR_vn_mf_notification_desc_cop_attack_preparing;
		priority = 7;
		color[] = {0.8,0.5,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class CounterAttackImminent
	{
		title = $STR_vn_mf_notification_title_counter_attack;
		description = $STR_vn_mf_notification_desc_counter_attack_imminent;
		priority = 7;
		color[] = {0.8,0.06,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};

	class CounterAttackPreparing
	{
		title = $STR_vn_mf_notification_title_counter_attack;
		description = $STR_vn_mf_notification_desc_counter_attack_preparing;
		priority = 7;
		color[] = {0.8,0.5,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};

	class CounterAttackShortened
	{
		title = $STR_vn_mf_notification_title_counter_attack;
		description = $STR_vn_mf_notification_desc_counter_attack_shortened;
		priority = 7;
		color[] = {0.8,0.5,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};

	class NewSupportRequest 
	{
		title = $STR_vn_mf_notification_title_new_support_request;
		description = "%2";
		priority = 6;
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_ca.paa";
	};

	class Support_Transport_AllOnboard
	{
		title = $STR_vn_mf_notification_title_support_transport;
		description = $STR_vn_mf_notification_desc_support_transport_all_onboard;
		priority = 8;

		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};

	class Support_Transport_Complete 
	{
		title = $STR_vn_mf_notification_title_support_transport;
		description = $STR_vn_mf_notification_desc_support_transport_complete;
		priority = 8;
		color[] = {0.7,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};

	class Support_Transport_PlayersDead
	{
		title = $STR_vn_mf_notification_title_support_transport;
		description = $STR_vn_mf_notification_desc_support_transport_players_dead;
		priority = 8;

		color[] = {1,0.3,0.2,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
	};

	class Support_Transport_TooClose
	{
		title = $STR_vn_mf_notification_title_support_transport;
		description = $STR_vn_mf_notification_desc_support_transport_too_close;
		priority = 8;
		color[] = {1,0.3,0.2,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
	};

	class Support_Transport_WrongLocation
	{
		title = $STR_vn_mf_notification_title_support_transport;
		description = $STR_vn_mf_notification_desc_support_transport_wrong_location;
		priority = 8;

		color[] = {1,0.3,0.2,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
	};

	class TrainingSucceeded 
	{
		title = $STR_vn_mf_notification_title_training;
		description = $STR_vn_mf_trainingcomplete;
		priority = 8;
		color[] = {0.7,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};

	class TrainingFailedOneTraitPerTeam 
	{
		title = $STR_vn_mf_notification_title_training;
		description = $STR_vn_mf_onetraitperteam;
		priority = 8;

		color[] = {1,0.3,0.2,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
	};

	class TrainingFailedOneTraitPerPlayer 
	{
		title = $STR_vn_mf_notification_title_training;
		description = $STR_vn_mf_onetraitperplayer;
		priority = 8;

		color[] = {1,0.3,0.2,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
	};
	
	class TrainingFailedAlreadyTrained
	{
		title = $STR_vn_mf_notification_title_training;
		description = "%1";
		priority = 8;
		color[] = {0.7,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};
	
	class VehicleLockedToTeam 
	{
		title = $STR_vn_mf_notification_title_vehicle_locked;
		description = $STR_vn_mf_vehicle_locked_to_team;
		priority = 8;
		color[] = {1,0.3,0.2,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
	};
	
	class VehicleLockedToRank 
	{
		title = $STR_vn_mf_notification_title_vehicle_locked;
		description = "%1";
		priority = 8;
		color[] = {1,0.3,0.2,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
	};

	class ZoneCompleted 
	{
		title = $STR_vn_mf_notification_title_zone_completed;
		description = "%1";
		priority = 8;
		color[] = {0.7,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};
	
	class EmptyFoodItem
	{
		title = $STR_vn_mf_notification_title_empty_food_item;
		description = $STR_vn_mf_notification_desc_empty_food_item;
		priority = 7;
		color[] = {0.8,0.5,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class FriendlyFire 
	{
		title = $STR_vn_mf_notification_title_friendly_fire;
		description = "%1";
		priority = 8;
		color[] = {0.75,0.5,0.4,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class DacCongPOW 
	{
		title = $STR_vn_mf_notification_title_captured_gi;
		description = "%1";
		priority = 8;
		color[] = {1,0.3,0.2,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
	};
	
	class MikeForcePOW 
	{
		title = $STR_vn_mf_notification_title_captured_gi;
		description = "%1";
		priority = 8;
		color[] = {0.1,0.1,0.8,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
	};
	
	class Tunnels 
	{
		title = "The Tunnels";
		description = "Welcome to the Dac Cong POW Tunnel System";
		priority = 8;
		color[] = {0.7,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};
	
	class POWFailed 
	{
		title = "Failed abduction";
		description = "The player needs to be incapacitated and not dead";
		priority = 8;
		color[] = {0.8,0.5,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class GICaptured 
	{
		title = "Prisoner of War";
		description = "You have become a Dac Cong POW...  Welcome to the tunnels";
		priority = 8;
		color[] = {0.8,0.5,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class DCCaptured
	{
		title = "Prisoner of War";
		description = "You have become a Mike Force POW...  Can you escape the GIs base?";
		priority = 8;
		color[] = {0.1,0.1,0.8,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class NoFireZone 
	{
		title = "Watch your Fire";
		description = "Do not fire your weapon near the arsenal. Use the Gun Range!";
		priority = 8;
		color[] = {0.8,0.5,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class DacCongEntered 
	{
		title = "Dac Cong Player";
		description = "Warning a Dac Cong Player is about to enter the server and wreak havoc upon Mike Force, you have been warned!";
		priority = 8;
		color[] = {0.8,0.5,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class DacCongSapper 
	{
		title = "WARNING WARNING";
		description = "Dac Cong Sapper just pulled the pin, you have been warned!";
		priority = 8;
		color[] = {0.9,0.1,0.1,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class ServerRestart 
	{
		title = "Scheduled Restart";
		description = "%1";
		priority = 8;
		color[] = {0.1,0.8,0.1,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class LogOutForRestart 
	{
		title = "Imminent Server Restart";
		description = "%1";
		priority = 8;
		color[] = {1,0,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class BroNationMsg 
	{
		title = "BroNation Server Message";
		description = "%1";
		priority = 8;
		color[] = {0.7,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};

	class VehSalvNReloadDone
	{
		title = "Veh Salvage N Reload";
		description = "%1";
		priority = 8;
		color[] = {0.3,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};

	class VehSalvNReload
	{
		title = "Veh Salvage N Reload";
		description = "%1";
		priority = 8;
		color[] = {1,0.3,0.3,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class AIGroupSuccess 
	{
		title = "Grouping Success";
		description = "%1";
		priority = 8;
		color[] = {0.7,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};
	
	class AIGroupFail 
	{
		title = "Grouping Failed";
		description = "%1";
		priority = 8;
		color[] = {1,0,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class UnlockFailed
	{
		title = "Unlock Failed";
		description = "Make sure target is centered in view";
		priority = 8;
		color[] = {1,0,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class ZoneCaptured 
	{
		title = $STR_vn_mf_notification_title_zone_completed;
		description = "%1";
		priority = 8;
		color[] = {0.7,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};
	
	class NoChemlights 
	{
		title = "No Chemlights";
		description = "Please equip at least 1 chemlight in your inventory";
		priority = 8;
		color[] = {1,0,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class NoSatchels 
	{
		title = "No Satchels";
		description = "Please equip 1-4 explosives in your inventory";
		priority = 8;
		color[] = {1,0,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class FireInTheHole
	{
		title = "Satchel Charge Set";
		description = "Get the heck outta dodge, its gonna blow!      Don't forget the HQ!";
		priority = 8;
		color[] = {1,0,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class DefendTheAORestart 
	{
		title = "Defend The AO";
		description = "%1";
		priority = 8;
		color[] = {0.1,0.8,0.1,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class DacCongCaptured
	{
		title = "DacCong Captured";
		description = "%1";
		priority = 8;
		color[] = {1,0,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};

	class MikeForceRaiseFlag 
	{
		title = "Flag has been raised!";
		description = "%1";
		priority = 8;
		color[] = {0.7,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};
	
	class MikeForceLowerFlag 
	{
		title = "Lowered Flag";
		description = "%1";
		priority = 8;
		color[] = {0.7,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};
	
	class FlagPresent
	{
		title = "Flag is Present";
		description = "You already have a flag raised. Defend your AO!";
		priority = 8;
		color[] = {0.7,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};
	
	class FlagNotPresent
	{
		title = "Not an Option";
		description = "You cannot lower this flag!";
		priority = 8;
		color[] = {0.7,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};
	
	class DacCongRaiseFlag 
	{
		title = "Flag has been raised!";
		description = "%1";
		priority = 8;
		color[] = {0.7,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};
	
	class DacCongLowerFlag 
	{
		title = "Lowered Flag";
		description = "%1";
		priority = 8;
		color[] = {0.7,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};
	
	class GatheredIntel 
	{
		title = "Check your map";
		description = "%1";
		priority = 8;
		color[] = {0.7,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};
	
	class WorthlessIntel 
	{
		title = "Worthless Intel";
		description = "The documents and radio were deemed DC propaganda by the CIA";
		priority = 8;
		color[] = {1,0,0,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class MineDeactivated
	{
		title = "Mine Deactivated";
		description = "A lethal mine was deactivate near your position";
		priority = 8;
		color[] = {0.7,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};
	
	class NotEnoughSpace
	{
		title = "Inventory";
		description = "%1";
		priority = 8;
		color[] = {1,0.3,0.3,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};
	
	class FailedAttempt
	{
		title = "Failure";
		description = "%1";
		priority = 8;
		color[] = {1,0.3,0.3,1};
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_ca.paa";
	};

	class CopBuilt 
	{
		title = "COP Built";
		description = "Outpost successfully built, get ready to defend it.";
		priority = 8;
		color[] = {0.7,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};
	class BaseBuilt 
	{
		title = "FOB Built";
		description = "Base successfully built, get ready to defend it.";
		priority = 8;
		color[] = {0.7,1,0.3,1};
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
	};
};
