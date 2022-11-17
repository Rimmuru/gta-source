
USING "model_enums.sch"
USING "types.sch"

/*
ENUM TRIGGER_METHOD
	TRIGGER_METHOD_ATTRACTOR = 0,
	TRIGGER_METHOD_AT_ATTRACTOR,
	TRIGGER_METHOD_SCHEDULE,
	TRIGGER_METHOD_SCHEDULE_ARRIVAL,
	TRIGGER_METHOD_SCHEDULE_DEPARTURE
ENDENUM
*/

//INFO:
//PARAM NOTES: PercentageChance should be between 0 and 100. It determines the chance of a new ped with the model getting a brain. 
//							Set bScenarioPedsOnly to TRUE if you only want the brain to be given to peds created as scenario peds. 
//PURPOSE: Associates a script brain with a certain ped model. More info..
NATIVE PROC ADD_SCRIPT_TO_RANDOM_PED(STRING pScriptName, MODEL_NAMES PedModelHashKey, INT PercentageChance, BOOL bScenarioPedsOnly) = "0xdf6f66b0424a2fb3"

//INFO: 
//PARAM NOTES: Pass in -1 to ignore the object grouping.
//				SetToWhichThisBrainBelongs - Scripts can define one or more sets to which this brain belongs. The sets should have a value that is a power of 2 (1, 2, 4, 8, 16, 32, ...)
//PURPOSE: Associates a script brain with a certain object model. More info..
NATIVE PROC REGISTER_OBJECT_SCRIPT_BRAIN(STRING pScriptName, MODEL_NAMES ObjectModelHashKey, INT PercentageChance, FLOAT fActivationRange, INT ObjectGroupingID, INT SetToWhichThisBrainBelongs) = "0x59c0d9624ee20434"

//INFO:
//PARAM NOTES:
//PURPOSE: Checks that script brain is with a specific range of the player.
NATIVE FUNC BOOL IS_OBJECT_WITHIN_BRAIN_ACTIVATION_RANGE(OBJECT_INDEX ObjectIndex) = "0xa7fb445015a2af1c"

//INFO:This command gives a label to a brain script. The label is used by the artist when placing a 2d effect to launch the brain script. 
//			The SCRIPT line in the brain script should read a structure called coords_struct (defined in brains.sch) in the same way as an object brain script expects an OBJECT_INDEX. 
//			This structure currently contains up to 3 sets of coordinates. It always has at least one coord which gives the world position around which the brain is centred.
//			For simplicity BrainLabel has been removed so that the name the artits give the 2deffect needs to match the filename of the script. 
//PARAM NOTES: SetToWhichThisBrainBelongs - Scripts can define one or more sets to which this brain belongs. The sets should have a value that is a power of 2 (1, 2, 4, 8, 16, 32, ...)
//PURPOSE: Registers a point in a world script point. More info..
NATIVE PROC REGISTER_WORLD_POINT_SCRIPT_BRAIN(STRING pScriptName, FLOAT fActivationRange, INT SetToWhichThisBrainBelongs) = "0x9863a0ffed964a8b"

//INFO: You should call this command within all brain scripts attached to world points.
//PARAM NOTES:
//PURPOSE: Checks if the world point is out of activation range of the player called within the brain script. More info.. 
NATIVE FUNC BOOL IS_WORLD_POINT_WITHIN_BRAIN_ACTIVATION_RANGE() = "0xc92f9f18e020b461"


//INFO: 
//PARAM NOTES: set should be a power of 2 (1, 2, 4, 8, 16, 32, ...)
//PURPOSE: Enable all the script brains with the specified set id.
NATIVE PROC ENABLE_SCRIPT_BRAIN_SET( int set ) = "0x1b776653e338e92f"

//INFO: 
//PARAM NOTES: set should be a power of 2 (1, 2, 4, 8, 16, 32, ...)
//PURPOSE: Disable all the script brains with the specified set id
NATIVE PROC DISABLE_SCRIPT_BRAIN_SET( int set ) = "0xbce91688f4863b3c"


//PURPOSE: This command was added to help with debugging the brain scripts. All world point brains that are waiting for the player 
//			to move out of range will be immediately set back to the active state.
NATIVE PROC REACTIVATE_ALL_WORLD_BRAINS_THAT_ARE_WAITING_TILL_OUT_OF_RANGE() = "0xe8fd65c4cf1171e3"

//PURPOSE: This command was added to help with debugging the brain scripts. All object brains that are waiting for the player 
//			to move out of range will be immediately set back to the active state.
NATIVE PROC REACTIVATE_ALL_OBJECT_BRAINS_THAT_ARE_WAITING_TILL_OUT_OF_RANGE() = "0x683628636cbf3c22"


//PURPOSE: All world point brains with the given name that are waiting for the player to move out of range will be immediately set back to the active state.
NATIVE PROC REACTIVATE_NAMED_WORLD_BRAINS_WAITING_TILL_OUT_OF_RANGE(STRING pScriptName) = "0xc2f690e5f28eef10"

//PURPOSE: All object brains with the given name that are waiting for the player to move out of range will be immediately set back to the active state.
NATIVE PROC REACTIVATE_NAMED_OBJECT_BRAINS_WAITING_TILL_OUT_OF_RANGE(STRING pScriptName) = "0x25d05e6515ade956"


#IF IS_DEBUG_BUILD
//INFO: Call this in dev builds to activate any relevant object scripts on an object created through script.
//PARAM NOTES:
//PURPOSE:
NATIVE PROC DEBUG_APPLY_SCRIPT_BRAIN_ON_OBJECT(OBJECT_INDEX ObjectIndex) = "0x88dfc11056976551"
#ENDIF	//	IS_DEBUG_BUILD

//INFO: Associate a script brain with the peds created for a certain type of scenario. The scenario task will control the ped until the player
//			enters the activation range, at which point the script brain will stream in and launch.
//PARAM NOTES: pScenarioName - The scenario names can be found in X:\gta5\build\dev\common\data\scenarios.xml e.g. <Name>PROP_HUMAN_SEAT_BENCH</Name>
//				bSafeForNetworkGame - Always set this to FALSE for now
NATIVE PROC REGISTER_SCRIPT_BRAIN_FOR_SCENARIO_PEDS(STRING pScriptName, STRING pScenarioName, INT PercentageChance, FLOAT fActivationRange, BOOL bSafeForNetworkGame) = "0xe33fe82738acc589"

//INFO: Call this within the script brain for a scenario ped to check that the player is still within the 
//		activation range of the scenario ped
//PARAM NOTES: You can use fRangeExtension to add a small amount to the distance. This prevents the script from 
//		terminating then immediately relaunching if the player is just on the border of the activation range.
NATIVE FUNC BOOL IS_SCENARIO_PED_WITHIN_BRAIN_ACTIVATION_RANGE(PED_INDEX PedIndex, FLOAT fRangeExtension) = "0x1bb1d7346368b89b"

//INFO: Call this within the script brain for a scenario ped to specify that you don't want the brain 
//			to be retriggered for that ped if the current script ends and the player then re-enters the activation area
NATIVE PROC DONT_RETRIGGER_BRAIN_FOR_THIS_SCENARIO_PED(PED_INDEX PedIndex) = "0xf0fb7f52ef584ee6"


