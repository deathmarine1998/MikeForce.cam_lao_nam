class players
{
	publicvars[] = {"vn_mf_db_player_group","vn_mf_db_friends"};
	blacklisted[] = {};
	stats[] = {"player_group","rank","serial","hunger","thirst","attributes","deaths","suicides","friendlyfire","murders","kills","vehiclekills","tankkills","boatkills","chopperkills","atoakills","destruction","deforestation","hunting","hqdestroyed","revives","zonesentered","zonescaptured","taskscomplete","teamtaskscomplete","supplytaskscomplete","supporttaskscomplete","awards","friends"};
	statsdefault[] = {"MikeForce",0,"0",1,1,{},0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,{-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1},{}};
	awards[] = {"purple_heart","rvn_wound_medal","distinguished_service_cross","vietnam_gallantry_cross","rvn_defense_medal","combat_infantryman_badge","bronze_star","silver_star","air_medal","distinguished_service_order","congressional_medalofhonor","air_cross_of_gallantry","vietnam_tet_campaign_commemorative_medal","rvn_special_service_medal","national_defense_service_medal","distinguished_flying_cross","army_commendation_medal","air_force_good_conduct_medal","air_force_cross","special_operations_medal","army_presidential_unit_citation","usaf_outstanding_unit_award","meritorious_unit_citation","meritorious_service_medal","joint_service_commendation_medal","legion_of_merit","vietnam_service_medal","republic_of_vietnam_campaign_medal","gulf_of_tonkin_vietnam_commemorative_medal","navy_cross","rvn_training_service_medal","rvn_technical_service_medal","rvn_military_merit_first_republic_medal","rvn_civil_action_unit_citation"};
};
class buildables
{
	publicvars[] = {"para_g_building"};
	blacklisted[] = {};
};
class tracking
{
	class vn_mf_db_hunger
	{
		script = "vn_mf_fnc_ui_update";
	};
	class vn_mf_db_thirst : vn_mf_db_hunger {};
	class vn_mf_db_rank
	{
		script = "vn_mf_fnc_player_rank_up";
	};
};
