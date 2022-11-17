USING "types.sch"
USING "commands_player.sch"
USING "commands_network.sch"
USING "commands_misc.sch"
USING "stats_enums.sch"
USING "leaderboards_enum.sch"

ENUM STATS_DISPLAY_TYPE
	// Invalid/not set type
	STAT_TYPE_NONE = 0,

	// Base types
	STAT_TYPE_INT       = 1,
	STAT_TYPE_FLOAT     = 2,
	STAT_TYPE_STRING    = 3,
	STAT_TYPE_BOOLEAN   = 4,
	STAT_TYPE_DOUBLE    = 5,
	STAT_TYPE_UINT8     = 6,
	STAT_TYPE_UINT16    = 7,
	STAT_TYPE_UINT32    = 8,
	STAT_TYPE_UINT64    = 9,

	// Variations of base types... 
	// ... These variations are use when the stat is rendered to apply certain format to then ... or just use to what u want
	STAT_TYPE_TIME      = 10,
	STAT_TYPE_CASH      = 11,
	STAT_TYPE_PERCENT   = 12,
	STAT_TYPE_DEGREES   = 13,
	STAT_TYPE_WEIGHT    = 14,
	STAT_TYPE_MILES     = 15,
	STAT_TYPE_METERS    = 16,
	STAT_TYPE_FEET      = 17,
	STAT_TYPE_SECONDS   = 18,
	STAT_TYPE_CHART     = 19,
	STAT_TYPE_VELOCITY  = 20,
	STAT_TYPE_DATE      = 21,
	STAT_TYPE_POS       = 22,
	STAT_TYPE_TEXTLABEL = 23,
	STAT_TYPE_PACKED    = 24,
	STAT_TYPE_USER_ID   = 25,

	MAX_STAT_TYPE
ENDENUM

///PURPOSE
///  Possible Title User Storage write conditions.
ENUM TUS_WRITE_COND
	TUS_OPETYPE_NOT_EQUAL        = 0, // Write if variable is not equal to the current value 
	TUS_OPETYPE_GREATER_THAN     = 1, // Write if variable is greater than the current value 
	TUS_OPETYPE_GREATER_OR_EQUAL = 2, // Write if variable is greater than or equal to the current value 
	TUS_OPETYPE_LESS_THAN        = 3, // Write if variable is less than the current value 
	TUS_OPETYPE_LESS_OR_EQUAL    = 4  // Write if variable is equal to or less than the current value 
ENDENUM

//PURPOSE: This structure can be used to retrieve a INT.
//STRUCT STRUCT_STAT_INT
//	INT value
//ENDSTRUCT

//PURPOSE: This structure can be used to retrieve a FLOAT.
//STRUCT STRUCT_STAT_FLOAT
//	FLOAT value
//ENDSTRUCT

//PURPOSE: This structure can be used to retrieve a BOOL.
//STRUCT STRUCT_STAT_BOOL
//	BOOL value
//ENDSTRUCT

//PURPOSE: This structure can be used to retrieve a STRING.
//STRUCT STRUCT_STAT_STRING
//	INT HashValueOfTextLabel
//ENDSTRUCT

//PURPOSE: This structure can be used to retrieve 7*INTEGER.
STRUCT STRUCT_STAT_DATE
    INT  Year
	INT  Month
	INT  Day
	INT  Hour
	INT  Minute
	INT  Seconds
	INT  Milliseconds
ENDSTRUCT

//PURPOSE: This structure contains the possible visibility flags for the stats in the frontend.
ENUM FRONTEND_SHOW_FLAG

	// Always show the stat.
	STAT_FLAG_ALWAYS_SHOW = 1

	// Show only incremented stats.
	,STAT_FLAG_INC_SHOW    = 2

	// Never show the stat.
	,STAT_FLAG_NEVER_SHOW  = 4

ENDENUM

//PURPOSE: Groups that should be used to write to certain leaderboard.
ENUM LB_GROUPS_
	LB_GROUP_BANK_ID      = 6083,
	LB_GROUP_TERRITORY_ID = 6084
ENDENUM

/// PURPOSE: Reset multiplayer stats (start with string "MP") that are prefixed by a certain number (MP0 to MP4)
//           Reset Perfixes are:
//             - MP0_   -> perfix is 0
//             - MP1_   -> perfix is 1
//             - MP2_   -> perfix is 2
//             - MP3_   -> perfix is 3
//             - MPPLY_ -> perfix is 5
//             - MPGEN_ -> perfix is 6
//             - All the other stats have a perfix 7 which is the default perfix value.
NATIVE PROC STAT_RESET_ALL_ONLINE_CHARACTER_STATS(INT prefix) = "0xad7126cac02de4f6"
NATIVE PROC STAT_LOCAL_RESET_ALL_ONLINE_CHARACTER_STATS(INT prefix) = "0x9ab4f7cabff7feb1"

/// PURPOSE: Reset multiplayer stats (start with string "MPPLY")
NATIVE PROC STAT_RESET_ALL_ONLINE_MPPLAYER_STATS() = "0xe0bf6479150c33ea"

/// PURPOSE: Reset multiplayer stats (start with string "MPGEN")
NATIVE PROC STAT_RESET_ALL_ONLINE_MPGENERAL_STATS() = "0xb876906b15886dee"

//PURPOSE: This structure contains the possible FAILURE codes for the cloud load.
ENUM  CLOUD_LOAD_FAILURE_CODES

	//This is not a failure
	LOAD_FAILED_REASON_NONE,

	//Failure codes
	LOAD_FAILED_REASON_FAILED_TO_LOAD,
	LOAD_FAILED_REASON_FILE_CORRUPT,
	LOAD_FAILED_REASON_SERVER_TIMEOUT,
	LOAD_FAILED_REASON_SERVER_ERROR,
	LOAD_FAILED_REASON_FILE_NOT_FOUND,
	LOAD_FAILED_REASON_DIRTY_CLOUD_READ,
	LOAD_FAILED_REASON_DIRTY_PROFILE_STAT_READ,
	LOAD_FAILED_REASON_REFRESH_SAVEMIGRATION_STATUS,

	LOAD_FAILED_REASON_MAX

ENDENUM

//PURPOSE: This structure contains the possible FAILURE codes for the cloud save.
ENUM  CLOUD_SAVE_FAILURE_CODES

	//client errors 4xx
	 HTTP_CODE_CLIENTCLOSEDREQUEST = 499 //Client Closed Request
	,HTTP_CODE_FILENOTFOUND        = 404 //File Not Found
	,HTTP_CODE_REQUESTTIMEOUT      = 408 //Request Timeout
	,HTTP_CODE_TOOMANYREQUESTS     = 429 //Too Many Requests

	//Server errors 5xx
	,HTTP_CODE_ANYSERVERERROR      = 500 //Any HTTP server error
	,HTTP_CODE_GATEWAYTIMEOUT      = 504 //Gateway Timeout
	,HTTP_CODE_NETCONNECTTIMEOUT   = 599 //Network connect timeout error

ENDENUM

/// PURPOSE:  Returns TRUE if a savegame LOAD operation is in progress.
NATIVE FUNC BOOL STAT_LOAD_PENDING(INT slot = -1) = "0x0144e4060b91ec2e"

/// PURPOSE:  Returns TRUE if a savegame SAVE operation is in progress.
NATIVE FUNC BOOL STAT_SAVE_PENDING() = "0x6fde94f8c5742d96"

/// PURPOSE:  Returns TRUE if a savegame SAVE operation is in progress or if a save requested operation is pending.
NATIVE FUNC BOOL STAT_SAVE_PENDING_OR_REQUESTED() = "0xbbf12d94ba938483"

/// PURPOSE:  Request load.
NATIVE FUNC BOOL STAT_LOAD(INT slot) = "0xd7996852361ad7db"

/// PURPOSE:  Returns TRUE if the savegame file was loaded.
NATIVE FUNC BOOL STAT_SLOT_IS_LOADED(INT slot) = "0x587b7bf26e4105bf"

/// PURPOSE:  Returns TRUE if the load operation FAILED. failurecode is set with the failure type.
NATIVE FUNC BOOL STAT_CLOUD_SLOT_LOAD_FAILED(INT slot) = "0x7d9207534c16b2aa"

/// PURPOSE:  Returns LOAD failure code. Only returns a error if STAT_CLOUD_SLOT_LOAD_FAILED() return also TRUE.
NATIVE FUNC CLOUD_LOAD_FAILURE_CODES STAT_CLOUD_SLOT_LOAD_FAILED_CODE(INT slot) = "0x27c2b98ca118874b"

/// PURPOSE:  Returns TRUE if the save operation FAILED. If -1 it will return TRUE if any save failed.
NATIVE FUNC BOOL STAT_CLOUD_SLOT_SAVE_FAILED(INT slot) = "0x51f83a77b94083cb"

/// PURPOSE:  Returns SAVE failure code. Only returns a error if STAT_CLOUD_SLOT_SAVE_FAILED() return also TRUE.
NATIVE FUNC INT STAT_CLOUD_SLOT_SAVE_FAILED_CODE(INT slot) = "0x55af46fe4a2116a7"

/// PURPOSE:  Clear pending SAVES. If -1 it will clear all.
NATIVE PROC STAT_CLEAR_PENDING_SAVES(INT slot) = "0x0bf47acb994fc692"

/// PURPOSE:  Returns TRUE if dirty reads have been detected when we load the Profile Stats.
NATIVE FUNC BOOL STAT_LOAD_DIRTY_READ_DETECTED( ) = "0xa1094269c42a1b05"
NATIVE PROC STAT_CLEAR_DIRTY_READ_DETECTED( ) = "0xf9816d1fa9b68e2f"
NATIVE PROC STAT_GET_LOCAL_SAVE_TIME(INT& year, INT& month, INT& day, INT& hour, INT& min, INT& sec) = "0x0808051294c4c2a9"
NATIVE PROC STAT_GET_PROFILE_STATS_SERVER_SAVE_TIME(INT& year, INT& month, INT& day, INT& hour, INT& min, INT& sec) = "0xd9d2e8de35ce5cca"

/// PURPOSE:  Call this to block any saves requests. This is needed when the user chooses to go into mp game without saving.
NATIVE PROC STAT_SET_BLOCK_SAVES(BOOL blocksaves) = "0xc669ac81a9ecd6cf"
NATIVE FUNC BOOL STAT_GET_BLOCK_SAVES( ) = "0x08a029193b31ef73"

/// PURPOSE:  Triggers an MP profile stats download, and overwrites all local stats with whatever was downloaded, even if they are not server authoritative
NATIVE PROC FORCE_CLOUD_MP_STATS_DOWNLOAD_AND_OVERWRITE_LOCAL_SAVE() = "0x0de669ef2856bfc5"

/// PURPOSE:  Should be called when we are done loading the game in SP to make sure its is really safe to progress to Multiplayer.
NATIVE FUNC BOOL STAT_GET_LOAD_SAFE_TO_PROGRESS_TO_MP_FROM_SP( ) = "0xc0dce8359a3476d3"

//
// INFO:
//   Delete savegame slots are 0 to 5:
//       0 - Default save category of 0, see SaveCategory="0" value in mpStatsSetup.xml
//       1 - Characters stats in slot 0, see SaveCategory="1" value in mpStatsSetup.xml, with the exception of any stat that we want
//       2 - Characters stats in slot 1, see SaveCategory="1" value in mpStatsSetup.xml, with the exception of any stat that we want
//       3 - Characters stats in slot 2, see SaveCategory="1" value in mpStatsSetup.xml, with the exception of any stat that we want
//       4 - Characters stats in slot 3, see SaveCategory="1" value in mpStatsSetup.xml, with the exception of any stat that we want
//       5 - Characters stats in slot 4, see SaveCategory="1" value in mpStatsSetup.xml, with the exception of any stat that we want
NATIVE FUNC BOOL STAT_DELETE_SLOT(INT slot) = "0x312a27f00878aaae"

//PURPOSE
//  Identifies the online service section of Cloud from
//  which to operate.
//  Example:
//      members/sc/2737264672/my/files/are/here
//      members/xbl/63745723743/my/files/are/here
ENUM CLOUD_ONLINE_SERVICE
    RL_CLOUD_ONLINE_SERVICE_NATIVE = 0, //"xbl" on xbox, "np" on ps3
    RL_CLOUD_ONLINE_SERVICE_SC          //"sc" (Social Club)
ENDENUM
NATIVE FUNC BOOL STAT_SET_CLOUD_SAVE_SERVICE(CLOUD_ONLINE_SERVICE service) = "0xd4a6dfe772ebb5e1"

//PURPOSE: DEBUG ONLY COMMAND - SET/UNSET FAILED CLOUD LOAD. 
//         Slot - 0 (general) to 1 to 5 (each one of the character slots)
NATIVE FUNC BOOL STAT_SET_CLOUD_SLOT_LOAD_FAILED(INT slot, BOOL failed) = "0x455bb75024bdd2bd"

//PURPOSE: Call this on slot that has failed load and needs to be reloaded.
NATIVE FUNC BOOL STAT_CLEAR_SLOT_FOR_RELOAD(INT slot) = "0xbeaed5d2d3ba3da8"


/*
Legend for ENUM SAVE_TYPE:

	-	Disabled 
		o	Save is ignored.

	-	Deferred Profile Flush 
		o	Performs a profile stats flush when 5 minutes have passed from last flush.

	-	Cloud Only 
		o	Makes a cloud save Only. Can happen a deferred flush.

	-	Profile Flush Only 
		o	Makes a Profile Flush Only.

	-	Profile Flush, Cloud Save 
		o	Makes a cloud save and profile stats Flush.

	-	Cloud Only, Deferred Profile Flush 
		o	Makes a cloud save and a deferred profile stats Flush.
*/

/// PURPOSE: 
///    These represent commom save types so that we can choose the importance of the save.
ENUM SAVE_TYPE

	//Default save where the event is not identifiable.
	STAT_SAVETYPE_DEFAULT            /* Disabled */

	//Code Saves
	,STAT_SAVETYPE_STUNTJUMP          /* Deferred Profile Flush */
	,STAT_SAVETYPE_CHEATER_CHANGE     /* Deferred Profile Flush */
	,STAT_SAVETYPE_IMMEDIATE_FLUSH    /* Cloud save, Profile Stats Flush */
	,STAT_SAVETYPE_COMMERCE_DEPOSIT   /* Disabled */
	,STAT_SAVETYPE_EXPLOITS           /* Deferred Profile Flush */
	,STAT_SAVETYPE_STORE              /* Disabled */
	,STAT_SAVETYPE_END_CODE

	//Script Saves
	,STAT_SAVETYPE_AMBIENT = STAT_SAVETYPE_END_CODE  /* Cloud Only, Deferred Profile Flush */
	,STAT_SAVETYPE_CASH               /* Disabled */
	,STAT_SAVETYPE_END_GAMER_SETUP    /* Profile Flush Only */
	,STAT_SAVETYPE_END_SHOPPING       /* Profile Flush Only */
	,STAT_SAVETYPE_END_GARAGE         /* Cloud Only, Same as STAT_SAVETYPE_SCRIPT_MP_GLOBALS */
	,STAT_SAVETYPE_END_MISSION        /* Cloud Only, Deferred Profile Flush  */
	,STAT_SAVETYPE_END_ATM            /* Disabled */
	,STAT_SAVETYPE_PRE_STARTSTORE     /* Profile Flush, Cloud Save */
	,STAT_SAVETYPE_SCRIPT_MP_GLOBALS  /* Cloud Only */
	,STAT_SAVETYPE_PROLOGUE           /* Cloud Only */
	,STAT_SAVETYPE_CONTACTS           /* Disabled */
	,STAT_SAVETYPE_START_MATCH        /* Disabled */
	,STAT_SAVETYPE_START_SESSION      /* Cloud Only */
	,STAT_SAVETYPE_INTERACTION_MENU   /* Cloud Only, Deferred Profile Flush */
	,STAT_SAVETYPE_JOIN_SC            /* Disabled */
	,STAT_SAVETYPE_AMB_PROFILE_AWARD_TRACKER /* Cloud Only, Deferred Flush  */
	,STAT_SAVETYPE_PHOTOS             /* Deferred Profile Flush */
	,STAT_SAVETYPE_WEAPON_DROP        /* Disabled */
	,STAT_SAVETYPE_RANKUP             /* Cloud Only, Deferred Profile Flush */
	,STAT_SAVETYPE_END_MISSION_CREATOR /* Cloud Only, Deferred Profile Flush  */

	//Critical save types.
	,STAT_SAVETYPE_CRITICAL
	,STAT_SAVETYPE_END_CREATE_NEWCHAR = STAT_SAVETYPE_CRITICAL  /* Profile Flush, Cloud Save */
	,STAT_SAVETYPE_END_MATCH           /* Profile Flush, Cloud Save */
	,STAT_SAVETYPE_END_SESSION         /* Profile Flush, Cloud Save */
	,STAT_SAVETYPE_DELETE_CHAR         /* Profile Flush, Cloud Save */

	,STAT_SAVETYPE_MAX_NUMBER

ENDENUM

/// PURPOSE: 
///    Default behaviour is to save the defaul slot (0) and the current slot that the player 
///    is using, ie, the value set in stat MPPLY_LAST_MP_CHAR. If you want a diferent slot saved you can pass 
///    in a value - 1 to max number os player slots.
///
NATIVE FUNC BOOL STAT_SAVE(INT slot = 0, BOOL doAssert = TRUE, SAVE_TYPE saveType = 0, INT saveReason = 0) = "0x6fea96827e2a3e4f"

/// PURPOSE: 
///    Default behaviour is to never save during a job/activity. We can use this comamnd to open certain saves.
NATIVE PROC STAT_SET_OPEN_SAVETYPE_IN_JOB(SAVE_TYPE save) = "0x16b95be96a229823"

/// PURPOSE: 
///    Returns TRUE if a certain save is open during a job/activity (default behaviour can be overriden by STAT_SET_OPEN_SAVETYPE_IN_JOB).
NATIVE FUNC BOOL STAT_GET_OPEN_SAVETYPE_IN_JOB(SAVE_TYPE save) = "0x5742bbdc30a3db33"

/// PURPOSE: Returns TRUE if the game is running with the -nompsavegame command line parameter
NATIVE FUNC BOOL STAT_IS_GAME_RUNNING_WITH_NOMPSAVEGAME_PARAM() = "0x8e7220fca12bdd90"

/// PURPOSE:  returns true if the stat is a CODER stat.
NATIVE FUNC BOOL STAT_GET_CODER_STAT(STATSENUM keyHash) = "0x66eb2b1dfefb88f9"

/// PURPOSE:
///    Returns the hash value of the stat ID.
/// PARAMS:
///    str - stat id.
NATIVE FUNC STATSENUM STAT_HASH_ID(STRING str) = "0x7125cd61d5aeddec"

/// PURPOSE:
///    Returns TRUE is the stat key is valid.
NATIVE FUNC BOOL STAT_IS_KEY_VALID(STATSENUM keyHash) = "0x8c40bf5bd821e5c6"

/// PURPOSE:  Access a stat name - DEBUG ONLY command.
NATIVE FUNC STRING STAT_GET_NAME(STATSENUM keyHash) = "0x6112c354da434263"

/// PURPOSE:  Access a stat gxt label id.
NATIVE FUNC INT STAT_GET_LABEL_ID(STATSENUM keyHash) = "0x1427950c22782a0c"

/// PURPOSE:  Access a stat gxt label.
NATIVE FUNC STRING STAT_GET_LABEL(STATSENUM keyHash) = "0x4f34a23778ecf4dd"

/// PURPOSE:  Access a stat gxt description.
NATIVE FUNC STRING STAT_GET_DESCRIPTION(STATSENUM keyHash) = "0x0ebe6b3d14ce019b"

/// PURPOSE:  Access a stat denominator label.
NATIVE FUNC INT STAT_GET_DENOMINATOR(STATSENUM keyHash) = "0x27c28df3d6afc785"

/// PURPOSE:  Set the value of an Int, UInt8, UInt16, UInt32 and UInt64 stat.
NATIVE FUNC BOOL STAT_SET_INT(STATSENUM keyHash, INT data, BOOL coderAssert = true) = "0x076a5661ef5abee4"

/// PURPOSE:  Set the value of an Float stat.
NATIVE FUNC BOOL STAT_SET_FLOAT(STATSENUM keyHash, FLOAT data, BOOL coderAssert = true) = "0xd9b28f1445ffcee7"

/// PURPOSE:  Set the value of an boolean stat.
NATIVE FUNC BOOL STAT_SET_BOOL(STATSENUM keyHash, BOOL data, BOOL coderAssert = true) = "0x41483427efbc0047"

/// PURPOSE:  Set the value of an String stat.
NATIVE FUNC BOOL STAT_SET_GXT_LABEL(STATSENUM keyHash, STRING data, BOOL coderAssert = true) = "0xa83328d394deaa9f"

/// PURPOSE:  Set the value of an Date stat.
NATIVE FUNC BOOL STAT_SET_DATE(STATSENUM keyHash, STRUCT& data, int sizeOfData, BOOL coderAssert = true) = "0x8147c3d3000a3094"

/// PURPOSE:  Set the value of an Date stat.
NATIVE FUNC BOOL STAT_SET_STRING(STATSENUM keyHash, STRING data, BOOL coderAssert = true) = "0x6e74a171535f0808"

/// PURPOSE:  Set the value of an Date stat.
NATIVE FUNC BOOL STAT_SET_POS(STATSENUM keyHash, FLOAT X, FLOAT Y, FLOAT Z, BOOL coderAssert = true) = "0x14acf0cbd3e0dfb8"

//PURPOSE: 
//    Set masked element of a stat. 
//PARAMS:
//    offSet       - number of bits counting from right were the value is going to be set.
//    numberOfBits - number Of bits that should be changed.
//
// STAT_SET_MASKED_INT(statHash, statValue, 8, 8) would set the second byte in a stat
// 
NATIVE FUNC BOOL STAT_SET_MASKED_INT(STATSENUM keyHash, INT data, INT offSet, INT numberOfBits, BOOL coderAssert = true) = "0xe2ea061e6f7b236f"

/// PURPOSE:  Set the value of an user id stat.
NATIVE FUNC BOOL STAT_SET_USER_ID(STATSENUM keyHash, STRING data, BOOL coderAssert = true) = "0xed186f54433a4358"

/// PURPOSE:  Set the current posix time in a stat.
NATIVE FUNC BOOL STAT_SET_CURRENT_POSIX_TIME(STATSENUM keyHash, BOOL coderAssert = true) = "0x39ba1f3b9759059d"

/// PURPOSE:  Get the value of an Int, UInt8, UInt16, UInt32 and UInt64 stat.
NATIVE FUNC BOOL STAT_GET_INT(STATSENUM keyHash, INT& data, INT playerIndex = -1) = "0x61481f9fbb1c7edd"

/// PURPOSE:  Get the value of an Float stat.
NATIVE FUNC BOOL STAT_GET_FLOAT(STATSENUM keyHash, FLOAT& data, INT playerIndex = -1) = "0x9a69a54179cea8e5"

/// PURPOSE:  Get the value of an boolean stat.
NATIVE FUNC BOOL STAT_GET_BOOL(STATSENUM keyHash, BOOL& data, INT playerIndex = -1) = "0x1bb27397611554ce"

/// PURPOSE:  Get the value of an String stat.
NATIVE FUNC BOOL STAT_GET_GXT_LABEL(STATSENUM keyHash, INT& data, INT playerIndex = -1) = "0x7354a4c703aaeb34"

/// PURPOSE:  Get the value of an Date stat.
NATIVE FUNC BOOL STAT_GET_DATE(STATSENUM keyHash, STRUCT& data, int sizeOfData, INT playerIndex = -1) = "0x585e6867d0d71962"

/// PURPOSE:  Get the value of an String stat.
NATIVE FUNC STRING STAT_GET_STRING(STATSENUM keyHash, INT playerIndex = -1) = "0xafca9e302ef8c3e0"

/// PURPOSE:  Get the value of an String stat.
NATIVE FUNC BOOL STAT_GET_POS(STATSENUM keyHash, FLOAT& X, FLOAT& Y, FLOAT& Z, INT playerIndex = -1) = "0x335be6bc12888abe"

//PURPOSE: 
//    Get masked element of a stat. 
//PARAMS:
//    offSet       - number of bits counting from right were the value is going to be set.
//    numberOfBits - number Of bits that should be changed.
//
// eg STAT_GET_MASKED_INT(statHash, statValue, 8, 8) would get the second byte in a stat
//
NATIVE FUNC BOOL STAT_GET_MASKED_INT(STATSENUM keyHash, INT& data, INT offSet, INT numberOfBits, INT playerIndex = -1) = "0xf881d9ecfc43b6ea"

/// PURPOSE:  Get the value of an User Id stat.
NATIVE FUNC STRING STAT_GET_USER_ID( STATSENUM keyHash ) = "0x45a1e17ec0480db4"

/// PURPOSE:  Get the Posix time difference from the posix time stored in the stat value.
NATIVE FUNC INT STAT_GET_POSIX_TIME_DIFFERENCE( STATSENUM keyHash ) = "0x485eee9aae9f082b"

/// PURPOSE:
///    Increments the stat with the new value and display's a message.
/// PARAMS:
///    keyHash - stat id.
///    value - 
NATIVE PROC STAT_INCREMENT(STATSENUM keyHash, FLOAT value) = "0xfa38cf6ffd2bf050"

/// PURPOSE:
///    Decrements the stat with the new value and display's a message.
/// PARAMS:
///    keyHash - stat id.
///    value - 
NATIVE PROC STAT_DECREMENT(STATSENUM keyHash, FLOAT value) = "0x155e99bf32775ddc"

/// PURPOSE:
///    Only update the stat if the new value is greater than the current value. 
/// PARAMS:
///    keyHash - stat id.
///    value - 
NATIVE PROC STAT_SET_GREATER(STATSENUM keyHash, FLOAT value) = "0x53b0eb1ed6aea380"

/// PURPOSE:
///    Only update the stat if the new value is lesser than the current value. 
/// PARAMS:
///    keyHash - stat id.
///    value - 
NATIVE PROC STAT_SET_LESSER(STATSENUM keyHash, FLOAT value) = "0x537b9584db71d36c"

/// PURPOSE:
///    Sets the stat visibility flag in the frontend.
/// PARAMS:
///    keyHash - stat id.
///    flag - 
NATIVE PROC STAT_SET_FRONTEND_VISIBILITY_FLAG(STATSENUM keyHash, FRONTEND_SHOW_FLAG flag) = "0xffce250441ce7e62"

/// PURPOSE:
///    Return the stat visibility flag in the frontend. :Command will assert if the stat is not present in any of the frontend list.
/// PARAMS:
///    keyHash - stat id.
NATIVE FUNC INT STAT_GET_FRONTEND_VISIBILITY_FLAG(STATSENUM keyHash) = "0xb9bd912d7964eefa"

/// PURPOSE:
///    Returns TRUE is the stat type supports STRINGS.
/// PARAMS:
///    keyHash - stat id.
NATIVE FUNC BOOL STAT_GET_SUPPORTS_STRINGS(STATSENUM keyHash) = "0x591ea0765690adce"

/// PURPOSE:
///    Returns TRUE is the stat type supports LABELS.
/// PARAMS:
///    keyHash - stat id.
NATIVE FUNC BOOL STAT_GET_SUPPORTS_LABELS(STATSENUM keyHash) = "0x6cb367057d418b9e"

/// PURPOSE: This command can be used on stats that store timer values in milliseconds (like TOTAL_PLAYING_TIME) but their types are 
///           are too big to be converted to hours in script.
NATIVE FUNC INT STAT_GET_NUMBER_OF_DAYS(STATSENUM keyHash) = "0xdb9dd213ed802a90"
NATIVE FUNC INT STAT_GET_NUMBER_OF_HOURS(STATSENUM keyHash) = "0x0896ca1f4f0d8af1"
NATIVE FUNC INT STAT_GET_NUMBER_OF_MINUTES(STATSENUM keyHash) = "0xbb9770585f7d56a2"
NATIVE FUNC INT STAT_GET_NUMBER_OF_SECONDS(STATSENUM keyHash) = "0x687230a23f87a4cb"

/// PURPOSE: These commands convert a value in milliseconds into days, hours, minutes, seconds and milliseconds.
NATIVE FUNC INT STAT_CONVERT_MILLISECONDS_TO_DAYS(INT milliseconds) = "0x5d186411e9fa592e"
NATIVE FUNC INT STAT_CONVERT_MILLISECONDS_TO_HOURS(INT milliseconds) = "0x126361977a4e3c28"
NATIVE FUNC INT STAT_CONVERT_MILLISECONDS_TO_MINUTES(INT milliseconds) = "0x4641d1c177c9b3c6"
NATIVE FUNC INT STAT_CONVERT_MILLISECONDS_TO_SECONDS(INT milliseconds) = "0x5579164d8ffbdcf8"
NATIVE FUNC INT STAT_GET_MILLISECONDS_TO_NEAREST_SECOND(INT milliseconds) = "0x9faa30d4498b3a47"

/// PURPOSE: converts value in milliseconds to a STRUCT_STAT_DATE.
NATIVE PROC STAT_GET_TIME_AS_DATE(INT milliseconds,  STRUCT_STAT_DATE& data) = "0xb9287757fd89a7e2"

/// PURPOSE: converts value in TIME_DATATYPE to a STRUCT_STAT_DATE.
NATIVE PROC GET_NET_TIMER_AS_DATE(TIME_DATATYPE time,  STRUCT_STAT_DATE& data) = "0x2d265cd5dc21337b"

// PURPOSE: make sure the packed stats offsets are matching between script and code.
NATIVE PROC STATS_CHECK_PACKED_STATS_END_VALUE(INT value) = "0x06b559d06f5714fc"

// --- MetaStats ---------------------------------------------------------------------------------------------------------------

/// PURPOSE:
///    Get the percentage of times that a player entered cover and fired a shot (or shots) - versus not firing a shot
/// PARAMS:
///    szStatPrefix - Player / Mode prefix (i.e. SP0, SP1, MP0, MP4, etc.). Pass in empty string for current player.
NATIVE FUNC FLOAT STAT_GET_PERCENT_SHOTS_IN_COVER(STRING szStatPrefix) = "0x91194ad83a654cef"

/// PURPOSE:
///    Get the percentage of times that a player crouched and fired a shot (or shots) - versus not firing a shot
/// PARAMS:
///    szStatPrefix - Player / Mode prefix (i.e. SP0, SP1, MP0, MP4, etc.). Pass in empty string for current player.
NATIVE FUNC FLOAT STAT_GET_PERCENT_SHOTS_IN_CROUCH(STRING szStatPrefix) = "0x6f21ca40b1b4bebf"


// --- PlayStats ---------------------------------------------------------------------------------------------------------------

/// PURPOSE:
///    Tells the PlayStats that the player has received an invite from a NPC.
/// PARAMS:
///    npcNameIdentifier - NPC name identifier.
NATIVE PROC PLAYSTATS_NPC_INVITE(TEXT_LABEL_31& npcNameIdentifier) = "0x3a74fc046fc85ede"

/// PURPOSE:
///    Tells the PlayStats that the player won XP
/// PARAMS:
///    amount - amount of xp
///    type - string hash of the xp type < actual XP reason >
///    category - string hash of the xp category < the bucket it goes into (e.g. if its an award, even though there are many individual award sources) > 
NATIVE PROC PLAYSTATS_AWARD_XP(INT amount, INT type, INT category) = "0x5842ea5d6a4620e2"

/// PURPOSE:
///    Way for the analytics team to detect actions taken by background scripts.
/// PARAMS:
///    type - string with the type of action.
///    data - any relevant data related to this action.
NATIVE PROC PLAYSTATS_BACKGROUND_SCRIPT_ACTION(STRING type, INT data) = "0x8f21ac03c0a56f7b"

/// PURPOSE:
///    Tells the PlayStats that the player has just ranked UP.
NATIVE PROC PLAYSTATS_RANK_UP(INT rank) = "0xc22e65256a3e9882"

/// PURPOSE:
///    Tells the PlayStats that the player has started a session in OFFLINE MODE.
NATIVE PROC PLAYSTATS_STARTED_SESSION_IN_OFFLINEMODE( ) = "0xda10adb0fc8885a3"

/// PURPOSE:
///    Tells the PlayStats that the player has done and is going back to freemode - call when we are done with a chain.
NATIVE PROC PLAYSTATS_LEAVE_JOB_CHAIN( INT macaddresshash, INT posixtime, INT curr_macaddresshash, INT curr_posixtime, INT leavereason ) = "0xd2384f6e9d32e19e"

/// PURPOSE:
///    Tells the PlayStats that the player hasfinished an activity.
NATIVE PROC PLAYSTATS_ACTIVITY_DONE( INT location, INT activity ) = "0xde6c5252c20a2df4"

/// PURPOSE:
///    Tells the PlayStats that a mission was started.
/// PARAM NOTES:
///    The string should be the entry in a .txt file.
///    The stat will be recorded and later analyzed. 
///    Make sure the mission also does a PLAYSTATS_MISSION_PASSED or PLAYSTATS_MISSION_FAILED. 
/// PARAMS:
///    pMissionName - 
NATIVE PROC PLAYSTATS_MISSION_STARTED(STRING pMissionName, INT variant = 0, INT checkpoint = 0, BOOL replaying = FALSE) = "0xb85c479d5c3ea069"

/// PURPOSE:
///    Tells the PlayStats that a mission is over.
/// PARAM NOTES:
///    The string should be the entry in a .txt file.
///    The stat will be recorded and later analyzed. 
///    Make sure the mission also does a PLAYSTATS_MISSION_STARTED first. 
/// PARAMS:
///    pMissionName - 
NATIVE PROC PLAYSTATS_MISSION_OVER(STRING pMissionName, INT variant = 0, INT checkpoint = 0, BOOL failed = FALSE, BOOL canceled = FALSE, BOOL skipped = FALSE) = "0xa77f683fa0e7b1f5"

/// PURPOSE:
///    Tells the PlayStats that a mission is over.
/// PARAM NOTES:
///    The string should be the entry in a .txt file.
///    The stat will be recorded and later analyzed. 
///    Make sure the mission also does a PLAYSTATS_MISSION_STARTED first. 
/// PARAMS:
///    pMissionName - 
NATIVE PROC PLAYSTATS_MISSION_CHECKPOINT(STRING pMissionName, INT variant = 0, INT previousCheckpoint = 0, INT checkpoint = 0) = "0x0b33380e33b61778"

/// PURPOSE:
///    Tells the PlayStats that a random mission is over.
/// PARAMS:
///    pMissionName - Mission name.
///    outcome - Value MUST be > 0.
///    pMissionName - Time spent in the random event
NATIVE PROC PLAYSTATS_RANDOM_MISSION_DONE(STRING pMissionName, INT outcome, INT timespent, INT attempts = 0) = "0x151e30e68b218815"

/// PURPOSE:
///    Tells the PlayStats that a bet has been done by the local player.
NATIVE PROC PLAYSTATS_ROS_BET(INT amount, INT activity, INT playerIndex, FLOAT commission = 0.0) = "0x35b04e6527be3f22"

/// PURPOSE:
///    Tells the PlayStats that a match has ended. Must be called before PLAYSTATS_MATCH_ENDED is called.
/// PARAMS:
///    xpEarned          - Total XP earned in the match.
///    cashEarned        - Total cash earned in the match.
///    highestKillStreak - Highest kill streak achieved in the match.
///    numberOfKills     - Total enemy kills in the match (should not include suicides or teamkills).
///    numberOfDeaths    - Total player deaths in the match.
///    numberOfSuicides  - Total player suicides in the match.
///    scoreboardRanking - The scoreboard ranking of the player at the end of the match (1st to Nth).
///    teamId            - Team the player was on at the end of the match.
///    crewId            - Active crew the player had selected during the match, if applicable.
///    vehicleId         - Current vehicle ID (Model Key Hash) at the end of the match (probably only applicable for race modes).
///    numberOfHeadshots - Total number of Headshots in the match.
NATIVE PROC PLAYSTATS_POST_MATCH_BLOB(INT xpEarned              
										,INT cashEarned         
										,INT highestKillStreak  
										,INT numberOfKills      
										,INT numberOfDeaths     
										,INT numberOfSuicides   
										,INT scoreboardRanking  
										,INT teamId              
										,INT crewId             
										,INT vehicleId          
										,INT numberOfHeadshots  
										,INT cashEarnedFromBets 
										,INT cashAtStart        
										,INT cashAtEnd
										,INT betWon = -1
										,INT survivedWave = -1) = "0x99bfa8c541ded993"

/// PURPOSE:
///    Tells the PlayStats that a race checkpoint has been reached. 
NATIVE PROC PLAYSTATS_RACE_CHECKPOINT(INT vehicleId,INT checkpointId,INT racePos,INT raceTime,INT checkpointTime) = "0x610807472a433d37"

/// PURPOSE:
///    Call this to create a match history ID to be shared among all machines participating in 
///    the match. The host should call this and share both int's in the broadcast data.
NATIVE FUNC INT PLAYSTATS_CREATE_MATCH_HISTORY_ID( ) = "0x61e9186ebd083d85"
NATIVE FUNC BOOL PLAYSTATS_CREATE_MATCH_HISTORY_ID_2(INT& hashedMac, INT& posixTime) = "0x034e89ed97681ac2"

//Struct to send the match start info.
STRUCT MatchStartInfo
	INT  m_matchType
	INT  m_hashedMac
	INT  m_posixTime
	INT  m_oncalljointime
	INT  m_oncalljoinstate
	INT  m_missionDifficulty
	INT  m_MissionLaunch
	INT  m_RootContentId
ENDSTRUCT

/// PURPOSE:
///    Tells the PlayStats that a match has started.
///    The host needs to call PLAYSTATS_CREATE_MATCH_HISTORY_ID and share the values 
///      of matchHistoryIdA & matchHistoryIdB among all match participants.
NATIVE PROC PLAYSTATS_MATCH_STARTED(STRING matchCreator, STRING uniqueMatchId, MatchStartInfo& info) = "0x47236238b4e9bc2d"

/// PURPOSE:
///    Tells the PlayStats that a match has ended.
NATIVE PROC PLAYSTATS_MATCH_ENDED(INT matchType, STRING matchCreator, STRING uniqueMatchId, BOOL isTeamDeathmatch = FALSE, INT raceType = -1, BOOL leftInProgress = FALSE) = "0x72dbf875c8c4dd8a"

/// PURPOSE:
///    Metric that gets sent when a piece of clothing is bought.
/// PARAMS:
///    itemHash  - Unique Id of the item of clothing.
///    cashSpent - Amount which the player paid for the item.
///    shopNameHash - Hash of the shop name.
///    extraItemHash - additional item type for weapon/vehicle/other hashes.
///    colorHash - Parameter for the type of colour being applied when purchasing vehicle colours (i.e. classic/metallic/matte).
NATIVE PROC PLAYSTATS_SHOP_ITEM(INT itemHash, INT cashSpent, INT shopNameHash, INT extraItemHash = 0, INT colorHash = 0) = "0xb18779ac440ad5c8"

// --- Playstats for multiplayer ambient missions
CONST_INT MAX_CRATE_ITEM_HASHS 8
STRUCT ItemHashArray
	INT m_Hashs[MAX_CRATE_ITEM_HASHS]
ENDSTRUCT

NATIVE PROC  PLAYSTATS_CRATE_DROP_MISSION_DONE(INT ambientMissionId, INT xpEarned, INT cashEarned, INT weaponHash, INT otherItemsHash, INT enemiesKilled, ItemHashArray& specialItemHashs, BOOL collectedBodyArmour) = "0x35dae173a02be828"
NATIVE PROC  PLAYSTATS_CRATE_CREATED(FLOAT X, FLOAT Y, FLOAT Z) = "0x25d1e85627077680"
NATIVE PROC  PLAYSTATS_HOLD_UP_MISSION_DONE(INT ambientMissionId, INT xpEarned, INT cashEarned, INT shopkeepersKilled) = "0x18d3ffc58bbbdfdc"
NATIVE PROC  PLAYSTATS_IMPORT_EXPORT_MISSION_DONE(INT ambientMissionId, INT xpEarned, INT cashEarned, VEHICLE_INDEX vehicleNetworkID) = "0xb69482ecd5b39c5d"
NATIVE PROC  PLAYSTATS_SECURITY_VAN_MISSION_DONE(INT ambientMissionId, INT xpEarned, INT cashEarned) = "0xb9e49b8648e5c6a0"

//Struct to send the RToP info.
STRUCT RaceToPointInfo
	INT m_LocationHash
	INT m_MatchId
	INT m_NumPlayers
	BOOL m_RaceWon
	VECTOR m_RaceStartPos
	VECTOR m_RaceEndPos
ENDSTRUCT

NATIVE PROC  PLAYSTATS_RACE_TO_POINT_MISSION_DONE(INT ambientMissionId, INT xpEarned, INT cashEarned, RaceToPointInfo& rtopInfo) = "0x6eaeb9d07327cb9f"
NATIVE PROC  PLAYSTATS_PROSTITUTE_MISSION_DONE(INT ambientMissionId, INT xpEarned, INT cashEarned, INT cashSpent, INT numberOfServices, BOOL playerWasTheProstitute) = "0xdb7ed300b8bf62bd"

/// PURPOSE:
///    Metric that gets sent when a hidden package is acquired by the player.
/// PARAMS:
///    id  - Unique package id.
///    position - package position, NOT player position.
NATIVE PROC  PLAYSTATS_ACQUIRED_HIDDEN_PACKAGE(INT id) = "0x599a5bfb6e56ddfc"

/// PURPOSE:
///    Metric set when a website is visited
NATIVE PROC PLAYSTATS_WEBSITE_VISITED(INT siteId, INT timeSpent = 0) = "0x615e4a419d932af4"

/// PURPOSE:
///    Metric set when an oddjob is completed.
/// PARAMS:
///    timeSpent     - Time spent in odd job.
///    oddJobId      - odd job identifier - can be the mini-game enum value.
///    extraOddJobId - default value is 0. Set only to distinguish different Locations of the mini-game.
NATIVE PROC PLAYSTATS_ODDJOB_DONE(INT timeSpent, INT oddJobId, INT extraOddJobId = 0) = "0xa5c246361b61ed23"

/// PURPOSE:
///    Metric set when you end a friend Activity!
/// PARAMS:
///    char  - Characters that went in the friend activity.
///    outcome  - and a int that represents:
///               ---- 1 -> Activity finished successfully.
///               ---- 0 -> Activity Failed
///               ---- 2 -> Activity aborted
NATIVE PROC PLAYSTATS_FRIEND_ACTIVITY(INT char, INT outcome) = "0x1a2781cd7cd742e6"

/// PURPOSE:
///    Metric set when the player prop changes.
NATIVE PROC PLAYSTATS_PROP_CHANGE(INT pedIndex, INT position, INT newPropIndex, INT newTextIndex) = "0x182f52ff6d37bd4a"

/// PURPOSE:
///    Metric set when the player cloths changes.
NATIVE PROC PLAYSTATS_CLOTH_CHANGE(INT pedIndex, INT componentID, INT drawableID, INT textureID, INT paletteID) = "0xb3a9c248df46950d"

/// PURPOSE:
///    Metric set when the weapon mode changes. If the wepon is not changing a mod and just adding then set modeIdFrom to 0.
/// PARAMS:
///    modIdFrom - Default value is 0. Set a valid mod id only if we are substituting a mod.
///    modIdTo   - Must always have a valid mod id since this command is called when we set a mod.
NATIVE PROC PLAYSTATS_WEAPON_MODE_CHANGE(WEAPON_TYPE weaponHash, WEAPONCOMPONENT_TYPE modIdTo, WEAPONCOMPONENT_TYPE modIdFrom) = "0x79aed75673bc26f9"

/// PURPOSE:
///    Metric set when the player sets a cheat.
/// PARAMS:
///    cheatString - String that uniquelly identifies the cheat.
NATIVE PROC PLAYSTATS_CHEAT_APPLIED(STRING cheatString) = "0x0a5ebd0f656b440c"

/// PURPOSE:
///    Metric set when the player is idle for a periode of time.
/// PARAMS:
///    idleTime - time idfle, must be > 0.
NATIVE PROC PLAYSTATS_IDLE_KICK(INT idleTime) = "0xa5741f10697506f4"

/// PURPOSE:
///    Convenient way of passing loads of params into the metric PLAYSTATS_JOB_ACTIVITY_ENDED.
STRUCT JobActivityInfo
		//Integer Values
		INT   m_Cash
		INT   m_BetCash
		INT   m_CashStart
		INT   m_CashEnd
		INT   m_MissionLaunch
		INT   m_OriginalHashMac   // First Macaddress Hash passed in PLAYSTATS_MATCH_STARTED. created using PLAYSTATS_CREATE_MATCH_HISTORY_ID_2
		INT   m_OriginalPosixTime // First Posix Time Hash passed in PLAYSTATS_MATCH_STARTED. created using PLAYSTATS_CREATE_MATCH_HISTORY_ID_2

		//Boolean  Values
		BOOL   m_isTeamDeathmatch
		BOOL   m_leftInProgress
		BOOl   m_dnf
		BOOl   m_aggregateScore

		//Unsigned Values (must be >= 0)
		INT   m_XP
		INT   m_HighestKillStreak
		INT   m_Kills
		INT   m_Deaths
		INT   m_Suicides
		INT   m_Rank
		INT   m_CrewId
		INT   m_VehicleId
		INT   m_betWon
		INT   m_survivedWave
		INT   m_TeamId
		INT   m_MatchType
		INT   m_raceType
		INT   m_raceSubtype
		INT   m_matchResult
		INT	  m_jpEarned
		INT	  m_numLaps
		INT	  m_playlistID
		INT   m_celebrationanim
		INT   m_quickplayanim
		INT	  m_StuntLaunchCorona

		//Boolean  Values
		BOOL  m_ishead2head
		BOOL  m_isPlaylistChallenge
		BOOL  m_jobVisibilitySetInCorona //Setup Job Visibility - Was it set to open/closed in corona?
		BOOL  m_weaponsfixed             //Include whether the DM had weapons set to 'fixed'
		BOOL  m_sessionVisible
	    INT   m_jobDifficulty
	    INT   m_outfitStyle
		INT   m_outfitChoiceType     //Outfits: Owned or pre-sets and Outfits: Presets - which preset for which role
		INT   m_playlistHashMac
		INT   m_playlistPosixTime
		
		INT	  m_totalPoints
		INT	  m_largeTargetsHit
		INT	  m_mediumTargetsHit
		INT	  m_smallTargetsHit
		INT	  m_tinyTargetsHit
ENDSTRUCT

/// PURPOSE:
///    Metric set when a job activity has ended
NATIVE PROC PLAYSTATS_JOB_ACTIVITY_END(STRING creator, STRING matchId, JobActivityInfo& info, STRING playlistid) = "0x7c2f437d5dcee019"


STRUCT JobBInfo
	//Bool indicating whether the player is the host
	BOOL   m_ishost
	//Role the player took on
	INT   m_role
	INT   m_cashcutpercentage
	INT   m_kills
	INT   m_deaths
	INT   m_clothes

	INT   m_Cash
	INT   m_CashStart
	INT   m_CashEnd
	INT   m_MissionLaunch
	INT   m_XP
	INT   m_Suicides
	INT   m_Rank
	INT   m_CrewId
	INT   m_TeamId
	INT   m_matchResult
	INT   m_jpEarned
	INT   m_celebrationanim
	INT   m_quickplayanim
	BOOL  m_sessionVisible
	BOOL  m_leftInProgress
	INT   m_leaderscashcutpercentage

	INT   m_lesterCalled         //Received Lester Phone Call?
	INT   m_heistRootConstentId  //Heist root content ID
	INT   m_TimePlanningBoard    //Time Spent on Planning Board
	INT   m_outfitChoiceBy       //Outfits: Leader choice or crew choice?
	INT   m_outfitChoiceType     //Outfits: Owned or pre-sets and Outfits: Presets - which preset for which role
	INT   m_outfitStyle			 //Overall clothing setup chosen by the leader
	INT   m_difficulty           //Difficulty set in corona
	INT   m_1stperson            //NG: 1st person set in corona - forced or allowed choice?
	INT   m_medal                //Which Role got Which Medal
	INT   m_teamLivesUsed        //Number of Team Lives used?
	INT   m_failureReason        //Reason for failure
	INT   m_failureRole          //Which role caused failure
	INT   m_usedQuickRestart    //0 = no restart used, 1 = Full restart, 2 = Checkpoint
	INT   m_usedTripSkip        //Used skip trip?

	//SPECIFIC MISSIONS
	INT   m_spookedCops    //Prison  - Station - spooked cops?
	INT   m_cashLost       //Pacific - Finale - amount of Cash lost from being shot
	INT   m_cashPickedUp   //Pacific - Finale - Cash picked up in cash pick up minigame

	//ON MISSION 'MINIGAMES'
 	INT   m_minigameTimeTaken0 
	INT   m_minigameNumberOfTimes0 
	INT   m_minigameTimeTaken1 
	INT   m_minigameNumberOfTimes1 

	INT   m_heistSessionHashMac
	INT   m_heistSessionIdPosixTime
	
	INT   m_maskChoice
ENDSTRUCT

/// PURPOSE:
///    Metric set when a job B has ended.
NATIVE PROC PLAYSTATS_JOB_BEND(STRING creator, STRING matchId, JobBInfo& info, STRING playlistid) = "0x354e2254fc9758f6"

/// PLAYSTATS function which covers anything being given to the player using the quick fix tool 
ENUM QUICKFIX_ELEMENT
	 QF_NONE = 0
	,QF_WEAPON_GIVE
	,QF_WEAPON_REMOVE 
	,QF_VEHICLE_GIVE
	,QF_VEHICLE_REMOVE
	,QF_APARTMENT_GIVE
	,QF_APARTMENT_REMOVE
	,QF_CLOTHES_GIVE
	,QF_CLOTHES_REMOVE
	,QF_PROGRESS_GIVE
ENDENUM


STRUCT JobLtsInfo
	//Number of rounds set
	INT   m_roundsset
	//number of rounds played
	INT   m_roundsplayed

	INT   m_Cash
	INT   m_BetCash
	INT   m_CashStart
	INT   m_CashEnd
	INT   m_MissionLaunch
	INT   m_1stHashMac
	INT   m_1stPosixTime
	INT   m_XP
	INT   m_HighestKillStreak
	INT   m_Kills
	INT   m_Deaths
	INT   m_Suicides
	INT   m_Rank
	INT   m_CrewId
	INT   m_betWon
	INT   m_TeamId
	INT   m_matchResult
	INT   m_jpEarned
	INT   m_playlistID
	INT   m_celebrationanim
	INT   m_quickplayanim
	BOOL  m_ishead2head
	BOOL  m_isPlaylistChallenge
	BOOL  m_jobVisibilitySetInCorona
	BOOL  m_weaponsfixed
	BOOL  m_sessionVisible
	BOOL  m_leftInProgress
	INT   m_playlistHashMac
	INT   m_playlistPosixTime
	INT   m_outfitStyle
	INT   m_outfitChoiceType     //Outfits: Owned or pre-sets and Outfits: Presets - which preset for which role
ENDSTRUCT
/// PURPOSE:
///    Metric set when a job LTS has ended.
NATIVE PROC PLAYSTATS_JOB_LTS_END(STRING creator, STRING matchId, JobLtsInfo& info, STRING playlistid) = "0xf392afc86853f9a8"

STRUCT JobLtsRoundInfo
	//Number of round ended number
	INT   m_roundNumber
	//number of rounds played so far
	INT   m_roundsplayed

	INT   m_Cash
	INT   m_BetCash
	INT   m_CashStart
	INT   m_CashEnd
	INT   m_MissionLaunch
	INT   m_1stHashMac
	INT   m_1stPosixTime
	INT   m_XP
	INT   m_Kills
	INT   m_Deaths
	INT   m_Suicides
	INT   m_Rank
	INT   m_CrewId
	INT   m_betWon
	INT   m_TeamId
	INT   m_matchResult
	INT   m_jpEarned
	INT   m_playlistID
	BOOL  m_leftInProgress
	INT   m_playlistHashMac
	INT   m_playlistPosixTime
	INT   m_outfitStyle
	INT   m_outfitChoiceType     //Outfits: Owned or pre-sets and Outfits: Presets - which preset for which role
ENDSTRUCT
/// PURPOSE:
///    Metric set when a job LTS has ended.
NATIVE PROC PLAYSTATS_JOB_LTS_ROUND_END(STRING creator, STRING matchId, JobLtsRoundInfo& info, STRING playlistid) = "0xee86a0e0fa49d8ce"

/// PURPOSE:
///    Metric set to cover the quick fix tool.
NATIVE PROC PLAYSTATS_QUICKFIX_TOOL(QUICKFIX_ELEMENT anElement, STRING ItemName) = "0x31d208859887778e"

/// PURPOSE:
///    Metric set the multiplayer game join type.
NATIVE PROC PLAYSTATS_SET_JOIN_TYPE(INT type) = "0xcdb137fb56218d0b"

/// PURPOSE:
///    Metric used to track the freemode creator usage
NATIVE PROC PLAYSTATS_CREATOR_USAGE(INT timeSpent, INT numberOfTries, INT numberOfEarlyQuits, BOOL isCreating, INT missionId) = "0xd18ba756f08547a6"

/// PURPOSE:
///    Metric used to track the cheaters pulling the cable in heists
NATIVE PROC PLAYSTATS_HEIST_SAVE_CHEAT(INT value, INT secondValue=0) = "0xf3e9ac7d5adcefff"

/// PURPOSE:
///    Metric used to track the cheaters pulling the cable in heists
NATIVE PROC PLAYSTATS_APPEND_STARTER_PACK_APPLIED(INT item, INT amount) = "0x377457ac40fbc473"

STRUCT VideoClipMetric
	INT m_characterHash
	INT m_timeOfDay
	INT m_weather
	BOOL m_wantedLevel
	INT m_pedDensity
	INT m_vehicleDensity
	BOOL m_restrictedArea
	BOOL m_invulnerability
ENDSTRUCT

/// PURPOSE:
///    Metric used to track the cheaters pulling the cable in heists
NATIVE PROC PLAYSTATS_APPEND_DIRECTOR_METRIC(VideoClipMetric& value) = "0x8f37c5ad44e3e390"


STRUCT scrFmEventAmbientMission
	INT m_uid0                  //Unique Mission ID - for that instance, shared between participating players.
	INT m_uid1                  //Unique Mission ID - for that instance, shared between participating players.
	INT m_playersNotified       //Players Notified.
	INT m_playersParticipating  //Number of Players Participating, who collected a crate in any given drop.
	INT m_playersLeftInProgress //Players who left in progress.
	INT m_endReason             //Reason why script ended.
	INT m_cashEarned            //Cash Earned.
	INT m_rpEarned              //RP Earned.
	INT m_notifiedTime          //Notification PosixTime.
	INT m_startTime             //Start PosixTime.
	INT m_timeTakenToComplete   //Time Taken to complete.
	INT m_timeTakenForObjective //Time between notifications being sent and someone actually completing of the objectives.
ENDSTRUCT
NATIVE PROC  PLAYSTATS_FM_EVENT_PENNEDIN(scrFmEventAmbientMission& data) = "0x5c348c9363cd3372"

STRUCT scrFmEventAmbMission_Challenges
	scrFmEventAmbientMission  m_data
	 //Challenge type (12 in total)
	INT                        m_challengeType
	FLOAT                      m_challengeScore
ENDSTRUCT
NATIVE PROC  PLAYSTATS_FM_EVENT_CHALLENGES(scrFmEventAmbMission_Challenges& data) = "0xb6aa2ab935f596ea"

STRUCT scrFmEventAmbMission_VehicleTarget 
	scrFmEventAmbientMission  m_data
	INT                        m_vehicleType
ENDSTRUCT
NATIVE PROC  PLAYSTATS_FM_EVENT_VEHICLETARGET(scrFmEventAmbMission_VehicleTarget& data) = "0xd36a8190bfc150eb"

STRUCT scrFmEventAmbMission_UrbanWarfare 
	scrFmEventAmbientMission  m_data
	INT                        m_vehicleType
	INT                        m_waveReached
ENDSTRUCT
NATIVE PROC  PLAYSTATS_FM_EVENT_URBANWARFARE(scrFmEventAmbMission_UrbanWarfare& data) = "0x0f8b888069fabc4b"

STRUCT scrFmEventAmbMission_CheckpointCollection
	scrFmEventAmbientMission  m_data
	INT                        m_quarterMapChosen        //Quarter of the map chosen
	INT                        m_numCheckpointsCollected //Number of checkpoints collected
	//Location of any Checkpoints NOT collected
	INT                        m_notCollectedCheckpoints_0
	INT                        m_notCollectedCheckpoints_1
	INT                        m_notCollectedCheckpoints_2
	INT                        m_notCollectedCheckpoints_3
	INT                        m_notCollectedCheckpoints_4
	INT                        m_notCollectedCheckpoints_5
	INT                        m_notCollectedCheckpoints_6
	INT                        m_notCollectedCheckpoints_7
	INT                        m_notCollectedCheckpoints_8
	INT                        m_notCollectedCheckpoints_9
ENDSTRUCT
NATIVE PROC  PLAYSTATS_FM_EVENT_CHECKPOINTCOLLECTION(scrFmEventAmbMission_CheckpointCollection& data) = "0xa0462f398aa286df"

STRUCT scrFmEventAmbMission_PlaneDrop
	scrFmEventAmbientMission  m_data
	INT                        m_routeTaken         //Route taken
	INT                        m_numCratesCollected //Number of crates collected
	INT                        m_numCratesDropped   //Number of crates dropped
ENDSTRUCT
NATIVE PROC  PLAYSTATS_FM_EVENT_PLANEDROP(scrFmEventAmbMission_PlaneDrop& data) = "0xc09e4a7895c35881"

STRUCT scrFmEventAmbMission_ATOB
	scrFmEventAmbientMission  m_data
	INT                       m_vehicleType
	INT                       m_parTimeBeaten
	INT                       m_type
ENDSTRUCT
NATIVE PROC  PLAYSTATS_FM_EVENT_ATOB(scrFmEventAmbMission_ATOB& data) = "0xf8da4028cd22e160"

STRUCT scrFmEventAmbMission_TargetAssassination
	scrFmEventAmbientMission  m_data
	INT                        m_targetsKilled //Targets killed
ENDSTRUCT
NATIVE PROC  PLAYSTATS_FM_EVENT_TARGETASSASSINATION(scrFmEventAmbMission_TargetAssassination& data) = "0xf6b5d6c7108b01a9"

STRUCT scrFmEventAmbMission_PassTheParcel
	scrFmEventAmbientMission  m_data
	INT                        m_numTimesVehicleExchangeHands   //Number of times vehicle exchanged hands
ENDSTRUCT
NATIVE PROC  PLAYSTATS_FM_EVENT_PASSTHEPARCEL(scrFmEventAmbMission_PassTheParcel& data) = "0x7236b5a5338da076"

STRUCT scrFmEventAmbMission_HotProperty
	scrFmEventAmbientMission  m_data
	INT m_numTimesBriefcaseExchangeHands //Number of times briefcase exchanged hands
	INT m_timeBriefecaseHeld             //Time briefcase was held for
ENDSTRUCT
NATIVE PROC  PLAYSTATS_FM_EVENT_HOTPROPERTY(scrFmEventAmbMission_HotProperty& data) = "0x036357a803423cff"

STRUCT scrFmEventAmbMission_DeadDrop
	scrFmEventAmbientMission  m_data
	INT                        m_numTimesBagExchangeHands //Number of times bag exchanged hands
	INT                        m_timeBagHeld              //Time bag was held for
ENDSTRUCT
NATIVE PROC  PLAYSTATS_FM_EVENT_DEADDROP(scrFmEventAmbMission_DeadDrop& data) = "0xbaf4c2bad0b0ea1a"

STRUCT scrFmEventAmbMission_KingoftheCastle
	scrFmEventAmbientMission  m_data
	INT                        m_numOfKings        //Number of times briefcase exchanged hands
	INT                        m_killsAsKing       //Kills as King
	INT                        m_deathsAsKing      //Deaths as King
	INT                        m_areaControlPoints //Area Control Points
ENDSTRUCT
NATIVE PROC  PLAYSTATS_FM_EVENT_KINGOFTHECASTLE(scrFmEventAmbMission_KingoftheCastle& data) = "0xbfc873f8c77d376a"

STRUCT scrFmEventAmbMission_CriminalDamage
	scrFmEventAmbientMission  m_data
	INT                        m_propertyDamageValue //Total Property Damage value per player ($)
ENDSTRUCT
NATIVE PROC  PLAYSTATS_FM_EVENT_CRIMINALDAMAGE(scrFmEventAmbMission_CriminalDamage& data) = "0xa4acc498bf04bbd2"

//STRUCT scrFmEventAmbMission_Infection
//	scrFmEventAmbientMission  m_data
//	INT                        m_numPlayersInfected         //Number of player’s infection is spread to
//	INT                        m_numInfectedPlayerKills     //Number of infected player kills
//	INT                        m_numOfUninfectedPlayerkills //Number of uninfected player kills
////ENDSTRUCT
////NATIVE PROC  PLAYSTATS_FM_EVENT_INFECTION(scrFmEventAmbMission_Infection& data)

STRUCT scrFmEventAmbMission_CompetitiveUrbanWarfare
	scrFmEventAmbientMission  m_data
	INT                        m_waveReached    //Wave reached
	INT                        m_killsPerPlayer //Kills per player
ENDSTRUCT
NATIVE PROC  PLAYSTATS_FM_EVENT_COMPETITIVEURBANWARFARE(scrFmEventAmbMission_CompetitiveUrbanWarfare& data) = "0xa68ba8226372eb99"

STRUCT scrFmEventAmbMission_HuntBeast 
	scrFmEventAmbientMission  m_data
	INT                        m_landmarksCollected
ENDSTRUCT
NATIVE PROC  PLAYSTATS_FM_EVENT_HUNTBEAST(scrFmEventAmbMission_HuntBeast& data) = "0x1a6091d59d217dd9"

STRUCT scrPIMenuHideSettings
	INT m_bitsetopt1
	INT m_bitsetopt2
	INT m_bitsetopt3
	INT m_bitsetopt4
ENDSTRUCT
NATIVE PROC  PLAYSTATS_PIMENU_HIDE_OPTIONS(scrPIMenuHideSettings& data) = "0xd55d9d8a7aa7d37c"

/// PURPOSE:
///    Metric used to register what event awards bad sport.
NATIVE PROC PLAYSTATS_AWARD_BAD_SPORT(INT evenID) = "0xc7e3e54072256976"


/// PURPOSE:
/// Boss work and challenges metrics

STRUCT scrBwBossWork 
	INT m_boss1						// bossId1
	INT m_boss2						// bossId2
	INT m_match1					// matchId1
	INT m_match2					// matchId2
	INT m_playerParticipated		//Whether  or not player participated 
	INT m_timeStart					//Time work started
	INT m_timeEnd					//Time work ended
	INT m_won						//won/lost
	INT m_endingReason				//Reason for script ending - timer ran out, left session, etc
	INT m_cashEarned				//Cash Earned.
	INT m_rpEarned					//RP Earned.
	INT m_bossKilled				//Boss's killed
	INT m_goonsKilled				//Goons killed
	INT m_deaths					//Deaths
ENDSTRUCT

STRUCT scrBwBossOnBossDeathMatch 
	scrBwBossWork	m_data
	INT				m_launchedByBoss
	INT				m_invitesSent
	INT             m_invitesAccepted
ENDSTRUCT
NATIVE PROC  PLAYSTATS_BW_BOSSONBOSSDEATHMATCH(scrBwBossOnBossDeathMatch& data) = "0xa2bf4ac9acf0021a"

STRUCT scrBwYatchAttack 
	scrBwBossWork	m_data
	INT				m_launchedByBoss
	INT				m_totalCapturingScore
	INT             m_totalUnderAttackScore
ENDSTRUCT
NATIVE PROC  PLAYSTATS_BW_YATCHATTACK(scrBwYatchAttack& data) = "0x2f1582c801d17816"

STRUCT scrBwHuntTheBoss 
	scrBwBossWork	m_data
	INT				m_launchedByBoss
	INT				m_variationPlayed
ENDSTRUCT
NATIVE PROC  PLAYSTATS_BW_HUNT_THE_BOSS(scrBwHuntTheBoss& data) = "0xa3694635b2da5e02"

STRUCT scrBwPutOutAHit 
	scrBwBossWork	m_data
	INT				m_hitMethodSelected
ENDSTRUCT
NATIVE PROC  PLAYSTATS_BW_PUT_OUT_A_HIT(scrBwPutOutAHit& data) = "0xd0eaa9f9db082fac"

STRUCT scrBwSightseer 
	scrBwBossWork	m_data
	INT				m_launchedByBoss
	INT				m_numberLocationToWin
	INT				m_totalLocation
ENDSTRUCT
NATIVE PROC  PLAYSTATS_BW_SIGHTSEER(scrBwSightseer& data) = "0x7fc250a0d1c39223"

STRUCT scrBwAssault 
	scrBwBossWork	m_data
	INT				m_launchedByBoss
	INT				m_locationSelected
ENDSTRUCT
NATIVE PROC  PLAYSTATS_BW_ASSAULT(scrBwAssault& data) = "0x4cbb7d97ae1390e4"

STRUCT scrBwBellyOfTheBeast 
	scrBwBossWork	m_data
	INT				m_launchedByBoss
	INT				m_vehicleType
	INT				m_pickupLocation
	INT				m_deliveryLocation
ENDSTRUCT
NATIVE PROC  PLAYSTATS_BW_BELLY_OF_THE_BEAST(scrBwBellyOfTheBeast& data) = "0x73b0858131673542"

STRUCT scrBwHeadhunter
	scrBwBossWork	m_data
	INT				m_enemiesKilled
	INT				m_targetLocation
	INT				m_numberOfTargetsKilled
	INT				m_launchedByBoss
ENDSTRUCT
NATIVE PROC  PLAYSTATS_BW_HEAD_HUNTER(scrBwHeadhunter& data) = "0x03d59b76663576e2"

STRUCT scrBwFragileGoods
	scrBwBossWork	m_data
	FLOAT			m_destroyDisconnectedRatio // Trailer destroyed/ total trailer disconnects
	INT				m_targetLocation
	INT				m_startLocation
	INT				m_rivalGangDestination
	INT				m_launchedByBoss
ENDSTRUCT
NATIVE PROC  PLAYSTATS_BW_FRAGILE_GOODS(scrBwFragileGoods& data) = "0x4612c1ed6611a9fc"

STRUCT scrBwAirfreight
	scrBwBossWork	m_data
	INT				m_containerDisconnected
	INT				m_targetLocation
	INT				m_containerLocation
	INT				m_launchedByBoss
ENDSTRUCT
NATIVE PROC  PLAYSTATS_BW_AIR_FREIGHT(scrBwAirfreight& data) = "0x7eb13bd67b2c8aa0"

STRUCT scrBcBossChallenge
	INT m_boss1						// bossId1
	INT m_boss2						// bossId2
	INT m_match1					// matchId1
	INT m_match2					// matchId2
	INT m_playerParticipated		//Whether  or not player participated 
	INT m_timeStart					//Time work started
	INT m_timeEnd					//Time work ended
	INT m_won						//won/lost
	INT m_endingReason				//Reason for script ending - timer ran out, left session, etc
	INT m_cashEarned				//Cash Earned.
	INT m_rpEarned					//RP Earned.
	INT m_bossKilled				//Boss's killed
	INT m_goonsKilled				//Goons killed
	INT m_wagerSet					//Wager Set
ENDSTRUCT

STRUCT scrBcCarJacking
	scrBcBossChallenge m_data
	INT m_totalScore		//Total score
ENDSTRUCT
NATIVE PROC  PLAYSTATS_BC_CAR_JACKING(scrBcCarJacking& data) = "0x1f7b9822fbcbc8b8"

STRUCT scrBcSmashAndGrab
	scrBcBossChallenge m_data
	INT m_deaths			//Deaths
	INT m_storesHeldUp		//number of stores held up
	INT m_deliveriesMade	//number of deliveries made
	INT m_cashLost			//cash lost (through deaths) ($)
	INT m_cashDelivered		//cash delivered ($)
ENDSTRUCT
NATIVE PROC  PLAYSTATS_BC_SMASH_AND_GRAB(scrBcSmashAndGrab& data) = "0x187d3bfc3d998a39"

STRUCT scrBcProtectionRacket
	scrBcBossChallenge m_data
	INT m_deaths				//Deaths
	INT m_cashBagsCollected		//cash bags collected
	INT m_cashBagsDelivered		//cash bags delivered
	INT m_pickupQuadrant		//Pickup Quadrant
	INT m_deliveryQuadrant		//Delivery Quadrant
ENDSTRUCT
NATIVE PROC  PLAYSTATS_BC_PROTECTION_RACKET(scrBcProtectionRacket& data) = "0x37234f685a03b73f"

STRUCT scrBcMostWanted
	scrBcBossChallenge m_data
	INT m_deaths			//Deaths
	INT m_timeLasted		//Time lasted with wanted level
ENDSTRUCT
NATIVE PROC  PLAYSTATS_BC_MOST_WANTED(scrBcMostWanted& data) = "0x95bb1bc7bdff19c2"

STRUCT scrBcFindersKeepers
	scrBcBossChallenge m_data
	INT m_deaths				//Deaths
	INT m_packagesCollected		//number of packages collected
	INT m_quadrantSelected      // Quandrant selected
ENDSTRUCT
NATIVE PROC  PLAYSTATS_BC_FINDERS_KEEPERS(scrBcFindersKeepers& data) = "0x65eb7510f961294b"

STRUCT scrBcRunningRiot
	scrBcBossChallenge m_data
	INT m_deaths			//Deaths
	INT m_numberOfKills		//number of kills
ENDSTRUCT
NATIVE PROC  PLAYSTATS_BC_RUNNING_RIOT(scrBcRunningRiot& data) = "0x64b82f7a437e51e6"

STRUCT scrBcPointToPoint
	scrBcBossChallenge m_data
	INT m_deaths			//Deaths
ENDSTRUCT
NATIVE PROC  PLAYSTATS_BC_POINT_TO_POINT(scrBcPointToPoint& data) = "0x219041062b6224d5"

STRUCT scrBcCashing
	scrBcBossChallenge m_data
	INT m_machinesHacked
    FLOAT m_failedMinigamesRatio
    INT m_wantedLevelReached
ENDSTRUCT
// Send metric for Boss challenge Cashing
NATIVE PROC  PLAYSTATS_BC_CASHING(scrBcCashing& data) = "0xa39339c7305adb9c"

STRUCT scrBcSalvage
	scrBcBossChallenge m_data
	INT m_checkpointsCollected
	INT m_rebreathersCollected
	INT m_deaths				//Deaths
ENDSTRUCT
// Send metric for Boss challenge Salvage
NATIVE PROC  PLAYSTATS_BC_SALVAGE(scrBcSalvage& data) = "0x1e7c34e08a322056"



// PURPOSE: When the player uses the custom loadout
NATIVE PROC PLAYSTATS_SPENT_PI_CUSTOM_LOADOUT(INT value) = "0x1ca7d9ffee780abd"


STRUCT scrContrabandMission
    INT m_bossId1					//BossId
    INT m_bossId2				    //BossId
    INT m_matchId1				    //MatchId
    INT m_matchId2				    //MatchId
    INT m_playerParticipated        //Whether or not player participated 
    INT m_timeStart				    //Time work started
    INT m_timeEnd				    //Time work ended
    INT m_won					    //won/lost
    INT m_endingReason              //Reason for script ending - timer ran out, left session, etc
    INT m_cashEarned			    //Cash Earned.
    INT m_rpEarned			        //RP Earned.
    INT m_location			        //Location selected
    INT m_type                      //Type of Mission Launched (small medium, large)
    INT m_subtype                   //Subtype of Mission Launched
    INT m_warehouseOwned			//What Warehouses the Boss owns (bit set)
    INT m_warehouseOwnedCount		//number of Warehouses the Boss owns
    INT m_failureReason			    //Failure reason
	INT m_missionId = 0				//MissionId
ENDSTRUCT

STRUCT scrBuyContrabandMission
    scrContrabandMission m_data
    INT m_startVolume			    //Contraband volume at start of mission
    INT m_endVolume			        //Contraband volume at end of mission
    INT m_startWarehouseCapacity	//Warehouse capacity % at start of mission
    INT m_endWarehouseCapacity 	    //Warehouse capacity % at end of mission
    INT m_contrabandDestroyed       //Amount of contraband destroyed
    INT m_contrabandDelivered       //Amount of contraband delivered
	INT m_FromHackerTruck			//whether the mission was launched from the Hacker Truck
	INT m_properties = 0
	INT m_properties2 = 0
ENDSTRUCT

STRUCT scrSellContrabandMission
    scrBuyContrabandMission m_data
    INT m_dropOffLocation		    //Drop off location
ENDSTRUCT

STRUCT scrDefendContrabandMission
    scrBuyContrabandMission m_data
    INT m_enemiesKilled		    //Enemies killed
ENDSTRUCT

STRUCT scrRecoverContrabandMission
    scrDefendContrabandMission m_data
    INT m_lostDestroyedOrRecovered    //Whether contraband was lost, destroyed or recovered
ENDSTRUCT

// Send the telemetry information when finishing a Buy Contraband mission
NATIVE PROC  PLAYSTATS_BUY_CONTRABAND_MISSION(scrBuyContrabandMission& data) = "0x3896bbdea3bcafad"

// Send the telemetry information when finishing a Sell Contraband mission
NATIVE PROC  PLAYSTATS_SELL_CONTRABAND_MISSION(scrSellContrabandMission& data) = "0x97bb06ae7f3419c6"

// Send the telemetry information when finishing a Defend Contraband mission
NATIVE PROC  PLAYSTATS_DEFEND_CONTRABAND_MISSION(scrDefendContrabandMission& data) = "0xb17bfb605ef6b707"

// Send the telemetry information when finishing a Recover Contraband mission
NATIVE PROC  PLAYSTATS_RECOVER_CONTRABAND_MISSION(scrRecoverContrabandMission& data) = "0xd212223613e42328"

// Call this everytime a player hits the limit for destroying contraband
NATIVE PROC PLAYSTATS_HIT_CONTRABAND_DESTROY_LIMIT(INT amount) = "0x7bc2b65f979b471a"
// --- Presence Events -----------------------------------------------------------------------------------------------------------

//INFO:
//PARAM NOTES:
//PURPOSE: Send a presence event regarding a significant update of a stat.  Will result in a 
//		EVENT_NETWORK_PRESENCE_STAT_UPDATE being received by all your friends
NATIVE PROC PRESENCE_EVENT_UPDATESTAT_INT(STATSENUM statId, INT value, INT value2 = 0) = "0x423a6008ceed5d6c"
NATIVE PROC PRESENCE_EVENT_UPDATESTAT_FLOAT(STATSENUM statId, FLOAT value, INT value2 = 0) = "0x4115628326810a31"
NATIVE PROC PRESENCE_EVENT_UPDATESTAT_INT_WITH_STRING(STATSENUM statId, INT value, INT value2, STRING stringData) = "0xcc0d9986102e9b4f"
NATIVE PROC PRESENCE_EVENT_UPDATESTAT_FLOAT_WITH_STRING(STATSENUM statId, FLOAT value, INT value2, STRING stringData) = "0x5c17293d8f69a65d"


// --- Leaderboards --------------------------------------------------------------------------------------------------------------

/// PURPOSE:  Maximun number of columns that can be read/updated
CONST_INT MAX_LEADERBOARD_COLUMNS  64

/// PURPOSE:  Leaderboard column types
CONST_INT RL_STAT_TYPE_CONTEXT     0
CONST_INT RL_STAT_TYPE_INT32       1
CONST_INT RL_STAT_TYPE_INT64       2
CONST_INT RL_STAT_TYPE_DOUBLE      3
CONST_INT RL_STAT_TYPE_UNICODE     4
CONST_INT RL_STAT_TYPE_FLOAT       5
CONST_INT RL_STAT_TYPE_BINARY      6
CONST_INT RL_STAT_TYPE_DATETIME    7
CONST_INT RL_STAT_TYPE_NULL        255

//PURPOSE
//   Enum with all leaderboard types.
ENUM LEADERBOARDS2_TYPES_ENUM
    LEADERBOARD2_TYPE_INVALID = 0,
    LEADERBOARD2_TYPE_PLAYER,        //Ranks players
    LEADERBOARD2_TYPE_CLAN,          //Ranks clans
    LEADERBOARD2_TYPE_CLAN_MEMBER,   //Ranks members within a clan
    LEADERBOARD2_TYPE_GROUP,         //Ranks groups
    LEADERBOARD2_TYPE_GROUP_MEMBER   //Ranks members within a group
ENDENUM

//PURPOSE: 
STRUCT LEADERBOARD_GAMER
    GAMER_HANDLE m_GamerHandle
ENDSTRUCT

/// PURPOSE: 
///    Identifies a group within a leaderboard
STRUCT Leaderboard2Group
	//Name of the category (examples are: "Mission", "Challenge", "CoDriver", "Territory")
	TEXT_LABEL_31  m_Category

	//ID of the group within the category
	TEXT_LABEL_31  m_Id
ENDSTRUCT

/// PURPOSE:  Maximun number of groups that can be updated.
CONST_INT LEADERBOARD_MAX_GROUPS 4
/// PURPOSE: 
//  A list of category/group ID pairs that uniquely identifies
//  a group within a leaderboard.
STRUCT Leaderboard2GroupHandle
	INT  m_NumGroups
	Leaderboard2Group  m_Group[LEADERBOARD_MAX_GROUPS]
ENDSTRUCT

/// PURPOSE: 
STRUCT LeaderboardClanIds
	INT  m_ClanId
ENDSTRUCT


//PURPOSE
//  Used to write an update to a leaderboard.
STRUCT LeaderboardUpdateData
    //Id of the leaderboard being Update.
	INT   m_LeaderboardId
	
    //When writing clan and clan member LBs m_ClanId identifies the
    //clan owning the row.
	INT   m_ClanId

	//When updating group leaderboards m_GroupSelector identifies
    //the group owning the row.  When reading player, clan, and
    //clan member leaderboards, m_GroupSelector identifies the
    //the group containing the players/members/clans.
	Leaderboard2GroupHandle m_GroupSelector
ENDSTRUCT

//PURPOSE
//  Used to read a leaderboard.
STRUCT Leaderboard2ReadData
    //Id of the leaderboard being read.
	INT  m_LeaderboardId

	//Type of read 
	LEADERBOARDS2_TYPES_ENUM  m_Type
	
    //When reading clan and clan member LBs m_ClanId identifies the
    //clan owning the row.
	INT  m_ClanId

	//When reading group leaderboards m_GroupSelector identifies
    //the group owning the row.  When reading player, clan, and
    //clan member leaderboards, m_GroupSelector identifies the
    //the group containing the players/members/clans.
	Leaderboard2GroupHandle    m_GroupSelector
ENDSTRUCT

//PURPOSE
//  Used to read row information from a leaderboard.
STRUCT LeaderboardRowData
    //When reading player or clan member leaderboards the gamer
    //handle identifies the gamer owning the row.
	GAMER_HANDLE  m_GamerHandle

	//Name of the gamer owning the row.
	TEXT_LABEL_23  m_GamerName
    
	//When reading group leaderboards m_GroupSelector identifies
    //the group owning the row.  When reading player, clan, and
    //clan member leaderboards, m_GroupSelector identifies the
    //the group containing the players/members/clans.
	Leaderboard2GroupHandle  m_GroupSelector

    //When reading clan and clan member LBs m_ClanId identifies the
    //clan owning the row.
	INT            m_ClanId
	TEXT_LABEL_31  m_ClanName //Name of the clan.
	TEXT_LABEL_7   m_ClanTag  //Clan tag
	
    //Rank of the row within the leaderboard.
	INT   m_Rank
	
    //Number of Column values of the row.
	INT  m_NumColumnValues
ENDSTRUCT

//PURPOSE
STRUCT LeaderboardReadInfo

	//Set the Leaderboard Id.
	INT m_LeaderboardId
	
    //Set the Leaderboard Read Type done for that leaderboard.
	INT m_LeaderboardType

    //Set the Leaderboard read index in case there was more than one read for the 
    //     same leaderboard ID - Default should be set to 0
	INT m_LeaderboardIndex

    //Returns the Number of Rows returned in the read.
	INT  m_ReturnedRows

	//Returns the Number of Total Rows in the leaderboard.
	INT  m_TotalRows
	
	//Returns the local gamer row number, -1 if the local gamer is not present.
	INT  m_LocalGamerRowNumber
	
	//Set with local gamer rank score if it is of type INT
	INT  m_LocalGamerRankInt

	//Set with local gamer rank score if it is of type FLOAT
	FLOAT m_LocalGamerRankFloat
ENDSTRUCT

//PURPOSE
//  Used for caching leaderboard display data. This needs to match code values and classes.
CONST_INT MAX_COLUMNS 32
STRUCT LeaderboardCachedDisplayData
	INT            m_Id                       // This ID is set in script and needs to be unique so that identifies this cache data.
	TEXT_LABEL_63  m_GamerName
	TEXT_LABEL_63  m_CoDriverName
	GAMER_HANDLE   m_GamerHandle
	GAMER_HANDLE   m_CoDriverHandle
	BOOL           m_CustomVehicle
	INT            m_Rank
	INT            m_RowFlags                 // Script row flags
	INT            m_NumColumns               // Total number of columns used.
	INT            m_ColumnsBitSets           // 1 if it is INT 0 if FLOAT.
	FLOAT          m_fColumnData[MAX_COLUMNS]
	INT            m_iColumnData[MAX_COLUMNS]
ENDSTRUCT

STRUCT LeaderboardPredictionRow
	INT            m_Id                       // This ID is set in script and needs to be unique so that identifies this cache data.
	INT            m_NumColumns               // Total number of columns used.
	INT            m_ColumnsBitSets           // 1 if it is INT 0 if FLOAT.
	FLOAT          m_fColumnData[MAX_COLUMNS]
	INT            m_iColumnData[MAX_COLUMNS]
ENDSTRUCT


// PURPOSE
//   Returns the number of columns of a leaderboard.
NATIVE FUNC INT LEADERBOARDS_GET_NUMBER_OF_COLUMNS(INT leaderboardId, ENUM_TO_INT type) = "0x00c49126c192c957"

// PURPOSE
//   Returns the column id of the leaderboard.
NATIVE FUNC INT LEADERBOARDS_GET_COLUMN_ID(INT leaderboardId, ENUM_TO_INT type, INT columnIndex) = "0x07a9b621946d6d59"

// PURPOSE
//   Returns the column type of the leaderboard.
NATIVE FUNC INT LEADERBOARDS_GET_COLUMN_TYPE(INT leaderboardId, ENUM_TO_INT type, INT columnIndex) = "0x8cee6633e5a509ad"

// PURPOSE
//   Returns true if we can read a leaderboard for player x.
// NOTES
//   Games are permitted one read and one write to the leaderboards, 
//   during a single interactive game session for each player. 
//   If a game session exceeds five minutes in duration, the game is permitted 
//   an additional read and/or write at each subsequent five-minute interval to the leaderboards. 
NATIVE FUNC BOOL LEADERBOARDS_CAN_READ(INT playerIndex) = "0x6d57674f672c9076"

// PURPOSE
//   Clear all leaderboard read's done.
NATIVE FUNC INT LEADERBOARDS_READ_CLEAR_ALL() = "0x8a3025b5ff237b8e"

// PURPOSE
//   Clear leaderboard read data. -1 clear all leaderboards with that id and type.
NATIVE FUNC INT LEADERBOARDS_READ_CLEAR(INT leaderboardId, ENUM_TO_INT leaderboardType, INT lbIndex = -1) = "0x25cfa7d8d16b29d0"

// PURPOSE
//   Returns true if leaderboard read is pending. -1 return pending if any leaderboard with that id and type is pending.
NATIVE FUNC BOOL LEADERBOARDS_READ_PENDING(INT leaderboardId, ENUM_TO_INT leaderboardType, INT lbIndex = -1) = "0x589034697689cc35"
NATIVE FUNC BOOL LEADERBOARDS_READ_ANY_PENDING() = "0xc15645989af376b8"

// PURPOSE
//   Returns true if leaderboard read exists, ie, if script started a read of that leaderboard and has not cleared the READ yet. 
//      -1 return exists if any leaderboard with that id and type is pending.
NATIVE FUNC BOOL LEADERBOARDS_READ_EXISTS(INT leaderboardId, ENUM_TO_INT leaderboardType, INT lbIndex = -1) = "0x8e70e98efae1c9aa"

// PURPOSE
//   Returns true if leaderboard read was successful.
NATIVE FUNC BOOL LEADERBOARDS_READ_SUCCESSFUL(INT leaderboardId, ENUM_TO_INT leaderboardType, INT lbIndex = 0) = "0x4a37499e7c2832d2"
NATIVE FUNC BOOL LEADERBOARDS_READ_SUCCESSFUL_BY_HANDLE(INT leaderboardId, ENUM_TO_INT leaderboardType, GAMER_HANDLE& gamer, INT lbIndex = 0) = "0xc62769774d2f3a98"

/// PURPOSE:
///    Starts a leaderboard READ Operation for all players in the session.
/// PARAMS:
///    in_lbData - Leaderboard info for the read.
///    pArray_LBGroups - List of Groups being read and ranked (Supply this when reading RL_LEADERBOARD2_TYPE_GROUP)
///    numGroups - Number of Group ids.
/// RETURNS:
///    TRUE is the operation is started sucessfully.
NATIVE FUNC BOOL LEADERBOARDS2_READ_SESSION_PLAYERS_BY_ROW(Leaderboard2ReadData& in_lbData, Leaderboard2GroupHandle& pArray_LBGroups[], INT numGroups) = "0xf55d542cdcb05fc4"

/// PURPOSE:
///    Starts a leaderboard READ Operation for all friends.
/// PARAMS:
///    in_lbData -  Leaderboard info for the read.
///    pArray_LBGroups - List of Groups being read and ranked (Supply this when reading RL_LEADERBOARD2_TYPE_GROUP)
///    numGroups - Number of Group ids.
///    includeLocalPlayer - TRUE to also include the local player in the operation.
/// RETURNS:
///    TRUE is the operation is started sucessfully.
NATIVE FUNC BOOL LEADERBOARDS2_READ_FRIENDS_BY_ROW(Leaderboard2ReadData& in_lbData
													,Leaderboard2GroupHandle& pArray_LBGroups[]
													,INT numGroups
													,BOOL includeLocalPlayer
													,INT friendStartIndex = 0
													,INT maxNumFriends    = 50) = "0x918b101666f9cb83"

/// PURPOSE:
///    Starts a leaderboard read by row.
/// PARAMS:
///    in_lbData - Leaderboard info for the read.
///    lbGamerHandleData - Gamer Handles to be read.
///    nGamerHandles - Number of Gamer Handles
///    pArray_LBClanIds - List of Clan ID's being read and ranked (Supply this when reading LEADERBOARD2_TYPE_CLAN)
///    nClanIds - Number of clan ids.
///    pArray_LBGroups - List of Groups being read and ranked (Supply this when reading RL_LEADERBOARD2_TYPE_GROUP)
///    numGroups - Number of Group ids.
/// RETURNS:
///    TRUE is the operation is started sucessfully.
NATIVE FUNC BOOL LEADERBOARDS2_READ_BY_ROW(Leaderboard2ReadData& in_lbData
											,GAMER_HANDLE& lbGamerHandleData[], INT nGamerHandles
											,LeaderboardClanIds& pArray_LBClanIds[], INT nClanIds
											,Leaderboard2GroupHandle& pArray_LBGroups[], INT numGroups) = "0xa9cdb1e3f0a49883"

/// PURPOSE:
///    Read a leaderboard from a Gamer.
/// PARAMS:
///    in_lbData - Leaderboard info for the read.
///    handleData - Gamer handle.
/// RETURNS:
///    TRUE is the operation is started sucessfully.
NATIVE FUNC BOOL LEADERBOARDS2_READ_BY_HANDLE(Leaderboard2ReadData& in_lbData, GAMER_HANDLE& handleData) = "0xb3fde7b4cab1c054"

/// PURPOSE:
///    Start a read Operation by Rank.
/// PARAMS:
///    in_lbData - Leaderboard info for the read.
///    rankStart - must be >= 1
///    numRows - Total number of rows.
/// RETURNS:
///    TRUE is the operation is started sucessfully.
NATIVE FUNC BOOL LEADERBOARDS2_READ_BY_RANK(Leaderboard2ReadData& in_lbData, INT rankStart, INT numRows) = "0xda3444de6c78d480"

/// PURPOSE:
///    Start a read Operation by Radius.
/// PARAMS:
///    in_lbData - Leaderboard info for the read.
///    radius - must be >= 1
///    pivotGamerHandle - Gamer Handle of the player being used as pivot.
/// RETURNS:
///    TRUE is the operation is started sucessfully.
NATIVE FUNC BOOL LEADERBOARDS2_READ_BY_RADIUS(Leaderboard2ReadData& in_lbData, INT radius, GAMER_HANDLE& pivotGamerHandle) = "0x0afcb24deebbd31a"

/// PURPOSE:
///    Reads leaderboard rows around a "pivot" score.  The score is
///    compared against the ranking column of the leaderboard.
/// PARAMS:
///    in_lbData - Leaderboard info for the read.
///    pivotScore - score that is used as pivot to read MAX numRows.
///    numRows - Total number of rows.
/// RETURNS:
///    TRUE is the operation is started sucessfully.
NATIVE FUNC BOOL LEADERBOARDS2_READ_BY_SCORE_INT(Leaderboard2ReadData& in_lbData, INT pivotScore, INT numRows) = "0xace795925470090f"

/// PURPOSE:
///    Reads leaderboard rows around a "pivot" score.  The score is
///    compared against the ranking column of the leaderboard.
/// PARAMS:
///    in_lbData - Leaderboard info for the read.
///    pivotScore - score that is used as pivot to read MAX numRows.
///    numRows - Total number of rows.
/// RETURNS:
///    TRUE is the operation is started sucessfully.
NATIVE FUNC BOOL LEADERBOARDS2_READ_BY_SCORE_FLOAT(Leaderboard2ReadData& in_lbData, FLOAT pivotScore, INT numRows) = "0x493e419f7eeb0a5a"

/// PURPOSE:
///    Can be used for Local player rank prediction and conjugate 2 rows in_original & in_from_match into out_predicted
/// PARAMS:
/// RETURNS:
///    TRUE is the operation is started sucessfully.
NATIVE FUNC BOOL LEADERBOARDS2_READ_RANK_PREDICTION(LeaderboardPredictionRow& in_original, LeaderboardPredictionRow& in_from_match, LeaderboardPredictionRow& out_predicted) = "0x45b097c5e2959673"

/// PURPOSE:
///    Starts a leaderboard READ Operation for a certain platform.
/// PARAMS:
///    in_lbData       - Leaderboard info for the read.
///    gamerHandler    - specifies the gamer handler.
///    platform        - specifies the platform.
/// RETURNS:
///    TRUE is the operation is started sucessfully.
NATIVE FUNC BOOL LEADERBOARDS2_READ_BY_PLAFORM(Leaderboard2ReadData& in_lbData, STRING gamerHandler, STRING platform) = "0x94df71b0047c472b"

/// PURPOSE:
///    Get the data for the rows for the previously requested leaderboard.
NATIVE FUNC BOOL  LEADERBOARDS2_READ_GET_ROW_DATA_START(LeaderboardReadInfo& info) = "0x581496cff543462f"
NATIVE PROC       LEADERBOARDS2_READ_GET_ROW_DATA_END( ) = "0x6ccde78d9c553a24"
NATIVE FUNC BOOL  LEADERBOARDS2_READ_GET_ROW_DATA_INFO(INT rowIndex, LeaderboardRowData& lbReadData) = "0x1ea20d6fd50c44e7"
NATIVE FUNC INT   LEADERBOARDS2_READ_GET_ROW_DATA_INT(INT rowIndex, INT columnIndex) = "0x76c271030ac81113"
NATIVE FUNC FLOAT LEADERBOARDS2_READ_GET_ROW_DATA_FLOAT(INT rowIndex, INT columnIndex) = "0x015a67958e8477f3"

/// PURPOSE:
///    Update a leaderboard
/// PARAMS:
///    in_lbData - Leaderboard information after calling this command you should use the commands
///    to setup the column values - LEADERBOARDS_WRITE_ADD_COLUMN.
/// RETURNS:
///    
NATIVE FUNC BOOL LEADERBOARDS2_WRITE_DATA(LeaderboardUpdateData& in_lbData) = "0x4a42a2e45a8d2c8b"

/// PURPOSE:
///    Update a leaderboard for a given scevent type
/// PARAMS:
///    in_lbData - Leaderboard information after calling this command you should use the commands
///    to setup the column values - LEADERBOARDS_WRITE_ADD_COLUMN.
//	   eventType - The event type to check against.
/// RETURNS:
///    
NATIVE FUNC BOOL LEADERBOARDS2_WRITE_DATA_FOR_EVENT_TYPE(LeaderboardUpdateData& in_lbData, STRING eventType) = "0x40ceb23e136d8ea3"

/// PURPOSE:
///  Set a integer/float value in a column. Must be used after calling LEADERBOARDS2_WRITE_DATA.  
/// PARAMS:
///    fieldId - Field ID of the column being set.
NATIVE PROC LEADERBOARDS_WRITE_ADD_COLUMN(LEADERBOARD_INPUTS fieldId, INT ivalue, FLOAT fvalue) = "0x6d1a116f1b08fa08"
///    value_a - First 32 bits
///    value_b - Second 32 bits
NATIVE PROC LEADERBOARDS_WRITE_ADD_COLUMN_LONG(LEADERBOARD_INPUTS fieldId, INT value_a, INT value_b) = "0x05ccdfa8c7547aed"

/// PURPOSE:
///  Cache leaderboard display data.
/// PARAMS:
///    info - Row display data that should be cached.
///    id   - Leaderboard display data id created by script when the data was cached.
NATIVE FUNC BOOL LEADERBOARDS_CACHE_DATA_ROW(LeaderboardCachedDisplayData& info) = "0x513637d173b51a91"
NATIVE PROC LEADERBOARDS_CLEAR_CACHE_DATA() = "0x9231b11e90084508"
NATIVE PROC LEADERBOARDS_CLEAR_CACHE_DATA_ID(INT id) = "0x0c2cc1b63aa0b36c"
NATIVE FUNC BOOL LEADERBOARDS_GET_CACHE_EXISTS(INT id) = "0x8b36c5e1084b91ec"
NATIVE FUNC INT  LEADERBOARDS_GET_CACHE_TIME(INT id) = "0xcd72499771f7a0da"
NATIVE FUNC INT  LEADERBOARDS_GET_CACHE_NUMBER_OF_ROWS(INT id) = "0xe02ee9af4474e243"
NATIVE FUNC BOOL LEADERBOARDS_GET_CACHE_DATA_ROW(INT id, INT rowIndex, LeaderboardCachedDisplayData& info) = "0x8de5cbdb548619a2"

/// PURPOSE:  Community stats - start synch operation, check if the operation is pending and if the operation has succeeded.
NATIVE FUNC BOOL STAT_COMMUNITY_START_SYNCH() = "0xd17ba652ddceb594"
NATIVE FUNC BOOL STAT_COMMUNITY_SYNCH_IS_PENDING() = "0x20e53dd70de083d7"
NATIVE FUNC BOOL STAT_COMMUNITY_SYNCH_FAILED() = "0x03647b08aef903b4"
/// PURPOSE:  Retrieve the Community (Stock Market) stat history value with id keyHash and history depth equal to depth.
///           Maximum depth is 5.
NATIVE FUNC BOOL STAT_COMMUNITY_GET_HISTORY(STATSENUM keyHash, INT depth, float& returnData) = "0xb4455b84f602b40d"

/// PURPOSE: NATIVE HELPER FUNCTIONS TO MANIPULATE PACKED STATS.
NATIVE FUNC INT PACKED_STAT_GET_BOOL_STAT_INDEX(ENUM_TO_INT stat) = "0x31f134b0b91d099c"
NATIVE FUNC INT PACKED_STAT_GET_INT_STAT_INDEX(ENUM_TO_INT stat) = "0x4dd6546b33af95be"
NATIVE FUNC STATSENUM GET_PACKED_BOOL_STAT_KEY(ENUM_TO_INT stat, BOOL singlePlayer, BOOL isCharacater, INT char) = "0x27df3e7d400669bb"
NATIVE FUNC STATSENUM GET_PACKED_INT_STAT_KEY(ENUM_TO_INT stat, BOOL singlePlayer, BOOL isCharacater, INT char) = "0xf66585648257e5b9"
NATIVE FUNC STATSENUM GET_PACKED_TU_BOOL_STAT_KEY(ENUM_TO_INT stat, BOOL singlePlayer, BOOL isCharacater, INT char) = "0xe03cb2510772a1a6"
NATIVE FUNC STATSENUM GET_PACKED_TU_INT_STAT_KEY(ENUM_TO_INT stat, BOOL singlePlayer, BOOL isCharacater, INT char) = "0xc3fad245f85182fa"
NATIVE FUNC STATSENUM GET_PACKED_NG_BOOL_STAT_KEY(ENUM_TO_INT stat, BOOL singlePlayer, BOOL isCharacater, INT char, STRING baseKey) = "0x2da085b3addad1ac"
NATIVE FUNC STATSENUM GET_PACKED_NG_INT_STAT_KEY(ENUM_TO_INT stat, BOOL singlePlayer, BOOL isCharacater, INT char, STRING baseKey) = "0x246883873095b181"

/// PURPOSE: NEW NATIVE HELPER FUNCTIONS TO MANIPULATE PACKED STATS.
///          Only use 'overrideCharSlot' if you want to override using the current selected character. Make sure 
///          its a correct character index. 0 to 2 on SP and 0 to 1 on MP.
NATIVE FUNC BOOL GET_PACKED_STAT_BOOL_CODE(ENUM_TO_INT stat, INT overrideCharSlot = -1) = "0xda7ebfc49ae3f1b0"
NATIVE FUNC INT  GET_PACKED_STAT_INT_CODE(ENUM_TO_INT stat, INT overrideCharSlot = -1) = "0x0bc900a6fe73770c"
NATIVE PROC SET_PACKED_STAT_BOOL_CODE(ENUM_TO_INT stat, BOOL value, INT overrideCharSlot = -1) = "0xdb8a58aeaa67cd07"
NATIVE PROC SET_PACKED_STAT_INT_CODE(ENUM_TO_INT stat, INT value, INT overrideCharSlot = -1) = "0x1581503ae529cd2e"

/// PURPOSE:  Retrieve a bool value from a packed stat.
NATIVE FUNC BOOL STAT_GET_BOOL_MASKED(STATSENUM keyHash, INT bitField, INT playerIndex = -1) = "0xb0546d69db2298a1"
/// PURPOSE:  Set a bool value from a packed stat.
NATIVE FUNC BOOL STAT_SET_BOOL_MASKED(STATSENUM keyHash, BOOL Value, INT bitField, BOOL CoderReset = TRUE) = "0x77af9853b955948e"

#IF IS_DEBUG_BUILD
//INFO: Reset all single player stats.
NATIVE PROC STAT_RESET_ALL_SINGLE_PLAYER_STATS( ) = "0x7f5124fd1e387744"
#ENDIF	//	IS_DEBUG_BUILD

/// 
/// PURPOSE: Returns TRUE if the player has driven all vehicles.
NATIVE FUNC BOOL GET_PLAYER_HAS_DRIVEN_ALL_VEHICLES( ) = "0x820fa4066d63f3b3"

/// 
/// PURPOSE: Set a profile setting so that we know we already have done the post of all vehicles driven.
///           - Profile Setting is FACEBOOK_POSTED_ALL_VEHICLES_DRIVEN. 
///          Retrieve current value by using GET_PROFILE_SETTING( FACEBOOK_POSTED_ALL_VEHICLES_DRIVEN )
///          If value is == 1 then we already have set the post.
NATIVE PROC SET_HAS_POSTED_ALL_VEHICLES_DRIVEN( ) = "0x0786f84b30fe6f63"

/// PURPOSE: Call this when the player completes the Prologue so that they can't get into multiplayer until they've completed the Prologue once.
///				Once this flag has been set in the player's profile, they will be able to get into multiplayer from the Prologue. They could start a new game
///					and enter MP from the Prologue. Or they could delete all their savegames and enter MP when the game starts up.
NATIVE PROC SET_PROFILE_SETTING_PROLOGUE_COMPLETE() = "0x01d104274a911a48"

/// PURPOSE: Call this when the player completes the "Franklin 0 - Chop" mission in Single Player
///				This will be checked in Multiplayer (using GET_PROFILE_SETTING(SP_CHOP_MISSION_COMPLETE) ) to decide whether the player can transform into Chop when they eat the peyote plant in Franklin's yard.
NATIVE PROC SET_PROFILE_SETTING_SP_CHOP_MISSION_COMPLETE() = "0x909f07ee95db559d"

/// PURPOSE: Call this when the player is publishing a RACE in the creator. 
/// NOTES: Make sure the profile setting value is set on the real stat when we enter the 
///         mp game. And because the player can change console make sure we always use the highest value.
///        Make sure you use the command - GET_PROFILE_SETTING( MP_AWD_CREATOR_RACES_DONE ) - to get the 
///         current value before setting to set 'current+1'.
NATIVE PROC SET_PROFILE_SETTING_CREATOR_RACES_DONE(INT newValue) = "0x81c6ca52ca44a933"

/// PURPOSE: Call this when the player is publishing a DM in the creator. 
/// NOTES: Make sure the profile setting value is set on the real stat when we enter the 
///         mp game. And because the player can change console make sure we always use the highest value.
///        Make sure you use the command - GET_PROFILE_SETTING( MP_AWD_CREATOR_DM_DONE ) - to get the 
///         current value before setting to set 'current+1'.
NATIVE PROC SET_PROFILE_SETTING_CREATOR_DM_DONE(INT newValue) = "0x350624f9e8ab4d03"

/// PURPOSE: Call this when the player is publishing a CTF in the creator. 
/// NOTES: Make sure the profile setting value is set on the real stat when we enter the 
///         mp game. And because the player can change console make sure we always use the highest value.
///        Make sure you use the command - GET_PROFILE_SETTING( MP_AWD_CREATOR_CTF_DONE ) - to get the 
///         current value before setting to set 'current+1'.
NATIVE PROC SET_PROFILE_SETTING_CREATOR_CTF_DONE(INT newValue) = "0xaeb1481d52e85af9"

/// PURPOSE: Call this when the player needs to set a profile setting.
/// NOTES: Possible settings are - MP_CREATOR_RACES_SAVED, MP_CREATOR_DM_SAVED and MP_CREATOR_CTF_SAVED.
NATIVE PROC STAT_SET_PROFILE_SETTING_VALUE(PROFILE_SETTING setting, INT newValue) = "0x0141515577c9beb6"
/// PURPOSE: Call this when the character creator selects an outfit
NATIVE PROC STATS_CHARACTER_CREATION_OUTFIT_SELECTED(INT outfit) = "0xd18294dc119f435b"

/// PURPOSE: Call this when the player completes the character creation.
NATIVE PROC STATS_COMPLETED_CHARACTER_CREATION(INT char) = "0x129022c7ce97a9c6"

/// PURPOSE: Call to setup the current job activity started in Freemode. Set 0 to clear the value.
///    Use the command GET_PROFILE_SETTING( JOB_ACTIVITY_ID_CHAR0 ) to find out the current value.
NATIVE PROC SET_JOB_ACTIVITY_ID_STARTED( INT value, INT CHARACTER  ) = "0x3b6c41b60543c47e"

/// PURPOSE: Call to setup that the freemode prologue has been done. Set 0 to clear the value and 1 to set as done.
///    Use the command GET_PROFILE_SETTING( FREEMODE_PROLOGUE_COMPLETE_CHAR0 ) to find out the current value.
NATIVE PROC SET_FREEMODE_PROLOGUE_DONE( INT value, INT CHARACTER ) = "0xb625f19076319e9c"

/// PURPOSE: Call this command to set the FREEMODE_STRAND_PROGRESSION_STATUS for one of the characters.
///	   This command can only be called with the first parameter set to either FREEMODE_STRAND_PROGRESSION_STATUS_CHAR0 or FREEMODE_STRAND_PROGRESSION_STATUS_CHAR1
///    To get the current value, call the command GET_PROFILE_SETTING with FREEMODE_STRAND_PROGRESSION_STATUS_CHAR0 or _CHAR1
NATIVE PROC SET_FREEMODE_STRAND_PROGRESSION_STATUS(PROFILE_SETTING setting, INT newValue) = "0x79d310a861697cc9"

/// PURPOSE:
///    Increments the stat with the new value when the player commits suicide in the network game.
/// PARAMS:
///    keyHash - stat id.
///    value - 
NATIVE PROC STAT_NETWORK_INCREMENT_ON_SUICIDE(STATSENUM keyHash, FLOAT value) = "0x4ec5e38b70b5ac89"

/// PURPOSE:
///    Set TRUE that a cheat is active - must be called every frame for certain cheats. Rest periode is 2s after that value is reset back to FALSE.
NATIVE PROC STAT_SET_CHEAT_IS_ACTIVE( ) = "0xada020ed8ed3a5cd"

/// PURPOSE:  Set the value of a License Plate. Max number of characters is 8.
NATIVE FUNC BOOL STAT_SET_LICENSE_PLATE( STATSENUM keyHash, STRING licensePlate ) = "0xce9b2b59b53a67c6"

/// PURPOSE:  Get the value of a License Plate.
NATIVE FUNC STRING STAT_GET_LICENSE_PLATE( STATSENUM keyHash ) = "0x378cf7462fea8a28"

/// PURPOSE:  Clear status from check migrate and migration. please make sure there are no pending operations.
NATIVE PROC STAT_MIGRATE_CLEAR_FOR_RESTART( ) = "0x9f6c9aeb9171f802"

//Status for the migrate save operations.
ENUM MIGRATE_SAVE
      MIGRATE_SAVE_NONE = 0

      //The source account is currently in-use, must log out in order to transfer it.
	  ,MIGRATE_SAVE_FAILED_SOURCE_IN_USE = 1

	  //The source account has already been transferred elsewhere.
	  ,MIGRATE_SAVE_FAILED_ALREADY_DONE = 2

	  //The source account is in the process of being transferred elsewhere.
	  ,MIGRATE_SAVE_FAILED_IN_PROGRESS = 3

	  //(ConsumeContentUnlock) The source account has already been used to unlock this content for another account.
      ,MIGRATE_SAVE_FAILED_UNLOCK_ALREADY_USED = 4

      //The account does not have sufficient privileges to migrate.
      ,MIGRATE_SAVE_FAILED_INSUFFICIENT_PRIVILEGES = 5

      //Can not transfer due to being flagged as a cheater.
      ,MIGRATE_SAVE_FAILED_CHEATER = 6

      //Can not transfer due to the account being banned.
      ,MIGRATE_SAVE_FAILED_BANNED = 7

      //Transfers are currently disabled for maintenance.
      ,MIGRATE_SAVE_FAILED_MAINTENANCE = 8

      //Transfer not allowed due to account being created after a certain date.
      ,MIGRATE_SAVE_FAILED_ACCT_CREATION_DATE = 9

      //Transfer not allowed due to account not being old enough.
      ,MIGRATE_SAVE_FAILED_ACCT_AGE = 10

      //Dest account has already been transferred to
      ,MIGRATE_SAVE_ERROR_DEST_ALREADY_DONE = 11

	  //Source account isn't eligible for transfer because cash balances are too high
      ,MIGRATE_SAVE_ERROR_TOO_RICH = 12

	  //End of errors 
      ,MIGRATE_SAVE_PENDING
      ,MIGRATE_SAVE_FINISHED

	  //Catch all error
      ,MIGRATE_SAVE_FAILED

ENDENUM
/// PURPOSE:  Migrate savegames from previous generation console.
/// PARAMS:
///    sourcePlatform - Must be "ps3" or "xbox360".
NATIVE FUNC BOOL STAT_MIGRATE_SAVEGAME_START( STRING sourcePlatform ) = "0x23bf533940118020"
NATIVE FUNC MIGRATE_SAVE STAT_MIGRATE_SAVEGAME_GET_STATUS(  ) = "0x0460a834bafd552a"


//Save migration available platforms.
ENUM MIGRATION_PLATFORM
	PLATFORM_XBOX360,
	PLATFORM_XBOXONE,
	PLATFORM_PS3,
	PLATFORM_PS4,
	PLATFORM_PC,
	PLATFORM_MAX
ENDENUM

//Save migration error codes.
ENUM MIGRATION_STATUS
	MIGRATION_STATUS_NONE, 
	MIGRATION_STATUS_AVAILABLE, 
	MIGRATION_STATUS_RUNNING,
	MIGRATION_STATUS_FAILED,
	MIGRATION_STATUS_ERROR_ALREADY_DONE,
	MIGRATION_STATUS_ERROR_NOT_AVAILABLE
ENDENUM

//Task status codes
ENUM TASK_NET_STATUS
        NET_STATUS_NONE,
        NET_STATUS_PENDING,
        NET_STATUS_FAILED,
        NET_STATUS_SUCCEEDED,
        NET_STATUS_CANCELED
ENDENUM


//Save migration error codes.
ENUM MIGRATION_RESULT_CODES
	MIGRATION_NONE, //This means its available
	MIGRATION_ALREADY_DONE,
	MIGRATION_NOT_AVAILABLE
ENDENUM

//PURPOSE: Structure to retrieve available saves for migration.
STRUCT STRUCT_AVAILABLE_SAVE_DATA
    FLOAT          m_totalProgressMadeInSp
	INT            m_numberOfChars
	INT            m_lastchar
    TEXT_LABEL_63  m_gamerName
    TEXT_LABEL_63  m_gamerHandle
    TEXT_LABEL_63  m_pvc
    TEXT_LABEL_63  m_evc
    TEXT_LABEL_63  m_bank
    TEXT_LABEL_63  m_wallet[2]
	INT            m_xp[2]
	INT            m_isactive[2]
ENDSTRUCT

NATIVE FUNC BOOL STAT_MIGRATE_CHECK_ALREADY_DONE( ) = "0x07c58cf1382442d7"
NATIVE FUNC BOOL STAT_MIGRATE_CHECK_START( ) = "0xa1088d3ed018d225"
NATIVE FUNC MIGRATION_RESULT_CODES STAT_MIGRATE_CHECK_GET_IS_PLATFORM_AVAILABLE( MIGRATION_PLATFORM platform ) = "0xe448cc16212f2c77"
NATIVE FUNC MIGRATION_STATUS STAT_MIGRATE_CHECK_GET_PLATFORM_STATUS( MIGRATION_PLATFORM platform, STRUCT_AVAILABLE_SAVE_DATA& data ) = "0xf2c5a32ea175f6f2"

/// PURPOSE:  Returns TRUE if the player has played GTAV Single Player.
/// 
NATIVE FUNC BOOL STAT_GET_PLAYER_HAS_PLAYED_SP_LAST_GEN(  ) = "0x7a21ae6231f791ce"

//PURPOSE
//  Used to determine if the user should be allowed to enter into MP or start save migration
//
//    Save migration status flow:
//    1.   Call GetSaveMigrationStatus
//       a.   If a migration is still pending, this will return it, otherwise it returns the most recently completed/failed migration
//    2.   If transaction status is pending, block entry to MP/save migration
//    3.   If transaction status is failed:
//       a.   Check if this transaction has not already been stored locally
//         i.   If not,  show some kind of error message, and then store the transaction locally to prevent showing it again
//       b.   Regardless allow the user to continue into MP/save migration
//    4.   If transaction status is succeeded:
//       a.   Check if this transaction has not already been stored locally
//         i.   If not, do whatever handling we do when the user completes a save migration (e.g. reset local timestamps)
//    5.   If there�s no transaction status:
//       a.   I.e. they�ve never migrated a save
//       b.   Allow the user to continue into MP/save migration flow
//    6.   If there�s an error, block entry to MP/save migration
//
//RETURNS 
//   Returns true if the migration status has been started sucessfully.
//NOTES
//   You must have this before using this command - ARE_PROFILE_SETTINGS_VALID( ) and NETWORK_IS_SIGNED_ONLINE()
//
NATIVE FUNC BOOL STAT_SAVE_MIGRATION_STATUS_START( ) = "0x748942af1e12a63c"

//Save migration error codes.
ENUM SAVE_MIGRATION_STATUS

	//This means we can start a check.
	SMS_NONE,
	SMS_FAILED,
	SMS_CANCELED,
	SMS_SUCCEDDED,

	//This means it is currently in progress.
	SMS_PENDING,

	//This means this account already has been used in a 
	//  save migration and we saved that info in the profile settings. Account is locked from further migrations 
	//  so no need to check it anymore.
	SMS_SKIP_ACCOUNT_ALREADY_USED,

	//This means there is an issue and the game is asserting (either not online of profile settings are not valid)
	SMS_SKIP_INVALID_STATUS

ENDENUM

//PURPOSE: Structure to retrieve available saves for migration.
STRUCT STRUCT_SAVE_MIGRATION_STATUS
    BOOL           m_InProgress
    TEXT_LABEL_63  m_State
	INT            m_TransactionId
ENDSTRUCT

//PURPOSE
//   Check the status of STAT_SAVE_MIGRATION_STATUS_START(). We need to call this 1st to make sure the game is not returning 
//    SMS_SKIP_ACCOUNT_ALREADY_USED which means we dont need to call STAT_SAVE_MIGRATION_STATUS_START( ). Also the tunable
//    check to skip STAT_SAVE_MIGRATION_STATUS_START( ) must be added at this point.
//
//NOTES
//   You must have this before using this command - ARE_PROFILE_SETTINGS_VALID( ) and NETWORK_IS_SIGNED_ONLINE()
//
NATIVE FUNC SAVE_MIGRATION_STATUS STAT_GET_SAVE_MIGRATION_STATUS( STRUCT_SAVE_MIGRATION_STATUS& data ) = "0x08eae21f06c7a7b5"

//PURPOSE
//   Cancel a save migration that has pending for too long. This can only be done after STAT_GET_SAVE_MIGRATION_STATUS is SMS_SUCCEDDED
//    because I will be checking that data.
//
//NOTES
//   - Call STAT_SAVE_MIGRATION_STATUS_START and make sure is succedds.
//   - Check the pending Migration in progress.
//
NATIVE FUNC BOOL STAT_SAVE_MIGRATION_CANCEL_PENDING_OPERATION( ) = "0xb9565218052f429f"

//Cancel Save migration error codes.
ENUM CANCEL_SAVE_MIGRATION_STATUS
	CSMS_NONE,
	CSMS_PENDING,
	CSMS_FAILED,
	CSMS_SUCCEDDED,
	CSMS_CANCELED 
ENDENUM

//PURPOSE
//   Get status for STAT_SAVE_MIGRATION_CANCEL_PENDING_OPERATION.
//
NATIVE FUNC CANCEL_SAVE_MIGRATION_STATUS STAT_GET_CANCEL_SAVE_MIGRATION_STATUS( ) = "0xf8f7ccdaadfec4a1"


//PURPOSE
//   Call this to make sure that this account is entitled to consume a certain content id.
//   JobLTSRoundInfo
//   Again, this does nothing to check if the user should have access to the content, it is 
//     only to enforce uniqueness that only one given player can unlock a specific piece of content 
//     from a given cg account. So we should still be using the cross-platform leaderboard/profile 
//      stats reads to determine if a player should have CGtoNG content unlocked.
//   
//   For the player having played last Gen if the command is returning TRUE please use this to make sure 
//     he is entitled to that.
//
//NOTES
//
//   - contentId: You can use whatever contentId you want, as long as we're consistent.
//         The server doesn't care what the contentId is it just uses it to track the status separately 
//           per piece of content if there is more than one.
//         - Special Edition content please use the string hash of the content.
//         - For having played last gen just use the hash of "played_last_gen".
//
NATIVE FUNC BOOL STAT_SAVE_MIGRATION_CONSUME_CONTENT(INT contentId, STRING sourcePlatform, STRING srcGamerHandle) = "0xc8f2a29ebfc11d15"

//Status for the migrate save operations.
ENUM COMSUME_CONTENT_ERROR_CODE
        ERROR_UNKNOWN = -1,
        ERROR_NONE = 0,
        //(ConsumeContentUnlock) The source account has already been used to unlock this content for another account
        ERROR_UNLOCK_ALREADY_USED = 4
ENDENUM

//PURPOSE
//   Get status for STAT_SAVE_MIGRATION_CONSUME_CONTENT.
//
NATIVE FUNC TASK_NET_STATUS STAT_GET_SAVE_MIGRATION_CONSUME_CONTENT_STATUS( COMSUME_CONTENT_ERROR_CODE& errorCode ) = "0x0b20b5d4d87c4382"

//PURPOSE
//   Enable the tracking of the stats after it has been disabled
//
//NOTES
//   Does nothing if already enabled
//
NATIVE PROC STAT_ENABLE_STATS_TRACKING( ) = "0x59574790c15de236"


//PURPOSE
//   Disable the tracking of the stats.
//   This is useful when in some mission we have a particular situation that could mess with the stats, ex : B*1955817
//
//NOTES
//   Does nothing if already disabled
//
NATIVE PROC STAT_DISABLE_STATS_TRACKING( ) = "0xbe6819d99223c1f8"


//PURPOSE
//   Whether or not the tracking of the stats is enabled
//
//NOTES
//   - 
//
NATIVE FUNC BOOL STAT_IS_STATS_TRACKING_ENABLED( ) = "0x2cef7a2968af81aa"


// Policy for the recording of the stats using the commands below.
ENUM RECORD_STAT_POLICY
        RSP_SUM = 1, 
		RSP_GREATEST = 2,
		RSP_LOWEST = 3
ENDENUM


// Policy for the recording of the stats using the commands below.
ENUM RECORD_STAT
	REC_STAT_NONE,
	REC_STAT_LONGEST_WHEELIE_DIST,
	REC_STAT_LONGEST_STOPPIE_DIST,
	REC_STAT_LONGEST_DRIVE_NOCRASH,
	REC_STAT_TOP_SPEED_CAR,
	REC_STAT_MOST_FLIPS_IN_ONE_JUMP,
	REC_STAT_MOST_SPINS_IN_ONE_JUMP,
	REC_STAT_HIGHEST_JUMP_REACHED,
	REC_STAT_FARTHEST_JUMP_DIST,
	REC_STAT_NUMBER_NEAR_MISS_NOCRASH,
	REC_STAT_LONGEST_SURVIVED_FREEFALL,
	REC_STAT_LOWEST_PARACHUTE_OPEN,
	REC_STAT_DIST_DRIVING_CAR_REVERSE,
	REC_STAT_LONGEST_SURVIVED_SKYDIVE,
	REC_STAT_NUMBER_STOLEN_VEHICLE,
	REC_STAT_PLAYERS_SET_ON_FIRE,
	REC_STAT_ON_FOOT_ALTITUDE,
	REC_STAT_FLIGHT_TIME_BELOW_20,
	REC_STAT_FLIGHT_DIST_BELOW_20,
	REC_STAT_FLIGHT_TIME_BELOW_100,
	REC_STAT_FLIGHT_DIST_BELOW_100,
	REC_STAT_PLANE_BARREL_ROLLS,
	REC_STAT_MELEE_KILLED_PLAYERS,
	REC_STAT_SNIPER_KILL_DISTANCE,
	REC_STAT_SNIPER_KILL,
	REC_STAT_DB_NON_TURRET_PLAYER_KILLS,
	REC_STAT_PLAYER_HEADSHOTS,
	REC_STAT_DIST_BAILING_FROM_VEHICLE,
	REC_STAT_PLAYER_VEHICLE_DAMAGES,
	REC_STAT_NEAR_MISS_PRECISE,
	REC_STAT_DIST_BEACHING_BOAT,
	REC_STAT_DIST_WALLRIDE
ENDENUM

//PURPOSE
//   Start recording a stat until stop is called.
//
//NOTES
//   See enum above for the stats that are supported
//
NATIVE FUNC BOOL STAT_START_RECORD_STAT(RECORD_STAT stat, RECORD_STAT_POLICY policy) = "0x1ccfe7df655ac498"

//PURPOSE
//   Stop recording a stat started with the above command.
//
//NOTES
//   -
//
NATIVE FUNC BOOL STAT_STOP_RECORD_STAT() = "0x2ac5dd7077138d6d"

//PURPOSE
//   Get the recorded stat value
//
//NOTES
//   This can be called at anytime. Will retrieve the last recorded value after a stop, or the current value while recording.
//   If no value has been recorded, returns false and the value is unchanged.
//
NATIVE FUNC BOOL STAT_GET_RECORDED_VALUE(FLOAT& value) = "0xd1b34bb9f529fc07"

//PURPOSE
//   Check if we're already recording a stat
//
NATIVE FUNC BOOL STAT_IS_RECORDING_STAT() = "0xca66ea7984aab667"


//PURPOSE
//   Get the current value of the near miss without crash counter
//
//NOTES
//   Warning, this is used for challenges and the value can be forced to restart at 0 by calling the reset command below.
//
NATIVE FUNC INT STAT_GET_CURRENT_NEAR_MISS_NOCRASH() = "0x29640d345d607667"

//PURPOSE
//   Get the current value of the near miss without crash counter more precisely
//
//NOTES
//   Warning, this is used for challenges
//
NATIVE FUNC INT STAT_GET_CURRENT_NEAR_MISS_NOCRASH_PRECISE() = "0xa6b44a0401bc7bdc"


//PURPOSE
//   Reset the current value of the near miss without crash counter
//
//NOTES
//   This is used when a challenge starts to get rid of the previous value
//
NATIVE PROC STAT_RESET_CURRENT_NEAR_MISS_NOCRASH() = "0xed41ff02b5bb53b9"

//PURPOSE
//   Get the current value of the rear wheel distance
NATIVE FUNC FLOAT STAT_GET_CURRENT_REAR_WHEEL_DISTANCE() = "0xe073c52bda52fad1"

//PURPOSE
//   Get the current value of the front wheel distance
NATIVE FUNC FLOAT STAT_GET_CURRENT_FRONT_WHEEL_DISTANCE() = "0x23ccd14221a67576"

//PURPOSE
//   Get the current value of the jump distance
NATIVE FUNC FLOAT STAT_GET_CURRENT_JUMP_DISTANCE() = "0x99172e9326fb9464"

//PURPOSE
//   Get the current value of the jump height
NATIVE FUNC FLOAT STAT_GET_LAST_JUMP_HEIGHT() = "0x0f5d7211074d2254"

//PURPOSE
//   Get the current speed
NATIVE FUNC FLOAT STAT_GET_CURRENT_SPEED() = "0xd6a1e19478669f13"

//PURPOSE
//   Get the current value of flips 
NATIVE FUNC INT STAT_GET_CURRENT_FLIPS() = "0xb121f715c649d300"

//PURPOSE
//   Get the current value of spins 
NATIVE FUNC INT STAT_GET_CURRENT_SPINS() = "0xf41d98f7f772007d"

//PURPOSE
//   Get the current distance driven in reverse
NATIVE FUNC FLOAT STAT_GET_CURRENT_DRIVING_REVERSE_DISTANCE() = "0xed08fd0b61f59a38"

//PURPOSE
//   Get the current skydiving distance
NATIVE FUNC FLOAT STAT_GET_CURRENT_SKYDIVING_DISTANCE() = "0x6a91ed71437a1f2c"

//PURPOSE
//   Get the current altitude reached by foot
NATIVE FUNC FLOAT STAT_GET_CURRENT_FOOT_ALTITUDE() = "0xbc861984fe512128"

//PURPOSE
//   Get the current value of the drive without crashing distance
NATIVE FUNC FLOAT STAT_GET_CURRENT_DRIVE_NOCRASH_DISTANCE() = "0xe15f1878b9b5545d"

//PURPOSE
//   Get the current time spent flying under 20m or 100m on the back depending on the active challenge
NATIVE FUNC FLOAT STAT_GET_CHALLENGE_FLYING_TIME() = "0x9b1a199d1cc1db47"

//PURPOSE
//   Get the current distance spent flying under 20m or 100m on the back depending on the active challenge
NATIVE FUNC FLOAT STAT_GET_CHALLENGE_FLYING_DIST() = "0xb099946873170472"

//PURPOSE
//   Get the current flying altitude
NATIVE FUNC BOOL STAT_GET_FLYING_ALTITUDE(FLOAT& value) = "0x9c6a175f9509b94d"

//PURPOSE
//   Get the current flying altitude
NATIVE FUNC BOOL STAT_IS_PLAYER_VEHICLE_ABOVE_OCEAN() = "0x79a47b0799590d3d"

//PURPOSE
//   Get the current spin count in plane
NATIVE FUNC FLOAT STAT_GET_PLANE_BARREL_ROLL_COUNT() = "0x1b44c51cab97394d"

//PURPOSE
//   Get the last bail out of vehicle distance
NATIVE FUNC FLOAT STAT_GET_VEHICLE_BAIL_DISTANCE() = "0x1c976e6e8b56d553"

//PURPOSE
//   Get the current freefall altitude
NATIVE FUNC FLOAT STAT_GET_CURRENT_FREEFALL_ALTITUDE() = "0xe8cca30684d34472"

//PURPOSE
//   Get the current freefall altitude
NATIVE FUNC FLOAT STAT_GET_LAST_PLAYERS_VEHICLES_DAMAGES() = "0x283eb1893abba49d"

//PURPOSE
//   Get the current freefall altitude
NATIVE FUNC FLOAT STAT_GET_CURRENT_DISTANCE_BEACHING_BOAT() = "0xfc4e94a9e1cd22db"

//PURPOSE
// Returns the current distance wallriding
NATIVE FUNC FLOAT STAT_GET_CURRENT_WALLRIDE_DISTANCE() = "0xa340eed499d7a1a5"

//PURPOSE
//   Must be called when the game needs to be rollback from a successfull migration.
//
//NOTES
//   - Make sure the transaction id matches the SAVE_MIGRATION_TRANSACTION_ID otherwise it means the 
//      current state "RolledBack" was already dealt with. Local player must be online and the profile
//      settings must be valid as well.
//
NATIVE FUNC BOOL STAT_ROLLBACK_SAVE_MIGRATION( ) = "0x13f9b097d05090e4"

//PURPOSE
//   Set/Unset value for profile setting GAMER_HAS_SPECIALEDITION_CONTENT.
NATIVE PROC SET_HAS_SPECIALEDITION_CONTENT( INT value ) = "0x212eddd868f364b5"

//PURPOSE
//   Set/Unset value for profile setting SAVE_MIGRATION_TRANSACTION_ID_WARNING.
NATIVE PROC SET_SAVE_MIGRATION_TRANSACTION_ID_WARNING( INT value ) = "0x38c0996ec9115333"

//PURPOSE
//   Retrieve the local boss goon UUID.
NATIVE PROC GET_BOSS_GOON_UUID( INT characterSlot, INT& valueA, INT& valueB ) = "0x77ba8a25e71029a6"

//PURPOSE
//  DEPRECATED ! Clear the local boss goon UUID.
NATIVE PROC CLEAR_BOSS_GOON_UUID( ) = "0x2d6c553aff8bdf96"

//PURPOSE
// Start being a boss
NATIVE PROC START_BEING_BOSS(INT version = 1) = "0xcc2c5d5d493f83c6"



///PURPOSE
///  Type of invite when started being a Goon
ENUM GOON_INVITE_TYPE
	GIT_DEBUG,
	GIT_NEARBY,
	GIT_FRIENDS,
	GIT_CREW,
	GIT_INDIVIDUAL,
	GIT_LOOKING_FOR_WORK
ENDENUM

//PURPOSE
// Start being a goon
NATIVE PROC START_BEING_GOON(INT bossId1, INT bossId2, GOON_INVITE_TYPE inviteMode) = "0xbdcc3d18a955cf5e"

//PURPOSE
// Ends being a boss
NATIVE PROC END_BEING_BOSS(INT m_endingReason, INT time) = "0xb9ec19c8ab4c6a90"

//PURPOSE
// Ends being a goon
NATIVE PROC END_BEING_GOON(INT bossId1, INT bossId2, INT m_endingReason, INT rpBonus, INT time = 0) = "0x53c6816dab686bad"


//PURPOSE
// When hired a Limo as Boss or Goon
NATIVE PROC HIRED_LIMO(INT bossId1, INT bossId2) = "0xa3fef02369d04d74"

//PURPOSE
// When a Goon, players can order in any of thier Boss's personal vehicles for free at any time.
NATIVE PROC ORDER_BOSS_VEHICLE(INT bossId1, INT bossId2, INT vehicleId) = "0xfc0f1f89410e78ca"

//PURPOSE
// When Changing Uniform
NATIVE PROC CHANGE_UNIFORM(INT bossId1, INT bossId2, INT uniform) = "0x920f8e60c962fbfd"

//PURPOSE
// When switching "Looking for work" in the Boss and Goons settings
NATIVE PROC CHANGE_GOON_LOOKING_FOR_WORK(BOOL value) = "0x2e47f7ca5ba96254"

//PURPOSE
// Metric sent when "ghosting to player" is activated
NATIVE PROC SEND_METRIC_GHOSTING_TO_PLAYER(GAMER_HANDLE& hGamer) = "0x8717e4a42c91b477"



//PURPOSE
// Returns the id of the last successful stunt jump for this session even if it has been completed already.
NATIVE FUNC INT GET_LAST_STUNTJUMP_ID() = "0x8e16a719fdd45bd5"

//PURPOSE
// Metric sent when poaching a vip/bodyguard. BossId is the poached player bossId. isVip is whether or not the poached player is a Vip (if not, he's a bodyguard)
NATIVE PROC SEND_METRIC_VIP_POACH(INT bossId1, INT bossId2, BOOL isVip) = "0x129634c27b11e46a"

// PURPOSE
// After a Contraband mission, call this command for each goon. 1 means punished, 0 means not punished
NATIVE PROC SEND_METRIC_PUNISH_BODYGUARD(INT value) = "0xb749f9c25cc70c69"



ENUM TrackedStuntType
    ST_FRONTFLIP,
    ST_BACKFLIP,
    ST_SPIN,
    ST_WHEELIE,
    ST_STOPPIE,
    ST_BOWLING_PIN,
    ST_FOOTBALL,
    ST_ROLL
ENDENUM

// PURPOSE
// Enables stunt events to be sent
NATIVE PROC PLAYSTATS_START_TRACKING_STUNTS() = "0x18345c8b764a8920"

// PURPOSE
// Disable stunt events
NATIVE PROC PLAYSTATS_STOP_TRACKING_STUNTS() = "0xa3662e8735ccb6bf"

// PURPOSE
// Track average time per session in seconds
NATIVE PROC STAT_TRACK_AVERAGE_TIME_PER_SESSION() = "0x13d60a1dcdcc4a23"

// PURPOSE
//   Struct for ending missions:
//      1. Club work
//      2. Club challenges
//      3. Member challenges
//      4. Clubhouse missions
//      5. Business missions
//
//   m_missionTypeId - Make sure you set the values 1 to 5, see above.
//   m_bossId1 and m_bossId2 - this is like in contraband missions.
///  isBoss - this is set code side.
//   Set -1 for BLANK values.
// 
STRUCT STRUCT_MISSION_END

	////////////////////////////////////////
	//
	//   These values must be set on all missions.
	//
	////////////////////////////////////////

	INT m_missionId
	INT m_missionTypeId
	INT m_matchId1
	INT m_matchId2
	INT m_bossId1
	INT m_bossId2
	INT m_starterBossId1
	INT m_starterBossId2

	////////////////////////////////////////
	//
	//   Check the mission you are doing and make sure you set the correct values - make sure you 
	//   leave at -1 values that will be excluded from the metric submission.
	//
	////////////////////////////////////////

	INT m_PlayerParticipated         = -1 // Serialized in the metric name'MISSION_ENDED' as "a"
	INT m_TimeStart                  = -1 // Serialized in the metric name'MISSION_ENDED' as "b"
	INT m_TimeEnd                    = -1 // Serialized in the metric name'MISSION_ENDED' as "c"
	INT m_Won                        = -1 // Serialized in the metric name'MISSION_ENDED' as "d"
	INT m_EndingReason               = -1 // Serialized in the metric name'MISSION_ENDED' as "e"
	INT m_CashEarned                 = 0 // Serialized in the metric name'MISSION_ENDED' as "f"
	INT m_RpEarned                   = 0 // Serialized in the metric name'MISSION_ENDED' as "g"
	INT m_TargetsKilled              = -1 // Serialized in the metric name'MISSION_ENDED' as "h"
	INT m_InnocentsKilled            = -1 // Serialized in the metric name'MISSION_ENDED' as "i"
	INT m_Deaths                     = -1 // Serialized in the metric name'MISSION_ENDED' as "j"
	INT m_LauncherRank               = -1 // Serialized in the metric name'MISSION_ENDED' as "k"
	INT m_MCPointsEarnedFromWinning  = -1 // Serialized in the metric name'MISSION_ENDED' as "l"
	INT m_TimeTakenToComplete        = -1 // Serialized in the metric name'MISSION_ENDED' as "m"
	INT m_TimeTakenForObjective      = -1 // Serialized in the metric name'MISSION_ENDED' as "n"
	INT m_PropertyDamageValue        = -1 // Serialized in the metric name'MISSION_ENDED' as "o"
	INT m_LongestWheelieTime         = -1 // Serialized in the metric name'MISSION_ENDED' as "p"
	INT m_NumberOfCarsKicked         = -1 // Serialized in the metric name'MISSION_ENDED' as "q"
	INT m_PlayersLeftInProgress      = -1 // Serialized in the metric name'MISSION_ENDED' as "r"
	INT m_Location                   = -1 // Serialized in the metric name'MISSION_ENDED' as "s"
	INT m_InvitesSent                = -1 // Serialized in the metric name'MISSION_ENDED' as "t"
	INT m_InvitesAccepted            = -1 // Serialized in the metric name'MISSION_ENDED' as "u"
	INT m_BossKilled                 = -1 // Serialized in the metric name'MISSION_ENDED' as "v"
	INT m_GoonsKilled                = -1 // Serialized in the metric name'MISSION_ENDED' as "w"
	INT m_PackagesGathered           = -1 // Serialized in the metric name'MISSION_ENDED' as "x"
	INT m_FriendlyAiDeaths           = -1 // Serialized in the metric name'MISSION_ENDED' as "y"
	INT m_RaceToLocationLaunched     = -1 // Serialized in the metric name'MISSION_ENDED' as "z"
	INT m_CratesDestroyed            = -1 // Serialized in the metric name'MISSION_ENDED' as "ab"
	INT m_AIKilled                   = -1 // Serialized in the metric name'MISSION_ENDED' as "bb"
	INT m_AlliesSpawned              = -1 // Serialized in the metric name'MISSION_ENDED' as "cb"
	INT m_AlliesDroppedOff           = -1 // Serialized in the metric name'MISSION_ENDED' as "db"
	INT m_VansSpawned                = -1 // Serialized in the metric name'MISSION_ENDED' as "eb"
	INT m_VansDestroyed              = -1 // Serialized in the metric name'MISSION_ENDED' as "fb"
	INT m_TypeOfBusinesS             = -1 // Serialized in the metric name'MISSION_ENDED' as "gb"
	INT m_OtherBusinessOwned         = -1 // Serialized in the metric name'MISSION_ENDED' as "hb"
	INT m_StartVolume                = -1 // Serialized in the metric name'MISSION_ENDED' as "ib"
	INT m_EndVolume                  = -1 // Serialized in the metric name'MISSION_ENDED' as "jb"
	INT m_StartSupplyCapacity        = -1 // Serialized in the metric name'MISSION_ENDED' as "kb"
	INT m_EndSupplyCapacity          = -1 // Serialized in the metric name'MISSION_ENDED' as "lb"
	INT m_SuppliesDestroyed          = -1 // Serialized in the metric name'MISSION_ENDED' as "mb"
	INT m_SuppliesDelivered          = -1 // Serialized in the metric name'MISSION_ENDED' as "nb"
	INT m_IsMissionAfterFailedDefend = -1 // Serialized in the metric name'MISSION_ENDED' as "ob"
	INT m_CashSpentOnResupplies      = -1 // Serialized in the metric name'MISSION_ENDED' as "pb"
	INT m_ProductDestroyed           = -1 // Serialized in the metric name'MISSION_ENDED' as "qb"
	INT m_ProductDelivered           = -1 // Serialized in the metric name'MISSION_ENDED' as "rb"
	INT m_UpgradesOwned              = -1 // Serialized in the metric name'MISSION_ENDED' as "sb"
	INT m_FromHackerTruck            = -1 // Serialized in the metric name'MISSION_ENDED' as "tb"
	INT m_properties                 = 0  // Serialized in the metric name'MISSION_ENDED' as "ub"
	INT m_properties2                = 0  // Serialized in the metric name'MISSION_ENDED' as "vb"
ENDSTRUCT

// PURPOSE: Telemetry for missions - called at the end.
NATIVE PROC PLAYSTATS_MISSION_ENDED(STRUCT_MISSION_END& data) = "0x13832e7d597ddad5"



// PURPOSE
//   Struct for ending missions for import export
// 
STRUCT STRUCT_IMPEXP_MISSION_END

	////////////////////////////////////////
	//
	//   These values must be set on all missions.
	//
	////////////////////////////////////////

	INT m_missionId						//	bid – boss_id
	INT m_missionTypeId             	//	mid – match_id
	INT m_matchId1                  	//	isboss – player_role
	INT m_matchId2
	INT m_bossId1
	INT m_bossId2
	INT m_starterBossId1
	INT m_starterBossId2			

	////////////////////////////////////////
	//
	//   Check the mission you are doing and make sure you set the correct values - make sure you 
	//   leave at -1 values that will be excluded from the metric submission.
	//
	////////////////////////////////////////

	INT m_PlayerParticipated		= -1				//	a – player_participated
	INT m_TimeStart                 = -1                //	b – time_start
	INT m_TimeEnd                   = -1                //	c – time_end
	INT m_Won                       = -1                //	d – won
	INT m_EndingReason              = -1                //	e – ending_reason
	INT m_CashEarned                = 0                //	f – cash_earned
	INT m_RpEarned                  = 0                //	g – rp_earned
	INT m_TargetsKilled             = -1                //	h – targets_killed
	INT m_InnocentsKilled           = -1                //	i – Checkpoints Gathered
	INT m_Deaths                    = -1                //	j – deaths
	INT m_LauncherRank              = -1                //	k – launcher_rank
	INT m_TimeTakenToComplete       = -1                //	l – time_taken_to_complete
	INT m_PlayersLeftInProgress     = -1                //	m  – players_left_in_progress
	INT m_Location                  = -1                //	n  – Location
	INT m_InvitesSent               = -1                //	o  – invites_sent
	INT m_InvitesAccepted           = -1                //	p –  invites_accepted
	INT m_BossKilled                = -1                //	q – boss_killed
	INT m_GoonsKilled               = -1                //	r – goons_killed
	INT m_CrateAreasDestroyed       = -1                //	s - objects destroyed
	INT m_Vehicle                   = -1                //	u – vehicle
	INT m_VehicleStyle              = -1                //	v – vehicle_style
	INT m_VehicleHealth             = -1                //	w – vehicle_health
	INT m_VehiclePoached            = -1                //	x - vehicle poached? And method
	INT m_VehiclePoachedMethod      = -1                   
	INT m_Vehicle2                  = -1                 //	y - vehicle2
	INT m_Vehicle2Style             = -1                 //	z – vehicle2_style
	INT m_Vehicle2Health            = -1                 //	ab – vehicle2_health
	INT m_Vehicle2Poached           = -1                 //	bb - vehicle poached? And method
	INT m_Vehicle2PoachedMethod     = -1               
	INT m_Vehicle3       			= -1				 //	cb – vehicle3                          
	INT m_Vehicle3Style             = -1                 //	db – vehicle3_style
	INT m_Vehicle3Health            = -1                 //	eb – vehicle3_health
	INT m_Vehicle3Poached           = -1                 //	fb - vehicle poached? And method
	INT m_Vehicle3PoachedMethod     = -1                  
	INT m_Vehicle4      			= -1				 //	gb – vehicle4                              
	INT m_Vehicle4Style             = -1                //	hb – vehicle4_style
	INT m_Vehicle4Health            = -1                 //	ib – vehicle4_health
	INT m_Vehicle4Poached           = -1                
	INT m_Vehicle4PoachedMethod     = -1                    
	INT m_BuyerChosen          		= -1				 //	jb – buyer_chosen                         
	INT m_WasMissionCollection      = -1                 //	kb - Was mission "Collection"? And type    
	INT m_Collection1               = -1                 //	lb - Collection 1: Vehicles owned    
	INT m_Collection2               = -1                 //	mb - Collection 2: Vehicles owned    
	INT m_Collection3               = -1                 //	nb - Collection 3: Vehicles owned    
	INT m_Collection4               = -1                 //	ob - Collection 4: Vehicles owned    
	INT m_Collection5               = -1                 //	pb - Collection 5: Vehicles owned    
	INT m_Collection6               = -1                 //	qb - Collection 6: Vehicles owned    
	INT m_Collection7               = -1                 //	rb - Collection 7: Vehicles owned    
	INT m_Collection8               = -1                 //	sb - Collection 8: Vehicles owned    
	INT m_Collection9               = -1                 //	tb - Collection 9: Vehicles owned    
	INT m_Collection10              = -1                 //	ub - Collection 10: Vehicles owned    
	INT m_StartVolume               = -1                 //	vb – start_volume (cars in wareouse)
	INT m_EndVolume                 = -1                 //	wb – end_volume (cars in wareouse)
	INT m_MissionType             	= -1
	INT m_FromHackerTruck           = -1
ENDSTRUCT

// PURPOSE: Telemetry for missions - called at the end.
NATIVE PROC PLAYSTATS_IMPEXP_MISSION_ENDED(STRUCT_IMPEXP_MISSION_END& data) = "0x58e508b2cce30269"


//////////////////////////////////////////////////////////////////////////
// BIKERS TELEMETRY

// PURPOSE: Telemetry for a MC role change
NATIVE PROC PLAYSTATS_CHANGE_MC_ROLE(INT bossId1, INT bossId2, INT matchId1, INT matchId2, INT previousRole, INT newRole, INT mcPoint) = "0x61778c42b38c1c54"

// PURPOSE: Telemetry for changing MC outfit
NATIVE PROC PLAYSTATS_CHANGE_MC_OUTFIT(INT bossId1, INT bossId2, INT matchId1, INT matchId2, INT outfit) = "0x29e604852f212ac6"

// PURPOSE: Telemetry for switching MC emblem on/off
NATIVE PROC PLAYSTATS_SWITCH_MC_EMBLEM(INT bossId1, INT bossId2, INT matchId1, INT matchId2, INT emblem) = "0xd3e8a783e68f3e22"

// PURPOSE: Telemetry for requesting a MC vehicle
NATIVE PROC PLAYSTATS_MC_REQUEST_BIKE(INT bossId1, INT bossId2, INT matchId1, INT matchId2, INT vehicleHash) = "0x5828a425c266fc6f"

// PURPOSE: Telemetry for MC Members Abilities - RP from killing separated rival MC member
NATIVE PROC PLAYSTATS_MC_KILLED_RIVAL_MC_MEMBER(INT bossId1, INT bossId2, INT matchId1, INT matchId2, INT rpEarned) = "0x8695ebbd3140c524"

// PURPOSE: Telemetry for MC Members Abilities - Abandoning MC - 'Marked for Death'
NATIVE PROC PLAYSTATS_ABANDONED_MC(INT bossId1, INT bossId2, INT matchId1, INT matchId2, INT abandonedMc) = "0x82cba4a4eba2bc27"

// PURPOSE: Telemetry sent whenever players earns MC Points from a variety of methods
NATIVE PROC PLAYSTATS_EARNED_MC_POINTS(INT bossId1, INT bossId2, INT matchId1, INT matchId2, INT method, INT amount) = "0x32f2a84df86ecd0c"

// PURPOSE: Telemetry sent when formation ENDS
// formationStyle - formation Style 
// duration - how long formation lasted on the road
// membersAmount - Max number of MC members involved
NATIVE PROC PLAYSTATS_MC_FORMATION_ENDS(INT bossId1, INT bossId2, INT matchId1, INT matchId2, INT formationStyle, INT duration, INT membersAmount) = "0x80360c1d11b06af0"

// PURPOSE: Telemetry sent whenever any of the actvity events finishes (Darts, Arm Wrestling, Drinking, Smoking, Jukebox)
// If not a jukebox activity, jukeboxStation should be set to -1
NATIVE PROC PLAYSTATS_MC_CLUBHOUSE_ACTIVITY(INT bossId1, INT bossId2, INT matchId1, INT matchId2, INT minigameType, INT jukeboxStation, INT mcPointsEarned) = "0xb3f4e4027712226f"

// PURPOSE: Telemetry sent whenever  whenever a RIVAL player:
//  1. Steals another CEO's Import Export car and delivers it to thier CEO's warehouse
//  2. Steals another CEO's Import Export car and delivers it to the cops
//  3. Steals another CEO's Import Export car and delivers it to the scrapyard
NATIVE PROC PLAYSTATS_RIVAL_BEHAVIOR(INT bossId1, INT bossId2, INT matchId1, INT matchId2, INT deliveryDestination, INT cashEarned, INT rpEarned, INT vehicle, INT vehicleStyle, BOOL importMission) = "0x05e10ef660f1eaa5"

// PURPOSE: Telemetry sent whenever a new character enters GTAO for first time
// slotUsed - Character slot used (INT)
// copyOption - Did player reject the 'copy rank option (INT - "0" = YES, "1" = NO, "2” = Player did not have option).
// propertyAwarded - Property Awarded (INT - "0" to "4", one for each of the 5 options)
// characterInSlot - does player have existing character in the other slot? Y/N (BOOL)
// rank - rank of existing character in other slot (INT - send '8001' if player doesn't have an existing character)
// previousRank - if player deleted a character in order to start a new character in the same slot, what rank was that previous character (INT - send  '8001' if player did not have to delete a previous character) 
// totalTime - total playing time on deleted character slot (INT - send "0" if player did not have an existing character slot).  
NATIVE PROC PLAYSTATS_COPY_RANK_INTO_NEW_SLOT(INT slotUsed, INT copyOption, INT propertyAwarded, INT characterInSlot, INT rank, INT previousRank, INT totalTime) = "0x87f64e95e7d20e35"


// PURPOSE: Telemetry sent whenever we detect a dupe and block player from entering a vehicle

STRUCT STRUCT_DUPE_DETECTION
	INT   m_locationBlocked   // Where they were blocked (vehicle entry, mod shop entry, selling option)
	INT   m_reasonBlocked     // Why they were blocked (which of the 3 lists. previous 5 veh sold, last 5 plates to be changed, plates of last 10 ‘known dupes’)
	INT   m_vehicleModel      // Vehicle model
	INT   m_dupesSold         // If a limited number of allowed dupes had been sold, and if so, how many.
	INT   m_blockedVehicles   // Number of vehicles owned by player which match blocked vehicle’s license plate
	INT   m_ownedVehicles     // Total number of owned vehicles
	INT   m_garageSpace       // Total number of personal garage spaces
	INT   m_exploitLevel      // Exploit Level of player
	INT   m_levelIncrease     // Did we apply an exploit level increase? If so, how much
	BOOL  m_iFruit            // Does the player have the iFruit app?
	INT   m_spareSlot1        // spare slot
	INT   m_spareSlot2        // spare slot
ENDSTRUCT

NATIVE PROC PLAYSTATS_DUPE_DETECTED(STRUCT_DUPE_DETECTION& data) = "0xb1f7a9523f08ff13"

// PURPOSE: Telemetry sent whenever we display the ScriptHook Ban Alert message and the user selected an option
NATIVE PROC PLAYSTATS_BAN_ALERT(INT optionSelected) = "0x00409823e90f7907"


// PURPOSE
//   Struct for ending missions for gunrunning
// 
STRUCT STRUCT_GUNRUNNING_MISSION_END

	////////////////////////////////////////
	//
	//   These values must be set on all missions.
	//
	////////////////////////////////////////

	INT m_missionId
	INT m_missionTypeId
	INT m_matchId1
	INT m_matchId2
	INT m_bossId1
	INT m_bossId2

	////////////////////////////////////////
	//
	//   Check the mission you are doing and make sure you set the correct values - make sure you 
	//   leave at -1 values that will be excluded from the metric submission.
	//
	////////////////////////////////////////


	INT m_PlayerParticipated
	INT m_PlayerRole
	INT m_TimeStart
	INT m_TimeEnd
	INT m_Won
	INT m_EndingReason
	INT m_CashEarned
	INT m_RpEarned
	INT m_TargetsKilled
	INT m_InnocentsKilled
	INT m_Deaths
	INT m_LauncherRank
	INT m_TimeTakenToComplete
	INT m_PlayersLeftInProgress
	INT m_Location
	INT m_InvitesSent
	INT m_InvitesAccepted
	INT m_BossKilled
	INT m_GoonsKilled
	INT m_SuppliesStolen
	INT m_SuppliesOwned
	INT m_ProductsOwned
	INT m_OwnBunker
	INT m_OwnFiringRange
	INT m_OwnGunLocker
	INT m_OwnCaddy
	INT m_OwnTrailer
	INT m_OwnLivingArea
	INT m_OwnPersonalQuarter
	INT m_OwnCommandCenter
	INT m_OwnArmory
	INT m_OwnVehModArmory
	INT m_OwnVehStorage
	INT m_OwnEquipmentUpgrade
	INT m_OwnSecurityUpgrade
	INT m_OwnStaffUpgrade
	INT m_ResuppliesPassed
	INT m_FromHackerTruck
	INT m_properties
	INT m_properties2
	INT m_missionCategory
ENDSTRUCT

// PURPOSE: Telemetry for missions - called at the end.
NATIVE PROC PLAYSTATS_GUNRUNNING_MISSION_ENDED(STRUCT_GUNRUNNING_MISSION_END& data) = "0x806fe7b7db6b4483"


// PURPOSE
//   Struct for metric sent whenever a player starts or ends R&D OR Production.
// 
STRUCT STRUCT_GUNRUNNING_RND
	INT m_bossId1
	INT m_bossId2
	INT m_StartorEnd
	INT m_UpgradeType
	INT m_staffPercentage
	INT m_supplyAmount
	INT m_productionAmount
ENDSTRUCT

// PURPOSE: Telemetry sent whenever a player starts or ends R&D OR Production.
NATIVE PROC PLAYSTATS_GUNRUNNING_RND(STRUCT_GUNRUNNING_RND& data) = "0x898d135426febf95"

// Sends an array of int in the generic Security metric.
// Right now the maximum of fields sent is 7. 
// IntArray[0] - identifier
// IntArray[1] - Cash/RP
// IntArray[2] - Amount
NATIVE PROC APPEND_LAST_VEH_METRIC(INT &data[], GAMER_HANDLE& fromgamer, GAMER_HANDLE& togamer) = "0x9b5d2e1b89f58544"


//////////////////////////////////////////////////////////////////////////
// SMUGGLERS TELEMETRY

// PURPOSE: Telemetry sent whenever a player converts certain pegasus vehicles into personal vehicles by driving them into the player owned hanger.
NATIVE PROC PLAYSTATS_PEGASUS_AS_PERSONAL_AIRCRAFT(INT vehicleId) = "0xa1574858139a3894"



// PURPOSE
//   Struct for ending missions for gunrunning
// 
STRUCT STRUCT_SMUGGLER_MISSION_END

	////////////////////////////////////////
	//
	//   These values must be set on all missions.
	//
	////////////////////////////////////////

	INT m_missionId
	INT m_missionTypeId
	INT m_matchId1
	INT m_matchId2
	INT m_bossId1
	INT m_bossId2

	////////////////////////////////////////
	//
	//   Check the mission you are doing and make sure you set the correct values - make sure you 
	//   leave at -1 values that will be excluded from the metric submission.
	//
	////////////////////////////////////////


	INT m_PlayerParticipated = -1
	INT m_PlayerRole = -1
	INT m_TimeStart = -1
	INT m_TimeEnd = -1
	INT m_Won = -1
	INT m_EndingReason = -1
	INT m_CashEarned = -1
	INT m_RpEarned = -1
	INT m_TargetsKilled = -1
	INT m_InnocentsKilled = -1
	INT m_Deaths = -1
	INT m_LauncherRank = -1
	INT m_TimeTakenToComplete = -1
	INT m_PlayersLeftInProgress = -1
	INT m_Location = -1
	INT m_InvitesSent = -1
	INT m_InvitesAccepted = -1
	INT m_BossKilled = -1
	INT m_GoonsKilled = -1
	INT m_SuppliesStolen = -1
	INT m_SuppliesOwned = -1
	INT m_ResuppliesPassed = -1
	INT m_OwnHangar = -1
	INT m_OwnFurniture = -1
	INT m_OwnFlooring = -1
	INT m_OwnStyle = -1
	INT m_OwnLivingArea = -1
	INT m_OwnLighting = -1
	INT m_OwnWorkshop = -1
	INT m_AttackType = -1
	INT m_BossType = -1
	INT m_MembersParticipated = -1
 	INT m_HangarSlot1 = -1
	INT m_HangarSlot2 = -1
	INT m_HangarSlot3 = -1
	INT m_HangarSlot4 = -1
	INT m_HangarSlot5 = -1
	INT m_HangarSlot6 = -1
	INT m_HangarSlot7 = -1
	INT m_HangarSlot8 = -1
	INT m_HangarSlot9 = -1
	INT m_HangarSlot10 = -1
	INT m_Vehicle1Health = -1
	INT m_Vehicle2Health = -1
	INT m_Vehicle3Health = -1
	INT m_SourceAnyType = -1
	INT m_ContrabandType = -1
	INT m_FromHackerTruck = -1
ENDSTRUCT

// PURPOSE: Telemetry for missions - called at the end.
NATIVE PROC PLAYSTATS_SMUGGLER_MISSION_ENDED(STRUCT_SMUGGLER_MISSION_END& data) = "0xe054822c491e697a"


// PURPOSE
//   Struct for ending freemode heist preparation
// 
STRUCT STRUCT_FM_HEIST_PREP_ENDED
	////////////////////////////////////////
	//
	//   These values must be set on all missions.
	//
	////////////////////////////////////////

	INT m_missionId
	INT m_missionTypeId
	INT m_matchId1
	INT m_matchId2
	INT m_bossId1
	INT m_bossId2

	////////////////////////////////////////
	//
	//   Check the mission you are doing and make sure you set the correct values - make sure you 
	//   leave at -1 values that will be excluded from the metric submission.
	//
	////////////////////////////////////////
	INT m_PlayerParticipated = -1
	INT m_PlayerRole = -1
	INT m_TimeStart = -1
	INT m_TimeEnd = -1
	INT m_Won = -1
	INT m_EndingReason = -1
	INT m_CashEarned = -1
	INT m_RpEarned = -1
	INT m_TargetsKilled = -1
	INT m_InnocentsKilled = -1
	INT m_Deaths = -1
	INT m_LauncherRank = -1
	INT m_TimeTakenToComplete = -1
	INT m_PlayersLeftInProgress = -1
	INT m_Location = -1
	INT m_InvitesSent = -1
	INT m_InvitesAccepted = -1	
	INT m_HeistSessionID = -1
	INT m_OwnBase = -1
	INT m_OwnCannon = -1
	INT m_OwnSecurityRoom = -1
	INT m_OwnLounge = -1
	INT m_OwnLivingQuarters = -1
	INT m_OwnTiltRotor = -1
	INT m_OrbitalCannonShots = -1
	INT m_OrbitalCannonKills = -1
	INT m_AssasinationLevel1Calls = -1
	INT m_AssasinationLevel2Calls = -1
	INT m_AssasinationLevel3Calls = -1
	INT m_PrepCompletionType = -1
	INT m_TimeSpentHacking = -1
	INT m_FailedStealth = -1
	INT m_QuickRestart = -1
	INT m_StarterBossId1 = -1
	INT m_StarterBossId2 = -1
	INT m_SessionID = -1
	INT m_BossType = -1
	INT m_AttackType = -1
	INT m_TimeTakenForObjective = -1
	INT m_EntitiesStolen = -1
ENDSTRUCT

// PURPOSE: Telemetry for missions - called at the end.
NATIVE PROC PLAYSTATS_FM_HEIST_PREP_ENDED(STRUCT_FM_HEIST_PREP_ENDED& data) = "0x394a4ac6fa3905c0"


// PURPOSE
//   Struct for ending instanced heist missions
// 
STRUCT STRUCT_INSTANCED_HEIST_ENDED
	JobBInfo m_infos
	INT m_bossId1 = -1
	INT m_bossId2 = -1
	INT m_BossType = -1
	INT m_AttackType = -1
	INT m_OwnBase = -1
	INT m_OwnCannon = -1
	INT m_OwnSecurityRoom = -1
	INT m_OwnLounge = -1
	INT m_OwnLivingQuarters = -1
	INT m_OwnTiltRotor = -1
	INT m_OrbitalCannonShots = -1
	INT m_OrbitalCannonKills = -1
	INT m_AssasinationLevel1Calls = -1
	INT m_AssasinationLevel2Calls = -1
	INT m_AssasinationLevel3Calls = -1
	INT m_ObserveTargetCalls = -1
	INT m_PrepCompletionType = -1
	INT m_FailedStealth = -1
	INT m_QuickRestart = -1
ENDSTRUCT

// PURPOSE: Telemetry for missions - called at the end.
NATIVE PROC PLAYSTATS_INSTANCED_HEIST_ENDED(STRING creator, STRING matchId, STRING playlistid, STRUCT_INSTANCED_HEIST_ENDED& data) = "0xb48ebffa2167e483"


// PURPOSE
//   Struct for DAR missions checkpoints
// 
STRUCT STRUCT_DAR_CHECKPOINT
	INT m_StartLocation = -1
	INT m_Checkpoint1Complete = -1
	INT m_TimeTakenToCompleteCheckpoint1 = -1
	INT m_Checkpoint2Complete = -1
	INT m_TimeTakenToCompleteCheckpoint2 = -1
	INT m_Checkpoint3Complete = -1
	INT m_TimeTakenToCompleteCheckpoint3 = -1
	INT m_Checkpoint4Complete = -1
	INT m_TimeTakenToCompleteCheckpoint4 = -1
	INT m_EndLocation = -1
	INT m_DarAcquired = -1
	INT m_TotalTimeSpent = -1
	INT m_CashEarned = -1
	INT m_RPEarned = -1
	INT m_Replay = -1
	INT m_FailedReason = -1
	INT m_RockstarAccountIndicator = -1
ENDSTRUCT

// PURPOSE: Telemetry for  Dual Action Revolver head shot challenge - called after reching a checkpoint
NATIVE PROC PLAYSTATS_DAR_CHECKPOINT(STRUCT_DAR_CHECKPOINT& data) = "0x17da863603f94ac8"


/////////////////////////////////////////////////////////////////////////////// MEGA BUSINESS

STRUCT STRUCT_BUSINESS_BATTLE_ENDED
	INT m_missionId = -1
	INT m_missionTypeId = -1
	INT m_bossId1 = -1					//BossId
	INT m_bossId2 = -1					//BossId
	INT m_matchId1 = -1					//MatchId
	INT m_matchId2 = -1					//MatchId
	INT m_playerParticipated = -1      //Whether  or not player participated 
	INT m_timeStart = -1				//Time work started
	INT m_timeEnd = -1					//Time work ended
	INT m_won = -1						//won/lost
	INT m_endingReason = -1            //Reason for script ending - timer ran out, left session, etc
	INT m_cashEarned = -1				//Cash Earned.
	INT m_rpEarned = -1					//RP Earned.
	INT m_bossKilled = -1				//Boss's killed
	INT m_goonsKilled = -1             //Goons killed
	INT m_targetLocation = -1
	INT m_launchedByBoss = -1          //Whether  or not work was launched by this Boss
	INT m_starterBossId1 = -1
	INT m_starterBossId2 = -1
	INT m_playerrole = -1
	INT m_targetskilled = -1
	INT m_timetakentocomplete = -1
	INT m_playersleftinprogress = -1
	INT m_bosstype = -1
	INT m_attacktype = -1
	INT m_packagesstolen = -1
	INT m_participationLevel = -1
	INT m_entitiesstolentype = -1
	BOOL m_ownnightclub = FALSE
	INT m_objectivelocation = -1
	INT m_deliverylocation = -1
	INT m_collectiontype = -1
	INT m_enemytype = -1
	INT m_enemyvehicle = -1
	INT m_eventitem = -1
	BOOL m_iscop = FALSE
ENDSTRUCT

// PURPOSE: Telemetry for Business battle ended
NATIVE PROC PLAYSTATS_BUSINESS_BATTLE_ENDED(STRUCT_BUSINESS_BATTLE_ENDED& data) = "0x408363ec3f842fc2"


STRUCT STRUCT_WAREHOUSE_MISSION_ENDED
	INT m_missionId = -1
	INT m_missionTypeId = -1
	INT m_matchId1 = -1
	INT m_matchId2 = -1
	INT m_bossId1 = -1
	INT m_bossId2 = -1
	INT m_PlayerParticipated = -1
	INT m_PlayerRole = -1
	INT m_TimeStart = -1
	INT m_TimeEnd = -1
	INT m_Won = -1
	INT m_EndingReason = -1
	INT m_CashEarned = -1
	INT m_RpEarned = -1
	INT m_TargetsKilled = -1
	INT m_InnocentsKilled = -1
	INT m_Deaths = -1
	INT m_LauncherRank = -1
	INT m_TimeTakenToComplete = -1
	INT m_PlayersLeftInProgress = -1
	INT m_Location = -1
	INT m_InvitesSent = -1
	INT m_InvitesAccepted = -1
	INT m_BossKilled = -1
	INT m_GoonsKilled = -1
	INT m_SuppliesStolen = -1
	INT m_SuppliesOwned = -1
	INT m_ProductsOwned = -1
	BOOL m_ownnightclub = FALSE
	INT m_numberoftechnicians = -1
	BOOL m_ownequipmentupgrade = FALSE
	BOOL m_ownhackertruck = FALSE
	INT m_ownwarehouseb2 = -1
	INT m_ownwarehouseb3 = -1
	INT m_ownwarehouseb4 = -1
	INT m_ownwarehouseb5 = -1
	BOOL m_ownmissilelauncher = FALSE
	BOOL m_owndronestation = FALSE
	BOOL m_ownhackerbike = FALSE
	BOOL m_ownvehicleworkshop = FALSE
	INT m_quickrestart = -1
	INT m_bosstype = -1
	INT m_attacktype = -1
	INT m_deliveryproduct = -1
	INT m_enemygroup = -1
	INT m_ambushvehicle = -1
	INT m_deliveryvehicle = -1
	INT m_productssellchoice = -1
	INT m_shipmentsize = -1
	INT m_totalunitssold = -1
	INT m_timeusingdrone = -1
	INT m_dronedestroyed = -1
	INT m_totaldronetases = -1
	BOOL m_iscop = FALSE
ENDSTRUCT

// PURPOSE: Telemetry for Warehouse mission ended
NATIVE PROC PLAYSTATS_WAREHOUSE_MISSION_ENDED(STRUCT_WAREHOUSE_MISSION_ENDED& data) = "0x088366fa1148eb2f"


STRUCT STRUCT_NIGHTCLUB_MISSION_ENDED
	INT m_missionId = -1
	INT m_missionTypeId = -1
	INT m_matchId1 = -1
	INT m_matchId2 = -1
	INT m_bossId1 = -1
	INT m_bossId2 = -1
	INT m_PlayerParticipated = -1
	INT m_PlayerRole = -1
	INT m_TimeStart = -1
	INT m_TimeEnd = -1
	INT m_Won = -1
	INT m_EndingReason = -1
	INT m_CashEarned = -1
	INT m_RpEarned = -1
	INT m_TargetsKilled = -1
	INT m_InnocentsKilled = -1
	INT m_Deaths = -1
	INT m_LauncherRank = -1
	INT m_TimeTakenToComplete = -1
	INT m_PlayersLeftInProgress = -1
	INT m_Location = -1
	INT m_InvitesSent = -1
	INT m_InvitesAccepted = -1
	INT m_BossKilled = -1
	INT m_GoonsKilled = -1
	INT m_SuppliesStolen = -1
	INT m_SuppliesOwned = -1
	INT m_ProductsOwned = -1
	BOOL m_ownnightclub = FALSE
	INT m_ownadditionalstaff = -1
	INT m_ownadditionalsecurity = -1
	BOOL m_ownhackertruck = FALSE
	INT m_quickrestart = -1
	INT m_bosstype = -1
	INT m_attacktype = -1
	INT m_collectiontype = -1
	INT m_enemygroup = -1
	INT m_ambushvehicle = -1
	INT m_deliverylocation = -1
	INT m_properties = 0
	INT m_properties2 = 0
	INT m_launchMethod = 0
ENDSTRUCT

// PURPOSE: Telemetry for Nightclub mission ended
NATIVE PROC PLAYSTATS_NIGHTCLUB_MISSION_ENDED(STRUCT_NIGHTCLUB_MISSION_ENDED& data) = "0xd64d32d200423b06"

// PURPOSE: Telemetry for Dj usage
NATIVE PROC PLAYSTATS_DJ_USAGE(INT djUsage, INT location = 0) = "0x695c81d0332d9916"

// PURPOSE: Telemetry for minigames usage
NATIVE PROC PLAYSTATS_MINIGAME_USAGE(INT usage, INT location = 0, INT duration = 0) = "0x6993f138c829b26a"


STRUCT STRUCT_STONE_HATCHET_END
	INT m_timespent
	INT m_result
	INT m_cashearned
	INT m_rpearned
	INT m_Location
	INT m_Target
	FLOAT m_TargetX
	FLOAT m_TargetY
	INT m_TargetEvasionChoice
	FLOAT m_damagedealt
	FLOAT m_damagerecieved
	BOOL m_capturedorkilled
	BOOL m_chestfound
ENDSTRUCT

// PURPOSE: Telemetry for Stone hatchet ended
NATIVE PROC PLAYSTATS_STONE_HATCHET_ENDED(STRUCT_STONE_HATCHET_END& data) = "0xbeb7291ef6b778e3"


///////////////////////////////////////////////////////////////////////////////

// PURPOSE
//   Struct for DAR missions checkpoints
// 
STRUCT STRUCT_ENTER_SESSION_PACK
	INT m_Enterp_Prop = -1
	INT m_Enterp_Veh = -1
	INT m_Enterp_Weapon = -1
	INT m_Enterp_Tattoo1 = -1
	INT m_Enterp_Tattoo2 = -1
	INT m_Enterp_Clothing1 = -1
	INT m_Enterp_Clothing2 = -1
ENDSTRUCT

// PURPOSE: Telemetry  every time a player enters a session, and will allow PIA to discern whether or not a player is a Starter Pack player, or a Premium Edition player.
//          It will also detail what Starter Pack and Premium Edition items a player owned before purchasing the Starter Pack.  
NATIVE PROC PLAYSTATS_ENTER_SESSION_PACK(STRUCT_ENTER_SESSION_PACK& data) = "0xeb0ddef618b05dc8"

// PURPOSE: Telemetry for drone usage
NATIVE PROC PLAYSTATS_DRONE_USAGE(INT time, INT endReason, INT totalDroneTases) = "0x12cd528ec74914fe"

// PURPOSE: Metric fires at the end of the wheel spin (when the player choses to play only - do not send a metric if the player never pushes x to stop the wheel after being knocked out)
NATIVE PROC PLAYSTATS_SPIN_WHEEL(INT contentId, INT spintType, INT rewardType, INT rewardItem) = "0x0cc7ae3d2fd7dcf2"

// PURPOSE: Metric to be sent when the player opts out of the specific spectator mode or the match ends.
NATIVE PROC PLAYSTATS_ARENA_WARS_SPECTATOR(INT contentId, INT spectatorMode, INT weaponizedMode, INT duration, INT kills) = "0xaed646ac791f774a"


STRUCT STRUCT_ARENA_WARS_ENDED
	INT m_sessionid = -1
	INT m_publiccontentid = -1
	INT m_cashearned = -1
	INT m_launchmethod = -1
	INT m_leftinprogress = -1
	INT m_xp = -1
	INT m_kills = -1
	INT m_deaths = -1
	INT m_suicides = -1
	INT m_rank = -1
	INT m_vehicleid = -1
	INT m_matchduration = -1
	INT m_playingtime = -1
	INT m_result = -1
	INT m_premiumEvent = 0
	INT m_skillLevel = -1
	INT m_endreason = -1
	INT m_killer = -1
	INT m_killervehicle = -1
	INT m_matchtype = -1
	INT m_matchname = -1
	INT m_checkpointsCollected = -1
	INT m_bonusTime = -1
	INT m_finishPosition = -1
	INT m_teamType = -1
	INT m_teamId = -1
	INT m_personalVehicle = 0
	INT m_flagsStolen = -1
	INT m_flagsDelivered = -1
	INT m_totalPoints = -1
	INT m_goalsScored = -1
	INT m_suddenDeath = 0
	INT m_winConditions = -1
	INT m_damageDealt = -1
	INT m_damageReceived = -1
	INT m_gladiatorKills = -1
	INT m_bombTime = -1
	INT m_spectatorTime = -1
	INT m_totalTagIns = -1
	INT m_timeEliminated = -1
	INT m_lobbyModLivery = -1
	INT m_lobbyModArmor = -1
	INT m_lobbyModWeapon = -1
	INT m_lobbyModMine = -1
	INT m_controlTurret = 0
ENDSTRUCT

// PURPOSE: Metric to fire when match ends.
NATIVE PROC PLAYSTATS_ARENA_WARS_ENDED(STRUCT_ARENA_WARS_ENDED& data) = "0xfad8de13daf839cc"


// PURPOSE: Metric to be sent when the player switches the passive mode on or off
NATIVE PROC PLAYSTATS_SWITCH_PASSIVE_MODE(BOOL value, INT source, INT ghostedTo, INT endReason) = "0x5106caaf87c49a90"

// PURPOSE: Metric to be sent every time a collectible is picked up
NATIVE PROC PLAYSTATS_COLLECTIBLE_PICKED_UP(INT collectionType, INT pickedUp, INT pickedSoFar, INT total, INT awardCash, INT awardRP, INT awardChips, INT awardItems, INT location, INT animal, INT awardMedal = 0) = "0x105d0aa48fb961ae"


/// CASINO

STRUCT STRUCT_CASINO_STORY_MISSION_ENDED
    INT m_MatchCreator
    INT m_SessionType
    INT m_PlaylistId
    INT m_Kills
    INT m_Deaths
    INT m_Cash
    INT m_CashStart
    INT m_CashEnd
    INT m_MissionLaunch
    INT m_Difficulty
    INT m_FirstPerson
    INT m_Medal
    INT m_TeamLivesUsed
    INT m_FailureReason
    INT m_UsedQuickRestart
    BOOL m_IsHost
    BOOL m_IsSessionVisible
    BOOL m_LeftInProgress
    BOOL m_SpookedCops
    INT m_PlayingTime
    INT m_XP
    INT m_Suicides
    INT m_Rank
    INT m_CrewId
    INT m_Result
    INT m_JobPoints
    BOOL m_UsedVoiceChat
    INT m_HeistSessionId
    BOOL m_ClosedJob
    BOOL m_PrivateJob
    BOOL m_FromClosedFreemode
    BOOL m_FromPrivateFreemode
    INT m_BossUUID
    INT m_BossUUID2
    INT m_BossType
    INT m_FailedStealth
    INT m_MissionID
    INT m_MissionVariation
    BOOL m_OwnPenthouse
    BOOL m_OwnGarage
    BOOL m_OwnOffice
    INT m_HouseChipsEarned
    INT m_RestartPoint
    BOOL m_LaunchedByPlayer
ENDSTRUCT

STRUCT STRUCT_CASINOMETRIC
	INT m_gameType
	INT m_matchType
	INT m_tableID
	INT m_handID
	INT m_endReason
	BOOL m_allIn
	INT m_chipsDelta
	INT m_finalChipBalance
	INT m_totalPot
	INT m_playersAtTable
	BOOL m_viewedLegalScreen
	BOOL m_ownPenthouse
	INT m_betAmount1
	INT m_betAmount2
	INT m_winAmount
	BOOL m_win
	BOOL m_cheat
	INT m_timePlayed
	BOOL m_isHost
	INT m_hostID
	INT m_membership
ENDSTRUCT

STRUCT STRUCT_CASINOCHIPMETRIC
    INT m_action
    INT m_transactionID
    INT m_cashAmount
    INT m_chipsAmount
    INT m_reason
    INT m_cashBalance
    INT m_chipBalance
    INT m_item
ENDSTRUCT

STRUCT STRUCT_ROULETTEMETRIC
	STRUCT_CASINOMETRIC m_casinoMetric
	BOOL m_iBetStraight
	BOOL m_iBetSplit
	BOOL m_iBetStreet
	BOOL m_iBetCorner
	BOOL m_iBetFiveNumber
	BOOL m_iBetSixLine
	BOOL m_oBetRed
	BOOL m_oBetBlack
	BOOL m_oBetOddNumber
	BOOL m_oBetEvenNumber
	BOOL m_oBetLowBracket
	BOOL m_oBetHighBracket
	BOOL m_oBetDozen
	BOOL m_oBetColumn
	INT m_winningNumber
	INT m_winningColour
ENDSTRUCT

STRUCT STRUCT_BLACKJACKMETRIC
	STRUCT_CASINOMETRIC m_casinoMetric
	BOOL m_stand
	BOOL m_hit
	BOOL m_double
	BOOL m_split
	INT m_outcome
ENDSTRUCT

STRUCT STRUCT_THREECARDPOKERMETRIC
	STRUCT_CASINOMETRIC m_casinoMetric
	BOOL m_pairPlus
	INT m_outcome
ENDSTRUCT

STRUCT STRUCT_SLOTMACHINEMETRIC
	STRUCT_CASINOMETRIC m_casinoMetric
	INT m_machineStyle
ENDSTRUCT

STRUCT STRUCT_INSIDETRACKMETRIC
	STRUCT_CASINOMETRIC m_casinoMetric
	INT m_gameChoice
	INT m_horseChoice
ENDSTRUCT

STRUCT STRUCT_LUCKYSEVENMETRIC
	STRUCT_CASINOMETRIC m_casinoMetric
	INT m_rewardType
	INT m_rewardItem
	INT m_rewardAmount
ENDSTRUCT

NATIVE PROC PLAYSTATS_CASINO_STORY_MISSION_ENDED(STRUCT_CASINO_STORY_MISSION_ENDED& data, STRING matchId) = "0x4c517c8e9091cf2f"
NATIVE PROC PLAYSTATS_CASINO_CHIP(STRUCT_CASINOCHIPMETRIC& data) = "0x40b7bafae68b3b4b"
NATIVE PROC PLAYSTATS_CASINO_ROULETTE(STRUCT_ROULETTEMETRIC& data) = "0xce2b99bd74235922"
NATIVE PROC PLAYSTATS_CASINO_BLACKJACK(STRUCT_BLACKJACKMETRIC& data) = "0xcf03dfe4022cd1aa"
NATIVE PROC PLAYSTATS_CASINO_THREE_CARD_POKER(STRUCT_THREECARDPOKERMETRIC& data) = "0x7f6e93cfee0575cc"
NATIVE PROC PLAYSTATS_CASINO_SLOT_MACHINE(STRUCT_SLOTMACHINEMETRIC& data) = "0xc4f42fb6ef3d3ad8"
NATIVE PROC PLAYSTATS_CASINO_INSIDE_TRACK(STRUCT_INSIDETRACKMETRIC& data) = "0x0d72f741f82c7fdb"
NATIVE PROC PLAYSTATS_CASINO_LUCKY_SEVEN(STRUCT_LUCKYSEVENMETRIC& data) = "0x1957acef6a2a721c"


STRUCT STRUCT_CASINOMETRICLIGHT
	INT m_matchType
	INT m_tableID
	INT m_endReason
	INT m_chipsDelta
	INT m_finalChipBalance
	INT m_duration
	BOOL m_viewedLegalScreen
	INT m_betAmount1
	INT m_betAmount2
	INT m_cheatCount
	BOOL m_isHost
	INT m_hostID
	INT m_handsPlayed
	INT m_winCount
	INT m_loseCount
	INT m_membership
ENDSTRUCT

STRUCT STRUCT_BLACKJACKMETRICLIGHT
	STRUCT_CASINOMETRICLIGHT m_casinoMetric
	INT m_dealerBlackjackCount
	INT m_playerBlackjackCount
	INT m_surrenderCount
	INT m_bustCount
	INT m_7CardCharlieCount
ENDSTRUCT

STRUCT STRUCT_SLOTMACHINEMETRICLIGHT
	STRUCT_CASINOMETRICLIGHT m_casinoMetric
	INT m_machineStyle
ENDSTRUCT

STRUCT STRUCT_INSIDETRACKMETRICLIGHT
	STRUCT_CASINOMETRICLIGHT m_casinoMetric
	INT m_individualGameCount
	INT m_mainEventCount
ENDSTRUCT

NATIVE PROC PLAYSTATS_CASINO_ROULETTE_LIGHT(STRUCT_CASINOMETRICLIGHT& data) = "0xb2b72c2a5c575c31"
NATIVE PROC PLAYSTATS_CASINO_BLACKJACK_LIGHT(STRUCT_BLACKJACKMETRICLIGHT& data) = "0xbde5abc4347750ff"
NATIVE PROC PLAYSTATS_CASINO_THREE_CARD_POKER_LIGHT(STRUCT_CASINOMETRICLIGHT& data) = "0x2f56bfe7cf953d90"
NATIVE PROC PLAYSTATS_CASINO_SLOT_MACHINE_LIGHT(STRUCT_SLOTMACHINEMETRICLIGHT& data) = "0x1e63d77aa576606a"
NATIVE PROC PLAYSTATS_CASINO_INSIDE_TRACK_LIGHT(STRUCT_INSIDETRACKMETRICLIGHT& data) = "0xddef35d1614e2f2c"

NATIVE PROC PLAYSTATS_ARCADE_GAME(INT gameType, INT numPlayers, INT powerUps, INT kills, INT timePlayed, INT score, INT location) = "0xc9e0752c5af51dc0"

STRUCT STRUCT_ARCADE_LOVE_MATCH
	INT matchId1
	INT matchId2
	INT score
	INT flying
	INT stamina
	INT shooting
	INT driving
	INT stealth
	INT maxHealth
	INT trueLove
	INT nemesis2
ENDSTRUCT

NATIVE PROC PLAYSTATS_ARCADE_LOVE_MATCH(GAMER_HANDLE& hGamer, STRUCT_ARCADE_LOVE_MATCH& data) = "0x508b99f137224f1d"

STRUCT STRUCT_FREEMODE_CASINO_MISSION_ENDED
	INT m_missionId
	INT m_missionTypeId
	INT m_matchId1
	INT m_matchId2
	INT m_bossId1
	INT m_bossId2
	INT m_PlayerParticipated
	INT m_PlayerRole
	INT m_TimeStart
	INT m_TimeEnd
	INT m_Won
	INT m_EndingReason
	INT m_CashEarned
	INT m_RpEarned
	INT m_TargetsKilled
	INT m_InnocentsKilled
	INT m_Deaths
	INT m_LauncherRank
	INT m_TimeTakenToComplete
	INT m_PlayersLeftInProgress
	INT m_Location
	INT m_InvitesSent
	INT m_InvitesAccepted
	INT m_BossKilled
	INT m_GoonsKilled
	INT m_missionVariation
	INT m_launchMethod
	INT m_ownPenthouse
	INT m_ownGarage
	INT m_ownOffice
	INT m_houseChipsEarned
ENDSTRUCT

// PURPOSE: Telemetry for Freemode Casino mission ended
NATIVE PROC PLAYSTATS_FREEMODE_CASINO_MISSION_ENDED(STRUCT_FREEMODE_CASINO_MISSION_ENDED& data) = "0xf736e9ffb158c31e"

/////////////////////////////////////////////////////////////////////////////// HEIST 3
STRUCT STRUCT_HEIST3_DRONE
	INT missionName                //Checkpoint Collection, Assassination, Finale, null if not applicable
	INT playthroughId              //if used during the finale, null if not applicable; playthrough ID, this should appear in all related content, like scopes, preps and finales, and would enable us to track an entire heist playthrough
	INT endReason                  //reason for stopping
	INT time                       //length of time drone was used
	INT totalDroneTases            //number of cameras and enemies tased
	INT totalDroneTranq            //number of enemies tranquilised
	BOOL nano                      //whether this is the nano drone
	INT cpCollected                //checkpoints collected before exiting, in Checkpoint Collection; null if not applicable
	INT targetsKilled              //targets killed in Assassination; null if not applicable
ENDSTRUCT

// PURPOSE: triggers after using the Casino Heist drone
NATIVE PROC PLAYSTATS_HEIST3_DRONE(STRUCT_HEIST3_DRONE& data) = "0x3410b63b8434966b"


// PURPOSE: triggers at the end of the hacking minigames added in Casino Heist
NATIVE PROC PLAYSTATS_HEIST3_HACK(INT type, INT playthroughId, INT minigame, BOOL won, INT iStep, INT iTime) = "0x74f42e3fabc4f024"


// PURPOSE: triggers after being contacted by an NPC on the phone
NATIVE PROC PLAYSTATS_NPC_PHONE(INT caller, INT type, INT subject, INT playerAction, BOOL request, INT rank) = "0xd6cb1a1c9d35d3ef"

STRUCT STRUCT_ARCADE_CABINET
	INT gameType                   //which arcade game: Badlands Revenge 2, Race & Chase, Axe of Fury, Madame Nazar etc.
	INT matchId                    //ID to connect the arcade match between players, where applicable
	INT numPlayers                 //number of players
	INT level                      //which level the player stopped on
	INT powerUps                   //number of power ups collected
	INT kills                      //number of entities destroyed/killed
	INT timePlayed                 //time played
	INT score                      //score at the end of the game
	INT reward                     //fortune from Madam Nazar, prize from claw crane, trophy, null if not applicable
	INT challenges                 //which challenges were completed
	INT location				   //property hash this arcade game is in
ENDSTRUCT

// PURPOSE: triggers at the end of the Arcade minigames added in Casino Heist with the exception of Love Match, tracked separately
NATIVE PROC PLAYSTATS_ARCADE_CABINET(STRUCT_ARCADE_CABINET& data) = "0xe302e901503a46d8"

STRUCT STRUCT_HEIST3_FINALE
	INT playthroughId              //playthrough ID, this should appear in all related content, like scopes, preps and finales, and would enable us to track an entire heist playthrough
	INT missionId                  //mission name
	TEXT_LABEL_31 publicContentId  //public content ID
	INT playthroughHashMac         //mac hash
	INT bossId1                    //unique ID of the Boss instance
	INT bossId2                    //unique ID of the Boss instance
	INT bosstype                   //type of org: Securoserv, MC, unaffiliated
	INT launcherRank               //rank of the player launching
	INT playerRole                 //similar to previous metrics, the player's role: CEO, bodyguard, biker prospect etc.
	INT endingReason               //similar to previous metrics: won, lost, boss_left etc.
	INT replay                     //counts how many times this mission was failed, then continued from checkpoint/restarted; resets after the player exits the mission, null if not applicable
	INT rpEarned                   //RP earned
	BOOL difficult                 //whether the mission has increased difficulty
	INT timeTakenToComplete        //time taken to complete
	INT checkpoint                 //what checkpoint was the heist failed at; null if not applicable
	INT playCount                  //how many times has the player completed this mission before; first time is 1, then increments of 1 after completing finale, only success matters
	INT approachBoard              //stealth, subterfuge, direct
	BOOL approachDirect            //was the original approach failed, and default to direct; null if the original approach is Direct
	INT wCrew                      //weapon crew member
	INT wLoadout                   //loadout 1 or 2
	INT dCrew                      //driver crew member
	INT vehicleGetaway             //getaway vehicle
	INT vehicleSwap                //vehicle picked for swapping
	INT hCrew                      //hacker crew member
	INT outfitIn                   //outfit the player used when entering the casino
	INT outfitOut                  //outfit the player used when leaving the casino, if applicable and different to outfitIn
	INT mask                       //mask used, null if not applicable
	INT vehicleSwapped             //whether the player used the chosen swap vehicle
	INT useEMP                     //whether the the EMP was used
	INT useDrone                   //whether the player used the Drone
	INT useThermite                //whether the player used thermite to pass the security keypads
	INT useKeycard                 //whether the player used the keycard to pass the security keypads
	INT hack                       //whether the player completed the hacking minigame to pass the security keypads
	INT cameras                    //does the player have the security cameras information
	INT accessPoints               //which access points were used
	INT vaultTarget                //diamonds, gold, cash, art
	INT vaultAmt                   //amount stolen from vault
	INT dailyCashRoomAmt           //amount stolen from daily cash room
	INT depositBoxAmt              //amount stolen from safety deposit boxes
	INT percentage                 //heist percentage of payout
	INT deaths                     //how many times the player died
	INT targetsKilled              //number of mission critical/aggressive peds killed
	INT innocentsKilled            //number of innocent peds killed
	INT buyerLocation              //buyer's location
ENDSTRUCT

// PURPOSE: triggers at the end of finale missions
NATIVE PROC PLAYSTATS_HEIST3_FINALE(STRUCT_HEIST3_FINALE& data) = "0xa05816757b8077e8"

STRUCT STRUCT_HEIST3_PREP
	INT playthroughId              //playthrough ID, this should appear in all related content, like scopes, preps and finales, and would enable us to track an entire heist playthrough
	INT missionName                //mission name
	INT playthroughHashMac         //mac hash
	INT playCount                  //how many times has the player completed this mission before, can be null for Arcade property setup, since it can only be played once; first time is 1, then increments of 1 after completing finale, only success matters
	INT approach                   //stealth, subterfuge, direct, null if not applicable
	INT type                       //arcade setup, scope, weapon prep, vehicle prep, equipment prep
	INT bossId1                    //unique ID of the Boss instance
	INT bossId2                    //unique ID of the Boss instance
	INT bosstype                   //type of org: Securoserv, MC, unaffiliated
	INT launcherRank               //rank of the player launching
	INT playerRole                 //similar to previous metrics, the player's role: CEO, bodyguard, biker prospect etc.
	BOOL playerParticipated        //whether the player participated
	BOOL difficult                 //whether the mission has increased difficulty
	INT timeTakenToComplete        //time taken to complete
	INT endingReason               //similar to previous metrics: won, lost, boss_left etc.
	BOOL isRivalParty              //is the party completing the mission the same as the party that launched it, null if not applicable
	INT cashEarned                 //money earned
	INT rpEarned                   //RP earned
	INT location                   //mission subvariation or Arcade property location
	INT invitesSent                //invites sent
	INT invitesAccepted            //invites accepted
	INT deaths                     //how many times the player died
	INT targetsKilled              //number of mission critical/aggressive peds killed
	INT innocentsKilled            //number of innocent peds killed
	INT prepCrewMember             //elected crew member for this type of prep, null if not applicable
	INT unlockYohan                //has this player completed the Nighclub setup, unlocking hacker Yohan?
	INT unlockCharlie              //has this player completed the Smuggler business setup, unlocking gunman Charlie?
	INT unlockChester1             //has this player completed the Gunrunning business setup, unlocking driver/gunman Chester McCoy?
	INT unlockChester2             //does this player own the Weapons Expert Arena Workshop upgrade, unlocking driver/gunman Chester McCoy?
	INT unlockZach                 //does this player have a Biker Business set up, unlocking driver Zach?
	INT unlockPatrick              //has this player completed the secret Random Event in Freemode, unlocking gunman Packie McReary?
	INT unlockAvi                  //has the player destroyed all 50 hidden signal jammers, unlocking hacker Avi Schwartzman?
	INT unlockPaige                //has the player completed a Client Job in their Terrorbyte, unlocking hacker Paige Harris?
	INT accessPoints               //which entry points were captured, for Scope Out Casino; null is not applicable
	INT shipmentsDestroyed         //number of shipments destroyed, for Disrupt Shipments, null if not applicable
	INT vaultTarget                //diamonds, gold, cash, art, for Vault Contents
ENDSTRUCT

// PURPOSE: triggers at the end of arcade setup missions, casino scoping, general prep missions
NATIVE PROC PLAYSTATS_HEIST3_PREP(STRUCT_HEIST3_PREP& data) = "0x71e002586231cecc"


// PURPOSE: triggers when the player exits the MCT, tracking the actions taken
NATIVE PROC PLAYSTATS_MASTER_CONTROL(INT accessed, INT iExit, INT missionType, INT missionName) = "0xf4325aa893d9a6c1"


// PURPOSE: triggers if you quit a job/mission before the end; should also cover scenario where the player quits to singleplayer
NATIVE PROC PLAYSTATS_QUIT_MODE(INT missionType, STRING sMid, INT players, INT duration, BOOL voteDiff) = "0x5c1faee011fb9409"

STRUCT STRUCT_MISSION_VOTE
	TEXT_LABEL_31 sMid              //Public content ID of mission the player is in
	INT numPlayers                 //Number of current players in the vote screen
	INT voteChoice                 //Restart, continue from checkpoint, quit, abstain; null if equal to field result
	INT result                     //Outcome of the vote
	INT timeOnline                 //Total time the player has been online
	BOOL voteDiff                  //Did the winning vote on the fail alert screen differ from this player's vote
	BOOL endBoard				   //whether this is the leaderboard displayed at the end of the mode or not
ENDSTRUCT

// PURPOSE: triggers after voting on the mission fail alert screen
NATIVE PROC PLAYSTATS_MISSION_VOTE(STRUCT_MISSION_VOTE& data) = "0x73fc05558dd31e81"

STRUCT STRUCT_NJVS_VOTE
	TEXT_LABEL_31 sMid              //Public content ID of mission the player is in
	INT numPlayers                 //Number of current players in the vote screen
	TEXT_LABEL_31 voteChoice       //Which mode the player voted for while on the NJVS; presumably will be the public content ID, null if abstain or equal to field result
	TEXT_LABEL_31 result           //Mode that won the vote; presumably public content ID
	INT timeOnline                 //Total time the player has been online
	BOOL voteDiff                  //Did the winning vote on the NJVS differ from this player's vote; null if N/A
ENDSTRUCT

// PURPOSE: triggers after voting is concluded on the NJVS
NATIVE PROC PLAYSTATS_NJVS_VOTE(STRUCT_NJVS_VOTE& data) = "0xf9b99a9cf272cad8"

// PURPOSE: triggers when the player kills himself via the pause menu.
NATIVE PROC PLAYSTATS_KILL_YOURSELF() = "0x4e6031b668a3f214"

STRUCT STRUCT_DISPATCH_ENDED
	INT m_MatchCreator
	INT m_SessionType
	INT m_PlaylistId
	INT m_launchMethod          // how this mission was launched; accepted/requested dispatch call
	INT m_endingReason          // reason this mission ended; arrest, kill, die, leave
	INT m_timeTakenToComplete   // time taken to complete
	INT m_targetsKilled         // how many hostile mission peds were killed
	INT m_cashEarned            // amount of cash earned
	INT m_rpEarned              // amount of RP earned
ENDSTRUCT
// PURPOSE: Tracks the new Dispatch Call freemode missions.
NATIVE PROC PLAYSTATS_DISPATCH_ENDED(STRUCT_DISPATCH_ENDED& data, STRING matchId) = "0xb1a79ef7f74902ac"

STRUCT STRUCT_YACHT_ENDED
	INT m_bossId1 = -1
	INT m_bossId2 = -1
	INT m_matchId1 = -1
	INT m_matchId2 = -1
	INT m_missionId = -1
	INT m_missionTypeId = -1
	INT m_isboss = -1
	INT m_bosstype = -1
	INT m_playerrole = -1
	INT m_playerParticipated = -1
	INT m_won = -1
	INT m_launchMethod = -1             // where this mission was launched from (from blip, phoning captain, pause menu)
	INT m_endingReason = -1
	INT m_cashEarned = -1
	INT m_rpEarned = -1
	INT m_bossKilled = -1
	INT m_goonsKilled = -1
	INT m_yachtLocation = -1
	INT m_targetskilled = -1
	INT m_timetakentocomplete = -1
	INT m_playersleftinprogress = -1
	INT m_waterBombs = -1              // number of water bombs dropped(mission Bluffs on Fire)
	INT m_lockOn = -1                  // number of times the player got locked - on(mission Kraken Skulls)
ENDSTRUCT

// PURPOSE: Telemetry for Business battle ended
NATIVE PROC PLAYSTATS_YACHT_ENDED(STRUCT_YACHT_ENDED& data) = "0x114b6941bf75808d"

STRUCT STRUCT_CNC_ROUND
	INT matchId1                    //unique ID for the match, used to connect the two rounds and other metrics
	INT matchId2
	INT roundNumber                //round number
	INT team                       //cops/crooks
	INT role                       //hash, player's role
	INT gameRank                   //player's current rank in GTAO classic
	INT progRank                   //player's current CnC progression rank
	BOOL roleChange                //whether the player has changed role during this match
	INT spawnLoc                   //hash, spawn location; potentially not necessary
	INT escapeLoc                  //hash, escape variant
	INT roundStartTime             //timestamp, start of the round from when the player joined
	INT endReasonStgOne            //stage 1 end reason: ended due to time, enough cop points, player quit etc.
	INT endReasonStgTwo            //stage 2 end reason: player died, player arrested, banked money, quit, time out etc.
	INT escapeResult               //how the escape ended: Success (Escaped), CopKill (The Crook was killed by a Cop), Dead (the player died for any other reason), Arrested (The crook was arrested), TimeUp (Stage timer ran out) etc.
	INT durationStgOne             //stage 1 duration, in milliseconds; round specific, might be shorter if the player quits before the end
	INT durationStgTwo             //stage 2 duration, in milliseconds; round specific, might be shorter if the player quits before the end
	INT launchMethod               //how the player launched this, via pause menu, corona, join with friends, on boot etc.
	BOOL jip                       //whether the player joined in progress
	BOOL win                       //at the end of round 2, whether this player's team has won
	INT xpEarned                   //amount of XP earned
	INT streetCrimeCount           //on crook's round, number of street crimes the player has completed at the end of the round
	INT jobCount                   //on crook's round, number of jobs the player completed at the end of the round
	INT jobsRemaining              //jobs remaining unattempted in the round
	INT copPoints                  //number of cop points at the end of the round
	INT arrests                    //depending on team, number of times crook was arrested/ number of times cop made arrests
	INT moneyEarned                //on crook's round, money earned from street crimes and jobs; null if not applicable
	INT moneyStashed               //on crook's round, money stashed; null if not applicable
	INT moneyBanked                //on crook's round, money banked; null if not applicable
	INT crooksKilled               //crooks killed during this round
	INT copsKilled                 //cops killed during this round
	INT deaths                     //number of times the player died
	BOOL VOffender                 //whether the player was marked as a V Offender during the round
	INT incapacitations            //depending on team, number of times crook was incapacitated/ number of times cop incapacitated a crook
	INT moneyMaxHeld               //on crook's round, max amount of money held during round that has not been stashed; null if not applicable
	INT endurance                  //depending on team, amount of endurance damage received by crook or damage drained by cop
	INT spawnGroup                 //group number for the group of 4 players the player spawns with
	INT escapeTime                 //escape duration, in milliseconds; individual to the player
	INT spectateTime               //spectate mode duration, in milliseconds; individual to the player
	INT durationVehicleStgOne      //stage 1 time spent in any vehicle, in milliseconds
	INT durationVehicleStgTwo      //stage 2 time spent in any vehicle, in milliseconds
ENDSTRUCT

// PURPOSE: triggers at the end of a round 
NATIVE PROC PLAYSTATS_CNC_ROUND(STRUCT_CNC_ROUND& data) = "0x4f7fd2564eaed5a2"

STRUCT STRUCT_CNC_LOBBY
	INT matchId1                   //unique ID for the match, used to connect the two rounds and other metrics
	INT matchId2                   //unique ID for the match, used to connect the two rounds and other metrics
	INT team                       //what team does the player fall in round one, cops/crooks
	INT gameRank                   //player's current rank in GTAO classic
	INT progRank                   //player's current CnC progression rank
	INT copRole                    //hash, cop's role
	INT copWeapons                 //hash array, cop weapons: primary lethal weapon, secondary lethal weapon, throwable, melee, non lethal; will also need to take into account modkits
	INT copClothing                //hash array, cop clothing: outfit, mask
	INT copTattoos                 //hash array, cop tattoos: Head, Left Arm, Right Arm, Torso - Chest, Torso - Stomach, Torso - Back, Right Leg, Left Leg, Torso - Side
	INT copEmote                   //hash, cop emote
	INT copVehicle                 //hash array: cop vehicle, livery, modkit
	INT copAbilities               //hash array, cop abilities: special ability 1, passive ability 1, vehicle ability 1
	INT crookRole                  //hash, crook's role
	INT crookWeapons               //hash array, crook weapons: primary lethal weapon, secondary lethal weapon, throwable, melee, non lethal; will also need to take into account modkits
	INT crookClothing              //hash array, crook clothing: outfit, mask
	INT crookTattoos               //hash array, crook tattoos: Head, Left Arm, Right Arm, Torso - Chest, Torso - Stomach, Torso - Back, Right Leg, Left Leg, Torso - Side
	INT crookEmote                 //hash, crook emote
	INT crookVehicle               //hash array: crook vehicle, livery, modkit
	INT crookAbilities             //hash array, crook abilities: special ability 1, passive ability 1, vehicle ability 1
	INT endReason                  //why did the lobby end for the player (match start, exit, disconnect, lobby disbanded, lobby merge, etc.)
	INT joinFrom                   //where did they join this lobby from? (match end, lobby merge, lobby switch, main menu, join with friends, on boot etc.)
	INT copSlot					   //which slot was used for the cop loadout: either preset/custom, or slot number, depending on how this is set up
	INT crookSlot				   //which slot was used for the crook loadout: either preset/custom, or slot number, depending on how this is set up
ENDSTRUCT

// PURPOSE: triggers at the end of the lobby; the main purpose is to track the initial loadouts for both cop and crook default role
NATIVE PROC PLAYSTATS_CNC_LOBBY(STRUCT_CNC_LOBBY& data) = "0xc5f96cbd06e73bbe"

// PURPOSE: triggers after crook stashed money at a safehouse
NATIVE PROC PLAYSTATS_CNC_STASH(INT matchId1, INT matchId2, INT roundNumber, INT stashedFrom, INT safeLoc, INT amount, INT wantedLvl) = "0x1bb84b52fb2d718b"

// PURPOSE: triggers at the beginning of each round
NATIVE PROC PLAYSTATS_CNC_SAFE(INT matchId1, INT matchId2, INT roundNumber, INT &safehouse[]) = "0xa0f24832987635fb"

STRUCT STRUCT_CNC_UNLOCK
	INT item                       //hash, item bought/unlocked in the CnC shop
	INT itemType                   //hash, item type: outfit, mask, tattoo, weapon mod kit etc.
	INT itemRank                   //progression rank this item belongs to
	INT itemRole                   //hash, role this item is relevant for
	INT progRank                   //player's current CnC progression rank
	INT tknSpend                   //amount of tokens spent to buy the item
	INT tknBalance                 //token balance after the transaction is completed
	INT moneySpend                 //money spent to buy this item
	INT moneyBalance               //money balance after the transaction is completed
ENDSTRUCT

// PURPOSE: triggers after purchasing an item in the progression shop
NATIVE PROC PLAYSTATS_CNC_UNLOCK(STRUCT_CNC_UNLOCK& data) = "0xa6f2e439090f5d6a"

STRUCT STRUCT_CNC_ABILITY
	INT matchId1                   //unique ID for the match, used to connect the two rounds and other metrics
	INT matchId2				   //unique ID for the match, used to connect the two rounds and other metrics
	INT team                       //cops/crooks
	INT role                       //hash, player's role
	INT roundNumber                //round number
	INT stage                      //potentially hash; "Stash the Cash" or "the Escape"
	INT ability                    //hash, name of the ability used
	INT vehicle                    //hash, vehicle the player is in; null if not applicable
	INT wantedLvl                  //crook's wanted level
ENDSTRUCT

// PURPOSE: triggers after using an active ability
NATIVE PROC PLAYSTATS_CNC_ABILITY(STRUCT_CNC_ABILITY& data) = "0xbc247efa1bd9dbdb"

STRUCT STRUCT_CNC_INCAPACITATE
	INT matchId1                   //unique ID for the match, used to connect the two rounds and other metrics
	INT matchId2				   //unique ID for the match, used to connect the two rounds and other metrics
	INT incType                    //hash, type of incapacitation: damage from non-lethal weapons, melee weapons, vehicle ejection, vehicle collision, falling etc.
	INT crookRole                  //hash, crook's role
	INT crookProgRank              //CnC progression rank for crook
	INT crookVehicle               //hash, the vehicle the crook was in at the time; null if not applicable
	INT copId                      //cop account ID, from SCAdmin; this is the last cop that damaged the player's endurance prior to becoming incapacitated
	INT copRole                    //hash, cop's role
	INT copProgRank                //CnC progression rank for cop
	INT copWeapon                  //hash, weapon the cop player used to drain the last of the endurance, causing the incapacitation
	INT copVehicle                 //hash, the vehicle the cop was in at the time; null if not applicable
	BOOL VOffender                 //whether the crook was branded a V Offender at the time of the incapacitation
	INT wantedLvl                  //crook's wanted level
ENDSTRUCT

// PURPOSE: triggers for a crook after their endurance has been completely drained and they became incapacitated
NATIVE PROC PLAYSTATS_CNC_INCAPACITATE(STRUCT_CNC_INCAPACITATE& data) = "0x6aeba036b8703fda"

STRUCT STRUCT_CNC_JUSTICE
	INT matchId1                   //unique ID for the match, used to connect the two rounds and other metrics
	INT matchId2				   //unique ID for the match, used to connect the two rounds and other metrics
	INT roundNumber                //round number
	INT stage                      //potentially hash; "Stash the Cash" or "the Escape"
	INT crookId                    //crook account ID, from SCAdmin
	INT crookRole                  //hash, crook's role
	INT crookProgRank              //CnC progression rank for crook
	INT copRole                    //hash, cop's role
	INT copProgRank                //CnC progression rank for cop
	INT crookEndurance             //crook's remaining endurance, at the time of the arrest or kill
	BOOL VOffender                 //whether the crook was branded a V Offender at the time of the arrest
	INT cashLost                   //amount of cash the crook lost
	INT wantedLvl                  //crook's wanted level
	INT cashPenalty                //amount of cash the cop was penalized
	INT type                       //potentially hash; "Arrest" or "Kill"
ENDSTRUCT

// PURPOSE: triggers after a cop makes an arrest or kills a crook
NATIVE PROC PLAYSTATS_CNC_JUSTICE(STRUCT_CNC_JUSTICE& data) = "0xe06b603b521a57b5"

STRUCT STRUCT_CNC_WORK
	INT matchId1                   //unique ID for the match, used to connect the two rounds and other metrics
	INT matchId2				   //unique ID for the match, used to connect the two rounds and other metrics
	INT jobId                      //ID to match more than one player completing the same job; null if not applicable
	INT roundNumber                //round number
	INT role                       //hash, player's role
	INT workType                   //hash, street crime or job
	INT workName                   //hash, name of the street crime or job
	INT endReason                  //end reason: complete, died, arrested, time ran out
	INT dropOff                    //drop off location
	INT amount                     //money earned
	BOOL bonus                     //true if this was the last package dropped of a set, resulting in a cash bonus
ENDSTRUCT

// PURPOSE: triggers after a criminal activity is completed; should also trigger on jobs after a package is dropped, since presumably you could stop after one package and walk away
NATIVE PROC PLAYSTATS_CNC_WORK(STRUCT_CNC_WORK& data) = "0x4897a470c8c80f4e"

STRUCT STRUCT_CNC_SWITCH
	INT matchId1                   //unique ID for the match, used to connect the two rounds and other metrics
	INT matchId2				   //unique ID for the match, used to connect the two rounds and other metrics
	INT roundNumber                //round number
	INT prevRole                   //hash, previous role
	INT newRole                    //hash, new role
	INT newEmote                   //hash, emote
	INT slot                       //hash, which slot was the new loadout stored in: either preset/custom, or slot number, depending on how this is set up
	INT cashLost                   //cash lost when switching
ENDSTRUCT

// PURPOSE: triggers after switching roles or loadout, in the Stash the Cash stage
NATIVE PROC PLAYSTATS_CNC_SWITCH(STRUCT_CNC_SWITCH& data, INT &newWeapons[], INT &newClothing[], INT &newTattoos[], INT &newVehicle[]) = "0x891feb9d8b1a8fb8"

// PURPOSE: triggers at the end of a Stash the Cash stage
NATIVE PROC PLAYSTATS_CNC_JOBS(INT roundNumber, INT matchId1, INT matchId2, INT &jobs[]) = "0x747378dcd7ccf09f"

STRUCT STRUCT_HEIST4_PREP
	INT playthroughId              //playthrough ID, this should appear in all related content, like scopes, preps, finales and minigames, and would enable us to track an entire heist playthrough
	INT missionName                //mission name
	INT sessionId                  //session ID
	INT hashmac                    //hash mac
	INT playCount                  //number of preps completed
	INT type                       //setup/scope, vehicle prep, equipment prep, weapon prep, disruption prep
	INT bossId1                    //unique ID of the Boss instance
	INT bossId2                    //unique ID of the Boss instance
	INT bosstype                   //type of org: Securoserv, MC, unaffiliated
	INT launcherRank               //rank of the player launching
	INT playerRole                 //similar to previous metrics, the player's role: CEO, bodyguard, biker prospect etc.
	BOOL playerParticipated        //whether the player participated
	BOOL difficult                 //whether the mission has increased difficulty
	INT timeTakenToComplete        //time taken to complete, in seconds (for consistency)
	INT endingReason               //similar to previous metrics: won, lost, boss_left etc.
	BOOL isRivalParty              //is the party completing the mission the same as the party that launched it, null if not applicable
	INT cashEarned                 //money earned
	INT rpEarned                   //RP earned
	INT location                   //mission subvariation
	INT invitesSent                //invites sent
	INT invitesAccepted            //invites accepted
	INT deaths                     //how many times the player died
	INT targetsKilled              //number of mission critical/aggressive peds killed
	INT innocentsKilled            //number of innocent peds killed
	BOOL mandatory                 //true if this is a mandatory mission, false if it's optional
	INT primTar                    //what is the primary target: files, bearer bonds, diamonds etc.; null if not applicable to this mission
	INT properties                 //bitset of properties owned: casino penthouse, gunrunning bunker, smuggler hangar, terrorbyte, submarine etc.
	INT entrances                  //bitset of entrances scoped: main gate, side gate left, side gate right etc.; null if not applicable to this mission
	INT approaches                 //bitset of approaches unlocked: Stealth Chopper ? North Drop Zone, Gun Boat ? Main Docks etc.; null if not applicable to this mission
	INT grappleLoc                 //bitset of grapple equipment locations scoped; null if not applicable to this mission
	INT uniLoc                     //bitset of uniform locations scoped; null if not applicable to this mission
	INT cutterLoc                  //bitset of bolt cutter locations scoped; null if not applicable to this mission
	INT secLootLoc                 //bitset of secondary loot locations scoped: cash, weed, cocaine, gold, paintings; null if not applicable to this mission
	INT miscActions                //bitset to account for miscellaneous actions: poison water supply, enemies armour disruption, enemies helicopter disruption, power station scoped, trojan vehicle scoped, control tower scoped, golden gun drawer key, double key cards, acetylene torch; null if not applicable to this mission
	INT properties2                //bitset of type of properties owned
ENDSTRUCT

// PURPOSE: triggers after scope/setup and prep missions end for the Island Heist
NATIVE PROC PLAYSTATS_HEIST4_PREP(STRUCT_HEIST4_PREP& data) = "0x95663ae09f86ee73"

STRUCT STRUCT_HEIST4_FINALE
	INT playthroughId              //playthrough ID, this should appear in all related content, like scopes, preps, finales and minigames, and would enable us to track an entire heist playthrough
	INT missionId                  //mission name
	INT sessionId                  //session ID
	TEXT_LABEL_31 publicContentId  //public content ID
	INT hashmac                    //hash mac
	INT bossId1                    //unique ID of the Boss instance
	INT bossId2                    //unique ID of the Boss instance
	INT bosstype                   //type of org: Securoserv, MC, unaffiliated
	INT launcherRank               //rank of the player launching
	INT playerRole                 //similar to previous metrics, the player's role: CEO, bodyguard, biker prospect etc.
	INT endingReason               //similar to previous metrics: won, lost, boss_left etc.
	INT replay                     //counts how many times this mission was failed, then continued from checkpoint/restarted; resets after the player exits the mission, null if not applicable
	INT rpEarned                   //RP earned
	BOOL difficult                 //whether the mission has increased difficulty
	INT timeTakenToComplete        //time taken to complete, in seconds (for consistency)
	INT checkpoint                 //what checkpoint was the heist failed at; null if not applicable
	INT playCount                  //how many times has the player completed this mission before; first time is 1, then increments of 1 after completing finale, only success matters
	INT deaths                     //how many times the player died
	INT targetsKilled              //number of mission critical/aggressive peds killed
	INT innocentsKilled            //number of innocent peds killed
	INT properties                 //bitset of type of properties owned: casino penthouse, gunrunning bunker, smuggler hangar, terrorbyte, submarine etc.
	INT properties2                //bitset of type of properties owned; future proofing
	INT percentage                 //heist percentage of payout
	INT tod                        //time of day chosen (day, night)
	INT wLoadout                   //weapon loadout the player has picked on the board
	INT outfits                    //outfits chosen on the board
	BOOL suppressors               //whether suppressors were selected on the board
	INT supCrewBoard               //bitset of support crews selected on the planning board: airstrike, heavy weapon drop, sniper, air support, spy drone, weapon stash
	INT islApproach                //which approach the players took to infiltrate the island: Stealth Chopper ? North Drop Zone, Gun Boat ? Main Docks etc.
	INT islEscBoard                //which approach the players chose on the board to escape the island: airstrip, main docks etc.
	INT primTar                    //what is the primary target: files, bearer bonds, diamonds etc.
	INT weather                    //type of weather during the heist
	INT weapDisrup                 //level of enemy weapon disruption: none, low, medium, high
	INT supCrewActual              //bitset of support crews used during the mission: airstrike, heavy weapon drop, sniper, air support, spy drone, weapon stash
	INT miscActions                //bitset for miscellaneous actions in the finale: whether the player picked up the golden gun, whether the player picked up the SPAS 12, whether the player looted El Rubio's safe, whether the radar tower has been disabled
	INT compEntrance               //which compound entrance the players used: main gate explosion, side gate left, side gate right, rappel left etc.
	INT primTarEntrance            //which entrance the players chose to get to the primary target: elevator, underground entrance 1, underground entrance 1
	INT compExit                   //which exit from the compound the players used: main gate, side gate left etc.
	INT interestItemUsed           //bitset of equipment used during the finale, on the island: explosives, bolt cutters, side gate codes, trojan horse vehicle, uniform, rappel equipment, jailor keys, glass cutter, double keycard
	INT islEscActual               //which approach the players actually used to escape the island: airstrip, main docks etc.
	BOOL failedStealth             //whether the player failed stealth and alerted the enemies
	BOOL specCam                   //was this player in spectator cam when the mission ended
	INT moneyEarned                //total amount of money earned from the heist
	INT secLoot                    //bitset of secondary loot locations that were hit, minimum of one block stolen: cash, weed, cocaine, gold, paintings
	INT secTarCash                 //array for secondary target cash: number of blocks stolen, money value at the end of the mission, number of blocks at the end of the mission, set block value in the bag
	INT secTarCocaine              //array for secondary target cocaine: number of blocks stolen, money value at the end of the mission, number of blocks at the end of the mission, set block value in the bag
	INT secTarWeed                 //array for secondary target weed: number of blocks stolen, money value at the end of the mission, number of blocks at the end of the mission, set block value in the bag
	INT secTarGold                 //array for secondary target gold: number of blocks stolen, money value at the end of the mission, number of blocks at the end of the mission, set block value in the bag
	INT secTarPaint                //array for secondary target paintings: number of blocks stolen, money value at the end of the mission, number of blocks at the end of the mission, set block value in the bag
	INT bagCapacity                //player's total bag capacity
	INT CashBlocksStolen           //number of blocks of cash stolen
	INT CashValueFinal             //money value of cash stolen at the end of the mission 
	INT CashBlocksFinal            //number of blocks of cash held at the end of the mission
	INT CashBlocksSpace            //set block value in the bag for cash
	INT CocaBlocksStolen           //number of blocks of cocaine stolen
	INT CocaValueFinal             //money value of cocaine stolen at the end of the mission 
	INT CocaBlocksFinal            //number of blocks of cocaine held at the end of the mission
	INT CocaBlocksSpace            //set block value in the bag for cocaine
	INT WeedBlocksStolen           //number of blocks of weed stolen
	INT WeedValueFinal             //money value of weed stolen at the end of the mission 
	INT WeedBlocksFinal            //number of blocks of weed held at the end of the mission
	INT WeedBlocksSpace            //set block value in the bag for weed
	INT GoldBlocksStolen           //number of blocks of gold stolen
	INT GoldValueFinal             //money value of gold stolen at the end of the mission 
	INT GoldBlocksFinal            //number of blocks of gold held at the end of the mission
	INT GoldBlocksSpace            //set block value in the bag for gold
	INT PaintBlocksStolen          //number of blocks of paintings stolen
	INT PaintValueFinal            //money value of paintings stolen at the end of the mission 
	INT PaintBlocksFinal           //number of blocks of paintings held at the end of the mission
	INT PaintBlocksSpace           //set block value in the bag for paintings
ENDSTRUCT

// PURPOSE: triggers after the end of Island Heist finale missions
NATIVE PROC PLAYSTATS_HEIST4_FINALE(STRUCT_HEIST4_FINALE& data) = "0xa2f2a0d01db6acaf"

// PURPOSE: triggers at the end of the hacking minigames in the Island Heist
NATIVE PROC PLAYSTATS_HEIST4_HACK(INT playthroughId, INT minigame, BOOL won, INT istep, INT time) = "0x4f4c481abe5088bc"

// PURPOSE: triggers after the player has left the console for controlling the anti-aircraft missiles, remote-guided missiles and torpedoes
NATIVE PROC PLAYSTATS_SUB_WEAP(INT weapon, BOOL ownSub, INT projectileCount, INT kills) = "0x1000df2eb45e521c"

// PURPOSE: triggers after the player uses the submarine menu to fast travel
NATIVE PROC PLAYSTATS_FAST_TRVL(INT startLoc, FLOAT startX, FLOAT startY, FLOAT startZ, INT endLoc, FLOAT endX, FLOAT endY, FLOAT endZ, INT type) = "0xbe608f8c2140bdfd"

STRUCT STRUCT_HUB_ENTRY
	INT type                       //which social hub is the player in: casino nightclub, beach party
	INT properties                 //bitset of the properties owned
	INT access                     //which access route did the player use: main door, elevator etc.
	INT cost                       //price of entrance, should be 0 if free
	INT bossId1                    //unique ID of the Boss instance
	INT bossId2                    //unique ID of the Boss instance
	INT playerRole                 //similar to previous metrics, the player's role: CEO, bodyguard, biker prospect etc.
	BOOL bpulled                   //whether this player was pulled into the social hub (via IM, for example)
	BOOL binvited                  //whether this player joined by accepting an invite
	INT properties2                //bitset of type of properties owned
	INT vehicle				 	   // hash of the player-driven vehicle
	INT crewId				  	   // ID of the social club crew the player belongs to
	BOOL private				   // instance of social hub is private
	INT vehicleType		           // hash of whether the vehicle driven is a personal vehicle, another player's personal vehicle, generic test drive vehicle or Hao's premium vehicle
	INT hubId					   // ID that applies to this instance of the social hub; would be the same for those players inside the social hub
ENDSTRUCT

// PURPOSE: triggers after the player enters a social hub, meaning the Casino Nightclub and the beach party; does not include the After Hours Nightclub (we can look at adding this at a later date if needed)
NATIVE PROC PLAYSTATS_HUB_ENTRY(STRUCT_HUB_ENTRY& data) = "0x61bb55e2dd91d18b"

STRUCT STRUCT_DJ_MISSION_ENDED
	INT missionTypeId              //mission name
	INT missionId                  //mission ID
	INT matchId                    //match ID
	INT bossId1                    //unique ID of the Boss instance
	INT bossId2                    //unique ID of the Boss instance
	INT bosstype                   //type of org: Securoserv, MC, unaffiliated
	INT playerRole                 //similar to previous metrics, the player's role: CEO, bodyguard, biker prospect etc.
	INT launcherRank               //rank of the player launching
	INT location                   //subvariation
	INT playerParticipated         //whether the player participated
	BOOL won                       //whether the mission was completed successfully
	INT endingReason               //similar to previous metrics: won, lost, boss_left etc.
	INT timeTakenToComplete        //time taken to complete, in seconds (for consistency)
	INT cashEarned                 //money earned
	INT rpEarned                   //RP earned
	INT chipsEarned                //amount of chips earned
	INT itemEarned                 //hash of item earned (t-shirt, vehicle etc.)
	INT targetsKilled              //number of mission critical/aggressive peds killed
	INT innocentsKilled            //number of innocent peds killed
	INT deaths                     //how many times the player died
	INT bottlesDelivered           //amount of tequila/champagne delivered
ENDSTRUCT

// PURPOSE: triggers after an Island Heist DJ mission has ended
NATIVE PROC PLAYSTATS_DJ_MISSION_ENDED(STRUCT_DJ_MISSION_ENDED& data) = "0xa0ee58df5f161a36"

/////////////////////////////////////////////////////////////////////////////// TUNER PACK

STRUCT STRUCT_ROBBERY_PREP
	INT playthroughID              //playthrough ID, this should appear in all related content for a strand, like preps and finale, and would enable us to track an entire strand playthrough
	INT missionName                //mission name
	INT sessionID                  //session ID
	INT strandID                   //active strand
	INT type                       //setup, prep
	INT bossId1                    //unique ID of the Boss instance
	INT bossId2                    //unique ID of the Boss instance
	INT bosstype                   //type of org: Securoserv, MC, unaffiliated
	INT launcherRank               //rank of the player launching
	INT playerRole                 //similar to previous metrics, the player's role: CEO, bodyguard, biker prospect etc.
	BOOL playerParticipated        //whether the player participated
	INT timeTakenToComplete        //time taken to complete, in seconds (for consistency)
	INT timeLimit                  //time limit, in seconds (for consistency); null if not applicable
	INT endingReason               //similar to previous metrics: won, lost, boss_left etc.
	BOOL isRivalParty              //is the party completing the mission the same as the party that launched it; null if not applicable
	INT cashEarned                 //money earned
	INT rpEarned                   //RP earned
	INT location                   //mission subvariation
	INT invitesSent                //invites sent
	INT invitesAccepted            //invites accepted
	INT deaths                     //how many times the player died
	INT targetsKilled              //number of mission critical/aggressive peds killed
	INT innocentsKilled            //number of innocent peds killed
	INT properties                 //existing bitset of type of properties owned: casino penthouse, gunrunning bunker, smuggler hangar, terrorbyte, submarine etc.
	INT properties2                //bitset of type of properties owned; future proofing
	BOOL failedStealth             //whether the player failed stealth and alerted the enemies
	INT deliveryLocation           //delivery location
	INT hashmac                    //hash mac
	INT vehicleStolen              //hash, stolen vehicle in Sewer Schematics, Meth Tanker
	INT vehicleCount               //count of vehicles delivered in Warehouse Defenses
	INT outfits                    //outfits used, if any, relevant for Scope Transporter, Container Manifest; null otherwise
	INT entrance                   //entrance, relevant for Locate Bunker; null otherwise
	INT missionCategory			   // which set of missions these are (tuner robberies, fixer story missions etc.)
	BOOL won					   // whether the mission was completed successfully
ENDSTRUCT

// PURPOSE: triggers after a Tuner Robbery setup/prep mission has ended
NATIVE PROC PLAYSTATS_ROBBERY_PREP(STRUCT_ROBBERY_PREP& data) = "0xdd14b13c611c2a72"

STRUCT STRUCT_ROBBERY_FINALE
	INT playthroughID              //playthrough ID, this should appear in all related content for a strand, like preps and finale, and would enable us to track an entire strand playthrough
	INT missionID                  //mission name
	INT sessionID                  //session ID
	INT strandID                   //active strand
	TEXT_LABEL_31 publicContentID  //public content ID
	INT bossId1                    //unique ID of the Boss instance
	INT bossId2                    //unique ID of the Boss instance
	INT bosstype                   //type of org: Securoserv, MC, unaffiliated
	INT launcherRank               //rank of the player launching
	INT playerRole                 //similar to previous metrics, the player's role: CEO, bodyguard, biker prospect etc.
	INT endingReason               //ending reason
	INT replay                     //counts how many times this mission was failed, then continued from checkpoint/restarted; resets after the player exits the mission, null if not applicable
	INT rpEarned                   //RP earned
	INT timeTakenToComplete        //time taken to complete, in seconds (for consistency)
	INT checkpoint                 //what checkpoint was the mission failed at; null if not applicable
	INT deaths                     //how many times the player died
	INT targetsKilled              //number of mission critical/aggressive peds killed
	INT innocentsKilled            //number of innocent peds killed
	INT properties                 //existing bitset of type of properties owned: casino penthouse, gunrunning bunker, smuggler hangar, terrorbyte, submarine etc.
	INT properties2                //bitset of type of properties owned; future proofing
	BOOL failedStealth             //whether the player failed stealth and alerted the enemies
	INT wLoadout                   //weapon loadout the player has picked on the board
	INT outfits                    //outfits chosen on the board
	INT moneyEarned                //total amount of money earned from the heist
	INT vehicleBoard               //hash, car chosen on the planning board
	INT hashmac                    //hash mac
	INT missionCategory		       // which set of missions these are (tuner robberies, fixer story missions etc.)
	BOOL won					   // whether the mission was completed successfully
ENDSTRUCT

// PURPOSE: triggers after a Tuner Robbery finale mission has ended
NATIVE PROC PLAYSTATS_ROBBERY_FINALE(STRUCT_ROBBERY_FINALE& data) = "0xe0ee314a99919d15"

STRUCT STRUCT_EXTRA_EVENT
	INT missionName                //mission name
	INT pursuer                    //type of pursuer: phantom car, psycho, clown etc.
	INT sessionID                  //session ID
	INT endingReason               //reason for the event ending: player went inside interior, died, time ran out etc.
	BOOL onFoot                    //whether the player was on foot
	INT time                       //time until the event ended, in milliseconds
	INT timeLimit                  //max time the event can last, in milliseconds
	FLOAT pursuerHealth            //or int, amount of health left for the pursuer
ENDSTRUCT

// PURPOSE: triggers at the end of special events, in this case Halloween events phantom car and slashers, when the pursuer despawns
NATIVE PROC PLAYSTATS_EXTRA_EVENT(STRUCT_EXTRA_EVENT& data) = "0xbf65cdc22b435e64"

STRUCT STRUCT_CARCLUB_POINTS
	INT boss_id1                    //unique ID of the Boss/organization
	INT boss_id2                    //unique ID of the Boss/organization
	INT match_id                   //match ID
	INT method                     //hash, reason for earning points: item bought, first time bonus, complete mission etc.
	INT amount                     //number of points earned
	INT itemBought                 //hash, item bought that awarded Car Club reputation
	INT streak                     //streak count for visiting the the Car Club
	INT memberLevel                //membership level
	BOOL levelUp                   //whether the player has just leveled up their membership
ENDSTRUCT

// PURPOSE: triggers after the player earns Car Club reputation to level up their membership
NATIVE PROC PLAYSTATS_CARCLUB_POINTS(STRUCT_CARCLUB_POINTS& data) = "0x533e3fa298cc9b99"


// PURPOSE: triggers after a step of the weekly vehicle challenge has been completed
NATIVE PROC PLAYSTATS_CARCLUB_CHALLENGE(INT missionName, INT numGoalsCompleted, INT numGoalsRequired, INT memberLevel) = "0x3ad2a952db41e956"

// PURPOSE: triggers after the player claims the prize car earned for completing the weekly challenge
NATIVE PROC PLAYSTATS_CARCLUB_PRIZE(INT missionName, INT vehicle) = "0x2fc88162813e5509"

// PURPOSE: triggers after closing the Pause Menu, if the player viewed any of the membership pages for two seconds minimum.
NATIVE PROC PLAYSTATS_PM_NAV(INT pageView, INT leftBy, INT duration) = "0xe7cbbe6c2462c51c"

// PURPOSE: triggers after closing Pause Menu>Stats, currently only for Fixer awards.
NATIVE PROC PLAYSTATS_AWARD_NAV(INT fixerView1, INT fixerDone1) = "0x70f52471e758ebae"

STRUCT STRUCT_FM_MISSION_END
        INT m_groupID              // group ID; this would enable us to track those players who play this mission together
        INT m_missionCategory      // which set of missions these are (security contracts, payphone hits etc.)
        INT m_missionName          // mission name
        INT m_sessionID            // session ID
        INT m_type                 // type of mission, for example, normal or VIP security contracts
        INT m_location             // mission variation
        INT m_launchMethod         // launch method
		INT bossId1                // unique ID of the Boss instance
		INT bossId2                // unique ID of the Boss instance
        INT m_bosstype             // type of org: Securoserv, MC, unaffiliated
        INT m_launcherRank         // rank of the player launching
        INT m_playerRole           // similar to previous metrics, the player's role: CEO, bodyguard, biker prospect etc.
        BOOL m_playerParticipated  // whether the player participated
        INT m_timeTakenToComplete  // time taken to complete, in seconds, for consistency
        INT m_timeLimit            // time limit, in seconds (for consistency); null if not applicable
        BOOL m_won                 // whether the mission was completed successfully
        INT m_endingReason         // similar to previous metrics: won, lost, boss_left etc.
        BOOL m_isRivalParty        // is the party completing the mission the same as the party that launched it; null if not applicable
        INT m_cashEarned           // money earned
        INT m_rpEarned             // RP earned
        INT m_deaths               // how many times the player died
        INT m_targetsKilled        // number of mission critical/aggressive peds killed
        INT m_innocentsKilled      // number of innocent peds killed
        INT m_properties           // existing bitset of type of properties owned: casino penthouse, gunrunning bunker, smuggler hangar, terrorbyte, submarine etc.
        INT m_properties2          // bitset of type of properties owned; future proofing
        BOOL m_failedStealth       // whether the player failed stealth and alerted the enemies
        INT m_difficulty           // mission difficulty: easy, normal, hard, hardest
        INT m_bonusKillMethod      // bonus kill method needed on this mission (payphone hits): taxi, golf outfit etc.; null if not applicable
        INT m_bonusKillComplete    // whether the player completed the bonus kill for this mission; null if not applicable
ENDSTRUCT

// PURPOSE: triggers after the player has finished a freemode missions, instanced missions and not heist missions
NATIVE PROC PLAYSTATS_FM_MISSION_END(STRUCT_FM_MISSION_END& data, INT &availMis[], INT &availMisDif[]) = "0x46a70777be6ceab9"
STRUCT STRUCT_INST_MISSION_END
	INT groupID                   // group ID; this would enable us to track those players who play this mission together
	INT missionCategory           // which set of missions these are; for now, Franklin and Lamar short trips
	INT missionName               // mission name
	INT sessionID                 // session ID
	INT type                      // type of mission
	INT location                  // mission variation
	INT launchMethod              // launch method
	TEXT_LABEL_31 publicContentID // public content ID
	INT bossId1                   // unique ID of the Boss instance
	INT bossId2                   // unique ID of the Boss instance
	INT bosstype                  // type of org: Securoserv, MC, unaffiliated
	INT launcherRank              // rank of the player launching
	INT playerRole                // similar to previous metrics, the player's role: CEO, bodyguard, biker prospect etc.
	INT timeTakenToComplete       // time taken to complete, in seconds (for consistency)
	INT timeLimit                 // time limit, in seconds (for consistency); null if not applicable
	BOOL won                      // whether the mission was completed successfully
	INT endingReason              // ending reason
	INT cashEarned                // money earned
	INT rpEarned                  // RP earned
	INT deaths                    // how many times the player died
	INT targetsKilled             // number of mission critical/aggressive peds killed
	INT innocentsKilled           // number of innocent peds killed
	INT properties                // existing bitset of type of properties owned: casino penthouse, gunrunning bunker, smuggler hangar, terrorbyte, submarine etc.
	INT properties2               // bitset of type of properties owned; future proofing
	BOOL failedStealth            // whether the player failed stealth and alerted the enemies
	INT difficulty                // mission difficulty
	INT playerCount               // number of players currently on this mission
ENDSTRUCT
// PURPOSE: triggers after instanced missions end, starting with the Fixer pack; this is not meant for competitive modes
NATIVE PROC PLAYSTATS_INST_MISSION_END(STRUCT_INST_MISSION_END& data) = "0xfea3f7e83c0610fa"

STRUCT STRUCT_HUB_EXIT
	INT hubID       // ID that applies to this instance of the social hub; would be the same for those players inside the social hub
	INT type        // which social hub the player left: music studio, smoking room etc.
	INT bossId1     // unique ID of the Boss instance
	INT bossId2     // unique ID of the Boss instance
	INT playerRole  // similar to previous metrics, the player's role: CEO, bodyguard, biker prospect etc.
	INT pulled      // whether this player was pulled out of the social hub (by a mission starting, for example)
	INT crewId      // ID of the Social Club Crew the player belongs to
	INT duration    // time spent in the social hub
	BOOL dre        // whether Dr Dre was present in the social hub
	INT playerCount // number of players in the social hub when exiting
ENDSTRUCT

// PURPOSE: triggers after the player exits a social hub (music studio and smoking room to begin with, can expand for rest of hubs covered by HUB_ENTRY later, if needed)
NATIVE PROC PLAYSTATS_HUB_EXIT(STRUCT_HUB_EXIT& data) = "0x5a46ace5c4661132"
STRUCT STRUCT_LP_NAV
	INT tab                        //hash, what tab the player left (online, story, create, heists, series modes etc.)
	INT hoverTile                  //bitset, location of tiles the player hovered over
	INT leftBy                     //hash, means by which the player left the current tab: tabbing away, going back, clicking a tile, going to the store, going to settings, loading into MP/SP etc.
	INT clickedTile                //hash, tile that was clicked to leave the tab; ideally it would have similar values to LP_ONLINE/LP_STORY/LP_CREATE/LP_PERSIST, either location or content, to connect the two
	BOOL exitLp                    //true when leaving the landing page area
ENDSTRUCT

// PURPOSE: triggers after the player leaves a tab, with a record of what they viewed on that tab, provided they spent X milliseconds on it, set by tunable, to prevent spamming (I'd say start with 5 seconds); triggers regardless of time spent when leaving the landing page altogether. Additional tunable for percentage of players sending the metric.
NATIVE PROC PLAYSTATS_LP_NAV(STRUCT_LP_NAV& data) = "0x88e31379119430b6"

// PURPOSE: triggers after a UGC tool is launched
NATIVE PROC PLAYSTATS_UGC_NAV(INT feature, INT location) = "0x9a387654cd8f86fc"

// Summer 2022

// PURPOSE: triggers after a vehicle is removed from the player's inventory
NATIVE PROC PLAYSTATS_VEH_DEL(INT bossId1, INT bossId2, INT bossType, INT vehicleID, INT reason) = "0xee1db1f96b06dda7"

STRUCT STRUCT_INVENTORY
	INT action                     //was the item added to or removed from the inventory
	INT reason                     //hash, reason for adding/removing: purchase, pick-up, use, drop etc.
	INT crewId                     //ID of the Social Club Crew the player belongs to
	INT location                   //hash, exact location where the item was purchased (which office, which arcade etc.); null if not applicable
	INT shopType                   //hash, "shop" type the item was acquired from: vending machine, office desk, convenience store etc.; null if not applicable
	INT itemCategory               //hash, the item category: snack, armor
	INT itemHash                   //hash, the item added/removed
	INT itemDelta                  //number of items of this type added/removed
	INT purchaseID                 //ID to link the purchases made in the same transaction
	BOOL takeAll                   //whether the player used the option to take all of the items of that type
ENDSTRUCT

// PURPOSE: Triggers after a snack or armor item type are added to the inventory, removed from the inventory, or consumed outwith the inventory (vending machines, bars etc.). Would trigger each time the item type changes, or after X seconds from the change (set by tunable) that allows for the case where the player hits "buy", "drop" or "use" repeatedly.
NATIVE PROC PLAYSTATS_INVENTORY(STRUCT_INVENTORY& data) = "0x887dad63cf5b7908"

STRUCT STRUCT_MAP_NAV
	INT TUBlips                    // bitset of TU blips rolled over
	INT cloudMissBlips             // bitset of cloud missions blips rolled over
	INT seriesBlips                // bitset of series blips rolled over
	INT collectBlips               // bitset of collectible blips rolled over
	INT rank                       // current rank
	INT leftBy                     // hash, means by which the player left the pause menu map: going back, selecting to join a lobby
	INT waypoint                   // hash, blip that the player selected as a waypoint
ENDSTRUCT

// PURPOSE: triggers when the pause menu map is closed, provided the player spent X milliseconds on it (set by tunable).
NATIVE PROC PLAYSTATS_MAP_NAV(STRUCT_MAP_NAV& data) = "0x3dba6d27e8822127"

// Eof


