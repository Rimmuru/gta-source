USING "rage_builtins.sch"
USING "types.sch"

//Sync with MarkerImportance
ENUM REPLAY_IMPORTANCE

	REPLAY_IMPORTANCE_LOWEST = 0,
	REPLAY_IMPORTANCE_LOW,
	REPLAY_IMPORTANCE_NORMAL,
	REPLAY_IMPORTANCE_HIGH,
	REPLAY_IMPORTANCE_HIGHEST
ENDENUM

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC INT START_RECORDING(STRING filename) = "0x80998b5b26c0ca74"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC STOP_RECORDING(INT recordingID, INT score) = "0x2eb276b9b09d8b92"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC CANCEL_RECORDING(INT recordingID) = "0x4af41fa0e0fe0b76"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC REPLAY_START_EVENT(REPLAY_IMPORTANCE importance = REPLAY_IMPORTANCE_HIGH) = "0x6cd556854f94f942"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC REPLAY_STOP_EVENT() = "0x8f70948cb5539beb"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC REPLAY_CANCEL_EVENT() = "0x6f274f8ab4f33116"


//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC REPLAY_RECORD_BACK_FOR_TIME(FLOAT backTime, FLOAT forwardTime = 2.0, REPLAY_IMPORTANCE importance = REPLAY_IMPORTANCE_HIGH) = "0x2da9f9d8e5530e75"

//INFO: 
//PARAM NOTES:
//PURPOSE:MissionName is appended to the end of the .clip filename. Filter groups clips together to define montages, use | as a seperator.
NATIVE PROC REPLAY_CHECK_FOR_EVENT_THIS_FRAME(STRING MissionName, STRING Filter = NULL) = "0x6d3f703013ed87d3"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC REPLAY_PREVENT_RECORDING_THIS_FRAME() = "0x16e09ccc0bd508da"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC REPLAY_RESET_EVENT_INFO() = "0xa315a56fdd0b167b"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC REPLAY_DISABLE_CAMERA_MOVEMENT_THIS_FRAME() = "0x584b286572b48431"

//INFO: Record voice over audio to play during clip playback
//PARAM NOTES:
//PURPOSE:
NATIVE PROC REPLAY_PLAY_VOICE_OVER(STRING context) = "0x0b7da47ac607b6e7"

ENUM GREATEST_MOMENT
	FIVE_START_CRIMINAL = 0,
	CHAIN_REACTION,
	BIRD_DOWN,
	SCOPED,
	TOP_GUN,
	AIRTIME,
	UNTOUCHABLE,
	WHEELIE_RIDER,
	BUCKLE_UP,
	ROLLED_OVER,
	DIZZYING_LAWS,
	YANK_THE_CORD,
	ANIMAUL,
	FULLY_MODDED,
	GLORY_HOLE
ENDENUM

//INFO: Record a greatest moment
//PARAM NOTES: greatestMoment - the greatest moment to record.
//			   startTime - the start time (from now) to start recording, in milliseconds. This can be in the past. e.g. -5000 means 5 seconds ago.
//			   duration - the duration of the clip to record.
//PURPOSE:
NATIVE PROC RECORD_GREATEST_MOMENT(GREATEST_MOMENT greatestMoment, INT startTime, INT duration) = "0xc8b81c93ffaa52d8"

// This is reproduced for code in ReplayControl.h (be sure to stay in sync)
ENUM REPLAY_START_PARAM
	REPLAY_START_PARAM_HIGHLIGHT = 0,
	REPLAY_START_PARAM_DIRECTOR
ENDENUM

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC START_REPLAY_RECORDING(REPLAY_START_PARAM startParam) = "0x406cba354a9f904a"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC STOP_REPLAY_RECORDING() = "0x0fccd6087693aa00"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC CANCEL_REPLAY_RECORDING() = "0x8fd3fca286c0f696"

//INFO: Saves out the current buffer up until that last time a save was called
//		Returns true if a clip has been marked for save, 
//		Returns false if the clip that was being saved is less then the minimum length
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC BOOL SAVE_REPLAY_RECORDING() = "0x1b2ffb76f23722db"

//INFO:
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC BOOL IS_REPLAY_RECORDING() = "0x6c85295e4e1fb8b3"

//INFO: Returns true if the replay system is ready to be used.
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC BOOL IS_REPLAY_INITIALIZED() = "0xc69ac9d8785cba51"

//INFO: Returns true if the replay system is currently availiable
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC BOOL IS_REPLAY_AVAILABLE() = "0x621211b143eb7d46"

//INFO: Returns true if there is enough space to record a replay
//PARAM NOTES:showWarning - If true, will displayed a warning message if disk space is low or empty.
//PURPOSE:
NATIVE FUNC BOOL IS_REPLAY_RECORD_SPACE_AVAILABLE(BOOL showWarning = FALSE) = "0xe829643614370a12"

