class units_cup
{
	units_officer_name = "vc_local_officers";
	
	units_vc_patrol[] = {"VSentry","VFireTeam","SSpetnaz","ESentry","EFireTeam"};
	units_daccong_patrol[] = {"ESentry","VSentry"};
	units_default_patrol[] = {"VSentry","VFireTeam","EFireTeam"};

	units_vc_standard[] = {"VRifleSquad", "VFireTeam", "VAssaultTeam", "VAntiArmourTeam", "ERifleSquad", "EFireTeam", "EAssaultTeam", "EAntiArmourTeam" ,"SSpetnaz"};
	units_daccong_standard[] = {"VRifleSquad", "VFireTeam", "VAssaultTeam", "VAntiArmourTeam", "ERifleSquad", "EFireTeam", "EAssaultTeam", "EAntiArmourTeam", "SSpetnaz"};
	units_default_standard[] = {"VRifleSquad", "VFireTeam", "VAssaultTeam", "VAntiArmourTeam", "ERifleSquad", "EFireTeam", "EAssaultTeam", "EAntiArmourTeam","SSpetnaz"};
	class west
	{
		//CUP
		//US SF 
		
		Operator_1 = "CUP_B_US_SpecOps";
		Operator_2 = "CUP_B_US_SpecOps_Assault";
		Operator_3 = "CUP_B_US_SpecOps_M14";
		Uavcontroller_1 = "CUP_B_US_SpecOps_UAV";
		Teamleader_1 = "CUP_B_US_SpecOps_TL";
		Medic_1 = "CUP_B_US_SpecOps_Medic";
		MachineGunner_1 = "CUP_B_US_SpecOps_MG";
		Autorifleman_1 = "CUP_B_US_SpecOps_AR";
		Marksman_1 = "CUP_B_US_SpecOps_M";
		ForwardAC_1 = "CUP_B_US_SpecOps_JTAC";
		
		Operator[] = {"Operator_1","Operator_2","Operator_3"};

		
	};

	class east
	{
		//Cup
		
		//Russian EMR
		ERifleman_1 = "CUP_O_RU_Soldier_LAT_EMR";
		ERifleman_2 = "CUP_O_RU_Soldier_AT_EMR";
		ERifleman_3 = "CUP_O_RU_Soldier_EMR";
		ERifleman_4 = "CUP_O_RU_Soldier_Saiga_EMR";
		EGrenadier_1 = "CUP_O_RU_Soldier_GL_EMR";
		ESquadLeader_1 = "CUP_O_RU_Soldier_SL_EMR";
		ETeamleader_1 = "CUP_O_RU_Soldier_TL_EMR";
		EOfficer_1 = "CUP_O_RU_Officer_EMR";
		EMachineGunner_1 = "CUP_O_RU_Soldier_MG_EMR";
		EAutorifleman_1 = "CUP_O_RU_Soldier_AR_EMR";
		EAntitank_1 = "CUP_O_RU_Soldier_HAT_EMR";
		EAntiair_1 = "CUP_O_RU_Soldier_AA_EMR";
		ESniper_1 = "CUP_O_RU_Sniper_EMR";
		ESniper_2 = "CUP_O_RU_Sniper_KSVK_EMR";
		ESpotter_1 = "CUP_O_RU_Spotter_EMR";
		EMarksman_1 = "CUP_O_RU_Soldier_Marksman_EMR";
		EMedic_1 = "CUP_O_RU_Medic_EMR";
		EEngineer_1 = "CUP_O_RU_Engineer_EMR";
		EEngineer_2 = "CUP_O_RU_Explosive_Specialist_EMR";
		
		ERifleman[] ={"ERifleman_1","ERifleman_2","ERifleman_3","ERifleman_4"};
		ESniper[] ={"ESniper_1","ESniper_2"};
		EAntiVeh[] ={"EAntiair_1","EAntitank_1"};
		ELeader[] ={"ETeamleader_1","ESquadLeader_1","EOfficer_1"};
		EEngineer[] ={"EEngineer_1","EEngineer_2"};
		
		//Russian VDV
		VRifleman_1 = "CUP_O_RU_Soldier";
		VRifleman_2 = "CUP_O_RU_Soldier_Saiga";
		VRifleman_3 = "CUP_O_RU_Soldier_LAT";
		VRifleman_4 = "CUP_O_RU_Soldier_AT";
		VGrenadier_1 = "CUP_O_RU_Soldier_GL";
		VSquadLeader_1 = "CUP_O_RU_Soldier_SL";
		VTeamleader_1 = "CUP_O_RU_Soldier_TL";
		VOfficer_1 = "CUP_O_RU_Officer";
		VMachineGunner_1 = "CUP_O_RU_Soldier_MG"; 
		VAutorifleman_1 = "CUP_O_RU_Soldier_AR";
		VAntitank_1 = "CUP_O_RU_Soldier_HAT";
		VAntiair_1 = "CUP_O_RU_Soldier_AA";
		VSniper_1 = "CUP_O_RU_Sniper";
		VSniper_2 = "CUP_O_RU_Sniper_KSVK";
		VSpotter_1 = "CUP_O_RU_Spotter";
		VMarksman_1 = "CUP_O_RU_Soldier_Marksman";
		VMedic_1 = "CUP_O_RU_Medic";
		VEngineer_1 = "CUP_O_RU_Engineer";
		VEngineer_2 = "CUP_O_RU_Explosive_Specialist";
		
		VRifleman[] ={"VRifleman_1","VRifleman_2","VRifleman_3","VRifleman_4"};
		VSniper[] ={"VSniper_1","VSniper_2"};
		VAntiVeh[] ={"VAntiair_1","VAntitank_1"};
		VLeader[] ={"VTeamleader_1","VSquadLeader_1","VOfficer_1"};
		VEngineer[] ={"VEngineer_1","VEngineer_2"};
		
		//Spetnaz
		SOperator_1 = "CUP_O_RUS_SpecOps_Night";
		SOperator_2 = "CUP_O_RUS_SpecOps";
		SOperator_3 = "CUP_O_RUS_SpecOps_SD";
		SScout_1 ="CUP_O_RUS_SpecOps_Scout_Night";
		SScout_2 = "CUP_O_RUS_SpecOps_Scout";
		SSaboteur_1 = "CUP_O_RUS_Saboteur"; 
		SAssault_1 = "CUP_O_RUS_Soldier_GL";
		STeamLeader_1 = "CUP_O_RUS_Soldier_TL";
		SCommander_1 = "CUP_O_RUS_Commander";
		SMarksman_1 = "CUP_O_RUS_Soldier_Marksman";
		
		SOperator[] = {"SOperator_1","SOperator_2","SOperator_3"};
		SScout[] = {"SScout_1","SScout_2"};
		SLeader[] = {"STeamLeader_1","SCommander_1"};
		
		
	};

	class guer
	{
		
	};
};

class squad_compositions_cup
{
	class west 
	{
		//CUP 
		//US SF
		patrol[] = {
			"Teamleader_1",
			"Operator",
			"medic_1",
			"Autorifleman_1",
		};
		
		Standard[] = {
			"Teamleader_1",
			"Operator",
			"medic_1",
			"Uavcontroller_1",
			"Autorifleman_1",
			"ForwardAC_1"
		};
		
		
	};

	class east
	{	
		//EMR 
		ESniperTeam[] = {
			"ESpotter_1",
			"ESniper"
		};
		
		ESentry[] = {
			"ERifleman",
			"EGrenadier_1"
		};
		
		ERifleSquad[] = {
			"ELeader",
			"ERifleman",
			"ERifleman",
			"EAntiVeh",
			"EMarksman_1",
			"EGrenadier_1",
			"EGrenadier_1",
			"EAutorifleman_1",
			"EMachineGunner_1",
			"EMachineGunner_1",
			{"ERifleman","EMedic_1"},
			{"ERifleman","EMedic_1"}
		};
		
		EFireTeam[] = {
			"ELeader",
			"EAutorifleman_1",
			"EGrenadier_1",
			"ERifleman",
			{"ERifleman","EMedic_1"}
		};
		
		EAssaultTeam[] = {
			"ELeader",
			"EGrenadier_1",
			"EMachineGunner_1",
			"EMachineGunner_1",
			{"ERifleman","EMedic_1"}
		};
		
		EAntiArmourTeam[] = {
			"ELeader",
			"EAntitank_1",
			"EAntitank_1",
			{"ERifleman","EMedic_1"},
			{"ERifleman","EMedic_1"}
			
		
		};
		
		
		EAirDefenseTeam[] = {
			"ELeader",
			"EAntiair_1",
			"EAntiair_1",
			"ERifleman",
			"EMedic_1"
		};
		
		//VDV
		VSniperTeam[] = {
			"VSpotter_1",
			"VSniper"
		};
		
		VSentry[] = {
			"VRifleman",
			"VGrenadier_1"
		};
		
		VRifleSquad[] = {
			"VLeader",
			"VRifleman",
			"VRifleman",
			"VAntiVeh",
			"VMarksman_1",
			"VGrenadier_1",
			"VGrenadier_1",
			"VAutorifleman_1",
			"VMachineGunner_1",
			"VMachineGunner_1",
			"VMedic_1",
			"VRifleman"
		};
		
		VFireTeam[] = {
			"VLeader",
			"VAutorifleman_1",
			"VGrenadier_1",
			"VRifleman",
			"VMedic_1"
		};
		
		VAssaultTeam[] = {
			"VLeader",
			"VGrenadier_1",
			"VMachineGunner_1",
			"VMachineGunner_1",
			"VMedic_1"
		};
		
		VAntiArmourTeam[] = {
			"VLeader",
			"VAntitank_1",
			"VAntitank_1",
			"VRifleman",
			"VMedic_1"
			
		
		};
		/*broken
		VAirDefenseTeam[] = {
			"VLeader",
			"VAntiair_1",
			"VAntiair_1",
			"VRifleman",
			"VMedic_1"
			
		};
		*/
		//Spetnaz
		
		SSpetnaz[] = {
			"SLeader",
			"SOperator",
			"SMarksman_1",
			"SScout",
			"SSaboteur_1",
			"SAssault_1"
			
		};
		
	};	

	class guer
	{
	};
};