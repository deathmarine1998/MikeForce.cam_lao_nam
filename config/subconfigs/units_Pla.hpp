class units_Pla
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
		
		//PlA Marines
		ERifleman_1 = "O_mas_chi_SoldierN_lite_F";
		ERifleman_2 = "O_mas_chi_SoldierN_lite_F";
		ERifleman_3 = "O_mas_chi_SoldierN_F";
		ERifleman_4 = "O_mas_chi_SoldierN_F";
		EGrenadier_1 = "O_mas_chi_SoldierN_AT2_F";
		ESquadLeader_1 = "O_mas_chi_SoldierN_SL_F";
		ETeamleader_1 = "O_mas_chi_SoldierN_TL_F";
		EOfficer_1 = "O_mas_chi_SoldierN_off_F";
		EMachineGunner_1 = "O_mas_chi_SoldierN_MG_F";
		EAutorifleman_1 = "O_mas_chi_SoldierN_AR_F";
		EAntitank_1 = "O_mas_chi_SoldierN_LAT_F";
		EAntiair_1 = "O_mas_chi_SoldierN_LAA_F";
		ESniper_1 = "O_mas_chi_Recon_Sniper_F";
		ESniper_2 = "O_mas_chi_Recon_SniperH_F";
		ESpotter_1 = "O_mas_chi_Recon_Spotter_F";
		EMarksman_1 = "O_mas_chi_SoldierN_M_F";
		EMedic_1 = "O_mas_chi_medicN_F";
		EEngineer_1 = "O_mas_chi_SoldierN_exp_F";
		EEngineer_2 = "O_mas_chi_SoldierN_repair_F";
		
		ERifleman[] ={"ERifleman_1","ERifleman_2","ERifleman_3","ERifleman_4"};
		ESniper[] ={"ESniper_1","ESniper_2"};
		EAntiVeh[] ={"EAntiair_1","EAntitank_1"};
		ELeader[] ={"ETeamleader_1","ESquadLeader_1","EOfficer_1"};
		EEngineer[] ={"EEngineer_1","EEngineer_2"};
		
		//PLA
		VRifleman_1 = "O_mas_chi_support_AMG_F";
		VRifleman_2 = "O_mas_chi_support_AMort_F";
		VRifleman_3 = "O_mas_chi_Soldier_lite_F";
		VRifleman_4 = "O_mas_chi_Soldier_F";
		VGrenadier_1 = "O_mas_chi_soldier_AT2_F";
		VSquadLeader_1 = "O_mas_chi_Soldier_SL_F";
		VTeamleader_1 = "O_mas_chi_Soldier_TL_F";
		VOfficer_1 = "O_mas_chi_Soldier_off_F";
		VMachineGunner_1 = "O_mas_chi_soldier_MG_F"; 
		VAutorifleman_1 = "O_mas_chi_soldier_AR_F";
		VAntitank_1 = "O_mas_chi_soldier_LAT_F";
		VAntiair_1 = "O_mas_chi_soldier_LAA_F";
		VSniper_1 = "O_mas_chi_Soldier_R_F";
		VSniper_2 = "O_mas_chi_Soldier_JTAC_F";
		VSpotter_1 = "O_mas_chi_Soldier_UAV_F";
		VMarksman_1 = "O_mas_chi_Soldier_M_F";
		VMedic_1 = "O_mas_chi_medic_F";
		VEngineer_1 = "O_mas_chi_soldier_repair_F";
		VEngineer_2 = "O_mas_chi_soldierN_exp_F";
		
		VRifleman[] ={"VRifleman_1","VRifleman_2","VRifleman_3","VRifleman_4"};
		VSniper[] ={"VSniper_1","VSniper_2"};
		VAntiVeh[] ={"VAntiair_1","VAntitank_1"};
		VLeader[] ={"VTeamleader_1","VSquadLeader_1","VOfficer_1"};
		VEngineer[] ={"VEngineer_1","VEngineer_2"};
		
		//Spetnaz
		SOperator_1 = "O_mas_chi_Recon_U_GL_F";
		SOperator_2 = "O_mas_chi_Recon_U_F";
		SOperator_3 = "O_mas_chi_Recon_U_Spotter_F";
		SScout_1 ="O_mas_chi_Recon_U_Sniper_F";
		SScout_2 = "O_mas_chi_Recon_U_SniperH_F";
		SSaboteur_1 = "O_mas_chi_Recon_U_exp_F"; 
		SAssault_1 = "O_mas_chi_Recon_U_AR_F";
		STeamLeader_1 = "O_mas_chi_Recon_U_TL_F";
		SCommander_1 = "O_mas_chi_Recon_U_Off_F";
		SMarksman_1 = "O_mas_chi_Recon_U_M_F";
		
		SOperator[] = {"SOperator_1","SOperator_2","SOperator_3"};
		SScout[] = {"SScout_1","SScout_2"};
		SLeader[] = {"STeamLeader_1","SCommander_1"};
		
		
	};

	class guer
	{
		
	};
};

class squad_compositions_Pla
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