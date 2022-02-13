class CfgSounds
{
	sounds[] = {vn_build_1,vn_build_2,vn_build_3,Selfie,Bentham};
	class vn_build_1
	{
		sound[]		= { "@vn\sounds_f_vietnam\sfx\vn_build_1.ogg",1.0,1.0,30 };
		titles[]	= { "vn_build_1" };
	};
	class vn_build_2
	{
		sound[]		= { "@vn\sounds_f_vietnam\sfx\vn_build_2.ogg",1.0,1.0,30 };
		titles[]	= { "vn_build_2"};
	};
	class vn_build_3
	{
		sound[]		= { "@vn\sounds_f_vietnam\sfx\vn_build_3.ogg",1.0,1.0,30 };
		titles[]	= { "vn_build_3" };
	};
	class SelfieOLD
    {
        name = "Selfie";
        sound[] 	= { "custom\sounds\Selfie.ogg", 1, 1 };
        titles[] 	= { "Selfie" };
    };
	class Selfie
	{
		name = "Selfie with advanced subtitle options";
		sound[] = { "custom\sounds\Selfie.ogg", 1, 1 };

		titlesFont = "LCD14";		// titles font family
		titlesSize = 0.1;			// titles font size
		titlesStructured = 1;	// treat titles as Structured Text (see below)

		titles[] = {
			0, "<t color=""#ff0000"">Red Selfie text</t>",
			1, "<t color=""#00ff00"">Green Selfie text</t>"
		};
	};
	class Bentham
	{
		name = "HeyBenthamWheresMyCreama";
		sound[] 	= { "custom\sounds\HeyBenthamWheresMyCreama.ogg", 1, 1 };
        titles[] 	= { "Bentham" };
    };
	class Breath
	{
		name = "Breath";
		sound[] 	= { "custom\sounds\breath.ogg", 1, 1, 30 };
        titles[] 	= { 1, "Fooling your way to a kill" };
    };
};
