class CfgFunctions
{
	class andy1
	{
		class FUBAR
		{
            file = "FUBAR";
			class FUBAR_initMan {};
            class FUBAR_map_iconUnit {};
		};
	};
};

class Extended_Init_EventHandlers
{
    class CAManBase
    {
        class ANDY1_FUBAR_initServer {
            serverInit = "_this call ANDY1_fnc_FUBAR_initMan;";
        };
    };
};

class cfgSounds 
{
    sounds[] = {};
    class FUBAR_RadioBeep
    {
        name = "FUBAR_RadioBeep";
        sound[] = {"FUBAR\radioBeep.ogg", 0.5, 1};
        titles[] = {};
    };
};