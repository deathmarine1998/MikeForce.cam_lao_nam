class MedicalCrate
{
	objectClassname = "vn_b_ammobox_supply_03";
	weapons[] = {};
	magazines[] = {{"vn_prop_med_antivenom",30},
	{"vn_prop_med_wormpowder",15},
	{"vn_prop_med_dysentery",15},
	{"vn_prop_med_painkillers",30},
	{"vn_prop_med_antimalaria",15},
	{"vn_prop_med_antibiotics",30}};
	items[] = {{"vn_b_item_medikit_01",10},
	{"vn_b_item_firstaidkit",40}};
	backpacks[] = {};
};

//{"ACRE_PRC343",5},{"ACRE_PRC77",1},
class AmmoCrateLight
{
	objectClassname = "vn_b_ammobox_supply_01";
	weapons[] = {{"vn_m127",3}};
	magazines[] = {
		{"vn_m1911_mag",20},
		{"vn_mk22_mag",20},
		{"vn_m16_40_mag",15},
		{"vn_welrod_mag",20},
		{"vn_m61_grenade_mag",10},
		{"vn_m67_grenade_mag",10},
		{"vn_v40_grenade_mag",10},
		{"vn_m18_green_mag",10},
		{"vn_m18_purple_mag",10},
		{"vn_m18_red_mag",10},
		{"vn_m18_white_mag",25},
		{"vn_m18_yellow_mag",10},
		{"vn_m14_grenade_mag",5},
		{"vn_m34_grenade_mag",5},
		{"vn_m127_mag",15},
		{"vn_hd_mag",20},
		{"vn_hp_mag",20},
		{"vn_m10_mag",20},
		{"vn_m16_30_mag",60},
		{"vn_m63a_30_mag",30},
		{"vn_mp40_mag",30},
		{"vn_m16_20_mag",60},
		{"vn_carbine_15_mag",30},
		{"vn_carbine_30_mag",30},
		{"vn_m4956_10_mag",30},
		{"vn_m14_mag",30},
		{"vn_m1895_mag",20},
		{"vn_mc10_mag",30},
		{"vn_sten_mag",30},
		{"vn_m3a1_mag",30},
		{"vn_m45_mag",30},
		{"vn_m1897_buck_mag",20},
		{"vn_m1897_fl_mag",20}};
	items[] = {};
	backpacks[] = {};
};

class AmmoCrateSupport
{
	objectClassname = "vn_b_ammobox_supply_01";
	weapons[] = {
		{"vn_m79",2},
		{"vn_m127",15}
	};
	magazines[] = {
		{"vn_m60_100_mag",20},
		{"vn_rpd_100_mag",20},
		{"vn_m40a1_mag",30},
		{"vn_m127_mag",50},
		{"vn_m128_mag",20},
		{"vn_m129_mag",20},
		{"vn_m16_40_mag",15},
		{"vn_m61_grenade_mag",10},
		{"vn_m67_grenade_mag",10},
		{"vn_v40_grenade_mag",10},
		{"vn_m18_purple_mag",20},
		{"vn_m18_red_mag",20},
		{"vn_m18_white_mag",30},
		{"vn_m18_yellow_mag",20},
		{"vn_m14_grenade_mag",10},
		{"vn_m34_grenade_mag",10},
		{"vn_40mm_m651_cs_mag",20},
		{"vn_40mm_m583_flare_w_mag",40},
		{"vn_40mm_m661_flare_g_mag",20},
		{"vn_40mm_m662_flare_r_mag",20},
		{"vn_40mm_m695_flare_y_mag",20},
		{"vn_40mm_m680_smoke_w_mag",40},
		{"vn_40mm_m682_smoke_r_mag",20},
		{"vn_40mm_m715_smoke_g_mag",20},
		{"vn_40mm_m716_smoke_y_mag",20},
		{"vn_40mm_m717_smoke_p_mag",20}};
	items[] = {{"vn_b_item_trapkit",5}};
	backpacks[] = {};
};

class AmmoCrateExplosives
{
	objectClassname = "vn_b_ammobox_supply_01";
	weapons[] = {
		{"vn_m79",2},
		{"vn_m72",10},
	};
	magazines[] = {
		{"vn_m61_grenade_mag",30},
		{"vn_m67_grenade_mag",30},
		{"vn_v40_grenade_mag",30},
		{"vn_40mm_m651_cs_mag",20},
		{"vn_40mm_m381_he_mag",20},
		{"vn_40mm_m397_ab_mag",20},
		{"vn_40mm_m406_he_mag",20},
		{"vn_40mm_m433_hedp_mag",20},
		{"vn_40mm_m576_buck_mag",20},
		{"vn_40mm_m583_flare_w_mag",20},
		{"vn_40mm_m661_flare_g_mag",20},
		{"vn_40mm_m662_flare_r_mag",20},
		{"vn_40mm_m695_flare_y_mag",20},
		{"vn_40mm_m680_smoke_w_mag",20},
		{"vn_40mm_m682_smoke_r_mag",20},
		{"vn_40mm_m715_smoke_g_mag",20},
		{"vn_40mm_m716_smoke_y_mag",20},
		{"vn_40mm_m717_smoke_p_mag",20},
		{"vn_mine_m18_mag",15},
		{"vn_mine_m18_range_mag",10},
		{"vn_mine_tripwire_m49_02_mag",10},
		{"vn_mine_tripwire_m49_04_mag",10},
		{"vn_mine_tripwire_m16_02_mag",20},
		{"vn_mine_tripwire_m16_04_mag",20},
		{"vn_mine_m16_mag",20},
		{"vn_mine_m15_mag",10},
		{"vn_mine_m14_mag",40},
		{"vn_mine_m112_remote_mag",15},
		{"vn_mine_m18_x3_mag",10},
		{"vn_mine_m18_x3_range_mag",10},
		{"vn_mine_satchel_remote_02_mag",10}};
	items[] = {};
	backpacks[] = {};
};

class FoodCrate
{
	objectClassname = "vn_b_ammobox_supply_02";
	weapons[] = {};
	magazines[] = {};
	items[] = {};
	backpacks[] = {};
};

//custom crates
//Medical
class customMedical
{
		objectClassname = "Land_vn_plasticcase_01_large_idap_f";
		weapons[] = {};
		magazines[] = {};
		items[] = {
		{"ACE_elasticBandage",200},
		{"ACE_packingBandage",200},
		{"ACE_quikclot",200},
		{"ACE_fieldDressing",200},
		{"ACE_bloodIV",20},
		{"ACE_bloodIV_250",60},
		{"ACE_bloodIV_500",40},
		{"ACE_bodyBag",10},
		{"ACE_epinephrine",50},
		{"ACE_morphine",50},
		{"ACE_splint",40},
		{"ACE_tourniquet",40}};
		backpacks[] = {};
};
//


//Ammo
class CustomAmmo
{
		objectClassname = "B_CargoNet_01_ammo_F";
		weapons[] = {};
		magazines[] = {
			{"rhsusf_200rnd_556x45_M855_mixed_box",15},
			{"rhs_mag_20Rnd_SCAR_762x51_m118_special",30},
			{"rhsusf_20Rnd_762x51_m118_special_Mag",30},
			{"CUP_5Rnd_762x67_M2010_M",30},
			{"7Rnd_408_Mag",30},
			{"CUP_12Rnd_45ACP_mk23",30},
			{"11Rnd_45ACP_Mag",30},
			{"6Rnd_45ACP_Cylinder",30},
			{"rhsusf_100Rnd_762x51_m62_tracer",15},
			{"rhsusf_100Rnd_556x45_M855_mixed_soft_pouch_ucp",15},
			{"rhsusf_10Rnd_762x51_m118_special_Mag",15},
			{"vn_m14_10_mag",30},
			{"CUP_8Rnd_12Gauge_Pellets_No00_Buck",15},
			{"rhs_mag_30Rnd_556x45_M855A1_EPM_Pull",30},
			{"rhs_mag_30Rnd_556x45_M855A1_PMAG",30},
			{"rhs_mag_30Rnd_556x45_M855_Stanag",30},
			{"vn_m16_30_mag",30},
			{"CUP_40Rnd_46x30_MP7",30},
			{"1Rnd_HE_Grenade_shell",30},
			{"CUP_FlareGreen_M203",30},
			{"CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow",30},
			{"rhsusf_5Rnd_00Buck",30},
			{"rhsusf_5Rnd_Slug",30},
			{"rhsusf_5Rnd_762x51_AICS_m118_special_Mag",30},
			{"rhsusf_5Rnd_762x51_m118_special_Mag",30},
			{"150Rnd_762x54_Box",30},
			{"20Rnd_762x51_Mag",30},
			{"CUP_20Rnd_762x51_B_SCAR_bkl",30},
			{"CUP_20Rnd_762x51_HK417_Camo_Desert",30},
			{"CUP_20Rnd_762x51_FNFAL_Woodland_M",30},
			{"CUP_30Rnd_Green_Tracer_9x19_MP5",30},
			{"150Rnd_762x51_Box",10},
			{"UGL_FlareGreen_F",10},
			{"rhs_mag_rsp30_green",10},
			{"FlareGreen_F",10},
			{"FlareRed_F",10},
			{"FlareWhite_F",10},
			{"FlareYellow_F",10}};
		items[] = {};
		backpacks[] = {};
};
//Support Weapons and Explosives
class customSupport
{
		objectClassname = "CargoNet_01_box_F";
		weapons[] = {
			{"rhs_weap_m72a7",4},
			{"rhs_weap_fim92",4},
			{"rhs_weap_fgm148",4},
			{"launch_MRAWS_green_rail_F",2}
		};
		magazines[] = {
			{"rhs_mag_m18_red",15},
			{"rhs_mag_m18_green",15},
			{"rhs_m72a7_mag",15},
			{"rhs_fim92_mag",15},
			{"Titan_AA",4},
			{"rhs_fgm148_magazine_AT",4},
			{"rhs_fgm148_magazine_AT_empty",4},
			{"MRAWS_HEAT_F",6},
			{"rhs_mag_maaws_HEDP",6}};
		items[] = {
			{"ACE_Chemlight_HiWhite",15},
			{"ACE_Chemlight_HiYellow",15},
			{"ACE_Chemlight_HiRed",15},
			{"ACE_Chemlight_UltraHiOrange",15},
			{"ACE_DefusalKit",5},
			{"ACE_M26_Clacker",5},
			{"ACE_Clacker",5},
			{"MineDetector",5}};
		backpacks[] = {
			{"RHS_M2_Gun_Bag",5},
			{"RHS_M2_Tripod_Bag",5}};
};
//Custom Explosives
class customExplosive
{
		objectClassname = "Box_NATO_AmmoOrd_F";
		weapons[] = {};
		magazines[] = {
			{"vn_mine_m112_remote_mag",12},
			{"rhsusf_m112_mag",10},
			{"rhsusf_m112x4_mag",10},
			{"vn_mine_m18_mag",10},
			{"SLAMDirectionalMine_Wire_Mag",10},
			{"ACE_FlareTripMine_Mag",10},
			{"CUP_PipeBomb_M",5},
			{"ATMine_Range_Mag",10}};
		items[] = {
			{"ACE_M26_Clacker",5},
			{"ACE_Clacker",5}};
		backpacks[] = {};
};
///////////////////Ammo Russian////////////////////
class CustomAmmoRus
{
		objectClassname = "Box_EAF_Equip_F";
		weapons[] = {};
		magazines[] = {
		{"rhs_100Rnd_762x54mmR",15},
		{"rhs_100Rnd_762x54mmR_7BZ3",15},
		{"rhs_100Rnd_762x54mmR_7N13",15},
		{"rhs_100Rnd_762x54mmR_7N26",15},
		{"rhs_100Rnd_762x54mmR_green",15},
		{"rhs_10Rnd_762x39mm",15},
		{"rhs_10Rnd_762x39mm_89",15},
		{"rhs_10Rnd_762x39mm_tracer",15},
		{"rhs_10Rnd_762x39mm_U",15},
		{"rhs_10rnd_9x39mm_SP5",15},
		{"rhs_10rnd_9x39mm_SP6",15},
		{"rhs_10Rnd_762x54mmR_7N1",15},
		{"rhs_10Rnd_762x54mmR_7N14",15},
		{"rhs_mag_9x18_12_57N181S",15},
		{"rhs_mag_9x19_17",15},
		{"rhs_mag_9x19_7n31_17",15},
		{"rhs_20rnd_9x39mm_SP5",15},
		{"rhs_20rnd_9x39mm_SP6",15},
		{"rhs_30Rnd_762x39mm_polymer",15},
		{"rhs_30Rnd_762x39mm_polymer_89",15},
		{"rhs_30Rnd_762x39mm_polymer_tracer",15},
		{"rhs_30Rnd_762x39mm_polymer_U",15},
		{"rhs_30Rnd_545x39_7N10_2mag_AK",15},
		{"rhs_30Rnd_545x39_7N10_2mag_camo_AK",15},
		{"rhs_30Rnd_545x39_7N10_2mag_desert_AK",15},
		{"rhs_30Rnd_545x39_7N10_2mag_plum_AK",15},
		{"rhs_30Rnd_545x39_AK_green",15},
		{"rhs_30Rnd_545x39_7N6_AK",15},
		{"rhs_30Rnd_545x39_7N22_desert_AK",15},
		{"rhs_30Rnd_545x39_7N6M_AK",15},
		{"rhs_30Rnd_545x39_7N10_camo_AK",15},
		{"rhs_30Rnd_545x39_7N22_camo_AK",15},
		{"rhs_30Rnd_545x39_7N6_green_AK",15},
		{"rhs_30Rnd_545x39_AK_plum_green",15},
		{"rhs_30Rnd_545x39_7N6M_green_AK",15},
		{"rhs_30Rnd_545x39_7N10_plum_AK",15},
		{"rhs_30Rnd_545x39_7N22_plum_AK",15},
		{"rhs_30Rnd_545x39_7N6M_plum_AK",15},
		{"rhs_30Rnd_545x39_7N10_AK",15},
		{"rhs_30Rnd_545x39_7N22_AK",15},
		{"rhs_30Rnd_762x39mm_bakelite",15},
		{"rhs_30Rnd_762x39mm_bakelite_89",15},
		{"rhs_30Rnd_762x39mm_bakelite_U",15},
		{"rhs_30Rnd_762x39mm_89",15},
		{"rhs_30Rnd_762x39mm_bakelite_tracer",15},
		{"rhs_30Rnd_545x39_7U1_AK",15},
		{"rhs_30Rnd_762x39mm",15},
		{"rhs_30Rnd_762x39mm_tracer",15},
		{"rhs_30Rnd_762x39mm_U",15},
		{"rhs_45Rnd_545X39_AK_Green",15},
		{"rhs_45Rnd_545X39_7N22_AK",15},
		{"rhs_45Rnd_545X39_7N10_AK",15},
		{"rhs_45Rnd_545X39_7N6_AK",15},
		{"rhs_45Rnd_545X39_7N6M_AK",15},
		{"rhs_45Rnd_545X39_7U1_AK",15},
		{"rhs_5Rnd_338lapua_t5000",15},
		{"rhs_75Rnd_762x39mm",15},
		{"rhs_75Rnd_762x39mm_89",15},
		{"rhs_75Rnd_762x39mm_tracer",15},
		{"vn_b_item_cigs_01",5},
		{"murshun_cigs_cigpack",5}
	};
		items[] = {};
		backpacks[] = {};
};
///////////////////////Support Weapons and Explosives Russian///////////////////////////////////
class customSupportRus
{
		objectClassname = "I_EAF_supplyCrate_F";
		weapons[] = {
			{"rhs_weap_igla",3},
			{"rhs_weap_rpg26",3},
			{"rhs_weap_rpg7",3},
			{"rhs_weap_rshg2",3}
		};
		magazines[] = {
			{"rhs_mag_9k38_rocket",15},
			{"Titan_AA",15},
			{"rhs_rpg26_mag",15},
			{"rhs_rpg7_PG7VL_mag",15},
			{"rhs_rpg7_PG7V_mag",15},
			{"rhs_rpg7_PG7VM_mag",15},
			{"rhs_rpg7_PG7VS_mag",15},
			{"rhs_rpg7_PG7VR_mag",15},
			{"rhs_rpg7_OG7V_mag",15},
			{"rhs_rpg7_TBG7V_mag",15},
			{"rhs_rpg7_type69_airburst_mag",15},
			{"RPG7_F",15},
			{"CUP_PG7V_M",15},
			{"CUP_PG7VM_M",15},
			{"CUP_PG7VL_M",15},
			{"CUP_PG7VR_M",15},
			{"CUP_OG7_M",15},
			{"CUP_TBG7V_M",15},
			{"rhs_rshg2_mag",15}
		};
		items[] = {
			{"ACE_Chemlight_HiWhite",15},
			{"ACE_Chemlight_HiYellow",15},
			{"ACE_Chemlight_HiRed",15},
			{"ACE_Chemlight_UltraHiOrange",15},
			{"ACE_DefusalKit",5},
			{"ACE_M26_Clacker",5},
			{"ACE_Clacker",5},
			{"MineDetector",5}
		};
		backpacks[] = {
			{"RHS_Kornet_Gun_Bag",3},
			{"RHS_Kornet_Tripod_Bag",3},
			{"RHS_Podnos_Gun_Bag",3},
			{"RHS_Podnos_Bipod_Bag",3}
		};
};
/////////////////////////////Custom Explosives Russian///////////////////////////////////////////
class customExplosiveRus
{
		objectClassname = "Box_EAF_AmmoOrd_F";
		weapons[] = {};
		magazines[] = {
			{"vn_mine_m112_remote_mag",12},
			{"rhsusf_m112_mag",10},
			{"rhsusf_m112x4_mag",10},
			{"vn_mine_m18_mag",10},
			{"SLAMDirectionalMine_Wire_Mag",10},
			{"ACE_FlareTripMine_Mag",10},
			{"CUP_PipeBomb_M",5},
			{"ATMine_Range_Mag",10}};
		items[] = {
			{"ACE_M26_Clacker",5},
			{"ACE_Clacker",5}};
		backpacks[] = {};
};