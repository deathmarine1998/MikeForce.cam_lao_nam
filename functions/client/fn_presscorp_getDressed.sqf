/*
[
["vn_m16_bayo","","vn_b_m16","",["vn_m16_20_t_mag",18],[],""], // primary weapon 0
[], // secondary? weapon 1
[], // launcher? weapon 2
["vn_b_uniform_macv_05_01",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m18_purple_mag",2,1],["vn_m18_red_mag",2,1]]], // uniform and inventory 3
["vn_b_vest_usarmy_03",[["vn_m16_20_t_mag",3,18]]], // vest and inventory 4
["vn_b_pack_trp_04_02_m16_pl",[["vn_b_item_firstaidkit",2],["vn_m16_20_t_mag",10,18],["vn_m61_grenade_mag",2,1],["vn_m18_yellow_mag",2,1],["vn_m18_purple_mag",2,1],["vn_mine_m18_range_mag",1,1]]], // backpack and inventory 5
"vn_b_helmet_m1_09_01", // headgear 6
"vn_b_aviator", // googles 7
[], // ? 8
["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""] // assigned items 9
]
*/
_loadout = getUnitLoadout player;
_set1 = [_loadout# 0, _loadout# 1, _loadout# 2]; //, _loadout# 5, _loadout# 6, _loadout# 7, _loadout# 8, _loadout# 9]
_uniformUnit = _loadout# 3;
_uniformUnit set [0, "U_C_Journalist"];
_vestUnit = _loadout# 4;
_vestUnit set [0, "V_Press_F"];
_set2 = [];

_unitLoadout = [_loadout# 0, _loadout# 1, _loadout# 2, _uniformUnit, _vestUnit, _loadout# 5, "H_PASGT_neckprot_blue_press_F", "vn_b_aviator",_loadout# 8, _loadout# 9];

player setUnitLoadout _unitLoadout;