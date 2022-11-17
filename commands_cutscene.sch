USING "types.sch"
USING "commands_ped.sch"
USING "commands_entity.sch"
USING "generic.sch"

// a list of concatenated sections for a scene
ENUM CUTSCENE_SECTION
	CS_SECTION_1 = 1, 					//index into an array on the codes so hence the mis match. The cutscene documentation will always refer to section_1. 
	CS_SECTION_2 = 2, 
	CS_SECTION_3 = 4, 
	CS_SECTION_4 = 8,
	CS_SECTION_5 = 16,
	CS_SECTION_6 = 32,
	CS_SECTION_7 = 64,
	CS_SECTION_8 = 128,
	CS_SECTION_9 = 256, 
	CS_SECTION_10 = 512, 
	CS_SECTION_11 = 1024,
	CS_SECTION_12 = 2048,
	CS_SECTION_13 = 4096,
	CS_SECTION_14 = 8192,
	CS_SECTION_15 = 16384,
	CS_SECTION_16 = 32768,
	CS_SECTION_17 = 65536, 
	CS_SECTION_18 = 131072, 
	CS_SECTION_19 = 262144, 
	CS_SECTION_20 = 524288,
	CS_SECTION_21 = 1048576, 
	CS_SECTION_22 = 2097152, 
	CS_SECTION_23 = 4194304, 
	CS_SECTION_24 = 8388608, 
	CS_SECTION_25 = 16777216, 
	CS_SECTION_26 = 33554432, 
	CS_SECTION_27 = 67108864, 	
	CS_SECTION_28 = 134217728, 	
	CS_SECTION_29 = 268435456, 	
	CS_SECTION_30 = 536870912, 	
	CS_SECTION_31 = 1073741824
ENDENUM

ENUM CUTSCENE_USAGE
	CU_ANIMATE_EXISTING_SCRIPT_ENTITY,								//Get the cut scene to animate a script controlled entity
	CU_ANIMATE_AND_DELETE_EXISTING_SCRIPT_ENTITY,		//Get the cutscene to animate a script controled entity and then delete it. e.g. if the entity dies in the scene			
	CU_CREATE_AND_ANIMATE_NEW_SCRIPT_ENTITY,		//Get the cut scene to create and script that will be handed to script control at the end of the scene. e.g. player meets a buddy in the scene
	CU_DONT_ANIMATE_ENTITY													//Tell the the cutscene that this ped is dead and should not appera in the scene. 
ENDENUM

ENUM CUTSCENE_ENTITY_OPTION_FLAGS
	CEO_NONE = 0,						
	CEO_PRESERVE_FACE_BLOOD_DAMAGE = 1,	// If specified, leave facial blood decals when the cutscene starts. These are removed by default.
	CEO_PRESERVE_BODY_BLOOD_DAMAGE = 2,	// If specified, leave body damage decals when the cutscene starts. By default these are reduced, but not completely removed
	CEO_REMOVE_BODY_BLOOD_DAMAGE = 4,	// If specified, body damage decals will be completely cleared (instead of just reduced) when the cutscene starts
	CEO_CLONE_DAMAGE_TO_CS_MODEL = 8,	// If specified, if you have a reposition only entity, then any damage is cloned from that to the animated entity
	CEO_RESET_CAPSULE_AT_END = 16,		// If specified, the character's capsule will be reset so that it is vertical at the end of cutscenes.
	CEO_IS_CASCADE_SHADOW_FOCUS_ENTITY_DURING_EXIT = 32,	// If specified, this entity will be used as the focus for the cascade shadow system during seamless exits.  Required when characters get into vehicles at the end of cutscenes.
	CEO_IGNORE_MODEL_NAME = 64,								// If specified, force the cutscene to animate the registered ped using the given scene handle, even if the model name doesn't match.
	CEO_PRESERVE_HAIR_SCALE = 128,							// If specified, the characters hair scale is frozen when the cutscene starts.
	CEO_INSTANT_HAIR_SCALE_SETUP = 256,						// If specified, the characters hair scale will snap to it's new value when the cutscene starts, otherwise it will lerp.
	CEO_DONT_RESET_PED_CAPSULE = 512, 
	CEO_UPDATE_AS_REAL_DOOR = 1024
ENDENUM

ENUM CUTSCENE_PLAYBACK_FLAGS
	CUTSCENE_REQUESTED_FROM_WIDGET = 1,
	CUTSCENE_REQUESTED_DIRECTLY_FROM_SKIP = 2, 
	CUTSCENE_REQUESTED_FROM_Z_SKIP = 4, 
	CUTSCENE_REQUESTED_IN_MISSION = 8,
	CUTSCENE_PLAYBACK_FORCE_LOAD_AUDIO_EVENT = 16 // HACK HACK HACK - see B* 3705257. In some rare cases in GTA it's possible for the load audio event to not get sent from the data, which can lead to the cutscene audio failing. This flag can be used to fix that problem in those specific cases. So far this is only for a single scene - bs_2b_mcs_3.
ENDENUM

ENUM CUTSCENE_OPTION_FLAGS
	CUTSCENE_NO_OPTIONS = 0,
	CUTSCENE_PLAYER_TARGETABLE = 1,
	CUTSCENE_PROCGRASS_FORCE_HD = 2,
	CUTSCENE_DO_NOT_REPOSITION_PLAYER_TO_SCENE_ORIGIN = 4,
	CUTSCENE_NO_WIDESCREEN_BORDERS = 8, 
	CUTSCENE_DELAY_ENABLING_PLAYER_CONTROL_FOR_UP_TO_DATE_GAMEPLAY_CAMERA = 16,
	CUTSCENE_DO_NOT_CLEAR_PICKUPS = 32,
	CUTSCENE_CREATE_OBJECTS_AT_SCENE_ORIGIN = 64,
	CUTSCENE_PLAYER_EXITS_IN_A_VEHICLE = 128,
	CUTSCENE_PLAYER_FP_FLASH_MICHAEL = 256,		// Use Michael's colour coded first person transition flash if exiting the cutscene into first person (rather than the neutral flash)
	CUTSCENE_PLAYER_FP_FLASH_FRANKLIN = 512,	// Use Franklin's colour coded first person transition flash if exiting the cutscene into first person (rather than the neutral flash)
	CUTSCENE_PLAYER_FP_FLASH_TREVOR = 1024,		// Use Trevor's colour coded first person transition flash if exiting the cutscene into first person (rather than the neutral flash)
	CUTSCENE_SUPPRESS_FP_TRANSITION_FLASH = 2048, // Disable the first person transition flash at the end of the cutscene (use to disable the auto flash if you're anbout to transition to a scripted cam, etc)
	CUTSCENE_USE_FP_CAMERA_BLEND_OUT_MODE = 4096, // Allow the special first person only blend out mode when doing a standard camera blend back to first person mode.
	CUTSCENE_EXITS_INTO_COVER = 8192 //Informs the cutscene that the player is exiting into cover, so we can disable the first person flash when appropriate. 
ENDENUM

ENUM CUTSCENE_HANDLE_SEARCH_RESULT
	CHSR_NO_CUTSCENE_RUNNING = 0,
	CHSR_CUTFILE_STILL_LOADING = 1,
	CHSR_HANDLE_EXISTS = 2,
	CHSR_HANDLE_NOT_FOUND = 3
ENDENUM

ENUM CUTSCENE_ENTITY_STREAMING_FLAGS
	CES_NONE = 0,	
	CES_DONT_STREAM_AND_APPLY_VARIATIONS = 1
ENDENUM


//~> 						New Cut Scene Commands
//INFO: 
//PARAM NOTES:
//PURPOSE:  Loads, fades out and begins cutscene.
NATIVE PROC REQUEST_AND_START_CUTSCENE(STRING pCutName, CUTSCENE_PLAYBACK_FLAGS PlaybackFlags = CUTSCENE_REQUESTED_IN_MISSION) = "0x801ca94735fd5710"

//INFO: Should be used for cutscenes that have no fades e.g. a seamless scene
//PARAM NOTES:
//PURPOSE: Requests a cutscene: animations, models, audio etc. More Info..
NATIVE PROC REQUEST_CUTSCENE(STRING pCutName, CUTSCENE_PLAYBACK_FLAGS PlaybackFlags = CUTSCENE_REQUESTED_IN_MISSION) = "0xd536fd78d8a135f1"

//INFO: Include the sections you want to play, it will use the first section as the section to start from. 
//PARAM NOTES:
//PURPOSE: Requests a cutscene and tells it what sections to play, for branched cutscenes only. More Info..
NATIVE PROC REQUEST_CUTSCENE_WITH_PLAYBACK_LIST (STRING pCutName, CUTSCENE_SECTION CutsceneSection, CUTSCENE_PLAYBACK_FLAGS PlaybackFlags = CUTSCENE_REQUESTED_IN_MISSION ) = "0xcb3859a62f123aef"

//INFO:
//PARAM NOTES:
//PURPOSE: Releases a streamed scene, only need to call this if the scene hasnt started but you want to release it. 
NATIVE PROC REMOVE_CUTSCENE() = "0x6d23f8c14190d353"

//INFO:
//PARAM NOTES:
//PURPOSE: Get the flags the cutscene was started with. 
NATIVE FUNC BOOL IS_CUTSCENE_PLAYBACK_FLAG_SET(CUTSCENE_PLAYBACK_FLAGS flags) = "0x21839852f3265abe"

//~>				cutfile commands

//INFO:
//PARAM NOTES:
//PURPOSE: Requests a cut file, the metadata for a cutscene
NATIVE PROC REQUEST_CUT_FILE(STRING pCutName) = "0x8f907f205dd3e8f4"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns whether a cut file has loaded
NATIVE FUNC BOOL HAS_CUT_FILE_LOADED(STRING pCutName) = "0xfd4fb17e3c8b78b7"

//INFO:
//PARAM NOTES:
//PURPOSE: Releases a cut file, only need to call this if you're finished with cut file
NATIVE PROC REMOVE_CUT_FILE(STRING pCutName) = "0x3602199b816e7434"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the number of concats in the cut file
NATIVE FUNC INT GET_CUT_FILE_CONCAT_COUNT(STRING pCutName) = "0x90982a45733f1007"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the origin of the cut file
NATIVE FUNC VECTOR GET_CUT_FILE_OFFSET(STRING pCutName, int concatSection = 0) = "0x44ccf83f6406241a"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the rotation of the cut file
NATIVE FUNC VECTOR GET_CUT_FILE_ROTATION(STRING pCutName, int concatsection = 0) = "0x7e929cacf6fc1447"


//~> Play commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Starts a streamed cut scene.
NATIVE PROC START_CUTSCENE(CUTSCENE_OPTION_FLAGS flags = CUTSCENE_NO_OPTIONS) = "0xf44ee79112016b61"

//INFO: 
//PARAM NOTES:
//PURPOSE: Stops the cutscene that is currently playing and skips to the end of the scene.
NATIVE PROC STOP_CUTSCENE(bool DeleteRegisteredEntityIfNotGrabbedByScript = FALSE) = "0xedfedff9573687b1"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Stops the cutscene without fading and skipping to the end. 
NATIVE PROC  STOP_CUTSCENE_IMMEDIATELY() = "0xa43ada94826528f5"

//INFO: The given coords will act as the scene origin, round which all animations are authored.
//PARAM NOTES:
//PURPOSE: Starts a seamless cut scene at the given coords. More info..
NATIVE PROC START_CUTSCENE_AT_COORDS(VECTOR vPos, CUTSCENE_OPTION_FLAGS flags = CUTSCENE_NO_OPTIONS) = "0x275067d2dbc6803a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the origin of the scene for a given concat section. 
NATIVE PROC SET_CUTSCENE_ORIGIN(VECTOR vPos, FLOAT Heading, INT ConcatSection) = "0x421a38a0193e4ad2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the origin of the scene for a given concat section. 
NATIVE PROC SET_CUTSCENE_ORIGIN_AND_ORIENTATION(VECTOR vPos, VECTOR vRot, INT ConcatSection) = "0x3ac9c2334eac6f2f"

//INFO: This command only needs to be called if the script that loads the cutscene is not the same as the script that starts the scene
//This will largely be used by the main script requesting a scene and then allowing the mission script to start it.
//PARAM NOTES:
//PURPOSE: Allows a script to start a cutscene though it didnt request it. More info..
NATIVE PROC SET_SCRIPT_CAN_START_CUTSCENE(THREADID ScriptThread) = "0x24aaa4ac4a70a5fe"

//~><   CUTSCENE COMMANDS: Ped Seamless Registering Commands  ><~

//INFO: Use this to determine if a cutscene entity with the given scene handle exists in the currently running cut scene
//PARAM NOTES: sSceneHandle: The scene handle to search
//RETURNS:	CESR_NO_CUTSCENE_RUNNING - No cutscene requested or running
//			CESR_CUTFILE_STILL_LOADING - The cutfile hasn't loaded yet. Try again next frame.
//			CESR_HANDLE_EXISTS - An entity exists with the given scene handle
//			CESR_HANDLE_NOT_FOUND - No entity exists with the given scene handle
//PURPOSE: Returns a value specifying if an entity exists in the cutscene with the provided scene handle. More info
NATIVE FUNC CUTSCENE_HANDLE_SEARCH_RESULT DOES_CUTSCENE_HANDLE_EXIST(STRING sSceneHandle) = "0xed7e20741c7645d0"

//INFO: 
//PARAM NOTES: sSceneHandle: The name of the asscoiated on the cutscene side with that entites.
//						All entites exported for a cutscene have a unique name, this name references those objects.
//						To find scene handle for peds start your cutscene Rag->Cutscene->Start or End Selected Cutscene
//						tehn go to  Rag->Cutscene->Ped Variation-> Display Peds Names and Scene Handles
//						CU_ANIMATE_EXISTING_SCRIPT_ENTITY,								//Get the cut scene to animate a script controlled entity
//						CU_ANIMATE_AND_DELETE_EXISTING_SCRIPT_ENTITY,		//Get the cutscene to animate a script controled entity and then delete it. e.g. if the entity dies in the scene			
//						CU_CREATE_AND_ANIMATE_NEW_SCRIPT_ENTITY,		//Get the cut scene to create and script that will be handed to script control at the end of the scene. e.g. player meets a buddy in the scene
//						CU_DONT_ANIMATE_ENTITY													//Tell the the cutscene that this ped is dead and should not appera in the scene. 
//PURPOSE: Registers an entity with the cut scene system. More info
NATIVE PROC REGISTER_ENTITY_FOR_CUTSCENE(ENTITY_INDEX Entity, STRING sSceneHandle, CUTSCENE_USAGE Usage, MODEL_NAMES Model = DUMMY_MODEL_FOR_SCRIPT, CUTSCENE_ENTITY_OPTION_FLAGS Options = CEO_NONE) = "0x48f297980c708db7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tells the cut scene what vehicle the player will exit in so we can compute the correct view mode.
NATIVE PROC SET_VEHICLE_MODEL_PLAYER_WILL_EXIT_SCENE(MODEL_NAMES model) = "0x4aefc38782ce71c1"

//INFO: Call this command during the cutscene when REGISTER_ENTITY_FOR_CUTSCENE with CU_CREATE_AND_ANIMATE_NEW_SCRIPT_ENTITY is used.
//Only need to pass a Model in if the scene contains both an IG_ and CS_ version of the same entity. 
//e.g. The scene is seamless and will swap a the CS_ version for an IG_ at the end of the scene.
//PARAM NOTES:
//PURPOSE: Only use this to get the entity index of an entity registered to be created by the cutscene. More info..
NATIVE FUNC ENTITY_INDEX GET_ENTITY_INDEX_OF_REGISTERED_ENTITY (STRING sEntitySceneName, MODEL_NAMES Model = DUMMY_MODEL_FOR_SCRIPT) = "0xa77263f8c4822da4"

//INFO: These entitis can be deleted at any time, use the registered version to check for
//PARAM NOTES:
//PURPOSE: Get the enity index of a cutscene entity. More info..
NATIVE FUNC ENTITY_INDEX GET_ENTITY_INDEX_OF_CUTSCENE_ENTITY (STRING sEntitySceneName, MODEL_NAMES Model = DUMMY_MODEL_FOR_SCRIPT) = "0xe621fda45e283be7"

//INFO: Only need to pass the model in if the scene has both an IG_ and CS_ version of the same model
//PARAM NOTES:
//PURPOSE: Get the coords of this cutscene entity. More info..
NATIVE FUNC VECTOR GET_CUTSCENE_ENTITY_COORDS(STRING sEntitySceneName, MODEL_NAMES Model = DUMMY_MODEL_FOR_SCRIPT) = "0x8c6270017b363875"

//INFO: Only need to pass the model in if the scene has both an IG_ and CS_ version of the same model
//PARAM NOTES:
//PURPOSE: Get the heading of this cutscene entity. More info..
NATIVE FUNC FLOAT GET_CUTSCENE_ENTITY_HEADING(STRING sEntitySceneName, MODEL_NAMES Model = DUMMY_MODEL_FOR_SCRIPT) = "0xa1a74e5049e26197"

//INFO: Only need to pass the model in if the scene has both an IG_ and CS_ version of the same model
//PARAM NOTES:
//PURPOSE: Checks that this cutscene entity exits. More info..
NATIVE FUNC BOOL DOES_CUTSCENE_ENTITY_EXIST(STRING sEntitySceneName, MODEL_NAMES Model = DUMMY_MODEL_FOR_SCRIPT) = "0x3b4294cabaaf7b71"

//~><   CUTSCENE COMMANDS:  Commands  ><~

//INFO: Only need to pass the model in if the scene has both an IG_ and CS_ version of the same model
//PARAM NOTES:
//PURPOSE: Call this to check if a peds state can be set for start of the cutscene. 
NATIVE FUNC BOOL CAN_SET_ENTER_STATE_FOR_REGISTERED_ENTITY (STRING sSceneName, MODEL_NAMES Model = DUMMY_MODEL_FOR_SCRIPT) = "0x54bc7662cd08cf63"

//INFO:Only need to pass the model in if the scene has both an IG_ and CS_ version of the same model, which will be swapped 
//for a seamless exit ie the peds remain on screen at the end.  
// Allows the entites state to be set in the final frame of the cutscene.
// Typically this will be for giving the ped a task that will match the final state of the cut scene. e.g.
// If the ped exits in cover in the cutscene then you can use SET_PED_DIRECTLY_INTO_COVER when this returns true so that peds
// new task matches the exit state of the scene.
//
//PARAM NOTES:
//PURPOSE: Call this every frame to check if a peds state can be set for end of the cutscene. More info..
NATIVE FUNC BOOL CAN_SET_EXIT_STATE_FOR_REGISTERED_ENTITY (STRING sSceneName, MODEL_NAMES Model = DUMMY_MODEL_FOR_SCRIPT) = "0x6f2e1326db60d575"

//INFO:
//PARAM NOTES:
//	bHideNonRegisteredEntities: Can be used when cutting the camera on the exit state, in 
//	order to avoid issues with non script registered entities remaining on screen for a frame.
//PURPOSE: Check that the camera is just about to exit the cut scene. 
NATIVE FUNC BOOL CAN_SET_EXIT_STATE_FOR_CAMERA (BOOL bHideNonRegisteredEntities = FALSE ) = "0xa337b111df07bb88"

//~><	CUTSCENE COMMANDS: Trigger Area 

//INFO: Only need to pass the model in if the scene has both an IG_ and CS_ version of the same model
//PARAM NOTES:
//PURPOSE: Display the trigger area setup by SET_CUTSCENE_TRIGGER_AREA debug only.
NATIVE PROC DISPLAY_CUTSCENE_TRIGGER_AREA() = "0x1d8d8f95a3b496cd"

//INFO: Depending on the type of of cutscene it maybe possible orientate the cutscene over a range of angles. 
//PARAM NOTES: vOffsetFromSceneOrigin:Ofset vector for the centre of the trigger area
//fTriggerRadius: Size of the trigger area
//fTriggerOrient: The orientation of the trigger angle
//fTriggerAngle: The angle either side og the trigger oreient - defines the min and max angle for tiggereing
//PURPOSE: Allows you to set up a special cut scene trigger area. More info.
NATIVE PROC SET_CUTSCENE_TRIGGER_AREA(VECTOR vOffsetFromSceneOrigin, FLOAT fTriggerRadius, FLOAT fTriggerOrient, FLOAT fTriggerAngle) = "0x8dc4635f60bd9157"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the current player is in the trigger area. More info..
NATIVE FUNC BOOL IS_PLAYER_IN_CUTSCENE_TRIGGER_AREA() = "0x0cef59984c813512"


//~>                            Cutscene info commands 

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the current time in milliseconds on the whole concat scene time line..
//		Note: If you've specified a concat list to play, this value will not be continuous (it will jump
//		when skipping over the concat sections you exclude). IF you need the actual time the scene has been playing for
//		use GET_CUTSCENE_PLAY_TIME() below.
//																			 ||
//																			 \/
//		e.g. for a scene like this:		|  A (2secs) |  B (3 secs)   |   C (2 secs)  |  D (3 secs) |
//		if your concat list chooses to play A & C (omitting B and D) and the cutscene is half way through section C, 
//		this command will return 6 seconds (the current time on the whole concat timeline) even though the scene has
//		only been playing for 3 seconds from the player's perspective.
//
NATIVE FUNC INT GET_CUTSCENE_TIME() = "0xc10fe9051dbb0e91"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the current time of the scene in milliseconds..
//		Note: Unlike GET_CUTSCENE_TIME, if you've specified a concat list to play, this value will be continuous (i.e.
//		it should return the actual time the cutscene has been playing for).
//																			 ||
//																			 \/
//		e.g. for a scene like this:		|  A (2secs) |  B (3 secs)   |   C (2 secs)  |  D (3 secs) |
//		if your concat list chooses to play A & C (omitting B and D) and the cutscene is half way through section C, 
//		this command will return 3 seconds (the actual time we've been playing for).
//
NATIVE FUNC INT GET_CUTSCENE_PLAY_TIME() = "0x6450a93bbb26612e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the total duration in milliseconds of the loaded cutscene.
//			Note this does not take into account the concat list you specify from script, it's the total length of the whole cutscene asset.
NATIVE FUNC INT GET_CUTSCENE_TOTAL_DURATION() = "0x4d53e03fee2ecbe3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the end time of the currently running cutscene (taking into account the specified concat section play list, but in the whole concat scene timeline). Note that this may not be
//         the actual duration of the cutscene, it simply returns the end time of the last section you choose to play from the original asset. If your
//			concat list chooses to skip any sections, this will be beyond the actual duration of the scene as the player sees it. Use GET_CUTSCENE_PLAY_DURATION below
//			if you want the real time that the cutscene will play for based on your specified concat list.
// 
//		e.g. for a scene like this:		|  A (2secs) |  B (3 secs)   |   C (2 secs)  |  D (3 secs) |
//		if your concat list chooses to play A & C (omitting B and D) this command returns 7 seconds(the end time of C).
//		if your concat list chooses to play D (omitting A, B and C) this command returns 10 seconds (the end time of D).
//
//		Note: GET_CUTSCENE_TIME matches this behaviour, and will jump when skipping sections that aren't played, so you may be able to use that to make comparisons,
//		but potentially only within the first / last concat sections (depending on the play list you've specified).
NATIVE FUNC INT GET_CUTSCENE_END_TIME() = "0x9e3be9bfa8265d37"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the duration of the currently running cutscene (taking into account the the concat section list passed in from script and any gaps)
//		e.g. for a scene like this:		|  A (2secs) |  B (3 secs)   |   C (2 secs)  |  D (3 secs) |
//		if your concat list chooses to play A & C (omitting B and D) this command returns 4 seconds(the sum of the durations of A and C).
//		if your concat list chooses to play D (omitting A, B and C) this command returns 3 seconds (the duration of D).
//
//		Note: GET_CUTSCENE_TIME should NOT be used for comparisons with this, as it jumps when skipping over concat sections. use GET_CUTSCENE_PLAY_TIME instead.
NATIVE FUNC INT GET_CUTSCENE_PLAY_DURATION() = "0xf56cecf7a79fc764"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the player has skipped the cutscene
NATIVE FUNC BOOL WAS_CUTSCENE_SKIPPED() = "0x1af916e03ddf8d8a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the cutscene has finished playing. To be removed use IS_CUTSCENE_PLAYING.
NATIVE FUNC BOOL HAS_CUTSCENE_FINISHED() = "0xa08a61313445db46"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the cutscene is playing.
NATIVE FUNC BOOL IS_CUTSCENE_PLAYING() = "0xf34d8fcae3fd4ee4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if a cutscene is active, that it is either streaming or playing
NATIVE FUNC BOOL IS_CUTSCENE_ACTIVE() = "0x496531e41fcf5116"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that the cutscene has been streamed in.
NATIVE FUNC BOOL HAS_CUTSCENE_LOADED() = "0xc6398aabc3e92273"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that the cutscene has been streamed in.
NATIVE FUNC BOOL HAS_THIS_CUTSCENE_LOADED(STRING SceneName) = "0x1df60fc4fe15e596"


//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the current cutscene anim section playing. 
NATIVE FUNC INT GET_CUTSCENE_SECTION_PLAYING() = "0x2fceb6dbcb58a6b1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the current cutscene concat section playing. 
NATIVE FUNC INT GET_CUTSCENE_CONCAT_SECTION_PLAYING() = "0x6c748aa36e826fec"


#IF IS_DEBUG_BUILD
//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the length of the list of cutscenes. 
NATIVE FUNC INT GET_LENGTH_OF_CUTSCENE_LIST() = "0xe88a697db1c24def"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the name of the cutscene at the given index in the cutscene list. 
NATIVE FUNC STRING GET_CUTSCENE_NAME_FROM_LIST(INT CutSceneIndex) = "0x6c38d23666a23aa8"
#ENDIF	//	IS_DEBUG_BUILD

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that the scene is authorized for playback
NATIVE FUNC BOOL IS_CUTSCENE_AUTHORIZED(STRING SceneName) = "0x92e86d9b38775a8e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the name of the active cutscene
NATIVE FUNC STRING GET_CUTSCENE_NAME() = "0xbfc66c07ab993b54"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets whether the cutscene should use the replay recorder.
NATIVE PROC SET_CUTSCENE_REPLAY_RECORD(BOOL Enable) = "0xd540d662f1d9eb5a"

//~>                            Pad commands 

//INFO: 
//PARAM NOTES:
//PURPOSE: Lets the pad to be vibrated during a cutscene.
NATIVE PROC SET_PAD_CAN_SHAKE_DURING_CUTSCENE(bool bVibrate) = "0xee61327a6ed2d0b8"

//~>							Car Generator Commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Allow car gens to update whilst a cutscene is running.
NATIVE PROC SET_CAR_GENERATORS_CAN_UPDATE_DURING_CUTSCENE(bool bUpdate) = "0x986ebe24f15d47a8"

//~>							Mobile Phone Commands
//INFO: 
//PARAM NOTES:
//PURPOSE: Allow the mobile phone to be active during a cutscene
NATIVE PROC SET_CAN_USE_MOBILE_PHONE_DURING_CUTSCENE(bool bUpdate) = "0x98b4755ceceeda45"

//INFO: Only returns true if a scene is playing and 
// SET_CAN_USE_MOBILE_PHONE_DURING_CUTSCENE has been called. 
//PARAM NOTES:
//PURPOSE: Check to see if the mobile phone has been requested to be active during a cutscene.
NATIVE FUNC BOOL CAN_USE_MOBILE_PHONE_DURING_CUTSCENE() = "0xc1bce12fcf5f630d"

//~>                            Fade commands 

//INFO: Please note calling this command will affect the behaviour when skipping.
// If you call this you will have to make sure that the cutscene fades in at the end for both a skip and non skip, irrespective of any of  the values you have set.  
//PARAM NOTES:
//PURPOSE: Sets the fade values for the command, WARNING: Using this command will change the behaviour of the skip fades, so only call it of you NEED to override fade values. More info..
NATIVE PROC SET_CUTSCENE_FADE_VALUES(BOOL fadeOutAtStart = FALSE, BOOL fadeInAtStart = FALSE, BOOL fadeOutAtEnd = FALSE, BOOL fadeInAtEnd = FALSE) = "0x12b9b4a15f36e8b1"

//INFO: 
//PARAM NOTES: bFadeIn - Mark if fading in or out.
//			   iTimeToStay - No longer use
//			   bInstant - Put up blinders right away, no slide in.
//			   bManual - Set to ture if you are taking responsability for turning off the blinders
//PURPOSE: Sets the multihead board sides to emulate cutscene style multihead fades to cover up for problems with animations outside of widescreen areas.
NATIVE PROC SET_CUTSCENE_MULTIHEAD_FADE(BOOL bFadeIn, BOOL bInstant, BOOL bManual, bool bFullscreenMovie = false) = "0x10b0b2bec7faa911"

//INFO: 
//PARAM NOTES: bManual - Set to ture if you are taking responsability for turning off the blinders
//PURPOSE: Turns on/off manual control of the blinder system
NATIVE PROC SET_CUTSCENE_MULTIHEAD_FADE_MANUAL(BOOL bManual) = "0x6df9dcada6488c5d"

//INFO: 
//PARAM NOTES: iLinger - the amount of extra MS the blinders should linger for after the cutscene ends.
//PURPOSE: Some cutscenes show things that were assumed to be offscreen in singlehead. This will give us some time to hide anything in the sides we don't want players to see. This gets reset to 0 when the blinders are done fading out.
NATIVE PROC SET_CUTSCENE_MULTIHEAD_LINGER(INT iLinger) = "0xb816ac1bd0df1855"

//INFO: 
//PURPOSE: Tells you if the multihead faders are up.
NATIVE FUNC BOOL IS_MULTIHEAD_FADE_UP() = "0x131a54781ecd3789"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set if a cutscene can be skipped or not. 
NATIVE PROC  SET_CUTSCENE_CAN_BE_SKIPPED(bool bCanBeSkipped) = "0x9e174892f219031c"

//INFO: 
//PARAM NOTES:
//PURPOSE: If the player is not animated in the scene, set his new position at the scene end.
NATIVE PROC  SET_NON_ANIMATED_PLAYER_COORDS_FOR_END_OF_CUTSCENE(VECTOR vNewPos) = "0x3b5e3feab16677d8"

//->						Audio commands
//INFO: 
//PARAM NOTES:
//PURPOSE: Check that synced scene audio can be prepared during a cutscene if going into a lead out scene. 
NATIVE FUNC BOOL CAN_REQUEST_AUDIO_FOR_SYNCED_SCENE_DURING_CUTSCENE() = "0x985d752b282700f4"

//~>						HUD

//INFO: 
//PARAM NOTES:
//PURPOSE: Allow the Minimap to be displayed this update.  Cutscene must have been started with CUTSCENE_NO_WIDESCREEN_BORDERS to work.
NATIVE PROC  SET_CAN_DISPLAY_MINIMAP_DURING_CUTSCENE_THIS_UPDATE() = "0x7460f14068278ccb"

//~> 						Variation

//INFO:
//PARAM NOTES:
//PURPOSE: Check that you can request the component variation  
NATIVE FUNC BOOL CAN_REQUEST_ASSETS_FOR_CUTSCENE_ENTITY() = "0x2566f947aab7b2a7"

//INFO: Always apply this to the CS version, all cs variations will be copied to the ig version, if one is present. 
//Use CAN_REQUEST_ASSETS_FOR_CUTSCENE_ENTITY to be sure that the variation request has been made
//as this command only returns true FOR A SINGLE FRAME.
//PARAM NOTES:
//PURPOSE: Sets a request to change the component variation, only valid for a single frame. More info..
NATIVE PROC SET_CUTSCENE_PED_COMPONENT_VARIATION(STRING SceneHandle, PED_COMPONENT Component, INT Drawable, INT TextureID, MODEL_NAMES Model = DUMMY_MODEL_FOR_SCRIPT) = "0x44f8efeff0cda3fe"

//INFO: Always apply this to the CS version, all cs variations will be copied to the ig version, if one is present. 
//Use CAN_REQUEST_ASSETS_FOR_CUTSCENE_ENTITY to be sure that the variation request has been made
//as this command only returns true FOR A SINGLE FRAME.
//PARAM NOTES:
//PURPOSE:Requests the variations from one ped to be streamed and applied to the cutscene version. More info..
NATIVE PROC SET_CUTSCENE_PED_COMPONENT_VARIATION_FROM_PED(STRING SceneHandle, PED_INDEX SourcePed, MODEL_NAMES Model = DUMMY_MODEL_FOR_SCRIPT) = "0x3817498c7b1515dd"

//INFO: Always apply this to the CS version, all cs variations will be copied to the ig version, if one is present. 
//Use CAN_REQUEST_ASSETS_FOR_CUTSCENE_ENTITY to be sure that the variation request has been made
//as this command only returns true FOR A SINGLE FRAME.
//PARAM NOTES:
//PURPOSE: Sets a request to change the component prop, only valid for a single frame. More info..
NATIVE PROC SET_CUTSCENE_PED_PROP_VARIATION(STRING SceneHandle, PED_PROP_POSITION Position, INT NewPropIndex, int NewTextIndex = 0, MODEL_NAMES Model = DUMMY_MODEL_FOR_SCRIPT) = "0x6d690024c2bb1053"
//~>                            Multiplayer commands 

//INFO: 
//PARAM NOTES:
//PURPOSE: Will skip the cutscene when this is called with true.
NATIVE PROC NETWORK_SET_MOCAP_CUTSCENE_CAN_BE_SKIPPED(BOOL Skip) = "0x4370f25a335dd315"

//INFO 
//PARAM NOTES:
//PURPOSE: Check whether the cutscene has cut this frame.
NATIVE FUNC BOOL HAS_CUTSCENE_CUT_THIS_FRAME() = "0x0d080b3eba2acfb7"

//INFO 
//PARAM NOTES:
//PURPOSE: Check if cutscene models can be changed
NATIVE FUNC BOOL CAN_CHANGE_CUTSCENE_MODELS() = "0x1ed6ba3f9c6f146d"

//INFO 
//PARAM NOTES:SceneHandle: The scene handle of the cutscene entity.
//Model: The model asscocaited with a scene hadle, if left as dummy will just use the scene handle.
//NewModel: The new model you want to set for this cutscene entity
//PURPOSE: Set the model for a specific scene handle and model type
NATIVE PROC SET_CUTSCENE_ENTITY_MODEL(STRING SceneHandle, MODEL_NAMES Model = DUMMY_MODEL_FOR_SCRIPT, MODEL_NAMES NewModel = DUMMY_MODEL_FOR_SCRIPT) = "0x9fd979474a98dd0c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Apply streaming related flags to entities. 
NATIVE PROC SET_CUTSCENE_ENTITY_STREAMING_FLAGS(STRING SceneHandle, MODEL_NAMES Model = DUMMY_MODEL_FOR_SCRIPT, CUTSCENE_ENTITY_STREAMING_FLAGS StreamingFlags = CES_NONE ) = "0xf1bab9fb6bd91384"
