USING "model_enums.sch"
USING "weapon_enums.sch"
USING "types.sch"
USING "eulers.sch"
USING "mp_globals_new_features_tu.sch"
#IF FEATURE_GEN9_STANDALONE
USING "transition_script_router_defs.sch"
#ENDIF

ENUM WEATHER_TYPE
    WEATHER_EXTRASUNNY = 0,
    WEATHER_CLEAR,
    WEATHER_CLOUDS,
	WEATHER_SMOG,
    WEATHER_CLOUDY,
    WEATHER_OVERCAST,
    WEATHER_RAIN,
    WEATHER_THUNDER,
    WEATHER_CLEARING,
    WEATHER_NEUTRAL,
	WEATHER_SNOWLIGHT,
	WEATHER_SNOW,
	WEATHER_BLIZZARD
ENDENUM

ENUM eHUD_PHONE_ITEM
    HUD_PHONE_ITEM_NONE = 0,
    HUD_PHONE_ITEM_TEXT_MESSAGE,
    HUD_PHONE_ITEM_CONTACT,
    HUD_PHONE_ITEM_MEETING,
    HUD_PHONE_ITEM_APPOINTMENT,
    HUD_PHONE_ITEM_REPLAY,
    HUD_PHONE_ITEM_PICTURE_MESSAGE,
    HUD_PHONE_ITEM_DISCONNECT,
    HUD_PHONE_ITEM_FRIEND_INC,
    HUD_PHONE_ITEM_FRIEND_DEC,
    HUD_PHONE_ITEM_INVITE
ENDENUM

ENUM CHEAT_TYPE
    POOR_WEAPON_CHEAT = 0,
    ADVANCED_WEAPON_CHEAT,
    HEALTH_CHEAT,
    WANTED_LEVEL_UP_CHEAT,
    WANTED_LEVEL_DOWN_CHEAT,
    MONEY_UP_CHEAT,
    CHANGE_WEATHER_CHEAT,
    ANNIHILATOR_CHEAT,
    NRG900_CHEAT,
    FBI_CHEAT,
    JETMAX_CHEAT,
    COMET_CHEAT,
    TURISMO_CHEAT,
    COGNOSCENTI_CHEAT,
    SUPERGT_CHEAT,
    SANCHEZ_CHEAT
ENDENUM

ENUM PROFILE_SETTING
    PROFILE_ACTION_AUTO_AIM = 0,
    PROFILE_YAXIS_INVERSION = 1,
    PROFILE_CONTROLLER_VIBRATION = 2,
    PROFILE_CONTROLLER_SENSITIVITY = 3,

	PROFILE_CONTROLLER_SIXAXIS_HELI = 5,
	PROFILE_CONTROLLER_SIXAXIS_BIKE = 6,
	PROFILE_CONTROLLER_SIXAXIS_BOAT = 7,
	PROFILE_CONTROLLER_SIXAXIS_RELOAD = 8,
	PROFILE_CONTROLLER_SIXAXIS_MISSION = 9,
	PROFILE_CONTROLLER_SIXAXIS_ACTIVITY = 10,
	PROFILE_CONTROLLER_SIXAXIS_AFTERTOUCH = 11,
	PROFILE_CONTROLLER_CONTROL_CONFIG = 12,

	PROFILE_CONTROLLER_SNIPER_ZOOM = 17,
	
    PROFILE_VOICE_THRU_SPEAKERS = 100,
    PROFILE_VOICE_MUTED = 101,
    PROFILE_VOICE_VOLUME = 102,

	PROFILE_DISPLAY_SUBTITLES = 203,
	PROFILE_DISPLAY_RADAR_MODE = 204,
	PROFILE_DISPLAY_HUD_MODE = 205,
	PROFILE_DISPLAY_LANGUAGE = 206,
	PROFILE_DISPLAY_GPS = 207,
	PROFILE_DISPLAY_AUTOSAVE_MODE = 208,
	PROFILE_DISPLAY_HANDBRAKE_CAM = 209,
	PROFILE_CONTROLLER_CINEMATIC_SHOOTING = 211,
	PROFILE_DISPLAY_SAFEZONE_SIZE = 212,
	PROFILE_DISPLAY_GAMMA = 213,
	PROFILE_DISPLAY_CAMERA_HEIGHT = 220,
	PROFILE_DIAPLAY_BIG_RADAR = 221,
	PROFILE_DIAPLAY_BIG_RADAR_NAMES = 222,

    PROFILE_AUDIO_SFX_LEVEL = 300,
    PROFILE_AUDIO_MUSIC_LEVEL = 301,
    PROFILE_AUDIO_VOICE_OUTPUT = 302,
    PROFILE_AUDIO_GPS_SPEECH = 303,
    PROFILE_AUDIO_HIGH_DYNAMIC_RANGE = 304,
    PROFILE_AUDIO_SPEAKER_OUTPUT = 305,
    PROFILE_AUDIO_MUSIC_LEVEL_IN_MP = 306,
    PROFILE_AUDIO_INTERACTIVE_MUSIC = 307,
	PROFILE_AUDIO_DIALOGUE_BOOST = 308,
	PROFILE_AUDIO_VOICE_SPEAKER = 309,

	SAVE_MIGRATION_TRANSACTION_ID_WARNING = 501,
	SAVE_MIGRATION_TRANSACTION_ID = 502,

	PROFILE_FEED_PHONE = 800,
	PROFILE_FEED_STATS= 801,
	PROFILE_FEED_CREW = 802,
	PROFILE_FEED_FRIENDS = 803,
	PROFILE_FEED_SOCIAL = 804,
	PROFILE_FEED_STORE = 805,
	PROFILE_FEED_TOOLTIP = 806,
	PROFILE_FEED_DELAY = 807,

	TICKER_JOHN_MARSTON_IS_AVAILABLE = 850,

	GAMER_PLAYED_LAST_GEN = 865, // Indicates if the player has played last gen, 1 - 360, 3 - ps3.
	GAMER_HAS_SPECIALEDITION_CONTENT = 866,  // Indicates if the player is entitled to special edition content

	PROFILE_FACEBOOK_UPDATES = 900,
	ROS_WENT_DOWN_NOT_NET = 901,
	FACEBOOK_POSTED_BOUGHT_GAME = 902,
	PROLOGUE_COMPLETE = 903,
	FACEBOOK_POSTED_ALL_VEHICLES_DRIVEN = 904,
	EULA_VERSION = 905,
	TOS_VERSION = 907,
	PRIVACY_VERSION = 908,

	JOB_ACTIVITY_ID_CHAR0 = 909, //Id of the UGC activity started so we know if the player has pulled the plug.
	JOB_ACTIVITY_ID_CHAR1 = 910, //Id of the UGC activity started so we know if the player has pulled the plug.
	JOB_ACTIVITY_ID_CHAR2 = 911, //Id of the UGC activity started so we know if the player has pulled the plug.
	JOB_ACTIVITY_ID_CHAR3 = 912, //Id of the UGC activity started so we know if the player has pulled the plug.
	JOB_ACTIVITY_ID_CHAR4 = 913, //Id of the UGC activity started so we know if the player has pulled the plug.

	FREEMODE_PROLOGUE_COMPLETE_CHAR0 = 914, //Returns a value !=0 if the prologue was done.
	FREEMODE_PROLOGUE_COMPLETE_CHAR1 = 915, //Returns a value !=0 if the prologue was done.
	FREEMODE_PROLOGUE_COMPLETE_CHAR2 = 916, //Returns a value !=0 if the prologue was done.
	FREEMODE_PROLOGUE_COMPLETE_CHAR3 = 917, //Returns a value !=0 if the prologue was done.
	FREEMODE_PROLOGUE_COMPLETE_CHAR4 = 918, //Returns a value !=0 if the prologue was done.

	MP_FLUSH_POSIXTIME_HIGH32 = 919, //s64 value for the last mp successful profile stats flush.
	MP_FLUSH_POSIXTIME_LOW32  = 920,
	MP_CLOUD0_POSIXTIME_HIGH32 = 921, //s64 value for the last mp successful cloud save.
	MP_CLOUD0_POSIXTIME_LOW32  = 922,
	MP_CLOUD1_POSIXTIME_HIGH32 = 923, //s64 value for the last mp successful cloud save.
	MP_CLOUD1_POSIXTIME_LOW32  = 924,
	MP_CLOUD2_POSIXTIME_HIGH32 = 925, //s64 value for the last mp successful cloud save.
	MP_CLOUD2_POSIXTIME_LOW32  = 926,
	MP_CLOUD3_POSIXTIME_HIGH32 = 927, //s64 value for the last mp successful cloud save.
	MP_CLOUD3_POSIXTIME_LOW32  = 928,

	MP_CLOUD_POSIXTIME_HIGH32 = 931, //s64 value for the last mp successful cloud save.
	MP_CLOUD_POSIXTIME_LOW32  = 932,

	MP_AWD_CREATOR_RACES_DONE  = 933,
	MP_AWD_CREATOR_DM_DONE     = 934,
	MP_AWD_CREATOR_CTF_DONE    = 935,
	MP_CREATOR_RACES_SAVED     = 936,
	MP_CREATOR_DM_SAVED        = 937,
	MP_CREATOR_CTF_SAVED       = 938,

	SP_CHOP_MISSION_COMPLETE   = 939,

	FREEMODE_STRAND_PROGRESSION_STATUS_CHAR0 = 940,
	FREEMODE_STRAND_PROGRESSION_STATUS_CHAR1 = 941,

	MP_CAMERA_ZOOM_ON_FOOT = 950,
	MP_CAMERA_ZOOM_IN_VEHICLE = 951,
	MP_CAMERA_ZOOM_ON_BIKE = 952,
	MP_CAMERA_ZOOM_IN_BOAT = 953,
	MP_CAMERA_ZOOM_IN_AIRCRAFT = 954,
	MP_CAMERA_ZOOM_IN_HELI = 955

ENDENUM


ENUM GRAVITY_LEVEL
    GRAV_EARTH = 0,
    GRAV_MOON,  
	GRAV_LOW,
    GRAV_ZERO
ENDENUM

// keep this in sync with enum in DispatchEnums.h
ENUM DISPATCH_TYPE
    DT_POLICE_AUTOMOBILE = 1,
    DT_POLICE_HELICOPTER,
    DT_FIRE_DEPARTMENT,
    DT_SWAT_AUTOMOBILE,
    DT_AMBULANCE_DEPARTMENT,
    DT_POLICE_RIDERS, 
    DT_POLICE_VEHICLE_REQUEST,
    DT_POLICE_ROAD_BLOCK,
    DT_POLICE_AUTOMOBILE_WAIT_PULLED_OVER,
    DT_POLICE_AUTOMOBILE_WAIT_CRUISING,
    DT_GANGS,
    DT_SWAT_HELICOPTER,
    DT_POLICE_BOAT,
    DT_ARMY_VEHICLE,
    DT_BIKER_BACKUP,
	DT_ASSASSINS
ENDENUM

// keep this in sync with enum in DispatchEnums.h
ENUM ASSASSIN_LEVEL
	AL_LOW = 1,
	AL_MED,
	AL_HIGH
ENDENUM

// Keep this in sync with the enum in virtualkeyboard.h
ENUM OSK_STATUS
	OSK_INVALID = -1,
	OSK_PENDING = 0,
	OSK_SUCCESS = 1,
	OSK_CANCELLED = 2,
	OSK_FAILED = 3
ENDENUM

ENUM RANDOM_EVENT
	RC_PED_STEAL_VEHICLE = 0,
	RC_PED_JAY_WALK_LIGHTS,
	RC_COP_PURSUE,
	RC_COP_PURSUE_VEHICLE_FLEE_SPAWNED,
	RC_COP_VEHICLE_DRIVING_FAST,
	RC_DRIVER_SLOW,
	RC_DRIVER_RECKLESS,
	RC_DRIVER_PRO,
	RC_PED_PURSUE_WHEN_HIT_BY_CAR
ENDENUM

ENUM ELEMENT_LOC_BLOCK
	ELEMENT_LOC_BLOCK_BASE			=	0,
	ELEMENT_LOC_BLOCK_HI_APT		=	1,
	ELEMENT_LOC_BLOCK_EXTRA_1		=	2,
	ELEMENT_LOC_BLOCK_EXTRA_2		=	3,
	ELEMENT_LOC_BLOCK_EXTRA_3		=	4,
	ELEMENT_LOC_BLOCK_EXTRA_4		=	5,
	ELEMENT_LOC_BLOCK_EXTRA_5		=	6,
	ELEMENT_LOC_BLOCK_EXTRA_6		=	7,
	ELEMENT_LOC_BLOCK_EXTRA_7		=	8,
	ELEMENT_LOC_BLOCK_EXTRA_8		=	9,
	ELEMENT_LOC_BLOCK_EXTRA_9		=	10,
	ELEMENT_LOC_BLOCK_EXTRA_10		=	11,
	ELEMENT_LOC_BLOCK_EXTRA_11		=	12,
	ELEMENT_LOC_BLOCK_EXTRA_12		=	13,
	ELEMENT_LOC_BLOCK_EXTRA_13		=	14,
	ELEMENT_LOC_BLOCK_EXTRA_14		=	15
ENDENUM

#if IS_DEBUG_BUILD
//INFO: 
//PARAM NOTES:
//PURPOSE: Start recording events (even if the recorder UI is disabled)
NATIVE PROC DEBUG_RECORD_START() = "0xa90d7a9390bd8f3d"

//INFO: 
//PARAM NOTES:
//PURPOSE: End recording events (even if the recorder UI is disabled)
NATIVE PROC DEBUG_RECORD_END() = "0xabfed591ce971f84"

//INFO: 
//PARAM NOTES: filename to save to
//PURPOSE: Save the current recording to file (even if the recorder UI is disabled)
NATIVE PROC DEBUG_RECORD_SAVE(STRING strFileName) = "0x8ff49609d8384b9b"

//INFO: 
//PARAM NOTES: Entity to restrict to
//PURPOSE: Restrict the recording to events related to this instance (longer recording)
NATIVE PROC DEBUG_RECORD_THIS_ENTITY(ENTITY_INDEX objectIndex) = "0x391c5280f4245775"

//INFO:
//PARAM NOTES: Entity to add to list of recorded entities
//PURPOSE: Restrict the recording to events related to instances added for this entity only, slower than DEBUG_RECORD_THIS_ENTITY or DEBUG_RECORD_ALL_ENTITIES
NATIVE PROC DEBUG_RECORD_ENTITY(ENTITY_INDEX iEntity) = "0x9a4ce63767c521ff"

//INFO:
//PARAM NOTES:
//PURPOSE: Record all entities
NATIVE PROC DEBUG_RECORD_ALL_ENTITIES() = "0x897fa206c9849bbe"

//INFO:
//PARAM NOTES:
//PURPOSE: Clear entities having data recorded
NATIVE PROC DEBUG_RECORD_CLEAR_ENTITIES() = "0x23535bc7b0368aa6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Record a string to the stream (no entity association)
NATIVE PROC DEBUG_RECORD_STRING(STRING strID, STRING strValue) = "0x541bf377d861ed23"

//INFO: 
//PARAM NOTES: id, for graphing and identification, line data
//PURPOSE:
NATIVE PROC DEBUG_RECORD_LINE(STRING strID, VECTOR scrVecA, VECTOR scrVecB, VECTOR scrVecColorA, VECTOR scrVecColorB) = "0x1a100e58fe8dabe2"

//INFO: 
//PARAM NOTES: entity to associate data with, id, for graphing and identification, line data
//PURPOSE:
NATIVE PROC DEBUG_RECORD_ENTITY_LINE(ENTITY_INDEX entityIndex, STRING strID, VECTOR scrVecA, VECTOR scrVecB, VECTOR scrVecColorA, VECTOR scrVecColorB) = "0xccc1adde87802277"

//INFO: 
//PARAM NOTES: id, for graphing and identification, sphere data
//PURPOSE:
NATIVE PROC DEBUG_RECORD_SPHERE(STRING strID, VECTOR scrVecA, FLOAT fRadius, VECTOR scrVecColorA) = "0x1f41e39434616104"

//INFO: 
//PARAM NOTES: entity to associate data with, id, for graphing and identification, sphere data
//PURPOSE:
NATIVE PROC DEBUG_RECORD_ENTITY_SPHERE(ENTITY_INDEX entityIndex, STRING strID, VECTOR scrVecA, FLOAT fRadius, VECTOR scrVecColorA) = "0x1f47c1a96eae8796"

//INFO: 
//PARAM NOTES: object, id for string and string
//PURPOSE: Record a string to the stream (associated with the passed in entity)
NATIVE PROC DEBUG_RECORD_ENTITY_STRING(ENTITY_INDEX objectIndex, STRING strID, STRING strValue) = "0x26ec0a96a7d7fe0e"

//INFO: 
//PARAM NOTES: object, id for value and value
//PURPOSE: Record a float to the stream (associated with the passed in entity)
NATIVE PROC DEBUG_RECORD_ENTITY_FLOAT(ENTITY_INDEX objectIndex, STRING strID, FLOAT fValue) = "0x1060750a8d39db07"

//INFO: 
//PARAM NOTES: object, id for value and value
//PURPOSE: Record a vector to the stream (associated with the passed in entity)
NATIVE PROC DEBUG_RECORD_ENTITY_VECTOR(ENTITY_INDEX objectindex, STRING strID, VECTOR vecValue, BOOL bIsPosition) = "0x64fb1a2f3ad76350"
#endif //IS_DEBUG_BUILD

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the end credits playimg state
NATIVE PROC SET_CREDITS_ACTIVE(BOOL bActive) = "0x291b578efc5bc622"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the end credits to fade out with screen or not (FALSE as default)
NATIVE PROC SET_CREDITS_FADE_OUT_WITH_SCREEN(BOOL bFade) = "0x4b980fe990fd29a0"

//INFO: 
//PARAM NOTES:
//PURPOSE: returns whether the credits have reached the end
NATIVE FUNC BOOL HAVE_CREDITS_REACHED_END() = "0xca215a1d7ffd35cc"

//INFO: 
//PARAM NOTES:
//PURPOSE: returns if the credits are running
NATIVE FUNC BOOL ARE_CREDITS_RUNNING() = "0xa1cec49d70a8bf2c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Creates a random seed 
NATIVE PROC SET_RANDOM_SEED(INT NewSeed) = "0xab6792da769477ef"

//INFO: 
//PARAM NOTES:
//PURPOSE: Creates a random seed for MWC RNG
NATIVE PROC SET_RANDOM_MWC_SEED(INT NewSeed) = "0xb3ba759687828e96"

//INFO: This command will probably only be of use in cut scenes. For a slow motion effect, try setting NewTimeScale to 0.5. 
//          Remember to set the Time Scale back to this once you have finished with the special effect. 
//PARAM NOTES: normal running of the game is 1.0 
//PURPOSE: Sets the time scale of the game to make it run slower. More info..
NATIVE PROC SET_TIME_SCALE(FLOAT fNewTimeScale) = "0x434e3ae126ddc5b5"

//~>                    Miission commands 

//INFO: FlagOnAMission should be a BOOL. Every time the player starts a mission, you must remember to set this variable to TRUE.
//  If the flag is TRUE, it will be set back to FALSE when you call MISSION_HAS_FINISHED.
//  Use this instead of DECLARE_MISSION_FLAG 
//PARAM NOTES:
//PURPOSE: Sets the script as a mission script. More info..
NATIVE PROC SET_MISSION_FLAG(BOOL MissionFlagValue) = "0xbd1f51fb3fa2c6e4"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL GET_MISSION_FLAG() = "0x969475fa6ab2673a"

//PURPOSE: Call this with TRUE when the player chooses to start a random event. This will allow Bugstar to correctly
//			set the bug owner for random event scripts. The flag will automatically be set to FALSE when the script terminates.
NATIVE PROC SET_RANDOM_EVENT_FLAG(BOOL bThisScriptIsARandomEvent) = "0xa560174a439e78f1"

//PURPOSE: Checks if the player is currently on a random event.
NATIVE FUNC BOOL GET_RANDOM_EVENT_FLAG() = "0xe3bbdb1c36703410"

//INFO: Gets the content name to load when the game is launched.
//PARAM NOTES:
//PURPOSE: this is used by the LiveArea on PS4
NATIVE FUNC STRING GET_CONTENT_TO_LOAD() = "0x64ae4acd8b8abba0"

// INFO: Creating a new post, will wipe any currently open posts
// PURPOSE: Creates and opens a new activity feed post to start filling in
NATIVE PROC ACTIVITY_FEED_CREATE(STRING CaptionString, STRING CondensedCaptionString) = "0xf3f7ab8cb18f8672"

// PURPOSE: Adds a substring from gametext to the main caption ...using ~a~ ...which gets translated
NATIVE PROC ACTIVITY_FEED_ADD_SUBSTRING_TO_CAPTION(STRING SubString) = "0x23790f9720c61a64"

// PURPOSE: Adds a literal substring to the main caption ...using ~a~ ...this string is used in all translations
NATIVE PROC ACTIVITY_FEED_ADD_LITERAL_SUBSTRING_TO_CAPTION(STRING SubString) = "0x83016c761162c9b3"

// PURPOSE: Adds a float value to the main caption ...using ~1~
NATIVE PROC ACTIVITY_FEED_ADD_FLOAT_TO_CAPTION(FLOAT SubValue, INT DecimalPoint) = "0xcfb26410637d79ca"

// PURPOSE: Adds a int value to the main caption ...using ~1~
NATIVE PROC ACTIVITY_FEED_ADD_INT_TO_CAPTION(INT SubValue) = "0x382b4843eeac4bee"

// PURPOSE: Adds a small image to the open activity feed post
NATIVE PROC ACTIVITY_FEED_SMALL_IMAGE_URL(STRING urlString, STRING aspectRatio) = "0x4c2138ed18b7ddaa"

// PURPOSE: Adds a large image to the open activity feed post
NATIVE PROC ACTIVITY_FEED_LARGE_IMAGE_URL(STRING urlString) = "0x2cab098edb97dc42"

// PURPOSE: Adds a video to the open activity feed post
NATIVE PROC ACTIVITY_FEED_VIDEO_URL(STRING urlString) = "0xa4bfbde5d14a04b5"

// PURPOSE: Adds a custom story string to the activity feed post
NATIVE PROC ACTIVITY_FEED_POST_CUSTOM_STORY(STRING caption) = "0xc4d9429bf312e605"

// PURPOSE: Adds a browser link button into the open activity feed post
NATIVE PROC ACTIVITY_FEED_ACTION_URL(STRING urlString, STRING labelString) = "0x033f22cad386d2d9"

// PURPOSE: Adds a browser link button into the open activity feed post
NATIVE PROC ACTIVITY_FEED_ACTION_URL_WITH_THUMBNAIL(STRING urlString, STRING labelString, STRING thumbnail) = "0xae452dbe980adcfb"

// PURPOSE: Adds to an existing browser URL
NATIVE PROC ACTIVITY_FEED_ACTION_URL_ADD(STRING urlString) = "0x4a8874357028cab0"

// PURPOSE: Adds a start game button into the open activity feed post
NATIVE PROC ACTIVITY_FEED_ACTION_START_WITH_COMMAND_LINE(STRING commandLineString, STRING labelString) = "0x56740f9b3cf5c107"

// PURPOSE: Adds a start game button into the open activity feed post
NATIVE PROC ACTIVITY_FEED_ACTION_START_WITH_COMMAND_LINE_WITH_THUMBNAIL(STRING commandLineString, STRING labelString, STRING thumbnail) = "0xe15061aad60143bc"

// PURPOSE: Adds a command line command to existing command line
NATIVE PROC ACTIVITY_FEED_ACTION_START_WITH_COMMAND_LINE_ADD(STRING commandLineString) = "0x66a8a07bdb4374ec"

// PURPOSE: Adds a store link button into the open activity feed post
//PARAM NOTES: pass in the  product catagory label for the PS Store
NATIVE PROC ACTIVITY_FEED_ACTION_STORE(STRING productCodeString, STRING labelString) = "0xde7297e83b3c3198"

// PURPOSE: Adds a store link button into the open activity feed post
//PARAM NOTES: pass in the  product catagory label for the PS Store
NATIVE PROC ACTIVITY_FEED_ACTION_STORE_WITH_THUMBNAIL(STRING productCodeString, STRING labelString, STRING thumbnail) = "0xebc2e94e7854050e"

// PURPOSE: Posts and closes the current Activity Feed
NATIVE PROC ACTIVITY_FEED_POST() = "0xdc9fc08ce33c7a1c"

// PURPOSE: Posts a PLAYED_WITH message listing all the players in the session right now
NATIVE PROC ACTIVITY_FEED_ONLINE_PLAYED_WITH_POST(STRING gameMode) = "0x8ae5e7c487444291"

// PURPOSE: Indicates if we have resumed from a suspend.
NATIVE FUNC BOOL HAS_RESUMED_FROM_SUSPEND() = "0xf4c7da2b4577a1a8"

//PURPOSE: Toggles high prio on/off for streaming reuqests coming from this script
NATIVE PROC SET_SCRIPT_HIGH_PRIO(BOOL HighPrio) = "0xeeefcc23227a8148"

//PURPOSE: Call this in trigger scripts that request assets for mission and random character scripts
NATIVE PROC SET_THIS_IS_A_TRIGGER_SCRIPT(BOOL bThisScriptIsATriggerScript) = "0x3e397aa8c35a7536"

//INFO: mission name should be the final ingame mission name with no debug attachments ideally.   Only really needed in debug scripts
//PARAM NOTES:
//PURPOSE: this is to be used by bugstar and by the debug info bar at the bottom of the screen to display mission tag and mission title name
NATIVE PROC SET_MISSION_NAME_DISPLAY(STRING pMissionName) = "0x75712baa1c868552"

//PURPOSE: Call this when a UGC mission begins so that any photos taken during the mission are tagged correctly.
//			When the mission ends, call this command with an empty string
NATIVE PROC INFORM_CODE_OF_CONTENT_ID_OF_CURRENT_UGC_MISSION(STRING ContentIdString) = "0x5878944a227f31f3"


//PURPOSE: Gets base element location data from scriptmetadata
NATIVE FUNC BOOL GET_BASE_ELEMENT_LOCATION_FROM_METADATA(VECTOR &outLocation, VECTOR &outRotation, INT Element, BOOL bHighEndApt = FALSE) = "0xa435716d942bc584"

//PURPOSE: Gets base element location data from scriptmetadata
NATIVE FUNC BOOL GET_BASE_ELEMENT_LOCATION_FROM_METADATA_BLOCK(VECTOR &outLocation, VECTOR &outRotation, INT Element, ELEMENT_LOC_BLOCK blockIndex) = "0x8fbc59b07727a89e"

//~>                Weather commands

//INFO: Gets the hash name of the previous weather type (the one we are currently interpolating from)
NATIVE FUNC INT GET_PREV_WEATHER_TYPE_HASH_NAME() = "0x0831c76f5bf9595e"

//INFO: Gets the hash name of the next weather type (the one we are currently interpolating towards)
NATIVE FUNC INT GET_NEXT_WEATHER_TYPE_HASH_NAME() = "0xb1d36fa656f76888"

//INFO: Checks if the previous weather type (the one we are currently interpolating from) is the same as the string passed
NATIVE FUNC BOOL IS_PREV_WEATHER_TYPE(STRING Weather) = "0x410dfb50be272f58"

//INFO: Checks if the next weather type (the one we are currently interpolating towards) is the same as the string passed
NATIVE FUNC BOOL IS_NEXT_WEATHER_TYPE(STRING Weather) = "0x6dcfe88f29c7556e"

//INFO: The weather type for each level is stored in weather.dat in X:\"current project"\build\dev\common\data\levels\"the level you want"\weather.dat
// The weather types currently are 
//    EXTRASUNNY, CLEAR, CLOUDS, SMOG, CLOUDY, OVERCAST, RAIN, THUNDER, CLEARING, NEUTRAL, SNOWLIGHT, SNOW, BLIZZARD
//PARAM NOTES:
//PURPOSE: Sets the weather type to persist for ever. More info..
NATIVE PROC SET_WEATHER_TYPE_PERSIST(STRING NewWeather) = "0xa32f818f9701571c"

//INFO: The weather string are in weather.dat file
//PARAM NOTES:
//PURPOSE: Sets the weather type immediatly which will persist for ever. More info.. 
NATIVE PROC SET_WEATHER_TYPE_NOW_PERSIST(STRING NewWeather) = "0x9cd86fac92dbe038"

//INFO: The weather string are in weather.dat file
//PARAM NOTES:
//PURPOSE: Sets the weather type immediatly, it will stick for one cycle and then resume update as if the game naturally selected this type.
NATIVE PROC SET_WEATHER_TYPE_NOW(STRING NewWeather) = "0xfd366591424e7542"

//INFO: The weather string are in weather.dat file
//PARAM NOTES: time is the transition time, in seconds.
//PURPOSE: Sets the weather type overt time, once time has passed and the transition is done, it will behave like a SET_WEATHER_TYPE_NOW_PERSIST. 
NATIVE PROC SET_WEATHER_TYPE_OVERTIME_PERSIST(STRING NewWeather, FLOAT time) = "0x95fc0d9ffa87229e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a random weather.
NATIVE PROC SET_RANDOM_WEATHER_TYPE() = "0xe715ced9607d2ece"

//INFO: 
//PARAM NOTES:
//PURPOSE: Clears any persisting weather
NATIVE PROC CLEAR_WEATHER_TYPE_PERSIST() = "0xc4075f869bc19306"

//INFO: 
//PARAM NOTES:
//PURPOSE: Clears any persisting weather and allows a blend back to the network global timer
//         A transition time of 0 will instantly snap
//         Specify in milliseconds
NATIVE PROC CLEAR_WEATHER_TYPE_NOW_PERSIST_NETWORK(INT transitionTime) = "0x18b8b239b6c992fe"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the current weather state
NATIVE PROC GET_CURR_WEATHER_STATE(INT& prevTypeHashName, INT& nextTypeHashName, FLOAT& interpVal) = "0x234904ad6416665b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the current weather state
NATIVE PROC SET_CURR_WEATHER_STATE(INT prevTypeHashName, INT nextTypeHashName, FLOAT interpVal) = "0x325fe91915483aae"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a weather override for network games. This will fix the weather until CLEAR_OVERRIDE_WEATHER is called.
NATIVE PROC SET_OVERRIDE_WEATHER(STRING Weather) = "0x6964c8d9877ab910"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a weather override for network games. This will fix the weather until CLEAR_OVERRIDE_WEATHER is called. ResetWetness=TRUE resets wetness immediately.
NATIVE PROC SET_OVERRIDE_WEATHEREX(STRING Weather, BOOL resetWetness) = "0xdb125694c9cda16b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set some values in water overrides.
NATIVE PROC WATER_OVERRIDE_SET_SHOREWAVEAMPLITUDE(FLOAT value) = "0xb252b5efbe5eac46"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set some values in water overrides.
NATIVE PROC WATER_OVERRIDE_SET_SHOREWAVEMINAMPLITUDE(FLOAT value) = "0x72fcb447b822ff47"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set some values in water overrides.
NATIVE PROC WATER_OVERRIDE_SET_SHOREWAVEMAXAMPLITUDE(FLOAT value) = "0x86ede07c99406ba7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set some values in water overrides.
NATIVE PROC WATER_OVERRIDE_SET_OCEANNOISEMINAMPLITUDE(FLOAT value) = "0xfea2c505215523d7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set some values in water overrides.
NATIVE PROC WATER_OVERRIDE_SET_OCEANWAVEAMPLITUDE(FLOAT value) = "0x77048cb9a5fb0916"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set some values in water overrides.
NATIVE PROC WATER_OVERRIDE_SET_OCEANWAVEMINAMPLITUDE(FLOAT value) = "0x09282630f7e20396"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set some values in water overrides.
NATIVE PROC WATER_OVERRIDE_SET_OCEANWAVEMAXAMPLITUDE(FLOAT value) = "0x84cafc0a42fd76a0"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC WATER_OVERRIDE_SET_RIPPLEBUMPINESS(FLOAT value) = "0x5aa6d432576df799"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set some values in water overrides.
NATIVE PROC WATER_OVERRIDE_SET_RIPPLEMINBUMPINESS(FLOAT value) = "0x1a821c0c65ec99af"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set some values in water overrides.
NATIVE PROC WATER_OVERRIDE_SET_RIPPLEMAXBUMPINESS(FLOAT value) = "0x8786d241002bc8d3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set some values in water overrides.
NATIVE PROC WATER_OVERRIDE_SET_RIPPLEDISTURB(FLOAT value) = "0x81a6481340f8990d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the strength of the water override (0.0 : no overrides, 1.0 : full overrides)
NATIVE PROC WATER_OVERRIDE_SET_STRENGTH(FLOAT strength) = "0xd25cad13a0bd46c9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Fade in a previously setup water override over time seconds.
NATIVE PROC WATER_OVERRIDE_FADE_IN(FLOAT time) = "0x5d5d57e564e3d07b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Fade out a previously setup water override over time seconds.
NATIVE PROC WATER_OVERRIDE_FADE_OUT(FLOAT time) = "0x871782f14f0d7b2d"


//INFO: 
//PARAM NOTES:
//PURPOSE: Stop overridding the global weather (reverts to current global type)
NATIVE PROC CLEAR_OVERRIDE_WEATHER() = "0x92af77f76753447a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the wind value (between 0.0 and 1.0) - set to less than 0.0 to clear
NATIVE PROC SET_WIND(FLOAT WindVal) = "0xab0c65a9ad2e3cff"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the wind speed
NATIVE PROC SET_WIND_SPEED(FLOAT WindSpeed) = "0xc66ad89039f856e2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the wind speed (the wind value multiplied by the max wind speed)
NATIVE FUNC FLOAT GET_WIND_SPEED() = "0xeb79f8939f3e6872"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the maximum allowed wind speed
NATIVE FUNC FLOAT GET_WIND_SPEED_MAX() = "0xe161612575d0216d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the wind direction using (between 0.0 and 2*PI) - set to less than 0.0 to clear
NATIVE PROC SET_WIND_DIRECTION(FLOAT WindDir) = "0xfa33a321c7b93ced"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the wind direction
NATIVE FUNC VECTOR GET_WIND_DIRECTION() = "0x140a8934a5733d96"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the rain value (between 0.0 and 1.0) - set to less than 0.0 to clear
NATIVE PROC SET_RAIN(FLOAT RainVal) = "0xbf9611f192a7c3eb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the current rain level (0.0 -> 1.0)
NATIVE FUNC FLOAT GET_RAIN_LEVEL() = "0x63b191e910106864"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the snow value (between 0.0 and 1.0) - set to less than 0.0 to clear
NATIVE PROC SET_SNOW(FLOAT SnowVal) = "0xe22e7b8fa0c9916a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the current snow level (0.0 -> 1.0)
NATIVE FUNC FLOAT GET_SNOW_LEVEL() = "0xb5e8a19e38498780"

//INFO: 
//PARAM NOTES:
//PURPOSE: Forces lightning flash
NATIVE PROC FORCE_LIGHTNING_FLASH() = "0xd7c2019ec11e9a90"

//INFO: 
//PARAM NOTES:
//PURPOSE: Adds a thermal disturbance to the wind system
NATIVE FUNC INT ADD_WIND_THERMAL(VECTOR VecCoors, FLOAT Radius, FLOAT Height, FLOAT MaxStrength, FLOAT deltaStrength) = "0x37201cd57a9b677f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Removes a thermal disturbance to the wind system
NATIVE PROC REMOVE_WIND_THERMAL(INT index) = "0x480dc99192605686"

//INFO: 
//PARAM NOTES: OverrideSettingsName - the name of the settings to use, "NONE" or NULL to return to normal behavior
//PURPOSE: overrides the clouds settings (which are normally controlled by the weather) with the named version
NATIVE PROC SET_CLOUD_SETTINGS_OVERRIDE(STRING OverrideSettingsName) = "0xd6013c019f519e30"

//INFO: 
//PARAM NOTES: CloudHatName - Preload cloud hat into memory, 
//PURPOSE: forces a cloud hat to stream into memory,even though we are not necesarrily transitioning to it yet (for transitioning to instantly in special cutscenes)
//NOTES: the cloudhat will be released from memory when it either transitions out normaly after use, or RELEASE_PRELOAD_CLOUD_HAT() is called
NATIVE PROC PRELOAD_CLOUD_HAT(STRING CloudHatName) = "0x13f742409efb338e"

//INFO: 
//PARAM NOTES: CloudHatName - Release a cloudhat previously preloaded with PRELOAD_CLOUD_HAT()
//PURPOSE: normally the preloaded cutscene will stream out when it is transitioned off, but if the cutscene is terminated before the cloud hat was actaully used, this needs to be called
//NOTES: in general this should always be called if the cloud hat was loaded via PRELOAD_CLOUD_HAT(). leaving an exrta cloud hat in memory is "A Bad Thing(tm)"
NATIVE PROC RELEASE_PRELOAD_CLOUD_HAT(STRING CloudHatName) = "0x30008e3f5eef01cf"

//INFO: 
//PARAM NOTES: CloudHatName - force a loading of the named cloud hat
//			   TransitionTime - amount of time to fade in the cloudhat, default is 0 seconds.
//PURPOSE: forces a cloud hat to load, reguardless of the current cloud settings
//NOTES: this is to help with tralers, etc. please don't use this in general
NATIVE PROC LOAD_CLOUD_HAT(STRING CloudHatName, FLOAT TransitionTime = 0.0) = "0x52e423fd38f601b9"

//INFO: 
//PARAM NOTES: CloudHatName - force a loading of the named cloud hat
//			   TransitionTime - amount of time to fade out the cloudhat, default is 0 seconds.
//PURPOSE: forces a cloud hat to unload, reguardless of the current cloud settings
//NOTES: this is to help with tralers, etc. please don't use this in general
NATIVE PROC UNLOAD_CLOUD_HAT(STRING CloudHatName, FLOAT TransitionTime = 0.0) = "0xc6d4125eb3ef156d"

//INFO: 
//PARAM NOTES: 
//PURPOSE: forces all cloud hats to unload, reguardless of the current cloud settings
//NOTES: this is to help with tralers, etc. please don't use this in general
NATIVE PROC UNLOAD_ALL_CLOUD_HATS() = "0x967d9549339d0a5b"

//INFO: 
//PARAM NOTES: 
//PURPOSE: 
//NOTES: Set cloud hats alpha. from 0.0 to 1.0.
NATIVE PROC SET_CLOUDS_ALPHA(FLOAT param_alpha) = "0xee1c00f3473ac995"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Reset cloud hats alpha to the default value (usually 1.0)
//NOTES: 
NATIVE PROC RESET_CLOUDS_ALPHA() = "0x8aec426542aa2bd9"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns current cloud hats alpha
//NOTES: 
NATIVE FUNC FLOAT GET_CLOUDS_ALPHA() = "0xd69743921ab3f0f1"

//INFO: The game timer is counted in milliseconds and starts at 0 when the game begins. This command could be useful if you want to trigger something after a number of milliseconds but can’t use a WAIT
//PARAM NOTES:
//PURPOSE: Gets the current game timer in milliseconds.More info..
NATIVE FUNC INT GET_GAME_TIMER() = "0x320d1840b6daa1cc"

//INFO: This number could be useful for profiling. GET_GAME_TIMER should be precise enough for normal gameplay features.
//PARAM NOTES:
//PURPOSE: Gets the number of microseconds that have passed since last time the command was called.
NATIVE FUNC INT GET_NUMBER_OF_MICROSECONDS_SINCE_LAST_CALL() = "0x2250f0db2ed78dee"

//PURPOSE: Returns the number of microseconds since the script timer was last reset. This timer is shared across all script threads. It is reset at the start of each frame
//	before the first script is processed. It can also be reset by calling RESET_SCRIPT_TIME_WITHIN_FRAME()
NATIVE FUNC FLOAT GET_SCRIPT_TIME_WITHIN_FRAME_IN_MICROSECONDS() = "0x165e83a234816d0b"

//PURPOSE: The script timer is shared across all script threads. It is reset at the start of each frame before the first script is processed. 
//	If required, you can also reset it within your script by calling this command.
NATIVE PROC RESET_SCRIPT_TIME_WITHIN_FRAME() = "0x47649a42d455d975"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the time since the last frame (in seconds)
NATIVE FUNC FLOAT  GET_FRAME_TIME() = "0x51109c28352ec9a3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the system time step since the last frame
NATIVE FUNC FLOAT  GET_SYSTEM_TIME_STEP() = "0x74aa3c129f86fc2d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the number of frames
NATIVE FUNC INT  GET_FRAME_COUNT() = "0x8142a6539ddc180f"

//INFO: The command will return TRUE if it finds collision, FALSE if not. 
//PARAM NOTES:
//PURPOSE: Trys to store the Z coordinate of the highest ground below the given point. More info..
NATIVE FUNC BOOL GET_GROUND_Z_FOR_3D_COORD(VECTOR VecCoors, FLOAT& ReturnZ, BOOL waterAsGround = FALSE, BOOL ignoreDistToWaterLevelCheck = FALSE) = "0x9cd4cbf2bbe10f00"

//INFO: The command will return TRUE if it finds collision, FALSE if not. 
//PARAM NOTES:
//PURPOSE: Trys to store the Z coordinate and surface normal of the highest ground below the given point. More info..
NATIVE FUNC BOOL GET_GROUND_Z_AND_NORMAL_FOR_3D_COORD(VECTOR VecCoors, FLOAT& ReturnZ, VECTOR& ReturnNormal) = "0x45d982dae0be3255"

//INFO: The command will return TRUE if it finds collision, FALSE if not. 
//PARAM NOTES:
//PURPOSE: Trys to store the Z coordinate the highest ground below the given point. This test excludes any objects that are on the ground. 
//	if waterAsGround is set to TRUE water will be included in the check and the height of that will be returned if it is greater than the ground
NATIVE FUNC BOOL GET_GROUND_Z_EXCLUDING_OBJECTS_FOR_3D_COORD(VECTOR VecCoors, FLOAT& ReturnZ, BOOL waterAsGround = FALSE, BOOL ignoreDistToWaterLevelCheck = FALSE) = "0x6d2d1393fa9794d3"

//~>                    Math commands

//INFO: 
//PARAM NOTES: Default vaules min float = 0 and max float = 1.0
//PURPOSE: Gets a random float from the range passed in. More info..
NATIVE FUNC  FLOAT GET_RANDOM_FLOAT_IN_RANGE (FLOAT MinFloat = 0.0, FLOAT MaxFloat = 1.0) = "0xc4eab25a108c2429"

//INFO: 
//PARAM NOTES:Default vaules min int = 0 and max int = 65535
//PURPOSE: Gets a random int from the range passed in. More info..
// Be careful - this will only ever return integers between MinInt and (MaxInt-1) inclusive.
//  e.g. GET_RANDOM_INT_IN_RANGE(0, 5) will only ever return 0, 1, 2, 3 or 4. It will never return 5.
NATIVE FUNC INT GET_RANDOM_INT_IN_RANGE(INT MinInt = 0, INT MaxInt = 65535) = "0x5853b15f78e1a265"

//INFO: 
//PARAM NOTES:Default vaules min int = 0 and max int = 65535
//PURPOSE: Gets a random int from the MWC RNG with range passed in. More info..
// Be careful - this will only ever return integers between MinInt and (MaxInt-1) inclusive.
//  e.g. GET_RANDOM_INT_IN_RANGE(0, 5) will only ever return 0, 1, 2, 3 or 4. It will never return 5.
NATIVE FUNC INT GET_RANDOM_MWC_INT_IN_RANGE(INT MinInt = 0, INT MaxInt = 65535) = "0x95f3c8dae5a0339c"

//INFO: see http://en.wikipedia.org/wiki/Inverse_trigonometric_function
//PARAM NOTES:
//PURPOSE: Caluclates the arcsin. More info..
NATIVE FUNC FLOAT ASIN( FLOAT X ) = "0xcd3c356ca8d8298c"

//INFO: see http://en.wikipedia.org/wiki/Inverse_trigonometric_function
//PARAM NOTES:
//PURPOSE: Caluclates the arccos. More info..
NATIVE FUNC FLOAT ACOS( FLOAT X ) = "0x12528dc2778cb217"

//INFO: see http://en.wikipedia.org/wiki/Inverse_trigonometric_function
//PARAM NOTES:
//PURPOSE: Caluclates the tan. More info..
NATIVE FUNC FLOAT TAN( FLOAT X ) = "0x06a2016215b8e171"

//INFO: see http://en.wikipedia.org/wiki/Inverse_trigonometric_function
//PARAM NOTES:
//PURPOSE: Caluclates the arctan. More info..
NATIVE FUNC FLOAT ATAN( FLOAT X ) = "0xe391a81befb0f974"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC FLOAT ATAN2( FLOAT Y, FLOAT X ) = "0xc529d13129c03cf4"

//INFO: The returned value will be between 0 (2 vectors are parallel) to 180.0 (vectors are travelling in opposite directions). 
//PARAM NOTES:
//PURPOSE: Gets the angle in degrees between 2 vectors. More info
NATIVE  FUNC FLOAT GET_ANGLE_BETWEEN_2D_VECTORS(FLOAT X1, FLOAT Y1, FLOAT X2, FLOAT Y2) = "0x952f3fa2e7880565"

//INFO: For 2d checks use only the x and y components of the vector as the z value is zeroed by the code.
//PARAM NOTES:
//PURPOSE: Gets the distance between 2 coords. More info..
NATIVE FUNC FLOAT GET_DISTANCE_BETWEEN_COORDS (VECTOR VecFirstCoors, VECTOR VecSecondCoors, BOOL bCheck3d = TRUE) = "0x987a5f1e1a67e3c0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets a heading in degrees between teh x and y vector components.
NATIVE FUNC FLOAT GET_HEADING_FROM_VECTOR_2D(FLOAT VecX, FLOAT VecY) = "0xd12efcab87804bed"

//INFO: 
//PARAM NOTES:
//PURPOSE: Does a line interect a plane? If so return the tvalue so the caller can easily calculate where
//RETURNS: True if the line segment intersects the plane
NATIVE FUNC BOOL GET_LINE_PLANE_INTERSECTION(VECTOR vscrPntA, VECTOR vscrPntB, VECTOR vscrPntOnPlane, VECTOR vscrNormal, FLOAT &fTValue) = "0xdfaf13813077792a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Do two given point areas overlap?
//RETURNS: True if the point areas overlap
NATIVE FUNC BOOL GET_POINT_AREA_OVERLAP(VECTOR A1, VECTOR A2, FLOAT AWidth, VECTOR B1, VECTOR B2, FLOAT BWidth) = "0xc25227ffc64097ff"

//INFO: 
//PARAM NOTES:
//PURPOSE: Find the tValue of the closest point between a point and a line
//RETURNS: tValue of closest point, CLAMPED to line if bClampToLine is set
NATIVE FUNC FLOAT GET_RATIO_OF_CLOSEST_POINT_ON_LINE(VECTOR rPointToTest, VECTOR vStart, VECTOR vEnd, BOOL bClampToLine=TRUE) = "0xd7500bc8646dab0d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Find the tValue of the closest point between a point and a line
//RETURNS: VECTOR of closest point, CLAMPED to line if bClampToLine is set
//UNCOMMENT WHEN SCRIPT VARIENTS ARE REMOVED
NATIVE FUNC VECTOR GET_CLOSEST_POINT_ON_LINE(VECTOR rPointToTest, VECTOR vStart, VECTOR vEnd, BOOL bClampToLine=TRUE) = "0x291018e753a9a0ad"

//INFO: See http://en.wikipedia.org/wiki/Absolute_value
//PARAM NOTES:
//PURPOSE: Checks the absolute value for an int, any negtaives will be returned as positive. More info..
NATIVE FUNC INT ABSI(INT n) = "0x07141611fd632b59"

//INFO: See http://en.wikipedia.org/wiki/Absolute_value
//PARAM NOTES:
//PURPOSE: Checks the absolute value for an float, any negtaives will be returned as positive. More info..
NATIVE FUNC FLOAT ABSF(FLOAT n) = "0x48053974ed6f63ce"

//INFO: 
//PARAM NOTES: The index (BitToCheckIndex) passed must be between 0 and 31 or the command will ASSERT. 
//PURPOSE: Checks if the integer (IntToCheck) passed has the bit set at the index (BitToCheckIndex) passed.More info..
//NOTE: This function has been swapped out in the ragescript compiler for an opcode instead. The compiler uses a strcmp
//		on the name so if you rename this function, make sure to fix up the compiler as well.
NATIVE FUNC BOOL IS_BIT_SET(int Variable, int BitIndex) = "0xe2d0c323a1ae5d85"

//INFO: 
//PARAM NOTES:The index (BitToSetIndex) passed must be between 0 and 31 or the command will ASSERT.
//PURPOSE: Sets the bit at the index (BitToSetIndex) of the integer (IntToModify) passed. More info..
NATIVE PROC SET_BIT(int &Variable, int BitIndex) = "0xced9e32812d6c7c7"

//INFO: 
//PARAM NOTES:The index (BitToClearIndex) passed must be between 0 and 31 or the command will ASSERT. 
//PURPOSE: Clear the bit at the index (BitToClearIndex) of the integer (IntToModify) passed. More info..
NATIVE PROC CLEAR_BIT(int &Variable, int BitIndex) = "0xb0550bc91b0159d6"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_BITS_IN_RANGE ( INT &VariableToChange, INT StartBit, INT EndBit, INT NewValue ) = "0x66daaa2eabb846b9"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC INT GET_BITS_IN_RANGE ( INT VariableToRead, INT StartBit, INT EndBit ) = "0xf6cf013e72c680b4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Slerps a qauterion beetween start and target, with the result qauterion returned. 
NATIVE PROC SLERP_NEAR_QUATERNION( FLOAT Time, FLOAT StartX, FLOAT StartY, FLOAT StartZ, FLOAT StartW, FLOAT DestinationX, FLOAT DestinationY, FLOAT DestinationZ, FLOAT DestinationW, FLOAT& ResultX, FLOAT& ResultY, FLOAT& ResultZ, FLOAT& ResultW ) = "0x6d60832059befca5"

//~>                Area commands

//INFO:  
//PARAM NOTES: ExludedEntityIndex (Optional) allows for an entity that is ignored by the area check.  bCheckAlive will only look for living peds if true
//PURPOSE: Checks if an area is ocupied by an entity/entities..
NATIVE FUNC BOOL IS_AREA_OCCUPIED(VECTOR VecMinCoors, VECTOR VecMaxCoors, BOOL bBuildingFlag, BOOL bVehicleFlag, BOOL bPedFlag, BOOL bObjectFlag, BOOL bDummyFlag, ENTITY_INDEX ExcludeEntityIndex = NULL, BOOL bCheckAlive = FALSE) = "0x15c2370f75b1b388"

//INFO: Only cosinder using this if IS_AREA_OCCUPIED is not working properly. This version is more expensive, but should be more accurate.
//PARAM NOTES: ExludedEntityIndex (Optional) allows for an entity that is ignored by the area check.  bCheckAlive will only look for living peds if true
//PURPOSE: Checks if an area is ocupied by an entity/entities..
NATIVE FUNC BOOL IS_AREA_OCCUPIED_SLOW(VECTOR VecMinCoors, VECTOR VecMaxCoors, BOOL bBuildingFlag, BOOL bVehicleFlag, BOOL bPedFlag, BOOL bObjectFlag, BOOL bDummyFlag, ENTITY_INDEX ExcludeEntityIndex = NULL, BOOL bCheckAlive = FALSE) = "0x6ea66e1eac07ca8c"

//INFO:  
//PARAM NOTES: ExludedEntityIndex (Optional) allows for an entity that is ignored by the area check.  bCheckAlive will only look for living peds if true
//PURPOSE: Checks if an sphere around the given center point is ocupied by an entity/entities..
NATIVE FUNC BOOL IS_POSITION_OCCUPIED(VECTOR VecCenterCoors, FLOAT radius, BOOL bBuildingFlag, BOOL bVehicleFlag, BOOL bPedFlag, BOOL bObjectFlag, BOOL bDummyFlag, ENTITY_INDEX ExcludeEntityIndex = NULL, BOOL bCheckAlive = FALSE) = "0x90bd7eb173e1cfd6"

//INFO: 
//PARAM NOTES: ExludedEntityIndex (Optional) allows for an entity that is ignored by the area check
//PURPOSE: Returns TRUE if any mission-created vehicles, peds or objects are in the defined area. 
NATIVE FUNC BOOL IS_POINT_OBSCURED_BY_A_MISSION_ENTITY (VECTOR VecCentreCoors, VECTOR VecLocateDimensions, ENTITY_INDEX ExcludeEntityIndex = NULL) = "0x488e34a772939b4c"

//INFO: All fires and explosions in the area are also cleared
//PARAM NOTES: All projectiles in the world are removed if DeleteProjectilesFlag is set to TRUE. 
//PURPOSE: Clears all non-mission cars and peds within the defined sphere. More info..
NATIVE PROC CLEAR_AREA(VECTOR VecCentreCoors, FLOAT Radius, BOOL DeleteProjectilesFlag, BOOL LeaveCarGenCars = FALSE, BOOL ClearLowPriorityPickupsOnly = FALSE, BOOL Broadcast = FALSE) = "0x7a997a0a971d305f"

//INFO: All fires and explosions in the area are also cleared
//PARAM NOTES: All projectiles in the world are removed if DeleteProjectilesFlag is set to TRUE. 
//PURPOSE: Clears all non-mission cars and peds within the defined sphere but does not change the vehicle health
NATIVE PROC CLEAR_AREA_LEAVE_VEHICLE_HEALTH(VECTOR VecCentreCoors, FLOAT Radius, BOOL DeleteProjectilesFlag, BOOL LeaveCarGenCars = FALSE, BOOL ClearLowPriorityPickupsOnly = FALSE, BOOL Broadcast = FALSE) = "0xd414399d29212438"

//INFO:
//PARAM NOTES: Broadcast: if set an event is sent over the network in MP to do the same clear area on all other machines. Please avoid using this if you can.
//PURPOSE: Clears all projectiles within specified volume.
NATIVE PROC CLEAR_AREA_OF_PROJECTILES(VECTOR vPos, FLOAT fRadius, BOOL Broadcast = FALSE) = "0x917f631782a9cb32"

//INFO: 
//PARAM NOTES: Broadcast: if set an event is sent over the network in MP to do the same clear area on all other machines. Please avoid using this if you can.
//PURPOSE: Clears all non-mission vehicles within the defined sphere. 
NATIVE PROC CLEAR_AREA_OF_VEHICLES(VECTOR VecCentreCoors,  FLOAT Radius, BOOL LeaveCarGenCars = FALSE, BOOL CheckViewFrustum = FALSE, BOOL IfWrecked = FALSE, BOOL IfAbandoned = FALSE, BOOL Broadcast = FALSE, BOOL IfEngineOnFire = FALSE, BOOL KeepScriptTrains = FALSE) = "0x02b222eadc9dc566"

//INFO: 
//PARAM NOTES: Broadcast: if set an event is sent over the network in MP to do the same clear area on all other machines. Please avoid using this if you can.
//PURPOSE: Clears the non axis aligned area of all all non-mission vehicles 
// ** CURRENTLY NOT SUPPORTED IN MP if Broadcast is set **
NATIVE PROC CLEAR_ANGLED_AREA_OF_VEHICLES (VECTOR vecAngledAreaPoint1, VECTOR vecAngledAreaPoint2, FLOAT DistanceOfOppositeFace, BOOL LeaveCarGenCars = FALSE, BOOL Broadcast = FALSE, BOOL CheckViewFrustum = FALSE, BOOL IfWrecked = FALSE, BOOL IfAbandoned = FALSE, BOOL IfEngineOnFire = FALSE, BOOL KeepScriptTrains = FALSE) = "0x17b104183e0f2c46"

ENUM CLEAROBJECTS_FLAGS
	CLEAROBJ_FLAG_BROADCAST				= 1,
	CLEAROBJ_FLAG_FORCE					= 2,
	CLEAROBJ_FLAG_INCLUDE_DOORS			= 4,
	CLEAROBJ_FLAG_INCLUDE_OBJWITHBRAINS	= 8,
	CLEAROBJ_FLAG_EXCLUDE_LADDERS		= 16
ENDENUM

//INFO: 
//PARAM NOTES: Broadcast: if set an event is sent over the network in MP to do the same clear area on all other machines. Please avoid using this if you can.
//PURPOSE: Clears all non-mission objects within the defined sphere. 
NATIVE PROC CLEAR_AREA_OF_OBJECTS(VECTOR VecCentreCoors, FLOAT Radius, CLEAROBJECTS_FLAGS controlFlags = 0) = "0xdc226c748c3c868d"

//INFO: 
//PARAM NOTES: Broadcast: if set an event is sent over the network in MP to do the same clear area on all other machines. Please avoid using this if you can.
//PURPOSE: Clears all non-mission peds within the defined sphere. 
NATIVE PROC CLEAR_AREA_OF_PEDS(VECTOR VecCentreCoors, FLOAT Radius, BOOL Broadcast = FALSE) = "0xf96094a43d443c41"

//INFO: 
//PARAM NOTES: Broadcast: if set an event is sent over the network in MP to do the same clear area on all other machines. Please avoid using this if you can.
//PURPOSE: Clears all non-mission cops within the defined sphere. 
NATIVE PROC CLEAR_AREA_OF_COPS(VECTOR VecCentreCoors, FLOAT Radius, BOOL Broadcast = FALSE) = "0xcb583354ea6e5e4a"

//INFO:
//PARAM NOTES
//PURPOSE:  Clears all scenario spawn history, including chain histories for deleted peds.
NATIVE PROC CLEAR_SCENARIO_SPAWN_HISTORY() = "0x49bd8a3aec4c4cf4"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Checks that the sniper bullet is a area.
NATIVE FUNC BOOL IS_SNIPER_BULLET_IN_AREA(VECTOR VecMinCoors, VECTOR VecMaxCoors) = "0x42b9e261d7c3ebbf"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that a projectile object is in the area.
NATIVE FUNC BOOL IS_PROJECTILE_IN_AREA(VECTOR VecMinCoors, VECTOR VecMaxCoors, BOOL bIsPlayer=FALSE) = "0x863026e0c5c2e52b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that a projectile object of the specified type is in the area.
NATIVE FUNC BOOL IS_PROJECTILE_TYPE_IN_AREA(VECTOR VecMinCoors, VECTOR VecMaxCoors, WEAPON_TYPE WeaponType, BOOL bIsPlayer=FALSE) = "0xa1c6623fc1047dad"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that a projectile object of the specified type is within distance, from ped and returns the youngest
NATIVE FUNC BOOL GET_COORDS_OF_PROJECTILE_TYPE_WITHIN_DISTANCE(PED_INDEX ped, WEAPON_TYPE WeaponType, FLOAT distance, VECTOR & positionOut, BOOL needsToBeStationary=FALSE ) = "0xe3d651a33d0fad23"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that a projectile object of the specified type is within distance, from ped and returns the youngest, used to also get the projectile entity
NATIVE FUNC BOOL GET_PROJECTILE_OF_PROJECTILE_TYPE_WITHIN_DISTANCE(PED_INDEX ped, WEAPON_TYPE WeaponType, FLOAT distance, VECTOR & positionOut, ENTITY_INDEX & EntityIndex, BOOL needsToBeStationary=FALSE) = "0x367885498c2037bd"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that a projectile object of the specified type is in the angled area.
NATIVE FUNC BOOL IS_PROJECTILE_TYPE_IN_ANGLED_AREA(VECTOR vecAngledAreaPoint1, VECTOR vecAngledAreaPoint2, FLOAT DistanceOfOppositeFace, WEAPON_TYPE WeaponType, BOOL bIsPlayer=FALSE) = "0x2767353d989432a3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that a projectile object of the specified type is in a sphere
NATIVE FUNC BOOL IS_PROJECTILE_TYPE_WITHIN_DISTANCE(VECTOR vecCoors, WEAPON_TYPE WeaponType, FLOAT distance, BOOL bIsPlayer=FALSE) = "0xedf30c9168b336d8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that a projectile object of the specified type is in the area and returns it's position
NATIVE FUNC BOOL GET_COORDS_OF_PROJECTILE_TYPE_IN_AREA(VECTOR VecMinCoors, VECTOR VecMaxCoors, WEAPON_TYPE WeaponType, VECTOR & positionOut, BOOL bIsPlayer=FALSE) = "0x42b0867e406ec2ae"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that a projectile object of the specified type is in the angled area and returns it's position
NATIVE FUNC BOOL GET_COORDS_OF_PROJECTILE_TYPE_IN_ANGLED_AREA(VECTOR vecAngledAreaPoint1, VECTOR vecAngledAreaPoint2, FLOAT DistanceOfOppositeFace, WEAPON_TYPE WeaponType, VECTOR & positionOut, BOOL bIsPlayer=FALSE) = "0x0338ae308befb34d"

//INFO: 
//PARAM NOTES:bIsPlayer checks if the player fired the bullet.
//PURPOSE: Checks that a bullet is in the defined angled area.
NATIVE FUNC BOOL IS_BULLET_IN_ANGLED_AREA(VECTOR VecPos1, VECTOR VecPos2, FLOAT AreaWidth, BOOL bIsPlayer=TRUE) = "0x42d790a6634dc8dc"

//INFO: 
//PARAM NOTES:bIsPlayer checks if the player fired the bullet.
//PURPOSE: Checks that a bullet is in the defined sphere. More info..
NATIVE FUNC BOOL IS_BULLET_IN_AREA(VECTOR VecCoors, FLOAT Radius, BOOL bIsPlayer=TRUE) = "0x9ac74c7ef847a074"

//INFO: 
//PARAM NOTES: bIsPlayer checks if the player fired the bullet.
//PURPOSE: Checks that a bullet is in the area.  More info..
NATIVE FUNC BOOL IS_BULLET_IN_BOX(VECTOR VecMinCoors,  VECTOR VecMaxCoors, BOOL bIsPlayer=TRUE) = "0x4cb6acee3ea17cc9"

//INFO:
//PARAM NOTES:  bIsPlayer checks if the player fired the bullet.
//              bEntryOnly=TRUE will only find entry impacts.  =FALSE will find both entry and exit impacts
//PURPOSE: Finds a bullet impact in the defined sphere
NATIVE FUNC BOOL HAS_BULLET_IMPACTED_IN_AREA(VECTOR VecCoors, FLOAT Radius, BOOL bIsPlayer=TRUE, BOOL bEntryOnly=TRUE) = "0x81c70e8a536aac9e"

//INFO:
//PARAM NOTES:  bIsPlayer checks if the player fired the bullet.
//              bEntryOnly=TRUE will only find entry impacts.  =FALSE will find both entry and exit impacts
//PURPOSE: Finds a bullet impact in the box
NATIVE FUNC BOOL HAS_BULLET_IMPACTED_IN_BOX(VECTOR VecMinCoors, VECTOR VecMaxCoors, BOOL bIsPlayer=TRUE, BOOL bEntryOnly=TRUE) = "0xc73d3966feed8c9c"

//INFO:
//PARAM NOTES:  bEntryOnly=TRUE will only find entry impacts.  =FALSE will find both entry and exit impacts
//PURPOSE: Determines whether or not a bullet has hit behind a plane
NATIVE FUNC BOOL HAS_BULLET_IMPACTED_BEHIND_PLANE(VECTOR VecPlanePoint, VECTOR VecPlaneNormal, BOOL bEntryOnly=TRUE) = "0xed02ab40f9b6feb6"

//INFO:
//PARAM NOTES:  bIsPlayer checks if the player fired the bullet.
//              bEntryOnly=TRUE will only find entry impacts.  =FALSE will find both entry and exit impacts
//PURPOSE: Counts the bullet impacts in the defined sphere
NATIVE FUNC INT GET_NUM_BULLETS_IMPACTED_IN_AREA(VECTOR VecCoors, FLOAT Radius, BOOL bIsPlayer=TRUE, BOOL bEntryOnly=TRUE) = "0x91d2f1868e0793c4"

//INFO:
//PARAM NOTES:  bIsPlayer checks if the player fired the bullet.
//              bEntryOnly=TRUE will only find entry impacts.  =FALSE will find both entry and exit impacts
//PURPOSE: Counts the bullet impacts in the box
NATIVE FUNC INT GET_NUM_BULLETS_IMPACTED_IN_BOX (VECTOR VecMinCoors, VECTOR VecMaxCoors, BOOL bIsPlayer=TRUE, BOOL bEntryOnly=TRUE) = "0x2c800874540f4f3b"

#IF FEATURE_GEN9_STANDALONE
//INFO:
//PARAM NOTES:  contextData: the struct to be populated
//PURPOSE: populates a SCRIPT_ROUTER_CONTEXT_DATA struct from the pending script router link, returns true if struct was populated
NATIVE FUNC BOOL GET_SCRIPT_ROUTER_CONTEXT(SCRIPT_ROUTER_CONTEXT_DATA &contextData) = "0xd3b3a6d194fb6d3b"

//INFO:
//PARAM NOTES:  contextData: the data used to compose and set the link
//PURPOSE: sets a pending script router link, returns true if link was set successfully
NATIVE FUNC BOOL SET_SCRIPT_ROUTER_LINK(SCRIPT_ROUTER_CONTEXT_DATA &contextData) = "0x5d22dae27ef205b3"

//INFO:
//PARAM NOTES:  
//PURPOSE: returns a hashed value of the pending script router link
NATIVE FUNC INT GET_SCRIPT_ROUTER_LINK_HASH() = "0x8267ec27aa1bb696"

//INFO:
//PARAM NOTES:  
//PURPOSE: returns true if there is a valid pending script router link
NATIVE FUNC BOOL HAS_PENDING_SCRIPT_ROUTER_LINK() = "0x15aad97a998e81ba"

//INFO:
//PARAM NOTES:  
//PURPOSE: clear the script router link
NATIVE PROC CLEAR_SCRIPT_ROUTER_LINK() = "0x63d53e11c1c1cce3"

//INFO:
//PARAM NOTES: the invalid argument
//PURPOSE: report an invalid script router link argument for handling in code
NATIVE PROC REPORT_INVALID_SCRIPT_ROUTER_ARGUMENT(STRING argument) = "0x87acffe5c7610714"

//INFO:
//PARAM NOTES:  true/false to enable/disable UDS Activity Script Routing
//PURPOSE: Set UDS Activity Script Routing Enabled value
NATIVE PROC SET_ACTIVITY_SCRIPT_ROUTING_ENABLED(BOOL bEnabled) = "0xa4523cd8e76ff12d"

#ENDIF

//~>                    Save commands

ENUM SAVEGAME_OPERATION_STATUS
	SAVEGAME_OPERATION_SUCCEEDED,
	SAVEGAME_OPERATION_IN_PROGRESS,
	SAVEGAME_OPERATION_FAILED
ENDENUM


//INFO: 
//PARAM NOTES:
//PURPOSE: Displays the save menu.
NATIVE PROC SET_SAVE_MENU_ACTIVE(BOOL bAllowWhilePlayerIsInAVehicle = FALSE) = "0xe708f785c0b6cb98"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that the save completed.
NATIVE FUNC BOOL DID_SAVE_COMPLETE_SUCCESSFULLY() = "0x05706e34f1c87047"

//PURPOSE: Returns the status of the manual save that is launched by SET_SAVE_MENU_ACTIVE()
NATIVE FUNC SAVEGAME_OPERATION_STATUS GET_STATUS_OF_MANUAL_SAVE() = "0x889492759cde5b07"

//INFO: 
//PARAM NOTES:
//PURPOSE: Runs an auto save.
NATIVE PROC DO_AUTO_SAVE () = "0x090f3b7471315852"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the autosave option has been turned off in the game's frontend
NATIVE FUNC BOOL GET_IS_AUTO_SAVE_OFF() = "0x1a02fc35b2cea0b1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the "saving", "loading" or "load successful" help message is currently on-screen
NATIVE FUNC BOOL GET_IS_DISPLAYING_SAVE_MESSAGE() = "0xb4b43085c1b27f3f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if an autosave is currently in progress or has been queued to be done after other savegame operations have finished.
NATIVE FUNC BOOL IS_AUTO_SAVE_IN_PROGRESS() = "0x07ad9e67f357c655"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if an autosave has been requested by code.
NATIVE FUNC BOOL HAS_CODE_REQUESTED_AUTOSAVE() = "0x07e4b614127ef0b9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Resets the code requested autosave boolean to false.
NATIVE PROC CLEAR_CODE_REQUESTED_AUTOSAVE() = "0xc2d330547506b393"

//PURPOSE: When the player passes a replay mission, call this command first
NATIVE PROC BEGIN_REPLAY_STATS(INT MissionId, INT MissionType) = "0x3e9c72be85529fca"

//PURPOSE: When the player passes a replay mission, call this command for each of the stats that the mission has to update
NATIVE PROC ADD_REPLAY_STAT_VALUE(INT ValueOfStat) = "0x0bc5939c2b796f37"

//PURPOSE: When the player passes a replay mission, call this command after you've finished calling ADD_REPLAY_STAT_VALUE
NATIVE PROC END_REPLAY_STATS() = "0x7c6521e71e7516ff"


//PURPOSE: At the start of a new session if the script detects that a mission replay savegame has just loaded, call this command to confirm that there are replay stats to update
NATIVE FUNC BOOL HAVE_REPLAY_STATS_BEEN_STORED() = "0x816bb3ea7eff7ae0"

//PURPOSE: At the start of a new session, you can call this command if the script detects that a mission replay savegame has just loaded and HAVE_REPLAY_STATS_BEEN_STORED() has returned TRUE
NATIVE FUNC INT GET_REPLAY_STAT_MISSION_ID() = "0x9452928d5e202744"

//PURPOSE: At the start of a new session, you can call this command if the script detects that a mission replay savegame has just loaded and HAVE_REPLAY_STATS_BEEN_STORED() has returned TRUE
NATIVE FUNC INT GET_REPLAY_STAT_MISSION_TYPE() = "0x239a5a4365d45418"

//PURPOSE: At the start of a new session, you can call this command if the script detects that a mission replay savegame has just loaded and HAVE_REPLAY_STATS_BEEN_STORED() has returned TRUE
NATIVE FUNC INT GET_REPLAY_STAT_COUNT() = "0x40b3ae143c0ad363"

//PARAM NOTES: ArrayIndex should be >=0 and less than the value returned by GET_REPLAY_STAT_COUNT()
//PURPOSE: At the start of a new session, you can call this command if the script detects that a mission replay savegame has just loaded and HAVE_REPLAY_STATS_BEEN_STORED() has returned TRUE.
//	Once you've read all the replay stats, you should trigger an autosave so that the updated stats get saved.
NATIVE FUNC INT GET_REPLAY_STAT_AT_INDEX(INT ArrayIndex) = "0x8ee1969ab2d0232f"

//PURPOSE: This command should probably be called at the start of every session. Call it after you've used the five commands above to deal with any stored replay stats.
NATIVE PROC CLEAR_REPLAY_STATS() = "0x4a38a0835fed135b"


//PURPOSE: Once a mission repeat has finished, call this command to shut down the session and load the last save made by QUEUE_MISSION_REPEAT_SAVE()
NATIVE FUNC BOOL QUEUE_MISSION_REPEAT_LOAD() = "0x70a108100ab45cd7"

NATIVE FUNC SAVEGAME_OPERATION_STATUS GET_STATUS_OF_MISSION_REPEAT_LOAD() = "0xab63a5455a68d6c1"

NATIVE PROC CLEAR_STATUS_OF_MISSION_REPEAT_LOAD() = "0x0756649919c96d14"


//PURPOSE: Before starting a mission repeat, call this command to save the current state of the game in the special savegame slot that is only used by mission repeats
NATIVE FUNC BOOL QUEUE_MISSION_REPEAT_SAVE() = "0x18e2479a36402e8d"

//PURPOSE: The only difference between this command and QUEUE_MISSION_REPEAT_SAVE() is that this command mentions the PC Benchmark Test (instead of Mission Replays) in its warning screens.
NATIVE FUNC BOOL QUEUE_MISSION_REPEAT_SAVE_FOR_BENCHMARK_TEST() = "0xe799476ecf831fe3"

//PURPOSE: Check the status of the save triggered by QUEUE_MISSION_REPEAT_SAVE() or QUEUE_MISSION_REPEAT_SAVE_FOR_BENCHMARK_TEST()
NATIVE FUNC SAVEGAME_OPERATION_STATUS GET_STATUS_OF_MISSION_REPEAT_SAVE() = "0x0c76dfddcbb67a06"

NATIVE PROC CLEAR_STATUS_OF_MISSION_REPEAT_SAVE() = "0xeb0b7f57c096cfde"


//INFO: 
//PARAM NOTES:
//PURPOSE: Will return TRUE if autosave is switched off in frontend or the saving spinning disc help message is being displayed.More info..
NATIVE FUNC BOOL CAN_START_MISSION_PASSED_TUNE() = "0xd4ca97b2ea1d6e7b"

//INFO: 
//PARAM NOTES:
//PURPOSE:  CHeks if a memory card is in use.
NATIVE FUNC BOOL IS_MEMORY_CARD_IN_USE() = "0x92b900558e4a1e49"


//~>                        Script commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Terminates all scripts with the specified name.
NATIVE PROC TERMINATE_ALL_SCRIPTS_WITH_THIS_NAME(STRING NameOfScriptToTerminate) = "0xcb67cdee283e73dc"


//INFO: 
//PARAM NOTES:
//PURPOSE:  If this command is called with FALSE then this script will not be paused if another script calls PAUSE_GAME
NATIVE PROC SET_THIS_SCRIPT_CAN_BE_PAUSED(BOOL bScriptCanBePaused) = "0x2c07cbafac54a645"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Required so that the debug and main scripts are able to remove blips created by other scripts
//              when Keith's game flow code skips forward or back
NATIVE PROC SET_THIS_SCRIPT_CAN_REMOVE_BLIPS_CREATED_BY_ANY_SCRIPT(BOOL bCanRemoveBlipsCreatedByOtherScripts) = "0xe2b3315f89fb203d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the size of the calling scripts current stack size.
NATIVE FUNC INT GET_CURRENT_STACK_SIZE() = "0x9d05ca7eb03931e4"

//INFO: Each script is an allocate stack of memory. This returns that value.
//PARAM NOTES:
//PURPOSE: Gets the size of the calling scripts allocated stack size. More info
NATIVE FUNC INT GET_ALLOCATED_STACK_SIZE() = "0x02bff29a859c559b"

//PURPOSE: Returns the number of stacks of the given size that are not currently used by a running script
NATIVE FUNC INT GET_NUMBER_OF_FREE_STACKS_OF_THIS_SIZE(INT stackSize) = "0x1bb8523a8f665d3c"

//~>                        Network commands


//INFO: 
//PARAM NOTES:
//PURPOSE:  Kills all scripts which don't have NETWORK_SET_SCRIPT_IS_SAFE_FOR_NETWORK_GAME in it. 
//  NATIVE PROC TERMINATE_ALL_SCRIPTS_FOR_NETWORK_GAME()

//INFO: 
//PARAM NOTES:
//PURPOSE:  Tell the game not to remove this script when TERMINATE_ALL_SCRIPTS_FOR_NETWORK_GAME is called
NATIVE PROC NETWORK_SET_SCRIPT_IS_SAFE_FOR_NETWORK_GAME() = "0x3f57bedbc381cbc7"
                     
//INFO: 
//PARAM NOTES:
//PURPOSE:  Returns true if this script has been flagged as safe to run in a network game
NATIVE FUNC BOOL NETWORK_GET_IS_SCRIPT_SAFE_FOR_NETWORK_GAME() = "0xfadba653c265e78a"

//INFO: This is where the player skin gets selected.
//PARAM NOTES:
//PURPOSE: Activates the frontend network settings menu. More info..
NATIVE PROC SET_NETWORK_SETTINGS_MENU(BOOL bActive) = "0x257b7aefb66d58d2"

//INFO: This command (called with FALSE) is needed so that the player doesn't regain control for the short gap between the end of the first mission (The Tour) and the script that introduces the savegame bed and the radar. 
//PARAM NOTES: The default setting is TRUE.
//PURPOSE: Sets the player control at the after script has terminated. More info..
NATIVE PROC SET_PLAYER_CONTROL_ON_IN_MISSION_CLEANUP(BOOL bSetPlayerControlOnInCleanup) = "0x451a0065621843ce"


//~>                        Restart commands

//INFO: Currently, a maximum of 10 of each type of restart point can be defined on the map, but this can be increased if necessary.
//  Z will be calculated automatically if you give it a value of –100.0 or below. 
//  The player will also be given the correct heading when he is restarted. 
//PARAM NOTES:
//PURPOSE: Adds a coord where the player will be restarted after he has been killed. More info..
NATIVE FUNC HOSPITAL_RESTART_INDEX ADD_HOSPITAL_RESTART(VECTOR VecCoors, FLOAT Heading, INT WhenToUse) = "0x6104d87e51533cf0"

//INFO:			
//PARAM NOTES:
//PURPOSE: Disable/Enable a previously registered hospital restart point
NATIVE PROC DISABLE_HOSPITAL_RESTART(HOSPITAL_RESTART_INDEX index, BOOL bDisable) = "0x582d074c5cdb512a"

//INFO:  Currently, a maximum of 10 of each type of restart point can be defined on the map, but this can be increased if necessary.
//  Z will be calculated automatically if you give it a value of –100.0 or below. 
//  The player will also be given the correct heading when he is restarted. 
//PARAM NOTES:
//PURPOSE: Adds a coord where the player will be restarted after he has been arrested. More info..
NATIVE FUNC POLICE_RESTART_INDEX ADD_POLICE_RESTART(VECTOR VecCoors, FLOAT Heading, INT WhenToUse) = "0xd5c8a1f537cc13cd"

//INFO:			
//PARAM NOTES:
//PURPOSE: Disable/Enable a previously registered police restart point
NATIVE PROC DISABLE_POLICE_RESTART(POLICE_RESTART_INDEX index, BOOL bDisable) = "0xcb7dbda526904496"

//INFO: In some missions, you might want to restart the player at the point on the map where the mission is started. 
//  If this command is called then the next time the player is restarted, he will be positioned at this point rather than at the closest hospital or police restart point.
//  Z will be calculated automatically if you give it a value of –100.0 or below. When the player restarts, his heading will be set according to PlayerHeading. 
//PARAM NOTES:
//PURPOSE: Ses a point where the player will restarted which overrides the defaults. More info..
NATIVE PROC SET_RESTART_COORD_OVERRIDE(VECTOR VecCoors, FLOAT Heading) = "0x275e58a39347a249"

//INFO: 
//PARAM NOTES:
//PURPOSE: Clears any restart overide. 
NATIVE PROC CLEAR_RESTART_COORD_OVERRIDE() = "0x1b9c2beba596b762"

//PURPOSE: When the player is killed or arrested, he will be respawned at the closest hospital or police station. 
//	If you want to give the player the option to replay a mission then call PAUSE_DEATH_ARREST_RESTART(TRUE) to prevent the respawn taking
//	place immediately. If the player chooses to replay the mission then call IGNORE_NEXT_RESTART(TRUE) and 
//	call PAUSE_DEATH_ARREST_RESTART(FALSE). If the player chooses not to replay then just call PAUSE_DEATH_ARREST_RESTART(FALSE).
//	PAUSE_DEATH_ARREST_RESTART(TRUE) should only ever be called if you know that the player has been killed or arrested. Checking 
//	IF NOT IS_PLAYER_PLAYING should be enough for this.
NATIVE PROC PAUSE_DEATH_ARREST_RESTART(BOOL bPaused) = "0x3780e26e475691ed"

//PURPOSE: Use in conjunction with PAUSE_DEATH_ARREST_RESTART. If the player is killed or arrested and chooses to replay the mission then call
//	IGNORE_NEXT_RESTART(TRUE) so that he isn't respawned at a hospital or police station.
// IGNORE_NEXT_RESTART(TRUE) should only ever be called if you know that the player has been killed or arrested. Checking 
//	IF NOT IS_PLAYER_PLAYING should be enough for this.
NATIVE PROC IGNORE_NEXT_RESTART(bool bIgnore) = "0x631794154765bf95"

//INFO: After each suppressed fade the variable is set back to false Note: 
//  The mission cleanup doesn't reset the variable so it's up to the script to call SET_FADE_OUT_AFTER_ARREST (true) when done with the particular mission. 
//PARAM NOTES:
//PURPOSE: Sets whether the screen fades out after death
NATIVE PROC SET_FADE_OUT_AFTER_DEATH(BOOL bDoFade) = "0xb607c92d60b318dd"


//INFO: After each suppressed fade the variable is set back to false Note: 
//  The mission cleanup doesn't reset the variable so it's up to the script to call SET_FADE_OUT_AFTER_ARREST (true) when done with the particular mission. 
//PARAM NOTES:
//PURPOSE: Sets whether the screen fades out after an arrest has been intiated.
NATIVE PROC SET_FADE_OUT_AFTER_ARREST(BOOL bDoFade) = "0x07fd15da380c8512"

//INFO: After each suppressed fade the variable is set back to false Note: 
//  The mission cleanup doesn't reset the variable so it's up to the script to leave call SET_FADE_IN_AFTER_DEATH_ARREST (true) when done with the particular mission. 
//PARAM NOTES:
//PURPOSE: Sets whether the screen fades back in after a death arrest has been intiated. More info..
NATIVE PROC SET_FADE_IN_AFTER_DEATH_ARREST(BOOL bDoFade) = "0x3e49ef84c421e367"


//PURPOSE: Call this with FALSE before saving if you don't want the screen to fade in when loading this save. You have to call the command again with TRUE after the save has been made
NATIVE PROC SET_FADE_IN_AFTER_LOAD(BOOL bFadeIn) = "0x8eaab4c63946014a"

//~>                            Save house commands 

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC SAVE_HOUSE_INDEX REGISTER_SAVE_HOUSE (VECTOR VecCoors, FLOAT Heading, STRING pRoomName, INT MapAreaName, MODEL_NAMES PlayerModelNameHash = DUMMY_MODEL_FOR_SCRIPT) = "0x1409c3f0480b1ae1"

//INFO: 
//PARAM NOTES: bAvailableForAutosaves - set this to FALSE (and bNewEnabledFlag to TRUE) if you want the savehouse to be available for manual saves but not for autosaves
//PURPOSE: 
NATIVE PROC SET_SAVE_HOUSE (SAVE_HOUSE_INDEX SaveHouseIndex, BOOL bNewEnabledFlag, BOOL bAvailableForAutosaves) = "0x71c0ad6b706b0460"


//PURPOSE: Call this with bOverride=TRUE to force the player to respawn at vecCoords with fHeading instead of at a savehouse after a load.
//			These settings will be applied to all saves until you call the command again with bOverride=FALSE
//PARAM NOTES: bIsAnAutosave - some savehouses are flagged by SET_SAVE_HOUSE as not being available for autosaves. Pass TRUE for this parameter to ignore those savehouses when finding the closest one.
//RETURNS: 	If you've called the command with bOverride=TRUE then vecReturnCoords and fReturnHeading should just be the same settings you've passed in.
//			If you've called the command with bOverride=FALSE then vecReturnCoords and fReturnHeading will be the coordinates and heading for the closest open savehouse for the current player character.
//			Should always return TRUE if you've called the command with bOverride=TRUE. Otherwise, it'll return TRUE if a valid savehouse was found for the current player character.
NATIVE FUNC BOOL OVERRIDE_SAVE_HOUSE(BOOL bOverride, VECTOR vecCoords, FLOAT fHeading, BOOL bIsAnAutosave, VECTOR &vecReturnCoords, FLOAT &fReturnHeading) = "0x6c3901dad6a66e9b"


//PURPOSE: After a savegame has loaded, call this command to get the details of where the player should be spawned
//PARAM NOTES: vecReturnCoords - the coordinates at which you should load the scene and spawn the player
//				fReturnHeading - the heading you should give to the player
//				bReturnFadeIn - you might never need this.
//				bReturnSnapToGround - if the save happened while the player was in water or in the air then this will be FALSE
//RETURNS:		TRUE if the returned data is valid
NATIVE FUNC BOOL GET_SAVE_HOUSE_DETAILS_AFTER_SUCCESSFUL_LOAD(VECTOR &vecReturnCoords, FLOAT &fReturnHeading, BOOL &bReturnFadeIn, BOOL &bReturnSnapToGround) = "0xbb3adc7c09e1a3fe"

//~>                    String commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if 2 strings are equal. (Ignores case e.g. "MyString" and "mystring" are equal)
NATIVE FUNC BOOL ARE_STRINGS_EQUAL(STRING String1, STRING String2) = "0x3c57c2f07fee34d2"


//PURPOSE: Compares two strings
//RETURNS: 	0 if the two strings are equal, a negative number if string1 is "less" than string2, a positive number if string1 is "greater" than string2
NATIVE FUNC INT COMPARE_STRINGS(STRING String1, STRING String2, BOOL bCaseSensitive = FALSE, INT numberOfCharactersToCompare = -1) = "0x1c1342f0adfea3b3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the string is NULL.
NATIVE FUNC BOOL IS_STRING_NULL(STRING StringToTest) = "0xe8f6c1f695b25b91"

//PURPOSE: Returns TRUE if the string is NULL or has a length of 0
NATIVE FUNC BOOL IS_STRING_NULL_OR_EMPTY(STRING StringToTest) = "0xacc32b78196fbc2a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Converts a string to an int
NATIVE FUNC BOOL STRING_TO_INT ( STRING StringToConvert, INT &ReturnInteger ) = "0xa8581fb9086c10c4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Creates a hash key for the given string
NATIVE FUNC INT GET_HASH_KEY(STRING InputString) = "0x2e87280918b16506"

//~>                Minigame commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Informs the game of mission creator status. 
NATIVE PROC USING_MISSION_CREATOR ( BOOL bNewState ) = "0xed32721223814a05"

//INFO: 
//PARAM NOTES:
//PURPOSE: disables warping in the pausemap during mission creator flag above
NATIVE PROC ALLOW_MISSION_CREATOR_WARP ( BOOL bAllow ) = "0x49e24542c726ebac"

//INFO: 
//PARAM NOTES:
//PURPOSE: Informs the game of a mini-games status. 
NATIVE PROC SET_MINIGAME_IN_PROGRESS ( BOOL bNewState ) = "0x0d0b74b18bf93317"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if a minigame is in progress.
NATIVE FUNC BOOL IS_MINIGAME_IN_PROGRESS ( ) = "0x410d46b709324b0f"

//INFO: It is possible for more than one minigame script to be running at the same time.
//PARAM NOTES:
//PURPOSE: Checks that this is a mingame script. More info..
NATIVE FUNC BOOL IS_THIS_A_MINIGAME_SCRIPT() = "0x4308664be93cb669"

//~>                    Game version commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns a unique identifier for this map version.
NATIVE FUNC INT GET_UNIQUE_MAP_VERSION() = "0x87c65863a6cb6f41"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE when running with the XBox360 executable
NATIVE FUNC BOOL IS_XBOX360_VERSION() = "0xdfc67688f9088b45"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE when running with the Orbis executable
NATIVE FUNC BOOL IS_ORBIS_VERSION() = "0xa7384dad7cf469da"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE when running with the Durango executable
NATIVE FUNC BOOL IS_DURANGO_VERSION() = "0x3ebd3af4e5d7a08c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE when running with the PS3 executable
NATIVE FUNC BOOL IS_PS3_VERSION() = "0x527312c0df85960a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE when running with the PC executable
NATIVE FUNC BOOL IS_PC_VERSION() = "0x8fe9914d4872d601"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE when running with a SCE platfrom
NATIVE FUNC BOOL IS_SCE_PLATFORM() = "0xf911e695c1eb8518"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE when running with the Prospero executable
NATIVE FUNC BOOL IS_PROSPERO_VERSION() = "0x807abe1ab65c24d2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE when running with the xbox platform
NATIVE FUNC BOOL IS_XBOX_PLATFROM() = "0x138679ca01e21f53"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE when running with the Scarlett executable
NATIVE FUNC BOOL IS_SCARLETT_VERSION() = "0xc545ab1cf97abb34"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE when running with the Steam executable
NATIVE FUNC BOOL IS_STEAM_VERSION() = "0x0a27b2b6282f7169"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE when running with the German executable - no blood etc.
NATIVE FUNC BOOL IS_GERMAN_VERSION() = "0x687c805ba078733c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE when running with the Australian executable.
NATIVE FUNC BOOL IS_AUSSIE_VERSION() = "0x86790e25cce58a5b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE when running with the Japanese executable.
NATIVE FUNC BOOL IS_JAPANESE_VERSION() = "0xb8c0bb75d8a77db3"

//Returns TRUE if it's the PS4 or PS5 version of the game
FUNC BOOL IS_PLAYSTATION_PLATFORM()
	RETURN IS_ORBIS_VERSION() OR IS_PROSPERO_VERSION()
ENDFUNC

//Returns TRUE if it's the Xbox One, XBox Series X or Xbox Series S version of the game
FUNC BOOL IS_XBOX_PLATFORM()
	RETURN IS_DURANGO_VERSION() OR IS_SCARLETT_VERSION()
ENDFUNC


//PURPOSE: Returns TRUE if the user has already selected a storage device on XBox360. On PC and PS3, this command always returns TRUE.
NATIVE FUNC BOOL HAS_STORAGE_DEVICE_BEEN_SELECTED() = "0x26e19cb0038ed95f"

//~>                        Phone commands 
//INFO: 
//PARAM NOTES: eHUD_PHONE_ITEM is in commands_misc.sch.
//PURPOSE: Displays the relevant hud item. More info.. 
NATIVE PROC SET_PHONE_HUD_ITEM(eHUD_PHONE_ITEM iType, STRING pTextLabel, INT iNumber ) = "0xcfcd18ca8fff8d7c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Displays the envelope icon near radar to say you have unread text messages waiting 
NATIVE PROC SET_MESSAGES_WAITING( BOOL bWaiting ) = "0xe5b2167603650634"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the sleep mode of the mobile.
NATIVE PROC SET_SLEEP_MODE_ACTIVE( BOOL bActive ) = "0x236d7f6c1691ef9b"

//INFO: 
//PARAM NOTES: default behaviour of no sprinting when on the phone. 
//PURPOSE: Sets if the player can sprint when on the phone, default is no sprint. More info..
NATIVE PROC SET_OVERRIDE_NO_SPRINTING_ON_PHONE_IN_MULTIPLAYER( BOOL bState ) = "0xb6fab419baa3b5fa"

//~>                            Stunt jump commands 

NATIVE STUNTJUMP_ID

//INFO: 
//PARAM NOTES:The first two vector parameters define a box which will start the stunt jump. 
//  The 3rd and 4th vector parameters define a box which will complete the stunt jump (if the player enters that area within a few seconds) 
//  The camera will change to a fixed camera at the given position.
//  Reward: is the amount of points the player receives if he lands in the end box
//	set: is the set to add the stunt jump to. (eg 0 = singleplayer stuntjumps, 1 = multiplayer stuntjumps) By default only set 0 stunt jumps are enabled. This
//		value can only be in the range 0 to 31
//PURPOSE:  Adds a stunt jump area in the map. More info..
NATIVE FUNC STUNTJUMP_ID ADD_STUNT_JUMP( VECTOR startMin, VECTOR startMax, VECTOR endMin, VECTOR endMax, VECTOR cameraPos, INT Reward, INT set = 0, BOOL camOptional = FALSE ) = "0xe3e21255829bfa40"


//INFO: 
//PARAM NOTES: min/max/width for boxes comes from the script tool at Script -> Toggle Script Bank -> Script Debug Tools -> Locates -> Non-axis aligned locates
NATIVE FUNC STUNTJUMP_ID ADD_STUNT_JUMP_ANGLED( VECTOR startMin, VECTOR startMax, FLOAT startWidth, VECTOR endMin, VECTOR endMax, FLOAT endWidth, VECTOR cameraPos, INT Reward, INT set = 0, BOOL camOptional = FALSE ) = "0x55b30d3eba45a1fa"

//INFO: enable/disable optional stunt camera
//PARAM NOTES:
//  bShow: true if we want to show the optional stunt jump cameras.
NATIVE PROC TOGGLE_SHOW_OPTIONAL_STUNT_JUMP_CAMERA(BOOL bShow) = "0xc14f6902ae1a5e2a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Deletes a stunt jump given its id.
NATIVE PROC DELETE_STUNT_JUMP( STUNTJUMP_ID id ) = "0x2e1fd4291978441d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enable all the stunt jumps with specified set id
NATIVE PROC ENABLE_STUNT_JUMP_SET( int set ) = "0xe26992076b0111b4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Disable all the stunt jumps with specified set id
NATIVE PROC DISABLE_STUNT_JUMP_SET( int set ) = "0x3a19907cc9850026"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if the stunt jumps are active.
NATIVE PROC SET_STUNT_JUMPS_CAN_TRIGGER( BOOL bAllow ) = "0x97df6de511b1cc98"

//INFO: 
//PURPOSE: Returns true if a stunt jump is in progress.
NATIVE FUNC BOOL IS_STUNT_JUMP_IN_PROGRESS() = "0xbf6119a4ad89ef09"

//INFO: 
//PURPOSE: Returns true if the stunt jump message is currently being displayed.
//			This will normally start to return true the same frame that IS_STUNT_JUMP_IN_PROGRESS stops returning true
//			(unless the stunt jump was aborted for various reasons). 
NATIVE FUNC BOOL IS_STUNT_JUMP_MESSAGE_SHOWING() = "0x70843a833fda0155"

//INFO: 
//PURPOSE: Returns the number of completed stunt jumps
NATIVE FUNC INT GET_NUM_SUCCESSFUL_STUNT_JUMPS() = "0xc543ff0fe8bf24ac"

//INFO: 
//PURPOSE: Returns the total of completed stunt jumps (counting the same jump more than one time)
NATIVE FUNC INT GET_TOTAL_SUCCESSFUL_STUNT_JUMPS() = "0x59de6e7fa1beff04"

//INFO: 
//PURPOSE: If a stunt jump is in progress, it will be aborted.  If the jump is already complete/failed, it'll remove the text.
NATIVE PROC CANCEL_STUNT_JUMP() = "0x8a5171986f5357d4"

//~>                        Game commands

//PURPOSE: Returns TRUE if the game should display measurements in metres etc.
NATIVE FUNC BOOL SHOULD_USE_METRIC_MEASUREMENTS() = "0x70350e94345b6f7b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get game profile setting.
NATIVE FUNC INT GET_PROFILE_SETTING(PROFILE_SETTING setting) = "0x5d851a9195129ce9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE when the game profile settings are valid so that operations can be done.
NATIVE FUNC BOOL ARE_PROFILE_SETTINGS_VALID( ) = "0xb8f4926b803bfd19"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the game pause state which causes everything but the current script and the scripts it spawns
NATIVE PROC SET_GAME_PAUSED( BOOL bDoPause) = "0x27f66b7fe7db7c3a"

//INFO: 
//PARAM NOTES:CHEAT_TYPE are in commands_misc.sch
//PURPOSE: Sets a cheat active. More info..
NATIVE PROC SET_CHEAT_ACTIVE (CHEAT_TYPE Cheat) = "0xd41dbda3fabb3c5f"

//INFO: 
//PARAM NOTES:CHEAT_TYPE a string representing the cheat code to check.
// Y Yellow
// X Blue
// A Green
// B Red
// U up
// D down
// L left
// R right
// 1 left shoulder 1
// 2 left shoulder 2
// 3 right shoulder 1
// 4 right shoulder 2
//PURPOSE: Returns true if the cheat code has been entered.
NATIVE FUNC BOOL HAS_CHEAT_BEEN_ACTIVATED (STRING cheatCode) = "0x5b4dd99aedcb74c9"

//PURPOSE: Instead of doing HAS_CHEAT_BEEN_ACTIVATED("YURD21X")
//			it would be more efficent to do HAS_CHEAT_WITH_HASH_BEEN_ACTIVATED( HASH("YURD21X"), GET_LENGTH_OF_LITERAL_STRING("YURD21X"))
//			or even HAS_CHEAT_WITH_HASH_BEEN_ACTIVATED( HASH("YURD21X"), 7)
NATIVE FUNC BOOL HAS_CHEAT_WITH_HASH_BEEN_ACTIVATED(INT hashOfCheatString, INT lengthOfCheatString) = "0x549ecfc9f246e127"

//PURPOSE: Same as HAS_CHEAT_BEEN_ACTIVATED except it does not require the length parameter.
NATIVE FUNC BOOL HAS_PC_CHEAT_WITH_HASH_BEEN_ACTIVATED(INT hashOfCheatString) = "0x21d2b24a19ad8996"

//~>                    News scrollbar commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Clears the text that is currently displayed on the news scrollba
NATIVE PROC CLEAR_NEWS_SCROLLBAR() = "0xf7af2da93489cc3e"

//INFO: The text is a literal string as set up in the script. This means the text cannot be translated but this is ok as the scrollbar is in NY where it would be in English. 
//PARAM NOTES:
//PURPOSE: Add texts to a news scrollbar. More ino..
NATIVE PROC ADD_STRING_TO_NEWS_SCROLLBAR(STRING newsString) = "0x83982aa807758dad"

//~>                    Frontend commands

//INFO: 
//PARAM NOTES:
//PURPOSE:  Only returns FALSE if no frontend fade is running
NATIVE FUNC BOOL IS_FRONTEND_FADING() = "0x6304243969f5a11a"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Decides whether the Xbox display will fade after several minutes with no user input
NATIVE PROC SET_XBOX_SCREEN_SAVER(BOOL bEnable) = "0x34a435880aac72ce"

//~>                    Sniper commands 

//INFO: 
//PARAM NOTES: Damage should be an integer between 0 and 100. It is the amount of damage caused to a ped or vehicle hit by the bullet. 
// The bPerfect accuracy flag sets the bullet at the exact point other wise it applys a spread to the bullets.
//The weapon type can be projectiles but then the VecEndCoors is the direction and not where it will land
// The bForceCreateNewProjectileObject flag ensures we create a NEW projectile object and don't use any equipped projectile objects from the firing entity.
//PURPOSE: Fires an instant hit bullet between the two points. More info..
NATIVE PROC SHOOT_SINGLE_BULLET_BETWEEN_COORDS(VECTOR VecStartCoors, VECTOR VecEndCoors, INT DamageCaused, BOOL bPerfectAccuracy = FALSE, WEAPON_TYPE Weapon = WEAPONTYPE_ASSAULTRIFLE, PED_INDEX PedIndex = NULL, BOOL bCreateTraceVfx = TRUE, BOOL bAllowRumble = TRUE, FLOAT InitialVelocity = -1.0) = "0xdb6ad61ce00e8a46"

//INFO: 
//PARAM NOTES: Variant of SHOOT_SINGLE_BULLET_BETWEEN_COORDS. You can specify an ignore entity here to disable damage against it.
// The bForceCreateNewProjectileObject flag ensures we create a NEW projectile object and don't use any equipped projectile objects from the firing entity.
// Setting the TargetEntity parameter will enable homing code if the weapon is a rocket.
//PURPOSE: Fires an instant hit bullet between the two points taking into account an entity to ignore for damage.
NATIVE PROC SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(VECTOR VecStartCoors, VECTOR VecEndCoors, INT DamageCaused, BOOL bPerfectAccuracy = FALSE, WEAPON_TYPE Weapon = WEAPONTYPE_ASSAULTRIFLE, PED_INDEX PedIndex = NULL, BOOL bCreateTraceVfx = TRUE, BOOL bAllowRumble = TRUE, FLOAT InitialVelocity = -1.0, ENTITY_INDEX IgnoreEntity = NULL, ENTITY_INDEX TargetEntity = NULL) = "0x251885feebe139f2"

//INFO: 
//PARAM NOTES: Variant of SHOOT_SINGLE_BULLET_BETWEEN_COORDS. You can specify an ignore entity here to disable damage against it.
// The bForceCreateNewProjectileObject flag ensures we create a NEW projectile object and don't use any equipped projectile objects from the firing entity.
// Setting the TargetEntity parameter will enable homing code if the weapon is a rocket.
// Set bIgnoreCollisionResetNoBB to ignore collision until the projectile leaves the BoundingBox of the given IgnoreEntity
//PURPOSE: Fires an instant hit bullet between the two points taking into account an entity to ignore for damage.
NATIVE PROC SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY_NEW(VECTOR VecStartCoors, VECTOR VecEndCoors, INT DamageCaused, BOOL bPerfectAccuracy = FALSE, WEAPON_TYPE Weapon = WEAPONTYPE_ASSAULTRIFLE, PED_INDEX PedIndex = NULL, BOOL bCreateTraceVfx = TRUE, BOOL bAllowRumble = TRUE, FLOAT InitialVelocity = -1.0, ENTITY_INDEX IgnoreEntity = NULL, BOOL bForceCreateNewProjectileObject = FALSE, BOOL bDisablePlayerCoverStartAdjustment = FALSE, ENTITY_INDEX TargetEntity = NULL, BOOL bDoDeadCheck = TRUE, BOOL bFreezeProjectileWaitingOnCollision = FALSE, BOOL bSetIgnoreCollisionEntity = FALSE, BOOL bIgnoreCollisionResetNoBB = FALSE) = "0x633f41b5cea31cc2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if teh sniper rifle control is inverted.
NATIVE FUNC BOOL IS_SNIPER_INVERTED() = "0x8a6d972d3a2e44d7"

//~>                    Global instance

//INFO: All object instances will soon be assigned a priority from 0 to 3 by the map guys (0 being the most important). 
//  All objects with a priority less than this value will not be loaded and rendered. 
//  Therefore setting the value to 0 will only load and render the most important objects
//  The is also an in game slider in the Optimization widgets called "instance lvl" to get/set the current value for testing 
//PARAM NOTES: Possible values of 0 to 3 inclusive. Defaults to 3
//PURPOSE:  Sets the global instance priority. More info..
NATIVE PROC SET_GLOBAL_INSTANCE_PRIORITY(INT iPriority) = "0xfde10efcb8697073"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_DEFAULT_GLOBAL_INSTANCE_PRIORITY() = "0xa2466e3a9ed547b7"

//~>                Player commands 

//INFO: iWantedLevel is the amount of stars you wish to display on the HUD - NOTE this only shows the number of stars - it doesnt do anything with your 'real' wanted level or anything with any police. 
//  It will only work if the real wanted level is 0, otherwise the real wanted level will override it. 
//PARAM NOTES:
//PURPOSE: Draws a fake number of wanted stars. More info..
NATIVE PROC SET_FAKE_WANTED_LEVEL ( INT iWantedLevel) = "0x30266329281c3a4f"

//PARAM NOTES:
//PURPOSE: returns whatever has been passed to SET_FAKE_WANTED_LEVEL previously
NATIVE FUNC INT GET_FAKE_WANTED_LEVEL() = "0xc1267d7e16e74496"

//~>                Model commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the dimensions of a model. 
NATIVE PROC GET_MODEL_DIMENSIONS(MODEL_NAMES ModelHashKey, VECTOR &returnMin, VECTOR &returnMax) = "0xb38ef75835faf667"

//~>                    Phyisics commands

//INFO: Implemented with acitivities in mind (e.g. pool game). 
//PARAM NOTES:
//PURPOSE: Forces all exterior peds and vehicles to freeze, regardless of player's position. More info..
NATIVE PROC OVERRIDE_FREEZE_FLAGS(BOOL nOverride) = "0xa404d3b3cbec1144"

// INFO:    Should be done at the start of a level or after a cutscene. Not advisable to change during normal play.
// PARAM NOTES: GRAVITY_LEVEL can be:
//                  - GRAV_EARTH        // Standard G
//                  - GRAV_MOON         // Moon G
//					- GRAV_LOW			// Low G (0.1)
//                  - GRAV_ZERO         // Zero G
// PURPOSE: Changes the current gravity level
NATIVE PROC SET_GRAVITY_LEVEL(GRAVITY_LEVEL iGravityLevel) = "0x29f437c0738a11d6"

//~>                    Commands Misc

//INFO: e.g. reducing the number of real peds in favour of dummy peds
//          Can you check with Obbe before using this.
//          Has to be called every frame during the slow mission section, please only call
//          It during the specifically slow part (e.g. gunfight) and not hte whole mission. 
//PARAM NOTES:
//PURPOSE:  Makes some changes to core systems to try and improve performance. More info..
NATIVE PROC POPULATE_NOW() = "0x466bf1f57ab05359"



ENUM eLevelIndex
    LEVEL_GTA5 = 1,
    LEVEL_TESTBED,
    LEVEL_VFX_TEST,
    LEVEL_NM_TEST,
    LEVEL_NET_TEST,
    LEVEL_ANIM_TEST,
    LEVEL_CP_TESTBED,
    LEVEL_TOOLS_TEST,
    LEVEL_WATERBED,
    LEVEL_GFX_TEST
ENDENUM

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the index of the currently loaded level. More info..
NATIVE FUNC eLevelIndex GET_INDEX_OF_CURRENT_LEVEL() = "0x33d66016fe7b1f4c"

//PURPOSE: Forces the current level to shut down and switches to the new level. Doesn't restart 
//          a whole new session though so persistent globals will be carried over to the next level.
NATIVE PROC SWITCH_TO_LEVEL(INT NewLevelIndex) = "0x0d736c2a8021511c"

//PURPOSE: Registers a structure within the global variables block that will contain persistent variables. These 
//              variables will maintain their values as you move between maps using SWITCH_TO_LEVEL. You can only 
//              have one persistent variables structure. The instance of the structure should be declared in your 
//              GLOBALS/ENDGLOBALS block. Call this command as soon as possible after SCRIPT in your startup script.
//              Example usage - REGISTER_PERSISTENT_GLOBAL_VARIABLES(gw_test_global, SIZE_OF(gw_test_global_struct))
//  NATIVE PROC REGISTER_PERSISTENT_GLOBAL_VARIABLES(STRUCT &StartAddressOfStruct, INT SizeOfStruct)


//PURPOSE: Starts a new block of data. You must call this before calling any of the REGISTER_ commands
//              You must call STOP_SAVE_DATA after REGISTERing the saved variables and the start, registering and stop
//              have to be done in a single frame.
//PARAMS:       
NATIVE PROC START_SAVE_DATA(STRUCT& StructToSave, INT SizeOfStruct, BOOL bSinglePlayer) = "0x6a3cf241a8e6bb10"

//PURPOSE: Marks the end of a block of data that has been created by START_SAVE_DATA.
//              You must call STOP_SAVE_DATA after REGISTERing the saved variables and the start, registering and stop
//              have to be done in a single frame.
//          When STOP_SAVE_DATA is called, the code will look for any previously-loaded data for this script and write the
//          loaded values into the matching REGISTERed variables
NATIVE PROC STOP_SAVE_DATA() = "0x6be88f905e2d4a46"

//PURPOSE: Returns the size of the script data registered to be saved. You can compare this size with the size of the
//			overall structure of saved variables to check that all variables have been registered for saving.
NATIVE FUNC INT GET_SIZE_OF_SAVE_DATA(BOOL bSinglePlayer) = "0xc42fc514879fbd37"

//PURPOSE: Registers an integer variable for saving in the currently-open block
//PARAM NOTES: Label can be up to 63 characters. It can't be the same as a Label used by any other REGISTER_... command
NATIVE PROC REGISTER_INT_TO_SAVE(INT &IntToSave, STRING pLabel) = "0x761051927661f94b"

//PURPOSE: Registers a 64 bit integer variable for saving in the currently-open block
//PARAM NOTES: Label can be up to 63 characters. It can't be the same as a Label used by any other REGISTER_... command
NATIVE PROC REGISTER_INT64_TO_SAVE(INT &IntToSave, STRING pLabel) = "0x8ee599308657b2a9"

//PURPOSE: Registers an enum variable for saving in the currently-open block
//PARAM NOTES: Label can be up to 63 characters. It can't be the same as a Label used by any other REGISTER_... command
NATIVE PROC REGISTER_ENUM_TO_SAVE(ENUM_TO_INT &EnumToSave, STRING pLabel) = "0x9702f50cca480d02"

//PURPOSE: Registers a float variable for saving in the currently-open block
//PARAM NOTES: Label can be up to 63 characters. It can't be the same as a Label used by any other REGISTER_... command
NATIVE PROC REGISTER_FLOAT_TO_SAVE(FLOAT &FloatToSave, STRING pLabel) = "0xd9ec39a4185f1a0f"

//PURPOSE: Registers a bool variable for saving in the currently-open block
//PARAM NOTES: Label can be up to 63 characters. It can't be the same as a Label used by any other REGISTER_... command
NATIVE PROC REGISTER_BOOL_TO_SAVE(BOOL &BoolToSave, STRING pLabel) = "0xf0d5ec209bfbceb4"

//PURPOSE: Registers a text label variable for saving in the currently-open block
//PARAM NOTES: Label can be up to 63 characters. It can't be the same as a Label used by any other REGISTER_... command
NATIVE PROC REGISTER_TEXT_LABEL_TO_SAVE(TEXT_LABEL &pTextLabelToSave, STRING pLabel) = "0x3f5eb2069155d1b2"
NATIVE PROC REGISTER_TEXT_LABEL_3_TO_SAVE(TEXT_LABEL_3 &pTextLabelToSave, STRING pLabel) = "0x3f0600d8ea048c7e"
NATIVE PROC REGISTER_TEXT_LABEL_7_TO_SAVE(TEXT_LABEL_7 &pTextLabelToSave, STRING pLabel) = "0x425c2a67015424cd"
NATIVE PROC REGISTER_TEXT_LABEL_15_TO_SAVE(TEXT_LABEL_15 &pTextLabelToSave, STRING pLabel) = "0x4cf17ce9e4568a82"
NATIVE PROC REGISTER_TEXT_LABEL_23_TO_SAVE(TEXT_LABEL_23 &pTextLabelToSave, STRING pLabel) = "0xd8129bfbc7574726"
NATIVE PROC REGISTER_TEXT_LABEL_31_TO_SAVE(TEXT_LABEL_31 &pTextLabelToSave, STRING pLabel) = "0xb55ff6a2f8dcf841"
NATIVE PROC REGISTER_TEXT_LABEL_63_TO_SAVE(TEXT_LABEL_63 &pTextLabelToSave, STRING pLabel) = "0x76c51166efaffcf8"

//INFO: Tells the game that all REGISTER_..._TO_SAVE commands up to the matching STOP_SAVE_STRUCT are within an instance
//              of this STRUCT. The game can save a bit of memory if you write a procedure to register each struct e.g.
//      PROC RegisterMyStruct(MyStruct &TestMyStruct, STRING NameOfInstanceOfMyStruct)
//          START_SAVE_STRUCT(TestMyStruct, NameOfInstanceOfMyStruct)
//              REGISTER_INT_TO_SAVE(TestMyStruct.IntWithinMyStruct, "IntWithinMyStruct")
//          STOP_SAVE_STRUCT()
//      ENDPROC
//  
//      You can then call your procedure to register each instance of your STRUCT.
//       You can save STRUCTs within STRUCTs.
//PURPOSE: More Info
NATIVE PROC START_SAVE_STRUCT_WITH_SIZE(STRUCT& StructToSave, INT SizeOfStruct, STRING pNameOfStructInstance) = "0x35ef5a3254a1ae34"

//INFO: Each START_SAVE_STRUCT should be matched by a STOP_SAVE_STRUCT after you have called REGISTER_..._TO_SAVE
//          for each member variable that you want to save. You can save STRUCTs within STRUCTs.
//PURPOSE: More Info
NATIVE PROC STOP_SAVE_STRUCT() = "0xa78477896ddce3c5"

//INFO: Tells the game that all REGISTER_..._TO_SAVE commands up to the matching STOP_SAVE_ARRAY are within an instance
//              of this array. The game can save a bit of memory if you write a procedure to register each array e.g.
//  PROC RegisterContactDetailsArray(DetailsForOneContact &StartOfArray[], STRING NameOfInstanceOfArray)
//      START_SAVE_ARRAY(StartOfArray, NameOfInstanceOfArray)
//      TEXT_LABEL_31 ContactName
//  
//          INT loop = 0
//          WHILE loop < ENUM_TO_INT(NUMBER_OF_CONTACTS)
//              eContacts loopAsEnum = INT_TO_ENUM(eContacts, loop)
//              SWITCH (loopAsEnum)
//                  CASE CONTACT_BRIAN
//                      ContactName = "CONTACT_BRIAN"
//                      BREAK
//                  CASE CONTACT_TONY
//                      ContactName = "CONTACT_TONY"
//                      BREAK
//                  CASE CONTACT_BILLY
//                      ContactName = "CONTACT_BILLY"
//                      BREAK
//                  DEFAULT
//                      SCRIPT_ASSERT("RegisterContactDetailsArray - case missing for a contact")
//                      ContactName = "ContactDetails"
//                      ContactName += loop
//                  BREAK
//              ENDSWITCH
//  
//              //  Call another function to register a single element for saving
//              RegisterDetailsForOneContact(StartOfArray[loop], ContactName)
//              //  If your array is just an array of simple types like INTs then you probably don't need a separate function
//              //  and can just call REGISTER_INT_TO_SAVE (or whatever the appropriate command is) here
//              loop++
//          ENDWHILE
//      STOP_SAVE_ARRAY()
//  ENDPROC
//  
//      You can then call your procedure to register each instance of your array.
//PURPOSE: More Info
NATIVE PROC START_SAVE_ARRAY_WITH_SIZE(STRUCT& ArrayToSave, INT SizeOfStruct_NotCount, STRING pNameOfArrayInstance) = "0xc6882a6353b4adb3"

//INFO: Each START_SAVE_ARRAY should be matched by a STOP_SAVE_ARRAY after you have called REGISTER_..._TO_SAVE
//          on the contents of the array.
//PURPOSE: More Info
NATIVE PROC STOP_SAVE_ARRAY() = "0xbda66a8b530a60ab"


//INFO: Copies the contents of SourceStruct into DestStruct. It's assumed that both structs are of the same type and therefore have the same size.
//PURPOSE: 
NATIVE PROC COPY_SCRIPT_STRUCT(STRUCT &DestStruct, STRUCT &SourceStruct, INT Size) = "0x049557638ade4df8"


//INFO: Enables a particular dispatch service, all existing units will stop responding if not yet in combat.
//PARAM NOTES:
//PURPOSE:  
NATIVE PROC ENABLE_DISPATCH_SERVICE( DISPATCH_TYPE dispatchType, bool bEnable ) = "0x07cecf421d895f3d"

//INFO: Prevents a particular dispatch service from creating new vehicles but allows existing peds/vehicles to respond
//PARAM NOTES:
//PURPOSE:  
NATIVE PROC BLOCK_DISPATCH_SERVICE_RESOURCE_CREATION( DISPATCH_TYPE dispatchType, bool bBlock ) = "0x5258fce0ec176e04"

//INFO: Creates an incident and returns an index, requests a set number of units
//PARAM NOTES:  - DISPATCH_TYPE is the type of units to be dispatched
//              - vLocation is where the cops will be dispatched to
//              - fTime if this is > 0.0 the incident will be removed after that time, otherwise it lasts indefinately
//              - iNumUnits is the number of units to be dispatched, 
//                  - in the case of Police automobile this is the number of peds rather than vehiles, e.g. 4 is 2 cars of 2
//				- iOverrideRelGroupHash will set this relationship group on every ped created as part of this incident dispatch (only works on DT_BikerBackup at present)
//				- assassinsLevel denotes which level backup will be created. Peds have different stats in each level.
//              - returns true if succesful
//PURPOSE:  
NATIVE FUNC BOOL CREATE_INCIDENT( DISPATCH_TYPE dispatchType, VECTOR vLocation, INT iNumUnits, FLOAT fTime, INCIDENT_INDEX& incidentIndex, INT iOverrideRelGroupHash = 0, ASSASSIN_LEVEL assassinsLevel = 0) = "0x302d843e3c8f40e2"

//INFO: Creates an incident and returns an index, requests a set number of units
//PARAM NOTES:  - DISPATCH_TYPE is the type of units to be dispatched
//              - entityIndex is where the cops will be dispatched to
//              - fTime if this is > 0.0 the incident will be removed after that time, otherwise it lasts indefinately
//              - iNumUnits is the number of units to be dispatched, 
//                  - in the case of Police automobile this is the number of peds rather than vehiles, e.g. 4 is 2 cars of 2
//				- iOverrideRelGroupHash will set this relationship group on every ped created as part of this incident dispatch (only works on DT_BikerBackup at present)
//				- assassinsLevel denotes which level backup will be created. Peds have different stats in each level.
//              - returns true if succesful
//PURPOSE:  
NATIVE FUNC BOOL CREATE_INCIDENT_WITH_ENTITY( DISPATCH_TYPE dispatchType, ENTITY_INDEX entityIndex, INT iNumUnits, FLOAT fTime, INCIDENT_INDEX& incidentIndex, INT iOverrideRelGroupHash = 0, ASSASSIN_LEVEL assassinsLevel = 0) = "0x5d5732191056751c"

//INFO: Updates the number of requested units of the given incident
//PARAM NOTES:  - DISPATCH_TYPE is the type of units to be dispatched
//              - iNumUnits is the number of units to be dispatched, 
//                  - in the case of Police automobile this is the number of peds rather than vehiles, e.g. 4 is 2 cars of 2
//PURPOSE:  
NATIVE PROC SET_INCIDENT_REQUESTED_UNITS( INCIDENT_INDEX incidentIndex, DISPATCH_TYPE dispatchType, INT iNumUnits ) = "0x337e4f61a2792efe"

//INFO: Deletes the given incident
//PARAM NOTES:  
//PURPOSE:  
NATIVE PROC DELETE_INCIDENT( INCIDENT_INDEX incidentIndex ) = "0xa4d968c5e2a5d0a0"

//INFO: Returns if the given incident is still valid
//PARAM NOTES:  
//PURPOSE:  
NATIVE FUNC BOOL IS_INCIDENT_VALID( INCIDENT_INDEX incidentIndex ) = "0x99b99da99fb0d4ec"

//INFO: Returns the number of resources assigned to a given dispatch for the wanted level response
//PARAM NOTES:  
//PURPOSE:  
NATIVE FUNC INT GET_NUMBER_RESOURCES_ALLOCATED_TO_WANTED_LEVEL( DISPATCH_TYPE dispatchType ) = "0x75eff7187a7d4dc4"

//INFO: Sets the ideal spawn distance for the incident
//PARAM NOTES:  
//PURPOSE:  
NATIVE PROC SET_IDEAL_SPAWN_DISTANCE_FOR_INCIDENT( INCIDENT_INDEX incidentIndex, FLOAT distance ) = "0xb4ee171ee2b772bf"

//INFO: Finds a spawn point in a given direction
//PARAM NOTES:  
//PURPOSE:  
NATIVE FUNC BOOL FIND_SPAWN_POINT_IN_DIRECTION( VECTOR vPosition, VECTOR vDirection, FLOAT fIdealSpawnDistance, VECTOR& vSpawnPoint ) = "0xed142878c9f94e2f"

// ******************************************************************************************
// **** Cell Phone Camera commands (copied from command_ny.sch in GTA4) ****
// ******************************************************************************************

ENUM MOBILE_PHONE_TYPE
    MOBILE_1 = 0,
    MOBILE_2,
    MOBILE_3,
    MOBILE_4,
    MOBILE_5 //Prologue Phone
ENDENUM

NATIVE PROC CREATE_MOBILE_PHONE(MOBILE_PHONE_TYPE MobilePhoneType) = "0xc7a697c4ad1d0175"

NATIVE PROC DESTROY_MOBILE_PHONE() = "0xa7518cfb10a7defb"

//PURPOSE: Query to determine if the phone has already been created
NATIVE FUNC  BOOL IS_MOBILE_PHONE_INSTANTIATED() = "0x37cd68a41953aae1"

// ENSURE IN SYNC WITH ENUM ePhoneInput IN TASKMOBILEPHONE.H
ENUM CELL_INPUT
	CELL_INPUT_NONE,
    CELL_INPUT_UP,
	CELL_INPUT_DOWN,
	CELL_INPUT_LEFT,
	CELL_INPUT_RIGHT,
	CELL_INPUT_SELECT
ENDENUM

//PURPOSE: Lets code know what the player's latest input was (ie up/down/left/right/select) to trigger appropriate thumb anims
NATIVE PROC CELL_SET_INPUT(CELL_INPUT cellInput) = "0xbca3fa8d0984a7d3"

//PURPOSE: Lets code know that email mode is active so horizontal phone anims can be triggered
NATIVE PROC CELL_HORIZONTAL_MODE_TOGGLE(BOOL bActive) = "0x2374aa601c2c4709"

//PURPOSE: Turn on/off the camera for the cell phone
NATIVE PROC CELL_CAM_ACTIVATE(BOOL bEnablePhotoUpdate, BOOL bGoFirstPerson) = "0x13ad5fb4a6e050f1"

//PURPOSE: Turn on/off the selfie (reverse angle) mode of the cell phone camera. Only visible when the cell phone camera is active.
NATIVE PROC CELL_CAM_ACTIVATE_SELFIE_MODE(BOOL bShouldActivate) = "0x041acbe09a018963"

//PURPOSE: Turn on/off the special shallow depth of field mode of the cell phone camera. Only visible when the cell phone camera is active (and in selfie mode, at present.)
NATIVE PROC CELL_CAM_ACTIVATE_SHALLOW_DOF_MODE(BOOL bShouldActivate) = "0x3cddeb389e6f7e65"

//PURPOSE: Sets the desired scaling to be applied to the side offset of the third-person cell phone camera, in selfie mode only. This offset is damped prior to being applied.
// This allows the selfie framing to be customised and for cropping to be minimised.
NATIVE PROC CELL_CAM_SET_SELFIE_MODE_SIDE_OFFSET_SCALING(FLOAT scaling) = "0x3df0d49ddcc957a5"

//PURPOSE: Sets the horizontal pan offset for selfie mode camera
//PARAM NOTES: scaling - 1.0 for no scaling
NATIVE PROC CELL_CAM_SET_SELFIE_MODE_HORZ_PAN_OFFSET(FLOAT scaling) = "0x8ecf6c4a4045833d"

//PURPOSE: Sets the vertical pan offset for selfie mode camera
//PARAM NOTES: scaling - 1.0 for no scaling
NATIVE PROC CELL_CAM_SET_SELFIE_MODE_VERT_PAN_OFFSET(FLOAT scaling) = "0x5c34e45ca45f7a49"

//PURPOSE: Sets roll offset for selfie mode camera
//PARAM NOTES: offset - Valid value from -1.0 to 1.0.
NATIVE PROC CELL_CAM_SET_SELFIE_MODE_ROLL_OFFSET(FLOAT offset) = "0x45209e14b5251bd9"

//PURPOSE: Sets distance scaling for selfie mode camera
//PARAM NOTES: scaling - Valid value from 0.0 to 1.0.
NATIVE PROC CELL_CAM_SET_SELFIE_MODE_DISTANCE_SCALING(FLOAT scaling) = "0xbfc33ddacaec2532"

//PURPOSE: Sets head yaw offset for selfie mode camera
//PARAM NOTES: offset - Valid value from -1.0 to 1.0.
NATIVE PROC CELL_CAM_SET_SELFIE_MODE_HEAD_YAW_OFFSET(FLOAT offset) = "0x707bc059b4839126"

//PURPOSE: Sets head roll offset for selfie mode camera
//PARAM NOTES: offset - Valid value from -1.0 to 1.0.
NATIVE PROC CELL_CAM_SET_SELFIE_MODE_HEAD_ROLL_OFFSET(FLOAT offset) = "0xaa8b9d1d78a7db5a"

//PURPOSE: Sets head pitch offset for selfie mode camera
//PARAM NOTES: offset - Valid value from -1.0 to 1.0.
NATIVE PROC CELL_CAM_SET_SELFIE_MODE_HEAD_PITCH_OFFSET(FLOAT offset) = "0xb385b6bd5599fee4"

//PURPOSE: Zoom 0 to 1....
NATIVE PROC CELL_CAM_SET_ZOOM(FLOAT zoom) = "0xceb3ab395c8fd061"

//PURPOSE: 0.5,0.5 by default
NATIVE PROC CELL_CAM_SET_CENTRE_POS(FLOAT x, FLOAT y) = "0xd643afee9dc874e3"

//PURPOSE: colour of mobile picture screen 
NATIVE PROC CELL_CAM_SET_COLOUR_BRIGHTNESS(FLOAT r, FLOAT g, FLOAT b,FLOAT bright) = "0xd94204e6313a9f61"

// PURPOSE: Allows the script to draw the photo somewhere
NATIVE PROC DRAW_SPRITE_PHOTO(FLOAT CentreX, FLOAT CentreY, FLOAT Width, FLOAT Height, FLOAT Rotation, INT R, INT G, INT B, INT A) = "0x83fede900389d430"

//PURPOSE: Is this ped visible?
NATIVE FUNC BOOL CELL_CAM_IS_CHAR_VISIBLE(PED_INDEX ped ) = "0x312a52d622d216f6"

//PURPOSE: Is this ped visible?.. but disregard if we can see his/her face or not.
NATIVE FUNC BOOL CELL_CAM_IS_CHAR_VISIBLE_NO_FACE_CHECK(PED_INDEX ped ) = "0x3f6a1a0363ec062d"



NATIVE PROC GET_MOBILE_PHONE_VIEWPORT_ID(INT &ViewportIndex) = "0xd7235e5ebff99e96"

NATIVE PROC SET_MOBILE_PHONE_SCALE (FLOAT NewPhoneScale) = "0x3f9b1fdeb8a770ef"

NATIVE FUNC FLOAT GET_MOBILE_PHONE_SCALE () = "0xeb8bda097c569fb0"

NATIVE PROC SET_MOBILE_PHONE_ROTATION (VECTOR NewRotationVector, EULER_ROT_ORDER RotOrder = EULER_XYZ) = "0x6447da2f47a963e9"

NATIVE PROC GET_MOBILE_PHONE_ROTATION (VECTOR &ReturnRotationVector, EULER_ROT_ORDER RotOrder = EULER_XYZ) = "0xde866220fc1119fa"

NATIVE PROC SET_MOBILE_PHONE_POSITION (VECTOR NewPositionVector) = "0x31636f0193379566"

NATIVE PROC GET_MOBILE_PHONE_POSITION (VECTOR &ReturnPositionVector) = "0xc81489026785778a"

NATIVE PROC SET_MOBILE_PHONE_BRIGHTNESS	(MOBILE_PHONE_TYPE MobilePhoneType, FLOAT Brightness) = "0xa785cc728dc3b248"

NATIVE PROC SET_MOBILE_PHONE_SCREEN_BRIGHTNESS (MOBILE_PHONE_TYPE MobilePhoneType, FLOAT Brightness) = "0xdc8f8df60c5ccf1d"

NATIVE FUNC FLOAT GET_MOBILE_PHONE_BRIGHTNESS (MOBILE_PHONE_TYPE MobilePhoneType) = "0xb507b6e943c74908"

NATIVE FUNC FLOAT GET_MOBILE_PHONE_SCREEN_BRIGHTNESS (MOBILE_PHONE_TYPE MobilePhoneType) = "0xe025d76cceaa75ff"

NATIVE PROC SCRIPT_IS_MOVING_MOBILE_PHONE_OFFSCREEN (BOOL bValue) = "0x692d1abae39f0b00"

NATIVE FUNC BOOL CODE_WANTS_MOBILE_PHONE_REMOVED() = "0x849d0fae1843d877"

NATIVE FUNC BOOL CODE_WANTS_MOBILE_PHONE_REMOVED_FOR_WEAPON_SWITCHING() = "0x82a71e2d5a08b2c1"

NATIVE FUNC BOOL CAN_PHONE_BE_SEEN_ON_SCREEN() = "0x53758b69d0956dc7"

NATIVE PROC SET_MOBILE_PHONE_DOF_STATE(BOOL bEnable) = "0x78d4941e4dbedf3c"
NATIVE FUNC BOOL GET_MOBILE_PHONE_DOF_STATE() = "0x2f870a6202f4a148"

NATIVE PROC GET_MOBILE_PHONE_RENDER_ID(INT &renderIndex) = "0x411781aa7d295558"

//INFO: Turns on tennis navigation changes for a ped
//PARAM NOTES:  - PedIndex is the ped to set into tennis mode
//              - bEnable or disable the behaviour 
NATIVE PROC ENABLE_TENNIS_MODE(PED_INDEX PedIndex, BOOL bEnable, BOOL bUseFemaleClipSet = false) = "0x6535edbe6f8dbb11"

//INFO: Allows remote machines to control the PedIndex local ped clone by turning off syncing to them
//PARAM NOTES:  - bEnable true will stop sending sync updates and setting it false will restart them
//              - 
NATIVE PROC ENABLE_CLONE_OVERRIDE_TENNIS_MODE(PED_INDEX PedIndex, BOOL bEnable) = "0x88c77cbe7aeff1c0"

//INFO: Is the ped in tennis mode?
//PARAM NOTES:  - PedIndex is the ped to check tennis mode on
NATIVE FUNC BOOL IS_TENNIS_MODE(PED_INDEX PedIndex) = "0x4b383368dc8ccf38"

//INFO: Play tennis swing animation
NATIVE PROC PLAY_TENNIS_SWING_ANIM(PED_INDEX PedIndex, STRING pAnimDictName,  STRING pAnimName, FLOAT startPhase = 0.0, FLOAT playRate = 1.0, BOOL slowBlend = false) = "0xa427179dc0581389"

ENUM TENNIS_DIVE_DIRECTION
    DIVE_BH = 0,
	DIVE_FH
ENDENUM

//INFO: Play tennis dive animation
NATIVE PROC PLAY_TENNIS_DIVE_ANIM(PED_INDEX PedIndex, TENNIS_DIVE_DIRECTION Direction, float DiveHorizontal, float DiveVertical, FLOAT playRate = 1.0, BOOL slowBlend = false) = "0x08c0f779422456f1"

//INFO: Update the playback rate of the current swing animation.
NATIVE PROC SET_TENNIS_SWING_ANIM_PLAY_RATE(PED_INDEX PedIndex, FLOAT playRate) = "0xf654a9796bd73ae2"

//INFO:
NATIVE FUNC BOOL GET_TENNIS_SWING_ANIM_COMPLETE(PED_INDEX PedIndex) = "0x75c0723cf45e484f"

//INFO: If the swing anim has reached the interruptible point.
NATIVE FUNC BOOL GET_TENNIS_SWING_ANIM_CAN_BE_INTERRUPTED(PED_INDEX PedIndex) = "0x6460d686d9ea3ea9"

//INFO: If the swing anim has reached the interruptible point.
NATIVE FUNC BOOL GET_TENNIS_SWING_ANIM_SWUNG(PED_INDEX PedIndex) = "0x061730bd8d533982"

//INFO: If allow to dampen between strafe direction and the intention.
//PARAM NOTES:  
//PURPOSE:  
NATIVE PROC SET_TENNIS_ALLOW_DAMPEN_STRAFE_DIRECTION(PED_INDEX PedIndex, BOOL AllowDampen) = "0x6903eb81d900e828"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the tennis MoVE signal to the passed value
NATIVE PROC SET_TENNIS_MOVE_NETWORK_SIGNAL_FLOAT(PED_INDEX PedIndex, STRING signalName, FLOAT fSignal ) = "0x5f64484476f8387b"

//INFO: Resets the spawn location for the dispatch services.
//PARAM NOTES:  
//PURPOSE:  
NATIVE PROC RESET_DISPATCH_SPAWN_LOCATION() = "0x9979f63cd1e2927a"

//INFO: Sets the spawn location for the dispatch services.
//PARAM NOTES:  
//PURPOSE:  
NATIVE PROC SET_DISPATCH_SPAWN_LOCATION(VECTOR vLocation) = "0x1eea2d366d6c2406"

//INFO: Resets the ideal spawn distance for the dispatch services.
//PARAM NOTES:  
//PURPOSE:  
NATIVE PROC RESET_DISPATCH_IDEAL_SPAWN_DISTANCE() = "0x34a2da203a9abc58"

//INFO: Sets the ideal spawn distance for the dispatch services.
//PARAM NOTES:  
//PURPOSE:  
NATIVE PROC SET_DISPATCH_IDEAL_SPAWN_DISTANCE(FLOAT fIdealSpawnDistance) = "0xb0520b53aa49f54f"

//INFO: Resets the time between spawn attempts for the dispatch service.
//PARAM NOTES:
//PURPOSE:  
NATIVE PROC RESET_DISPATCH_TIME_BETWEEN_SPAWN_ATTEMPTS(DISPATCH_TYPE dispatchType) = "0x82ec6fa179cc6599"

//INFO: Sets the time between spawn attempts for the dispatch service.
//PARAM NOTES:
//PURPOSE:  
NATIVE PROC SET_DISPATCH_TIME_BETWEEN_SPAWN_ATTEMPTS(DISPATCH_TYPE dispatchType, FLOAT fTimeBetwenSpawnAttempts) = "0xd1f5efbaf2ec7b47"

//INFO: Resets the time between spawn attempts multiplier for the dispatch service.
//PARAM NOTES:
//PURPOSE:  
NATIVE PROC RESET_DISPATCH_TIME_BETWEEN_SPAWN_ATTEMPTS_MULTIPLIER(DISPATCH_TYPE dispatchType) = "0xe6ab6f0e5e7e8f3d"

//INFO: Sets the time between spawn attempts multiplier for the dispatch service.
//PARAM NOTES:
//PURPOSE:  
NATIVE PROC SET_DISPATCH_TIME_BETWEEN_SPAWN_ATTEMPTS_MULTIPLIER(DISPATCH_TYPE dispatchType, FLOAT fTimeBetwenSpawnAttemptsMultiplier) = "0x8df9d06d24867ef7"

//INFO: Prevents dispatch spawning in the requested area.
// MAX allowed areas is 2. Let code know if that needs increasing. Shares storage with sphere blocking areas
//PARAM NOTES:
//PURPOSE: Prevents dispatch spawning in the requested area.
//         Returns a handle which can be used to remove the area.
NATIVE FUNC INT ADD_DISPATCH_SPAWN_ANGLED_BLOCKING_AREA(VECTOR vStart, VECTOR vEnd, FLOAT fWidth) = "0x40b95e12f9a36a28"

//INFO: Prevents dispatch spawning in the requested area.
// MAX allowed areas is 2. Let code know if that needs increasing. Shares storage with angled blocking areas
//PARAM NOTES:
//PURPOSE: Prevents dispatch spawning in the requested area.
//         Returns a handle which can be used to remove the area.
NATIVE FUNC INT ADD_DISPATCH_SPAWN_SPHERE_BLOCKING_AREA(VECTOR vCenter, FLOAT fRadius) = "0x903a26ef102dab53"

//INFO: Removes a dispatch spawn blocking area with the given index.
//PARAM NOTES:
//PURPOSE: Removes a dispatch spawn blocking area with the given index.
NATIVE PROC REMOVE_DISPATCH_SPAWN_BLOCKING_AREA(INT iIndex) = "0xd41a5dca42ba8bdd"

//INFO: Resets the dispatch spawn blocking areas.
//PARAM NOTES:
//PURPOSE: Resets the dispatch spawn blocking areas.
NATIVE PROC RESET_DISPATCH_SPAWN_BLOCKING_AREAS() = "0x77be4f11ef7fc8c7"

//INFO: Resets the number of peds to spawn for the wanted response.
//PARAM NOTES:
//PURPOSE: Resets the number of peds to spawn for the wanted response.
NATIVE PROC RESET_WANTED_RESPONSE_NUM_PEDS_TO_SPAWN() = "0x777e9192665d1ca2"

//INFO: Sets the number of peds to spawn for the wanted response.
//PARAM NOTES:
//PURPOSE: Sets the number of peds to spawn for the wanted response.
NATIVE PROC SET_WANTED_RESPONSE_NUM_PEDS_TO_SPAWN(DISPATCH_TYPE dispatchType, INT iNumPedsToSpawn) = "0x4f0c3dda5af5a24f"

//INFO: Adds a tactical nav mesh point
//PARAM NOTES:
//PURPOSE: Adds a tactical nav mesh point
NATIVE PROC ADD_TACTICAL_NAV_MESH_POINT(VECTOR vPosition) = "0xac5d4c07ad99da31"

//INFO: Clears the tactical nav mesh points
//PARAM NOTES:
//PURPOSE: Clears the tactical nav mesh points
NATIVE PROC CLEAR_TACTICAL_NAV_MESH_POINTS() = "0x3cde5c5113b2a756"

//INFO: Toggles riot mode
//PARAM NOTES:
//PURPOSE: Toggles riot mode
NATIVE PROC SET_RIOT_MODE_ENABLED(BOOL bEnabled) = "0xf542970145bc96b5"

// ******************************************************************************************
// **** End of Cell Phone Camera commands (copied from command_ny.sch in GTA4) ****
// ******************************************************************************************

// Traffic and ped density controllers
// Allows script to modify ped/vehicle densities in provided regions
//
// These commands operate in two distinct modes, based upon wither the 'bCameraGlocalMultiplier' is set.
// See below for a full explaination.

//PARAM NOTES:
// bCameraGlobalMultiplier
//	TRUE  = the effect of this area is to GLOBALLY multiply densities for spawning in the whole world, whenever the camera is within the specified zone (default original behaviour)
//  FALSE = the effect of this area is to LOCALLY multiply densities for only spawning which occurs within the specified zone, and regardless of where the camera is
// MAX allowed areas is 10. Let code know if that needs increasing
NATIVE FUNC INT ADD_POP_MULTIPLIER_AREA(VECTOR minWS, VECTOR maxWS, FLOAT pedDensity, FLOAT trafficDensity, BOOL localOnly, BOOL bCameraGlobalMultiplier=TRUE) = "0x7cc9abaffea56277"
NATIVE FUNC BOOL DOES_POP_MULTIPLIER_AREA_EXIST(INT index) = "0x4b4bc360c6d8d2a4"
NATIVE PROC REMOVE_POP_MULTIPLIER_AREA(INT index, BOOL localOnly) = "0x79d94867e24afb8a"
NATIVE FUNC BOOL IS_POP_MULTIPLIER_AREA_NETWORKED(INT index) = "0x2ccebb043649a456"


NATIVE FUNC INT ADD_POP_MULTIPLIER_SPHERE(VECTOR center, FLOAT radius, FLOAT pedDensity, FLOAT trafficDensity, BOOL localOnly, BOOL bCameraGlobalMultiplier=TRUE) = "0x9c5e0d0887ecd76d"
NATIVE FUNC BOOL DOES_POP_MULTIPLIER_SPHERE_EXIST(INT index) = "0x9638d57f9a8decf9"
NATIVE PROC REMOVE_POP_MULTIPLIER_SPHERE(INT index, BOOL localOnly) = "0xf63317d708095ce2"



// Action Manager interface
NATIVE PROC ACTION_MANAGER_ENABLE_ACTION( INT iActionHash, BOOL bEnable ) = "0x43efe7c11330165e"
NATIVE FUNC BOOL ACTION_MANAGER_IS_ACTION_ENABLED( INT iActionHash ) = "0xd12fee6181945623"


ENUM eKeyboardType
	ONSCREEN_KEYBOARD_ENGLISH,
	ONSCREEN_KEYBOARD_LOCALISED,
	ONSCREEN_KEYBOARD_PASSWORD,
	ONSCREEN_KEYBOARD_GAMERTAG,
	ONSCREEN_KEYBOARD_EMAIL,
	ONSCREEN_KEYBOARD_BASIC_ENGLISH,
	ONSCREEN_KEYBOARD_FILENAME
ENDENUM

//INFO: Displays the system keyboard
// PARAM NOTES:
//		prompt - The prompt that the player sees
//		initialValue1...initialValue4  - The initial / default text that the player sees. Up to four strings can be concatenated by this command to create one large initial string
//		maxLength - the maximum number of characters that can be typed (2 - 256). The actual number of visible characters is one less than maxLength.
//		description - this only has an effect on Xbox 360
NATIVE PROC DISPLAY_ONSCREEN_KEYBOARD(eKeyboardType keyboardTypeFlag, STRING prompt, STRING description, STRING initialValue1, STRING initialValue2, STRING initialValue3, STRING initialValue4, INT maxLength) = "0xd36afc4a86165b46"

//INFO: Variant of DISPLAY_ONSCREEN_KEYBOARD which takes up to eight strings to support an initial value of 500 characters
NATIVE PROC DISPLAY_ONSCREEN_KEYBOARD_WITH_LONGER_INITIAL_STRING(eKeyboardType keyboardTypeFlag, STRING prompt, STRING description, STRING initialValue1, STRING initialValue2, STRING initialValue3, STRING initialValue4, STRING initialValue5, STRING initialValue6, STRING initialValue7, STRING initialValue8, INT maxLength) = "0x9f75296be5b9e406"

PROC SHOW_ONSCREEN_KEYBOARD(STRING prompt, STRING initialValue, INT maxLength=256)
	DISPLAY_ONSCREEN_KEYBOARD(ONSCREEN_KEYBOARD_ENGLISH, prompt, "", initialValue, "", "", "", maxLength)
ENDPROC

PROC SHOW_ONSCREEN_KEYBOARD_WITH_LONG_INITIAL_STRING(STRING prompt, STRING initialValue1, STRING initialValue2, STRING initialValue3, STRING initialValue4, INT maxLength=256)
	DISPLAY_ONSCREEN_KEYBOARD(ONSCREEN_KEYBOARD_ENGLISH, prompt, "", initialValue1, initialValue2, initialValue3, initialValue4, maxLength)
ENDPROC



//INFO: Updates the system keyboard, and returns its status. This should be called periodically until a non-PENDING status is returned.
NATIVE FUNC OSK_STATUS UPDATE_ONSCREEN_KEYBOARD() = "0x9417f1137725b4b3"

//INFO: Returns the text that the player last entered in the onscreen keyboard
NATIVE FUNC STRING GET_ONSCREEN_KEYBOARD_RESULT() = "0xd0cd6f19a5cd39ec"

//INFO: Cancels the onscreen keyboard
NATIVE PROC CANCEL_ONSCREEN_KEYBOARD() = "0xa4d40100016b1da1"

//INFO: By default, the game replaces tilde characters entered on the onscreen keyboard with hyphens.
//			Call this command with TRUE to keep the tilde characters.
//			This command will have no effect when running a Final executable.
NATIVE PROC SET_ALLOW_TILDE_CHARACTER_FROM_ONSCREEN_KEYBOARD(BOOL bAllowTilde) = "0x27a5cdc282d09650"

ENUM FONT_BIT_FIELD
//	FONT_BIT_STANDARD = 1,	//	The game already replaces characters in the onscreen keyboard result that aren't supported in the Standard font
	FONT_BIT_CURSIVE = 2,
	FONT_BIT_ROCKSTAR_TAG = 4,
	FONT_BIT_LEADERBOARD = 8,
	FONT_BIT_CONDENSED = 16,
	FONT_BIT_FIXED_WIDTH_NUMBERS = 32,
	FONT_BIT_CONDENSED_NOT_GAMERNAME = 64,

	FONT_BIT_PRICEDOWN = 128  // gta font
ENDENUM

// INFO: Call this command before displaying the onscreen keyboard so that any characters that aren't supported in all the fonts can be replaced with a space character.
//			The bit field will only apply to the next time the onscreen keyboard is displayed.
NATIVE PROC NEXT_ONSCREEN_KEYBOARD_RESULT_WILL_DISPLAY_USING_THESE_FONTS(FONT_BIT_FIELD fontBitField) = "0xaebb4e3408e9c382"

//INFO: Returns the real world time in seconds
NATIVE FUNC INT GET_REAL_WORLD_TIME() = "0x3f60413f5df65748"

//INFO: Set a random event to be enabled or disabled for this frame
NATIVE PROC SUPRESS_RANDOM_EVENT_THIS_FRAME(RANDOM_EVENT eventType, BOOL bEnable) = "0xbd9c95510c697303"

// INFO: Begin a new round of an automated test. After this point, the script is
// expected to repeat the same process again and again and call
// AUTOMATED_TEST_NEXT_ITERATION after each iteration.
// You can still perform some additional setup here, the actual recording of data
// is not expected until you call AUTOMATED_TEST_START_ITERATION.
NATIVE PROC AUTOMATED_TEST_BEGIN() = "0xdbf061ca20d165d5"

// INFO: After calling AUTOMATED_TEST_BEGIN(), this function should be called
// at the beginning of each iteration. Whatever tool is recording metrics should
// then begin recording until AUTOMATED_TEST_NEXT_ITERATION is called.
NATIVE PROC AUTOMATED_TEST_START_ITERATION() = "0x3488c6867bdc647a"

// INFO: After calling AUTOMATED_TEST_BEGIN(), this function should be called
// after every iteration of the test procedure.
// RETURNS: True if there is another iteration coming up. In this case, you should
// repeat whatever test you just did. If false, the test has concluded, and no
// more iterations are necessary.
NATIVE FUNC BOOL AUTOMATED_TEST_NEXT_ITERATION() = "0xdefc6ac003d2e9f7"

//INFO: Set the player has explosive ammo in automatic weapons this frame
NATIVE PROC SET_EXPLOSIVE_AMMO_THIS_FRAME(PLAYER_INDEX PedIndex) = "0x582ef587cc7597ae"

//INFO: Set the player has fire ammo this frame
NATIVE PROC SET_FIRE_AMMO_THIS_FRAME(PLAYER_INDEX PedIndex) = "0x7fe655ce221e741b"

//INFO: Set the player has explosive melee this frame
NATIVE PROC SET_EXPLOSIVE_MELEE_THIS_FRAME(PLAYER_INDEX PedIndex) = "0xc3562ba50c82388b"

//INFO: Set the player to super jump this frame
NATIVE PROC SET_SUPER_JUMP_THIS_FRAME(PLAYER_INDEX PedIndex) = "0xa39a115964cb8d41"

//INFO: Returns true if super jump flag is active this frame
NATIVE FUNC BOOL GET_IS_SUPER_JUMP_ACTIVE(PLAYER_INDEX PedIndex) = "0x4859abb912d14d99"

//INFO: Set the player to use beast jump anims this frame.
NATIVE PROC SET_BEAST_JUMP_THIS_FRAME(PLAYER_INDEX PedIndex) = "0xf85eb82eef0fad32"

//INFO: Returns true if beast jump flag is active this frame
NATIVE FUNC BOOL GET_IS_BEAST_JUMP_ACTIVE(PLAYER_INDEX PedIndex) = "0x172607fb83e84f65"

//INFO: Set the player to be forced into jump state this frame.
NATIVE PROC SET_FORCED_JUMP_THIS_FRAME(PLAYER_INDEX PedIndex) = "0xd097da9bfe7a2016"

ENUM INSTANCE_MODE
    INSTANCE_MODE_SINGLEPLAYER = 0,
	INSTANCE_MODE_MULTIPLAYER
ENDENUM

//INFO: tell the game if we're changing between single player and multiplayer, so we can strip out low priority map objects
NATIVE PROC SET_INSTANCE_PRIORITY_MODE(INSTANCE_MODE mode) = "0x0da2849a157f1c01"

ENUM INSTANCE_HINT
	INSTANCE_HINT_NONE = 0,
	INSTANCE_HINT_SHOOTING,
	INSTANCE_HINT_DRIVING,
	INSTANCE_HINT_SNIPING,
	INSTANCE_HINT_HELICAM
ENDENUM

//INFO: provide hint to game to strip out low priority map objects for specific types of missions
NATIVE PROC SET_INSTANCE_PRIORITY_HINT(INSTANCE_HINT hint) = "0x9b8a09aad1cfefb3"

//INFO: Stops the game and shows the install progress bar
NATIVE PROC WAIT_UNTIL_GAME_INSTALLED() = "0x7f60cd94039a85ea"

//INFO: Returns true if the game has installed during this session, false if it was already installed when the game booted
NATIVE FUNC BOOL HAS_GAME_INSTALLED_THIS_SESSION() = "0x05c8821cd3e101ba"

//INFO: Set TRUE that to tell the player that john marston is available in the character creator appears the first time the player 
//      connected up to the social club and then never again.
NATIVE PROC SET_TICKER_JOHNMARSTON_IS_DONE() = "0x48d794795c819e09"

//INFO: When abandoning a MP session suddenly to return to single player (e.g if the player signed out of their PSN profile)
//      this command force-abandons any active game state such as respawning after death etc, forces to normal play state.
//		Don't use this unless you know exactly why you are using it.
NATIVE PROC FORCE_GAME_STATE_PLAYING() = "0x956030e0596c0f3e"

//INFO: Prevents the game state changing to ARREST state due to the player arrest state changing
// e.g. due to player being arrested by police etc. Should be called each frame to prevent state
// transition.
NATIVE PROC PREVENT_ARREST_STATE_THIS_FRAME() = "0x1a4209996802ef21"

//INFO: Initializes an mp script race and the helpet split time system
NATIVE PROC SCRIPT_RACE_INIT(INT numCheckpoints, INT numLaps, INT numPlayers, INT localPlayerIndex) = "0xb209dde44ec31285"

//INFO: Shuts down the helper split time helper for mp script races and cleans up memory
NATIVE PROC SCRIPT_RACE_SHUTDOWN() = "0x21177c558350f942"

//INFO: Registers a player having passed a checkpoint in a script race in mp. SCRIPT_RACE_INIT needs to have been called first.
NATIVE PROC SCRIPT_RACE_PLAYER_HIT_CHECKPOINT(INT pedIndex, INT checkpoint, INT lap, INT time) = "0x8b131ad9ca84bce8"

//INFO: Requests the split time for a player in an mp script race, and the position for that player in the race. SCRIPT_RACE_INIT needs to have been called first.
NATIVE FUNC BOOL SCRIPT_RACE_GET_PLAYER_SPLIT_TIME(INT pedIndex, INT& time, INT& position) = "0xeb390afeb597210e"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC START_END_USER_BENCHMARK() = "0xfdb4b0657fc92719"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC STOP_END_USER_BENCHMARK() = "0x125d159abd01a279"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC RESET_END_USER_BENCHMARK() = "0x16c1baaa79abea83"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SAVE_END_USER_BENCHMARK() = "0xd6cf1348fbd2f71a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns whether the In-Game Pause Menu Launched the Benchmark Tests
NATIVE FUNC BOOL UI_STARTED_END_USER_BENCHMARK() = "0xe76e60fda68de799"

//PURPOSE: Returns whether the Landing Screen Launched the Benchmark Tests
NATIVE FUNC BOOL LANDING_SCREEN_STARTED_END_USER_BENCHMARK() = "0xed419b5d18c4aa5a"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC BOOL IS_COMMANDLINE_END_USER_BENCHMARK() = "0x22f20e950399daed"


//INFO: 
//PARAM NOTES:
//PURPOSE:	Returns the -benchmarkItterations number, or -1 if unspecified.
NATIVE FUNC INT GET_BENCHMARK_ITERATIONS() = "0xbeae7b00e881ae3e"

//INFO: 
//PARAM NOTES:
//PURPOSE:	Returns the -benchmarkPass number, or -1 if unspecified.
NATIVE FUNC INT GET_BENCHMARK_PASS() = "0xf6d0f47e80cff135"

//PURPOSE: Restarts the game application (on PC)
NATIVE PROC RESTART_GAME() = "0xeba933b1a2380569"

//INFO: 
//PARAM NOTES:
//PURPOSE: Exit the game (on PC)
NATIVE PROC QUIT_GAME() = "0x315551089dac8c73"


//INFO: Query of the async NG install has finished
NATIVE FUNC BOOL HAS_ASYNC_INSTALL_FINISHED() = "0xda2d2333ed6bb2c1"

//INFO: Call to clean up after the async install, and reboot into the full game
NATIVE PROC CLEANUP_ASYNC_INSTALL() = "0xeac0d007daaa67a6"

//INFO: Returns true if we're in the constrained PLM (Process Lifetime Management) mode (executing with reduced CPU/GPU allocation)
NATIVE FUNC BOOL PLM_IS_IN_CONSTRAINED_MODE() = "0xaf62a965ebf9946a"

//INFO: Returns the amount of time in ms that we've been in constrained mode. Should only be called when PLM_IS_IN_CONSTRAINED_MODE() returns true.
NATIVE FUNC INT PLM_GET_CONSTRAINED_DURATION_MS() = "0xfe3098cc7933c733"

//INFO: Sets whether the player is using an animal as a model (this flag is entirely controlled by script)
NATIVE PROC SET_PLAYER_IS_IN_ANIMAL_FORM(BOOL bIsInAnimalForm) = "0x608a0ddf19c87adf"

//INFO: Queries whether the player is using an animal as a model
NATIVE FUNC BOOL GET_IS_PLAYER_IN_ANIMAL_FORM() = "0x80f6e0a3b422f9fd"

//INFO: Tells the game whether the player is repeating a mission through the pause menu (this flag is entirely controlled by script)
NATIVE PROC SET_PLAYER_IS_REPEATING_A_MISSION(BOOL bIsRepeatingAMission) = "0x004d0da56b6ff87a"

//INFO: Disables screen dimming for one frame.
NATIVE PROC DISABLE_SCREEN_DIMMING_THIS_FRAME() = "0x21c4591c6022e9f3"

//INFO: Returns the current console log file number (i.e. X from console_X.log)
NATIVE FUNC INT GET_LOG_FILE_NUMBER() = "0x64eb00f8e968882d"

//INFO: Returns the city density settings (0.0f->1.0f)
NATIVE FUNC FLOAT GET_CITY_DENSITY() = "0x5cc952a51a751c4c"

//INFO: Returns the city density settings (0.0f->1.0f)
NATIVE PROC USE_ACTIVE_CAMERA_FOR_TIMESLICING_CENTRE() = "0x6a9ec5834979e98a"

//INFO: Returns whether the game session has finished initializing
NATIVE FUNC BOOL IS_SESSION_INITIALIZED() = "0xd4073af8bf125a14"

#IF FEATURE_GEN9_STANDALONE
//INFO: Returns the chosen Criminal Career, corresponding to CHARACTER_CAREER_TYPE
NATIVE FUNC INT GET_CHOSEN_CRIMINAL_CAREER() = "0x088de8e8e8f522dd"

//INFO: Returns TRUE when the player has completed the Windfall Character creation flow
NATIVE FUNC BOOL HAS_FINALIZED_CHOSEN_CRIMINAL_CAREER() = "0x543cb61641ac456e"

NATIVE FUNC INT GET_CHOSEN_MP_CHARACTER_SLOT() = "0xf7d89f7e3ff81e21"

//INFO: Resets the chosen MP Character slot held on the Criminal Career service
NATIVE PROC RESET_CHOSEN_MP_CHARACTER_SLOT() = "0xff018aa297325503"

#ENDIF // FEATURE_GEN9_STANDALONE

//INFO: Insert index of content id into the global hash table
NATIVE PROC SET_CONTENT_ID_INDEX(INT contentIdHash, INT index) = "0x4b82fa6f2d624634"

//INFO: Returns index of content id from the global hash table
//NOTES: if content id is not found, -1 is returned
NATIVE FUNC INT GET_CONTENT_ID_INDEX(INT contentIdHash) = "0xecf041186c5a94dc"
