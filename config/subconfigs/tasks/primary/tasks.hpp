class capture_zone : task
{
	taskcategory = "PRI";
	tasktitle = "Capture %1";
	taskname = "Capture %1";
	taskdesc = "Defeat hostile forces in %1, and destroy their HQ's equipment stockpiles.";
	tasktype = "attack";
	taskimage = "vn\missions_f_vietnam\data\img\mikeforce\p\vn_ui_mf_task_p1.jpg";
	rankpoints = 30;

	taskScript = "vn_mf_fnc_state_machine_task_system";

	//Data for the script to use to customise behaviour
	class parameters 
	{
		stateMachineCode = "vn_mf_fnc_task_pri_capture";
		timeout = -1;
	};

	//Data for subtasks. These are specific to the script.
	class kill_enemy
	{
		taskname = "Weaken Enemy Garrison";
		taskdesc = "Weaken the enemy garrison found in the zone.";
	};

	class destroy_sites
	{
		taskname = "Destroy Sites";
		taskdesc = "Destroy all HQs, AA, Arty sites as well as Vehicles and Helicopoters within 1200m.";
	};

	class destroy_enemy_supplies
	{
		taskname = "Destroy Enemy Supplies";
		taskdesc = "Destroy the supplies found at the enemy HQ. Explosives are recommended.";
	};
};

class build_cop : task
{
	taskcategory = "PRI";
	tasktitle = "Build COP";
	taskname = "Build COP";
	taskdesc = "Build a COP to begin claiming zones within 2000m of it.";
	taskformatdata = "[mf_s_copZoneUnlockDistance]";
	tasktype = "repair";
	taskimage = "vn\missions_f_vietnam\data\img\mikeforce\p\vn_ui_mf_task_p1.jpg";
	rankpoints = 10;

	taskScript = "vn_mf_fnc_state_machine_task_system";

	//Data for the script to use to customise behaviour
	class parameters 
	{
		stateMachineCode = "vn_mf_fnc_task_pri_build_cop";
		timeout = -1;
	};

	//Data for subtasks. These are specific to the script.
	class build
	{
		taskname = "Build an Outpost";
		taskdesc = "Construct a COP to advance Mike Force into the AO.";
	};
};

class build_fob : task
{
	taskcategory = "PRI";
	tasktitle = "Build FOB";
	taskname = "Build FOB";
	taskdesc = "Build a FOB to establish CONTROL within 1000m radius from zone center";
	taskformatdata = "[mf_s_baseZoneUnlockDistance]";
	tasktype = "repair";
	taskimage = "vn\missions_f_vietnam\data\img\mikeforce\p\vn_ui_mf_task_p1.jpg";
	rankpoints = 10;

	taskScript = "vn_mf_fnc_state_machine_task_system";

	//Data for the script to use to customise behaviour
	class parameters 
	{
		stateMachineCode = "vn_mf_fnc_task_pri_build_fob";
		timeout = -1;
	};

	//Data for subtasks. These are specific to the script.
	class build
	{
		taskname = "Build an HQ";
		taskdesc = "Construct an HQ building to establish control.";
	};
};

class place_flag : task
{
	taskcategory = "PRI";
	tasktitle = "Place MACV-SOG Flag";
	taskname = "Place MACV-SOG Flag";
	taskdesc = "Place the flagpole and raise the MACV-SOG flag within the FOB to show CONTROL.";
	tasktype = "repair";
	taskimage = "vn\missions_f_vietnam\data\img\mikeforce\p\vn_ui_mf_task_p1.jpg";
	rankpoints = 10;

	taskScript = "vn_mf_fnc_state_machine_task_system";

	//Data for the script to use to customise behaviour
	class parameters 
	{
		stateMachineCode = "vn_mf_fnc_task_pri_place_flag";
		timeout = -1;
	};

	//Data for subtasks. These are specific to the script.
	class build
	{
		taskname = "Place MACV-SOG Flag";
		taskdesc = "Build the flagpole and get Mike Force to raise the flag";
	};
};

class hold_zone : task
{
	taskcategory = "PRI";
	tasktitle = "Hold %1";
	taskname = "Hold %1";
	taskdesc = "Keep Control of %1, and fend off the reinforcements.";
	tasktype = "attack";
	taskimage = "vn\missions_f_vietnam\data\img\mikeforce\p\vn_ui_mf_task_p1.jpg";
	rankpoints = 30;

	taskScript = "vn_mf_fnc_state_machine_task_system";

	//Data for the script to use to customise behaviour
	class parameters 
	{
		stateMachineCode = "vn_mf_fnc_task_pri_hold";
		timeout = -1;
	};

	//Data for subtasks. These are specific to the script.
	class kill_enemy
	{
		taskname = "Hold off Enemy Attack";
		taskdesc = "Hold off VC Reinforcements in the zone.";
	};
};

class recapture_zone : task
{
	taskcategory = "PRI";
	tasktitle = "Recapture %1";
	taskname = "Recapture %1";
	taskdesc = "Defeat Mike Force in %1, and lower the MACV-SOG Flag.";
	tasktype = "attack";
	taskgroups[] = {"DacCong"};
	taskimage = "vn\missions_f_vietnam\data\img\mikeforce\p\vn_ui_mf_task_p1.jpg";
	rankpoints = 30;

	taskScript = "vn_mf_fnc_state_machine_task_system";

	//Data for the script to use to customise behaviour
	class parameters 
	{
		stateMachineCode = "vn_mf_fnc_task_pri_recapture";
		timeout = -1;
	};

	//Data for subtasks. These are specific to the script.
	class recapture_zone
	{
		taskname = "Take Back The Zone";
		taskdesc = "Weaken the GI Forces and raise your flag!";
	};
};