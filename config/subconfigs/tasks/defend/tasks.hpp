class defend_counterattack : task
{
	taskcategory = "PRI";
	tasktitle = "Defend from Counterattack";
	taskname = "Defend from Counterattack";
	taskdesc = "The enemy is preparing a counterattack, hold the zone at all costs.";
	tasktype = "defend";
	taskimage = "vn\missions_f_vietnam\data\img\mikeforce\s\vn_ui_mf_task_mf3.jpg";
	rankpoints = 50;
	taskprogress = 10;

	//The script called when the task is created.
	taskScript = "vn_mf_fnc_state_machine_task_system";

	//Data for the script to use to customise behaviour
	class parameters 
	{
		stateMachineCode = "vn_mf_fnc_task_defend_counterattack";
		timeout = -1;
	};

	class prepare_zone 
	{
		taskname = "Prepare for Attack";
		taskdesc = "The enemy will launch their attack soon. Set up defenses.";
	};

	class defend_zone
	{
		taskname = "Defend the Zone";
		taskdesc = "Defend the zone until all hostiles have been eliminated.";
	};
};

class defend_cop : task
{
	taskcategory = "PRI";
	tasktitle = "Defend COP from Attack";
	taskname = "Defend COP from Attack";
	taskdesc = "The enemy is preparing to attack the COP. Prepare to defend it!";
	tasktype = "defend";
	taskimage = "vn\missions_f_vietnam\data\img\mikeforce\s\vn_ui_mf_task_mf3.jpg";
	rankpoints = 25;
	taskprogress = 10;

	//The script called when the task is created.
	taskScript = "vn_mf_fnc_state_machine_task_system";

	//Data for the script to use to customise behaviour
	class parameters 
	{
		stateMachineCode = "vn_mf_fnc_task_defend_cop";
		timeout = -1;
	};

	class prepare_cop 
	{
		taskname = "Prepare for Attack";
		taskdesc = "The enemy will launch their attack soon. Set up defenses.";
	};

	class defend_cop
	{
		taskname = "Defend the COP";
		taskdesc = "Defend the COP until all hostiles have been eliminated.";
	};
};

class defend_base : task
{
	taskcategory = "PRI";
	tasktitle = "Defend FOB from Attack";
	taskname = "Defend FOB from Attack";
	taskdesc = "The enemy is preparing to attack an FOB. Prepare to defend it!";
	tasktype = "defend";
	taskimage = "vn\missions_f_vietnam\data\img\mikeforce\s\vn_ui_mf_task_mf3.jpg";
	rankpoints = 25;
	taskprogress = 10;

	//The script called when the task is created.
	taskScript = "vn_mf_fnc_state_machine_task_system";

	//Data for the script to use to customise behaviour
	class parameters 
	{
		stateMachineCode = "vn_mf_fnc_task_defend_base";
		timeout = -1;
	};

	class prepare_base 
	{
		taskname = "Prepare for Attack";
		taskdesc = "The enemy will launch their attack soon. Set up defenses.";
	};

	class defend_base
	{
		taskname = "Defend the FOB";
		taskdesc = "Defend the FOB until all hostiles have been eliminated.";
	};
};

class defend_hq : task
{
	taskcategory = "PRI";
	tasktitle = "Defend HQ from Attack";
	taskname = "Defend HQ from Attack";
	taskdesc = "The enemy is preparing to attack the HQ. Prepare to defend it!";
	tasktype = "defend";
	taskimage = "vn\missions_f_vietnam\data\img\mikeforce\s\vn_ui_mf_task_mf3.jpg";
	taskgroups[] = {"DacCong"};
	rankpoints = 25;

	//The script called when the task is created.
	taskScript = "vn_mf_fnc_state_machine_task_system";

	//Data for the script to use to customise behaviour
	class parameters 
	{
		stateMachineCode = "vn_mf_fnc_task_defend_hq";
		timeout = -1;
	};

	class prepare_hq 
	{
		taskname = "Prepare for Attack";
		taskdesc = "The enemy will launch their attack soon. Set up defenses.";
	};

	class defend_hq
	{
		taskname = "Defend the HQ";
		taskdesc = "Defend the HQ for as long as possible, keep Mike Force busy";
	};
};

class defend_sites : task
{
	taskcategory = "PRI";
	tasktitle = "Defend Sites from Attack";
	taskname = "Defend Sites from Attack";
	taskdesc = "The enemy is preparing to destroy our camps and tunnels, AA's and Arty's. Prepare to defend it!";
	tasktype = "defend";
	taskimage = "vn\missions_f_vietnam\data\img\mikeforce\s\vn_ui_mf_task_mf3.jpg";
	taskgroups[] = {"DacCong"};
	rankpoints = 25;

	//The script called when the task is created.
	taskScript = "vn_mf_fnc_state_machine_task_system";

	//Data for the script to use to customise behaviour
	class parameters 
	{
		stateMachineCode = "vn_mf_fnc_task_defend_sites";
		timeout = -1;
	};

	class prepare_sites 
	{
		taskname = "Prepare for Attack";
		taskdesc = "The enemy will launch their attack soon. Set up defenses.";
	};

	class defend_sites
	{
		taskname = "Defend the Sites";
		taskdesc = "Defend the Sites for as long as possible, keep Mike Force busy";
	};
};
