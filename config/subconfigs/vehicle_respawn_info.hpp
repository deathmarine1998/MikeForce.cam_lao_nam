class respawn_short
{
	respawnType = "RESPAWN";
	time = 10;
};

class respawn_medium
{
	respawnType = "RESPAWN";
	time = 30;
};

class respawn_long
{
	respawnType = "RESPAWN";
	time = 60;
};

class wreck_short
{
	respawnType = "WRECK";
	time = 10;
};

class wreck_medium
{
	respawnType = "WRECK";
	time = 30;
};

class wreck_long
{
	respawnType = "WRECK";
	time = 60;
};

class idle_respawn_5min
{
	respawnType = "IDLERESPAWN";
	time = 5;
};

class idle_respawn_10min
{
	respawnType = "IDLERESPAWN";
	time = 10;
};

class idle_respawn_20min
{
	respawnType = "IDLERESPAWN";
	time = 20;
};

class idle_respawn_30min
{
	respawnType = "IDLERESPAWN";
	time = 30;
};
class respawn_10
{
	respawnType = "RESPAWN";
	time = 10;
};

class respawn_30
{
	respawnType = "RESPAWN";
	time = 30;
};

class respawn_60
{
	respawnType = "RESPAWN";
	time = 60;
};
//5mins
class respawn_300
{
	respawnType = "RESPAWN";
	time = 300;
};
//10mins
class respawn_600
{
	respawnType = "RESPAWN";
	time = 600;
};
class wreck_10
{
	respawnType = "WRECK";
	time = 10;
};

class wreck_30
{
	respawnType = "WRECK";
	time = 30;
};

class wreck_60
{
	respawnType = "WRECK";
	time = 60;
};
class wreck_300
{
	respawnType = "WRECK";
	time = 300;
};
class wreck_600
{
	respawnType = "WRECK";
	time = 600;
};
//Jeeps + Small Cars
class uns_willys : respawn_short {};
class uns_willys_2 : respawn_short {};
class uns_willysmg50 : respawn_short {};
class uns_willysm40 : respawn_short {};
class uns_willysmg : respawn_short {};
class uns_willys_2_usmp : respawn_short {};
class uns_willys_2_usmc : respawn_short {};
class uns_willys_2_m60 : respawn_short {};
class uns_willys_2_m1919 : respawn_short {};
class vn_b_wheeled_m151_01 : idle_respawn_20min {};
class vn_b_wheeled_m151_02 : idle_respawn_20min {};
class vn_b_wheeled_m151_mg_01 : respawn_medium {};
class vn_b_wheeled_m151_mg_02 : respawn_medium {};
class vn_b_wheeled_m151_mg_03 : respawn_medium {};
class vn_b_wheeled_m151_mg_04 : respawn_medium {};
class vn_b_wheeled_m151_01_mp : respawn_medium {};
class vn_b_wheeled_m151_mg_02_mp : respawn_medium {};
class vn_b_wheeled_m151_mg_04_mp : respawn_medium {};
class vn_b_wheeled_m151_mg_05 : respawn_medium {};
class vn_c_car_01_01 : idle_respawn_20min {};
class vn_c_car_02_01 : idle_respawn_20min {};
class vn_c_car_03_01 : idle_respawn_20min {};
class vn_c_car_04_01 : idle_respawn_20min {};

//Trucks
class uns_m37b1 : respawn_medium {};
class uns_m37b1_m1919 : respawn_medium {};
class uns_M35A2 : respawn_medium {};
class uns_M35A2_Open : respawn_medium {};


//Transport trucks
class vn_b_wheeled_m54_01 : respawn_medium {};
class vn_b_wheeled_m54_01_airport : respawn_medium {};
class vn_b_wheeled_m54_02 : respawn_medium {};
class vn_b_wheeled_m54_02_sog : respawn_medium {};
//M109 Command Truck
class vn_b_wheeled_m54_03 : respawn_medium {};
//Repair Truck
class vn_b_wheeled_m54_repair : wreck_short {};
class vn_b_wheeled_m54_repair_airport : respawn_short {};
//Fuel trucks
class vn_b_wheeled_m54_fuel : wreck_short {};
class vn_b_wheeled_m54_fuel_airport : respawn_short {};
//Ammo truck
class vn_b_wheeled_m54_ammo : wreck_short {};
class vn_b_wheeled_m54_ammo_airport : respawn_short {};
//Gun trucks
class vn_b_wheeled_m54_mg_01 : wreck_short {};
class vn_b_wheeled_m54_mg_02 : wreck_short {};
class vn_b_wheeled_m54_mg_03 : wreck_short {};

//Armoured Cars
class uns_xm706e1 : wreck_short {};
class uns_xm706e2 : wreck_short {};
class vn_b_armor_m41_01_01 : wreck_long {};
//class vn_o_armor_type63_01 : wreck_long {};

//Wooden boats
class vn_c_boat_01_01 : respawn_short {};
class vn_c_boat_02_01 : respawn_short {};

//PBR Boat
class uns_pbr : respawn_long {};
class uns_pbr_m10 : respawn_long {};
class uns_pbr_mk18 : respawn_long {};
class vn_b_boat_05_01 : respawn_long {};
class vn_b_boat_05_02 : respawn_long {};
class vn_b_boat_06_02 : respawn_long {};

//Air assets
//Cobra Helicopter
class vn_b_air_ah1g_01 : wreck_long {};
class vn_b_air_ah1g_02 : wreck_long {};
class vn_b_air_ah1g_03 : wreck_long {};
class vn_b_air_ah1g_04 : wreck_long {};
class vn_b_air_ah1g_05 : wreck_long {};
class vn_b_air_ah1g_06 : wreck_long {};
class vn_b_air_ah1g_07 : wreck_long {};
class vn_b_air_ah1g_08 : wreck_long {};
class vn_b_air_ah1g_09 : wreck_long {};
class vn_b_air_ah1g_10 : wreck_long {};

class vn_b_air_ah1g_01_usmc : wreck_long {};
class vn_b_air_ah1g_02_usmc : wreck_long {};
class vn_b_air_ah1g_03_usmc : wreck_long {};
class vn_b_air_ah1g_04_usmc : wreck_long {};
class vn_b_air_ah1g_05_usmc : wreck_long {};
class vn_b_air_ah1g_06_usmc : wreck_long {};
class vn_b_air_ah1g_07_usmc : wreck_long {};
class vn_b_air_ah1g_08_usmc : wreck_long {};
class vn_b_air_ah1g_09_usmc : wreck_long {};
class vn_b_air_ah1g_10_usmc : wreck_long {};

//Choctaw
class vn_b_air_ch34_01_01 : respawn_medium {};
class vn_b_air_ch34_03_01 : respawn_medium {};
//Choctaw gunships
class vn_b_air_ch34_04_01 : wreck_medium {};
class vn_b_air_ch34_04_02 : wreck_medium {};
class vn_b_air_ch34_04_03 : wreck_medium {};
class vn_b_air_ch34_04_04 : wreck_medium {};

//Littlebird
class C_Heli_Light_01_civil_F : respawn_short {};
class vn_b_air_oh6a_01 : respawn_short {};
class vn_b_air_oh6a_02 : wreck_medium {};
class vn_b_air_oh6a_03 : wreck_medium {};
class vn_b_air_oh6a_04 : wreck_medium {};
class vn_b_air_oh6a_05 : wreck_medium {};
class vn_b_air_oh6a_06 : wreck_medium {};
class vn_b_air_oh6a_07 : wreck_medium {};

//UH1D - Dustoff
class vn_b_air_uh1d_01_01 : respawn_medium {};
class vn_b_air_uh1d_01_02 : respawn_medium {};
class vn_b_air_uh1d_01_03 : respawn_medium {};
class vn_b_air_uh1d_01_04 : respawn_medium {};
class vn_b_air_uh1d_01_05 : respawn_medium {};
class vn_b_air_uh1d_01_06 : respawn_medium {};
class vn_b_air_uh1d_01_07 : respawn_medium {};

//UH1D - Slick
class vn_b_air_uh1d_02_01 : respawn_medium {};
class vn_b_air_uh1d_02_02 : respawn_medium {};
class vn_b_air_uh1d_02_03 : respawn_medium {};
class vn_b_air_uh1d_02_04 : respawn_medium {};
class vn_b_air_uh1d_02_05 : respawn_medium {};
class vn_b_air_uh1d_02_06 : respawn_medium {};
class vn_b_air_uh1d_02_07 : respawn_medium {};

//UH1C - Hog
class vn_b_air_uh1c_01_01 : wreck_medium {};
class vn_b_air_uh1c_01_02 : wreck_medium {};
class vn_b_air_uh1c_01_03 : wreck_medium {};
class vn_b_air_uh1c_01_04 : wreck_medium {};
class vn_b_air_uh1c_01_05 : wreck_medium {};
class vn_b_air_uh1c_01_06 : wreck_medium {};
class vn_b_air_uh1c_01_07 : wreck_medium {};

//UH1C - Gunship
class vn_b_air_uh1c_02_01 : wreck_medium {};
class vn_b_air_uh1c_02_02 : wreck_medium {};
class vn_b_air_uh1c_02_03 : wreck_medium {};
class vn_b_air_uh1c_02_04 : wreck_medium {};
class vn_b_air_uh1c_02_05 : wreck_medium {};
class vn_b_air_uh1c_02_06 : wreck_medium {};
class vn_b_air_uh1c_02_07 : wreck_medium {};

//UH1C - Hornet
class vn_b_air_uh1c_03_01 : wreck_medium {};
class vn_b_air_uh1c_03_02 : wreck_medium {};
class vn_b_air_uh1c_03_03 : wreck_medium {};
class vn_b_air_uh1c_03_04 : wreck_medium {};
class vn_b_air_uh1c_03_05 : wreck_medium {};
class vn_b_air_uh1c_03_06 : wreck_medium {};
class vn_b_air_uh1c_03_07 : wreck_medium {};

//UH1C - Frog
class vn_b_air_uh1c_04_01 : wreck_medium {};
class vn_b_air_uh1c_04_02 : wreck_medium {};
class vn_b_air_uh1c_04_03 : wreck_medium {};
class vn_b_air_uh1c_04_04 : wreck_medium {};
class vn_b_air_uh1c_04_05 : wreck_medium {};
class vn_b_air_uh1c_04_06 : wreck_medium {};
class vn_b_air_uh1c_04_07 : wreck_medium {};

//UH1C - Heavy Hog
class vn_b_air_uh1c_05_01 : wreck_medium {};
class vn_b_air_uh1c_05_02 : wreck_medium {};
class vn_b_air_uh1c_05_03 : wreck_medium {};
class vn_b_air_uh1c_05_04 : wreck_medium {};
class vn_b_air_uh1c_05_05 : wreck_medium {};
class vn_b_air_uh1c_05_06 : wreck_medium {};
class vn_b_air_uh1c_05_07 : wreck_medium {};

//UH1C - ARA
class vn_b_air_uh1c_06_01 : wreck_medium {};
class vn_b_air_uh1c_06_02 : wreck_medium {};

//UH1B - Slick
class vn_b_air_uh1c_07_01 : respawn_medium {};

//UH1C - ACAV
class vn_b_air_uh1c_07_02 : wreck_medium {};
class vn_b_air_uh1c_07_04 : wreck_medium {};
class vn_b_air_uh1c_07_07 : wreck_medium {};

//F4 aircraft
class vn_b_air_f4c_cap : wreck_medium {};
class vn_b_air_f4c_cas : wreck_medium {};
class vn_b_air_f4c_hcas : wreck_medium {};
class vn_b_air_f4c_ehcas : wreck_medium {};
class vn_b_air_f4c_ucas : wreck_medium {};
class vn_b_air_f4c_at : wreck_medium {};
class vn_b_air_f4c_mr : wreck_medium {};
class vn_b_air_f4c_lrbmb : wreck_medium {};
class vn_b_air_f4c_lbmb : wreck_medium {};
class vn_b_air_f4c_bmb : wreck_medium {};
class vn_b_air_f4c_mbmb : wreck_medium {};
class vn_b_air_f4c_hbmb : wreck_medium {};
class vn_b_air_f4c_gbu : wreck_medium {};
class vn_b_air_f4c_cbu : wreck_medium {};
class vn_b_air_f4c_sead : wreck_medium {};
class vn_b_air_f4c_chico : wreck_medium {};
class vn_b_air_f4b_usmc_cap : wreck_medium {};
class vn_b_air_f4b_usmc_cas : wreck_medium {};
class vn_b_air_f4b_usmc_hcas : wreck_medium {};
class vn_b_air_f4b_usmc_ehcas : wreck_medium {};
class vn_b_air_f4b_usmc_ucas : wreck_medium {};
class vn_b_air_f4b_usmc_at : wreck_medium {};
class vn_b_air_f4b_usmc_mr : wreck_medium {};
class vn_b_air_f4b_usmc_lrbmb : wreck_medium {};
class vn_b_air_f4b_usmc_lbmb : wreck_medium {};
class vn_b_air_f4b_usmc_bmb : wreck_medium {};
class vn_b_air_f4b_usmc_mbmb : wreck_medium {};
class vn_b_air_f4b_usmc_hbmb : wreck_medium {};
class vn_b_air_f4b_usmc_gbu : wreck_medium {};
class vn_b_air_f4b_usmc_cbu : wreck_medium {};
class vn_b_air_f4b_usmc_sead : wreck_medium {};
class vn_b_air_f4b_navy_cap : wreck_medium {};
class vn_b_air_f4b_navy_cas : wreck_medium {};
class vn_b_air_f4b_navy_hcas : wreck_medium {};
class vn_b_air_f4b_navy_ehcas : wreck_medium {};
class vn_b_air_f4b_navy_ucas : wreck_medium {};
class vn_b_air_f4b_navy_at : wreck_medium {};
class vn_b_air_f4b_navy_mr : wreck_medium {};
class vn_b_air_f4b_navy_lrbmb : wreck_medium {};
class vn_b_air_f4b_navy_lbmb : wreck_medium {};
class vn_b_air_f4b_navy_bmb : wreck_medium {};
class vn_b_air_f4b_navy_mbmb : wreck_medium {};
class vn_b_air_f4b_navy_hbmb : wreck_medium {};
class vn_b_air_f4b_navy_gbu : wreck_medium {};
class vn_b_air_f4b_navy_cbu : wreck_medium {};
class vn_b_air_f4b_navy_sead : wreck_medium {};

//Unsung Huey
class uns_UH1D_raaf_m60 : respawn_medium {};
class uns_UH1C_M21_M200 : wreck_medium {};

//Chinook
class uns_ch47_m60_army : respawn_medium {};

//DacCong
class vn_o_air_mi2_04_05 : idle_respawn_30min {};
class vn_o_wheeled_btr40_02_nva65 : idle_respawn_30min {};
class vn_o_wheeled_btr40_mg_01_nva65 : idle_respawn_30min {};
class vn_o_wheeled_btr40_mg_02_nva65 : idle_respawn_30min {};
class vn_o_wheeled_btr40_mg_03_nva65 : idle_respawn_30min {};
class vn_o_air_mi2_01_01 : idle_respawn_30min {};
class vn_o_air_mi2_01_02 : idle_respawn_30min {};
class vn_o_air_mi2_01_03 : idle_respawn_30min {};
class vn_o_air_mi2_03_02 : idle_respawn_30min {};
class vn_o_air_mi2_03_04 : idle_respawn_30min {};
class vn_o_air_mi2_05_06 : idle_respawn_30min {};
class vn_o_air_mi2_03_03 : respawn_medium {};
class vn_o_air_mi2_04_03 : respawn_medium {};
class vn_o_air_mi2_05_04 : respawn_medium {};
class vn_o_air_mi2_03_06 : respawn_medium {};
class vn_o_air_mi2_04_02 : respawn_medium {};
class vn_o_armor_type63_01 : idle_respawn_30min {};
class vn_o_bicycle_01_nva65 : idle_respawn_10min {};
class vn_c_bicycle_01 : idle_respawn_10min {};
class vn_c_wheeled_m151_01 : idle_respawn_10min {};
class vn_c_wheeled_m151_02 : idle_respawn_10min {};
class vn_o_wheeled_z157_04_vcmf : idle_respawn_30min {};
class vn_o_wheeled_z157_03_vcmf : idle_respawn_30min {};
class vn_o_wheeled_z157_ammo : respawn_medium {};
class vn_o_wheeled_z157_fuel : respawn_medium {};
class vn_o_wheeled_z157_repair : respawn_medium {};
class vn_o_wheeled_btr40_mg_02 : respawn_medium {};
class vn_o_wheeled_btr40_mg_01 : respawn_medium {};
class vn_o_wheeled_btr40_mg_03 : respawn_medium {};
class vn_o_wheeled_btr40_01_nva65 : respawn_medium {};
class vn_o_boat_01_mg_00 : respawn_short {};
class vn_o_boat_01_mg_03 : respawn_short {};
class vn_o_boat_02_mg_04 : respawn_short {};
class vn_o_boat_04_01 : respawn_short {};

// MPs
class vn_o_wheeled_btr40_01_vcmf : respawn_short {};

// Statics
class vn_b_sf_static_mortar_m29 : respawn_short {};
class vn_b_sf_static_mortar_m2 : respawn_short {};
class vn_b_army_static_m45 : respawn_short {};
class vn_b_sf_static_m60_low : respawn_short {};
class vn_b_army_static_m60_high : respawn_short {};
class vn_b_army_static_m1919a4_high : respawn_short {};
class vn_b_sf_static_m2_low : respawn_short {};
class vn_b_army_static_m2_high : respawn_short {};
class vn_b_army_static_m1919a6 : respawn_short {};
class vn_b_army_static_tow : respawn_short {};
class vn_b_sf_static_m1919a4_low : respawn_short {};
class vn_o_nva_navy_static_rpd_high : respawn_short {};
class vn_o_nva_navy_static_pk_low : respawn_short {};
class vn_o_nva_navy_static_pk_high : respawn_short {};
class vn_o_nva_navy_static_dshkm_low_01 : respawn_short {};
class vn_o_nva_navy_static_dshkm_low_02 : respawn_short {};
class vn_o_nva_navy_static_d44 : respawn_short {};
class vn_o_nva_navy_static_dshkm_high_01 : respawn_short {};
class vn_o_nva_navy_static_at3 : respawn_short {};
class vn_o_nva_static_at3 : respawn_medium {};
class vn_o_nva_static_zpu4 : respawn_medium {};
class vn_o_nva_static_d44_01 : respawn_medium {};
class vn_o_nva_static_d44 : respawn_medium {};
class vn_o_nva_static_type56rr : respawn_medium {};
class vn_o_nva_static_dshkm_low_01 : respawn_medium {};
class vn_o_boat_07_01 : respawn_short {};
class vn_o_boat_08_02 : respawn_short {};
class vn_o_wheeled_z157_mg_02_vcmf : respawn_short {};


//class Land_vn_helipadsquare_f : respawn_short {};
//class Land_vn_b_helipad_01 : respawn_short {};
class Land_vn_helipadrescue_f : respawn_short {};
//class Land_ClutterCutter_small_F : respawn_short {};

//RHS SHIT Jayson

//planes
class USAF_F22_EWP_AG : respawn_60 {};
class USAF_F22_EWP_AA : respawn_60 {};
class rhsusf_f22 : respawn_60 {};
class RHS_A10 : respawn_60 {};
class CUP_B_F35B_Stealth_USMC : respawn_60 {};
class B_Plane_Fighter_01_F : respawn_60 {};
class B_Plane_Fighter_01_Stealth_F : respawn_60 {};
class CUP_B_JAS9_HIL : respawn_60 {};
class RHSGREF_A29B_HIDF : respawn_600 {};
			
//HELICOPTERS
			
class RHS_UH60M_ESSS : wreck_60 {};
class RHS_UH60M_MEV_d : respawn_60 {};
class RHS_MELB_MH6M : respawn_60 {};
			
//trucks/MRAPS
class rhsusf_M1120_M153_M2_usarmy_d : wreck_60 {};
class rhsusf_M1232_M2_usarmy_d : wreck_60 {};
class rhsusf_m1240a1_mk19_usarmy_d : wreck_60 {};
class rhsusf_m1240a1_m2_uik_usarmy_d : wreck_60 {};
class rhsusf_M1083A1P2_B_M2_D_flatbed_fmtv_usarmy : wreck_60 {};
class rhsusf_M1078A1P2_D_flatbed_fmtv_usarmy : respawn_60 {};
class rhsusf_M1083A1P2_B_M2_D_fmtv_usarmy : respawn_60 {};
class rhsusf_M1078A1P2_D_fmtv_usarmy : respawn_60 {};
class rhsusf_M1078A1P2_B_M2_D_fmtv_usarmy : wreck_60 {};
class rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy : respawn_60 {};
class rhsusf_M978A4_BKIT_usarmy_d : respawn_60 {};
class rhsusf_M977A4_REPAIR_BKIT_usarmy_d : respawn_60 {};
class rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d : respawn_60 {};
class rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_d : respawn_60 {};
class rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd : respawn_60 {};
class rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd : respawn_60 {};
class rhsusf_M978A4_BKIT_usarmy_wd : respawn_60 {};
class rhsusf_M1085A1P2_B_WD_Medical_fmtv_usarmy : respawn_60 {};
class rhsusf_M1083A1P2_B_M2_WD_fmtv_usarmy : wreck_60 {};
class rhsusf_M1083A1P2_B_M2_WD_flatbed_fmtv_usarmy : wreck_60 {};
class rhsusf_M1117_W : wreck_60 {};
class rhsusf_M1239_socom_d : respawn_60 {};
class rhsusf_m1165a1_gmv_mk19_m240_socom_d : respawn_60 {};
class rhsusf_M978A4_usarmy_d : respawn_60 {};
class rhsusf_m1240a1_mk19_uik_usarmy_d : wreck_60 {};
class rhsusf_m1240a1_mk19_uik_usarmy_wd : wreck_60 {};
class rhsusf_m1240a1_m2_usarmy_wd : wreck_60 {};
			
//tanks
class rhsusf_m1a2sep1d_usarmy : wreck_60 {};
class CUP_B_M1A2C_NATO_T : wreck_60 {};
class RHS_M2A3_BUSKIII_wd : wreck_60 {};
			
			
			
//APC/IFV
class rhsusf_m113d_usarmy : wreck_60 {};
class rhsusf_m113d_usarmy_MK19 : wreck_60 {};
class rhsusf_m113d_usarmy_medical : wreck_60 {};
class rhsusf_stryker_m1132_m2_d : wreck_60 {};
			
			
//Cars
class rhsusf_m1151_mk19_v1_usarmy_d : respawn_60 {};
class rhsusf_m996 : respawn_60 {};
class rhsusf_m998_d_4dr_fulltop : respawn_60 {};
class rhsusf_m1151_m2_lras3_v1_usarmy_d : respawn_60 {};
class rhsusf_m1025_d_m2 : respawn_60 {};
class rhsusf_m998_d_2dr_fulltop : respawn_60 {};
class rhsusf_m1151_mk19crows_usarmy_d : respawn_60 {};
class rhsusf_m1151_m2crows_usarmy_d : respawn_60 {};
class rhsusf_m1151_m2_v2_usarmy_wd : respawn_60 {};
class rhsusf_m1151_m2_lras3_v1_usarmy_wd : respawn_60 {};
class rhsusf_m1151_mk19_v2_usarmy_wd : respawn_60 {};
class CUP_B_HMMWV_Avenger_USMC : wreck_60 {};
class rhsusf_m1152_sicps_usarmy_wd : respawn_60 {};
class rhsusf_m966_w : respawn_60 {};
class rhsusf_m1151_mk19_v3_usmc_wd : respawn_60 {};
class rhsusf_m1151_m2_v3_usmc_wd : respawn_60 {};
class rhsusf_m1025_w_s_m2 : respawn_60 {};

//edited jayson

//planes
class B_T_VTOL_01_armed_F : respawn_600 {};	//black fish
class B_Plane_CAS_01_dynamicLoadout_F : respawn_600 {};
class CUP_B_A10_DYN_USA : wreck_medium {};
class CUP_B_AV8B_DYN_USMC : respawn_600 {};
class CUP_B_JAS39_HIL : respawn_600 {};
class CUP_B_F35B_USMC : wreck_medium {};
class USAF_C130J : respawn_60 {};
class USAF_C130J_Cargo : respawn_60 {};
class USAF_C17 : respawn_60 {};
class USAF_A10 : wreck_medium {};
class USAF_F35A_STEALTH : wreck_medium {};
class USAF_AC130U : wreck_medium {};
class USAF_F35A : wreck_medium {};

//Helicopters
class CUP_B_AH64D_DL_USA : wreck_60 {};
class CUP_B_MH60L_DAP_4x_US : wreck_60 {};
class CUP_B_AH6J_USA : wreck_60 {};
class CUP_B_AH6M_USA : wreck_60 {};
class CUP_B_CH47F_VIV_USA : respawn_60 {};
class CUP_B_CH53E_USMC : respawn_60 {};
class CUP_B_MH47E_USA : respawn_60 {};
class CUP_B_UH60M_Unarmed_FFV_MEV_US : respawn_60 {};
class CUP_B_UH60M_FFV_US : respawn_60 {};
class CUP_B_MH6M_USA : respawn_60 {};
class CUP_B_MH60L_DAP_2x_US : wreck_60 {};
class CUP_B_MH60L_DAP_2x_USN : wreck_60 {};
class CUP_B_MH60L_DAP_4x_USN : wreck_60 {};
class CUP_B_UH60S_USN : respawn_60 {};
class RHS_UH60M_ESSS2_d : wreck_60 {};
class RHS_MELB_AH6M : wreck_60 {};
class RHS_AH64D : wreck_60 {};
class RHS_UH60M_d : respawn_60 {};
class RHS_UH60M_MEV2_d : respawn_60 {};
class RHS_CH_47F_10 : respawn_60 {};
class RHS_CH_47F_10_cargo : respawn_60 {};
class Rhsusf_CH53e_USMC_cargo :respawn_60 {};
class RHS_UH1Y_d : respawn_60 {};
class rhsusf_CH53E_USMC_GAU21_D : respawn_60 {};
class rhsusf_CH53E_USMC : respawn_60 {};
class CUP_B_412_dynamicLoadout_HIL : wreck_60 {};
class CUP_B_UH1Y_Gunship_Dynamic_USMC : wreck_60 {};
class RHS_AH1Z_wd : wreck_60 {};
class RHS_UH1Y_UNARMED : respawn_60 {};
class rhsusf_CH53_USMC_D : respawn_60 {};
class rhsusf_CH53_USMC_D_cargo : respawn_60 {};
class rhsusf_CH53e_USMC_D : respawn_60 {};
class rhsusf_CH53e_USMC_D_cargo : respawn_60 {};
class CUP_B_AH1Z_Dynamic_USMC : wreck_60 {};

//Tanks
class CUP_B_M1A1_DES_US_Army : wreck_60 {};
class CUP_B_M1A2_TUSK : wreck_60 {};
class CUP_B_M2A3Bradley_USA_W : wreck_60 {};
class CUP_B_M1A2_TUSK_MG_US_Army : wreck_60 {};
class CUP_B_M7Bradley_USA_D : wreck_60 {};
class rhsusaf_m1a2sep2d_usarmy : wreck_60 {};
class RHS_M2A3_BUSKIII : wreck_60 {};
class CUP_B_M2Bradley_USA_D : wreck_60 {};
class rhsusf_m1a2sep2d_usarmy : wreck_60 {};
class rhsusf_m1a2sep2wd_usarmy : wreck_60 {};

//Trucks/CARS
class C_Quadbike_01_F : respawn_60 {};
class CUP_B_TowingTractor_USA : respawn_60 {};
class CUP_B_RG31_M2_OD_USA : wreck_60 {};
class CUP_B_RG31E_M2_OD_USA : wreck_60 {};
class CUP_B_MTVR_USA : respawn_60 {};
class CUP_B_MTVR_Ammo_USA : respawn_60 {};
class CUP_B_MTVR_Refuel_USA : respawn_60 {};
class CUP_B_MTVR_Repair_USA : respawn_60 {};
class CUP_B_RG31E_M2_USA : wreck_60 {};
class CUP_B_RG31_M2_USA : wreck_60 {};
class CUP_B_RG31_mk19_USA : wreck_60 {};
class CUP_B_HMMWV_Ambulance_USA : respawn_60 {};
class CUP_B_HMMWV_Transport_USA : respawn_60 {};
class CUP_B_HMMWV_M2_USA : wreck_60 {};
class CUP_B_HMMWV_SOV_M2_USA : wreck_60 {};
class CUP_B_M1151_USA : respawn_60 {};
class CUP_B_HMMWV_Crows_M2_USA : wreck_60 {};
class CUP_B_M1151_Mk19_USA : wreck_60 {};
class CUP_B_M1151_Deploy_USA : wreck_60 {};
class CUP_B_M1165_GMV_USA : wreck_60 {};
class CUP_B_M1167_USA : wreck_60 {};
class CUP_B_RG31_Mk19_OD_USMC : wreck_60 {};
class CUP_B_LAV25M240_green : wreck_60 {};
class CUP_B_LAV25_HQ_green : wreck_60 {};
class CUP_B_HMMWV_M2_GPK_USA : wreck_60 {};
class CUP_B_HMMWV_Terminal_NATO_T : respawn_60 {};
class CUP_B_M1151_Deploy_USMC : respawn_60 {};
class CUP_B_RG31E_M2_OD_USMC : respawn_60 {};
class CUP_B_nM997_USMC_WDL : respawn_60 {};
class rhsusf_M977A4_AMMO_BKIT_usarmy_d : respawn_60 {};
class rhsusf_M977A4_REPAIR_usarmy_d : respawn_60 {};
class rhsusf_M977A4_usarmy_d : respawn_60 {};
class rhsusf_m1165a1_gmv_m134d_m240_socom_d : respawn_60 {};
class rhsusf_m1240a1_m240_uik_usarmy_d : respawn_60 {};
class rhsusf_M1239_M2_Deploy_socom_d : respawn_60 {};
class rhsusf_m1151_m2_v2_usarmy_d : respawn_60 {};
class rhsusf_m1151_m240_v2_usarmy_d : respawn_60 {};
class rhsusf_m1151_mk19_v2_usarmy_d : respawn_60 {};
class rhsusf_M1084A1P2_B_D_fmtv_usarmy : respawn_60 {};
class rhsusf_M1084A1P2_B_M2_D_fmtv_usarmy : respawn_60 {};
class rhsusf_M1084A1P2_B_D_Medical_fmtv_usarmy : respawn_60 {};
class rhsusf_mrzr4_d : respawn_60 {};
class rhsusf_M1220_M153_M2_usarmy_d : respawn_60 {};
class rhsusf_m966_d : respawn_60 {};
class rhsusf_m1240a1_m2_usarmy_d : respawn_60 {};
class rhsusf_m1240a1_m2crows_usmc_wd : wreck_60 {};
class rhsusf_M1220_MK19_usarmy_wd : wreck_60 {};
class rhsusf_M1220_M153_M2_usarmy_wd : wreck_60 {};
class rhsusf_m1240a1_m240_uik_usarmy_wd : wreck_60 {};
class rhsusf_M1083A1P2_WD_fmtv_usarmy : respawn_60 {};
class rhsusf_M1232_MK19_usarmy_wd : respawn_60 {};
class rhsusf_m1240a1_m2crows_usarmy_wd : respawn_60 {};
class rhsusf_m1151_m2crows_usarmy_wd : respawn_60 {};
class rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy : respawn_60 {};
class rhsusf_M978A4_usarmy_wd : respawn_60 {};
class rhsusf_M977A4_REPAIR_BKIT_usarmy_wd : respawn_60 {};
class rhsusf_M977A4_AMMO_BKIT_usarmy_wd : respawn_60 {};
class rhsusf_M1220_M2_usarmy_wd : respawn_60 {};
class CUP_I_SUV_Armored_ION : wreck_60 {};
class CUP_I_SUV_ION : respawn_60 {};

//APC
class CUP_B_M1133_MEV_desert : respawn_60 {};
class CUP_B_LAV25_HQ_desert_USMC : respawn_60 {};
class CUP_B_m1128_MGS_Desert : wreck_60 {};
class CUP_B_LAV25_desert_USMC : wreck_60 {};
class CUP_B_AAV_Unarmed_USMC : wreck_60 {};
class CUP_B_M113_desert_USA : wreck_60 {};
class CUP_B_M113_Med_USA : wreck_60 {};
class CUP_B_M1135_ATGMV_Desert : wreck_60 {};
class CUP_B_M1126_ICV_MK19_Desert : wreck_60 {};
class CUP_B_M1126_ICV_M2_Desert : wreck_60 {};
class CUP_B_AAV_USMC : wreck_60 {};
class CUP_B_LAV25M240_USMC : wreck_60 {};
class CUP_B_LAV25_HQ_USMC : wreck_60 {};
class CUP_B_AAV_USMC_TTS : wreck_60 {};
class rhsusf_m1240a1_mk19crows_usmc_wd : wreck_60 {};
class rhsusf_stryker_m1134_d : wreck_60 {};
class rhsusf_stryker_m1127_m2_d : wreck_60 {};
class rhsusf_m113_usarmy_medical : wreck_60 {};
class rhsusf_m113_usarmy : wreck_60 {};
class rhsusf_m113_usarmy_MK19_90 : wreck_60 {};
class RHS_M2A3_BUSKI_wd : wreck_60 {};
 
//Boats
class B_T_Boat_Armed_01_minigun_F : respawn_60 {};
class CUP_B_LCU1600_USMC : respawn_60 {};
class CUP_B_RHIB2Turret_HIL : respawn_60 {};
class CUP_B_RHIB_HIL : respawn_60 {};
class CUP_I_Frigate_RACS : wreck_60 {};
class rhsusf_mkvsoc : respawn_60 {};
class B_SDV_01_F : respawn_60 {};
class B_Boat_Transport_01_F : respawn_60 {};

//arty
class RHS_M119_D : wreck_60 {};


class vn_i_air_ch34_02_02 : wreck_60 {};
class vn_i_air_ch34_02_01 : wreck_60 {};
class vn_i_air_ch34_01_02 : wreck_60 {};




///////////////////////////Russian Assets/////////////////////////////////////


//plane

class RHS_Su25SM_vvs : wreck_medium {};
class CUP_O_SU34_SLA : wreck_medium {};


//Helicopters

class RHS_Ka52_vvs : wreck_60 {};
class rhs_mi28n_vvs : wreck_60 {};
class RHS_Mi24P_vvs : wreck_60 {};
class RHS_Mi8MTV3_heavy_vvs : wreck_60 {};
class rhs_ka60_grey : respawn_60 {};
class RHS_Mi24V_vvs : wreck_60 {};
class RHS_Mi8mtv3_Cargo_vvs : respawn_60 {};
class RHS_Mi8mt_Cargo_vvs : respawn_60 {};
class RHS_Mi8mt_vvs : respawn_60 {};
class CUP_O_MI6A_RU : respawn_60 {};

//Cars

class O_T_LSV_02_unarmed_F : respawn_60 {};
class CUP_O_UAZ_METIS_RU : wreck_60 {};
class CUP_O_UAZ_AGS30_RU : wreck_60 {};
class CUP_O_UAZ_SPG9_RU : wreck_60 {};
class rhs_tigr_sts_msv : wreck_60 {};
class rhs_tigr_msv : respawn_60 {};
class CUP_O_GAZ_Vodnik_PK_RU : respawn_60 {};
class CUP_O_GAZ_Vodnik_AGS_RU : wreck_60 {};
class CUP_O_GAZ_Vodnik_BPPU_RU : wreck_60 {};
class CUP_O_GAZ_Vodnik_KPVT_RU : wreck_60 {};
class rhs_tigr_sts_vdv : respawn_60 {};

//Trucks

class CUP_O_Kamaz_Open_RU : respawn_60 {};
class CUP_O_Kamaz_RU : respawn_60 {};
class RHS_Ural_Fuel_VDV_01 : respawn_60 {};
class RHS_Ural_Repair_VDV_01 : respawn_60 {};
class rhs_kamaz5350_ammo_vdv : respawn_60 {};
class rhs_kamaz5350_vv : respawn_60 {};
class rhs_kamaz5350_flatbed_vv : respawn_60 {};

//APC

class CUP_O_BRDM2_RUS : wreck_60 {};
class rhs_btr60_msv : wreck_60 {};
class rhs_bmp2k_tv : wreck_60 {};
class rhs_bmp2d_msv : wreck_60 {};
class CUP_O_BRDM2_ATGM_RUS : wreck_60 {};
class rhs_bmp3mera_msv : wreck_60 {};
class rhs_t15_tv : wreck_60 {};
class rhs_btr80a_vdv : wreck_60 {};

//Tanks

class rhs_t90sm_tv : wreck_60 {};
class rhs_t14_tv : wreck_60 {};

//Anti Air

class rhs_zsu234_aa : wreck_60 {};

//Artillery

class rhs_d30_msv : wreck_60 {};

//Boats

class vn_o_boat_04_02 : respawn_60 {};
class O_SDV_01_F : respawn_60 {};
class CUP_O_PBX_RU : respawn_60 {};
class O_T_Boat_Armed_01_hmg_f : respawn_60 {};
class CUP_O_ZUBR_RU : wreck_60 {};
