texts[] = {"STR_vn_mf_medic","STR_vn_mf_engineer","STR_vn_mf_explosive_specialist", "STR_vn_mf_radioOperator"};
names[] = {"medic","engineer","explosiveSpecialist", "radioOperator"};
traits[] = {"medic","engineer","explosiveSpecialist", "vn_artillery"};
markersMF[] = {"b_med", "b_maint", "b_Ordnance", "b_art"};
markersDC[] = {"o_med", "o_maint", "o_Ordnance", "o_art"};
images[] = {"\vn\ui_f_vietnam\ui\wheelmenu\img\icons\vn_ico_mf_role_med_ca.paa","\vn\ui_f_vietnam\ui\wheelmenu\img\icons\vn_ico_mf_role_eng_ca.paa","\vn\ui_f_vietnam\ui\wheelmenu\img\icons\vn_ico_mf_role_exp_ca.paa", "\vn\ui_f_vietnam\ui\wheelmenu\img\icons\vn_ico_mf_role_radioOp_ca.paa"};
icons[] = {"\vn\ui_f_vietnam\ui\taskroster\img\icons\vn_icon_role_medic.paa","\vn\ui_f_vietnam\ui\taskroster\img\icons\vn_icon_role_engineer.paa","\vn\ui_f_vietnam\ui\taskroster\img\icons\vn_icon_role_explosivespecialist.paa", "\vn\ui_f_vietnam\ui\taskroster\img\icons\vn_icon_role_radioOperator.paa" };

// limits
class MikeForce
{
	medic = 40;
	engineer = 10;
	explosiveSpecialist = 10;
	radioOperator = 0;
};
class EasyCompany
{
	medic = 10;
	engineer = 10;
	explosiveSpecialist = 10;
	radioOperator = 1;
};
class SaigonWarriors
{
	medic = 10;
	engineer = 10;
	explosiveSpecialist = 10;
	radioOperator = 1;
};
class ACAV
{
	medic = 10;
	engineer = 40;
	explosiveSpecialist = 10;
	radioOperator = 0;
};
class BlackHorse
{
	medic = 10;
	engineer = 10;
	explosiveSpecialist = 10;
	radioOperator = 1;
};
class Frogmen
{
	medic = 10;
	engineer = 10;
	explosiveSpecialist = 10;
	radioOperator = 1;
};
class GreenHornets
{
	medic = 20;
	engineer = 20;
	explosiveSpecialist = 20;
	radioOperator = 0;
};
class Muskets
{
	medic = 10;
	engineer = 10;
	explosiveSpecialist = 10;
	radioOperator = 1;
};
class SatansAngels
{
	medic = 10;
	engineer = 10;
	explosiveSpecialist = 10;
	radioOperator = 1;
};
class SpikeTeam
{
	medic = 10;
	engineer = 10;
	explosiveSpecialist = 40;
	radioOperator = 0;
};
class TigerForce
{
	medic = 10;
	engineer = 10;
	explosiveSpecialist = 10;
	radioOperator = 1;
};
class Montagnard
{
	medic = 10;
	engineer = 10;
	explosiveSpecialist = 10;
	radioOperator = 1;
};
class DacCong
{
	medic = 10;
	engineer = 10;
	explosiveSpecialist = 10;
	radioOperator = 0;
};
class MACVSOG
{
	medic = 10;
	engineer = 10;
	explosiveSpecialist = 10;
	radioOperator = 1;
};
class PressCorp
{
	medic = 10;
	engineer = 10;
	explosiveSpecialist = 10;
	radioOperator = 0;
};
class SASR
{
	medic = 10;
	engineer = 10;
	explosiveSpecialist = 10;
	radioOperator = 0;
};
class Gunslingers
{
	medic = 10;
	engineer = 10;
	explosiveSpecialist = 10;
	radioOperator = 0;
};
class BNCadet
{
	medic = 10;
	engineer = 10;
	explosiveSpecialist = 10;
	radioOperator = 0;
};
class BNGunClub
{
	medic = 10;
	engineer = 10;
	explosiveSpecialist = 10;
	radioOperator = 0;
};

class UnitTraitsSettings // camo, audio, load, engineer, explosiveSpecialist, medic, uavhacker
{
	MikeForce[] = { 0.8, 0.6, 1, "false", "false", "false", "false" };
	EasyCompany[] = { 0.7, 0.5, 0.9, "false", "false", "true", "false" };
	SaigonWarriors[] = { 0.7, 0.5, 0.9, "false", "false", "true", "false" };
	ACAV[] = { 0.8, 0.6, 1, "false", "false", "false", "false" };
	BlackHorse[] = { 0.7, 0.5, 0.9, "true", "false", "false", "false" };
	Frogmen[] = { 0.7, 0.5, 0.9, "false", "true", "false", "false" };
	GreenHornets[] = { 0.8, 0.6, 1, "false", "false", "false", "false" };
	Muskets[] = { 0.7, 0.5, 0.9, "false", "false", "true", "false" };
	SatansAngels[] = { 0.7, 0.5, 0.9, "false", "false", "true", "false" };
	SpikeTeam[] = { 0.8, 0.6, 1, "false", "false", "false", "false" };
	TigerForce[] = { 0.7, 0.5, 0.9, "false", "true", "false", "false" };
	Montagnard[] = { 0.7, 0.5, 0.9, "false", "true", "false", "false" };
	DacCong[] = { 0.7, 0.5, 0.9, "true", "true", "true", "false" };
	MACVSOG[] = { 0.5, 0.4, 0.75, "true", "true", "true", "true" };
	PressCorp[] = { 0.7, 0.5, 0.9 "false", "false", "true", "false" };
	SASR[] = { 0.7, 0.5, 0.9, "false", "false", "true", "false" };
	Gunslingers[] = { 0.7, 0.5, 0.9, "false", "true", "false", "false" };
	BNCadet[] = { 0.7, 0.5, 0.9, "false", "false", "false", "false" };
	BNGunClub[] = { 0.7, 0.5, 0.9, "false", "false", "false", "false" };
};