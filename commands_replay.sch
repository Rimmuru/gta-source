USING "rage_builtins.sch"
USING "types.sch"

// RM CODE: These must match the SCRIPT_ eOpenedFromSource values in Editor.h
ENUM EDITOR_OPENED_FROM_SOURCE
	EOFS_UNKNOWN = 0,
	EOFS_SCRIPT_DEFAULT,
	EOFS_SCRIPT_LANDING_PAGE,
	EOFS_SCRIPT_DIRECTOR
  ENDENUM

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC REGISTER_EFFECT_FOR_REPLAY_EDITOR( STRING EffectName, BOOL UseShallowDOF ) = "0x5ec89c2dd91d82a8"


//PURPOSE: Before the replay system can play back a clip, it attempts to create a save.
//			The scripts have to set up some save data before this save can take place.
//			Call this command every frame in one of the scripts.
//			As soon as it returns TRUE, set up the save data as if a quick save was taking place.
//			Once the data has been set up, call SET_SCRIPTS_HAVE_PREPARED_FOR_SAVE()
NATIVE FUNC BOOL REPLAY_SYSTEM_HAS_REQUESTED_SCRIPT_PREPARE_FOR_SAVE() = "0xe7328a11c596ff29"

//PURPOSE: Call this after the scripts have finished setting up the save data after REPLAY_SYSTEM_HAS_REQUESTED_SCRIPT_PREPARE_FOR_SAVE() returned TRUE
//PARAM NOTES: Call this with TRUE once the scripts have set up their save data in preparation for a quick save. Call with FALSE if the save data couldn't be safely set up
NATIVE PROC SET_SCRIPTS_HAVE_PREPARED_FOR_REPLAY_SAVE(BOOL bHavePrepared) = "0x3b284b169597b690"

//PURPOSE: Before the replay system can play back a clip, it requires all scripts to clean up.
//			Call this command every frame in a script such as main.sc
//			When the command returns TRUE, can you start a cleanup routine similar to that done at the beginning of a mission repeat
NATIVE FUNC BOOL REPLAY_SYSTEM_HAS_REQUESTED_A_SCRIPT_CLEANUP() = "0xd6f85402e4158ead"

//PURPOSE: Call this after the scripts have finished the cleanup routine that was triggered by REPLAY_SYSTEM_HAS_REQUESTED_A_SCRIPT_CLEANUP() returning TRUE
NATIVE PROC SET_SCRIPTS_HAVE_CLEANED_UP_FOR_REPLAY_SYSTEM() = "0x3031cdefbe2b11fb"

//PURPOSE: After REPLAY_SYSTEM_HAS_REQUESTED_A_SCRIPT_CLEANUP() returns TRUE for the first time, the replay code gives the scripts a few seconds to clean up before it clears the world.
//			To store Director Mode settings, the scripts may need to trigger an autosave.
//			Call SET_REPLAY_SYSTEM_PAUSED_FOR_SAVE(TRUE) once before triggering the autosave to prevent the replay code from timing out in the middle of the autosave.
//			Be sure to call SET_REPLAY_SYSTEM_PAUSED_FOR_SAVE(FALSE) after the autosave has finished.
NATIVE PROC SET_REPLAY_SYSTEM_PAUSED_FOR_SAVE(BOOL bPaused) = "0x210a725f491a5295"

//PURPOSE: Call this when the a mission restart is triggered in order to stop replay recording turn back on.
NATIVE PROC REPLAY_CONTROL_SHUTDOWN() = "0x1ca083636a4d1b3c"

//PURPOSE: Opens the Rockstar Editor
NATIVE PROC ACTIVATE_ROCKSTAR_EDITOR(EDITOR_OPENED_FROM_SOURCE eOpenedFromSource = EOFS_SCRIPT_DEFAULT) = "0x20c35e4c2507cc94"
