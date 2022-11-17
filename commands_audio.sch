USING "types.sch"
USING "commands_hud.sch"

ENUM ROMANS_MOOD
	ROMANS_MOOD_NORMAL = 0,
	ROMANS_MOOD_SAD,		//	1
	ROMANS_MOOD_SHAKEN_UP,	//	2
	ROMANS_MOOD_DRUNK		//	3
ENDENUM

ENUM BRIANS_MOOD
	BRIANS_MOOD_CLEAN = 0,
	BRIANS_MOOD_DRUG	//	1
ENDENUM

ENUM AUD_ANIMAL_MOOD
	AUD_ANIMAL_MOOD_ANGRY,
	AUD_ANIMAL_MOOD_PLAYFUL,
	
	AUD_ANIMAL_MOOD_NUM_MOODS
ENDENUM

ENUM AUD_CONTEXT_BLOCK_TARGET
	AUD_CONTEXT_BLOCK_PLAYER,
	AUD_CONTEXT_BLOCK_NPCS,
	AUD_CONTEXT_BLOCK_BUDDYS,
	AUD_CONTEXT_BLOCK_EVERYONE,
	
	AUD_CONTEXT_BLOCK_TARGETS_TOTAL
ENDENUM

//Must match the enum in speechAudioEntity
ENUM SPEECH_PARAMS
	SPEECH_PARAMS_STANDARD = 0,
	SPEECH_PARAMS_ALLOW_REPEAT,
	SPEECH_PARAMS_BEAT,
	SPEECH_PARAMS_FORCE,
	SPEECH_PARAMS_FORCE_FRONTEND,
	SPEECH_PARAMS_FORCE_NO_REPEAT_FRONTEND,
	SPEECH_PARAMS_FORCE_NORMAL,
	SPEECH_PARAMS_FORCE_NORMAL_CLEAR,
	SPEECH_PARAMS_FORCE_NORMAL_CRITICAL,
	SPEECH_PARAMS_FORCE_SHOUTED,
	SPEECH_PARAMS_FORCE_SHOUTED_CLEAR,
	SPEECH_PARAMS_FORCE_SHOUTED_CRITICAL,
	SPEECH_PARAMS_FORCE_PRELOAD_ONLY,
	SPEECH_PARAMS_MEGAPHONE,
	SPEECH_PARAMS_HELI,
	SPEECH_PARAMS_FORCE_MEGAPHONE,
	SPEECH_PARAMS_FORCE_HELI,
	SPEECH_PARAMS_INTERRUPT,

	SPEECH_PARAMS_INTERRUPT_SHOUTED,
	SPEECH_PARAMS_INTERRUPT_SHOUTED_CLEAR,
	SPEECH_PARAMS_INTERRUPT_SHOUTED_CRITICAL,
	SPEECH_PARAMS_INTERRUPT_NO_FORCE,
	SPEECH_PARAMS_INTERRUPT_FRONTEND,
	SPEECH_PARAMS_INTERRUPT_NO_FORCE_FRONTEND,
	SPEECH_PARAMS_ADD_BLIP,
	SPEECH_PARAMS_ADD_BLIP_ALLOW_REPEAT,
	SPEECH_PARAMS_ADD_BLIP_FORCE,
	SPEECH_PARAMS_ADD_BLIP_SHOUTED,
	SPEECH_PARAMS_ADD_BLIP_SHOUTED_FORCE,
	SPEECH_PARAMS_ADD_BLIP_INTERRUPT,
	SPEECH_PARAMS_ADD_BLIP_INTERRUPT_FORCE,
	SPEECH_PARAMS_FORCE_PRELOAD_ONLY_SHOUTED,
	SPEECH_PARAMS_FORCE_PRELOAD_ONLY_SHOUTED_CLEAR,
	SPEECH_PARAMS_FORCE_PRELOAD_ONLY_SHOUTED_CRITICAL,
	SPEECH_PARAMS_SHOUTED,
	SPEECH_PARAMS_SHOUTED_CLEAR,
	SPEECH_PARAMS_SHOUTED_CRITICAL
ENDENUM

ENUM POLICE_SCANNER_CAR_CODE
	CAR_CODE_A,
	CAR_CODE_B,
	CAR_CODE_C,
	CAR_CODE_D,
	CAR_CODE_E,
	CAR_CODE_F,
	CAR_CODE_G,
	CAR_CODE_H,
	CAR_CODE_I,
	CAR_CODE_J,
	CAR_CODE_K,
	CAR_CODE_L,
	CAR_CODE_M,
	CAR_CODE_N,
	CAR_CODE_O,
	CAR_CODE_P,
	CAR_CODE_Q,
	CAR_CODE_R,
	CAR_CODE_S,
	CAR_CODE_T,
	CAR_CODE_U,
	CAR_CODE_V,
	CAR_CODE_W,
	CAR_CODE_X,
	CAR_CODE_Y,
	CAR_CODE_Z
ENDENUM

//This will probably be removed once we have a code-side method for determining animal type
ENUM AUD_ANIMAL_TYPE
	AUD_ANIMAL_NONE = -1,
	AUD_ANIMAL_BOAR,
	AUD_ANIMAL_CHICKEN,
	AUD_ANIMAL_DOG,
	AUD_ANIMAL_DOG_ROTTWEILER,
	AUD_ANIMAL_HORSE,
	AUD_NUM_ANIMALS
ENDENUM

//Should match the audDamageReason enum 
ENUM AUD_DAMAGE_REASON
	AUD_DAMAGE_REASON_DEFAULT,
	AUD_DAMAGE_REASON_FALLING,
	AUD_DAMAGE_REASON_SUPER_FALLING,
	AUD_DAMAGE_REASON_SCREAM_PANIC,
	AUD_DAMAGE_REASON_SCREAM_PANIC_SHORT,
	AUD_DAMAGE_REASON_SCREAM_SCARED,
	AUD_DAMAGE_REASON_SCREAM_SHOCKED,
	AUD_DAMAGE_REASON_SCREAM_TERROR,
	AUD_DAMAGE_REASON_ON_FIRE,
	AUD_DAMAGE_REASON_DROWNING,
	AUD_DAMAGE_REASON_SURFACE_DROWNING,	// drowning on the surface of water, after we time out
	AUD_DAMAGE_REASON_INHALE,
	AUD_DAMAGE_REASON_EXHALE,
	AUD_DAMAGE_REASON_POST_FALL_GRUNT, 
	AUD_DAMAGE_REASON_ENTERING_RAGDOLL_DEATH,
	AUD_DAMAGE_REASON_EXPLOSION,
	AUD_DAMAGE_REASON_MELEE,
	AUD_DAMAGE_REASON_SHOVE,
	AUD_DAMAGE_REASON_WHEEZE,
	AUD_DAMAGE_REASON_COUGH,
	AUD_DAMAGE_REASON_TAZER,
	AUD_DAMAGE_REASON_EXHAUSTION,
	AUD_DAMAGE_REASON_CLIMB_LARGE,
	AUD_DAMAGE_REASON_CLIMB_SMALL,
	AUD_DAMAGE_REASON_JUMP,
	AUD_DAMAGE_REASON_COWER,
	AUD_DAMAGE_REASON_WHIMPER,
	AUD_DAMAGE_REASON_DYING_MOAN,
	AUD_DAMAGE_REASON_CYCLING_EXHALE,
	AUD_DAMAGE_REASON_PAIN_RAPIDS,
	AUD_DAMAGE_REASON_SNEEZE,
	AUD_DAMAGE_REASON_MELEE_SMALL_GRUNT,
	AUD_DAMAGE_REASON_MELEE_LARGE_GRUNT,
	AUD_DAMAGE_REASON_POST_FALL_GRUNT_LOW
ENDENUM

ENUM eAUDIBILITY
	AUD_AUDIBILITY_NORMAL = 0,
	AUD_AUDIBILITY_CLEAR,
	AUD_AUDIBILITY_CRITICAL,
	AUD_AUDIBILITY_LEAD_IN
ENDENUM

ENUM AUD_AIRCRAFT_WARNING_TYPES
	AUD_AW_TARGETED_LOCK = 0,
	AUD_AW_MISSLE_FIRED,
	AUD_AW_ACQUIRING_TARGET,
	AUD_AW_TARGET_ACQUIRED,
	AUD_AW_ALL_CLEAR,
	AUD_AW_PLANE_WARNING_STALL,
	AUD_AW_ALTITUDE_WARNING_LOW,
	AUD_AW_ALTITUDE_WARNING_HIGH,
	AUD_AW_ENGINE_1_FIRE,
	AUD_AW_ENGINE_2_FIRE,
	AUD_AW_ENGINE_3_FIRE,
	AUD_AW_ENGINE_4_FIRE,
	AUD_AW_DAMAGED_SERIOUS,
	AUD_AW_DAMAGED_CRITICAL,
	AUD_AW_OVERSPEED,
	AUD_AW_TERRAIN,
	AUD_AW_PULL_UP,
	AUD_AW_LOW_FUEL,

	AUD_AW_NUM_WARNINGS
ENDENUM

//~>					Mobile phone commands 

//INFO: 
//PARAM NOTES:	- SoundName - the identifier of the ringtone to play
//				- pedIndex - the ped to trigger the ringtone from
//				- triggerAsHudSound - whether to trigger as a HUD/2D sound or as part of the game world
//PURPOSE: Play the currently selected ringtone for the given ped
NATIVE PROC PLAY_PED_RINGTONE(STRING SoundName, ENTITY_INDEX pedIndex, BOOL triggerAsHudSound) = "0x1e3bdc4ee6f896d7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Check if a ped's ringtone is currently playing
NATIVE FUNC BOOL IS_PED_RINGTONE_PLAYING(ENTITY_INDEX pedIndex) = "0xa626788ab8ad0c3b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Stops a ped's ringtone from playing
NATIVE PROC STOP_PED_RINGTONE(ENTITY_INDEX pedIndex) = "0x1697786d4c3afedd"

//INFO:You must call this command before using ADD_LINE_TO_MOBILE_PHONE_CALL and START_MOBILE_PHONE_CALL to trigger a phone conversation. 
//			It clears out the array containing the lines of speech.
//PARAM NOTES:
//PURPOSE: Sets up the script for a n ew call. More info.. 
NATIVE PROC CREATE_NEW_MOBILE_PHONE_CALL() = "0xc0628219e2ceecca"

//INFO: 
//PARAM NOTES:
//PURPOSE: This command should be called for each line of speech in the conversation. 
NATIVE PROC ADD_LINE_TO_MOBILE_PHONE_CALL(INT SpeakerNumber, STRING Context, STRING Subtitle) = "0x415a44b6b08ba3bd"

//INFO:  Use after setting up the phone conversation with a series of calls to ADD_LINE_TO_MOBILE_PHONE_CALL, 
//PARAM NOTES:
//PURPOSE: Starts the actual mobile phone dialogue playing. More info..
NATIVE PROC START_MOBILE_PHONE_CALL(PED_INDEX FirstSpeakerIndex, STRING FirstVoiceName, PED_INDEX SecondSpeakerIndex, STRING SecondVoiceName, BOOL bDisplaySubtitles = TRUE, BOOL bAddToBriefing = TRUE) = "0xbf4ee5de6a77b5c0"

//INFO:  Use after setting up the phone conversation with a series of calls to ADD_LINE_TO_MOBILE_PHONE_CALL, 
//PARAM NOTES:
//PURPOSE: Starts the actual mobile phone dialogue playing. More info..
NATIVE PROC PRELOAD_MOBILE_PHONE_CALL(PED_INDEX FirstSpeakerIndex, STRING FirstVoiceName, PED_INDEX SecondSpeakerIndex, STRING SecondVoiceName, BOOL bDisplaySubtitles = TRUE, BOOL bAddToBriefing = TRUE) = "0xdc24accf6822b4f4"

//INFO: 
//PARAM NOTES:
//PURPOSE: CHecks if a mobile phone call is currently happening.
NATIVE FUNC BOOL IS_MOBILE_PHONE_CALL_ONGOING() = "0xa3329b7a7520670e"

//INFO: 
//PARAM NOTES:
//PURPOSE: CHecks if mobile phone interference is currently happening.
NATIVE FUNC BOOL IS_MOBILE_INTERFERENCE_ACTIVE() = "0x1b34b424d95b4726"

//~>					Television commands

//PARAM NOTES:
//PARAM NOTES:
//PURPOSE: Get the trigger time (in milliseconds) of the given laughter track marker
NATIVE FUNC INT GET_LAUGHTER_TRACK_MARKER_TIME(INT index) = "0xf2103de4d7d70cb6"

//PARAM NOTES:
//PARAM NOTES:
//PURPOSE: Get the time (in milliseconds) until the given laughter track marker
NATIVE FUNC INT GET_TIME_UNTIL_LAUGHTER_TRACK_MARKER(INT index) = "0x9c5b3a5cc7f42414"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the context for the given laughter track marker
NATIVE FUNC INT GET_LAUGHTER_TRACK_MARKER_CONTEXT(INT index) = "0xe14d445f73159e5a"

//INFO: 
//PARAM NOTES:
//PURPOSE:
//PURPOSE: Get the index of the next laughter track marker
NATIVE FUNC INT GET_NEXT_LAUGHTER_TRACK_MARKER_INDEX() = "0x2f4411c87dde1a26"

//INFO: 
//PARAM NOTES:
//PURPOSE:
//PURPOSE: Get the current play time (in milliseconds) of the current TV show
NATIVE FUNC INT GET_CURRENT_TV_SHOW_PLAY_TIME() = "0x0afc20d9778b66d8"

//INFO: 
//PARAM NOTES:
//PURPOSE:
//PURPOSE: Get the duration (in milliseconds) of the current TV show
NATIVE FUNC INT GET_CURRENT_TV_SHOW_DURATION() = "0x35435ad4c9024be3"

//~>					Conversation commands

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC CREATE_NEW_SCRIPTED_CONVERSATION() = "0x59b217a592638f61"

//INFO: 
//PARAM NOTES:
//PURPOSE:
//NOTE: Please keep all NATIVE definitions to a single line of code, to simplify some extra processing we need to do.
NATIVE PROC ADD_LINE_TO_CONVERSATION(INT SpeakerNumber, STRING Context, STRING Subtitle, INT ListenerNumber, INT volumeType, BOOL isRandom=FALSE,BOOL interruptible=TRUE, bool ducksRadio=TRUE, BOOL ducksScore=FALSE, eAUDIBILITY audibility=AUD_AUDIBILITY_NORMAL,BOOL headset = false, BOOL dontInterruptForSpecialAbility = false, BOOL isPadSpeakerRoute = false) = "0x532c5782ea6bc972"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC ADD_PED_TO_CONVERSATION(INT SpeakerConversationIndex, PED_INDEX SpeakerPedIndex, STRING VoiceName) = "0x5ec2d166433a9aa4"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_POSITION_FOR_NULL_CONV_PED(INT SpeakerConversationIndex, VECTOR Position) = "0x71995cc4a2efffbf"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_ENTITY_FOR_NULL_CONV_PED(INT SpeakerConversationIndex, ENTITY_INDEX EntityIndex) = "0x1522d4231a74d0b1"

//INFO: 
//PARAM NOTES: Pass in true to set conversation flow to be controlled by animation triggers.
//PURPOSE: Sets whether or not scripted conversation flow should be controlled by anim triggers
NATIVE PROC SET_CONVERSATION_AUDIO_CONTROLLED_BY_ANIM(BOOL enable) = "0x524b5fc84f413ca8"

//INFO: 
//PARAM NOTES: Pass in true to set conversation as placeholder.
//PURPOSE: Used to determine whether conversation should use robot speech or not
NATIVE PROC SET_CONVERSATION_AUDIO_PLACEHOLDER(BOOL isPlaceholder) = "0x91700cad9f55ac58"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC START_SCRIPT_CONVERSATION(BOOL DisplaySubtitles, BOOL addToBriefScreen = TRUE, BOOL cloneConversation = FALSE, BOOL Interruptible = TRUE) = "0x71c95eba363bdeae"

//INFO: 
//PARAM NOTES:
//PURPOSE: Similar to START_SCRIPT_CONVERSATION, except that is starts the conversation off paused.  A scripter can then kick off the conversation
//	by calling START_PRELOADED_CONVERSATION.  If they want to check that the conversation is done preloading, they can use GET_IS_PRELOADED_CONVERSATION_READY
NATIVE PROC PRELOAD_SCRIPT_CONVERSATION(BOOL DisplaySubtitles, BOOL addToBriefScreen = TRUE, BOOL cloneConversation = FALSE, BOOL Interruptible = TRUE) = "0x3a8253262437ba02"

//INFO: 
//PARAM NOTES: Returns true if a preloaded conversation has finished preparing.
//PURPOSE:
NATIVE FUNC BOOL GET_IS_PRELOADED_CONVERSATION_READY() = "0xd973aa641a1cf78a"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC START_PRELOADED_CONVERSATION() = "0xfed65f7c525b4505"


//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC START_SCRIPT_PHONE_CONVERSATION(BOOL DisplaySubtitles, BOOL addToBriefScreen = TRUE) = "0x0c42fe4000b56a73"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC PRELOAD_SCRIPT_PHONE_CONVERSATION(BOOL DisplaySubtitles, BOOL addToBriefScreen = TRUE) = "0xb4caa90c9dd83932"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC BOOL IS_SCRIPTED_CONVERSATION_ONGOING() = "0x2e5f8a288a954523"

//INFO: 
//PARAM NOTES:
//PURPOSE: Like the above, but returns false if ongoing and paused
NATIVE FUNC BOOL IS_UNPAUSED_SCRIPTED_CONVERSATION_ONGOING() = "0x39f0e915b5405d5e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the first batch of lines for the currently requested conversation have loaded successfully.
NATIVE FUNC BOOL IS_SCRIPTED_CONVERSATION_LOADED() = "0x6502d3750e36039c"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC INT GET_CURRENT_SCRIPTED_CONVERSATION_LINE() = "0xbee29398902b0435"

//INFO: 
//PARAM NOTES:
//PURPOSE: Like the above, but takes into account procedural speech lines (such as SFX_LOCATION and SFX_CODENAME) for when script
//			is displaying script-handled CNC subtitles.
NATIVE FUNC INT GET_CURRENT_UNRESOLVED_SCRIPTED_CONVERSATION_LINE() = "0xc5546e304079dfc4"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC PAUSE_SCRIPTED_CONVERSATION(BOOL FinishCurrentLine) = "0x1195a02d3676e6af"

//INFO: 
//PARAM NOTES:
//PURPOSE: Call this to restart a conversation that you have previously paused with PAUSE_SCRIPTED_CONVERSATION
NATIVE PROC RESTART_SCRIPTED_CONVERSATION() = "0x82b0661a78cc39cf"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC INT STOP_SCRIPTED_CONVERSATION(BOOL FinishCurrentLine) = "0xd681cc2bc1084db6"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SKIP_TO_NEXT_SCRIPTED_CONVERSATION_LINE() = "0x26a09f012cc86e43"

//INFO: 
//PARAM NOTES:	- Interrupter - the ped speaking
//				- Context - the line to use
//				- VoiceName - the voicename for the audio asset
//PURPOSE: Handles conversation interrupts, using the code-side system for improved timing and to minimize
//				unfriendly logic interactions.
NATIVE PROC INTERRUPT_CONVERSATION(PED_INDEX Interrupter, STRING Context, STRING VoiceName = NULL) = "0x372ebe3d1a45b19c"

//INFO: 
//PARAM NOTES:	- Interrupter - the ped speaking
//				- Context - the line to use
//				- VoiceName - the voicename for the audio asset
//PURPOSE: Handles conversation interrupts and pauses, using the code-side system for improved timing and to minimize
//				unfriendly logic interactions.
NATIVE PROC INTERRUPT_CONVERSATION_AND_PAUSE(PED_INDEX Interrupter, STRING Context, STRING VoiceName = NULL) = "0xc40ae949f4dd3bb4"

//INFO: 
//PARAM NOTES: TextLabel - all the text labels for filenames in AmericanDialogueFiles.txt appear to end with the letter 'A'
//				It is the script's responsibility to add this 'A' before calling GET_VARIATION_CHOSEN_FOR_SCRIPTED_LINE
//PURPOSE: Returns the variation chosen for a given scripte speech line.  Returns 0 if it hasn't been chosen yet.
//				Returns -1 if there is no conversation active or if the active conversation doesn't contain this line
//				or if the text label can't be found in the currently loaded text blocks
NATIVE FUNC INT GET_VARIATION_CHOSEN_FOR_SCRIPTED_LINE(STRING TextLabel) = "0xf278a9e1bf1bf431"

//~>						 Scripted speech related commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns a zone name for the emergency service call. More info..
NATIVE FUNC string GET_SPEECH_FOR_EMERGENCY_SERVICE_CALL() = "0x026b1f1220ef56de"

//~>						 Generic PlayAudioEvent commands

//INFO: If no Pan or SpeakerMask is set by the sound designer, the sound will play at the origin, as such this command should only really be used for playing hard-panned (i.e. stereo) sounds. 
//PARAM NOTES:
//PURPOSE: Plays back a specified sound. More info..
NATIVE PROC PLAY_AUDIO_EVENT(STRING EventName) = "0xf1f7acf1098ac6c3"

//INFO: 
//PARAM NOTES:
//PURPOSE:Plays back a specified sound from an entity
NATIVE PROC PLAY_AUDIO_EVENT_FROM_ENTITY(STRING EventName, ENTITY_INDEX EntityIndex) = "0x351fc09f9654684d"

//~>						 Script bank and sound playback commands

//INFO: 
//PARAM NOTES:
//PURPOSE:Registers a script with audio; a neccesary step for loading sound banks and using script sound commands. More info..
NATIVE PROC REGISTER_SCRIPT_WITH_AUDIO(BOOL InChargeOfAudio = FALSE) = "0xf30cf8286fba13d7"

//INFO: Doesn't need to be called in your cleanup, as TERMINATE_THIS_SCRIPT will take care of it. 
//PARAM NOTES:
//PURPOSE: Unregisters a script with audio. More info..
NATIVE PROC UNREGISTER_SCRIPT_WITH_AUDIO() = "0xab06b90f4b4b3043"

//INFO: Request audio for weapon to be loaded in
NATIVE FUNC BOOL REQUEST_WEAPON_AUDIO(STRING WeaponName) = "0x32b002f89adf91cb"

//INFO: Release weapon audio
NATIVE PROC RELEASE_WEAPON_AUDIO() = "0xa6c6ff0199ed0e97"

//INFO: Set minigun audio skips the spin-up - don't forget to set this back to false after using it!
NATIVE PROC SET_SKIP_MINIGUN_SPIN_UP_AUDIO(BOOL SetSkipSpinUp) = "0x4c4b1dd88e61c8ce"

CONST_INT AUD_NET_ALL_PLAYERS -1

//INFO: This is a legacy function: please use REQUEST_SCRIPT_AUDIO_BANK instead
//PARAM NOTES:
//PURPOSE: Requests and checks that a mission audio bank has loaded. More info..
NATIVE FUNC BOOL REQUEST_MISSION_AUDIO_BANK(STRING BankName, BOOL bOverNetwork = FALSE, INT playerBits = AUD_NET_ALL_PLAYERS) = "0x0fa01d16fcd94a52"

//INFO: This is a legacy function: please use REQUEST_SCRIPT_AUDIO_BANK instead
//PARAM NOTES:
//PURPOSE: Requests and checks that a ambient audio bank has loaded. More info..
NATIVE FUNC BOOL REQUEST_AMBIENT_AUDIO_BANK(STRING BankName, BOOL bOverNetwork = FALSE, INT playerBits = AUD_NET_ALL_PLAYERS) = "0x8133a5f807883bc6"

//INFO:  Usually this would be called in a loop which only exits when this returns true.
//PARAM NOTES:
//PURPOSE: Requests and checks that a script audio bank has loaded. More info..
NATIVE FUNC BOOL REQUEST_SCRIPT_AUDIO_BANK(STRING BankName, BOOL bOverNetwork = FALSE, INT playerBits = AUD_NET_ALL_PLAYERS) = "0x70f555a7ccf10659"

//INFO: This is a legacy function: please use HINT_SCRIPT_AUDIO_BANK instead
//PARAM NOTES:
//PURPOSE:Hints that this bank would be good to load if there are free slots.
// Does not guarentee loading of the bank - REQUEST_SCRIPT_AUDIO_BANK MUST be used as normal before triggering sounds" 
NATIVE FUNC BOOL HINT_MISSION_AUDIO_BANK(STRING BankName, BOOL bOverNetwork = FALSE, INT playerBits = AUD_NET_ALL_PLAYERS) = "0xf66ae48dbf243a5a"

//INFO: This is a legacy function: please use HINT_SCRIPT_AUDIO_BANK instead
//PARAM NOTES:
//PURPOSE:Hints that this bank would be good to load if there are free slots.
// Does not guarentee loading of the bank - REQUEST_SCRIPT_AUDIO_BANK MUST be used as normal before triggering sounds" 
NATIVE FUNC BOOL HINT_AMBIENT_AUDIO_BANK(STRING BankName, BOOL bOverNetwork = FALSE, INT playerBits = AUD_NET_ALL_PLAYERS) = "0x334012e4f8cc6bb6"

//INFO: Just need to be called once!
//PARAM NOTES:
//PURPOSE:Hints that this bank would be good to load if there are free slots.
// Does not guarentee loading of the bank - REQUEST_SCRIPT_AUDIO_BANK MUST be used as normal before triggering sounds" 
NATIVE FUNC BOOL HINT_SCRIPT_AUDIO_BANK(STRING BankName, BOOL bOverNetwork = FALSE, INT playerBits = AUD_NET_ALL_PLAYERS) = "0x925a4a10597c775b"

//INFO: This is a legacy function: please use REQUEST_SCRIPT_AUDIO_BANK instead
NATIVE PROC RELEASE_MISSION_AUDIO_BANK() = "0x4edac32c9daec24a"

//INFO: This is a legacy function: please use REQUEST_SCRIPT_AUDIO_BANK instead
//PARAM NOTES:
//PURPOSE:Unloads a ambient audio bank.
NATIVE PROC RELEASE_AMBIENT_AUDIO_BANK() = "0x257d98d0e399f50e"

//INFO: 
//PARAM NOTES:
//PURPOSE:Unloads all audio banks requested by this script.
NATIVE PROC RELEASE_SCRIPT_AUDIO_BANK() = "0xeccdae4e977bda96"

//INFO: 
//PARAM NOTES:
//PURPOSE:Unloads a named script audio bank.
NATIVE PROC RELEASE_NAMED_SCRIPT_AUDIO_BANK(STRING BankName) = "0xe24865b69d79521b"


//INFO: This is a legacy function: please use UNHINT_SCRIPT_AUDIO_BANK instead
NATIVE PROC UNHINT_MISSION_AUDIO_BANK() = "0xea96d35f9f4b6a76"

//INFO: This is a legacy function: please use UNHINT_SCRIPT_AUDIO_BANK instead
//PARAM NOTES:
//PURPOSE:Unloads a ambient audio bank.
NATIVE PROC UNHINT_AMBIENT_AUDIO_BANK() = "0x1469f0f8128b7961"

//INFO: 
//PARAM NOTES:
//PURPOSE:Unloads all audio banks requested by this script.
NATIVE PROC UNHINT_SCRIPT_AUDIO_BANK() = "0x2e8bce38b05b7486"

//INFO: 
//PARAM NOTES:
//PURPOSE:Unloads a named script audio bank.
NATIVE PROC UNHINT_NAMED_SCRIPT_AUDIO_BANK(STRING BankName) = "0x010e091f36dfd98f"

//INFO: 
//PARAM NOTES: Use the 'forceUpdate' flag to force a zone to become disabled even if its currently active. The default disabling behaviour
//			is that any state changes only get applied once the player leaves the zone.
//PURPOSE: Enables/disables an ambient zone for the duration of this script
NATIVE PROC SET_AMBIENT_ZONE_STATE(STRING zoneName, BOOL enabled, BOOL forceUpdate = FALSE) = "0x5fb1ee6965515598"

//INFO: 
//PARAM NOTES: Use the 'forceUpdate' flag to force a zone to become disabled even if its currently active. The default disabling behaviour
//			is that any state changes only get applied once the player leaves the zone.
//PURPOSE: Resets the ambient zone enabled/disabled status to its value before it was modified by this script
NATIVE PROC CLEAR_AMBIENT_ZONE_STATE(STRING zoneName, BOOL forceUpdate = FALSE) = "0x2e81e6da894efe9c"

//INFO: 
//PARAM NOTES: Use the 'forceUpdate' flag to force a zone to become disabled even if its currently active. The default disabling behaviour
//			is that any state changes only get applied once the player leaves the zone.
//PURPOSE: Enables/disables a list of ambient zones for the duration of this script
NATIVE PROC SET_AMBIENT_ZONE_LIST_STATE(STRING zoneListName, BOOL enabled, BOOL forceUpdate = FALSE) = "0x2d6eda8e0bc56548"

//INFO: 
//PARAM NOTES: Use the 'forceUpdate' flag to force a zone to become disabled even if its currently active. The default disabling behaviour
//			is that any state changes only get applied once the player leaves the zone.
//PURPOSE: Resets the list of ambient zones' enabled/disabled status back to their values before they were modified by this script
NATIVE PROC CLEAR_AMBIENT_ZONE_LIST_STATE(STRING zoneListName, BOOL forceUpdate = FALSE) = "0x9718190decc57d4b"

//INFO: 
//PARAM NOTES: Use the 'forceUpdate' flag to force a zone to become disabled even if its currently active. The default disabling behaviour
//			is that any state changes only get applied once the player leaves the zone.
//PURPOSE: Enables/disables an ambient zones persistently. This change will be saved to the user's savegame
NATIVE PROC SET_AMBIENT_ZONE_STATE_PERSISTENT(STRING zoneName, BOOL enabled, BOOL forceUpdate = FALSE) = "0x1f71b978fc3cf279"

//INFO: 
//PARAM NOTES: Use the 'forceUpdate' flag to force a zone to become disabled even if its currently active. The default disabling behaviour
//			is that any state changes only get applied once the player leaves the zone.
//PURPOSE: Enables/disables a list of ambient zones persistently. This change will be saved to the user's savegame
NATIVE PROC SET_AMBIENT_ZONE_LIST_STATE_PERSISTENT(STRING zoneListName, BOOL enabled, BOOL forceUpdate = FALSE) = "0x38275e3ea5d16c78"

//INFO: 
//PARAM NOTES:
//PURPOSE: Query whether the given ambient zone is allowed to be active
NATIVE FUNC BOOL IS_AMBIENT_ZONE_ENABLED(STRING zoneName) = "0xdf307e8b8dd36e6e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Refresh the closest shoreline using the nearest road position.
NATIVE PROC REFRESH_CLOSEST_OCEAN_SHORELINE() = "0x582b5cd0b4425222"

//INFO: This function returns a new SoundId, which is used for keeping track of sounds after they've been triggered - 
//			use this if you need to control a sound after it's been started, for instance to stop a looping sound, or to change a sound's pitch midway through playback.
//
//			The SoundId is always an integer greater than or equal to zero; if a playback function has a SoundId field but the sound doesn't need to be altered after 
//			triggering then pass a value of -1 for fire-and-forget playback, rather than getting a SoundId.
//
//			SoundIds can be reused, without needing to release them and grab a new one. If a sound's finished playing,
//			you can reuse its SoundId to kick off another one. If the sound's not finished playing,
//			it'll be stopped first (fading out or whatever is set up in RAVE by the sound designer), and the new one kicked off; usually it is safer to just get a new SoundId. 
//PARAM NOTES:
//PURPOSE: Gets an id of a triggered sound. More info..
NATIVE FUNC INT GET_SOUND_ID() = "0xa9adcc8d104aa552"

//INFO: This should be called once a sound has finished being manipulated by the script so that its SoundId can be released and re-used.
//PARAM NOTES:
//PURPOSE: Releases a sound ID.
NATIVE PROC RELEASE_SOUND_ID(INT SoundId) = "0xcdbcc1bc1184b002"

//INFO:If the sound is to be manipulated - i.e. stopped - then a SoundId should be acquired using GET_SOUND_ID(), otherwise use -1.
//			If this is used to play a sound for which no Pan or Speakermask is set by the sound designer, then the sound will play from the map's origin - 
//			therefore this should only be used to play frontend sounds like menu bleeps or other artificially panned effects.  
//PARAM NOTES:
//PURPOSE: Plays back a sound with the name SoundName. Optionally can specify a sound set which contains the named sound. More info..
NATIVE PROC PLAY_SOUND(INT SoundId, STRING SoundName, STRING SetName = NULL, BOOL bOverNetwork = FALSE, INT nNetworkRange = 0, BOOL enableOnReplay = TRUE) = "0x5e32098b63d0daa5"

//INFO: If the sound is to be manipulated - i.e. it's a looped that needs to be stopped - then a SoundId should be acquired and used, otherwise use -1 for this parameter.
//			If the sound has a Pan or a SpeakerMask set by the sound designer then the it will play using these settings, otherwise it will play from dead ahead (0°). 
//PARAM NOTES:
//PURPOSE: Plays back a sound "frontend" - at full volume, panned centrally. Optionally can specify a sound set which contains the sound. More info..
NATIVE PROC PLAY_SOUND_FRONTEND(INT SoundId, STRING SoundName, STRING SetName = NULL, BOOL enableOnReplay = TRUE) = "0x91dfc8f68f6d9b05"

NATIVE PROC PLAY_DEFERRED_SOUND_FRONTEND(STRING SoundName, STRING SetName = NULL) = "0xb17f82e32ffb8e31"

//INFO: The sound's position will track the entity's position as it moves. If the sound doesn't need to be stopped (or have variables passed to it) then a soundId of -1 should be used, 
//			otherwise use GET_SOUND_ID to assign the sound a SoundId. 
//PARAM NOTES:
//PURPOSE: Plays back a sound from an entity's location - specified by an Entity_Index. 
NATIVE PROC PLAY_SOUND_FROM_ENTITY(INT SoundId, STRING SoundName, ENTITY_INDEX EntityIndex, STRING SetName = NULL, BOOL bOverNetwork = FALSE, INT nNetworkRange = 0) = "0x979fc7400a5d0cd2"

//INFO: The sound's position will track the entity's position as it moves. If the sound doesn't need to be stopped (or have variables passed to it) then a soundId of -1 should be used, 
//			otherwise use GET_SOUND_ID to assign the sound a SoundId. 
//PARAM NOTES:
//PURPOSE: Plays back a sound from an entity's location - specified by an Entity_Index. 
NATIVE PROC PLAY_SOUND_FROM_ENTITY_HASH(INT SoundId, INT SoundNameHash, ENTITY_INDEX EntityIndex, INT SetName = 0, BOOL bOverNetwork = FALSE, INT nNetworkRange = 0) = "0xfd9b3f34e9fae19d"

//INFO: 
//PARAM NOTES: If isExteriorLoc is set to TRUE, then it will use a portal occlusion environmentGroup.  Only use this if the sound is playing outside and needs occlusion.
//PURPOSE: Plays back a sound from an absolute position. Optionally can specify a sound set which contains the sound.
NATIVE PROC PLAY_SOUND_FROM_COORD(INT SoundId, STRING SoundName, VECTOR position, STRING SetName = NULL, BOOL bOverNetwork = FALSE, INT nNetworkRange = 0, BOOL isExteriorLoc = FALSE) = "0xd336f8d9637b963f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Updates a playing sounds absolute position. 
NATIVE PROC UPDATE_SOUND_COORD(INT SoundId, VECTOR position) = "0xff8f59260b13a7c7"

//INFO: If the sound is a one-shot (non-looping) then a soundId of -1 is usually used
//			 If the sound needs to be stopped or uses variables then use GET_SOUND_ID to assign the sound a SoundId so it can be referred to later. 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC PLAY_FIRE_SOUND_FROM_COORD(INT SoundId, VECTOR position) = "0xd5176c9737691935"

//INFO: SoundId must be specified when triggering the sound effect and must be referred to when calling STOP_SOUND. 
//	Calling STOP_SOUND on a sound that has finished playing will have no ill effects as long as the SoundId hasn't been released; attempting to stop an invalid SoundId will cause an assert.
//PARAM NOTES:
//PURPOSE: Stops a playing sound by its sound id. More info..
NATIVE PROC STOP_SOUND(INT SoundId) = "0xf889bdfcc181ba9f"

//INFO: Convert from sound ID to network sound ID 
NATIVE FUNC INT GET_NETWORK_ID_FROM_SOUND_ID(INT SoundId) = "0x829eedc841317071"

//INFO: Convert from network sound ID to network ID 
NATIVE FUNC INT GET_SOUND_ID_FROM_NETWORK_ID(INT NetworkId) = "0xeb33eead608b9d11"

//INFO: This command allows a scripter to communicate with the sound engine in complex ways, 
//			by passing a floating point value to a specific sound object. This allows some nice effects such as adjusting the pitch of a sample being to be played back, 
//			or varying a lowpass cutoff. The VariableName parameter must be set up in RAVE (the audio scripting tool) as well as instruction on its usage on a case-by-case
//			basis therefore a sound designer must be consulted with before using this command. 
//PARAM NOTES:
//PURPOSE: Sets a variable on a sound. More info..
NATIVE PROC SET_VARIABLE_ON_SOUND(INT SoundId, STRING VariableName, FLOAT VariableValue) = "0x57973addf2bfaa90"

//INFO: This command allows a scripter to communicate with the sound engine in complex ways, 
//			by passing a floating point value to a specific sound object. This allows some nice effects such as adjusting the pitch of a sample being to be played back, 
//			or varying a lowpass cutoff. The VariableName parameter must be set up in RAVE (the audio scripting tool) as well as instruction on its usage on a case-by-case
//			basis therefore a sound designer must be consulted with before using this command. 
//PARAM NOTES:
//PURPOSE: Sets a variable on the current streaming sound. More info..
NATIVE PROC SET_VARIABLE_ON_STREAM(STRING VariableName, FLOAT VariableValue) = "0xaba36033671c7e58"



//INFO: 
//PARAM NOTES:
//PURPOSE: CHecks that a sound has finished playing. 
NATIVE FUNC BOOL HAS_SOUND_FINISHED(INT SoundId) = "0x78d9add511fead8b"

//~>						 Commands to play ambient speech from a ped
//INFO: 
//PARAM NOTES:  PedIndex		- index of the actor to speak
//				Context			- speech context to be spoken
//				Params			- name of the speechParam rave game object to look to for various details on how it should be played
//				SyncOverNetwork - Indicates whether this speech should automatically by played on clones of the ped on remote machines
//PURPOSE: Plays a line of a ped's ambient dialogue and clones it across the network. More info..
NATIVE PROC PLAY_PED_AMBIENT_SPEECH_AND_CLONE_NATIVE(PED_INDEX PedIndex, STRING Context, STRING Params, BOOL SyncOverNetwork = TRUE) = "0x9368ec1f042bf3f9"

//~>						 Commands to play ambient speech from a ped
//INFO: 
//PARAM NOTES:  PedIndex		- index of the actor to speak
//				Context			- speech context to be spoken
//				Params			- name of the speechParam rave game object to look to for various details on how it should be played
//				SyncOverNetwork - Indicates whether this speech should automatically by played on clones of the ped on remote machines
//PURPOSE: Plays a line of a ped's ambient dialogue. More info..
NATIVE PROC PLAY_PED_AMBIENT_SPEECH_NATIVE(PED_INDEX PedIndex, STRING Context, STRING Params, BOOL SyncOverNetwork = TRUE) = "0xb0c559bd7d5d270d"

//INFO: 
//PARAM NOTES:   PedIndex - index of the actor to speak
//				Context - speech context to be spoken
//				VoiceName - Usually based upon the ped, but wject to look to for various details on how it should be played
//PURPOSE: Plays a line of ambient dialogue in a ith this function you can override it
//				Params - name of the speechParam rave game obdifferent ped's voice. More info..
NATIVE PROC PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(PED_INDEX PedIndex, STRING Context, STRING VoiceName, STRING Params, BOOL SyncOverNetwork = FALSE) = "0x49c085d876a9986d"

//INFO: 
//PARAM NOTES:	
//				Context - speech context to be spoken
//				VoiceName - There is no ped so you need to specify which voice to use
//				Position - Where the speech will be played from
//				Params - name of the speechParam rave game object to look to for various details on how it should be played
//PURPOSE:  Plays a line of dialogue from a position through a global entity so there is no ped required
NATIVE PROC PLAY_AMBIENT_SPEECH_FROM_POSITION_NATIVE(STRING Context, STRING VoiceName, VECTOR Position, STRING SpeechParams) = "0x1f2f249740361ec0"

FUNC STRING AUDIO_SPEECH_GET_PARAM_STRING_FROM_ENUM(SPEECH_PARAMS mood)
	// handy-dandy regex:
	// FIND: \t*SPEECH_PARAMS_([A-Z_]+),
	// REPLACE: CASE SPEECH_PARAMS_$1	RETURN "$1"
	SWITCH mood
		CASE SPEECH_PARAMS_STANDARD								RETURN "SPEECH_PARAMS_STANDARD"
		CASE SPEECH_PARAMS_ALLOW_REPEAT							RETURN "SPEECH_PARAMS_ALLOW_REPEAT"
		CASE SPEECH_PARAMS_BEAT									RETURN "SPEECH_PARAMS_BEAT"
		CASE SPEECH_PARAMS_FORCE								RETURN "SPEECH_PARAMS_FORCE"
		CASE SPEECH_PARAMS_FORCE_FRONTEND						RETURN "SPEECH_PARAMS_FORCE_FRONTEND"
		CASE SPEECH_PARAMS_FORCE_NO_REPEAT_FRONTEND				RETURN "SPEECH_PARAMS_FORCE_NO_REPEAT_FRONTEND"
		CASE SPEECH_PARAMS_FORCE_NORMAL							RETURN "SPEECH_PARAMS_FORCE_NORMAL"
		CASE SPEECH_PARAMS_FORCE_NORMAL_CLEAR					RETURN "SPEECH_PARAMS_FORCE_NORMAL_CLEAR"
		CASE SPEECH_PARAMS_FORCE_NORMAL_CRITICAL				RETURN "SPEECH_PARAMS_FORCE_NORMAL_CRITICAL"
		CASE SPEECH_PARAMS_FORCE_SHOUTED						RETURN "SPEECH_PARAMS_FORCE_SHOUTED"
		CASE SPEECH_PARAMS_FORCE_SHOUTED_CLEAR					RETURN "SPEECH_PARAMS_FORCE_SHOUTED_CLEAR"
		CASE SPEECH_PARAMS_FORCE_SHOUTED_CRITICAL				RETURN "SPEECH_PARAMS_FORCE_SHOUTED_CRITICAL"
		CASE SPEECH_PARAMS_FORCE_PRELOAD_ONLY					RETURN "SPEECH_PARAMS_FORCE_PRELOAD_ONLY"
		CASE SPEECH_PARAMS_MEGAPHONE							RETURN "SPEECH_PARAMS_MEGAPHONE"
		CASE SPEECH_PARAMS_HELI									RETURN "SPEECH_PARAMS_HELI"
		CASE SPEECH_PARAMS_FORCE_MEGAPHONE						RETURN "SPEECH_PARAMS_FORCE_MEGAPHONE"
		CASE SPEECH_PARAMS_FORCE_HELI							RETURN "SPEECH_PARAMS_FORCE_HELI"
		CASE SPEECH_PARAMS_INTERRUPT							RETURN "SPEECH_PARAMS_INTERRUPT"
		CASE SPEECH_PARAMS_INTERRUPT_SHOUTED					RETURN "SPEECH_PARAMS_INTERRUPT_SHOUTED"
		CASE SPEECH_PARAMS_INTERRUPT_SHOUTED_CLEAR				RETURN "SPEECH_PARAMS_INTERRUPT_SHOUTED_CLEAR"
		CASE SPEECH_PARAMS_INTERRUPT_SHOUTED_CRITICAL			RETURN "SPEECH_PARAMS_INTERRUPT_SHOUTED_CRITICAL"
		CASE SPEECH_PARAMS_INTERRUPT_NO_FORCE					RETURN "SPEECH_PARAMS_INTERRUPT_NO_FORCE"	
		CASE SPEECH_PARAMS_INTERRUPT_FRONTEND					RETURN "SPEECH_PARAMS_INTERRUPT_FRONTEND"
		CASE SPEECH_PARAMS_INTERRUPT_NO_FORCE_FRONTEND			RETURN "SPEECH_PARAMS_INTERRUPT_NO_FORCE_FRONTEND"
		CASE SPEECH_PARAMS_ADD_BLIP								RETURN "SPEECH_PARAMS_ADD_BLIP"
		CASE SPEECH_PARAMS_ADD_BLIP_ALLOW_REPEAT				RETURN "SPEECH_PARAMS_ADD_BLIP_ALLOW_REPEAT"
		CASE SPEECH_PARAMS_ADD_BLIP_FORCE						RETURN "SPEECH_PARAMS_ADD_BLIP_FORCE"
		CASE SPEECH_PARAMS_ADD_BLIP_SHOUTED						RETURN "SPEECH_PARAMS_ADD_BLIP_SHOUTED"
		CASE SPEECH_PARAMS_ADD_BLIP_SHOUTED_FORCE				RETURN "SPEECH_PARAMS_ADD_BLIP_SHOUTED_FORCE"
		CASE SPEECH_PARAMS_ADD_BLIP_INTERRUPT					RETURN "SPEECH_PARAMS_ADD_BLIP_INTERRUPT"
		CASE SPEECH_PARAMS_ADD_BLIP_INTERRUPT_FORCE				RETURN "SPEECH_PARAMS_ADD_BLIP_INTERRUPT_FORCE"
		CASE SPEECH_PARAMS_FORCE_PRELOAD_ONLY_SHOUTED			RETURN "SPEECH_PARAMS_FORCE_PRELOAD_ONLY_SHOUTED"
		CASE SPEECH_PARAMS_FORCE_PRELOAD_ONLY_SHOUTED_CLEAR		RETURN "SPEECH_PARAMS_FORCE_PRELOAD_ONLY_SHOUTED_CLEAR"
		CASE SPEECH_PARAMS_FORCE_PRELOAD_ONLY_SHOUTED_CRITICAL	RETURN "SPEECH_PARAMS_FORCE_PRELOAD_ONLY_SHOUTED_CRITICAL"
		CASE SPEECH_PARAMS_SHOUTED								RETURN "SPEECH_PARAMS_SHOUTED"
		CASE SPEECH_PARAMS_SHOUTED_CLEAR						RETURN "SPEECH_PARAMS_SHOUTED_CLEAR"
		CASE SPEECH_PARAMS_SHOUTED_CRITICAL						RETURN "SPEECH_PARAMS_SHOUTED_CRITICAL"
	ENDSWITCH
	STRING nullString = NULL
	RETURN nullString
ENDFUNC


PROC PLAY_PED_AMBIENT_SPEECH(PED_INDEX PedIndex, STRING Context, SPEECH_PARAMS Params = SPEECH_PARAMS_ADD_BLIP)
	PLAY_PED_AMBIENT_SPEECH_NATIVE(PedIndex,Context,AUDIO_SPEECH_GET_PARAM_STRING_FROM_ENUM(Params))
ENDPROC

PROC PLAY_PED_AMBIENT_SPEECH_WITH_VOICE(PED_INDEX PedIndex ,STRING Context, STRING VoiceName, SPEECH_PARAMS Params = SPEECH_PARAMS_ADD_BLIP)
	PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(PedIndex,Context,VoiceName,AUDIO_SPEECH_GET_PARAM_STRING_FROM_ENUM(Params))
ENDPROC

PROC PLAY_AMBIENT_SPEECH_FROM_POSITION(STRING Context, STRING VoiceName, VECTOR Position, SPEECH_PARAMS Params = SPEECH_PARAMS_ADD_BLIP)
	PLAY_AMBIENT_SPEECH_FROM_POSITION_NATIVE(Context,VoiceName,Position,AUDIO_SPEECH_GET_PARAM_STRING_FROM_ENUM(Params))
ENDPROC

PROC PLAY_PED_AMBIENT_SPEECH_AND_CLONE(PED_INDEX PedIndex,STRING Context, SPEECH_PARAMS Params = SPEECH_PARAMS_ADD_BLIP)
	PLAY_PED_AMBIENT_SPEECH_AND_CLONE_NATIVE(PedIndex,Context,AUDIO_SPEECH_GET_PARAM_STRING_FROM_ENUM(Params))
ENDPROC

//INFO: 
//PURPOSE: Force Trevor to play the line of speech that goes along with his special ability
NATIVE PROC MAKE_TREVOR_RAGE() = "0x754469aa9ce16092"

//INFO: 
//PURPOSE: Override Trevor's rage context with a different one
NATIVE PROC OVERRIDE_TREVOR_RAGE(STRING context) = "0x7213963684b1782c"

//INFO: 
//PURPOSE: Undo the overriding of Trevor's rage context
NATIVE PROC RESET_TREVOR_RAGE() = "0x3007781d739cd0e2"

//INFO: 
//PARAM NOTES:   PedIndex - index of the actor to make angry
//				IsAngry - True to turn it on, False to turn it off
//PURPOSE: Sets a player ped to use his ANGRY speech contexts (set back to false when calling script is finished)
NATIVE PROC SET_PLAYER_ANGRY(PED_INDEX PedIndex, BOOL IsAngry) = "0x748643a0d9d0e927"

//INFO: 
//PARAM NOTES:   PedIndex - index of the actor to make angry
//				 TimeInMs - How long the player should remain angry
//PURPOSE: Sets a player ped to use his ANGRY speech contexts (set back to false when calling the set time is up)
NATIVE PROC SET_PLAYER_ANGRY_SHORT_TIME(PED_INDEX PedIndex, INT TimeInMs = 60000) = "0x9fec63369ba1e0ea"

//INFO: 
//PARAM NOTES:  PedIndex		- index of the actor to speak
//				DamageReason    - Reason for the Pain
//				RawDamage		- Damage value (usually won't be needed)
//				SyncOverNetwork - indicates whether this should automatically play on a locally controlled ped on remote machines
//PURPOSE: Plays a pain sound from the ped
NATIVE PROC PLAY_PAIN(PED_INDEX PedIndex, AUD_DAMAGE_REASON DamageReason, FLOAT RawDamage=0.0, BOOL SyncOverNetwork=FALSE) = "0x35083f820751423c"

//INFO: 
//PURPOSE: Triggers speech preloaded using PLAY_PED_AMBIENT_SPEECH() with PreloadOnly==TRUE. Use STOP_PED_SPEAKING to cancel preloaded speech.
NATIVE PROC PLAY_PRELOADED_SPEECH(PED_INDEX PedIndex) = "0x05bdbb07a1062ef1"

//INFO: This doesn't stop a piece of dialogue that has been triggered.
//			 This stops the ability to force ambient dialogue if set to true - however setting it to false, then triggering a context, then setting it to true again will allow this. 
//			 Nb. This does not sync over the network, it will only affect peds locally. Use STOP_PED_SPEAKING_SYNCED if you need to affect peds on other machines too.
//PARAM NOTES:
//PURPOSE:Stops a ped from saying any of their ambient dialogue. More info..
NATIVE PROC STOP_PED_SPEAKING(PED_INDEX PedIndex, BOOL ShouldDisable ) = "0x059473086913178c"

//INFO: Blocks *all* speech playing on the given ped, including speech triggered by script commands such as PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE
//			The flag itself is not synced, it must be called on each machine that wishes to suppress the speech.
//			The SuppressOutgoingNetworkSpeech flag can be set to false if you want speech triggered locally through PLAY_AMBIENT_SPEECH calls to still be audible
//			on remote machines, even though it was blocked on the local one.
NATIVE PROC BLOCK_ALL_SPEECH_FROM_PED(PED_INDEX PedIndex, BOOL ShouldBlock, BOOL SuppressOutgoingNetworkSpeech = TRUE) = "0x94a6586aee4bb68e"

//INFO: This doesn't stop a piece of dialogue that has been triggered.
//			 This stops the ability to force ambient dialogue if set to true - however setting it to false, then triggering a context, then setting it to true again will allow this. 
//			 The ped will also be prevented from speaking on remote machines. Use STOP_PED_SPEAKING if you just want to affect the local machine.
//PARAM NOTES:
//PURPOSE:Stops a ped from saying any of their ambient dialogue. More info..
NATIVE PROC STOP_PED_SPEAKING_SYNCED(PED_INDEX PedIndex, BOOL ShouldDisable ) = "0x3124fcfd969b6839"

//INFO: 
//PARAM NOTES:	-GroupName	- the name of the context group to be blocked
//				-Target		- the group of peds that should use the context (player, NPC, buddy, everyone)
//PURPOSE: Stop a certain group of peds from using a certain group of speech contexts.  Note that the block will be automatically removed
//			when the calling script finishes
NATIVE PROC BLOCK_SPEECH_CONTEXT_GROUP(STRING GroupName, AUD_CONTEXT_BLOCK_TARGET Target) = "0x98357e1b4e44f841"

//INFO: 
//PARAM NOTES:	-GroupName	- the name of the context group to unblock
//PURPOSE:	This removes all instances of a given context block.  Unfortunately, this means that if you have called this once blocking the player,
//			then later to block NPCs, and only want the player block removed, you'll have to once again call BLOCK_SPEECH... with NPCs as the target
//			after this is called.
NATIVE PROC UNBLOCK_SPEECH_CONTEXT_GROUP(STRING GroupName) = "0x509e14b39e123d75"

//INFO: 
//PARAM NOTES:	-PedIndex	- index for the ped to modify
//				-IsBuddy	- true to set, false to unset
//PURPOSE:	Flags a ped as a buddy.  This must be called on a ped in order for them to be context blocked when the BUDDYS target is used.
NATIVE PROC SET_IS_BUDDY(PED_INDEX PedIndex, BOOL IsBuddy ) = "0xc7ad2f9591529ba4"

//INFO: Disable ped pain audio
//PARAM NOTES:
//PURPOSE:
NATIVE PROC DISABLE_PED_PAIN_AUDIO(PED_INDEX PedIndex, BOOL ShouldDisable) = "0x6b27e5dc03fa026e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if ambient speech for ped has been disabled. More info..
NATIVE FUNC BOOL IS_AMBIENT_SPEECH_DISABLED(PED_INDEX PedIndex) = "0x86a123372f1a821a"

//INFO: VoiceName specified by Audio 
//PARAM NOTES:
//PURPOSE: Sets a ped to use a specific voice different to the one associated with their model. More info..
NATIVE PROC SET_AMBIENT_VOICE_NAME(PED_INDEX PedIndex, STRING VoiceName) = "0xeebc95a38cbded42"

//INFO: VoiceName specified by Audio 
//PARAM NOTES:
//PURPOSE: Sets a ped to use a specific voice different to the one associated with their model. More info..
NATIVE PROC SET_AMBIENT_VOICE_NAME_HASH(PED_INDEX PedIndex, INT VoiceNameHash) = "0x1e8c1135d675a212"

//INFO: Gets the hash of the voice name in use by Audio 
//PARAM NOTES:
//PURPOSE: Gets the hash of the voice name in use by Audio 
NATIVE FUNC INT GET_AMBIENT_VOICE_NAME_HASH(PED_INDEX PedIndex) = "0xf6734e5188cc2835"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a ped has a full range of 
NATIVE PROC SET_PED_VOICE_FULL(PED_INDEX PedIndex) = "0xcc903889dfa2b498"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a ped has a full range of 
NATIVE PROC SET_PED_RACE_AND_VOICE_GROUP(PED_INDEX PedIndex,INT pedRace, INT PVGHash = 0) = "0xa1d1db7d9797b00f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets ped voice group
NATIVE PROC SET_PED_VOICE_GROUP(PED_INDEX PedIndex, INT PVGHash) = "0xdb0d726ee9705c73"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets ped voice group using the ped's race and the given PedRaceToPVG object
NATIVE PROC SET_PED_VOICE_GROUP_FROM_RACE_TO_PVG(PED_INDEX PedIndex, INT RaceToPVGHash) = "0x0babc1345abbfb16"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the ped gender
NATIVE PROC SET_PED_GENDER(PED_INDEX PedIndex, BOOL isMale) = "0xaf59712dc40dac2c"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_VOICE_ID_FROM_HEAD_COMPONENT(PED_INDEX PedIndex, INT iPedComponent, BOOL bMale) = "0x7b0b0cd553be436d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Stops curretly playing speech (Pain, ambient, scripted, breathing).
NATIVE PROC STOP_CURRENT_PLAYING_SPEECH(PED_INDEX PedIndex) = "0x603a206371fcf97b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Stops curretly playing ambient speech.
NATIVE PROC STOP_CURRENT_PLAYING_AMBIENT_SPEECH(PED_INDEX PedIndex) = "0x642eeab0cfc6a636"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if ambient speech is currently playing.
NATIVE FUNC BOOL IS_AMBIENT_SPEECH_PLAYING(PED_INDEX PedIndex) = "0xb6f46abd140050f1"

//INFO: 
//PARAM NOTES:
//PURPOSE:Checks if scripted speech is currently playing from the given ped.
NATIVE FUNC BOOL IS_SCRIPTED_SPEECH_PLAYING(PED_INDEX PedIndex) = "0x110b92aad0fbee95"

//INFO: 
//PARAM NOTES:
//PURPOSE:Checks if any ped-independent positional scripted speech (ie. triggered using PLAY_AMBIENT_SPEECH_FROM_POSITION_NATIVE) is currently playing
NATIVE FUNC BOOL IS_ANY_POSITIONAL_SPEECH_PLAYING() = "0x56b992eded7c4010"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if any type of speech is playing.
NATIVE FUNC BOOL IS_ANY_SPEECH_PLAYING(PED_INDEX PedIndex) = "0x4239f34c6ee6a3e9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the context exists for the ped, searching through the voices in its PedVoiceGroup.  The final argument
//			can be set to true to allow searching in backup PVGs
NATIVE FUNC BOOL DOES_CONTEXT_EXIST_FOR_THIS_PED(PED_INDEX PedIndex, STRING context, BOOL allowBackupPVG = false) = "0xacfde386dbaed938"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the context exists for the ped, searching through the voices in its PedVoiceGroup.  
//			If the context does exist for the ped, then the ped's voice is locked to the voiceName for which the context was found.
//			The final argument can be set to true to allow searching in backup PVGs
NATIVE FUNC BOOL SET_PED_VOICE_FOR_CONTEXT(PED_INDEX PedIndex, STRING context, BOOL allowBackupPVG = false) = "0xab603956e0ce8be9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if ped is in currently playing conversation.
NATIVE FUNC BOOL IS_PED_IN_CURRENT_CONVERSATION(PED_INDEX PedIndex) = "0x769cb0e209f11ad8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the ped so they sound drunk
NATIVE PROC SET_PED_IS_DRUNK(PED_INDEX PedIndex, BOOL IsDrunk) = "0x0cf765282e225f04"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the ped to sound angry. 
NATIVE PROC SET_PED_IS_BLIND_RAGING(PED_INDEX PedIndex, BOOL IsBlindRaging) = "0x3056b4c713926e8f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets and unsets the ped to cry. 
NATIVE PROC SET_PED_IS_CRYING(PED_INDEX PedIndex, BOOL IsCrying) = "0x0933142654e9bddc"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the ped to sound angry. 
NATIVE PROC PLAY_ANIMAL_VOCALIZATION(PED_INDEX PedIndex, AUD_ANIMAL_TYPE animalType, STRING context) = "0x396d9bc8f22862ea"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if animal sound is currently playing.
NATIVE FUNC BOOL IS_ANIMAL_VOCALIZATION_PLAYING(PED_INDEX PedIndex) = "0x1756a9731cba54ba"

//INFO: 
//PARAM NOTES:	-PedIndex   - index of the animal you want to change
//				-Mood		- member of the AUD_ANIMAL_MOOD enum above
//PURPOSE: Sets an animals mood
NATIVE PROC SET_ANIMAL_MOOD(PED_INDEX PedIndex, AUD_ANIMAL_MOOD Mood) = "0xfbd62b4feb3546a4"

//~>						 Commands to play anim handled audio events from a ped

//INFO: Use an AudioEvent of PAIN_LOW or PAIN_HIGH for minor or major pain sounds on the ped. 
//PARAM NOTES:
//PURPOSE: Plays a sounds usually triggered by an anim on a ped. More info..
NATIVE PROC PLAY_PED_AUDIO_EVENT_ANIM(PED_INDEX PedIndex, STRING AudioEvent) = "0xb296df92a31fea0c"

// ~>						Commands to control mobile phone radio

//INFO: 
//PARAM NOTES:
//PURPOSE: CHekcs if the moblie phone radio is active
NATIVE FUNC BOOL IS_MOBILE_PHONE_RADIO_ACTIVE() = "0xa678e3511119a139"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if the phone radio is active
NATIVE PROC SET_MOBILE_PHONE_RADIO_STATE(BOOL IsActive) = "0x55a6c59c22fe1c30"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Gets the index of the current players radio station
NATIVE FUNC INT GET_PLAYER_RADIO_STATION_INDEX() = "0x763a39ac8944f8ba"

// Must match the enum in AudioDefinitions.xml
ENUM RADIO_GENRE
	RADIO_GENRE_OFF,
	RADIO_GENRE_MODERN_ROCK,
	RADIO_GENRE_CLASSIC_ROCK,
	RADIO_GENRE_POP,
	RADIO_GENRE_MODERN_HIPHOP,
	RADIO_GENRE_CLASSIC_HIPHOP,
	RADIO_GENRE_PUNK,
	RADIO_GENRE_LEFT_WING_TALK,
	RADIO_GENRE_RIGHT_WING_TALK,
	RADIO_GENRE_COUNTRY,
	RADIO_GENRE_DANCE,
	RADIO_GENRE_MEXICAN,
	RADIO_GENRE_REGGAE,
	RADIO_GENRE_JAZZ,
	RADIO_GENRE_MOTOWN,
	RADIO_GENRE_SURF,
	RADIO_GENRE_UNSPECIFIED
ENDENUM

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the genre of the players current radio station
NATIVE FUNC INT GET_PLAYER_RADIO_STATION_GENRE() = "0x3af345aa5885df2b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the name of the players radio station. This serves as the text label.
NATIVE FUNC STRING GET_PLAYER_RADIO_STATION_NAME() = "0x3efc185839d591db"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the name of the radio station with the specified index.  This serves as the text label.
NATIVE FUNC STRING GET_RADIO_STATION_NAME(INT StationIndex) = "0x8ecf4849e085e658"

//INFO: 
//PARAM NOTES:
//PURPOSE: Searches for the current radio station index for the specified hash
NATIVE FUNC INT FIND_RADIO_STATION_INDEX(INT StationNameHash) = "0xaff4500a326aaf91"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the radio is tuning to a station
NATIVE FUNC BOOL IS_RADIO_RETUNING() = "0xf5a00c1eb6e872b8"

//INFO:
//PARAM NOTES:
//PURPOSE: Checks if the radio is currently faded out
NATIVE FUNC BOOL IS_RADIO_FADED_OUT() = "0xab0bb8aa7ab39616"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the radio to tune up
NATIVE PROC SET_RADIO_RETUNE_UP() = "0x337db56aafc7c552"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the radio to tune down
NATIVE PROC SET_RADIO_RETUNE_DOWN() = "0x0fc0db6fc527861c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the radio station to a specific station. 
NATIVE PROC SET_RADIO_TO_STATION_NAME(STRING RadioStationName) = "0x65c31d05dd70b2cc"

//INFO: 
//PARAM NOTES:
//PURPOSE: Disables non-music content (adverts, idents, DJ etc) on the specified station
NATIVE PROC SET_RADIO_STATION_MUSIC_ONLY(STRING RadioStation, BOOL MusicOnly) = "0x216991f905439747"

//INFO: Scripts can call this safely without worrying about conflicts with other scripts - calls can be
//		nested, and if any system wants radio control disabled then it will be.  This does mean that scripts
//		must ensure they only call this function when their state changes, and not every frame
//PARAM NOTES: When called with enabled=false user control over radio retunes will be inhibited.  Call with enabled=true
//				to re-enable.
//PURPOSE: Enables/disables user control over radio - retuning etc
NATIVE PROC SET_USER_RADIO_CONTROL_ENABLED(BOOL enabled) = "0xb68bd12b3a8c52fd"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a news story to be played a specific time
NATIVE PROC UNLOCK_MISSION_NEWS_STORY(INT newsStoryId) = "0x9c7f69ddeb6dbb06"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the specific story is available to be played back
NATIVE FUNC BOOL IS_MISSION_NEWS_STORY_UNLOCKED(INT newsStoryId) = "0x10b1feb12ad97ddd"

//INFO: 
//PARAM NOTES:
//PURPOSE: Unlocks the specified radio station track list
NATIVE PROC UNLOCK_RADIO_STATION_TRACK_LIST(STRING radioStationName, STRING trackListName) = "0x5b1ab4d2fe023b66"

//INFO: 
//PARAM NOTES:
//PURPOSE: Locks the specified radio station track list
NATIVE PROC LOCK_RADIO_STATION_TRACK_LIST(STRING radioStationName, STRING trackListName) = "0xd1f899744fecbcea"

//INFO: 
//PARAM NOTES:
//PURPOSE: Test if the specified radio station track list is unlocked
NATIVE FUNC BOOL IS_RADIO_STATION_TRACK_LIST_UNLOCKED(STRING radioStationName, STRING trackListName) = "0xceacf83594d21c2e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Unlocks any available DJ radio tracks based on the tuneable status
NATIVE PROC UPDATE_UNLOCKABLE_DJ_RADIO_TRACKS(BOOL allowTrackReprioritization) = "0x389438916b0cb443"

//INFO: 
//PARAM NOTES:
//PURPOSE: Lock or unlock the given radio station. This disables the radio station completely - it
// won't be selectable on the radio wheel or ever be heard coming from a vehicle/ambient emitter
NATIVE PROC LOCK_RADIO_STATION(STRING radioStationName, BOOL shouldLock) = "0xaabab6267db5e5cd"

//INFO: 
//PARAM NOTES:
//PURPOSE: Mark a radio station as a favourite (by default, all stations are favourites). Setting the 
// flag to false will hide the radio station from the radio wheel
NATIVE PROC SET_RADIO_STATION_AS_FAVOURITE(STRING radioStationName, BOOL isFavourite) = "0xe479fc5ebd431c84"

//INFO: 
//PARAM NOTES:
//PURPOSE: Query whether a radio station is a favourite. Only stations that are both unlocked and favourited
// will be disabled on the radio wheel
NATIVE FUNC BOOL IS_RADIO_STATION_FAVOURITED(STRING radioStationName) = "0x2b1784db08afea79"

//INFO: 
//PARAM NOTES:
//PURPOSE: Allows radio to be playesd in the frontend.
NATIVE PROC SET_FRONTEND_RADIO_ACTIVE(BOOL bActive) = "0x6ef26a94575e15c4"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC INT GET_AUDIBLE_MUSIC_TRACK_TEXT_ID() = "0x4fc939cff1d6386d"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC REGISTER_RADIO_TRACK_TAGGED(INT TrackId) = "0x49f6bad81a7e6fbd"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the radio statiton to 
NATIVE PROC SET_RADIO_TO_STATION_INDEX(INT radioStationIndex) = "0xd0b0f5e50ce08c52"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the radio in the garage on or off
NATIVE PROC SET_TAXI_GARAGE_RADIO_STATE(BOOL enabled) = "0x5d3a4d1a2ed48853"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_VEHICLE_RADIO_LOUD(VEHICLE_INDEX vehIndex, BOOL loud) = "0x32cac81ec8c5ba86"

//INFO: 
//PARAM NOTES:
//PURPOSE: Check if the vehicle can currently receive CB radio (ie. it has a capable radio and is in range of a transmitter)
NATIVE FUNC BOOL CAN_VEHICLE_RECEIVE_CB_RADIO(VEHICLE_INDEX vehIndex) = "0xb833846de5552bc6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enables/disables radio for a specific vehicle
NATIVE PROC SET_VEHICLE_RADIO_ENABLED(VEHICLE_INDEX vehIndex, BOOL enabled) = "0xbd10a469f50e1a2a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enables/disables a positioned emitter for the player vehicle radio
NATIVE PROC SET_POSITIONED_PLAYER_VEHICLE_RADIO_EMITTER_ENABLED(BOOL enabled) = "0xe9669168376aa182"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL DOES_PLAYER_VEH_HAVE_RADIO() = "0x678069837eae492b"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL IS_PLAYER_VEH_RADIO_ENABLE() = "0xb9fd3472c37271a4"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_MOBILE_RADIO_ENABLED_DURING_GAMEPLAY(BOOL enabled) = "0x9367fadb11a30d38"

//~>					 Commands to allow the first script to control the cutscene -> radio transition

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC FREEZE_RADIO_STATION(STRING RadioStationName) = "0x8b7cd2568e24fe82"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC UNFREEZE_RADIO_STATION(STRING RadioStationName) = "0xde6c620b87b6536c"

//INFO:
//PARAM NOTES
//PURPOSE: if true the radio will automatically unfreeze as soon as the player gets in a vehicle
NATIVE PROC SET_RADIO_AUTO_UNFREEZE(BOOL enable) = "0xa64f9d860f7389c9"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_INITIAL_PLAYER_STATION(STRING RadioStationName) = "0x211c581b8aacd11c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Check if a given vehicle radio is on
NATIVE FUNC BOOL IS_VEHICLE_RADIO_ON(VEHICLE_INDEX VehicleIndex) = "0x4c5bb58aaac629c5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a specific radio station for the vehicle
NATIVE PROC SET_VEH_RADIO_STATION(VEHICLE_INDEX VehicleIndex, STRING RadioStationName) = "0xd501428969a52c0f"

//INFO:
//PARAM NOTES:
//PURPOSE: Tells the vehicle to use a normal radio (instead of an emergency services radio, MP only radio, or other radio type)
NATIVE PROC SET_VEH_HAS_NORMAL_RADIO(VEHICLE_INDEX VehicleIndex) = "0xbadc62ccfab06a0a"

//INFO:
//PURPOSE: Ensure the specific vehicle gets a radio allocated this frame
NATIVE PROC SET_VEH_FORCED_RADIO_THIS_FRAME(VEHICLE_INDEX VehicleIndex) = "0xc36e594dcaeb0f23"

//INFO: 
//PARAM NOTES:
//PURPOSE: Retunes a named static emitter to the specified station
NATIVE PROC SET_EMITTER_RADIO_STATION(STRING EmitterName, STRING RadioStationName) = "0xece7b7efd96cebf4"

//INFO:
//PARAM NOTES:
//PURPOSE: Enables or disables a named static emitter
NATIVE PROC SET_STATIC_EMITTER_ENABLED(STRING EmitterName, BOOL enabled) = "0x380313ff4cef9b49"

//INFO:
//PARAM NOTES:
//PURPOSE: Link a static emitter to the given entity
NATIVE PROC LINK_STATIC_EMITTER_TO_ENTITY(STRING EmitterName, ENTITY_INDEX EntityIndex) = "0x4637ae8ffd474a33"

//INFO: 
//PARAM NOTES:
//PURPOSE: Forces a specific track on a radio station.  The station must be frozen, and the track will be queued for immediate playback
NATIVE PROC SET_RADIO_TRACK(STRING RadioStationName, STRING TrackName) = "0x93cb338c8902831c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Forces a specific track on a radio station with a given start offset.  The station must be frozen, and the track will be queued for immediate playback
NATIVE PROC SET_RADIO_TRACK_WITH_START_OFFSET(STRING RadioStationName, STRING TrackName, INT TimeOffsetMs) = "0x5b1db18d92a04434"

//INFO: 
//PARAM NOTES:
//PURPOSE: Forces the next track on a radio station. The track will played following the currently playing track
NATIVE PROC SET_NEXT_RADIO_TRACK(STRING RadioStationName, STRING category, STRING contextName, STRING trackIndex) = "0x3d330982888f05e5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Forces the chosen station to play the given music track list. All other music track lists will be locked
NATIVE PROC FORCE_MUSIC_TRACK_LIST(STRING RadioStationName, STRING TrackListName, INT TimeOffsetMs) = "0x3da2b2e4f297cafa"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the hash of the most recently forced track list on the given station
NATIVE FUNC INT GET_LAST_FORCED_TRACK_LIST(STRING RadioStationName) = "0xa74e35a2434bdf42"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the current play time (in milliseconds) into the active music playlist for the given station
NATIVE FUNC INT GET_MUSIC_TRACK_LIST_PLAY_TIME_OFFSET_MS(STRING RadioStationName) = "0xc9a6f1669345b14e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the total duration (in milliseconds) of the active music playlist for the given station
NATIVE FUNC INT GET_MUSIC_TRACK_LIST_DURATION_MS(STRING RadioStationName) = "0x62ec19ec897e956f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the duration (in milliseconds) of the track at the given index in the active music playlist for the given station
NATIVE FUNC INT GET_MUSIC_TRACK_LIST_TRACK_DURATION_MS(STRING RadioStationName, INT trackIndex) = "0x2d07c69a4729fe95"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the currently playing track index in the music playlist for the given station
NATIVE FUNC INT GET_MUSIC_TRACK_LIST_ACTIVE_TRACK_INDEX(STRING RadioStationName) = "0x1ad8c31a93bbc5a3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the current play time (in milliseconds) into the active music playlist for the given station
NATIVE FUNC INT GET_MUSIC_TRACK_LIST_NUM_TRACKS(STRING RadioStationName) = "0x93d096bc3ba70c02"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the trackID of the track that will play at the given time (in milliseconds) into the active music playlist for the given station
NATIVE FUNC INT GET_MUSIC_TRACK_LIST_TRACK_ID_AT_TIME_MS(STRING RadioStationName, INT TimeOffsetMs) = "0x02396a09f2dd0070"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the trackID of the track that will play at the given index into the active music playlist for the given station
NATIVE FUNC INT GET_MUSIC_TRACK_LIST_TRACK_ID_AT_INDEX(STRING RadioStationName, INT TrackIndex) = "0x667b6b936d29a222"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the start time (in milliseconds) for the given track index in the active music playlist for the given station
NATIVE FUNC INT GET_MUSIC_TRACK_LIST_TRACK_START_TIME_MS(STRING RadioStationName, INT TrackIndex) = "0xf63d184b4dab8d00"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the start time (in milliseconds) for the given track index in the active music playlist for the given station
NATIVE PROC SKIP_TO_OFFSET_IN_MUSIC_TRACK_LIST(STRING RadioStationName, INT TimeOffsetMs) = "0x920243ab6c7dd0ab"

//INFO:
//PARAM NOTES:
//PURPOSE: Override the time to fade radio from stereo to positioned and vice versa.  Default is 0.5s
NATIVE PROC SET_RADIO_FRONTEND_FADE_TIME(FLOAT FadeTimeSeconds) = "0x1436b64d165d89e4"

//INFO:
//PARAM NOTES: If ForceNow = TRUE then the current track will be interrupted by the tracklist
//PURPOSE: Queues up a custom track list on the specified radio station.  The content in the track list will be played as soon as possible.  
//			The station does not have to be frozen.
NATIVE PROC SET_CUSTOM_RADIO_TRACK_LIST(STRING RadioStationName, STRING TrackListName, BOOL ForceNow = FALSE) = "0xba4e8f889faa1728"

//INFO:
//PARAM NOTES:
//PURPOSE: Clears the previously queued custom track list for the given radio station.
NATIVE PROC CLEAR_CUSTOM_RADIO_TRACK_LIST(STRING RadioStationName) = "0x234263703caeb763"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the number of radio stations currently unlocked in the game.  This can change as a result of DLC and/or script calls.
NATIVE FUNC INT GET_NUM_UNLOCKED_RADIO_STATIONS() = "0x6519b5145bb024dc"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the number of radio stations currently unlocked and favourited in the game.  This can change as a result of DLC and/or script calls.
NATIVE FUNC INT GET_NUM_UNLOCKED_FAVOURITED_RADIO_STATIONS() = "0x497fc61659bcafaa"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SKIP_RADIO_FORWARD() = "0xaf08933cf373bf40"

//INFO: Generic interface to toggle audio functionality, with auto-reset on script termination and support for multiple script threads
NATIVE PROC SET_AUDIO_FLAG(STRING flagName, BOOL enabled) = "0x6ce6c3a402c3e20c"

//INFO: 
//PARAM NOTES: 
//PURPOSE: 
NATIVE FUNC BOOL PREPARE_SYNCHRONIZED_AUDIO_EVENT(STRING AudioEvent, INT StartOffsetMs) = "0xef91bc25caa31753"

//INFO: 
//PARAM NOTES: 
//PURPOSE: 
NATIVE FUNC BOOL PREPARE_SYNCHRONIZED_AUDIO_EVENT_FOR_SCENE(INT SceneId, STRING AudioEvent) = "0x662a04c7bf4ceb42"

//INFO: 
//PARAM NOTES: 
//PURPOSE: 
NATIVE FUNC BOOL PLAY_SYNCHRONIZED_AUDIO_EVENT(INT SceneId) = "0x0726c6430f767980"

//INFO: 
//PARAM NOTES: 
//PURPOSE: 
NATIVE FUNC BOOL STOP_SYNCHRONIZED_AUDIO_EVENT(INT SceneId) = "0xa6ada1dc68c9eaed"

//INFO: DEPRICATED please use INIT_SYNCH_SCENE_AUDIO_WITH_POSITION
//PARAM NOTES: 
//PURPOSE:
NATIVE PROC SET_SYNCH_SCENE_AUDIO_POSITION(VECTOR Pos) = "0x51e330928c9467bd"

//INFO: DEPRICATED please use INIT_SYNCH_SCENE_AUDIO_WITH_ENTITY 
//PARAM NOTES: 
//PURPOSE:
NATIVE PROC SET_SYNCH_SCENE_AUDIO_ENTITY(ENTITY_INDEX EntityIndex) = "0x26338e80420d8556"


//INFO: 
//PARAM NOTES: 
//PURPOSE:
NATIVE PROC INIT_SYNCH_SCENE_AUDIO_WITH_POSITION(STRING AudioName, VECTOR Pos) = "0xe39797060f976995"

//INFO: 
//PARAM NOTES: 
//PURPOSE:
NATIVE PROC INIT_SYNCH_SCENE_AUDIO_WITH_ENTITY(STRING AudioName, ENTITY_INDEX EntityIndex) = "0x0472288e3e06730d"

//INFO: Add a suffix to the cutscene audio name. Call before loading the cutscene.
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_CUTSCENE_AUDIO_OVERRIDE(STRING override) = "0x52763eee2db5ee35"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC INT GET_CUTSCENE_AUDIO_TIME_MS() = "0x125775f5c74c6fb2"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_VARIABLE_ON_SYNCH_SCENE_AUDIO(STRING varName, FLOAT value) = "0xbb4da79ca6c5e9ed"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the end of credits to play.
NATIVE PROC PLAY_END_CREDITS_MUSIC(BOOL bActive) = "0x9981786616f43e7d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the end of credits fade
NATIVE PROC SET_END_CREDITS_FADE_ACTIVE (BOOL  bActive) = "0x6d92b611847e4c1a"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC BOOL IS_GAME_IN_CONTROL_OF_MUSIC() = "0xd4cce8d6ca771ac8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enables/disables the proximity whoosh sfx
NATIVE PROC SET_PROXIMITY_WHOOSHES_ENABLED(BOOL enabled) = "0x80351b8b4bbc7250"

//~>					 Police Scanner commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Plays a police report on a NPC.
NATIVE PROC PLAY_POLICE_REPORT_SPOTTING_NPC(INT pedIndex,FLOAT accuary,BOOL force = false,BOOL forceVehicle = false) = "0xeb1167105e048768"

//INFO: 
//PARAM NOTES:
//PURPOSE: Plays a police report.
NATIVE FUNC INT PLAY_POLICE_REPORT(STRING ReportName, FLOAT applyValue=0.0) = "0x8bae3b6695282dc0"

//INFO: 
//PARAM NOTES: scriptID - The id for the script-triggered report (returned by PLAY_POLICE_REPORT)
//PURPOSE: Cancels a police report.
NATIVE PROC CANCEL_POLICE_REPORT(INT scriptID) = "0xbf7f84a49adc9c29"

//INFO: 
//PARAM NOTES:
//PURPOSE: Cancels all police reports in the scanner queue.
NATIVE PROC CANCEL_ALL_POLICE_REPORTS() = "0xa43700313f126344"

//INFO: 
//PARAM NOTES: scriptID - The id for the script-triggered report (returned by PLAY_POLICE_REPORT)
//PURPOSE: Returns true is report is playing.
NATIVE FUNC BOOL IS_POLICE_REPORT_PLAYING(INT scriptID) = "0xc7c07ae99b12f1c1"

//INFO: 
//PARAM NOTES: scriptID - The id for the script-triggered report (returned by PLAY_POLICE_REPORT)
//PURPOSE: Returns true if report is in use (either playing or queued).
NATIVE FUNC BOOL IS_POLICE_REPORT_ID_VALID(INT scriptID) = "0xd6d709e15722c84e"

//INFO: 
//PARAM NOTES: scriptID - The id for the script-triggered report (returned by PLAY_POLICE_REPORT)
//PURPOSE: Returns true if report is in use (either playing or queued).
NATIVE FUNC INT GET_PLAYING_POLICE_REPORT() = "0x49a190be049f104a"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC PLAY_VIGILANTE_CRIME(INT Crime, VECTOR Position) = "0x336bb9b1a77040f9"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_POLICE_SCANNER_CAR_CODE_INFO(POLICE_SCANNER_CAR_CODE UnitType, INT BeatNum) = "0xd1d13577fc39bfaa"

NATIVE PROC SET_POLICE_SCANNER_POSITION_INFO(VECTOR pos) = "0x63824a641c4828c3"

NATIVE PROC SET_POLICE_SCANNER_CRIME_INFO(INT Crime) = "0xfe5aeb24424a78f4"

NATIVE PROC  SET_CONVERSATION_CODE_NAME(INT Codeletter, INT Codenumber, STRING UserName) = "0x0ee26c178743f498"

NATIVE PROC  SET_CONVERSATION_POSITION(VECTOR Position) = "0x7fedb237be9ea7c3"

//INFO: 
//PARAM NOTES: Pass in true to turn off ducking for the next conversation triggered.
//PURPOSE: 
NATIVE PROC SET_NO_DUCKING_FOR_CONVERSATION(BOOL enable) = "0xd5e0b6866334ad85"

//~>					 Streams

//INFO: 
//PARAM NOTES:
//PURPOSE: True if script is currently playing a stream
NATIVE FUNC BOOL IS_STREAM_PLAYING() = "0xa74cb1a66ee16d43"

//INFO: 
//PARAM NOTES:
//PURPOSE: Current stream play time. 
NATIVE FUNC INT GET_STREAM_PLAY_TIME() = "0x5414f3b44b148780"

//INFO: 
//PARAM NOTES:
//PURPOSE: Load in named stream. Optionally can specify a sound set which contains the sound specified by name.
NATIVE FUNC BOOL LOAD_STREAM(STRING streamName, STRING SetName = NULL) = "0x01fe3d0e34407698"

//INFO: 
//PARAM NOTES:
//PURPOSE: Load in named stream. Optionally can specify a sound set which contains the sound specified by name.
NATIVE FUNC BOOL LOAD_STREAM_WITH_START_OFFSET(STRING streamName, INT startOffset, STRING SetName = NULL) = "0x991d256c78de67f5"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC PLAY_STREAM_FRONTEND() = "0xb414ad851359ed65"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC PLAY_STREAM_FROM_POSITION(VECTOR position) = "0xc2512e3805388b5b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Plays a preloaded stream back from a specified ped. 
NATIVE PROC PLAY_STREAM_FROM_PED(PED_INDEX PedIndex) = "0x61379e8ce8e4bcee"

//INFO: 
//PARAM NOTES:
//PURPOSE: Plays a preloaded stream back from a specified veh. 
NATIVE PROC PLAY_STREAM_FROM_VEHICLE(VEHICLE_INDEX VehIndex) = "0xc06ef1b97dd5bbe8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Plays a preloaded stream back from a specified object. 
NATIVE PROC PLAY_STREAM_FROM_OBJECT(OBJECT_INDEX ObjectIndex) = "0xa0d1364489a44449"

//INFO: 
//PARAM NOTES:
//PURPOSE: Stops a stream that is being played by the script
NATIVE PROC STOP_STREAM() = "0xacc66366e248a4ca"

//~>					 Commands to control the overall sound of the game

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_CHASE_AUDIO(BOOL Enable) = "0x25e54a9c8f37f101"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_AGGRESSIVE_HORNS(BOOL Enable) = "0x8a422f5ce0368c78"

//INFO: 
//PARAM NOTES:
//PURPOSE: Mutes the game world audio
NATIVE PROC SET_GAMEWORLD_AUDIO_MUTE(BOOL Mute) = "0x013f178a77a43095"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_RADIO_POSITION_AUDIO_MUTE(BOOL Mute) = "0x2bbae83c1aa1c306"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_GAMEWORLD_AND_POSITIONED_RADIO_FOR_TV_MUTE(BOOL Mute) = "0xc67f090d7168ebec"

//INFO: 
//PARAM NOTES:
//PURPOSE:Set vehicles conversations carry on even if the vehicle is on fire or upsidedown.
NATIVE PROC SET_VEHICLE_CONVERSATIONS_PERSIST(BOOL AllowUpsideDown, BOOL AllowOnFire) = "0x9ef092cf52f06ef6"

//INFO: 
//PARAM NOTES:
//PURPOSE:Set vehicles conversations carry on even if the vehicle is on fire or upsidedown or drowning.
NATIVE PROC SET_VEHICLE_CONVERSATIONS_PERSIST_NEW(BOOL AllowUpsideDown, BOOL AllowOnFire, BOOL AllowDrowning) = "0xf580e58474fe0bee"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_TRAIN_AUDIO_ROLLOFF(VEHICLE_INDEX VehicleIndex, FLOAT Rolloff) = "0x9e4626dfc6ed763d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Plays the siren audio without a driver in a vehicle
NATIVE PROC SET_SIREN_WITH_NO_DRIVER(VEHICLE_INDEX VehicleIndex, BOOL SirenFlag) = "0xfadd5f130031faf6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Use in conjuction with SET_SIREN_WITH_NO_DRIVER to definitely play the siren with no driver in MP modes
NATIVE PROC SET_SIREN_BYPASS_MP_DRIVER_CHECK(VEHICLE_INDEX VehicleIndex, BOOL Bypass) = "0x7e84e95e84952cfe"

//INFO: 
//PARAM NOTES:
//PURPOSE: Actually sets the siren audio active. If attempting to enable a siren on a driverless vehicle,
//		   you may need to use this to kick off the actual sound (generally we only trigger the audio if
//		   a driver is in the vehicle)
NATIVE PROC TRIGGER_SIREN_AUDIO(VEHICLE_INDEX VehicleIndex) = "0xff98a9b54847121f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the horn to be enabled or disabled
NATIVE PROC SET_HORN_ENABLED(VEHICLE_INDEX VehicleIndex, BOOL Enable) = "0xe01b728a49fd80c4"

ENUM AUDIO_VEHICLE_PRIORITY
	AUDIO_VEHICLE_PRIORITY_NORMAL,
	AUDIO_VEHICLE_PRIORITY_MEDIUM,
	AUDIO_VEHICLE_PRIORITY_HIGH,
	AUDIO_VEHICLE_PRIORITY_MAX
ENDENUM

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the priority for the given vehicle. This is a hint for the audio system as to what LOD the 
//			vehicle should use. 'High' priority will bump up the activation range significantly and prevent it
//			from dropping when the vehicle is not within the view frustrum. 'Max' will attempt to keep the vehicle
//			at maximum LOD regardless of how far it is from the listener or what it is currently doing. Be careful with this!
//			There is a hard limit of 5 simulataneous granular cars (including the player) so we are quite limited on the number
//			we can play at once, so setting vehicles to max priority will reduce the number of engines availble for regular NPC vehicles
NATIVE PROC SET_AUDIO_VEHICLE_PRIORITY(VEHICLE_INDEX VehicleIndex, AUDIO_VEHICLE_PRIORITY priority) = "0xc5ead0c81781889b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Force this vehicle to use a particular audio game object
NATIVE PROC FORCE_USE_AUDIO_GAME_OBJECT(VEHICLE_INDEX VehicleIndex, STRING GameObjectName) = "0x1be725508ba268ef"

//INFO: 
//PARAM NOTES:
//PURPOSE: Request that we preload the required audio bank for a given vehicle model
NATIVE PROC PRELOAD_VEHICLE_AUDIO_BANK(INT vehicleModelNameHash) = "0x1b848f64eff9350e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the startup rev sound that this vehicle should use
NATIVE PROC SET_VEHICLE_STARTUP_REV_SOUND(VEHICLE_INDEX VehicleIndex, STRING SoundName, STRING SetName = NULL) = "0x528a587b1b02de46"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the startup rev sound that this vehicle should use
NATIVE PROC RESET_VEHICLE_STARTUP_REV_SOUND(VEHICLE_INDEX VehicleIndex) = "0x8674818c1d545dc3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Force the reversing beep to be active, even though the vehicle may not be in reverse gear
//			(nb. the beep will not actually play unless the vehicle is also moving backwards)
NATIVE PROC SET_VEHICLE_FORCE_REVERSE_WARNING(VEHICLE_INDEX VehicleIndex, BOOL ForceReverseWarning) = "0x29a5c8a8ea30da95"

//INFO: 
//PARAM NOTES:
//PURPOSE: Check if the vehicle has any audible damage effects applied to it
NATIVE FUNC BOOL IS_VEHICLE_AUDIBLY_DAMAGED(VEHICLE_INDEX VehicleIndex) = "0x588c47cedf788e4c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the audio engine damage factor that this vehicle should use (0.0 = fine, 1.0 = fully damaged). This will trigger general engine
//			damage loops, engine knocking sounds, and random fanbelt squealing
NATIVE PROC SET_VEHICLE_AUDIO_ENGINE_DAMAGE_FACTOR(VEHICLE_INDEX VehicleIndex, FLOAT DamageFactor) = "0xde74af71c08a81ea"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the audio body damage percentage that this vehicle should use (0.0 = fine, 1.0 = fully damaged). This will trigger debris sounds on
//			jump landings, exhaust rattle when coming off the throttle, and louder suspension sounds
NATIVE PROC SET_VEHICLE_AUDIO_BODY_DAMAGE_FACTOR(VEHICLE_INDEX VehicleIndex, FLOAT DamageFactor) = "0xf4801e32b95aa145"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enable fanbelt damage (if the engine damage level gets high enough)
NATIVE PROC ENABLE_VEHICLE_FANBELT_DAMAGE(VEHICLE_INDEX VehicleIndex, BOOL enableFanbeltDamage) = "0x140cd5c2b2916f0e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Turns the horn on - on every frame, not choosing a pattern of it's own. 
//Needs called every frame. Will time-out after SET_HORN_PERMANENTLY_ON_TIME(VEHICLE_INDEX VehicleIndex, FLOAT HornTime)
NATIVE PROC SET_HORN_PERMANENTLY_ON(VEHICLE_INDEX VehicleIndex) = "0xcfc69c95792129ea"

//INFO: 
//PARAM NOTES:
// HornTime is specified in milliseconds.
//PURPOSE: plays a continuous horn beep for the specified time (ms).
NATIVE PROC SET_HORN_PERMANENTLY_ON_TIME(VEHICLE_INDEX VehicleIndex, FLOAT HornTime) = "0x90cc747689895bca"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enable or disable exhaust pops on the given vehicle
NATIVE PROC ENABLE_VEHICLE_EXHAUST_POPS(VEHICLE_INDEX VehicleIndex, BOOL Enable) = "0x0690e7850ceca08a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Trigger the vehicle boost effect
NATIVE PROC SET_VEHICLE_BOOST_ACTIVE(VEHICLE_INDEX vehIndex, BOOL active) = "0x888ac6fc97c7ebc7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enable player vehicle specific alarm disarm/arm sound triggering
NATIVE PROC SET_PLAYER_VEHICLE_ALARM_AUDIO_ACTIVE(VEHICLE_INDEX vehIndex, BOOL active) = "0x805e5195b36dae42"

//INFO: 
//PARAM NOTES:
//PURPOSE: Script enables the audio door update
NATIVE PROC SET_SCRIPT_UPDATE_DOOR_AUDIO(INT doorEnumHash, BOOL update) = "0x99c46337f53eecad"

//INFO: 
//PARAM NOTES:
//PURPOSE: Trigger a door close sound
NATIVE PROC PLAY_VEHICLE_DOOR_CLOSE_SOUND(VEHICLE_INDEX vehIndex, INT doorIndex) = "0x6767e4193fd5b5f1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Trigger a door open sound
NATIVE PROC PLAY_VEHICLE_DOOR_OPEN_SOUND(VEHICLE_INDEX vehIndex, INT doorIndex) = "0x01c2ab1a8ed72f72"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enable or disable the crop dusting sounds
NATIVE PROC ENABLE_CROP_DUSTING_SOUNDS(VEHICLE_INDEX VehicleIndex, BOOL Enable) = "0xd8a730c14c1a1a2f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enable or disable the plane stall warning sounds
NATIVE PROC ENABLE_STALL_WARNING_SOUNDS(VEHICLE_INDEX VehicleIndex, BOOL Enable) = "0x7b9a3d69e4563a91"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_GPS_ACTIVE(BOOL DisableGps) = "0x62ab99f33efdf125"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC PLAY_MISSION_COMPLETE_AUDIO(STRING MissionCompleteId) = "0xb6e6f1fbdde27cf3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the mission complete audio is playing
NATIVE FUNC BOOL IS_MISSION_COMPLETE_PLAYING() = "0xf936e26eb07c7a06"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if script should draw the mission complete UI to be in sync with the audio.
NATIVE FUNC BOOL IS_MISSION_COMPLETE_READY_FOR_UI() = "0x51b424149bc1c8f0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if the death jingle can play when the player dies or not
NATIVE PROC BLOCK_DEATH_JINGLE(BOOL blocked) = "0x6430be9007e43c50"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the death jingle can play when the player dies
NATIVE FUNC BOOL IS_DEATH_JINGLE_BLOCKED() = "0x0ea671f79d4ffa14"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_ROMANS_MOOD(ROMANS_MOOD Mood) = "0xfe8cabe22d9a393b"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_BRIANS_MOOD(BRIANS_MOOD Mood) = "0x0acaf833bef3835f"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_IN_NETWORK_LOBBY(BOOL isInNetworkLobby) = "0x0bb65b3bbd80075c"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_LOBBY_MUTE_OVERRIDE(BOOL OverrideMute) = "0x22894a272b6966fe"

//~>					Commands for dynamic mixing
//INFO:
//PARAM NOTES: name of the scene
//PURPOSE: Starts the named dynamic mixing scene
NATIVE FUNC BOOL START_AUDIO_SCENE(STRING SceneName) = "0x66b27a59829491d3"

//INFO:
//PARAM NOTES: name of the scene
//PURPOSE: stops the named mixing scene (which was previously started by this script)
NATIVE PROC STOP_AUDIO_SCENE(STRING SceneName) = "0x0af8d3a06bb92903"

//INFO:
//PARAM NOTES: name of the scene
//PURPOSE: stops all mixing scenes (which were previously started by this script)
NATIVE PROC STOP_AUDIO_SCENES() = "0xc33ba49210b9fbbf"

//INFO:
//PARAM NOTES: name of the scene
//PURPOSE: returns true if the script is already running the named scene, false if not
NATIVE FUNC BOOL IS_AUDIO_SCENE_ACTIVE(STRING SceneName) = "0xa37204c64473b324"

//INFO:
//PARAM NOTES: name of the scene, name of the variable to change/add, values to set the variable to
//PURPOSE: set the value of a named scene-scoped variable 
NATIVE PROC SET_AUDIO_SCENE_VARIABLE(STRING SceneName, STRING VariableName, FLOAT Value) = "0x9364fa34f6e72a61"

//INFO:
//PARAM NOTES: name of the scene
//PURPOSE: returns 'true' if the audio scene is not fading
NATIVE FUNC BOOL HAS_AUDIO_SCENE_FINISHED_FADE(STRING SceneName) = "0x6d9b4046e9dd1392"

//INFO:
//PARAM NOTES: Time is in milliseconds
//PURPOSE: Set a delay (ms) for the audio to be cleaned up when the script finishes
NATIVE PROC SET_AUDIO_SCRIPT_CLEANUP_TIME(INT TimeDelay) = "0xbc770cb8938a190b"

//INFO:
//PARAM NOTES: name of the scene to activate when triggering a scanner line
//PURPOSE: set the scene to activate during scripted police scanner triggers
NATIVE PROC SET_POLICE_SCANNER_AUDIO_SCENE(STRING SceneName) = "0x4c4ac3aa47666f87"

//INFO:
//PARAM NOTES: 
//PURPOSE: reset all values so no scene is activated by scripted police scanner triggers
NATIVE PROC STOP_AND_REMOVE_POLICE_SCANNER_AUDIO_SCENE() = "0xa1daf3140c603ed2"

//INFO:
//PARAM NOTES: name of the variable to change/add, value to set the variable to
//PURPOSE: set the value of a script-scoped variable
NATIVE PROC SET_AUDIO_SCRIPT_VARIABLE(STRING VariableName, FLOAT Value) = "0x0c88a748e981ab40"

//INFO:
//PARAM NOTES:
//PURPOSE: adds an entity to the named mix group so that it's sounds can be dynamically mixed. 
NATIVE PROC ADD_ENTITY_TO_AUDIO_MIX_GROUP(ENTITY_INDEX EntityIndex, STRING groupName, FLOAT fadeIn = 0.0) = "0x2a375326652f1b50"

//INFO:
//PARAM NOTES:
//PURPOSE: removes an entity fom its current mix group. 
NATIVE PROC REMOVE_ENTITY_FROM_AUDIO_MIX_GROUP(ENTITY_INDEX EntityIndex, FLOAT fadeOut = 0.0) = "0x5545b7d117bb40b4"

/// PURPOSE:
///   Returns true if music is currently playing, including unscripted and gringo music
NATIVE FUNC BOOL AUDIO_IS_MUSIC_PLAYING() = "0x08255a6ed9b71dc9"

/// PURPOSE:
///   Returns true only if scripted music is currently playing
NATIVE FUNC BOOL AUDIO_IS_SCRIPTED_MUSIC_PLAYING() = "0xf1557162766fcdeb"

#IF IS_DEBUG_BUILD
//~>					Gun fights
//INFO: 
//PARAM NOTES:
//PURPOSE: DRAW THE GRID 
NATIVE PROC  DRAW_GUN_FIGHT_GRID() = "0x92369b81bc791209"
//INFO: 
//PARAM NOTES: coordinates of the sector ( 00, 14,  34...)
//PURPOSE: get a random position in this grid sector.
NATIVE FUNC VECTOR SHOOTER_POS_IN_SECTOR(INT xcoord, INT ycoord) = "0x6cdb2152a6472ef9"
#ENDIF
//~>					Weather
//INFO: 
//PARAM NOTES:
//	temperature -> desire temperature
// 	applyValue ->  How much the desire temperature affect the wind 
//PURPOSE: 
NATIVE PROC  SET_WIND_TEMPERATURE(FLOAT temperature,FLOAT applyValue) = "0x086aa060d2349956"
//INFO: 
//	strength -> Desire wind strength
// 	applyValue ->  How much the desire wind strength affects the current one.
//PURPOSE:  
NATIVE PROC  SET_WIND_STRENGTH(FLOAT strength,FLOAT applyValue) = "0xfd595d4c52b54b28"
//INFO: 
//	blustery -> Desire wind blustery
// 	applyValue ->  How much the desire wind blustery affects the current one.
//PURPOSE:  
NATIVE PROC  SET_WIND_BLUSTERY(FLOAT blustery,FLOAT applyValue) = "0x88e5803bfdef631e"

//INFO: 
//PURPOSE: Overrides the prev and new weatherTypes 
NATIVE PROC  SCRIPT_OVERRIDES_WIND_TYPES(BOOL override,STRING oldWindTypeName,STRING newWindTypeName) = "0x9531b2f767d64655"

//INFO: 
//PURPOSE: Overrides wind elevation sounds
NATIVE PROC  SCRIPT_OVERRIDES_WIND_ELEVATION(BOOL override,INT windElevationHashName) = "0x31950ebe600e22b4"

//INFO: 
//	density -> Desired walla density
// 	applyValue ->  How much the desired density affects the actual one.
//PURPOSE:  
//	Overrides the calculated ped density that is used to modulate the ambient ped walla sounds (in exteriors only)
NATIVE PROC  SET_PED_WALLA_DENSITY(FLOAT density,FLOAT applyValue) = "0xcb19e968c4d646d8"

//INFO: 
//	density -> Desired walla density
// 	applyValue ->  How much the desired density affects the actual one.
//PURPOSE:  
//	Overrides the calculated ped density that is used to modulate the ambient ped walla sounds (in interiors only)
NATIVE PROC  SET_PED_INTERIOR_WALLA_DENSITY(FLOAT density,FLOAT applyValue) = "0xa39ca20de8266571"

//INFO: 
//	soundSet-> The name of the soundset to use
// 	interior ->  Whether to change the exterior/city ped walla, or the interior ped walla
//PURPOSE: Set the sound set to use for ped walla
NATIVE PROC  SET_PED_WALLA_SOUND_SET(STRING soundSet, BOOL interior) = "0x452c2e17f66b6478"

//PURPOSE:  
//	Forces the ambient peds into their panic walla state
NATIVE PROC  FORCE_PED_PANIC_WALLA() = "0x941e500b05a5e04a"

NATIVE FUNC STRING GET_TEXT_KEY_FOR_LINE_OF_AMBIENT_SPEECH(PED_INDEX PedIndex, STRING SubtitleGroupID, STRING LineRoot) = "0x2cc69c69faa8ad87"

/// PURPOSE:
///    Prepares the specified music event. Preparing it in advance will preload any required data so that
///	   it's ready to play immediately.
/// RETURNS:
///  	TRUE if the event is prepared, FALSE otherwise
NATIVE FUNC BOOL PREPARE_MUSIC_EVENT(STRING eventName) = "0x63b063064dc08617"

/// PURPOSE:
///    Cancels the specified music event. 
/// RETURNS:
///  	TRUE if the event was found and cancelled, FALSE otherwise
NATIVE FUNC BOOL CANCEL_MUSIC_EVENT(STRING eventName) = "0x0709e99f1ddfff26"

/// PURPOSE:
///    Triggers the specified music event (any associated actions as set up in RAVE)
/// RETURNS:
///  	TRUE if the event was triggered, FALSE otherwise
NATIVE FUNC BOOL TRIGGER_MUSIC_EVENT(STRING eventName) = "0x1cf3f44fc2eb9f99"

/// PURPOSE:
///		Returns TRUE if a one shot is currently playing/prepared
NATIVE FUNC BOOL IS_MUSIC_ONESHOT_PLAYING() = "0x41820d2cc10e7244"

/// PURPOSE:
///		Returns TRUE if the user has retuned to radio, muting score
NATIVE FUNC BOOL IS_SCORE_MUTED_FOR_RADIO() = "0x52111705d9406c70"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the global radio signal level (reduce towards zero to cause a static interference effect)
NATIVE PROC SET_GLOBAL_RADIO_SIGNAL_LEVEL(FLOAT signalLevel) = "0x69a65bc53c5d08f7"

/// PURPOSE:
///		Returns the play time in milliseconds of the current score track
NATIVE FUNC INT GET_MUSIC_PLAYTIME() = "0xa4a087efa0fa28f5"

/// PURPOSE:
///    Prepares any banks required to play the given alarm
/// RETURNS:
///  	TRUE if the alarm was successfully prepared
NATIVE FUNC BOOL PREPARE_ALARM(STRING alarmName) = "0x3e3727cdacee36ac"

/// PURPOSE:
///		Start an alarm playing
//INFO: 
//	skipStartup -> Whether to skip the initial alarm behaviour (starting loud, before fading down)
NATIVE PROC START_ALARM(STRING alarmName, BOOL skipStartup) = "0x0eb18a2edd6957a4"

/// PURPOSE:
///		Returns TRUE if a one shot is currently playing/prepared
//INFO: 
//	instantStop -> Whether to kill the alarm instantly, or to let the audio system turn it off when it becomes inaudible
NATIVE PROC STOP_ALARM(STRING alarmName, BOOL instantStop) = "0x837739686f969991"

/// PURPOSE:
///		Stop all alarms playing
//INFO: 
//	instantStop -> Whether to kill the alarm instantly, or to let the audio system turn it off when it becomes inaudible
NATIVE PROC STOP_ALL_ALARMS(BOOL instantStop) = "0xc28bdd13a962277f"

/// PURPOSE:
///		Returns TRUE if an alarm is currently playing
NATIVE FUNC BOOL IS_ALARM_PLAYING(STRING alarmName) = "0x83565bf2f64aa92e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Plays a siren blip from the veh. 
NATIVE PROC BLIP_SIREN(VEHICLE_INDEX VehIndex) = "0x22348609bc8e8831"

//INFO: 
//PARAM NOTES:
//PURPOSE: Overrides the current vehicle horn 
NATIVE PROC OVERRIDE_VEH_HORN(VEHICLE_INDEX VehIndex,BOOL override,INT overridenHornHash) = "0x785a594ef1969952"

//INFO: 
//PARAM NOTES:
//PURPOSE: return true if the vehicle is playing the horn
NATIVE FUNC BOOL IS_HORN_ACTIVE(VEHICLE_INDEX VehIndex) = "0x5e1f820e490c4eef"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enable/disable the parking beep 
NATIVE PROC ENABLE_PARKING_BEEP(VEHICLE_INDEX VehIndex,bool enable) = "0x702be60b9f5d3a2a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enables/disables the incoming missile warning system for a specific vehicle
NATIVE PROC SET_VEHICLE_MISSILE_WARNING_ENABLED(VEHICLE_INDEX vehIndex, BOOL enabled) = "0x36b3f1be54404061"

//INFO: 
//PARAM NOTES:
// play = true -> play the sound, play = false -> stop it.
//PURPOSE: Plays/stop a fake distant siren sound.
NATIVE PROC DISTANT_COP_CAR_SIRENS(BOOL play) = "0xcfde67f69da0b3e8"

//INFO: 
//PARAM NOTES:
// controlled = true -> vehicle siren controlled by conductor
// controlled = false -> not controlled by siren conductor.
//PURPOSE: Give support to don't allow conductors to control veh siren.
NATIVE PROC SET_SIREN_CAN_BE_CONTROLLED_BY_AUDIO(VEHICLE_INDEX vehIndex,BOOL controlled) = "0x1e081b80e395bb07"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enable the stunt jump audio detection code
// This command is meant to be called continuously while we want that code active
NATIVE PROC ENABLE_STUNT_JUMP_AUDIO() = "0x27d7b460da73d437"

//INFO: 
//PARAM NOTES:
// centrePosition -> centre of the broken glass area (in the ground).
// radius -> radius of the area.
//PURPOSE: Create a broken glass area.
NATIVE PROC RECORD_BROKEN_GLASS(VECTOR centrePosition, FLOAT areaRadius) = "0x7a7c20063da9a0a4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Clear all glass areas.
NATIVE PROC CLEAR_ALL_BROKEN_GLASS() = "0x95ccae5d9e04405c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return the horn sound hash 
NATIVE FUNC INT GET_VEHICLE_DEFAULT_HORN(VEHICLE_INDEX VehicleIndex) = "0x125e8813edfab26f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return the horn sound hash ignoring any horn mods applied to the car
NATIVE FUNC INT GET_VEHICLE_DEFAULT_HORN_IGNORE_MODS(VEHICLE_INDEX VehicleIndex) = "0x1ab7ba13996a24ab"

//INFO: 
//PARAM NOTES:
//PURPOSE: Update the peds cloths and shoes audio.
NATIVE PROC UPDATE_PED_CLOTHING_AND_SHOES(PED_INDEX PedIndex) = "0x218b29a001d13495"

//INFO: 
//PARAM NOTES:
//PURPOSE: Resets ped audio flags.
NATIVE PROC RESET_PED_AUDIO_FLAGS(PED_INDEX PedIndex) = "0x8a30e6dea2ac25bb"

//INFO: 
//PARAM NOTES:
// scriptOverrides -> set it to true to use the mode passed in the modeHash parameter.
// scriptOverrides -> set it to false to stop overriding ( set modeHash to be 0)
//PURPOSE: Set the footstep tuning mode.
NATIVE PROC SET_PED_FOOTSTEP_MODE(PED_INDEX PedIndex, BOOL scriptOverrides, INT modeHash) = "0xdc92ebb7bbd43a08"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set footstep events enabled on a given ped
NATIVE PROC SET_PED_FOOTSTEPS_EVENTS_ENABLED(PED_INDEX PedIndex, BOOL enabed) = "0xa4b6ad042af25671"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enable underwater scuba breath effects on the given ped
NATIVE PROC SET_PED_WEARING_SCUBA_MASK(PED_INDEX PedIndex, BOOL isWearingMask) = "0xf148e0dcb2c2e775"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set cloth events enabled on a given ped
NATIVE PROC SET_PED_CLOTH_EVENTS_ENABLED(PED_INDEX PedIndex, BOOL enabed) = "0x3c012596f5866c99"

//INFO: 
//PARAM NOTES:
// scriptOverrides -> set it to true to use the mode passed in the modeHash parameter.
// scriptOverrides -> set it to false to stop overriding ( set modeHash to be 0)
//PURPOSE: Set the footstep tuning mode.
NATIVE PROC OVERRIDE_PLAYER_GROUND_MATERIAL(INT overriddenMaterialHash,BOOL scriptOverrides) = "0x383ad2d91b55328a"

//INFO: 
//PARAM NOTES:
// use : true the sweetener sounds will play
// soundSetHash : sounds to use.
//PURPOSE: Allows script to trigger a sweetener footstep sound
NATIVE PROC USE_FOOTSTEP_SCRIPT_SWEETENERS(PED_INDEX PedIndex, BOOL use, INT soundSetHash) = "0x610c6ede2d4627d9"

//INFO: This command allows a scripter to override the current underwater stream.
//		It needs to be called before going into the water.  
//		And it needs to also be called with OVERRIDE_UNDERWATER_STREAM("", false)
//		in order to stop overriding.
//		
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC OVERRIDE_UNDERWATER_STREAM(STRING streamName, BOOl override) = "0x7926611c8aac1853"

//INFO: This command allows a scripter to set variables on the current underwater stream. 
//PARAM NOTES:
//PURPOSE: Sets a variable on the current underwater streaming sound.
NATIVE PROC SET_VARIABLE_ON_UNDER_WATER_STREAM(STRING VariableName, FLOAT VariableValue) = "0x9e115306acf84ae1"

//INFO: 
//PARAM NOTES: Name of the mode to activate
//PURPOSE: Activates the named slowmo mode.
NATIVE PROC ACTIVATE_AUDIO_SLOWMO_MODE(STRING mode) = "0x6da0cd62263eca47"
 
//INFO: 
//PARAM NOTES: Name of the mode to deactivate
//PURPOSE: Deactivates the named slowmo mode.
NATIVE PROC DEACTIVATE_AUDIO_SLOWMO_MODE(STRING mode) = "0x691fb3202b3fdffe"

//INFO: 
//PARAM NOTES:
//PURPOSE:  sirenAsHorn -> true will use a more sireny horn if the vehicle has got a siren, false will use a normal horn
NATIVE PROC USE_SIREN_AS_HORN(VEHICLE_INDEX VehicleIndex, BOOl sirenAsHorn) = "0xe57583873c4b123e"

ENUM AUDIO_SPECIAL_EFFECT_MODE
	AUDIO_SPECIAL_EFFECT_MODE_NORMAL,
	AUDIO_SPECIAL_EFFECT_MODE_UNDERWATER,
	AUDIO_SPECIAL_EFFECT_MODE_STONED	
ENDENUM

//INFO:
//PARAM NOTES: Specifies the name of the audio specifial effects mode to activate
//PURPOSE: Controls the global audio special effect mode
NATIVE PROC SET_AUDIO_SPECIAL_EFFECT_MODE(AUDIO_SPECIAL_EFFECT_MODE mode) = "0x085dc39d279ee40f"

//INFO:
//PARAM NOTES: Sets an overridden PortalSettings game object to use when determining audio occlusion
//PURPOSE: For events like cars driving through windows, allows script to unocclude that window
NATIVE PROC SET_PORTAL_SETTINGS_OVERRIDE(STRING OldPortalSettingsName, STRING NewPortalSettingsName) = "0x67bc5545974932c4"

//INFO:
//PARAM NOTES: Sets an overridden PortalSettings game object to use when determining audio occlusion
//PURPOSE: For events like cars driving through windows, allows script to unocclude that window
NATIVE PROC SET_INDIVIDUAL_PORTAL_SETTINGS_OVERRIDE(INT InteriorNameHash, INT roomIndex, INT portalIndex, STRING NewPortalSettingsName) = "0x9f1b1b3c7678d953"

//INFO:
//PARAM NOTES: Cleans out any overriden settings we have for a PortalSettings GO.
//PURPOSE: For events like cars driving through windows, allows script to unocclude that window
NATIVE PROC REMOVE_PORTAL_SETTINGS_OVERRIDE(STRING PortalSettingsName) = "0x3ca223e853957584"

//INFO:
//PARAM NOTES: Cleans out any overriden settings we have for a PortalSettings GO.
//PURPOSE: For events like cars driving through windows, allows script to unocclude that window
NATIVE PROC REMOVE_INDIVIDUAL_PORTAL_SETTINGS_OVERRIDE(INT InteriorNameHash, INT roomIndex, INT portalIndex) = "0x21073d88283831f8"

//INFO: 
//PARAM NOTES:
//PURPOSE:  disable/enable audio sniper feature
NATIVE PROC SET_SNIPER_AUDIO_DISABLE(BOOl enable) = "0xf9cd2627f62e7281"

//INFO: 
//PARAM NOTES:
//PURPOSE:  allows script to freeze the microphone for a single frame, mantaining its current transform/settings. 
// This command should be called every frame you want to keep the microphone frozen, when you stop calling it it will automatically unfreeze
NATIVE PROC FREEZE_MICROPHONE() = "0xb579093da045578f"

//INFO: 
//PARAM NOTES:
//PURPOSE:  allows script to override the current microphone settings.
NATIVE PROC OVERRIDE_MICROPHONE_SETTINGS(INT overriddenMicSettingsHash,BOOL scriptOverrides) = "0xf46237c6eb61354b"

//INFO: 
//PARAM NOTES:
//PURPOSE:  stops all smoke grenade sounds (should be called, for example, at the start of the yoga minigame)
NATIVE PROC STOP_SMOKE_GRENADE_EXPLOSION_SOUNDS() = "0x3b6fc86679cadb21"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Overrides the microphones positions.
NATIVE PROC SET_MICROPHONE_POSITION(BOOl override, VECTOR panningPos,VECTOR vol1Pos,VECTOR vol2Pos) = "0x3eb9c60f0a12c060"

//INFO: 
//PARAM NOTES:
// Intensity -> 0 : Do nothing (to be set when override = false )
// Intensity -> 1 : Low intensity
// Intensity -> 2 : Medium intensity
// Intensity -> 3 : High intensity
//PURPOSE:  Overrides the conductor's gunfight intensity 
NATIVE PROC OVERRIDE_GUNFIGHT_INTENSITY(BOOl override, INT intensity) = "0x415522de5dd2b29e"

//INFO: 
//PARAM NOTES: -warningType - defines the context we want the aircraft warning system to play
//PURPOSE:  Play a line from the aircraft warning system
NATIVE PROC TRIGGER_AIRCRAFT_WARNING_SPEECH(AUD_AIRCRAFT_WARNING_TYPES warningType) = "0x0d3ab7a8a025c96c"

//INFO: 
//PARAM NOTES: 
//PURPOSE:  Returns the current volume slider position from 0 to 10
NATIVE FUNC INT GET_SFX_VOL_SLIDER() = "0x43feefa12a44859a"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Returns the current volume slider position from 0 to 10
NATIVE FUNC INT GET_MUSIC_VOL_SLIDER() = "0x3f42e2c72fcd39ff"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Query whether the audio has loaded the MP data set
NATIVE FUNC BOOL HAS_LOADED_MP_DATA_SET() = "0x1f0893f56c568d39"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Query whether the audio has loaded the SP data set
NATIVE FUNC BOOL HAS_LOADED_SP_DATA_SET() = "0xc4e3c124e0d2ff08"

//INFO: 
//PARAM NOTES: opponentPedIndex - ped index of the non-player tennis participant
//PURPOSE:  Loads the tennis vocalization banks into a couple animal slots
NATIVE PROC REQUEST_TENNIS_BANKS(PED_INDEX opponentPedIndex) = "0xbf56337b6fca39c7"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Unloads the tennis vocalization banks. VERY IMPORTANT TO CALL OR WE'LL NEVER HEAR ANIMALS AGAIN!!!
NATIVE PROC UNREQUEST_TENNIS_BANKS() = "0x440197ac4891d351"

//INFO:
//PARAM NOTES: timeS: time in seconds until the start of the next beat, bpm is current tempo in beats per minute, beatNum is integer beat within the bar
//PURPOSE: Returns information on beat information for any audible music.
NATIVE FUNC BOOL GET_NEXT_AUDIBLE_BEAT(FLOAT &timeS, FLOAT &bpm, INT &beatNum) = "0xcd5b8ecec71faa00"

//INFO:
//PARAM NOTES: timeS: time in seconds until the start of the next beat, bpm is current tempo in beats per minute, beatNum is integer beat within the bar
//PURPOSE: Returns information on beat information for the current track on the specified radio station
NATIVE FUNC BOOL GET_NEXT_BEAT_FOR_STATION(STRING radioStationName, FLOAT &timeS, FLOAT &bpm, INT &beatNum) = "0xd15e24de615a024b"

//INFO:
//PURPOSE: Shut down the current/next tracks for the given radio station
NATIVE PROC SHUT_DOWN_ACTIVE_TRACKS(STRING radioStatioName) = "0x0e91f757c49179cc"

//INFO:
//PARAM NOTES:
//PURPOSE: Stops audio for the current cutscene, e.g. when the cutscene is using overrun audio.
NATIVE PROC STOP_CUTSCENE_AUDIO() = "0xca9941f698b36f0a"

//INFO:
//PURPOSE: Get the time in seconds that the current track has been playing on the given radio station
NATIVE FUNC INT GET_CURRENT_TRACK_PLAY_TIME(STRING radioStationName) = "0x48c9930f53211812"

//INFO:
//PURPOSE: Get the sound name for the track currently playing on the given station
NATIVE FUNC INT GET_CURRENT_TRACK_SOUND_NAME(STRING radioStationName) = "0x07e9d9bdd31f68bd"

//INFO:
//PURPOSE: Get the horn sound index being used by the given vehicle
NATIVE FUNC INT GET_VEHICLE_HORN_SOUND_INDEX(VEHICLE_INDEX VehicleIndex) = "0x4841afe1a236e4e9"

//INFO:
//PURPOSE: Get the horn sound index being used by the given vehicle
NATIVE PROC SET_VEHICLE_HORN_SOUND_INDEX(VEHICLE_INDEX VehicleIndex, INT HornSoundIndex) = "0x2daf1526ef0058ee"

//INFO:
//PURPOSE: Requests the specified music studio session to be loaded.  Please call each frame until returns true, and abort with a time-out for robustness
//RETURNS: True once loaded, False if still loading or failed.
//NATIVE FUNC BOOL MUSIC_STUDIO_LOAD_SESSION(STRING SessionName) = "0xae2b613b2200c4be"

//INFO:
//PURPOSE: Requests a transition to the specified section (0 or 1).  The transition will be queued and actioned on the next musical opportunity
//NATIVE PROC MUSIC_STUDIO_REQUEST_SECTION_TRANSITION(INT SectionIndex) = "0x4c186c29148d3f70"

//INFO:
//PURPOSE: Specifies the variation number to play for the part/section.  It is valid to call this on either section, whether the session is playing or not
//NATIVE PROC MUSIC_STUDIO_SET_PART_VARIATION_INDEX(INT SectionIndex, INT PartIndex, INT VariationIndex) = "0x3d2741167fd60c57"

//INFO:
//PURPOSE: Specifies the volume offset in decibels for the part in the section.  0 = full volume, <-64 = silence
//NATIVE PROC MUSIC_STUDIO_SET_PART_VOLUME(INT SectionIndex, INT PartIndex, FLOAT VolumeDb) = "0x13f24d6072f69481"

//INFO:
//PURPOSE: Triggers playback on the loaded session with the part variations/sections as selected via commands above
//NATIVE PROC MUSIC_STUDIO_START_PLAYBACK() = "0x9440720141a3cccc"

//INFO:
//PURPOSE: Stops playback on the loaded session.  Doesn't unload resources - the session can be restarted by calling MUSIC_STUDIO_START_PLAYBACK without having to first load the session again.
//NATIVE PROC MUSIC_STUDIO_STOP_PLAYBACK() = "0x1077459c2b854375"

//INFO:
//PURPOSE: Unloads the loaded session and frees all resources.  Must be called when the music studio functionality is no longer required.
//NATIVE PROC MUSIC_STUDIO_UNLOAD_SESSION() = "0x3e244cb92e1a00d0"

//INFO:
//PURPOSE: Enables or disabled the low pass filter on the specified part in the specified section
//NATIVE PROC MUSIC_STUDIO_SET_PART_LPF(INT SectionIndex, INT PartIndex, BOOL enableFilter) = "0xb0b6a09783a662e8"

//INFO:
//PURPOSE: Enables or disabled the high pass filter on the specified part in the specified section
//NATIVE PROC MUSIC_STUDIO_SET_PART_HPF(INT SectionIndex, INT PartIndex, BOOL enableFilter) = "0xe014570f63ec2091"

//INFO:
//PARAM NOTES: nextBeatTimeS: time in seconds until the start of the next beat, bpm is current tempo in beats per minute, beatNum is integer beat within the bar, nextSectionTransitionTimeS is seconds until
// section transition
//PURPOSE: Returns information on beat information for any audible music.
//NATIVE PROC MUSIC_STUDIO_GET_TIMING_INFO(FLOAT &nextBeatTimeS, FLOAT &bpm, INT &beatNum, FLOAT &nextSectionTransitionTimeS) = "0x7eff15c2c4e36703"

//INFO:
//PARAM NOTES: 
//PURPOSE: Returns true if a music studio session is playing
//NATIVE FUNC BOOL MUSIC_STUDIO_IS_SESSION_PLAYING() = "0xc18bd9a2fc5bc4ee"

//INFO:
//PARAM NOTES: 
//PURPOSE: Requests that the music session settings (part lpf/hpf/volume/variation) are delayed to the next transition point
//NATIVE PROC MUSIC_STUDIO_REQUEST_DELAYED_SETTINGS() = "0xb7123dd20edcf378"

//INFO:
//PARAM NOTES: 
//PURPOSE: Returns 0 or 1 to indicate the active section.  Note this won't change immediately after calling REQUEST_SECTION_TRANSITION;
// only once the transition has occurred.
//NATIVE FUNC INT MUSIC_STUDIO_GET_ACTIVE_SECTION() = "0x06ffb0826108fb93"

//INFO:
//PARAM NOTES: 
//PURPOSE: Returns the hash of the loaded session name
//NATIVE FUNC INT MUSIC_STUDIO_GET_LOADED_SESSION_HASH() ="0x71ddcd5b080847d1"

//INFO:
//PARAM NOTES: each bool corresponds to solo enable/disable for the associated channel.  If any solos are active, then non-soloed tracks are muted.
//PURPOSE: Controls the solo state of the four channels
//NATIVE PROC MUSIC_STUDIO_SET_SOLO_STATE(BOOL solo1, BOOL solo2, BOOL solo3, BOOL solo4) = "0x7cab158440703153"

//INFO:
//PURPOSE: Allows script to mute the music studio session player when headphones are removed
//NATIVE PROC MUSIC_STUDIO_SET_MUTE_STATE(BOOL muted) = "0x263d3b2cdbb7ee12"

//INFO:
//PURPOSE: Allows script to disable occlusion applied to the session player when headphones are being worn
//NATIVE PROC MUSIC_STUDIO_SET_OCCLUSION_ENABLED(BOOL enabled) = "0xb7f7ff34e54daf22"
