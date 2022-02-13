
disableSerialization;
#include "..\..\..\config\ui\ui_def_base.inc"

//INIT
VN_MF_PHOENIX_PLAYER_LIST_BOX_SELECTION = "";
VN_MF_PHOENIX_PLAYER_LIST_BOX_DATA = [];
VN_MF_PHOENIX_ZONE_LIST_BOX_SELECTION = "";

//Fill list box with players
_playerListBox = VN_TR_CIAPANEL_PLAYER_LISTBOX_CTRL;
lbClear _playerListBox;
{
	private _ind = _playerListBox lbAdd (name _x);
	VN_MF_PHOENIX_PLAYER_LIST_BOX_DATA pushBack _x;
}forEach allPlayers;
lbSortByValue _playerListBox;

//Fill list box with zones

//Capture AO(solve glitches)

//Complete Campaign and Wipe

