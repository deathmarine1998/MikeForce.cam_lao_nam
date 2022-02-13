if!(PlayPossum)then {
	hint "Playing possum...";
	player playAction "Die";
	PlayPossum=true;
	_breath = player addaction {("<t color=""#d0ffd5"">" + ("Groan") +"</t>"),"playSound3d [getMissionPath '\custom\sounds\breath.ogg', player]","",0,false,false,"",""};
	//_possum = player addaction {("<t color=""#62ff62"">" + ("Stop faking!") +"</t>"),"{hint 'OHNOOOOO'}","",0,false,true,"",""};
	PossumActionIds pushBack _breath;
	//PossumActionIds pushBack _possum;
} else {
	hint "Getting up!";
	player playAction "AgonyStop";
	PlayPossum=false;
	{
		player removeAction _x;
	}forEach PossumActionIds;
};
