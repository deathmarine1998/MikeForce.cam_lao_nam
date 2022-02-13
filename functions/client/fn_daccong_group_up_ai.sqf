private _message = "";
private _dacCong = player;
private _dacCongAI = cursorTarget;
private _nameAI = name _dacCongAI;


_dacCongAI joinSilent (group player);
if((group player) isEqualTo (group _dacCongAI))then {
	DacCongAIGroup pushback _dacCongAI;
	_message = "%1 is now part of your group";
	["AIGroupSuccess", [_message]] call para_c_fnc_show_notification;
}else{
	_message = "%1 was not added to your group";
	["AIGroupFail", [_message]] call para_c_fnc_show_notification;
};