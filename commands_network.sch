USING "commands_graphics.sch"	//	For PHOTO_OPERATION_STATUS
USING "commands_player.sch"
USING "commands_script.sch"
USING "script_maths.sch"
USING "types.sch"
USING "weapon_enums.sch"
USING "presence_enum.sch"

CONST_INT QUERY_CRITERIA_ANY  -1

CONST_INT MAX_NUMBER_OF_GAME_OPTIONS 10
CONST_INT MAX_NUMBER_OF_VALUES_TO_STORE_FOR_NETWORK_GAME 10
CONST_INT MAX_PARTY_MEMBERS 32
CONST_INT MAX_FOUND_GAMERS 32
CONST_INT MAX_GAMER_STATUS 100
CONST_INT RLSC_LANGUAGE_ENGLISH 1

//PURPOSE: Game options - these should not be set to QUERY_CRITERIA_ANY
ENUM NETWORK_GAME_OPTIONS_BASIC
	GAME_OPTION_BASIC_GAME_MODE,
	GAME_OPTION_BASIC_IS_RANKED,
	GAME_OPTION_BASIC_NUM_SLOTS,
	GAME_OPTION_BASIC_NUM_PRIV_SLOTS,
	GAME_OPTION_BASIC_EPISODE,
	GAME_OPTION_BASIC_TEAM_GAME,
	GAME_OPTION_BASIC_NUM_OPTIONS
ENDENUM

// Status returned from PROFILE STATS READ operation.
ENUM NETWORK_PROFILE_STATS_STATUS
	NET_PS_IDLE,
	NET_PS_PENDING,
	NET_PS_SUCCESS,
	NET_PS_FAILED	
ENDENUM


//PURPOSE: Game options - these should not be set to QUERY_CRITERIA_ANY
ENUM NETWORK_ROS_PRIVILEGEID
    RLROS_PRIVILEGEID_NONE                  = 0,    //Unused
    RLROS_PRIVILEGEID_CREATE_TICKET         = 1,    //Can create ROS tickets
    RLROS_PRIVILEGEID_PROFILE_STATS_WRITE   = 2,    //Can write profile stats
    RLROS_PRIVILEGEID_MULTIPLAYER           = 3,    //Can participate in MP sessions (currently not used)
    RLROS_PRIVILEGEID_LEADERBOARD_WRITE     = 4,    //Can write to leaderboards (currently not used)
    RLROS_PRIVILEGEID_CLOUD_STORAGE_READ    = 5,    //Can write to cloud storage
    RLROS_PRIVILEGEID_CLOUD_STORAGE_WRITE   = 6,    //Can read from cloud storage
    RLROS_PRIVILEGEID_BANNED                = 7,    //Denies all other privileges except CREATE_TICKET
    RLROS_PRIVILEGEID_CLAN                  = 8,    //Can use clan functions
    RLROS_PRIVILEGEID_PRIVATE_MESSAGING     = 9,    //Can use private messaging system
    RLROS_PRIVILEGEID_SOCIAL_CLUB           = 10,   //Can login to SC site, and TBD other functionality
    RLROS_PRIVILEGEID_PRESENCE_WRITE        = 11,   //Can update presence
    RLROS_PRIVILEGEID_DEVELOPER             = 12,   //If true, user is considered a developer
	RLROS_PRIVILEGEID_HTTP_REQUEST_LOGGING	= 13,   //If true, user's HTTP request log to SCS gameservices and cloud is logged
	RLROS_PRIVILEGEID_UGCWRITE				= 14,	//If true, allows writing UGC
	RLROS_PRIVILEGEID_PURCHASEVC			= 15,	//If true, allows purchasing virtual currency
	RLROS_PRIVILEGEID_TRANSFERVC			= 16,	//If true, allows transferring virtual currency
    RLROS_PRIVILEGEID_CANBET                = 17,   //If true, player can place bets
    RLROS_PRIVILEGEID_CREATORS              = 18,   //If true, player can access the creators
    RLROS_PRIVILEGEID_CLOUD_TUNABLES        = 19,   //If true, player can download the cloud tunables
    RLROS_PRIVILEGEID_CHEATER_POOL          = 20,   //If true, player is in the cheater pool
    RLROS_PRIVILEGEID_COMMENTWRITE          = 21,   //If true, user can create comments
    RLROS_PRIVILEGEID_CANUSELOTTERY         = 22,   //If true, player can buy lottery tickets
    RLROS_PRIVILEGEID_ALLOW_MEMBER_REDIRECT = 23,   //If true, player should run member space re-directs
	RLROS_PRIVILEGEID_PLAYED_LAST_GEN        = 24,   //If true, grant played last gen privilege
	RLROS_PRIVILEGEID_UNLOCK_SPECIAL_EDITION = 25,   //If true, grant special edition content
	RLROS_NUM_PRIVILEGEID
ENDENUM

ENUM NETWORK_SCRIPT_STATE
	NETSCRIPT_NOT_ACTIVE,
	NETSCRIPT_JOINING,
	NETSCRIPT_PLAYING,
	NETSCRIPT_TERMINATED,
	NETSCRIPT_FAILED_SESSION_FULL,
	NETSCRIPT_FAILED_NO_JOIN_IN_PROGRESS,
	NETSCRIPT_FAILED_TEAM_FULL
ENDENUM

///PURPOSE: Enum describing reasons for NETWORK_CAN_ACCESS_MULTIPLAYER
ENUM MULTIPLAYER_ACCESS_CODE
    ACCESS_GRANTED, 
    ACCESS_DENIED_TUNABLE_NOT_FOUND,
    ACCESS_DENIED_TUNABLE_FALSE,
    ACCESS_DENIED_NETWORK_LOCKED,
    ACCESS_DENIED_INVALID_PROFILE_SETTINGS,
    ACCESS_DENIED_PROLOGUE_INCOMPLETE,
    ACCESS_DENIED_NOT_SIGNED_IN,
    ACCESS_DENIED_NOT_SIGNED_ONLINE,
    ACCESS_DENIED_NO_ONLINE_PRIVILEGE,
    ACCESS_DENIED_NO_SCS_CREDENTIALS,
    ACCESS_DENIED_NO_SCS_PRIVILEGE,
    ACCESS_DENIED_MULTIPLAYER_DISABLED,
    ACCESS_DENIED_NO_TUNABLES,
    ACCESS_DENIED_NO_BACKGROUND_SCRIPT
ENDENUM

///PURPOSE: NAT types.
ENUM NET_NAT_TYPE
    NET_NAT_UNKNOWN,
    NET_NAT_OPEN,
    NET_NAT_MODERATE,
    NET_NAT_STRICT,
    NET_NAT_NUM_TYPES
ENDENUM

//PURPOSE: Matchmaking Value type
ENUM MATCHMAKING_VALUE
	MM_ATTR_AIM_TYPE
ENDENUM

//PURPOSE: Matchmaking Query type
ENUM MATCHMAKING_QUERY_TYPE
	MQ_FRIENDS,
    MQ_SOCIAL,
    MQ_PLATFORM
ENDENUM

//PURPOSE: Matchmaking
ENUM MATCHMAKING_QUERY
	MQ_GENERAL,
	MQ_CNC
ENDENUM

//PURPOSE: Network start session type.
ENUM NETWORK_AUTO_START_TYPE
	AUTOSTART_NONE,
	AUTOSTART_JOIN_MATCH,
	AUTOSTART_JOIN_ROOM,
	AUTOSTART_HOST,
	AUTOSTART_SEAMLESS
ENDENUM

//PURPOSE: Matchmaking groups. Groups within the maximum player pool. 
ENUM MATCHMAKING_GROUP
	MM_GROUP_FREEMODER,
	MM_GROUP_COP,
	MM_GROUP_VAGOS,
	MM_GROUP_LOST,
	MM_GROUP_SCTV
ENDENUM

//PURPOSE: For privilege functions taking gamer index
CONST_INT GAMER_INDEX_EVERYONE -3
CONST_INT GAMER_INDEX_ANYONE -2
CONST_INT GAMER_INDEX_LOCAL -1

//PURPOSE: Privilege Check Type
ENUM PRIVILEGE_CHECK
	PC_EVERYONE,
	PC_FRIENDS
ENDENUM

//PURPOSE: structure for storing option values
STRUCT NETWORK_GAME_STRUCTURE
	INT options[MAX_NUMBER_OF_GAME_OPTIONS]
ENDSTRUCT

//PURPOSE: structure for storing miscellaneous script globals that need carried across to next multiplayer session
STRUCT SCRIPT_VALUES_FOR_NETWORK_GAME
	INT values[MAX_NUMBER_OF_VALUES_TO_STORE_FOR_NETWORK_GAME]
ENDSTRUCT

//Except for PED_CLASSIFICATION_ANY These enums must be the same ePedType in PedTypes.h
ENUM PED_CLASSIFICATION
	PED_CLASSIFICATION_CIVMALE=0,
	PED_CLASSIFICATION_CIVFEMALE,
	PED_CLASSIFICATION_COP,
	PED_CLASSIFICATION_GANG_ALBANIAN,		
	PED_CLASSIFICATION_GANG_BIKER_1,
	PED_CLASSIFICATION_GANG_BIKER_2,
	PED_CLASSIFICATION_GANG_ITALIAN,
	PED_CLASSIFICATION_GANG_RUSSIAN,
	PED_CLASSIFICATION_GANG_RUSSIAN_2,
	PED_CLASSIFICATION_GANG_IRISH,
	PED_CLASSIFICATION_GANG_JAMAICAN,
	PED_CLASSIFICATION_GANG_AFRICAN_AMERICAN,		
	PED_CLASSIFICATION_GANG_KOREAN,
	PED_CLASSIFICATION_GANG_CHINESE_JAPANESE,	
	PED_CLASSIFICATION_GANG_PUERTO_RICAN,			
	PED_CLASSIFICATION_DEALER,
	PED_CLASSIFICATION_MEDIC,
	PED_CLASSIFICATION_FIRE,
	PED_CLASSIFICATION_CRIMINAL,
	PED_CLASSIFICATION_BUM,
	PED_CLASSIFICATION_PROSTITUTE,
	PED_CLASSIFICATION_SPECIAL,
	PED_CLASSIFICATION_MISSION,
	PED_CLASSIFICATION_SWAT,
	PED_CLASSIFICATION_ANY
ENDENUM

ENUM RESPAWN_QUERY_FLAGS
	RESPAWN_QUERY_FLAG_DEFAULT							= 0,
	// instructs query to ignore the target position; returned headings will be in any direction, but facing away from walls if possible
	RESPAWN_QUERY_FLAG_IGNORE_TARGET_HEADING			= 2,
	// prefer positions which are closer to the origin position passed in
	RESPAWN_QUERY_FLAG_PREFER_CLOSE_TO_SPAWN_ORIGIN		= 4,
	// allow spawn points to be chosen in interiors
	RESPAWN_QUERY_FLAG_MAY_SPAWN_IN_INTERIOR			= 8,
	// allow spawn points to be chosen in exterior (main map) locations
	RESPAWN_QUERY_FLAG_MAY_SPAWN_IN_EXTERIOR			= 16,
	// prefer spawn points with wider fovs
	RESPAWN_QUERY_FLAG_PREFER_WIDE_FOV					= 32,
	// prefer spawn points closer to friendly bunches and farther away from enemy bunches
	RESPAWN_QUERY_FLAG_PREFER_TEAM_BUNCHING				= 64,
	// prefer spawn points away from enemy players
	RESPAWN_QUERY_FLAG_PREFER_ENEMY_PLAYERS_FARTHER		= 128,
	// prefer spawn points closer to friendly players (but not too close)
	RESPAWN_QUERY_FLAG_PREFER_FRIENDLY_PLAYERS_CLOSER	= 256,
	// prefer spawn points away from enemy ai
	RESPAWN_QUERY_FLAG_PREFER_ENEMY_AI_FARTHER			= 512,
	// prefer spawn points closer to friendly ai (but not too close)
	RESPAWN_QUERY_FLAG_PREFER_FRIENDLY_AI_CLOSER		= 1024,
	// adds a bit of randomness
	RESPAWN_QUERY_FLAG_PREFER_RANDOMNESS				= 2048
ENDENUM

ENUM RESPAWN_RESULT_FLAGS
	RESPAWN_RESULT_FLAG_DEFAULT							= 0,
	// spawn point is on pavement
	RESPAWN_RESULT_FLAG_PAVEMENT						= 1,
	// spawn point is in an interior
	RESPAWN_RESULT_FLAG_INTERIOR						= 2
ENDENUM

ENUM RESPAWN_QUERY_RESULTS
	RESPAWN_QUERY_RESULTS_FAILED			= 0,
	RESPAWN_QUERY_RESULTS_SUCCEEDED 		= 1,
	RESPAWN_QUERY_RESULTS_STILL_WORKING		= 2,
	RESPAWN_QUERY_RESULTS_NO_SEARCH_ACTIVE	= 3
ENDENUM

// for NETWORK_BROADCAST_FRIEND_MSG
ENUM FRIENDMSG_TYPE
	FRIENDMSG_TYPE_TEXTLABEL=0,
	FRIENDMSG_TYPE_TEXTLABEL_WITH_INT
ENDENUM

// for NETWORK_GET_GAME_REGION
ENUM RL_GAME_REGION
	RL_GAME_REGION_INVALID = -1,
    RL_GAME_REGION_AMERICA,
    RL_GAME_REGION_EUROPE,
    RL_GAME_REGION_JAPAN
ENDENUM

// for UGC This must match eUserGeneratedContentType in commands_network.cpp
ENUM UGC_TYPE
	UGC_TYPE_GTA5_MISSION = 0,
	UGC_TYPE_GTA5_MISSION_PLAYLIST,
	UGC_TYPE_GTA5_LIFE_INVADER_POST,
	UGC_TYPE_GTA5_PHOTO,
	UGC_TYPE_GTA5_CHALLENGE
ENDENUM

FUNC STRING GET_UGC_TYPE_STRING(UGC_TYPE nType) 
        SWITCH nType 
                CASE UGC_TYPE_GTA5_MISSION				RETURN "gta5mission" 
                CASE UGC_TYPE_GTA5_MISSION_PLAYLIST		RETURN "playlist" 
                CASE UGC_TYPE_GTA5_LIFE_INVADER_POST	RETURN "lifeinvaderpost" 
                CASE UGC_TYPE_GTA5_PHOTO				RETURN "photo" 
                CASE UGC_TYPE_GTA5_CHALLENGE			RETURN "challenge" 
        ENDSWITCH 
        RETURN "gta5mission" 
ENDFUNC 

ENUM UGC_CATEGORY
	UGC_CATEGORY_NONE,
	UGC_CATEGORY_ROCKSTAR_CREATED,
	UGC_CATEGORY_ROCKSTAR_CREATED_CANDIDATE,
	UGC_CATEGORY_ROCKSTAR_VERIFIED,
	UGC_CATEGORY_ROCKSTAR_VERIFIED_CANDIDATE,
	UGC_CATEGORY_ROCKSTAR_COMMUNITY,
	UGC_CATEGORY_ROCKSTAR_COMMUNITY_CANDIDATE
ENDENUM

STRUCT UGC_DATE
	INT nYear	// YYYY, e.g. 1981 or 2013
	INT nMonth	// 1-12
	INT nDay	// 1-31
	INT nHour	// 0-23
	INT nMinute	// 0-59
	INT nSecond	// 0-59
ENDSTRUCT

ENUM UGC_ERROR
	UGC_ERROR_UNEXPECTED_RESULT = -1,				
	UGC_ERROR_NONE = 0,                     
	UGC_ERROR_AUTHENTICATIONFAILED_TICKET,
	UGC_ERROR_DOESNOTEXIST_CONTENT,
	UGC_ERROR_DOESNOTEXIST_PUBLISHER,
	UGC_ERROR_INVALIDARGUMENT_CLOUDABSPATH,
	UGC_ERROR_INVALIDARGUMENT_CONTENTID,
	UGC_ERROR_INVALIDARGUMENT_CONTENTNAME,
	UGC_ERROR_INVALIDARGUMENT_CONTENTTYPE,  
	UGC_ERROR_INVALIDARGUMENT_ONLINESERVICE,
	UGC_ERROR_INVALIDARGUMENT_TAGS,
	UGC_ERROR_INVALIDARGUMENT_TITLEINFO,
	UGC_ERROR_INVALIDARGUMENT_USERID,
	UGC_ERROR_NOTALLOWED_MAXCREATED,
	UGC_ERROR_NOTALLOWED_NOTCONTENTOWNER,
	UGC_ERROR_NOTALLOWED_NOTLATEST,
	UGC_ERROR_NOTALLOWED_PROFANE,
	UGC_ERROR_NOTALLOWED_RESERVEDWORD,
	UGC_ERROR_OUTOFRANGE_CONTENTTYPE
ENDENUM

CONST_INT NUM_TEXTLABELS_IN_UGC_DESCRIPTION 8

STRUCT UGC_DESCRIPTION
	TEXT_LABEL_63	TextLabel[NUM_TEXTLABELS_IN_UGC_DESCRIPTION]
ENDSTRUCT

// Keep enum in sync with NetworkHasherUtil.h
// Used to perform CRC checks between players. On each system check we need to define what part of it is being compared. 
// For instance, for a Weapons system only one weapon will be compared {system=CRC_ITEM_INFO_DATA, subsystem=hash(weaponName)}.
// That's defined as their subsystem into a single INT, which will behave differently depending on the hashable_system required.
ENUM HASHABLE_SYSTEM
	CRC_TUNING_SYSTEM = 0,			//< DO NOT USE DIRECTLY. Use TRIGGER_TUNING_CRC_HACKER_CHECK wrapper instead
	CRC_ITEM_INFO_DATA,				//< subsystem can be any CItemInfo name hash (includes WEAPON_TYPE weapon hash and CAmmoInfo item hash)
	CRC_PICKUP_INFO_DATA,			//< subsystem has to be a PICKUP_TYPE (hash of a CPickupData)
	CRC_EXPLOSION_TAG_DATA,			//< subsystem has to be an EXPLOSION_TAG
	CRC_DATA_FILE_CONTENTS,			//< DO NOT USE DIRECTLY. Use TRIGGER_FILE_CRC_HACKER_CHECK wrapper instead
	CRC_GENERIC_FILE_CONTENTS,		//< DO NOT USE DIRECTLY. Use TRIGGER_FILE_CRC_HACKER_CHECK wrapper instead
	CRC_SCRIPT_RESOURCE				//< subsystem has to be a a script name hash (for instance HASH("freemode"))
ENDENUM

//PURPOSE: 
STRUCT GAMER_USERID
	TEXT_LABEL_23	Name
ENDSTRUCT

//PURPOSE: 
STRUCT GAMER_INFO
    GAMER_HANDLE	Handle
	TEXT_LABEL_63	Name
ENDSTRUCT

//PURPOSE: Structure thats describes a Party.
STRUCT NETWORK_PARTY_DESC
    INT				MemberCount
    GAMER_INFO		MemberInfo[MAX_PARTY_MEMBERS]
ENDSTRUCT

//PURPOSE: Structure thats describes a Platform Party (Xbox LIVE)
STRUCT NETWORK_PLATFORM_PARTY_DESC
    INT				MemberCount
    GAMER_INFO		MemberInfo[MAX_PARTY_MEMBERS]
    BOOL			bIsInSession
ENDSTRUCT

//PURPOSE: 
STRUCT NETWORK_PARTY_INVITE
    GAMER_HANDLE	Invitees[MAX_PARTY_MEMBERS - 1]
ENDSTRUCT

CONST_INT MAX_SESSION_MEMBERS 32

//PURPOSE: 
STRUCT SESSION_INVITE
    GAMER_HANDLE	Invitees[MAX_SESSION_MEMBERS - 1]
ENDSTRUCT

CONST_INT MAX_TRANSITION_MEMBERS 32

//PURPOSE: Structure to hold members of a transition session
STRUCT TRANSITION_MEMBERS
    INT				MemberCount
    GAMER_INFO		MemberInfo[MAX_TRANSITION_MEMBERS]
ENDSTRUCT

//PURPOSE: 
STRUCT TRANSITION_INVITE
    GAMER_HANDLE	Invitees[MAX_TRANSITION_MEMBERS - 1]
ENDSTRUCT

//PURPOSE: Structure thats describes the result of a call to NETWORK_
STRUCT NETWORK_FIND_GAMERS_RESULT
    INT				MemberCount
    GAMER_INFO		MemberInfo[MAX_FOUND_GAMERS]
ENDSTRUCT

//PURPOSE: 
STRUCT NETWORK_GAMER_STATUS_HANDLES
    GAMER_HANDLE hGamers[MAX_GAMER_STATUS]
ENDSTRUCT

ENUM GAMER_STATUS
	GAMER_STATUS_INVALID = -1,
	GAMER_STATUS_IN_TITLE = 0,
	GAMER_STATUS_IN_TITLE_MP,
	GAMER_STATUS_OFF_TITLE
ENDENUM

//PURPOSE: 
STRUCT NETWORK_GET_GAMER_STATUS_RESULT_STRUCT
    GAMER_HANDLE hGamer
	GAMER_STATUS nStatus
ENDSTRUCT 

//PURPOSE: 
STRUCT NETWORK_GET_GAMER_STATUS_RESULTS_STRUCT
    NETWORK_GET_GAMER_STATUS_RESULT_STRUCT aGamers[MAX_GAMER_STATUS]
ENDSTRUCT 

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_SIGN_IN_STATE_CHANGED.

STRUCT STRUCT_NETWORK_SIGN_IN_STATE_CHANGED
	INT	nIndex
	BOOL bIsActiveUser
	BOOL bWasSignedIn
	BOOL bWasOnline
	BOOL bIsSignedIn
	BOOL bIsOnline
	BOOL bIsDuplicateSignIn
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_STORE_PLAYER_LEFT.

STRUCT STRUCT_NETWORK_STORE_PLAYER_LEFT
	TEXT_LABEL_31 szGamerTag
	GAMER_HANDLE hGamer
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_NETWORK_ROS_CHANGED.

STRUCT STRUCT_NETWORK_ROS_CHANGED
	BOOL bValidCredentials
	BOOL bValidRockstarID
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_VOICE_CONNECTION_REQUESTED.
//          - EVENT_VOICE_CONNECTION_RESPONSE.
//          - EVENT_VOICE_CONNECTION_TERMINATED.

ENUM CONNECTION_RESPONSE_TYPES
	RESPONSE_ACCEPTED,
	RESPONSE_REJECTED,
	RESPONSE_BUSY,
	RESPONSE_TIMED_OUT,
	RESPONSE_ERROR,
	RESPONSE_BLOCKED
ENDENUM

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_TEXT_MESSAGE_RECEIVED.

STRUCT STRUCT_NETWORK_TEXT_MESSAGE
	TEXT_LABEL_63 szTextMessage
	GAMER_HANDLE hFromGamer
ENDSTRUCT

STRUCT STRUCT_CONNECTION_REQUEST_EVENT
	TEXT_LABEL_31 szGamerTag
	GAMER_HANDLE hGamer
ENDSTRUCT

STRUCT STRUCT_CONNECTION_RESPONSE_EVENT
	CONNECTION_RESPONSE_TYPES nResponse	
	INT nReponseCode
	GAMER_HANDLE hGamer
ENDSTRUCT

STRUCT STRUCT_CONNECTION_TERMINATED_EVENT
	TEXT_LABEL_31 szGamerTag
	GAMER_HANDLE hGamer	
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_SESSION_EVENT.

ENUM SESSION_EVENT_TYPE
	EVENT_SESSION_MIGRATE_END
ENDENUM

STRUCT STRUCT_SESSION_EVENT
	SESSION_EVENT_TYPE nEventID
	INT nEventParam
	GAMER_HANDLE hGamer	
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_TRANSITION_EVENT.

ENUM TRANSITION_EVENT_TYPE
	EVENT_TRANSITION_HOSTING,
	EVENT_TRANSITION_HOSTED,
	EVENT_TRANSITION_HOST_FAILED,
	EVENT_TRANSITION_JOINING,
	EVENT_TRANSITION_JOINED,
	EVENT_TRANSITION_JOINED_LAUNCHED,
	EVENT_TRANSITION_JOIN_FAILED,					// nEventParam corresponds to JOIN_RESPONSE_CODE
	EVENT_TRANSITION_STARTING,
	EVENT_TRANSITION_STARTED,
	EVENT_TRANSITION_ENDING,
	EVENT_TRANSITION_ENDED,
	EVENT_TRANSITION_QUICKMATCH,
	EVENT_TRANSITION_QUICKMATCH_JOINING,
	EVENT_TRANSITION_QUICKMATCH_HOSTING,
	EVENT_TRANSITION_START_LAUNCH,
	EVENT_TRANSITION_END_LAUNCH,
	EVENT_TRANSITION_KICKED,
	EVENT_TRANSITION_ERROR,
	EVENT_TRANSITION_MIGRATE_START,
	EVENT_TRANSITION_MIGRATE_END,
	EVENT_TRANSITION_TO_GAME_START,
	EVENT_TRANSITION_TO_GAME_JOINING,
	EVENT_TRANSITION_TO_GAME_JOINED,
	EVENT_TRANSITION_TO_GAME_HOSTING,
	EVENT_TRANSITION_TO_GAME_FINISH,
	EVENT_TRANSITION_QUICKMATCH_FAILED,
	EVENT_TRANSITION_QUICKMATCH_TIMEOUT,
	EVENT_TRANSITION_GROUP_QUICKMATCH_STARTED,		// hGamer corresponds to group leader
	EVENT_TRANSITION_GROUP_QUICKMATCH_FINISHED		// hGamer corresponds to group leader, nEventParam is 1 if we have a valid session
ENDENUM

STRUCT STRUCT_TRANSITION_EVENT
	TRANSITION_EVENT_TYPE nEventID
	INT nEventParam
	GAMER_HANDLE hGamer	
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_TRANSITION_STARTED.

STRUCT STRUCT_TRANSITION_STARTED_EVENT
	BOOL m_bSuccess // Was the HOST or JOIN successful
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_TRANSITION_MEMBER_JOINED.
//          - EVENT_NETWORK_TRANSITION_MEMBER_LEFT.
//
//			- nCharacterRank only relevant for EVENT_NETWORK_TRANSITION_MEMBER_JOINED

STRUCT STRUCT_TRANSITION_MEMBER_EVENT
	TEXT_LABEL_63 szGamerTag
	GAMER_HANDLE hGamer	
	INT nCharacterRank
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_TRANSITION_PARAMETER_CHANGED

/// PURPOSE:  Maximun number of params that can change
CONST_INT MAX_NUM_PARAMS  10

STRUCT STRUCT_PARAMETER_DATA
	INT nParameterID
	INT nParameterValue
ENDSTRUCT

STRUCT STRUCT_TRANSITION_PARAMETER_EVENT
	GAMER_HANDLE           hGamer	
	INT                    nNumberParams
	STRUCT_PARAMETER_DATA  nParameterData[MAX_NUM_PARAMS]
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_TRANSITION_STRING_CHANGED

STRUCT STRUCT_TRANSITION_STRING_EVENT
	GAMER_HANDLE hGamer	
	INT nParameterID
	TEXT_LABEL_31 szParameter
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_TRANSITION_GAMER_INSTRUCTION

STRUCT STRUCT_TRANSITION_GAMER_INSTRUCTION
	GAMER_HANDLE hFromGamer	
	GAMER_HANDLE hToGamer	
	TEXT_LABEL_63 szGamerTag
	INT nInstruction
	INT nInstructionParam
ENDSTRUCT

//Structure for getting info about crew/clan events such as:
//	-EVENT_NETWORK_CLAN_KICKED
STRUCT STRUCT_CLAN_INFO
	INT clanId
	BOOL primary
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_SESSION_END

ENUM END_REASON
	END_NORMAL,
	END_TRANSITION_LAUNCH,
	END_PARTY_LEFT,
	END_KICKED,
	END_RESERVING_SLOT,
	END_ERROR, 
	END_KICKED_ADMIN
ENDENUM

STRUCT STRUCT_SESSION_END_EVENT
	END_REASON nEndReason
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_PRESENCE_INVITE

STRUCT STRUCT_PRESENCE_INVITE_EVENT
	TEXT_LABEL_63 szInviter
	GAMER_HANDLE hGamer	
	INT nActivityType
	INT nActivityID
	INT nInviteID
	BOOL bScTv
ENDSTRUCT

STRUCT STRUCT_INVITE_VIA_PRESENCE_EVENT
	TEXT_LABEL_63 szInviter
	GAMER_HANDLE hInviter	
	TEXT_LABEL_23 szContentID
	INT nPlaylistLength
	INT nPlaylistCurrent
	BOOL bScTv
	INT nInviteID
ENDSTRUCT

//Event data for when receving a crew invite
// -EVENT_NETWORK_CLAN_INVITE_RECEIVED
STRUCT STRUCT_CREW_INVITE_EVENT
	INT nClanId
	TEXT_LABEL_31 szCrewName
	TEXT_LABEL_7  szCrewTag
	TEXT_LABEL_31 szRankName
	BOOL		  bHasMessage
ENDSTRUCT

//Event data for when receving a crew invite
// -EVENT_NETWORK_CLAN_INVITE_REQUEST_RECEIVED
STRUCT STRUCT_CREW_INVITE_REQUEST_EVENT
	INT nClanId
ENDSTRUCT

//Event data for when recieving EVENT_NETWORK_CLAN_RANK_CHANGE, 
//meaning the local player has received a promotion/demotion within their crew
STRUCT STRUCT_CREW_RANK_CHANGED
	INT nClanId
	INT nRankOrder
	BOOL bPromotion //true if a promotion, othewise, a demotion
	TEXT_LABEL_31 szRankName
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_PRESENCE_INVITE_REMOVED

ENUM INVITE_REMOVE_REASON
	REMOVE_TIMED_OUT,
	REMOVE_OLDEST,
	REMOVE_CANCELLED,
	REMOVE_ACCEPTED
ENDENUM

STRUCT STRUCT_PRESENCE_INVITE_REMOVED_EVENT
	INT nInviteID
	INVITE_REMOVE_REASON nReason
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_PRESENCE_INVITE_REPLY

ENUM INVITE_STATUS
	INVITESTATUS_NONE,
	INVITESTATUS_IN_SINGLE_PLAYER,
	INVITESTATUS_IN_FREEMODE,
	INVITESTATUS_IN_CORONA,
	INVITESTATUS_IN_ACTIVITY,
    INVITESTATUS_CANNOT_ACCESS_MULTIPLAYER,
    INVITESTATUS_NO_PRIVILEGE,
    INVITESTATUS_BLOCKED,
    INVITESTATUS_BLOCKED_INACTIVE,
    INVITESTATUS_CHEATER,
    INVITESTATUS_BAD_SPORT,
    INVITESTATUS_CANNOT_PROCESS_PRESENCE,
    INVITESTATUS_IN_STORE,
    INVITESTATUS_IN_CREATOR,
    INVITESTATUS_INACTIVE,
	INVITESTATUS_FROM_JOIN_QUEUE,
	INVITESTATUS_IN_SESSION,
	INVITESTATUS_INCOMPATIBLE,
	INVITESTATUS_IN_EDITOR
ENDENUM

STRUCT STRUCT_PRESENCE_INVITE_REPLY_EVENT
	GAMER_HANDLE hInviter
	INVITE_STATUS nInviteStatus
	INT nCharacterRank
	TEXT_LABEL_15 m_szClanTag
	BOOL bDecisionMade
	BOOL bDecision
ENDSTRUCT

//PURPOSE: Structure to hold UGC content IDs for a GET
CONST_INT MAX_CONTENT_RESULTS 64
STRUCT UGC_CONTENT_ID_QUERY
    TEXT_LABEL_23 szContentID[MAX_CONTENT_RESULTS]
ENDSTRUCT

CONST_INT MAX_CREATOR_RESULTS 16
STRUCT UGC_USERID_ID_QUERY
    TEXT_LABEL_63 szUserID[MAX_CREATOR_RESULTS]
ENDSTRUCT  

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_PRESENCE_TRIGGER

STRUCT STRUCT_PRESENCE_TRIGGER_EVENT
	INT nEventNameHash
	INT nEventParam1
	INT nEventParam2
	TEXT_LABEL_63 szEventString
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_FOLLOW_INVITE_RECEIVED

STRUCT STRUCT_FOLLOW_INVITE_EVENT
	GAMER_HANDLE hInviter
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_ADMIN_INVITED

STRUCT STRUCT_ADMIN_INVITED_EVENT
	GAMER_HANDLE hInviter
	BOOL bIsSCTV
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_SPECTATE_LOCAL.

STRUCT STRUCT_NETWORK_SPECTATE_LOCAL
	GAMER_HANDLE hGamer
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_PERMISSION_CHECK_RESULT

STRUCT STRUCT_NETWORK_PERMISSION_CHECK_RESULT
	INT nCheckID
	BOOL bIsAllowed
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_APP_LAUNCHED

ENUM APP_LAUNCH_FLAGS
	LAUNCH_STRAIGHT_INTO_FREEMODE,
	LAUNCH_FROM_LIVE_AREA,
	LAUNCH_DIRECT_TO_CONTENT
ENDENUM

STRUCT STRUCT_NETWORK_APP_LAUNCHED
	APP_LAUNCH_FLAGS nFlags
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_SYSTEM_SERVICE_EVENT
//		   Either add a CompileTimeAssert in code for these assignments or build a 
//		   script specific index and convert from code
ENUM SYSTEM_SERVICE_EVENT_ID
	EVENT_SUSPENDED = 2,
	EVENT_RESUMING = 4,
	EVENT_INVITATION_RECEIVED = 24,
	EVENT_APP_LAUNCHED = 30
ENDENUM

STRUCT STRUCT_NETWORK_SYSTEM_SERVICE_EVENT
	INT nEventID
	INT nFlags
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_REQUEST_DELAY

STRUCT STRUCT_NETWORK_REQUEST_DELAY
	INT delayTimeMs
ENDSTRUCT

//PURPOSE: Structure thats describes a Clan.
//
// IMPORTANT NOTE: Maps to scrClanDesc in code
//  
//	!!!!!DO NOT CHANGE STRUCT NETWORK_CLAN_DESC!!!!!!!
//
STRUCT NETWORK_CLAN_DESC
	INT            Id
    TEXT_LABEL_63  ClanName
    TEXT_LABEL_7   ClanTag
	INT            MemberCount
	INT            IsSystemClan
	INT            IsOpenClan
    TEXT_LABEL_31  RankName
	INT            RankOrder
	INT            CreatedTimePosix
	INT			   ClanColor_Red
	INT			   ClanColor_Green
	INT			   ClanColor_Blue
ENDSTRUCT
//
//	!!!!!DO NOT CHANGE STRUCT NETWORK_CLAN_DESC!!!!!!!
//

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_CONNECTION_TIMEOUT

STRUCT STRUCT_NETWORK_CONNECTION_TIMEOUT
	INT m_PlayerIndex
ENDSTRUCT

//PURPOSE: Session sized array of gamer handles
//
CONST_INT MAX_TO_FREEMODE_GAMERS 32
STRUCT STRUCT_TO_FREEMODE_GAMERS
	GAMER_HANDLE hGamers[MAX_TO_FREEMODE_GAMERS]	
ENDSTRUCT

//PURPOSE: Session sized array of gamer handles
//
CONST_INT MAX_SESSION_GAMERS_MINUS_ONE 31
STRUCT STRUCT_GAMER_HANDLES_MAX_MINUS_ONE
	GAMER_HANDLE hGamers[MAX_SESSION_GAMERS_MINUS_ONE]	
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_CLOUD_EVENT

ENUM CLOUD_EVENT_ID
	CLOUD_EVENT_TUNABLES_ADDED,
	CLOUD_EVENT_BGSCRIPT_ADDED
ENDENUM

STRUCT STRUCT_NETWORK_CLOUD_EVENT
	CLOUD_EVENT_ID nEventID
	INT nEventParam1
	INT nEventParam2
	TEXT_LABEL_63 szEventString
ENDSTRUCT

// code: eMileStoneId
ENUM MILESTONE_ID
	FACEBOOK_MILESTONE_CHECKLIST=0,		// 100% Complete game.
	FACEBOOK_MILESTONE_OVERVIEW,		// 100% Complete story mission.
	FACEBOOK_MILESTONE_VEHICLES,		// Driven all cars.
	FACEBOOK_MILESTONE_PROPERTIES,		// Bought all properties.
	FACEBOOK_MILESTONE_PSYCH,			// Future: psych report (TBD)
	FACEBOOK_MILESTONE_MAPREVEAL,		// Map reveal
	FACEBOOK_MILESTONE_PROLOGUE			// Prologue completed
ENDENUM

//PURPOSE: Flags for Matchmaking
ENUM MM_FLAGS
	MM_FLAGS_NONE						= 0,
	MM_FLAG_ASYNCHRONOUS				= BIT0,
	MM_FLAG_QUICKMATCH					= BIT1,
	MM_FLAG_ALLOW_BLACKLISTED			= BIT2,
	MM_FLAG_DISABLE_ANY_JOB_QUERIES		= BIT6,		//< jobs only
	MM_FLAG_DISABLE_IN_PROGRESS_QUERIES = BIT7,		//< jobs only
	MM_FLAG_ROCKSTAR_CONTENT_ONLY		= BIT9,		//< jobs only
	MM_FLAG_USER_CONTENT_ONLY		    = BIT10,	//< jobs only
	MM_FLAG_IS_BOSS						= BIT11,
	MM_FLAG_JOB_TO_JOB					= BIT12,	//< to_game only
	MM_FLAG_BAIL_FROM_LAUNCHED_JOBS		= BIT14,	//< jobs only
	MM_FLAG_ONLY_IN_PROGRESS			= BIT15,	//< jobs only
	MM_FLAG_TO_GAME_VIA_TRANSITION		= BIT16,	//< to_game only
	MM_FLAG_EXPANDED_INTRO_FLOW			= BIT17		
ENDENUM

//PURPOSE: Flags for Hosting
ENUM HOST_FLAGS
	HOST_FLAGS_NONE						= 0,
	HOST_FLAG_JOB_TO_JOB				= BIT13,	//< to_game only
	HOST_FLAG_ASYNCHRONOUS				= BIT14,	//< transition only
	HOST_FLAG_PREMIUM					= BIT15,
	HOST_FLAG_VIA_TRANSITION_LOBBY		= BIT16		//< to_game only
ENDENUM

//PURPOSE: Flags for Leaving
ENUM LEAVE_FLAGS
	LEAVE_FLAGS_NONE					= 0,
	LEAVE_FLAG_RETURN_TO_LOBBY			= BIT0,
	LEAVE_FLAG_BLACKLIST_SESSION		= BIT1,
	LEAVE_FLAG_NO_TRANSITION_BAIL		= BIT2
ENDENUM

// Script can edit this enum to include new values
// This is defined to give code some context when we see different values show up in the logs
ENUM ACTIVITY_ISLAND
	ACTIVITY_ISLAND_INVALID = -1,
	ACTIVITY_ISLAND_GENERAL = 0,
	ACTIVITY_ISLAND_SPECIFIC,
	ACTIVITY_ISLAND_PLAYLIST,
	ACTIVITY_ISLAND_EVENT,
	ACTIVITY_ISLAND_TOURNAMENT
ENDENUM

ENUM JOB_CONTENT_CREATOR
	JOB_CONTENT_ROCKSTAR_CREATED = 0,
	JOB_CONTENT_USER_CREATED = 1
ENDENUM

ENUM NETWORK_RESERVATION_TYPE
	RESERVATION_ALL = 0,
	RESERVATION_LOCAL_ONLY,
	RESERVATION_GLOBAL_ONLY
ENDENUM

//~>				COMMAND ACCESS

//PURPOSE: Returns TRUE if the command -netAutoMultiplayerLaunch is active
NATIVE FUNC BOOL NETWORK_AUTO_MULTIPLAYER_LAUNCH() = "0xb011bc30d2b41385"

//PURPOSE: Returns string of the online version
NATIVE FUNC STRING GET_ONLINE_VERSION() = "0xe1b4508c5d42ba97"

//~>				LOCAL PLAYER QUERY

//PURPOSE: Returns TRUE if the local player is signed into a profile.
NATIVE FUNC BOOL NETWORK_IS_SIGNED_IN() = "0xaf5dbe95205a49d1"

//PURPOSE: Returns TRUE if the local player is a guest account
NATIVE FUNC BOOL NETWORK_IS_GUEST() = "0x6ca1c8618f47d738"

//PURPOSE: Returns TRUE if the local player is online.
NATIVE FUNC BOOL NETWORK_IS_SIGNED_ONLINE() = "0x20e4972cbf3dbe1b"

//PURPOSE: Returns TRUE if the social club UI is loaded in offline mode.
NATIVE FUNC BOOL NETWORK_IS_SC_OFFLINE_MODE() = "0x507e576fd928a23c"

//PURPOSE: Returns TRUE if the local player is OFFLINE for NP. This will be FALSE during
//		   sign in (and while signed in. Only available on PS3 (returns TRUE on all other 
//		   platforms)
NATIVE FUNC BOOL NETWORK_IS_NP_OFFLINE() = "0x945bd59469d7fc69"

ENUM NP_UNAVAILABILITY_REASON
	REASON_INVALID = -1,
	REASON_OTHER,
	REASON_SYSTEM_UPDATE,
	REASON_GAME_UPDATE,
	REASON_SIGNED_OUT,
	REASON_AGE,
	REASON_CONNECTION
ENDENUM

//PURPOSE: Returns TRUE if the NP (online) operations are available for the local player. This will
//			be FALSE if the player is underage, has a pending game or title update.
NATIVE FUNC BOOL NETWORK_IS_NP_AVAILABLE() = "0x82fc2fd8e4f14d53"

//PURPOSE: Returns TRUE if the NP (online) operations are in a PENDING state for the local player. This means
//			that the user is online on PSN but we're still retrieving their NP availability, permissions, etc.
NATIVE FUNC BOOL NETWORK_IS_NP_PENDING() = "0x164c5b38c79eef17"

//PURPOSE: Returns the reason why the NP service is unavailable.
//			Will return REASON_INVALID if this function is called when Np is available and will assert
NATIVE FUNC NP_UNAVAILABILITY_REASON NETWORK_GET_NP_UNAVAILABLE_REASON() = "0x50628aa00a11e2d9"

//PURPOSE: Returns TRUE if the player is connected to either PSN or R* Presence
//			When FALSE, we can safely assume an internet connection has been lost. Use this when handling
//			connection change events to determine if the user has gone offline due to a sign out or net connection loss.
NATIVE FUNC BOOL NETWORK_IS_CONNETED_TO_NP_PRESENCE() = "0xc725b46872d7da81"

//PURPOSE: Returns TRUE if the main gamer index player is logged in to PSN. This does not guarantee the user is "online",
//			i.e. their connection to PSN services could be down, they could be underage, etc. 
//		   Use NETWORK_IS_SIGNED_ONLINE for full online PSN connection.
NATIVE FUNC BOOL NETWORK_IS_LOGGED_IN_TO_PSN() = "0x16c2ac4b4740271f"

//PURPOSE: Rechecks NP Availability manually, overriding the normal 5 minutes between rechecks
NATIVE PROC NETWORK_RECHECK_NP_AVAILABILITY() = "0x51aa8a489b77bc29"

//PURPOSE: Returns TRUE if the local player has ROS credentials
NATIVE FUNC BOOL NETWORK_HAS_VALID_ROS_CREDENTIALS() = "0x5b66e9fb7530bb95"

//PURPOSE: Returns TRUE if we're refreshing the ROS credentials for the local player 
NATIVE FUNC BOOL NETWORK_IS_REFRESHING_ROS_CREDENTIALS() = "0xafb993c55538f6d3"

//PURPOSE: Returns TRUE if we have access to the cloud. 
NATIVE FUNC BOOL NETWORK_IS_CLOUD_AVAILABLE() = "0x47c86377aa337cbe"

//PURPOSE: Returns TRUE if we have a social club account. 
NATIVE FUNC BOOL NETWORK_HAS_SOCIAL_CLUB_ACCOUNT() = "0xca8cdfe6f0f62c7f"

//PURPOSE: Returns TRUE if the social club up to date on it's legal policies. 
NATIVE FUNC BOOL NETWORK_ARE_SOCIAL_CLUB_POLICIES_CURRENT() = "0x0f427066bf044759"

//PURPOSE:  Returns TRUE if we are supporting only LAN games (running with -lan command line parameter)
NATIVE FUNC BOOL NETWORK_LAN_SESSIONS_ONLY() = "0x3f65cb91b9932dde"

//PURPOSE: Is the local console the host of the network session
NATIVE FUNC BOOL NETWORK_IS_HOST() = "0x36de74c9549aaef2"

//PURPOSE: Is the local console the host of the network session
NATIVE FUNC PLAYER_INDEX NETWORK_GET_HOST_PLAYER_INDEX() = "0x8251fb94dc4fdfc8"

//PURPOSE: Returns if the game was suspended (true between suspend / resume events)
NATIVE FUNC BOOL NETWORK_WAS_GAME_SUSPENDED() = "0x7de1a1f794241a4f"

//PURPOSE: Returns if the local player has a bad reputation (Xbox One only)
NATIVE FUNC BOOL NETWORK_IS_REPUTATION_BAD() = "0x5a6b549b65c8f0b8"

//~>				LOCAL PLAYER PRIVILEGE

//PURPOSE: Returns true if the local player has online privileges.
NATIVE FUNC BOOL NETWORK_HAVE_ONLINE_PRIVILEGES() = "0x17c7c36f1fce1ac2"

//PURPOSE: Returns true if the local player has an age restricted account
NATIVE FUNC BOOL NETWORK_HAS_AGE_RESTRICTIONS() = "0x74a0cf38086bfa4d"

//PARAM NOTES: Privilege Check Type (One of PRIVILEGE_CHECK)
//PURPOSE: Returns true if the local player has user generated content privileges
NATIVE FUNC BOOL NETWORK_HAVE_USER_CONTENT_PRIVILEGES(PRIVILEGE_CHECK nPrivilegeType = PC_EVERYONE) = "0x818f829545200020"

//PARAM NOTES: Privilege Check Type (One of PRIVILEGE_CHECK)
//PURPOSE: Returns true if the player has communication / voicechat privileges.
NATIVE FUNC BOOL NETWORK_HAVE_COMMUNICATION_PRIVILEGES(PRIVILEGE_CHECK nPrivilegeType = PC_EVERYONE, INT PlayerIndex = -1) = "0x1a1b1f5dc3f2d868"

//PURPOSE: Returns true if the hardware network cable is connected
NATIVE FUNC BOOL NETWORK_IS_CABLE_CONNECTED() = "0x1d2aba18149a4e82"

//PURPOSE: Returns true if we are using a promotion in order to access online
NATIVE FUNC BOOL NETWORK_IS_USING_ONLINE_PROMOTION() = "0x6b11a0822298fc28"

//PURPOSE: Returns true if we should alert about our promotion on entry to multiplayer
NATIVE FUNC BOOL NETWORK_SHOULD_SHOW_PROMOTION_ALERT_SCREEN() = "0x57cbb223ba695c48"

/// PURPOSE
///    ROS privilege checks
NATIVE FUNC BOOL NETWORK_HAVE_SCS_PRIVATE_MSG_PRIV() = "0xf1ab1e47a12aa2e6"
NATIVE FUNC BOOL NETWORK_HAVE_ROS_SOCIAL_CLUB_PRIV() = "0x4e8ff61a9663f967"
NATIVE FUNC BOOL NETWORK_HAVE_ROS_BANNED_PRIV() = "0xcd3dc164d0bfbca9"
NATIVE FUNC BOOL NETWORK_HAVE_ROS_CREATE_TICKET_PRIV() = "0x727b2ff4185a92fe"
NATIVE FUNC BOOL NETWORK_HAVE_ROS_MULTIPLAYER_PRIV() = "0x67155a7aecd70f8b"
NATIVE FUNC BOOL NETWORK_HAVE_ROS_LEADERBOARD_WRITE_PRIV() = "0x8d4166b8ec28f8d5"

//PURPOSE: Returns true if the ROS privilege ID is valid.
NATIVE FUNC BOOL NETWORK_HAS_ROS_PRIVILEGE(NETWORK_ROS_PRIVILEGEID privilegeId) = "0xba27179576bcb41e"

//PURPOSE: Returns true if the ROS privilege ID has a valid end Date and the time.
NATIVE FUNC BOOL NETWORK_HAS_ROS_PRIVILEGE_END_DATE(NETWORK_ROS_PRIVILEGEID privilegeId, INT& isGranted, UGC_DATE& sDate) = "0x1400223a788db4c7"

//PURPOSE: Returns true if the ROS privilege RLROS_PRIVILEGEID_PLAYED_LAST_GEN is granted.
NATIVE FUNC BOOL NETWORK_HAS_ROS_PRIVILEGE_PLAYED_LAST_GEN() = "0x2f04a4784a70593c"

//PURPOSE: Returns true if the ROS privilege RLROS_PRIVILEGEID_UNLOCK_SPECIAL_EDITION is granted.
NATIVE FUNC BOOL NETWORK_HAS_ROS_PRIVILEGE_SPECIAL_EDITION_CONTENT() = "0x4ce2af6d17d3b116"

//PURPOSE: Starts a communication permisson check
//         Returns unique ID that can be used when receiving EVENT_NETWORK_PERMISSION_CHECK_RESULT
//
NATIVE FUNC INT NETWORK_START_COMMUNICATION_PERMISSIONS_CHECK(GAMER_HANDLE& hGamer) = "0x47b1bec47f443304"
NATIVE FUNC INT NETWORK_START_TEXT_COMMUNICATION_PERMISSIONS_CHECK(GAMER_HANDLE& hGamer) = "0x81066ba1ad07ef57"
NATIVE FUNC INT NETWORK_START_USER_CONTENT_PERMISSIONS_CHECK(GAMER_HANDLE& hGamer) = "0xcc34a06b16b1250d"

/// PURPOSE
///    Checks if local gamer has social networking privileges
NATIVE FUNC BOOL NETWORK_HAS_SOCIAL_NETWORKING_SHARING_PRIV() = "0x07a5e5231705659c"

ENUM RL_AGEGROUP
    RL_AGEGROUP_INVALID = -1,
    RL_AGEGROUP_PENDING,        //Age group is being retrieved.
    RL_AGEGROUP_CHILD,
    RL_AGEGROUP_TEEN,
    RL_AGEGROUP_ADULT
ENDENUM

/// PURPOSE
///   On xbox builds gets age group defined in ENUM RL_AGEGROUP.
///
///   PS3 builds will return:
///		RL_AGEGROUP_CHILD if age restrictions are set and the age is < MIN_AGE_RATING
///		RL_AGEGROUP_ADULT if the age is >= MIN_AGE_RATING
///		RL_AGEGROUP_INVALID for all other situations.
///
///	  NOTE: RL_AGEGROUP_TEEN is not returned on PS3
///
NATIVE FUNC RL_AGEGROUP NETWORK_GET_AGE_GROUP() = "0xf715b6db99db6acc"

//PURPOSE: As above, but allows check using a particular gamer index
//		   Use GAMER_INDEX_ANYONE to check any player. You can check if any player does NOT have
//		   the privilege by setting bCheckHasPrivilege to FALSE
//

NATIVE FUNC BOOL NETWORK_CHECK_ONLINE_PRIVILEGES(INT nGamerIndex = GAMER_INDEX_LOCAL, BOOL bCheckHasPrivilege = TRUE) = "0x3554df15fcdf45a1"
NATIVE FUNC BOOL NETWORK_CHECK_USER_CONTENT_PRIVILEGES(PRIVILEGE_CHECK nPrivilegeType = PC_EVERYONE, INT nGamerIndex = GAMER_INDEX_LOCAL, BOOL bCheckHasPrivilege = TRUE) = "0x3ee42535a14ba719"
NATIVE FUNC BOOL NETWORK_CHECK_COMMUNICATION_PRIVILEGES(PRIVILEGE_CHECK nPrivilegeType = PC_EVERYONE, INT nGamerIndex = GAMER_INDEX_LOCAL, BOOL bCheckHasPrivilege = TRUE) = "0x4b719b4a8760b77f"
NATIVE FUNC BOOL NETWORK_CHECK_TEXT_COMMUNICATION_PRIVILEGES(PRIVILEGE_CHECK nPrivilegeType = PC_EVERYONE, INT nGamerIndex = GAMER_INDEX_LOCAL, BOOL bCheckHasPrivilege = TRUE) = "0x001b5de156ecd0d5"

// PURPOSE: Check if we have a platform subscription (PS+, XBL)
NATIVE FUNC BOOL NETWORK_HAVE_PLATFORM_SUBSCRIPTION() = "0x181069b04c4883bd"
// PURPOSE: Check if there is a request for platform subscription (PS+, XBL) pending
NATIVE FUNC BOOL NETWORK_IS_PLATFORM_SUBSCRIPTION_CHECK_PENDING() =  "0x6c8e92d4f56b150e"

// PURPOSE: Show them system UI for upgrading your PS+ account
NATIVE PROC NETWORK_SHOW_ACCOUNT_UPGRADE_UI() = "0x47026c4989c92f91"

// PURPOSE: Show them system UI for upgrading your PS+ account
NATIVE FUNC BOOL NETWORK_IS_SHOWING_SYSTEM_UI_OR_RECENTLY_REQUESTED_UPSELL() = "0x7788dfe15016a182"

// PURPOSE: TRUE if we need to start a new game but we are blocked by something
NATIVE FUNC BOOL NETWORK_NEED_TO_START_NEW_GAME_BUT_BLOCKED() = "0xd5cc151c7c897002"

//~>				PRIVILEGE CHECKING

// Durango Privilege Type Bit Flags
//  Needs to match order of PrivilegeTypes for Durango in rlprivileges.h

CONST_INT PRIVILEGE_TYPE_DURANGO_ADD_FRIEND							BIT0
CONST_INT PRIVILEGE_TYPE_DURANGO_CLOUD_GAMING_JOIN_SESSION			BIT1
CONST_INT PRIVILEGE_TYPE_DURANGO_CLOUD_GAMING_MANAGE_SESSION		BIT2
CONST_INT PRIVILEGE_TYPE_DURANGO_CLOUD_SAVED_GAMES					BIT3
CONST_INT PRIVILEGE_TYPE_DURANGO_COMMUNICATIONS						BIT4
CONST_INT PRIVILEGE_TYPE_DURANGO_COMMUNICATION_VOICE_INGAME			BIT5
CONST_INT PRIVILEGE_TYPE_DURANGO_COMMUNICATION_VOICE_SKYPE			BIT6
CONST_INT PRIVILEGE_TYPE_DURANGO_GAME_DVR							BIT7
CONST_INT PRIVILEGE_TYPE_DURANGO_MULTIPLAYER_PARTIES				BIT8
CONST_INT PRIVILEGE_TYPE_DURANGO_MULTIPLAYER_SESSIONS				BIT9
CONST_INT PRIVILEGE_TYPE_DURANGO_PREMIUM_CONTENT					BIT10
CONST_INT PRIVILEGE_TYPE_DURANGO_PREMIUM_VIDEO						BIT11				
CONST_INT PRIVILEGE_TYPE_DURANGO_PROFILE_VIEWING					BIT12
CONST_INT PRIVILEGE_TYPE_DURANGO_DOWNLOAD_FREE_CONTENT				BIT13
CONST_INT PRIVILEGE_TYPE_DURANGO_PURCHASE_CONTENT					BIT14
CONST_INT PRIVILEGE_TYPE_DURANGO_SHARE_KINECT_CONTENT				BIT15
CONST_INT PRIVILEGE_TYPE_DURANGO_SOCIAL_NETWORK_SHARING				BIT16
CONST_INT PRIVILEGE_TYPE_DURANGO_SUBSCRIPTION_CONTENT				BIT17
CONST_INT PRIVILEGE_TYPE_DURANGO_USER_CREATED_CONTENT				BIT18
CONST_INT PRIVILEGE_TYPE_DURANGO_VIDEO_COMMUNICATIONS				BIT19
CONST_INT PRIVILEGE_TYPE_DURANGO_VIEW_FRIENDS_LIST					BIT20
CONST_INT PRIVILEGE_TYPE_DURANGO_CROSS_PLAY							BIT21 // Scarlett only
CONST_INT PRIVILEGE_TYPE_DURANGO_CLUBS								BIT22 // Scarlett only
CONST_INT PRIVILEGE_TYPE_DURANGO_NONINTERACTIVE_SESSIONS			BIT23 // Scarlett only
CONST_INT PRIVILEGE_TYPE_DURANGO_BROADCAST							BIT24 // Scarlett only
CONST_INT PRIVILEGE_TYPE_DURANGO_MANAGEPROFILEPRIVACY				BIT25 // Scarlett only

//PURPOSE: Begin a check through the platform API to see if the specified local user has the specified privileges set.
//PARAM NOTES:
//	nLocalGamerIndex		- Index of the local gamer we want to check privileges for
//  nPrivilegeTypeBitfield	- Bitfield of privilege types to check. See bit definitions above (i.e. PRIVILEGE_TYPE_DURANGO_ADD_FRIEND)
//	bAttempResolution		- Whether the system should be allowed to acquire a privilege for the user. When true, the system
//								may prompt the user to upgrade their account. (i.e. prompt to upgrade to Xbox LIVE Gold)
NATIVE FUNC BOOL NETWORK_CHECK_PRIVILEGES(INT nLocalGamerIndex, INT nPrivilegeTypeBitfield, BOOL bAttempResolution) = "0x9b3cc23e5574e8d3"

//PURPOSE: Check if the current privilege check has a result.
NATIVE FUNC BOOL NETWORK_IS_PRIVILEGE_CHECK_RESULT_READY() = "0x18f114a8b87d7fb1"

//PURPOSE: Check if a privilege check is in progress.
NATIVE FUNC BOOL NETWORK_IS_PRIVILEGE_CHECK_IN_PROGRESS() = "0x9290519142d56dc3"

//PURPOSE: Check if the current privilege check was successful.
NATIVE FUNC BOOL NETWORK_IS_PRIVILEGE_CHECK_SUCCESSFUL() = "0xb52abf2eca045c09"

//PURPOSE: Set that the privilege check result is no longer needed. Must be done
//			before another privilege check can begin.
NATIVE PROC NETWORK_SET_PRIVILEGE_CHECK_RESULT_NOT_NEEDED() = "0xfbdf4a6e38fe1d85"

//PURPOSE: Xbox only specific privilege checks that show appropriate platform UI
NATIVE FUNC BOOL NETWORK_RESOLVE_PRIVILEGE_ONLINE_MULTIPLAYER() = "0xc4a318a08181f8c3"
NATIVE FUNC BOOL NETWORK_RESOLVE_PRIVILEGE_USER_CONTENT() = "0xde9225854f37bf72"

//~>				BAIL FUNCTIONS

//PURPOSE: Call to bail from a network game.
NATIVE PROC NETWORK_BAIL(INT nContext, INT nParam1 = 0, INT nParam2 = 0) = "0x6c5c36a8b5b604a8"

//PURPOSE: Return True if the game can call bail from a network game.
NATIVE FUNC BOOL NETWORK_CAN_BAIL() = "0x08d888a13c7eae9a"

//PURPOSE: 
NATIVE PROC NETWORK_ON_RETURN_TO_SINGLE_PLAYER() = "0xf1cb00675e759704"


//~>				MATCHMAKING VALUE ACCESS
//PURPOSE: Call to set a matchmaking value (nValueID is one of MATCHMAKING_VALUE)
NATIVE PROC NETWORK_SET_MATCHMAKING_VALUE(INT nValueID, INT nValue) = "0xa34ac257f36126af"

//PURPOSE: Call to clear a matchmaking value (nValueID is one of MATCHMAKING_VALUE)
NATIVE PROC NETWORK_CLEAR_MATCHMAKING_VALUE(INT nValueID) = "0xb968149c3e9e32b6"

//PURPOSE: Call to toggle off which queries are made during matchmaking. All on by default. 
//         If all queries are off, we automatically host when calling NETWORK_SESSION_ENTER
NATIVE PROC NETWORK_SET_MATCHMAKING_QUERY_STATE(MATCHMAKING_QUERY_TYPE nQueryType, BOOL bEnabled) = "0x8cd957d92c062b66"

//PURPOSE: Retrieve whether matchmaking query is on or off
NATIVE FUNC BOOL NETWORK_GET_MATCHMAKING_QUERY_STATE(MATCHMAKING_QUERY_TYPE nQueryType) = "0x5f5bac02f79cd284"

//~>				TRANSITION TRACKING FUNCTIONS

// We have 10 stage slots (so, 0-9)

NATIVE FUNC BOOL NETWORK_TRANSITION_START(INT nTransitionType, INT nContextParam1, INT nContextParam2, INT nContextParam3) = "0x28f4de9a81bee3ce"
NATIVE FUNC BOOL NETWORK_TRANSITION_ADD_STAGE(INT nStageHash, INT nStageSlot, INT nContextParam1, INT nContextParam2, INT nContextParam3) = "0x16aeee39d8ef7e7d"
NATIVE FUNC BOOL NETWORK_TRANSITION_FINISH(INT nContextParam1, INT nContextParam2, INT nContextParam3) = "0x166eeb852973b1db"

//~>				PLATFORM SESSION FUNCTIONS

//PURPOSE: Return TRUE if the game can ACCESS multiplayer.
//		   Check this function once. If FALSE, fall out of MP. 
// 
//		   Must be called prior to:
//				NETWORK_SESSION_ENTER
//				NETWORK_SESSION_FRIEND_MATCHMAKING
//				NETWORK_SESSION_SOCIAL_MATCHMAKING
//				NETWORK_SESSION_CREW_MATCHMAKING
//				NETWORK_SESSION_ACTIVITY_QUICKMATCH
//				NETWORK_SESSION_HOST
//
//			Code deal with NETWORK_SESSION_JOIN_INVITE
//							
NATIVE FUNC BOOL NETWORK_CAN_ACCESS_MULTIPLAYER(MULTIPLAYER_ACCESS_CODE& nAccessCode) = "0xbe80a802dc72edc6"

//PURPOSE: Checks if we can access multiplayer or not
//		   If we can, returns TRUE
//		   If we can't, returns FALSE and displays an appropriate alert for the access failure (managed in code)
NATIVE FUNC BOOL NETWORK_CHECK_CAN_ACCESS_AND_ALERT() = "0x5d3131436f409031"

//PURPOSE: Return TRUE if multiplayer disabled. Call after NETWORK_CAN_ENTER_MULTIPLAYER
// 
NATIVE FUNC BOOL NETWORK_IS_MULTIPLAYER_DISABLED() = "0x7c92ff03126ca051"

//PURPOSE: Return TRUE if the game can ENTER multiplayer. 
//         Poll this function, it will eventually return TRUE
//
//		   Must be called prior to:
//				NETWORK_SESSION_ENTER
//				NETWORK_SESSION_FRIEND_MATCHMAKING
//				NETWORK_SESSION_SOCIAL_MATCHMAKING
//				NETWORK_SESSION_CREW_MATCHMAKING
//				NETWORK_SESSION_ACTIVITY_QUICKMATCH
//				NETWORK_SESSION_HOST
//
//			Code deal with NETWORK_SESSION_JOIN_INVITE
//							
NATIVE FUNC BOOL NETWORK_CAN_ENTER_MULTIPLAYER() = "0x81a7d34a619b9771"

//PURPOSE: Performs a quick match
//PARAM NOTES:
//	nGameMode	- Gamemode value from script enum
//	nQueryID	- Not Used
//	nEnterType	- Not Used
//	nMaxPlayers - Max players that can join this session, including local player
//	isPrivate	- Not Used
//	bConsiderBlacklisted - Indicates whether sessions we've indicated as blacklisted should be considered for matchmaking. If TRUE, these sessions
//						   will be shuffled to the back of the list. This is the default behaviour.
NATIVE FUNC BOOL NETWORK_SESSION_DO_FREEROAM_QUICKMATCH(INT gameMode, INT maxPlayers, MM_FLAGS matchmakingFlags) = "0x551ae6e8f7f29f4e"
NATIVE FUNC BOOL NETWORK_SESSION_ENTER(INT nGameMode, MATCHMAKING_QUERY nQueryID, NETWORK_AUTO_START_TYPE nEnterType, INT nMaxPlayers, BOOL isPrivate, BOOL bConsiderBlacklisted = TRUE) = "0x197a91fa3efa1bf6"

//PURPOSE: Starts friend matchmaking. 
//PARAM NOTES:
//  Others		- See comments for NETWORK_SESSION_ENTER
NATIVE FUNC BOOL NETWORK_SESSION_DO_FRIEND_MATCHMAKING(INT gameMode, INT maxPlayers, MM_FLAGS matchmakingFlags) = "0x20a4f0120b408c3e"
NATIVE FUNC BOOL NETWORK_SESSION_FRIEND_MATCHMAKING(INT nGameMode, MATCHMAKING_QUERY nQueryID, INT nMaxPlayers, BOOL bConsiderBlacklisted = TRUE) = "0x416db490205bdf23"

//PURPOSE: Starts social matchmaking. Use this with queries that aren't supported by the fixed functions
//PARAM NOTES:
//  szQuery		- Name of query to run on ROS servers.  - as STRING. 
//  szParams    - Parameters for query to run on ROS servers - as STRING. 
//  Others		- See comments for NETWORK_SESSION_ENTER
NATIVE FUNC BOOL NETWORK_SESSION_DO_SOCIAL_MATCHMAKING(STRING szQuery, STRING szParams, INT gameMode, INT maxPlayers, MM_FLAGS matchmakingFlags) = "0x2db15da730179841"
NATIVE FUNC BOOL NETWORK_SESSION_SOCIAL_MATCHMAKING(STRING szQuery, STRING szParams, INT nGameMode, MATCHMAKING_QUERY nQueryID, INT nMaxPlayers, BOOL bConsiderBlacklisted = TRUE) = "0x390b4fc29cb44876"

//PURPOSE: Starts matchmaking by crew
//PARAM NOTES:
//  nCrewID		- Crew that we are looking for in active matches. Pass 0 to use the players primary crew. 
//  Others		- See comments for NETWORK_SESSION_ENTER
NATIVE FUNC BOOL NETWORK_SESSION_DO_CREW_MATCHMAKING(INT crewId, INT gameMode, INT maxPlayers, MM_FLAGS matchmakingFlags) = "0xf89241033fd1be74"
NATIVE FUNC BOOL NETWORK_SESSION_CREW_MATCHMAKING(INT nCrewID, INT nGameMode, MATCHMAKING_QUERY nQueryID, INT nMaxPlayers, BOOL bConsiderBlacklisted = TRUE) = "0xf30fea2284e69892"
					
//PURPOSE: Starts matchmaking by activity
//PARAM NOTES:
//  nActivityType - This is a script defined activity type (i.e., 0 - RACE, 1 - DM, etc.). Pass -1 to find a session with any activity.
//  nActivityTID - Instance of the activity (i.e. 0 - RACE #1, 1 - RACE #2, etc.). Pass -1 to find a session with any instance (i.e. any active RACE). 
//  Others		- See comments for NETWORK_SESSION_ENTER
NATIVE FUNC BOOL NETWORK_SESSION_DO_ACTIVITY_QUICKMATCH(INT gameMode, INT maxPlayers, INT activityType, INT activityId, MM_FLAGS matchmakingFlags) = "0xfc6d3544b7537f63"
NATIVE FUNC BOOL NETWORK_SESSION_ACTIVITY_QUICKMATCH(INT nGameMode, INT nMaxPlayers, INT nActivityType, INT nActivityID) = "0xbcd7e4351813fd9b"

//PURPOSE: Hosts a session
//PARAM NOTES:
//	nGameMode	- Gamemode value from script enum
//	nMaxPlayers - Max players that can join this session, including local player
//	bIsPrivate  - If this session is private (closed) or not
NATIVE FUNC BOOL NETWORK_SESSION_HOST(INT nGameMode, INT nMaxPlayers, BOOL bIsPrivate) = "0x4d16964e44441fde"

//PURPOSE: Hosts a session for friends only
//PARAM NOTES: See NETWORK_SESSION_HOST
NATIVE FUNC BOOL NETWORK_SESSION_HOST_CLOSED(INT nGameMode, INT nMaxPlayers) = "0x4bb69e9e1979380a"
NATIVE FUNC BOOL NETWORK_SESSION_HOST_FRIENDS_ONLY(INT nGameMode, INT nMaxPlayers) = "0x9ef3443c4282410b"
NATIVE FUNC BOOL NETWORK_SESSION_HOST_CLOSED_CREW(INT nGameMode, INT nMaxPlayers, INT nUniqueCrewLimit, INT nCrewLimitMaxMembers) = "0x78b67fdcd615ae9b"
NATIVE FUNC BOOL NETWORK_SESSION_IS_CLOSED_FRIENDS() = "0x475bc8e76eb32bcf"
NATIVE FUNC BOOL NETWORK_SESSION_IS_CLOSED_CREW() = "0x71be58f878f44990"
NATIVE FUNC BOOL NETWORK_SESSION_IS_SOLO() = "0x759d0daf85d68e42"
NATIVE FUNC BOOL NETWORK_SESSION_IS_PRIVATE() = "0xae3d31b16ca16e36"

//PURPOSE: Starts a network session (for scoring, leaderboard)
NATIVE FUNC BOOL NETWORK_SESSION_START() = "0x641bd154dc8ae58b"

//PURPOSE: Ends a network session
//PARAM NOTES:
//	bReturnToLobby - FALSE to leave this session, TRUE to remain (and return to the lobby state)
//	bBlacklist - Blacklist this session for 5 minutes, it will not be used for matchmaking (unless there are no other sessions)
NATIVE FUNC BOOL NETWORK_SESSION_END(BOOL bReturnToLobby = FALSE, BOOL bBlacklist = FALSE) = "0xf6acec1a6287c705"

//PURPOSE: Leaves a network session (equivalent to NETWORK_SESSION_END)
//PARAM NOTES:
//	leaveFlags - Bit flags built from LEAVE_FLAGS
NATIVE FUNC BOOL NETWORK_SESSION_LEAVE(INT leaveFlags) = "0x50b2810d3b7843fe"

//PURPOSE: Kicks the given player from the session. Callable only by the host.
NATIVE PROC NETWORK_SESSION_KICK_PLAYER(PLAYER_INDEX NetPlayerID) = "0x17e8dd474e0627a5"

//PURPOSE: Returns true if the local player has voted for "NetPlayerID" to be kicked.
NATIVE FUNC BOOL NETWORK_SESSION_GET_KICK_VOTE(PLAYER_INDEX NetPlayerID) = "0xd2fd411ff335d42c"

//PURPOSE: Reserves slots in a session for provided gamers for reservation time (specified in ms)
NATIVE FUNC BOOL NETWORK_SESSION_RESERVE_SLOTS(STRUCT_GAMER_HANDLES_MAX_MINUS_ONE &hGamers, INT nNumGamers, INT nReservationTime) = "0x5d99ab2129dfe78d"
NATIVE FUNC BOOL NETWORK_SESSION_RESERVE_SLOTS_TRANSITION(STRUCT_GAMER_HANDLES_MAX_MINUS_ONE &hGamers, INT nNumGamers, INT nReservationTime) = "0x88da4f663b1c2d66"

//PURPOSE: 
NATIVE FUNC BOOL NETWORK_RESERVE_SLOT_AND_LEAVE_SESSION(INT nReservationTimeout) = "0x8aceba35df3d6911"
NATIVE FUNC BOOL NETWORK_JOIN_PREVIOUS_SESSION(BOOL bMatchmakeOnFailure) = "0x7ae1e3e3f453cd19"
NATIVE FUNC BOOL NETWORK_JOIN_PREVIOUSLY_FAILED_SESSION() = "0x63cda6a59e3d4d76"
NATIVE FUNC BOOL NETWORK_JOIN_PREVIOUSLY_FAILED_TRANSITION() = "0x56edc48b6f7744cc"

//PURPOSE: Functions to allow script to set the matchmaking group for the local player and the maximum 
//		   number of players in each group
//PARAM NOTES:
//	nGroup - One of MATCHMAKING_GROUP
NATIVE PROC NETWORK_SESSION_SET_MATCHMAKING_GROUP(MATCHMAKING_GROUP nGroup) = "0xe9d48fd08fce8baf"
NATIVE PROC NETWORK_SESSION_SET_MATCHMAKING_GROUP_MAX(MATCHMAKING_GROUP nGroup, INT nMaximum) = "0x8f670fe2c81e0851"
NATIVE FUNC INT NETWORK_SESSION_GET_MATCHMAKING_GROUP_MAX(MATCHMAKING_GROUP nGroup) = "0xef89522b3dff3d92"
NATIVE FUNC INT NETWORK_SESSION_GET_MATCHMAKING_GROUP_NUM(MATCHMAKING_GROUP nGroup) = "0x1d3a9feb9db50aea"
NATIVE FUNC INT NETWORK_SESSION_GET_MATCHMAKING_GROUP_FREE(MATCHMAKING_GROUP nGroup) = "0x22d50123305d6613"
NATIVE PROC NETWORK_SESSION_ADD_ACTIVE_MATCHMAKING_GROUP(MATCHMAKING_GROUP nGroup) = "0xf731eb28bc1b34be"

//PURPOSE: Functions to allow script to validate a join. These are used to allow join failure for conditions
//		   that may not be checked in code allowing us to re-enter the matchmaking flow. 
//		   Call NETWORK_SESSION_SET_SCRIPT_VALIDATE_JOIN when script run condition checks after joining to enable.
//PARAM NOTES:
//	bJoinSuccessful - Result of script checks on whether player can join the session. 
NATIVE PROC NETWORK_SESSION_SET_SCRIPT_VALIDATE_JOIN() = "0x72a439f08c4282ae"
NATIVE PROC NETWORK_SESSION_VALIDATE_JOIN(BOOL bJoinSuccessful) = "0x165391fd0245d8d8"

//PURPOSE: Functions to add / remove / inspect followers. Followers are players who will, cross session,
//		   be able to 'follow' the target user from session to session (via presence invite)
//
NATIVE PROC NETWORK_ADD_FOLLOWERS(STRUCT_TO_FREEMODE_GAMERS &hGamers, INT nNumGamers) = "0x07c6df94e0485131"
NATIVE PROC NETWORK_REMOVE_FOLLOWERS(STRUCT_TO_FREEMODE_GAMERS &hGamers, INT nNumGamers) = "0xee334359153b89f8"
NATIVE FUNC BOOL NETWORK_HAS_FOLLOWER(GAMER_HANDLE& hGamer) = "0xa984a8f964c5fe82"
NATIVE PROC NETWORK_CLEAR_FOLLOWERS() = "0x539d32a62a91eda2"
NATIVE PROC NETWORK_RETAIN_FOLLOWERS(BOOL bRetain) = "0x1ed77373d489a89c"

//PURPOSE: Functions to allow script to deal with the clock and weather transition on entering multiplayer
//		   By default, code will handle this at the time of hosting / joining an online session
//
NATIVE PROC NETWORK_SET_SCRIPT_HANDLING_CLOCK_AND_WEATHER(BOOL bScriptHandling) = "0x8a785147c2a01aea"
NATIVE PROC NETWORK_APPLY_GLOBAL_CLOCK_AND_WEATHER(BOOL bDoTransition, INT nTransitionTime) = "0x0c8a0dbf6f4666fc"
NATIVE PROC NETWORK_GET_GLOBAL_MULTIPLAYER_CLOCK(INT& nHour, INT& nMinute, INT& nSecond) = "0x444ba2b7a6430595"
NATIVE PROC NETWORK_GET_GLOBAL_MULTIPLAYER_WEATHER(INT& nCycleIndex, INT& nCycleTimer) = "0xb26f0a320fc4396c"

//PURPOSE: Setup a unique crew limit. Passing 0 turns this feature off. Default is 0. 
NATIVE PROC NETWORK_SESSION_SET_UNIQUE_CREW_LIMIT(INT nUniqueCrewLimit) = "0x10967a26ceb155b4"
NATIVE PROC NETWORK_SESSION_SET_UNIQUE_CREW_ONLY_CREWS(BOOL bOnlyCrews) = "0xbe1e75a620d9430a"
NATIVE PROC NETWORK_SESSION_SET_CREW_LIMIT_MAX_MEMBERS(INT nMaxCrewMembers) = "0x32574b3805251471"
NATIVE FUNC INT NETWORK_SESSION_GET_UNIQUE_CREW_LIMIT() = "0xbf6e0b8f14d3ab7a"
NATIVE PROC NETWORK_SESSION_SET_UNIQUE_CREW_LIMIT_TRANSITION(INT nUniqueCrewLimit) = "0xfb425d8f7fc7c2d8"
NATIVE PROC NETWORK_SESSION_SET_UNIQUE_CREW_ONLY_CREWS_TRANSITION(BOOL bOnlyCrews) = "0x4561114f1bf3495e"
NATIVE PROC NETWORK_SESSION_SET_CREW_LIMIT_MAX_MEMBERS_TRANSITION(INT nMaxCrewMembers) = "0x11c17c15b0ef5b54"
NATIVE FUNC INT NETWORK_SESSION_GET_UNIQUE_CREW_LIMIT_TRANSITION() = "0x16980cef266b59aa"

//PURPOSE: Setup a matchmaking property ID. Use this to prefer to not include sessions with the same property ID
//         Multiple gamers in the same session with this property ID will affect the score more negatively
NATIVE PROC NETWORK_SESSION_SET_MATCHMAKING_PROPERTY_ID(INT nPropertyID) = "0x064ae0e51db91f84"

//PURPOSE: Setup a matchmaking mental state. Use this to prefer to include sessions with roughly the same average mental state of the players
NATIVE PROC NETWORK_SESSION_SET_MATCHMAKING_MENTAL_STATE(INT nMentalState) = "0x1f89cf2c5d8c3b0e"

//PURPOSE: Setup a matchmaking ELO. Use this for ranked games. ELO will be the only criteria considered if set (use 0 to reset)
NATIVE PROC NETWORK_SESSION_SET_MATCHMAKING_ELO(INT nELO) = "0x5700a64841dc762a"

//PURPOSE: Flags the player as a boss for matchmaking. We'll run additional checks against the number
//		   of bosses in remote sessions. 
NATIVE PROC NETWORK_SESSION_SET_ENTER_MATCHMAKING_AS_BOSS(BOOL bEnterMatchmakingAsBoss) = "0x904006f2f56124be"

//PURPOSE: Sets the number of bosses in a session. Must be maintained. 
NATIVE PROC NETWORK_SESSION_SET_NUM_BOSSES(INT nNumBosses) = "0xe74f9b0896fa985c"

//PURPOSE: Indicates to code what game-mode we'll be using
NATIVE PROC NETWORK_SESSION_SET_GAMEMODE(INT nGameMode) = "0x2f3b1c402bbcd490"

//PURPOSE: Indicates to code the state of the current game-mode
NATIVE PROC NETWORK_SESSION_SET_GAMEMODE_STATE(INT nGameModeState) = "0xb35d46c49fe00b61"

//PURPOSE: Returns the aim preference of the session host
NATIVE FUNC INT NETWORK_SESSION_GET_HOST_AIM_PREFERENCE() = "0x1447e546142312de"

//PURPOSE: Convert aim preference (three values) to matchmaking aim setting (two values)
NATIVE FUNC INT NETWORK_SESSION_AIM_PREFERENCE_AS_MATCHMAKING(INT nAimPreference) = "0x7c3cf92d9cdd6c3f"

//PURPOSE: Disable aim bucketing
//		   For NETWORK_SESSION_SET_AIM_BUCKETING_ENABLED, need to make sure this is set correctly on entry
//		   For NETWORK_SESSION_SET_AIM_BUCKETING_ENABLED_IN_ARCADE_GAME_MODES, should be able to set this once (providing the game mode is correct)
NATIVE PROC NETWORK_SESSION_SET_AIM_BUCKETING_ENABLED(BOOL bIsEnabled) = "0xf9527bb58885c6e6"
NATIVE PROC NETWORK_SESSION_SET_AIM_BUCKETING_ENABLED_IN_ARCADE_GAME_MODES(BOOL bIsEnabled) = "0xb41bd4275b68f437"

//PURPOSE: Access to find gamers functionality
NATIVE FUNC BOOL NETWORK_FIND_GAMERS(STRING szQueryName, STRING szQueryParams) = "0x547c9aaa7abae8ab"

//PURPOSE: Request a listing of the gamers in the given crew that are currently active
//PARAMS: 
//	crewID - crew to look for.  Use 0 for local player's primary crew.
NATIVE FUNC BOOL NETWORK_FIND_GAMERS_IN_CREW(INT crewId) = "0xeb25c2d9fb1a598c"

//PURPOSE: Request a listing of the gamers in the given crew that are currently active
//PARAMS: 
//	nActivityID - activity ID to use
//  fSkill - skill at activity from 0.0 to 1.0
//  fLowerLimit - lower limit of matched skill value (i.e. no lower than 0.7). Default of -1.0 means 0.1 less than provided skill
//  fUpperLimit - upper limit of matched skill value (i.e. no higher than 0.7). Default of -1.0 means 0.1 more than provided skill
NATIVE FUNC BOOL NETWORK_FIND_MATCHED_GAMERS(INT nActivityID, FLOAT fSkill, FLOAT fLowerLimit = -1.0, FLOAT fUpperLimit = -1.0) = "0xe7477a13549a68b7"

//PURPOSE: Track find gamer requests
NATIVE FUNC BOOL NETWORK_IS_FINDING_GAMERS() = "0x2e0788b843154db4"
NATIVE FUNC BOOL NETWORK_DID_FIND_GAMERS_SUCCEED() = "0xe28005259a662790"
NATIVE FUNC INT NETWORK_GET_NUM_FOUND_GAMERS() = "0x40aca0ebe122266f"
NATIVE FUNC BOOL NETWORK_GET_FOUND_GAMER(GAMER_INFO& hInfo, INT nIndex) = "0xd5a75a022ba7e2c9"
NATIVE FUNC INT NETWORK_GET_FOUND_GAMERS(NETWORK_FIND_GAMERS_RESULT& hResult, INT sizeOfData) = "0x02c58d2f3aa5c013"
NATIVE PROC NETWORK_CLEAR_FOUND_GAMERS() = "0xba60cc16ced5216f"

//PURPOSE: Gamer status
NATIVE FUNC BOOL NETWORK_GET_GAMER_STATUS(NETWORK_GAMER_STATUS_HANDLES& hGamers, INT nGamers) = "0x8a0da3b9add776e1"
NATIVE FUNC BOOL NETWORK_QUEUE_GAMER_FOR_STATUS(GAMER_HANDLE& hGamer) = "0xc08fbee09cad00b2"
NATIVE FUNC BOOL NETWORK_GET_GAMER_STATUS_FROM_QUEUE() = "0x80e814e6e16ea989"
NATIVE FUNC BOOL NETWORK_IS_GETTING_GAMER_STATUS() = "0x4fa16ea51240f436"
NATIVE FUNC BOOL NETWORK_DID_GET_GAMER_STATUS_SUCCEED() = "0x50ad211cb2a0913c"
NATIVE FUNC BOOL NETWORK_GET_GAMER_STATUS_RESULT(NETWORK_GET_GAMER_STATUS_RESULT_STRUCT& hResult, INT nIndex) = "0x983e95d315dda7a2"
NATIVE FUNC INT NETWORK_GET_GAMER_STATUS_RESULTS(NETWORK_GET_GAMER_STATUS_RESULTS_STRUCT& hResults, INT sizeOfData) = "0x333f26e281eee7ca"
NATIVE PROC NETWORK_CLEAR_GET_GAMER_STATUS() = "0xd80e1a7801342311"

//PURPOSE: Joins the session indicated by the pending invite
NATIVE PROC NETWORK_SESSION_JOIN_INVITE() = "0x1ef092ff526f5bb1"

//PURPOSE: Cancels the pending invite. Required if the player will not be joining a confirmed invite. 
NATIVE PROC NETWORK_SESSION_CANCEL_INVITE() = "0xcd428921d8c5716f"

//PURPOSE: Force cancel an invite. This abandons any ongoing invite operation. 
NATIVE PROC NETWORK_SESSION_FORCE_CANCEL_INVITE() = "0xaa4b996ed190284d"

//PURPOSE: Query pending invite
NATIVE FUNC BOOL NETWORK_HAS_PENDING_INVITE() = "0x037acda09b3dde99"
NATIVE FUNC BOOL NETWORK_GET_PENDING_INVITER(GAMER_HANDLE& hGamer) = "0xcc6720dcc4e1b598"
NATIVE FUNC BOOL NETWORK_HAS_CONFIRMED_INVITE() = "0xc47bd4b810c44f4d"
NATIVE FUNC BOOL NETWORK_REQUEST_INVITE_CONFIRMED_EVENT() = "0x6158057329afeffe"

//PURPOSE: Returns TRUE if the player was invited to the current session
NATIVE FUNC BOOL NETWORK_SESSION_WAS_INVITED() = "0xe103dea13a894e9c"

//PURPOSE: Fills in gamer handle of player who invited us to this session. 
//         This asserts if NETWORK_SESSION_WAS_INVITED is FALSE
NATIVE PROC NETWORK_SESSION_GET_INVITER(GAMER_HANDLE& gamerHandle) = "0x6459e246cc88f414"

//PURPOSE: Returns TRUE if we have accepted an invite through the platform UI (Guide / XMB) and are 
//         now awaiting session details and user confirmation. 
NATIVE FUNC BOOL NETWORK_SESSION_IS_AWAITING_INVITE_RESPONSE() = "0x11c5877ec40676f2"

//PURPOSE: Returns TRUE if we are displaying invite confirmation alert
// 
NATIVE FUNC BOOL NETWORK_SESSION_IS_DISPLAYING_INVITE_CONFIRMATION() = "0x22052c08a1e9a10c"

//PURPOSE: Use this to suppress invite processing. Make sure to reset it when we're back to a good state.
NATIVE PROC NETWORK_SUPPRESS_INVITE(BOOL bSuppress) = "0xee3aced204f48810"

//PURPOSE: Use this to block invites from being actioned. 
//		   This keeps the invite around. An EVENT_NETWORK_INVITE_ACCEPTED still fires. 
//		   Script must call NETWORK_SESSION_CANCEL_INVITE if we do not want to action the invite. 
//		   Reset to unblocked when no longer required
//
NATIVE PROC NETWORK_BLOCK_INVITES(BOOL bBlocked) = "0x494b84826e4a775e"

//PURPOSE: Use this to block join queue invites. Use this when the player is in an
//		   activity or cutscene that we'd prefer not to interupt with an invite screen
//
NATIVE PROC NETWORK_BLOCK_JOIN_QUEUE_INVITES(BOOL bBlocked) = "0x7a4832d97838593a"

//PURPOSE: Use this to set whether script can process presence invites or not
//         If FALSE and we receive a direct presence invite, we will request that the user send
///        us a platform invite instead. Can be used during periods where we have no phone, etc
//
NATIVE PROC NETWORK_SET_CAN_RECEIVE_PRESENCE_INVITES(BOOL canReceive) = "0x68980414688f7f9d"

//PURPOSE: Use this to flag that an invite should be kept through a restart. 
//	       Only call when the user has confirmed to restart
//
NATIVE PROC NETWORK_STORE_INVITE_THROUGH_RESTART() = "0xd225981938e1b6e2"

//PURPOSE: Use this to inform code that an invite can be processed during a player switch
//         This is normally blocked.
//
NATIVE PROC NETWORK_ALLOW_INVITE_PROCESS_IN_PLAYER_SWITCH(BOOL bAllow) = "0xf5a922e33c0f5c5f"

//PURPOSE: Use this to inform code that script can accept network events
NATIVE PROC NETWORK_SET_SCRIPT_READY_FOR_EVENTS(BOOL bReady) = "0x172705bf7bd84016"

//PURPOSE: Offline pending invites query
NATIVE FUNC BOOL NETWORK_IS_OFFLINE_INVITE_PENDING() = "0xe479c7aee6c63853"
NATIVE PROC NETWORK_CLEAR_OFFLINE_INVITE_PENDING() = "0x3a4820320cc5c2cf"

//PURPOSE: Hosts a single player session. This is a one player, private session that is not invitable and cannot be
//		   joined via matchmaking. 
NATIVE PROC NETWORK_SESSION_HOST_SINGLE_PLAYER(INT nGameMode) = "0x801d341952c9af98"

//PURPOSE: Leave a single player session. 
NATIVE PROC NETWORK_SESSION_LEAVE_SINGLE_PLAYER() = "0xee912a00d41f4c46"

//~>				STATE QUERIES

//PURPOSE: Returns TRUE when the network game is in progress
NATIVE FUNC BOOL NETWORK_IS_GAME_IN_PROGRESS() = "0x9315dbf7d972f07a"

//PURPOSE: Returns TRUE when the session is in any state other than NONE
NATIVE FUNC BOOL NETWORK_IS_SESSION_ACTIVE() = "0x71880ce67ee81f91"

//PURPOSE: Returns TRUE when the session has been successfully hosted or joined
NATIVE FUNC BOOL NETWORK_IS_IN_SESSION() = "0xdb51af48abe62d4d"

//PURPOSE: Returns TRUE when the session is currently in the lobby state
NATIVE FUNC BOOL NETWORK_IS_SESSION_IN_LOBBY() = "0xdbe4fb0f2dd08002"

//PURPOSE: Returns TRUE when the session has been started
NATIVE FUNC BOOL NETWORK_IS_SESSION_STARTED() = "0x9a404ee97d1ef300"

//PURPOSE: Returns TRUE when the session is processing some operation
NATIVE FUNC BOOL NETWORK_IS_SESSION_BUSY() = "0xe72acfddb5ccc601"

//PURPOSE: Returns TRUE if the network session is in a position to start
NATIVE FUNC BOOL NETWORK_CAN_SESSION_START() = "0x7d18136d29a2ea22"

//PURPOSE: Returns TRUE if the network session is in a position to end
NATIVE FUNC BOOL NETWORK_CAN_SESSION_END() = "0x60b8249e57ce7597"

//PURPOSE: Returns TRUE if the network game has been unlocked by the unlock DLC
NATIVE FUNC BOOL NETWORK_IS_UNLOCKED() = "0x9563252d97dff191"

//~>				SESSION QUERY FUNCTIONS

//PURPOSE: Returns the game mode.
NATIVE FUNC INT NETWORK_GET_GAME_MODE() = "0x0195e751969c01b7"

//PURPOSE: Marks the session as visi ble to matchmaking services
NATIVE PROC NETWORK_SESSION_MARK_VISIBLE(BOOL bIsVisible) = "0x8f59f9682600ad99"

//PURPOSE: Returns whether the session is visible or not
NATIVE FUNC BOOL NETWORK_SESSION_IS_VISIBLE() = "0x0412b2e191de23cd"

//PURPOSE: Lock session visibility. 
//         bLockVisibility - Locked or not
//		   bLockSetting - Locked to be visible or not
//
NATIVE PROC NETWORK_SET_SESSION_VISIBILITY_LOCK(BOOL bLockVisibility, BOOL bLockSetting) = "0x87a3511ed11fd087"
NATIVE FUNC BOOL NETWORK_IS_SESSION_VISIBILITY_LOCKED() = "0x479d1c83409db6f8"

//PURPOSE: Session host will block incoming join requests. Use this to disable players joining via JvP / Invites. 
NATIVE PROC NETWORK_SESSION_BLOCK_JOIN_REQUESTS(BOOL bBlockJoinRequests) = "0xe774eb358f283b99"
NATIVE FUNC BOOL NETWORK_SESSION_IS_BLOCKING_JOIN_REQUESTS() = "0xcf83001bc6ace38e"

//PURPOSE: Change session slots
NATIVE PROC NETWORK_SESSION_CHANGE_SLOTS(INT nPublicSlots, INT nPrivateSlots) = "0x5741bea5adf3bcec"

//PURPOSE: Returns the maximum available slots
NATIVE FUNC INT NETWORK_SESSION_GET_SLOTS() = "0xf45ccab7f316d6ce"

//PURPOSE: Returns the maximum available private slots
NATIVE FUNC INT NETWORK_SESSION_GET_PRIVATE_SLOTS() = "0xf0cf1e6013de39ca"

//PURPOSE: Returns TRUE if players can be invited to this session
NATIVE FUNC BOOL NETWORK_SESSION_IS_INVITABLE() = "0xd5ab84616a1fdd46"

//~>				VOICE SESSION FUNCTIONS

//PURPOSE: Host a voice session
NATIVE FUNC BOOL NETWORK_SESSION_VOICE_HOST() = "0x905b0bf2f73efae6"

//PURPOSE: Leave a voice session (as host or client)
NATIVE FUNC BOOL NETWORK_SESSION_VOICE_LEAVE() = "0x39fc9dedbef0b2ce"

//PURPOSE: Requests connection to player indicated by hGamer (host only)
NATIVE PROC NETWORK_SESSION_VOICE_CONNECT_TO_PLAYER(GAMER_HANDLE& hGamer) = "0x1532f8d9de88d9ac"

//PURPOSE: Responds to a request to start a voice session (client only)
NATIVE PROC NETWORK_SESSION_VOICE_RESPOND_TO_REQUEST(BOOL bAccept, INT nReponseCode) = "0x5aa72b892713abc8"

//PURPOSE: Sets the timeout time for a response to be made in voice session
NATIVE PROC NETWORK_SESSION_VOICE_SET_TIMEOUT(INT nTimeout) = "0xe23fe31c53b11070"

//PURPOSE: Returns TRUE if local player is in a voice session
NATIVE FUNC BOOL NETWORK_SESSION_IS_IN_VOICE_SESSION() = "0xee03516f1f1a249b"
NATIVE FUNC BOOL NETWORK_SESSION_IS_VOICE_SESSION_ACTIVE() = "0xc9c5c792162fc9e3"

//PURPOSE: Returns TRUE if the voice session is busy
NATIVE FUNC BOOL NETWORK_SESSION_IS_VOICE_SESSION_BUSY() = "0x8d9b0ad025e894ad"

//~>				TEXT MESSAGING

//PURPOSE: Send an unencrypted text message to another player
NATIVE FUNC BOOL NETWORK_SEND_TEXT_MESSAGE(STRING szTextMessage, GAMER_HANDLE& hGamer) = "0xde0e57421b7105aa"

//~>				TRANSITION SESSION FUNCTIONS

//PURPOSE: Spectator setup for activity / transition sessions
//   
NATIVE PROC NETWORK_SET_ACTIVITY_SPECTATOR(BOOL bIsSpectator) = "0xdf0dd66cb9bf5605"
NATIVE FUNC BOOL NETWORK_IS_ACTIVITY_SPECTATOR() = "0x1c564a7701da1a97"
NATIVE PROC NETWORK_SET_ACTIVITY_PLAYER_MAX(INT nPlayerMax) = "0x6af9c3c7f4e5a1ae"
NATIVE PROC NETWORK_SET_ACTIVITY_SPECTATOR_MAX(INT nSpectatorMax) = "0x59b41141da370417"

//PURPOSE: Access to current player / spectator numbers
//		   Make bSpectator TRUE to query spectators
//		   Make bSpectator FALSE to query players
//  
NATIVE FUNC INT NETWORK_GET_ACTIVITY_PLAYER_MAX(BOOL bSpectator) = "0xc556d9e06bf62917"
NATIVE FUNC INT NETWORK_GET_ACTIVITY_PLAYER_NUM(BOOL bSpectator) = "0xb196205f363c4679"

//PURPOSE: Use this to check if a player is a spectator
//
NATIVE FUNC BOOL NETWORK_IS_ACTIVITY_SPECTATOR_FROM_HANDLE(GAMER_HANDLE& hGamer) = "0xa3c3653d4d7611b3"

//PURPOSE: Host a transition session
//         
NATIVE FUNC BOOL NETWORK_HOST_TRANSITION(INT nGameMode, INT nMaxPlayers, INT nActivityType, INT nActivityID, BOOL bIsPrivate, BOOL bIsOpen, BOOL bFromMatchmaking = FALSE, ACTIVITY_ISLAND nActivityIsland = ACTIVITY_ISLAND_GENERAL, JOB_CONTENT_CREATOR nContentCreator = JOB_CONTENT_ROCKSTAR_CREATED, INT nHostFlags = 0) = "0x1398d0f9f78f82ec"

NATIVE FUNC BOOL NETWORK_HOST_TRANSITION_FRIENDS_ONLY(INT nGameMode, INT nMaxPlayers, INT nActivityType, INT nActivityID, ACTIVITY_ISLAND nActivityIsland = ACTIVITY_ISLAND_GENERAL, JOB_CONTENT_CREATOR nContentCreator = JOB_CONTENT_ROCKSTAR_CREATED) = "0xbf753df78efd316e"
NATIVE FUNC BOOL NETWORK_HOST_TRANSITION_CLOSED_CREW(INT nGameMode, INT nMaxPlayers, INT nUniqueCrewLimit, INT nCrewLimitMaxMembers, INT nActivityType, INT nActivityID, ACTIVITY_ISLAND nActivityIsland = ACTIVITY_ISLAND_GENERAL, JOB_CONTENT_CREATOR nContentCreator = JOB_CONTENT_ROCKSTAR_CREATED) = "0xf3fd646567a12af5"
NATIVE FUNC BOOL NETWORK_IS_TRANSITION_CLOSED_FRIENDS() = "0x8a29d9dfe80cdf74"
NATIVE FUNC BOOL NETWORK_IS_TRANSITION_CLOSED_CREW() = "0xa4fa87f337733327"
NATIVE FUNC BOOL NETWORK_IS_TRANSITION_SOLO() = "0xf1fe0daefbbd12a8"
NATIVE FUNC BOOL NETWORK_IS_TRANSITION_PRIVATE() = "0xd6c85d0beb8056cb"

//PURPOSE: Find a transition session. 
//         If nActivityType is -1, we will find any open transition session (any activity)
//		   Otherwise, if nActivityID is 0, we will find any open transition of the type specified by nActivityType
//         If matchmaking fails to find any results, we will host our own session if both nActivityType and nActivityID are valid. 
//         
NATIVE FUNC BOOL NETWORK_DO_TRANSITION_QUICKMATCH(INT nGameMode, INT nMaxPlayers, INT nActivityType, INT nActivityID, INT nMmFlags = 0, ACTIVITY_ISLAND nActivityIsland = ACTIVITY_ISLAND_INVALID) = "0xd6f501e6218978f9"
NATIVE FUNC BOOL NETWORK_DO_TRANSITION_QUICKMATCH_ASYNC(INT nGameMode, INT nMaxPlayers, INT nActivityType, INT nActivityID, INT nMmFlags = 0, ACTIVITY_ISLAND nActivityIsland = ACTIVITY_ISLAND_INVALID) = "0x6bb7ac70c80fd843"

//PURPOSE: Find a transition session. 
//		   Variant of above that works with a group
//
NATIVE FUNC BOOL NETWORK_DO_TRANSITION_QUICKMATCH_WITH_GROUP(INT nGameMode, INT nMaxPlayers, INT nActivityType, INT nActivityID, STRUCT_TO_FREEMODE_GAMERS &hGamers, INT nNumGamers, INT nMmFlags = 0, ACTIVITY_ISLAND nActivityIsland = ACTIVITY_ISLAND_INVALID) = "0x78be45180a6021f8"

// Group activity functions
//
NATIVE FUNC BOOL NETWORK_JOIN_GROUP_ACTIVITY() = "0xbc3651324870cfe8"
NATIVE PROC NETWORK_CLEAR_GROUP_ACTIVITY() = "0x9d91ff2076e04630"
NATIVE PROC NETWORK_RETAIN_ACTIVITY_GROUP() = "0x12f1be6efbbf2922"

//PURPOSE: Returns whether there are any non-async gamers in our transition session
NATIVE FUNC INT NETWORK_GET_NUM_TRANSITION_NON_ASYNC_GAMERS() = "0xb5f539de635abecd"

//PURPOSE: Transition user data
//		   Set the gamer handle of the creator of the mission that the player is 
//         currently part of. This will be used for matchmaking (to check if the 
//         creator is a friend of searching players)
NATIVE PROC NETWORK_MARK_AS_PREFERRED_ACTIVITY(BOOL bIsPreferred) = "0x2260ad62144304a0"
NATIVE PROC NETWORK_MARK_AS_WAITING_ASYNC(BOOL bIsWaitingAsync) = "0xff425aace63d7e9b"
NATIVE PROC NETWORK_SET_IN_PROGRESS_FINISH_TIME(INT nInProgressFinishTime) = "0x2af716848d922171"
NATIVE PROC NETWORK_SET_TRANSITION_CREATOR_HANDLE(GAMER_HANDLE& gamerHandle) = "0x524a78491eb1818c"
NATIVE PROC NETWORK_CLEAR_TRANSITION_CREATOR_HANDLE() = "0x0904a23cb7a5daad"

//PURPOSE: Functions to invite a gamer or gamers into the transition session
NATIVE FUNC BOOL NETWORK_INVITE_GAMER_TO_TRANSITION(GAMER_HANDLE& hGamer) = "0x446438906b8f5c41"
NATIVE FUNC BOOL NETWORK_INVITE_GAMERS_TO_TRANSITION(TRANSITION_INVITE& hInvite, INT nNumGamers) = "0x288ceca35eaa6050"

//PURPOSE: Used for players that are already in the session with you when you invite them, i.e. they get the invite through the cell phone instead of a system message
// (i.e. when not using NETWORK_INVITE_GAMER_TO_TRANSITION or NETWORK_INVITE_GAMERS_TO_TRANSITION)
NATIVE PROC NETWORK_SET_GAMER_INVITED_TO_TRANSITION(GAMER_HANDLE& hGamer) = "0xd8a2ba1ede0272df"
NATIVE PROC NETWORK_SET_GAMERS_INVITED_TO_TRANSITION(TRANSITION_INVITE& hInvite, INT nNumGamers) = "0x1b2e6c4f03ec0458"

//PURPOSE: This leaves the transition session. This should be called if the player
//         wants to leave the transition before it is launched
NATIVE FUNC BOOL NETWORK_LEAVE_TRANSITION() = "0x096db41969983f1e"

//PURPOSE: Cancels any ongoing activity matchmaking
NATIVE PROC NETWORK_CANCEL_TRANSITION_MATCHMAKING() = "0x023782efc70585ee"

//PURPOSE: Rain of fire. Leave nothing behind. Affects transition only. Freemode untouched. 
NATIVE PROC NETWORK_BAIL_TRANSITION(INT nContext, INT nParam1 = 0, INT nParam2 = 0) = "0x6a687bcff5d10f9d"

//PURPOSE: As above but also cancels matchmaking
NATIVE PROC NETWORK_BAIL_ALL_TRANSITION(INT nContext, INT nParam1 = 0, INT nParam2 = 0) = "0x609b45df902cedc6"

//PURPOSE: This will establish the transition session as the new 'main' session. 
//         The existing session (if this exists) will be closed and the transition
//         session will become 'solid'
NATIVE FUNC BOOL NETWORK_LAUNCH_TRANSITION() = "0xb26408b455a3878d"

//PURPOSE: Stops a launch proceeding if we become host prior to the launch (via migration)
NATIVE PROC NETWORK_SET_DO_NOT_LAUNCH_FROM_JOIN_AS_MIGRATED_HOST(BOOL bLaunch) = "0xf5a59877f0e087ca"

//PURPOSE: Returns TRUE if the transition has launched (having called NETWORK_LAUNCH_TRANSITION)
NATIVE FUNC BOOL NETWORK_HAS_LAUNCHED_TRANSITION() = "0xd7ff37b6284f2bbb"

// ----> TO_GAME variants will be deprecated

//PURPOSE: This will transition back to freemode from a launched activity session.
//         All players returning to freemode should call this (including a quit)
//         bWithPlayers should only be used on session host and indicates that we'll
//         inform the remaining players to come with us. Use when host hits 'continue'
//		   nMaxPlayers is used if we cannot find a match and need to host.  
NATIVE FUNC BOOL NETWORK_DO_TRANSITION_TO_GAME(BOOL bWithPlayers, INT nMaxPlayers) = "0x9b5ddc2207b89984"

//PURPOSE: This will transition back to freemode from a launched activity session.
//         Like above but we immediately host a session. 
NATIVE FUNC BOOL NETWORK_DO_TRANSITION_TO_NEW_GAME(BOOL bWithPlayers, INT nMaxPlayers, BOOL bIsPrivate) = "0x64aab99998b1902f"

//PURPOSE: Check for temporary blocking conditions that prevent a transition from occurring. 
//         Will eventually return TRUE. Wrap calls to below functions in this. 
NATIVE FUNC BOOL NETWORK_CAN_TRANSITION_TO_FREEMODE() = "0xf688adf28bd0a65f"

//PURPOSE: This will transition back to freemode from a launched activity session.
//         All players returning to freemode should call this (including a quit)
//         This takes an array of gamer handles of players that we should take with us.
//		   Specify 0 for nNumGamers to quit back solo
//		   nMaxPlayers is used if we cannot find a match and need to host.  
NATIVE FUNC BOOL NETWORK_DO_TRANSITION_TO_FREEMODE(STRUCT_TO_FREEMODE_GAMERS &hGamers, INT nNumGamers, BOOL bSocialMatchmaking, INT nMaxPlayers, INT nMmFlags = 0) = "0x696ac5b55dff5bbf"

//PURPOSE: This will transition back to freemode from a launched activity session.
//         Like above but we immediately host a session. 
NATIVE FUNC BOOL NETWORK_DO_TRANSITION_TO_NEW_FREEMODE(STRUCT_TO_FREEMODE_GAMERS &hGamers, INT nNumGamers, INT nMaxPlayers, BOOL bIsPrivate, BOOL bAllowPreviousJoin = TRUE, INT nHostFlags = 0) = "0x81ffc7159bd4d4e3"

//PURPOSE: This will transition back to freemode from a launched activity session.
//         All players returning to freemode should call this (including a quit)
//         This takes an array of gamer handles of players that we should take with us.
//		   Specify 0 for nNumGamers to quit back solo
//		   nMaxPlayers is used if we cannot find a match and need to host.  
NATIVE FUNC BOOL NETWORK_DO_TRANSITION_FROM_ACTIVITY(INT nGameMode, STRUCT_TO_FREEMODE_GAMERS &hGamers, INT nNumGamers, BOOL bSocialMatchmaking, INT nMaxPlayers, INT nMmFlags = 0) = "0xdf4c7fa21092b7e0"

//PURPOSE: This will transition back to freemode from a launched activity session.
//         Like above but we immediately host a session. 
NATIVE FUNC BOOL NETWORK_DO_TRANSITION_FROM_ACTIVITY_TO_NEW_SESSION(INT nGameMode, STRUCT_TO_FREEMODE_GAMERS &hGamers, INT nNumGamers, INT nMaxPlayers, BOOL bIsPrivate, BOOL bAllowPreviousJoin = TRUE, INT nHostFlags = 0) = "0x0c023ec8d2100834"

//PURPOSE: To game query 
// 
NATIVE FUNC BOOL NETWORK_IS_TRANSITION_LAUNCHING() = "0x246be70e9a31cc24"
NATIVE FUNC BOOL NETWORK_IS_TRANSITION_TO_GAME() = "0xac90bfbb6f69ca39"

//PURPOSE: Gets members in the transition session
NATIVE FUNC INT NETWORK_GET_TRANSITION_MEMBERS(TRANSITION_MEMBERS& hInvite, INT nMaxMembers) = "0x34663e18b60160aa"

//PURPOSE: Applies a parameter to the local transition player. This parameter will be synced to
//         other players in the transiton session
NATIVE PROC NETWORK_APPLY_TRANSITION_PARAMETER(INT nID, INT nValue) = "0x8a895889ad10b26b"

//PURPOSE: Applies a string parameter. 
NATIVE PROC NETWORK_APPLY_TRANSITION_PARAMETER_STRING(INT nID, STRING szParameter, BOOL bForceDirty = FALSE) = "0x4f10ea896aa65d46"

//PURPOSE: Sends an instruction to a gamer in a transition session 
NATIVE FUNC BOOL NETWORK_SEND_TRANSITION_GAMER_INSTRUCTION(GAMER_HANDLE& hGamer, STRING szGamerName, INT nInstruction, INT nInstructionParam, BOOL bBroadcast) = "0x38a527b48c900279"

//PURPOSE: Script should set this when they consider a player as fully joined
NATIVE FUNC BOOL NETWORK_MARK_TRANSITION_GAMER_AS_FULLY_JOINED(GAMER_HANDLE& hGamer) = "0xa6c47230497da3cb"

//PURPOSE: Transition session queries
//
NATIVE FUNC BOOL NETWORK_IS_TRANSITION_HOST() = "0x9d371965ec031ac5"
NATIVE FUNC BOOL NETWORK_IS_TRANSITION_HOST_FROM_HANDLE(GAMER_HANDLE& gamerHandle) = "0x94a61aceae6f60f0"
NATIVE FUNC BOOL NETWORK_GET_TRANSITION_HOST(GAMER_HANDLE& gamerHandle) = "0x12b6a0b76221d332"
NATIVE FUNC BOOL NETWORK_IS_IN_TRANSITION() = "0xb471dbf7b15b22e6"
NATIVE FUNC BOOL NETWORK_IS_TRANSITION_STARTED() = "0xe140e76445205b6b"
NATIVE FUNC BOOL NETWORK_IS_TRANSITION_BUSY() = "0x74e92db9cf6fb1ba"
NATIVE FUNC BOOL NETWORK_IS_TRANSITION_MATCHMAKING() = "0x6d5974b117818e44"
NATIVE FUNC BOOL NETWORK_IS_TRANSITION_LEAVE_POSTPONED() = "0xfb1ba1b14ac51416"

//PURPOSE: These functions allow the in progress setting of a session to be changed
//		   Only specific searches will find in progress sessions 
NATIVE PROC NETWORK_MAIN_SET_IN_PROGRESS(BOOL bInProgress) = "0x41d51141e7df04d0"
NATIVE FUNC BOOL NETWORK_MAIN_GET_IN_PROGRESS() = "0xe2dbd27f94b98f89"
NATIVE PROC NETWORK_TRANSITION_SET_IN_PROGRESS(BOOL bInProgress) = "0x753a9fc0d9cb1c16"
NATIVE FUNC BOOL NETWORK_TRANSITION_GET_IN_PROGRESS() = "0xda8954415ba7b803"

//PURPOSE: These functions indicate where the content was created for activities / jobs
//		   Can optionally search for specific content using MM_FLAG_ROCKSTAR_CONTENT_ONLY / MM_FLAG_USER_CONTENT_ONLY
NATIVE PROC NETWORK_MAIN_SET_CONTENT_CREATOR(JOB_CONTENT_CREATOR nContentCreator) = "0xbda7c6d6164f7584"
NATIVE FUNC INT NETWORK_MAIN_GET_CONTENT_CREATOR() = "0x686ebd5c32a2dd44"
NATIVE PROC NETWORK_TRANSITION_SET_CONTENT_CREATOR(JOB_CONTENT_CREATOR nContentCreator) = "0xc9c88e798ec297ea"
NATIVE FUNC INT NETWORK_TRANSITION_GET_CONTENT_CREATOR() = "0xec7d73f21d821adc"

//PURPOSE: This allows us to separate activities / jobs into groups / islands for matchmaking purposes
//		   Some examples are above, we can search for a specific group (or any group)
NATIVE PROC NETWORK_MAIN_SET_ACTIVITY_ISLAND(ACTIVITY_ISLAND nActivityIsland) = "0x3ebef9ecaaf4ec06"
NATIVE FUNC INT NETWORK_MAIN_GET_ACTIVITY_ISLAND() = "0x24c16f77a772bbb6"
NATIVE PROC NETWORK_TRANSITION_SET_ACTIVITY_ISLAND(ACTIVITY_ISLAND nActivityIsland) = "0x1f3fb25f4779d842"
NATIVE FUNC INT NETWORK_TRANSITION_GET_ACTIVITY_ISLAND() = "0xae8b45905dc88aa4"

//PURPOSE: These functions allow the session to be added or removed from matchmaking. 
//         When removed, the only way into the session is via invite
NATIVE PROC NETWORK_OPEN_TRANSITION_MATCHMAKING() = "0x22721e5038087670"
NATIVE PROC NETWORK_CLOSE_TRANSITION_MATCHMAKING() = "0x6c2d37b816bff43c"
NATIVE FUNC BOOL NETWORK_IS_TRANSITION_OPEN_TO_MATCHMAKING() = "0xc2a0f113377f174e"

//PURPOSE: Lock session visibility. 
//         bLockVisibility - Locked or not
//		   bLockSetting - Locked to be visible or not
//
NATIVE PROC NETWORK_SET_TRANSITION_VISIBILITY_LOCK(BOOL bLockVisibility, BOOL bLockSetting) = "0xd8265caaeee57a7c"
NATIVE FUNC BOOL NETWORK_IS_TRANSITION_VISIBILITY_LOCKED() = "0x675f82e042ad90ca"

//PURPOSE: Use this to change transition config setup
//         Needed if we host our own transition from a quickmatch with no given parameters
NATIVE PROC NETWORK_SET_TRANSITION_ACTIVITY_TYPE(INT nActivityType) = "0x7810a95e183db427"
NATIVE PROC NETWORK_SET_TRANSITION_ACTIVITY_ID(INT nActivityID) = "0xd49688dfd5f33dd7"
NATIVE PROC NETWORK_CHANGE_TRANSITION_SLOTS(INT nPublicSlots, INT nPrivateSlots) = "0x41dd82d37d2eb027"
NATIVE FUNC INT NETWORK_TRANSITION_GET_MAXIMUM_SLOTS() = "0xc5763f06698a649b"
NATIVE PROC NETWORK_TRANSITION_BLOCK_JOIN_REQUESTS(BOOL bBlockJoinRequests) = "0x03d14e87fdd6b011"

//PURPOSE: Query transition status of other players
NATIVE FUNC BOOL NETWORK_HAS_PLAYER_STARTED_TRANSITION(PLAYER_INDEX nPlayerIndex) = "0x13ed064734cda7c0"
NATIVE FUNC BOOL NETWORK_ARE_TRANSITION_DETAILS_VALID(PLAYER_INDEX nPlayerIndex) = "0x3b9ef7886d600649"
NATIVE FUNC BOOL NETWORK_JOIN_TRANSITION(PLAYER_INDEX nPlayerIndex) = "0x10fb8f8068d237c8"

//PURPOSE: Returns TRUE if the player was invited to the current transition
NATIVE FUNC BOOL NETWORK_SESSION_WAS_INVITED_TO_TRANSITION() = "0xd96e67896fd51382"

//PURPOSE: Fills in gamer handle of player who invited us to this transition. 
//         This asserts if NETWORK_SESSION_WAS_INVITED_TO_TRANSITION is FALSE
NATIVE PROC NETWORK_SESSION_GET_TRANSITION_INVITER(GAMER_HANDLE& gamerHandle) = "0x75ecc51f54cc6ab5"

//PURPOSE: Returns TRUE if the player was invited to the current transition
NATIVE FUNC BOOL NETWORK_HAS_INVITED_GAMER_TO_TRANSITION(GAMER_HANDLE& gamerHandle) = "0x5005d75cd6530e6f"
NATIVE FUNC BOOL NETWORK_HAS_TRANSITION_INVITE_BEEN_ACKED(GAMER_HANDLE& gamerHandle) = "0xda5dd4a7d1c628ee"

//PURPOSE: These check the current setup of the main session. The main session will 
//         still be marked as an activity session after launching via transition,
//         This is so that matchmaking can still distinguish between a general freemode
//         session and a transition launched session.
//         Check if it's an activity via NETWORK_IS_ACTIVITY_SESSION and change back to 
//         freemode using NETWORK_MARK_AS_GAME_SESSION
NATIVE FUNC BOOL NETWORK_IS_ACTIVITY_SESSION() = "0x44859561f653dd4e"
NATIVE FUNC BOOL NETWORK_MARK_AS_GAME_SESSION() = "0xb17f2105d81d6f0c"

//INFO: Realtime Multiplayer
//      This should be called every frame that real time multiplayer should be disabled
NATIVE PROC NETWORK_DISABLE_REALTIME_MULTIPLAYER() = "0x236905c700fdb54d"
NATIVE PROC NETWORK_OVERRIDE_REALTIME_MULTIPLAYER_CONTROL_DISABLE() = "0xfc060b8213e6cad0"
NATIVE PROC NETWORK_DISABLE_REALTIME_MULTIPLAYER_SPECTATOR() = "0x83369a2f617ea53c"

//~>				PRESENCE SESSION FUNCTIONS

//PURPOSE: Allows blocking of Guide Invites and JvP so that players cannot be invited to
//		   or join the player via presence.
NATIVE PROC NETWORK_SET_PRESENCE_SESSION_INVITES_BLOCKED(BOOL bBlocked) = "0x28bbfc5fec1e27bd"
NATIVE FUNC BOOL NETWORK_ARE_PRESENCE_SESSION_INVITES_BLOCKED() = "0xf810a364fa49243b"


//~>				PRESENCE INVITE FUNCTIONS

//PURPOSE: Send session invite via presence
//         Pass NULL to content ID to indicate freemode invite
//		   Pass 0 to nPlaylistLength to indicate no playlist
//
NATIVE FUNC BOOL NETWORK_SEND_INVITE_VIA_PRESENCE(GAMER_HANDLE& hGamer, STRING szContentID, INT nPlaylistLength, INT nPlaylistCurrent) = "0x6e0ae21aa1b44961"
NATIVE FUNC BOOL NETWORK_SEND_TRANSITION_INVITE_VIA_PRESENCE(GAMER_HANDLE& hGamer, STRING szContentID, INT nPlaylistLength, INT nPlaylistCurrent) = "0x7cad6065a407d7b8"
NATIVE FUNC BOOL NETWORK_SEND_IMPORTANT_TRANSITION_INVITE_VIA_PRESENCE(GAMER_HANDLE& hGamer, STRING szContentID, INT nPlaylistLength, INT nPlaylistCurrent) = "0xa3456fcb353460d9"

ENUM SEND_INVITE_FLAGS
	SEND_INVITE_FLAGS_NONE		= 0,
	SEND_INVITE_FLAG_TRANSITION	= BIT0,
	SEND_INVITE_FLAG_IMPORTANT	= BIT1
ENDENUM

NATIVE FUNC BOOL NETWORK_SEND_ROCKSTAR_INVITE(GAMER_HANDLE& hGamer, SEND_INVITE_FLAGS nFlags, STRING szContentID, STRING szUniqueMatchId, INT nInviteFrom, INT nInviteType, INT nPlaylistLength, INT nPlaylistCurrent) = "0x5cc37e929fe8716e"

NATIVE FUNC INT NETWORK_GET_PRESENCE_INVITE_INDEX_BY_ID(INT nInviteID) = "0xb5edcda1860870a0"

NATIVE FUNC INT NETWORK_GET_NUM_PRESENCE_INVITES() = "0x46d4f0814b2a2202"
NATIVE FUNC BOOL NETWORK_ACCEPT_PRESENCE_INVITE(INT nInviteIndex) = "0xf7c55939e655699d"
NATIVE FUNC BOOL NETWORK_REMOVE_PRESENCE_INVITE(INT nInviteIndex) = "0x69c28c0fd93ca75b"
NATIVE FUNC INT NETWORK_GET_PRESENCE_INVITE_ID(INT nInviteIndex) = "0x8d83f0c9481a0a12"
NATIVE FUNC STRING NETWORK_GET_PRESENCE_INVITE_INVITER(INT nInviteIndex) = "0xe94a813f7c1c7f0a"
NATIVE FUNC INT NETWORK_GET_PRESENCE_INVITE_INVITER_CREW_ID(INT nInviteIndex) = "0xca5f944ffc44f5c7"
NATIVE FUNC BOOL NETWORK_GET_PRESENCE_INVITE_HANDLE(INT nInviteIndex, GAMER_HANDLE& hGamer) = "0xde9430f04af534d9"
NATIVE FUNC INT NETWORK_GET_PRESENCE_INVITE_SESSION_ID(INT nInviteIndex) = "0x8d67b99a0e382905"
NATIVE FUNC STRING NETWORK_GET_PRESENCE_INVITE_CONTENT_ID(INT nInviteIndex) = "0xac494f7ddecff675"
NATIVE FUNC INT NETWORK_GET_PRESENCE_INVITE_PLAYLIST_LENGTH(INT nInviteIndex) = "0x0f55e0a218a6fe26"
NATIVE FUNC INT NETWORK_GET_PRESENCE_INVITE_PLAYLIST_CURRENT(INT nInviteIndex) = "0x86e0c5103b2a4869"
NATIVE FUNC INT NETWORK_GET_PRESENCE_INVITE_TOURNAMENT_EVENT_ID(INT nInviteIndex) = "0x7ca7a5bd9742847d"
NATIVE FUNC BOOL NETWORK_GET_PRESENCE_INVITE_SCTV(INT nInviteIndex) = "0xedd6f935b246eb10"
NATIVE FUNC BOOL NETWORK_GET_PRESENCE_INVITE_FROM_ADMIN(INT nInviteIndex) = "0x00acf7948f0868e0"
NATIVE FUNC BOOL NETWORK_GET_PRESENCE_INVITE_IS_TOURNAMENT(INT nInviteIndex) = "0x052e8467ac4fe90e"

NATIVE FUNC BOOL NETWORK_CANCEL_INVITE(GAMER_HANDLE& hGamer) = "0x76a4e763d35c5d93"
NATIVE FUNC BOOL NETWORK_CANCEL_TRANSITION_INVITE(GAMER_HANDLE& hGamer) = "0xf829d5efb56aceea"

NATIVE PROC NETWORK_REMOVE_INVITE(GAMER_HANDLE& hGamer) = "0x2eea894110cd1067"
NATIVE PROC NETWORK_REMOVE_ALL_INVITES() = "0xd6503b2fb63fbcb7"
NATIVE PROC NETWORK_REMOVE_AND_CANCEL_ALL_INVITES() = "0x553ed272c0050733"
NATIVE PROC NETWORK_REMOVE_TRANSITION_INVITE(GAMER_HANDLE& hGamer) = "0x1881c7696f08f713"
NATIVE PROC NETWORK_REMOVE_ALL_TRANSITION_INVITE() = "0xed075e87511bb187"
NATIVE PROC NETWORK_REMOVE_AND_CANCEL_ALL_TRANSITION_INVITES() = "0x2e036ddbb5de7208"


//~>				FOLLOW INVITE FUNCTIONS

//PURPOSE: Follow invite actions. These are invites sent by someone who has tagged the local player
//		   as a 'follower'. 
//
NATIVE FUNC BOOL NETWORK_HAS_FOLLOW_INVITE() = "0x1e427e2f45d48a7e"
NATIVE FUNC BOOL NETWORK_ACTION_FOLLOW_INVITE() = "0x7261fa840a6d9e98"
NATIVE FUNC BOOL NETWORK_CLEAR_FOLLOW_INVITE() = "0x79cd75c6002ea349"
NATIVE FUNC BOOL NETWORK_GET_FOLLOW_INVITE_HANDLE(GAMER_HANDLE& hGamer) = "0xe1ccfc92aa315798"


//~>				INVITE FUNCTIONS

//PURPOSE: Invite a gamer to join your session. 
NATIVE FUNC BOOL NETWORK_INVITE_GAMER(GAMER_HANDLE& gamerHandle) = "0xc1498cc0128565fd"
NATIVE FUNC BOOL NETWORK_INVITE_GAMERS(SESSION_INVITE& hInvite, INT nNumGamers, STRING szSubject = NULL, STRING szMessage = NULL) = "0xb6a14185ecb203a9"

//PURPOSE: Invite a friend to join your session. 
//PARAM NOTES:
//    szSubject - Message Subject ("Invite") - This is only available on PS3. MAXIMUM 16 characters.
//    szMessage - Message Body ("Do You Want to Play Mode X / Instance Y"). MAXIMUM 128 characters.
NATIVE FUNC BOOL NETWORK_INVITE_GAMER_WITH_MESSAGE(GAMER_HANDLE& gamerHandle, STRING szSubject, STRING szMessage) = "0xf8eae27ec1167c0c"

//PURPOSE: Returns true if an invitation was sent to the friend during the current session.
NATIVE FUNC BOOL NETWORK_HAS_INVITED_GAMER(GAMER_HANDLE& gamerHandle) = "0x0f6d55d87b7c7c9a"
NATIVE FUNC BOOL NETWORK_HAS_INVITE_BEEN_ACKED(GAMER_HANDLE& gamerHandle) = "0x3a34867d08fb1e2d"
NATIVE FUNC BOOL NETWORK_HAS_MADE_INVITE_DECISION(GAMER_HANDLE& gamerHandle) = "0x90e13cbc679b343c"
NATIVE FUNC INT NETWORK_GET_INVITE_REPLY_STATUS(GAMER_HANDLE& gamerHandle) = "0x67492aee9df67af0"

//PURPOSE: Returns the number of unaccepted invites we have in the queue.
NATIVE FUNC INT NETWORK_GET_NUM_UNACCEPTED_INVITES() = "0xc06952fd99fa2e22"

//PURPOSE: Returns the name of the inviting player at the given index.
NATIVE FUNC STRING NETWORK_GET_UNACCEPTED_INVITER_NAME(INT index) = "0x4c031a6948fb2fc0"

//PURPOSE: Accepts the unaccepted invite at the given index
NATIVE FUNC BOOL NETWORK_ACCEPT_INVITE(INT index) = "0x7bf8101bf0b3847f"

//PURPOSE: Gets the gamer handle that's currently selected in the invite menus from the match setup coronas
NATIVE FUNC BOOL NETWORK_GET_CURRENTLY_SELECTED_GAMER_HANDLE_FROM_INVITE_MENU(GAMER_HANDLE& gamerHandle) = "0xbfd55d5bc9d77079"

//PURPOSE: Sets the gamer handle that's currently selected in the invite menus from the match setup coronas
NATIVE FUNC BOOL NETWORK_SET_CURRENTLY_SELECTED_GAMER_HANDLE_FROM_INVITE_MENU(GAMER_HANDLE& gamerHandle) = "0xb96e3a4feeae5dcf"

//PURPOSE: Sets the gamer handle that's currently selected in the Data Manager for player_cards
NATIVE FUNC BOOL NETWORK_SET_CURRENT_DATA_MANAGER_HANDLE(GAMER_HANDLE& gamerHandle) = "0x459926976bb7464c"

// Changes the "Invited" text next to the rank by the gamer name in the player list invite menus
NATIVE PROC NETWORK_SET_INVITE_FAILED_MESSAGE_FOR_INVITE_MENU(GAMER_HANDLE& gamerHandle, STRING failedInviteMessage) = "0x59a4980963bc6654"

// Changes the "Invited" text next to the rank by the gamer name in the player list invite menus
NATIVE PROC NETWORK_SET_INVITE_ON_CALL_FOR_INVITE_MENU(GAMER_HANDLE& gamerHandle) = "0x209b41d9e87fc6ee"

// Checks if the player is the host of a transition session and is a rockstar dev
NATIVE PROC NETWORK_IS_HOST_PLAYER_AND_ROCKSTAR_DEV(GAMER_HANDLE& gamerHandle) = "0xa45e5e2d6610849e"

// Check to see if the data manager is ready to be queried.
NATIVE FUNC BOOL NETWORK_CHECK_DATA_MANAGER_SUCCEEDED(INT cardType) = "0xe77a37165b148bbf"

// Check to see if the data manager stats query has failed.
NATIVE FUNC BOOL NETWORK_CHECK_DATA_MANAGER_STATS_QUERY_FAILED(INT cardType) = "0x87a8f7d522928ed3"

// Check to see if the data manager stats query is pending.
NATIVE FUNC BOOL NETWORK_CHECK_DATA_MANAGE_STATS_QUERY_PENDING(INT cardType) = "0x4187bb6cf5f20edf"

// Check to see if the data manager is ready to be queried for a specific player.
NATIVE FUNC BOOL NETWORK_CHECK_DATA_MANAGER_SUCCEEDED_FOR_HANDLE(INT cardType, GAMER_HANDLE& gamerHandle) = "0x63f0da6449e61d29"

// Check to see if the data manager is ready to be queried for a specific player.
NATIVE FUNC BOOL NETWORK_CHECK_DATA_MANAGER_FOR_HANDLE(INT cardType, GAMER_HANDLE& gamerHandle) = "0x401fdbf938af752e"

// Need to match CardTypes in PlayerCardDataManager.h
ENUM PLAYER_LIST_TYPE
	PLAYER_LIST_TYPE_LAST_JOB = 100,
	PLAYER_LIST_TYPE_JOINED,
	PLAYER_LIST_TYPE_CORONA_PLAYERS,
	PLAYER_LIST_TYPE_INVITABLE_SESSION_PLAYERS,
	PLAYER_LIST_TYPE_MATCHED_PLAYERS,
	PLAYER_LIST_TYPE_CORONA_PLAYLIST,
	PLAYER_LIST_TYPE_DIRECTORY
ENDENUM

//PURPOSE: Fills out the list of players in the PM Player List (clears the previous data).
NATIVE FUNC BOOL FILLOUT_PM_PLAYER_LIST(GAMER_HANDLE& gamerHandles[], INT count, PLAYER_LIST_TYPE type = PLAYER_LIST_TYPE_CORONA_PLAYERS) = "0x460505342225cb7a"
NATIVE FUNC BOOL FILLOUT_PM_PLAYER_LIST_WITH_NAMES(GAMER_HANDLE& gamerHandles[], TEXT_LABEL_63& gamerNames[], INT count, PLAYER_LIST_TYPE type = PLAYER_LIST_TYPE_CORONA_PLAYERS) = "0x00164910305c01eb"

//PURPOSE: Checks for when the playerlist changes, and triggers for the new stats to be grabbed.
// Returns true when the Player List is up to date.
NATIVE FUNC BOOL REFRESH_PLAYER_LIST_STATS(PLAYER_LIST_TYPE type = PLAYER_LIST_TYPE_CORONA_PLAYERS) = "0x222f2993020d5a70"


// Needs to match eOnlineStatus in commands_network.cpp
ENUM ONLINE_STATUS
	OS_OFFLINE,
	OS_ONLINE_ANOTHER_GAME,
	OS_ONLINE_SP,
	OS_ONLINE_MP,
	OS_ONLINE_IN_LOCAL_SESSION,
	OS_ONLINE_IN_LOCAL_TRANSITION
ENDENUM

//PURPOSE: Returns the current online status for the given player.
NATIVE FUNC ONLINE_STATUS GET_PM_PLAYER_ONLINE_STATUS(GAMER_HANDLE& gamerHandle) = "0x19a898145777402f"



//~>				PLATFORM PARTY FUNCTIONS

//PURPOSE: Show the platform party UI
NATIVE FUNC BOOL NETWORK_SHOW_PLATFORM_PARTY_UI() = "0xeb91f36d6aaf373c"

//PURPOSE: Sends an session invite to all members of the platform party
NATIVE FUNC BOOL NETWORK_INVITE_PLATFORM_PARTY() = "0x0607bb03f7b40e76"

//PURPOSE: Sends an session invite to all members of the platform party
NATIVE FUNC BOOL NETWORK_IS_IN_PLATFORM_PARTY() = "0x9d176461aebc1fde"

//PURPOSE: Details of the current party members
//PARAM NOTES:
//	partyDesc - See NETWORK_PLATFORM_PARTY_DESC structure
NATIVE FUNC INT NETWORK_GET_PLATFORM_PARTY_MEMBER_COUNT() = "0x81ba3c34db29bedd"
NATIVE FUNC INT NETWORK_GET_PLATFORM_PARTY_MEMBERS(NETWORK_PLATFORM_PARTY_DESC& partyDesc, INT sizeOfData) = "0x19f5a68cc42dbec5"

//PURPOSE: Joins a platform party session (JvP)
NATIVE FUNC BOOL NETWORK_JOIN_PLATFORM_PARTY_MEMBER_SESSION(GAMER_HANDLE& gamerHandle) = "0xd869a5434d1f9f08"

//PURPOSE: Party chat check (for local player)
NATIVE FUNC BOOL NETWORK_IS_IN_PLATFORM_PARTY_CHAT() = "0xa6a33e7a7c82daea"

//PURPOSE: Check if a party member is chatting
NATIVE FUNC BOOL NETWORK_IS_CHATTING_IN_PLATFORM_PARTY(GAMER_HANDLE& gamerHandle) = "0x9d06a67d5ed52b09"

//PURPOSE: bVoiceRequired = TRUE will require a privelege flag from Microsoft. 
//		   Leave this as FALSE unless you know that we have this
//
NATIVE FUNC BOOL NETWORK_SHOW_PLATFORM_VOICE_CHANNEL_UI(BOOL bVoiceRequired = FALSE) = "0x64d388c111354a1f"


//~>				SESSION QUEUE

NATIVE FUNC BOOL NETWORK_CAN_QUEUE_FOR_PREVIOUS_SESSION_JOIN() = "0xce8f932216fafd09"
NATIVE FUNC BOOL NETWORK_IS_QUEUING_FOR_SESSION_JOIN() = "0x1dc157fb92983f64"
NATIVE PROC NETWORK_CLEAR_QUEUED_JOIN_REQUEST() = "0xdccf1bd61c7a3788"
NATIVE PROC NETWORK_SEND_QUEUED_JOIN_REQUEST() = "0x80518e90f5f86ece"
NATIVE PROC NETWORK_REMOVE_ALL_QUEUED_JOIN_REQUESTS() = "0x12a88f4f42a23710"

//~>				RANDOM NUMBER

NATIVE PROC NETWORK_SEED_RANDOM_NUMBER_GENERATOR(INT nSeed) = "0xce651d36859b942e"
NATIVE FUNC INT NETWORK_GET_RANDOM_INT() = "0xf5492d621b7aedeb"
NATIVE FUNC INT NETWORK_GET_RANDOM_INT_RANGED(INT nMinimum, INT nMaximum) = "0x21d864aec6d2d96e"

//~>				SCRIPT COMMANDS

//INFO: 
//PARAM NOTES:
//PURPOSE: This must be called if the script is to be networked, before you register the broadcast data. 
// MaxNumPlayers - The maximum number of players who can participate in the script
// InstanceId - An id that can be assigned to the script to distinguish it from other scripts of the same type running at the same time
NATIVE PROC NETWORK_SET_THIS_SCRIPT_IS_NETWORK_SCRIPT(int MaxNumPlayers, bool activeInSinglePlayer, int InstanceId = -1) = "0xd9b114a8d3a8319f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Works in the same way as NETWORK_SET_THIS_SCRIPT_IS_NETWORK_SCRIPT but returns FALSE if it fails.
//			An example of a reason for failing would be if the command is called for an object brain and there is already a networked object brain at the same coordinates.
NATIVE FUNC BOOL NETWORK_TRY_TO_SET_THIS_SCRIPT_IS_NETWORK_SCRIPT(int MaxNumPlayers, bool activeInSinglePlayer, int InstanceId = -1) = "0xfd86bdac70588822"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if this script has been setup to be a network script
NATIVE FUNC BOOL NETWORK_GET_THIS_SCRIPT_IS_NETWORK_SCRIPT() = "0xdd50b5a22807bad4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Reserves participant slots for each team.
// NumTeams - The number of teams
// TeamSizes - An array containing the number of slots reserved for each team. 
// MyTeam - The team number of our local player (between 0 and NumTeams-1)
NATIVE PROC NETWORK_SET_TEAM_RESERVATIONS(int NumTeams, STRUCT &TeamReservations, INT MyTeam) = "0xb168680dd1cfe6bd"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the maximum number of players that can participate in this script (the number passed into NETWORK_SET_THIS_SCRIPT_IS_NETWORK_SCRIPT())
NATIVE FUNC INT NETWORK_GET_MAX_NUM_PARTICIPANTS() = "0x5d79167fed95f0b0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the current number of players participating in this script
NATIVE FUNC INT NETWORK_GET_NUM_PARTICIPANTS() = "0xd4538f501edcd96c"

//INFO: 
//PARAM NOTES:
//PURPOSE: You must wait for this to return NETSCRIPT_PLAYING before the script is allowed to continue. This is called before
// the broadcast variables are registered
NATIVE FUNC NETWORK_SCRIPT_STATE NETWORK_GET_SCRIPT_STATUS() = "0x0eeb2c2ca48fb650"

//INFO: 
//PARAM NOTES:
//PURPOSE: Registers the variables that the host alters and that the clients need to be updated on 
NATIVE PROC NETWORK_REGISTER_HOST_BROADCAST_VARIABLES(STRUCT &Address, INT Size, STRING DebugName=NULL) = "0x21f2b09183f31d02"

//INFO: 
//PARAM NOTES:
//PURPOSE: Registers the variables for each player running the script
NATIVE PROC NETWORK_REGISTER_PLAYER_BROADCAST_VARIABLES(STRUCT &Address, INT Size, STRING DebugName=NULL) = "0x7157b1051528d729"

//INFO: 
//PARAM NOTES:
//PURPOSE: Registers the variables that the host alters and that the clients need to be updated on. 
//         This high frequency data will be updated every frame and send out updates as soon as possible. 
//         This feature is currently restricted to arrays of 20 script vars or less. 
//         Please only use this when strictly necessary! 
NATIVE PROC NETWORK_REGISTER_HIGH_FREQUENCY_HOST_BROADCAST_VARIABLES(STRUCT &Address, INT Size, STRING DebugName=NULL) = "0x2b297170e982e21e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Registers the variables for each player running the script
//         This high frequency data will be updated every frame and send out updates as soon as possible. 
//         This feature is currently restricted to arrays of 20 script vars or less. 
//         Please only use this when strictly necessary! 
NATIVE PROC NETWORK_REGISTER_HIGH_FREQUENCY_PLAYER_BROADCAST_VARIABLES(STRUCT &Address, INT Size, STRING DebugName=NULL) = "0x55b917f38ca35331"

//INFO: 
//PARAM NOTES:
//PURPOSE: Finishes sending broadcast data. Should only be called just as the script is cleaning up
NATIVE PROC NETWORK_FINISH_BROADCASTING_DATA() = "0xf2eee9f362fb9601"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tag for debug all the broadcast variables for each player running the script
// bTag - 
// true:  	shadow buffers for each players BD are created, and illegal local changes will display information on which BD block was changed
// false: 	shadow buffers for each players BD are removed, no details will be shown on illegal local changes to broadcast data.
// shadow buffers will always be removed on script shutdown
NATIVE PROC NETWORK_TAG_FOR_DEBUG_REMOTE_PLAYER_BROADCAST_VARIABLES(Bool bTag) = "0x792074cbd53965b8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true once we have received the first update for all registered host broadcast data from the host
NATIVE FUNC BOOL NETWORK_HAS_RECEIVED_HOST_BROADCAST_DATA() = "0x72fef2581032d369"

//INFO: 
//PARAM NOTES:
//PURPOSE: When called, the host broadcast data can be altered without any asserts. This can only be called immediately after the host broadcast
//		   data is registered, before any updates have been received. Once an update is received client alteration is once again disallowed, and 
//		   asserts will fire when a client tries to alter the data.
NATIVE PROC NETWORK_ALLOW_CLIENT_ALTERATION_OF_HOST_BROADCAST_DATA() = "0x2e154d6ae9845056"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the player index from the given script participant index.
NATIVE FUNC PLAYER_INDEX NETWORK_GET_PLAYER_INDEX(PARTICIPANT_INDEX Participant) = "0x6b01934fa503547f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the script participant index for the current script from the given player index.
NATIVE FUNC PARTICIPANT_INDEX NETWORK_GET_PARTICIPANT_INDEX(PLAYER_INDEX Plr) = "0x32f47fd509bb6d38"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the player index of a player whos ped is the one with the given ped index. Returns -1 otherwise.
NATIVE FUNC PLAYER_INDEX NETWORK_GET_PLAYER_INDEX_FROM_PED(PED_INDEX PedIndex) = "0xff65cdb0eb7ace71"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns number of connected players
NATIVE FUNC INT NETWORK_GET_NUM_CONNECTED_PLAYERS() = "0x053e03265870c820"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the given player is connected
NATIVE FUNC BOOL NETWORK_IS_PLAYER_CONNECTED(PLAYER_INDEX Plr) = "0x2aaf56a20af61a64"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the total number of players involved in the network game (ie everyone we are currently connected to)
NATIVE FUNC INT NETWORK_GET_TOTAL_NUM_PLAYERS() = "0x21e2c39591974468"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the given script participant is active
NATIVE FUNC BOOL NETWORK_IS_PARTICIPANT_ACTIVE(PARTICIPANT_INDEX Participant) = "0x81f82ffbed0cacca"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the given player is active (this adds check that the player ped is created vs. NETWORK_IS_PLAYER_CONNECTED)
NATIVE FUNC BOOL NETWORK_IS_PLAYER_ACTIVE(PLAYER_INDEX Plr) = "0x0d01086b38ec256f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the given player is participating in this script
NATIVE FUNC BOOL NETWORK_IS_PLAYER_A_PARTICIPANT(PLAYER_INDEX Plr) = "0x976d40337fcb1481"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true is our machine is the host (in charge of) the script session
NATIVE FUNC BOOL NETWORK_IS_HOST_OF_THIS_SCRIPT() = "0x54e30a65f4fa4962"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the participant that is host (in charge of) this script session
NATIVE FUNC PARTICIPANT_INDEX NETWORK_GET_HOST_OF_THIS_SCRIPT() = "0x10490c0971778a41"

//INFO: 
//PARAM NOTES:
//	localOnly - if set the command only finds the host of any local instances of the script running
//PURPOSE: Returns the player that is host (in charge of) a local or remote script session
NATIVE FUNC PLAYER_INDEX NETWORK_GET_HOST_OF_SCRIPT(STRING scriptName, INT instanceId = -1, INT positionHash = 0) = "0xcbe03d1b06a08744"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the player that is host (in charge of) the given thread
NATIVE FUNC PLAYER_INDEX NETWORK_GET_HOST_OF_THREAD(THREADID thread) = "0x900d5a343be5e45b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Used by the host to allow or prevent other players joining the script session
NATIVE PROC NETWORK_ALLOW_PLAYERS_TO_JOIN(Bool bJoin) = "0x5a30949f9b09087c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Called by the host of a network script informing the code that the script has finished for all participants
NATIVE PROC NETWORK_SET_MISSION_FINISHED() = "0xe68df5af3a89b195"

//INFO: 
//PARAM NOTES:
//	localOnly - if set the command only checks if there are any local instances of the script running, there may not be a script thread running
//				but the code that manages the thread may still be active cleaning up 
//PURPOSE: Returns true if any scripts with the given name are running locally or remotely on any other machine involved in the network game
NATIVE FUNC BOOL NETWORK_IS_SCRIPT_ACTIVE(STRING scriptName, INT instanceId = -1, BOOL localOnly = false, INT positionHash = 0) = "0x7b0a672b0283f03e"

//INFO: 
//PARAM NOTES:
//	localOnly - if set the command only checks if there are any local instances of the script running, there may not be a script thread running
//				but the code that manages the thread may still be active cleaning up 
//PURPOSE: Returns true if any scripts with the given hash are running locally or remotely on any other machine involved in the network game
NATIVE FUNC BOOL NETWORK_IS_SCRIPT_ACTIVE_BY_HASH(INT scriptHash, INT instanceId = -1, BOOL localOnly = false, INT positionHash = 0) = "0xab2eff25cde56451"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the given thread has been set to run as a network script
NATIVE FUNC BOOL NETWORK_IS_THREAD_A_NETWORK_SCRIPT(THREADID thread) = "0xa19c6234b5450d1c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the number of participants running the given script locally or remotely
NATIVE FUNC INT NETWORK_GET_NUM_SCRIPT_PARTICIPANTS(STRING scriptName, INT instanceId = -1, INT positionHash = 0) = "0x49a870e8dcc9a2c4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the instance id of the calling script. Returns -1 if there is none.
NATIVE FUNC INT NETWORK_GET_INSTANCE_ID_OF_THIS_SCRIPT() = "0x5c5ce5291fb79534"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the position hash of the calling script. Returns 0 if there is none. Only world point scripts have a position hash.
NATIVE FUNC INT NETWORK_GET_POSITION_HASH_OF_THIS_SCRIPT() = "0x64e70c7c5d6de65c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the given player is a participant on the given script. The script can be running locally or remotely
NATIVE FUNC BOOL NETWORK_IS_PLAYER_A_PARTICIPANT_ON_SCRIPT(PLAYER_INDEX Plr, STRING scriptName, INT instanceId) = "0x715c12ff862f6649"
 
//INFO: 
//PARAM NOTES:
//PURPOSE: Prevents the script host migrating for one frame. This must be repeatedly called while you want to prevent host migration.
//         *** PLEASE DO NOT ABUSE THIS, WE MUST ALWAYS TRY AND ALLOW MIGRATION WHENEVER POSSIBLE!! **
NATIVE PROC NETWORK_PREVENT_SCRIPT_HOST_MIGRATION() = "0xdc0b8c11c11ae5c2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Requests that the local player becomes the host of the script
//         *** PLEASE DO NOT ABUSE THIS, WE MUST ALWAYS TRY AND ALLOW MIGRATION WHENEVER POSSIBLE!! **
NATIVE PROC NETWORK_REQUEST_TO_BE_HOST_OF_THIS_SCRIPT() = "0x2fb25ae288339020"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the local player's participant id
NATIVE FUNC PARTICIPANT_INDEX PARTICIPANT_ID() = "0x74bd5c0c45a40771"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the local player's participant id as an int
NATIVE FUNC INT PARTICIPANT_ID_TO_INT() = "0xf1354995c6159a78"

//~>						Player commands

//INFO: 
//PARAM NOTES:
//	newPublicContentId - The current public content Id if the player is in a lobby or instanced mode
//PURPOSE:  Saves a value for the public content id for use in metrics sent from code that wish to use that information
NATIVE PROC NETWORK_SET_CURRENT_PUBLIC_CONTENT_ID(STRING newPublicContentId) = "0x2c863acdcd12b3db"

//INFO: 
//PARAM NOTES:
//	newChatOption - Which chat option is currently set in the menu, parameter is CHAT_{OPTION} const ints
//PURPOSE:  Saves a value for the selected chat option for use in metrics sent from code that wish to use that information
NATIVE PROC NETWORK_SET_CURRENT_CHAT_OPTION(INT newChatOption) = "0x179b6b0569a08f3c"

//INFO: 
//PARAM NOTES:
//	newSpawnLocationOption - Which spawn location option is currently set in the menu: specific property, random, last location
//PURPOSE:  Saves a value for which spawn location option is currently set for use in metrics sent from code that wish to use that information
NATIVE PROC NETWORK_SET_CURRENT_SPAWN_LOCATION_OPTION(INT newSpawnLocationOption) = "0xaa6d5451dc3448b6"

//INFO: 
//PARAM NOTES:
//	vehicleDrivenInTestDrive - Whether the last vehicle driven was being used in a test drive
//PURPOSE:  Saves a value for Whether the last vehicle driven was being used in a test drive for use in metrics sent from code that wish to use that information
NATIVE PROC NETWORK_SET_VEHICLE_DRIVEN_IN_TEST_DRIVE(BOOL vehicleDrivenInTestDrive) = "0x8c70252fc40f320b"

//INFO: 
//PARAM NOTES:
//	vehicleDrivenLocation - Hash of the location where the vehicle has been driven to
//PURPOSE:  Saves the property this vehicle is being driven in for use in metrics sent from code that wish to use that information
NATIVE PROC NETWORK_SET_VEHICLE_DRIVEN_LOCATION(INT vehicleDrivenLocation) = "0xe4f6f71386c075a2"

//INFO: 
//PARAM NOTES:
//	invicibilityTime - this is the length of time in millisecs that the player will be invincible for after resurrection
// spawnLocation - enum PLAYER_SPAWN_LOCATION for telemetry
// spawnRason - enum for telemetry
//PURPOSE:  Revives our local player who was previously dead. CALL THIS ONCE WHEN YOU WANT TO RESURRECT THE PLAYER (THIS DOES NOT NEED TO BE CALLED EVERY FRAME)
NATIVE PROC NETWORK_RESURRECT_LOCAL_PLAYER(VECTOR Pos, FLOAT Heading, INT invicibilityTime = 0, BOOL leaveDeadPed = TRUE, BOOL unpauseRenderPhase = TRUE, INT spawnLocation = -1, INT spawnReason = -1) = "0x35d0922793f4b21d"

//INFO: 
//PARAM NOTES:
// spawnLocation - enum PLAYER_SPAWN_LOCATION for telemetry
// spawnRason - enum for telemetry
//PURPOSE:  Manually triggers telemetry for respawning players that are NOT being resurrected. (i.e holding Y during a race)
NATIVE PROC NETWORK_RESPAWN_LOCAL_PLAYER_TELEMETRY(INT spawnLocation = -1, INT spawnReason = -1) = "0xf25a2ab9ae118871"

//INFO: 
//PARAM NOTES:
//	invincibilityTime - this is the length of time in millisecs that the player will be invincible for
//PURPOSE:  Allows setting the player to invincible for a length of time, or to clear out invincibility by setting to 0
NATIVE PROC NETWORK_SET_LOCAL_PLAYER_INVINCIBLE_TIME(INT invincibilityTime) = "0x49f5a737e649bb72"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Returns true if the local player is currently invincible as set by NETWORK_RESURRECT_LOCAL_PLAYER or NETWORK_SET_LOCAL_PLAYER_INVINCIBLE_TIME
NATIVE FUNC BOOL NETWORK_IS_LOCAL_PLAYER_INVINCIBLE() = "0x1c41169943f5d8ae"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Disables the flashing when a player is invincible
NATIVE PROC NETWORK_DISABLE_INVINCIBLE_FLASHING(PLAYER_INDEX Plr, BOOL disable) = "0xfa88a0a3e965437c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the time (in milliseconds) that a specific player has been dead for. 
NATIVE FUNC INT NETWORK_GET_TIME_PLAYER_HAS_BEEN_DEAD_FOR(PLAYER_INDEX Plr) = "0xa92c55cf6ef84e44"

//INFO: -1 means the killer is unknown
//PARAM NOTES:
//PURPOSE: Returns the player that has killed the other player last. More info..
NATIVE FUNC PLAYER_INDEX NETWORK_GET_KILLER_OF_PLAYER(PLAYER_INDEX Plr, WEAPON_TYPE &TypeOfWeapon) = "0x4ad657fdb8fb690e"

//INFO: This command can be used for any physical objects withinthe game (e.g. cars, peds and objects). 
//PARAM NOTES:
//PURPOSE: Returns the player index of the player that destroyed the network object with the specified network ID. more info..
NATIVE FUNC PLAYER_INDEX NETWORK_GET_DESTROYER_OF_NETWORK_ID(NETWORK_INDEX NetworkId, WEAPON_TYPE &TypeOfWeapon) = "0x2aa852e1ebb27a57"

//INFO: This command can be used for any physical objects withinthe game (e.g. cars, peds and objects). 
//PARAM NOTES:
//PURPOSE: Returns the player index of the player that destroyed the entity with the specified entity ID. more info..
NATIVE FUNC PLAYER_INDEX NETWORK_GET_DESTROYER_OF_ENTITY(ENTITY_INDEX EntityIndex, WEAPON_TYPE &TypeOfWeapon) = "0xeb72efbd6f908c4b"

//INFO: This command can be used for any physical objects within the game (e.g. cars, peds and objects). 
//PARAM NOTES:
//PURPOSE: Returns true if player with index playerIndexDamager damaged entity with index entityDamaged. also returns the damage dealt by the player.
NATIVE FUNC BOOL NETWORK_GET_ASSISTED_KILL_OF_ENTITY(PLAYER_INDEX playerIndexDamager, ENTITY_INDEX entityDamaged, INT& damageDealt) = "0x3cdd315fa70f2c21"

//INFO: This command can be used for any physical objects within the game (e.g. cars, peds and objects). 
//PARAM NOTES:
//PURPOSE: Returns true if player with index playerIndexDamager damaged entity with index entityDamaged. also returns the damage dealt by the player.
NATIVE FUNC BOOL NETWORK_GET_ASSISTED_DAMAGE_OF_ENTITY(PLAYER_INDEX playerIndexDamager, ENTITY_INDEX entityDamaged, INT& damageDealt) = "0x15f05eda59cfdabb"

//INFO: -1 means the killer is unknown
//PARAM NOTES:
//PURPOSE: Returns the Entity that has killed the other player last. More info..
//NOTES:
//So you can use these commands on that entity:
// - IS_ENTITY_A_PED()
// - IS_ENTITY_A_VEHICLE()
// And if the entity is a ped you can convert ENTITY_INDEX to PED_INDEX and find if its a player or not: 
// - IS_PED_A_PLAYER()
NATIVE FUNC ENTITY_INDEX NETWORK_GET_ENTITY_KILLER_OF_PLAYER(PLAYER_INDEX Plr, WEAPON_TYPE &TypeOfWeapon) = "0x596e43bc4865f22a"

//INFO: Once the function has returned true, subsequent calls will return false. 
//PARAM NOTES:
//PURPOSE: Returns a true ifr the specified network player has collected the specified pick up. More info..
NATIVE FUNC BOOL NETWORK_HAS_PLAYER_COLLECTED_PICKUP(PLAYER_INDEX Plr, PICKUP_INDEX PickUp) = "0x8f94160957344282"

//~>							Game commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the entity was created by or registered with the current script
NATIVE FUNC BOOL NETWORK_HAS_ENTITY_BEEN_REGISTERED_WITH_THIS_THREAD(ENTITY_INDEX EntityIndex) = "0xd0defe7707874c5b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the network ID of the entity with the specified index 
NATIVE FUNC NETWORK_INDEX NETWORK_GET_NETWORK_ID_FROM_ENTITY(ENTITY_INDEX EntityIndex) = "0x1d03f9bf5cf8ca0a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the entity index of the entity with the specified network ID.
NATIVE FUNC ENTITY_INDEX NETWORK_GET_ENTITY_FROM_NETWORK_ID(NETWORK_INDEX NetworkId) = "0x55456dd1219a39df"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the entity is networked. It asserts if the entity is not physical.
NATIVE FUNC BOOL NETWORK_GET_ENTITY_IS_NETWORKED(ENTITY_INDEX entityIndex) = "0xd64c90c3f536f963"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the entity is locally controlled
NATIVE FUNC BOOL NETWORK_GET_ENTITY_IS_LOCAL(ENTITY_INDEX entityIndex) = "0x58fdf0b505aa2260"

//INFO: 
//PARAM NOTES:
//PURPOSE: Registers the entity with the network code so that it becomes networked
NATIVE PROC NETWORK_REGISTER_ENTITY_AS_NETWORKED(ENTITY_INDEX entityIndex) = "0x799746e3e915923d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Unregisters the entity from the network code so that it becomes non-networked. This can only be done on non-script entities
NATIVE PROC NETWORK_UNREGISTER_NETWORKED_ENTITY(ENTITY_INDEX entityIndex) = "0x6c46da3280262b06"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if an entity (ped/vehicle/object) with the specified network ID exists on the local machine. 
NATIVE FUNC BOOL NETWORK_DOES_NETWORK_ID_EXIST(NETWORK_INDEX NetworkId) = "0xccdcd6672dae6835"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if an entity with the specified network ID exists on the local machine. 
NATIVE FUNC BOOL NETWORK_DOES_ENTITY_EXIST_WITH_NETWORK_ID(NETWORK_INDEX NetworkId) = "0x90f6e2f6488b98ba"

//INFO: 
//PARAM NOTES:
//PURPOSE: Request ownership of the object with the specified network ID from the current owner 
NATIVE FUNC BOOL NETWORK_REQUEST_CONTROL_OF_NETWORK_ID(NETWORK_INDEX NetworkId) = "0xc31eeca11005273c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the local machine has ownership of the object with the specified network ID (included pending ownership change check)
NATIVE FUNC BOOL NETWORK_HAS_CONTROL_OF_NETWORK_ID(NETWORK_INDEX NetworkId) = "0x07b2f8356dc13cf4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the object with the specified network ID is a clone on the local machine
NATIVE FUNC BOOL NETWORK_IS_NETWORK_ID_REMOTELY_CONTROLLED(NETWORK_INDEX NetworkId) = "0x10cbf225ed627e4a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Request ownership of the entity with the specified entity index from the current owner 
NATIVE FUNC BOOL NETWORK_REQUEST_CONTROL_OF_ENTITY(ENTITY_INDEX entityIndex) = "0xe7dd33d0e2a313f4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Request ownership of the door with the specified door hash from the current owner 
NATIVE FUNC BOOL NETWORK_REQUEST_CONTROL_OF_DOOR(int doorEnumHash) = "0x03b2da1950c5cd94"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the local machine has ownership of the entity with the specified ped index 
NATIVE FUNC BOOL NETWORK_HAS_CONTROL_OF_ENTITY(ENTITY_INDEX entityIndex) = "0x3a8b0f5b0e3de13a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the local machine has ownership of the pickup with the specified network ID 
NATIVE FUNC BOOL NETWORK_HAS_CONTROL_OF_PICKUP(PICKUP_INDEX pickupIndex) = "0xf749ecf0c32f9bf6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the local machine has ownership of the door with the specified door hash
NATIVE FUNC BOOL NETWORK_HAS_CONTROL_OF_DOOR(int doorEnumHash) = "0x0c61220886726717"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the door with the specified door hash is networked
NATIVE FUNC BOOL NETWORK_IS_DOOR_NETWORKED(int doorEnumHash) = "0x3197d8f164016b52"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC NETWORK_GET_TEAM_RGB_COLOUR(INT team, INT &Red, INT &Green, INT &Blue) = "0xdf06ebfab5763e98"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC NETWORK_SET_TEAM_RGB_COLOUR(INT team, INT Red, INT Green, INT Blue) = "0x273ffce6bd116c96"

//~>						Handle commands

//INFO: Retrieve the local players gamer handle (this will be invalid if no local player is signed in)
NATIVE PROC NETWORK_GET_LOCAL_HANDLE(GAMER_HANDLE& gamerHandle, INT sizeOfData) = "0x9edec39ee142c8d5"

//INFO: Retrieve a gamer handle from it's user id representation
NATIVE PROC NETWORK_HANDLE_FROM_USER_ID(STRING userId, GAMER_HANDLE& gamerHandle, INT sizeOfData) = "0xa996e10b1ecda45e"

//INFO: Retrieve a gamer handle from it's member id representation
NATIVE PROC NETWORK_HANDLE_FROM_MEMBER_ID(STRING memberId, GAMER_HANDLE& gamerHandle, INT sizeOfData) = "0xff9da93a747b9ba0"

//INFO: Retrieve a gamer handle from it's string representation
NATIVE PROC NETWORK_HANDLE_FROM_STRING(STRING handle, GAMER_HANDLE& gamerHandle, INT sizeOfData) = "0xef4886404593a9a6"

//INFO: Retrieve a gamer handle from a player index. In non-network games, this will return the local gamer handle
NATIVE PROC NETWORK_HANDLE_FROM_PLAYER(PLAYER_INDEX playerIndex, GAMER_HANDLE& gamerHandle, INT sizeOfData) = "0x460ffcec183339c6"

//INFO: Retrieve a hash for a gamer handle from a player index. In non-network games, this will return the local gamer handle
NATIVE FUNC INT NETWORK_HASH_FROM_PLAYER_HANDLE(PLAYER_INDEX playerIndex) = "0x4ae7f6d227ed332c"

//INFO: Retrieve a hash for a gamer handle
NATIVE FUNC INT NETWORK_HASH_FROM_GAMER_HANDLE(GAMER_HANDLE& gamerHandle) = "0x2c99b177728438dd"

//INFO: Retrieve a gamer handle from a friend index
NATIVE PROC NETWORK_HANDLE_FROM_FRIEND(INT friendIndex, GAMER_HANDLE& gamerHandle, INT sizeOfData) = "0x68527850aed38263"

//INFO: Retrieve a gamer handle from a met player index
NATIVE PROC NETWORK_HANDLE_FROM_MET_PLAYER(INT metPlayerIndex, GAMER_HANDLE& gamerHandle, INT sizeOfData) = "0xd5843b707d2c8c83"

//INFO: Log out a gamer handle
NATIVE FUNC BOOL NETWORK_LOG_GAMER_HANDLE(GAMER_HANDLE& gamerHandle) = "0x0e3d0311d135dbb6"

//INFO: Retrieve a gamertag from a gamerHandle (async)
NATIVE FUNC BOOL NETWORK_GAMERTAG_FROM_HANDLE_START(GAMER_HANDLE& gamerHandle) = "0x5f0a7b7235c6abed"
NATIVE FUNC BOOL NETWORK_GAMERTAG_FROM_HANDLE_PENDING() = "0x1c80838dc24f06d0"
NATIVE FUNC BOOL NETWORK_GAMERTAG_FROM_HANDLE_SUCCEEDED() = "0x38d0eb5a1b7e5ef3"
NATIVE FUNC STRING NETWORK_GET_GAMERTAG_FROM_HANDLE(GAMER_HANDLE& gamerHandle) = "0x84a4c35df8ab2edf"

//PURPOSE
// Queues up a request to get a list of display names given a list of gamerHandles (async).
// Returns a requestId which is passed to NETWORK_GET_DISPLAYNAMES_FROM_HANDLES (see below).
// If the returned value is < 0, an error has occured and the requestId is not valid.
NATIVE FUNC INT NETWORK_DISPLAYNAMES_FROM_HANDLES_START(GAMER_HANDLE& gamerHandles[], INT count) = "0x750877efc42c7771"

//PURPOSE
// Takes a requestId issued by NETWORK_DISPLAYNAMES_FROM_HANDLES_START.
// Returns an error code (-1=failed, 0=succeeded, 1=pending). Upon succeeding, displayNames is populated.
// If pending is returned, then the request is still retrieving display names.
// The requestId is no longer valid after this function returns succeeded or failed
// (the request is considered completed and is added back to the request pool so it can be reused).
NATIVE FUNC INT NETWORK_GET_DISPLAYNAMES_FROM_HANDLES(INT requestId, TEXT_LABEL_63& displayNames[], INT count) = "0xed9701b5bb864fe4"

NATIVE FUNC BOOL NETWORK_ARE_HANDLES_THE_SAME(GAMER_HANDLE& gamerHandle1, GAMER_HANDLE& gamerHandle2) = "0x3665714316ba3abc"

//INFO: Checks if a gamer handle is valid
NATIVE FUNC BOOL NETWORK_IS_HANDLE_VALID(GAMER_HANDLE& gamerHandle, INT sizeOfData) = "0x66237abafdf8615a"

//INFO: Returns player index of player in session matching handle (-1 if not in session)
NATIVE FUNC PLAYER_INDEX NETWORK_GET_PLAYER_FROM_GAMER_HANDLE(GAMER_HANDLE& gamerHandle) = "0xf6d95ac799ec5ce4"

//INFO: Returns member ID of passed in gamer handle
NATIVE FUNC STRING NETWORK_MEMBER_ID_FROM_GAMER_HANDLE(GAMER_HANDLE& gamerHandle) = "0xfd09a4adc15caae9"

//INFO: Returns TRUE if the player represented by this gamer handle is in the same session
NATIVE FUNC BOOL NETWORK_IS_GAMER_IN_MY_SESSION(GAMER_HANDLE& gamerHandle) = "0x20cd75cdfaf71fd3"

//~>						Gamer handle commands

//INFO: Show the Platform profile UI represented by this gamer handle
NATIVE PROC NETWORK_SHOW_PROFILE_UI(GAMER_HANDLE& gamerHandle) = "0x396cbc3b89746a9d"

//INFO: Show the Platform feedback UI represented by this gamer handle
NATIVE PROC NETWORK_SHOW_FEEDBACK_UI(GAMER_HANDLE& gamerHandle) = "0x07bc9d53f628da19"

//INFO: Return the game region the game was built for
NATIVE FUNC RL_GAME_REGION NETWORK_GET_GAME_REGION() = "0x4def6142d918742c"

//PURPOSE: get net id for car
NATIVE FUNC NETWORK_INDEX VEH_TO_NET(VEHICLE_INDEX vehID) = "0xa08cc064dac564a5"

//PURPOSE: get net id for ped
NATIVE FUNC NETWORK_INDEX PED_TO_NET(PED_INDEX pedID) = "0xed28ee4be581a032"

//PURPOSE: get net id for obj
NATIVE FUNC NETWORK_INDEX OBJ_TO_NET(OBJECT_INDEX objID) = "0x2d0f5291e9305922"

//PURPOSE: get net id for car
NATIVE FUNC VEHICLE_INDEX NET_TO_VEH(NETWORK_INDEX netID) = "0xa5677134b9672173"

//PURPOSE: get net id for ped
NATIVE FUNC PED_INDEX NET_TO_PED(NETWORK_INDEX netID) = "0x8af984152f749d80"

//PURPOSE: get net id for onj
NATIVE FUNC OBJECT_INDEX NET_TO_OBJ(NETWORK_INDEX netID) = "0xe8bbc6cc2c60f24a"

//PURPOSE: get net id for entity
NATIVE FUNC ENTITY_INDEX NET_TO_ENT(NETWORK_INDEX netID) = "0xf2d8dacfaebd9629"

//~>						Player commands

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC STRING NETWORK_PLAYER_GET_NAME(PLAYER_INDEX playerIndex) = "0xed94d2f6be1e6e57"
NATIVE FUNC STRING NETWORK_PLAYER_GET_USERID(PLAYER_INDEX playerIndex, GAMER_USERID& userid) = "0x9bf88c3ed22c5680"

//PURPOSE: Access to gamerdata information for players
NATIVE FUNC BOOL NETWORK_PLAYER_IS_ROCKSTAR_DEV(PLAYER_INDEX playerIndex) = "0x62360ee837e523dc"
NATIVE FUNC BOOL NETWORK_PLAYER_INDEX_IS_CHEATER(PLAYER_INDEX playerIndex) = "0x3237762f8dbb3fab"

//PURPOSE: Checks if a handle is an inactive profile
NATIVE FUNC BOOL NETWORK_IS_INACTIVE_PROFILE(GAMER_HANDLE& gamerHandle) = "0x329832af2d9252af"

//~>						Friend commands

//PURPOSE: Returns maximum number of friends that a gamer profile can have
NATIVE FUNC INT NETWORK_GET_MAX_FRIENDS() = "0xce042f81f8cc55ec"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC INT NETWORK_GET_FRIEND_COUNT() = "0xb9b7c1beadfb5967"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC STRING NETWORK_GET_FRIEND_NAME(INT friendIndex) = "0x399fbd01eec6178d"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC STRING NETWORK_GET_FRIEND_DISPLAY_NAME(INT friendIndex) = "0x2a7e749e640470c6"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL NETWORK_IS_FRIEND_ONLINE(STRING friendName) = "0x7005a5caca127e31"
NATIVE FUNC BOOL NETWORK_IS_FRIEND_HANDLE_ONLINE(GAMER_HANDLE& gamerHandle) = "0x98e8458382a8bd60"
NATIVE FUNC BOOL NETWORK_IS_FRIEND_INDEX_ONLINE(INT friendIndex) = "0xd5ac2a45076e190f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the friend is playing the same game (e.g. GTAIV).
NATIVE FUNC BOOL NETWORK_IS_FRIEND_IN_SAME_TITLE(STRING friendName) = "0xf00204ac7ef3155c"

//PURPOSE: Returns true if the friend is in an online session
NATIVE FUNC BOOL NETWORK_IS_FRIEND_IN_MULTIPLAYER(STRING friendName) = "0xc74fb9ce8dff14bc"

//INFO: Checks if player represented by this gamer handle is a friend of the local player
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL NETWORK_IS_FRIEND(GAMER_HANDLE& gamerHandle) = "0x106c9ee9d83f20df"

//INFO: Checks if a friend request is pending for this player (on either side)
//
NATIVE FUNC BOOL NETWORK_IS_PENDING_FRIEND(GAMER_HANDLE& gamerHandle) = "0xd543c9cc737e715d"

//INFO: Sends an invitation to a player to become your friend.
//      Only available on PS3 - calling on other platforms will ASSERT
//      A return value of false means that we're still processing the last friend request
//      Wait until it returns true (indicating success)
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL NETWORK_IS_ADDING_FRIEND() = "0x89df2f9e72bf257b"

//INFO: Sends an invitation to a player to become your friend.
//      On PS3, opens add friend dialogue with message
//		On 360, opens friend request UI (no message)
//		On PC, sends social club invite
//		Check NETWORK_IS_ADDING_FRIEND returns FALSE - we cannot have concurrent requests
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL NETWORK_ADD_FRIEND(GAMER_HANDLE& gamerHandle, STRING message) = "0x3ca6eff7d6332047"

//INFO:
//PARAM NOTES:
//PURPOSE: Broadcasts a message to all your friends ( if they are signed in ) 
NATIVE PROC NETWORK_BROADCAST_FRIEND_MSG( FRIENDMSG_TYPE messageType, INT dataA, STRING dataB ) = "0x69e1c83bfcabbf17"

//~>							Met Player commands 

//INFO: //Players met are not necessarily still in the session.
//The player history contains the 100 most recently met players.
//PARAM NOTES:
//PURPOSE: Returns the number of players met during the current session. More info..
NATIVE FUNC INT NETWORK_GET_NUM_PLAYERS_MET() = "0xf02114ea7a458f22"

//INFO: 
//PARAM NOTES:
//PURPOSE:Given an index into the player history, returns the name of the player.
NATIVE FUNC STRING NETWORK_GET_MET_PLAYER_NAME(INT playerMetIndex) = "0xb330a05489d0597e"

//~>								Player commands 

//PURPOSE: Set to toggle player corrupt setting (wrt team, i.e. dirty cop)
NATIVE PROC NETWORK_SET_PLAYER_IS_CORRUPT(BOOL bIsCorrupt) = "0x81d3117f42d78599"

//PURPOSE: flag maintained by script denotes whether player is in passive mode
NATIVE PROC NETWORK_SET_PLAYER_IS_PASSIVE(BOOL bIsPassive) = "0x00f11f13db7b0557"

//PURPOSE: Gets if the passed player has a waypoint, owns it and is relevant to the player (same vehicle, etc)
NATIVE FUNC BOOL NETWORK_GET_PLAYER_OWNS_WAYPOINT(PLAYER_INDEX nPlayerIndex) = "0xb0000c531d36bf52"

//PURPOSE: Returns true if the local player can set a waypoint
NATIVE FUNC BOOL NETWORK_CAN_SET_WAYPOINT() = "0x2c9a82f641eb2b03"

//PURPOSE: Always allows the local player to override the waypoint. Must be called every frame while you want this to happen
NATIVE PROC NETWORK_IGNORE_REMOTE_WAYPOINTS() = "0x1323701413ee96ed"

//~>								Blocklist

//INFO: Check if a player is on our platform (PSN / XBL) block list
NATIVE FUNC BOOL NETWORK_IS_PLAYER_ON_BLOCKLIST(GAMER_HANDLE& gamerHandle) = "0x4fe96998f5362544"

//~>								Chat commands 

//PURPOSE: Indicates to code that the local player should be automuted
NATIVE FUNC BOOL NETWORK_SET_SCRIPT_AUTOMUTED(BOOL bIsAutoMuted) = "0xf3b37fc3d63a0b2e"

//PURPOSE: Check gamer data override for automute
NATIVE FUNC BOOL NETWORK_HAS_AUTOMUTE_OVERRIDE() = "0x713140fddd107d38"

//PURPOSE: Check if local player has headset
NATIVE FUNC BOOL NETWORK_HAS_HEADSET() = "0xe99748d31dcc4193"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set to toggle the player ped looking at other talking players
NATIVE PROC NETWORK_SET_LOOK_AT_TALKERS(BOOL bLookAtTalkers) = "0x19f0c576b0bb607f"

//PURPOSE: Returns true if the local player is chatting into the mic
NATIVE FUNC BOOL NETWORK_IS_LOCAL_TALKING() = "0xa066f2ce431c1037"

//PURPOSE: Returns true if the voice chat mode is Push to Talk and the talk state is enabled
NATIVE FUNC BOOL NETWORK_IS_PUSH_TO_TALK_ACTIVE() = "0xabbff2b5d58ab081"

//PURPOSE: Interactions with voice chat system using a gamer handle
//
NATIVE FUNC BOOL NETWORK_GAMER_HAS_HEADSET(GAMER_HANDLE& hGamer) = "0x3503dc08fbedea4f"
NATIVE FUNC BOOL NETWORK_IS_GAMER_TALKING(GAMER_HANDLE& hGamer) = "0x073cb74794ba9b10"
NATIVE FUNC BOOL NETWORK_MUTE_GAMER(GAMER_HANDLE& hGamer, BOOL bIsMuted) = "0x9657890dcbe16133"

//PURPOSE: Communication checks with a gamer handle
//		   NETWORK_CAN_COMMUNICATE_WITH_GAMER encompasses all. Use this in 
//		   script to determine whether we should show the voice icon or not. 
//
NATIVE FUNC BOOL NETWORK_CAN_COMMUNICATE_WITH_GAMER(GAMER_HANDLE& hGamer) = "0x5b54656f67f47385"
NATIVE FUNC BOOL NETWORK_CAN_VOICE_CHAT_WITH_GAMER(GAMER_HANDLE& hGamer) = "0x41e4d9038b40d715"
NATIVE FUNC BOOL NETWORK_CAN_TEXT_CHAT_WITH_GAMER(GAMER_HANDLE& hGamer) = "0x945749f6dcb3d9dd"
NATIVE FUNC BOOL NETWORK_IS_GAMER_MUTED_BY_ME(GAMER_HANDLE& hGamer) = "0x5ac8e3af6b0e9458"
NATIVE FUNC BOOL NETWORK_AM_I_MUTED_BY_GAMER(GAMER_HANDLE& hGamer) = "0x3d2c801f928ba9c8"
NATIVE FUNC BOOL NETWORK_IS_GAMER_BLOCKED_BY_ME(GAMER_HANDLE& hGamer) = "0x4882a06b36985dd5"
NATIVE FUNC BOOL NETWORK_AM_I_BLOCKED_BY_GAMER(GAMER_HANDLE& hGamer) = "0x644b8fb9f0b8af6e"

//PURPOSE: Permission checks with a gamer handle
//         Target gamer handle must be in a session with the local gamer (freeroam or corona)
//		   Can check if we have data for this player using NETWORK_PERMISSIONS_HAS_GAMER_RECORD
//
NATIVE FUNC BOOL NETWORK_PERMISSIONS_HAS_GAMER_RECORD(GAMER_HANDLE& hGamer) = "0x559ebf901a8c68e0"
NATIVE FUNC BOOL NETWORK_CAN_VIEW_GAMER_USER_CONTENT(GAMER_HANDLE& hGamer) = "0x3984fbefe07835d4"
NATIVE FUNC BOOL NETWORK_HAS_VIEW_GAMER_USER_CONTENT_RESULT(GAMER_HANDLE& hGamer) = "0xdbbcdf48b7dc1a3c"
NATIVE FUNC BOOL NETWORK_CAN_PLAY_MULTIPLAYER_WITH_GAMER(GAMER_HANDLE& hGamer) = "0xd437dca500b0f4cc"
NATIVE FUNC BOOL NETWORK_HAS_PLAY_MULTIPLAYER_WITH_GAMER_RESULT(GAMER_HANDLE& hGamer) = "0x96ffbe55e8fb1b06"
NATIVE FUNC BOOL NETWORK_CAN_GAMER_PLAY_MULTIPLAYER_WITH_ME(GAMER_HANDLE& hGamer) = "0xf316f43863f9dc1c"
NATIVE FUNC BOOL NETWORK_CAN_SEND_LOCAL_INVITE(GAMER_HANDLE& hGamer) = "0x021abcbd98ec4320"
NATIVE FUNC BOOL NETWORK_CAN_RECEIVE_LOCAL_INVITE(GAMER_HANDLE& hGamer) = "0x421e34c55f125964"

//INFO: 
//PARAM NOTES:
//PURPOSE:Returns true if the given player is currently chatting.
NATIVE FUNC BOOL NETWORK_IS_PLAYER_TALKING(PLAYER_INDEX NetPlayerID) = "0x4f35a48da4069275"

//INFO: 
//PARAM NOTES:
//PURPOSE:Returns true if the given player has a headset connected.
NATIVE FUNC BOOL NETWORK_PLAYER_HAS_HEADSET(PLAYER_INDEX NetPlayerID) = "0x096cdf67382a3eaf"

//INFO: 
//PARAM NOTES:
//PURPOSE: Mutes / unmutes the remote player.
NATIVE FUNC BOOL NETWORK_SET_PLAYER_MUTED(PLAYER_INDEX NetPlayerID, BOOL muted) = "0x36cc9dac389105a5"

//INFO: Check communication status with a particular player
NATIVE FUNC BOOL NETWORK_CAN_COMMUNICATE_WITH_PLAYER(PLAYER_INDEX NetPlayerID) = "0x48b80ad893d1511e"
NATIVE FUNC BOOL NETWORK_CAN_VOICE_CHAT_WITH_PLAYER(PLAYER_INDEX NetPlayerID) = "0x8e211ab9d76da9af"
NATIVE FUNC BOOL NETWORK_CAN_TEXT_CHAT_WITH_PLAYER(PLAYER_INDEX NetPlayerID) = "0xdfe2352abfe36577"
NATIVE FUNC BOOL NETWORK_IS_PLAYER_MUTED_BY_ME(PLAYER_INDEX NetPlayerID) = "0x2c9478e81d9b8529"
NATIVE FUNC BOOL NETWORK_AM_I_MUTED_BY_PLAYER(PLAYER_INDEX NetPlayerID) = "0x562b711f727c6a94"
NATIVE FUNC BOOL NETWORK_IS_PLAYER_BLOCKED_BY_ME(PLAYER_INDEX NetPlayerID) = "0x9920f898aa3d335e"
NATIVE FUNC BOOL NETWORK_AM_I_BLOCKED_BY_PLAYER(PLAYER_INDEX NetPlayerID) = "0xe8a860ca60e8825c"

//INFO: Get the mute count and number of talkers met for the given player
//PARAMS:
//	index - player index
//	outMuteCount - number of times the given player has been muted by other players
//	outTalkerCount - number of peole the player has met that could mute them (talkers)
NATIVE PROC NETWORK_GET_MUTE_COUNT_FOR_PLAYER(PLAYER_INDEX index, INT& outMuteCount, INT& outTalkerCount) = "0x15d53e1db1bcfbd6"

//INFO: Debug function to override the stats used for automuting.  Bank only.
NATIVE PROC DEBUG_NETWORK_SET_LOCAL_PLAYER_MUTE_COUNT(INT muteCount, INT talkerCount) = "0x2c23d6d8ced35f4c"

//PURPOSE:Returns loudness of local player [0,1]
NATIVE FUNC FLOAT NETWORK_GET_PLAYER_LOUDNESS(PLAYER_INDEX NetPlayerID) = "0xaeed8da6a6fc1e71"

//INFO: Only chat to/from that player will be transmitted/received.
//PARAM NOTES:
//PURPOSE: Sets the voice chat focus on the given player. More info..
NATIVE PROC NETWORK_SET_TALKER_FOCUS(INT NetPlayerID) = "0xc18aecadee28bba5"

//INFO: 
//PARAM NOTES: 0.0 implies no threshold and we can chat regardless of distance
//PURPOSE: Sets the distance threshold that determines how close a player must be before we can chat with him. This does
//		   not account for height. That can be set with NETWORK_SET_TALKER_PROXIMITY_HEIGHT below
NATIVE PROC NETWORK_SET_TALKER_PROXIMITY(FLOAT distance) = "0xf2a3015d39de3214"
NATIVE FUNC FLOAT NETWORK_GET_TALKER_PROXIMITY() = "0xb196c3161720011e"

//INFO: 
//PARAM NOTES:  
//PURPOSE: The maximum height difference at which talkers can hear each other. 
NATIVE PROC NETWORK_SET_TALKER_PROXIMITY_HEIGHT(FLOAT height) = "0x4acccec6475126e0"

//INFO: 
//PARAM NOTES: 0.0 implies no threshold and we can hear loudhailers regardless of distance
//PURPOSE: Sets the distance threshold that determines how close a player must be before we can hear them speak using a loudhailer. 
//		   This does not account for height. That can be set with NETWORK_SET_LOUDHAILER_PROXIMITY_HEIGHT below
NATIVE PROC NETWORK_SET_LOUDHAILER_PROXIMITY(FLOAT distance) = "0x5842e9a35ba70270"

//PURPOSE: Allow send / receive override to work with a negative proximity
NATIVE PROC NETWORK_ALLOW_OVERRIDE_FOR_NEGATIVE_PROXIMITY(BOOL bOverride) = "0xd9513f44e27818fe"

//INFO: 
//PARAM NOTES:  
//PURPOSE: The maximum height difference at which loudhailers can be heard
NATIVE PROC NETWORK_SET_LOUDHAILER_PROXIMITY_HEIGHT(FLOAT height) = "0x6b6be54611f369b4"

//INFO: Overrides all restrictions on talking to other players. Set to TRUE to allow communication
//      with all players regardless of tutorial session, team, proximity, etc.
NATIVE PROC NETWORK_OVERRIDE_ALL_CHAT_RESTRICTIONS(BOOL bOverride) = "0x95660b858df70978"

//INFO: Enables / disables voice
//PARAM NOTES:
//PURPOSE: Applies to all chat (lobby / in game).
NATIVE PROC NETWORK_SET_VOICE_ACTIVE(BOOL bIsVoiceActive) = "0x5e1f7fb772c73d20"

//INFO: When players are in a transition session, setting this will flag that they should remain 
//      in chat with the players in freeroam. Use when 'on call' 
//
NATIVE PROC NETWORK_REMAIN_IN_GAME_CHAT(BOOL bRemainInGameChat) = "0x868fd470a00ddbb9"

//INFO: Override transition chat restrictions that normally separate the main GTAO session from
//      the transition players. This should be set when going to a new corona from an activity
//
NATIVE PROC NETWORK_OVERRIDE_TRANSITION_CHAT(BOOL bOverride) = "0xfdadb87ed6f4ac6e"

//INFO: Team-only chat is disabled by default.
//PARAM NOTES:
//PURPOSE: Enables/disables team-only chat.  Applies only to in-game chat, not lobby chat.
NATIVE PROC NETWORK_SET_TEAM_ONLY_CHAT(BOOL teamOnlyChat) = "0xeb869caccf04c3b5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tells the text chat system to allow script to set who is on local player's team
NATIVE PROC NETWORK_SET_SCRIPT_CONTROLLING_TEAMS(BOOL override) = "0xf0f6808c20c6fc95"

//INFO:  
//PARAM NOTES:
//PURPOSE: Sets the current player to be on the same team as local player.
NATIVE FUNC BOOL NETWORK_SET_SAME_TEAM_AS_LOCAL_PLAYER(INT playerIndex, BOOL sameTeam) = "0x36379967668bc070"

//INFO: Team-only chat is disabled by default.
//PARAM NOTES:
//PURPOSE: Enables/disables team-only chat.  Applies only to in-game chat, not lobby chat.
NATIVE PROC NETWORK_SET_TEAM_ONLY_TEXT_CHAT(BOOL teamOnlyChat) = "0x6bfe2a77c7c672c8"

//INFO: Disabled by default
//PARAM NOTES:
//PURPOSE: Specified whether we should include unassigned players (team -1) when in team chat
//		   By default, we skip players on -1 for team chat rules (i.e. we can talk to them)
NATIVE PROC NETWORK_SET_TEAM_CHAT_INCLUDE_UNASSIGNED_TEAMS(BOOL bIncludeUnassignedTeams) = "0xc31be88ec6be1993"

//PURPOSE: Override team chat restrictions for a given team. This must be unset when no longer required. 
NATIVE PROC NETWORK_OVERRIDE_TEAM_RESTRICTIONS(INT nTeam, BOOL bOverride) = "0x57814a685f9243d8"

//INFO: By default, players cannot chat with players in the same team when spectating. This allows that to be overridden. 
//PARAM NOTES:
//PURPOSE: Enables/disables. 
NATIVE PROC NETWORK_SET_OVERRIDE_SPECTATOR_MODE(BOOL override) = "0xb83fa1b51fd31083"

//INFO: By default, players in different tutorial sessions cannot chat. This allows that to be overridden. 
//PARAM NOTES:
//PURPOSE: Enables/disables.
NATIVE PROC NETWORK_SET_OVERRIDE_TUTORIAL_SESSION_CHAT(BOOL override) = "0xfba140877b6cf83b"

//PURPOSE: Affects whether proximity is applied for send / receive overrides
NATIVE PROC NETWORK_SET_PROXIMITY_AFFECTS_SEND(BOOL bOverride) = "0xe4c66e240df45497"
NATIVE PROC NETWORK_SET_PROXIMITY_AFFECTS_RECEIVE(BOOL bOverride) = "0x06fa0b3c50d350d4"
NATIVE PROC NETWORK_SET_PROXIMITY_AFFECTS_TEAM(BOOL bOverride) = "0xb299a8f810f36aa2"

//PURPOSE: This disables the standard spectator rules (no chat either way by default)
NATIVE PROC NETWORK_SET_NO_SPECTATOR_CHAT(BOOL bOverride) = "0xc6d350050cadbb6b"

//PURPOSE: This disables the standard spectator rules for players in the same team. 
NATIVE PROC NETWORK_SET_IGNORE_SPECTATOR_CHAT_LIMITS_SAME_TEAM(BOOL bEnable) = "0xd5b849235c9cb53b"

//PURPOSE: Enables / disables sending or receiving only
NATIVE PROC NETWORK_OVERRIDE_SEND_RESTRICTIONS(PLAYER_INDEX nPlayerID, BOOL bOverride) = "0x2a27ddfd2a3dacf9"
NATIVE PROC NETWORK_OVERRIDE_SEND_RESTRICTIONS_ALL(BOOL bOverride) = "0xd944f164f0a87f7f"
NATIVE PROC NETWORK_OVERRIDE_RECEIVE_RESTRICTIONS(PLAYER_INDEX nPlayerID, BOOL bOverride) = "0xbac548a8263a1db3"
NATIVE PROC NETWORK_OVERRIDE_RECEIVE_RESTRICTIONS_ALL(BOOL bOverride) = "0xa014caef43997ae0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enables/disables override of chat restrictions per player.  Applies only to in-game chat, not lobby chat. 
NATIVE PROC NETWORK_OVERRIDE_CHAT_RESTRICTIONS(PLAYER_INDEX player, BOOL bOverride) = "0x468bbc73cbbd8688"

//INFO: 
//PARAM NOTES: This command has to be used on the team that can be heard, ie, if I want cop from team A to hear criminals 
//             from team B, then I need to use this command on every criminal that belongs to team B.
//PURPOSE: Enables/disables override of chat restrictions chat per team.  Applies only to in-game chat, not lobby chat. 
NATIVE PROC NETWORK_OVERRIDE_CHAT_RESTRICTIONS_TEAM_RECEIVE(INT team, BOOL bOverride) = "0xeb51713bfb790009"

//PURPOSE: Sets the voice channel for the local player. Only players in the same channel can communicate over voice chat. 
NATIVE PROC NETWORK_SET_VOICE_CHANNEL(INT nVoiceChannel) = "0x3b0d4839efa8b755"

//PURPOSE: Clears the voice channel for the local player
NATIVE PROC NETWORK_CLEAR_VOICE_CHANNEL() = "0xd455cbc68b2b94af"

//PURPOSE: Override the proximity centre (usually follows player ped)
NATIVE PROC NETWORK_APPLY_VOICE_PROXIMITY_OVERRIDE(VECTOR vOverride) = "0xb16882aaf7bc5ae2"

//PURPOSE: Clears the proximity override
NATIVE PROC NETWORK_CLEAR_VOICE_PROXIMITY_OVERRIDE() = "0x60914999f22ac01c"

//INFO: Voice chat can be disabled in low bandwidth conditions - if voice chat is critical to gameplay, this needs to disabled/enabled
//PURPOSE: Enables bandwidth restriction for voice chat for the specified player
NATIVE PROC NETWORK_ENABLE_VOICE_BANDWIDTH_RESTRICTION(PLAYER_INDEX player) = "0x1f887a325e6c8d4c"

//INFO: Voice chat can be disabled in low bandwidth conditions - if voice chat is critical to gameplay, this needs to disabled/enabled
//PURPOSE: Disables bandwidth restriction for voice chat for the specified player
NATIVE PROC NETWORK_DISABLE_VOICE_BANDWIDTH_RESTRICTION(PLAYER_INDEX player) = "0xfa8a97c557528f85"

//PURPOSE: Enable/Disable text chat from spectators to non-spectators
NATIVE PROC NETWORK_SET_SPECTATOR_TO_NON_SPECTATOR_TEXT_CHAT(BOOL isEnabled) = "0x3655ff7918c6aea6"

//INFO: Returns TRUE when the text chat entry box is visible.
NATIVE FUNC BOOL NETWORK_TEXT_CHAT_IS_TYPING() = "0xd199ee48d2842eb1"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC NETWORK_SET_FRIENDLY_FIRE_OPTION(BOOL friendlyFire) = "0xae3c2157fd741193"

//INFO: Applies current saved scar data to ped with PED_INDEX PedIndex
NATIVE PROC NETWORK_APPLY_PED_SCAR_DATA(PED_INDEX PedIndex, INT characterSlot) = "0xb7f81eb507abeb80"

//INFO: Returns the network object ID (the code id) of a entity.
NATIVE FUNC INT NETWORK_ENTITY_GET_OBJECT_ID(ENTITY_INDEX EntityIndex) = "0x9e617051bd76245d"

//INFO: Returns the network object ID (the code id) of a entity.
NATIVE FUNC ENTITY_INDEX NETWORK_GET_ENTITY_FROM_OBJECT_ID(INT ObjectIndex) = "0x976d297cb25bfc0b"

/// PURPOSE:
///    Sets a rich presence in xbox
/// PARAMS:
///    id       - rich presence id.
//   data       - struct with all presence fields.
//   sizeOfData - sizeof Struct.
//   numFields  - number of fields in the struct.
/// NOTES:
//   ALL FIELDS HAVE TO BE INTS
/// EXAMPLE:
//
//   Declare a structure that represents a rich presence:
//   STRUCT STRUCT_INVITE_EVENT
//   	INT field_0
//   	INT field_1
//   ENDSTRUCT
//
//   Use the struct as you which:
//   STRUCT_INVITE_EVENT presence_0
//   presence_0.field_0 = 10
//   presence_0.field_1 = 11
//
//   Set the rich presence:
//   NETWORK_SET_RICH_PRESENCE(0, presence_0, sizeof(presence_0), 2)
// 
//   On 360 you set only the presence id and the values for the fields in 
//   case the presence has fields, for instance, setting the presence Playing Mission A 
//   is set by specifying the presence id and the index of the mission A.
NATIVE PROC NETWORK_SET_RICH_PRESENCE(PRESENCE_ENUM id, STRUCT &data, INT sizeOfData, INT numFields) = "0x5f540c4c109ab569"

/// PURPOSE:
///    Sets a rich presence string in PS3.
NATIVE PROC NETWORK_SET_RICH_PRESENCE_STRING(PRESENCE_ENUM id, STRING presence) = "0x6e34665f75b2ee0a"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_NETWORK_ID_CAN_MIGRATE(NETWORK_INDEX NetworkId, BOOL CanMigrate) = "0xbea5f528349f8f75"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether a script object will be created on all machines running this script.
NATIVE PROC SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(NETWORK_INDEX NetworkId, BOOL ExistsOnAll) = "0x4c6e9d70687fcdce"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether a script object will always be created on the specified player's machine.
NATIVE PROC SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(NETWORK_INDEX NetworkId, PLAYER_INDEX PlayerId, BOOL AlwaysExistsForPlayer) = "0xaeba172874a3defc"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_NETWORK_ID_STOP_CLONING(NETWORK_INDEX NetworkId, BOOL StopCloning) = "0x7e95c57fe61e6c48"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether this script object can be reassigned to other machines if the owning player leaves the session.
//         If you are disabling reassignment for an object you should prevent it migrating to other machine normally via
//         calling SET_NETWORK_ID_CAN_MIGRATE(FALSE) first.
NATIVE PROC SET_NETWORK_ID_CAN_BE_REASSIGNED(NETWORK_INDEX NetworkId, BOOL CanBeReassigned) = "0xb3f9294b3d9498b4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether this script object can use the network blender to smooth position updates from the controlling
//         machine. An example where you may want to disable this would be for an object that will be moved is several
//         small warps, such as a golf player moving between stroke positions
NATIVE PROC SET_NETWORK_ID_CAN_BLEND(NETWORK_INDEX NetworkId, BOOL CanBlend) = "0x4cd26496757da3e3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether this script object is left behind when it stops being networked. This needs to be called locally as it is not
//         synced. When the machine that controls the object stops networking it, or removes it, the entity will not be removed locally if this
//         flag is set.
NATIVE PROC NETWORK_SET_ENTITY_REMAINS_WHEN_UNNETWORKED(NETWORK_INDEX NetworkId, BOOL Remains) = "0x69d2855a08b4c5bc"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether this script object is only created on other machines if they are participating in the script
NATIVE PROC NETWORK_SET_ENTITY_ONLY_EXISTS_FOR_PARTICIPANTS(ENTITY_INDEX EntityIndex, BOOL Exists) = "0x229dd509edb2fbd4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Unregisters the entity with the network code, but keeps it. It will be removed on all other machines and left on the machine which calls this.
//		   You have to be in control of the ped to do this. The other machines can call NETWORK_SET_ENTITY_REMAINS_WHEN_UNNETWORKED on the entity before
//			it is un-networked if they want the entity to remain on their machines when it stops being networked. 
NATIVE PROC STOP_NETWORKING_ENTITY(NETWORK_INDEX NetworkId) = "0xb3995c3b42e62732"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether this script entity can use the network blender to smooth position updates from the controlling
//         machine. An example where you may want to disable this would be for an object that will be moved is several
//         small warps, such as a golf player moving between stroke positions
NATIVE PROC NETWORK_SET_ENTITY_CAN_BLEND(ENTITY_INDEX EntityIndex, BOOL CanBlend) = "0xf93b5f52f6861a80"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether this script object can use the network blender on remote machines when it is fixed by network. This is only supported for
//		   objects (OBJECT_INDEX) currently. This is a targeted helper native to fix syncing issues with the golf ball in GTAV. Please speak
//		   to a network programmer before using this for other purposes.
NATIVE PROC NETWORK_SET_OBJECT_CAN_BLEND_WHEN_FIXED(OBJECT_INDEX ObjectIndex, BOOL CanBlendWhenFixed) = "0x7c6641b13fa8a476"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether a script entity is visible in the cutscene, locally and/or remotely. The entity must be networked.
NATIVE PROC SET_NETWORK_ID_VISIBLE_IN_CUTSCENE(NETWORK_INDEX NetworkId, BOOL Visible, BOOL RemotelyVisible = false) = "0x16cb19ec6f57d920"

//INFO: 
//PARAM NOTES:
//PURPOSE: HACK VERSION TO AVOID CODE CHANGE. Sets whether a script entity is visible in the cutscene, locally and/or remotely. The entity must be networked.
NATIVE PROC SET_NETWORK_ID_VISIBLE_IN_CUTSCENE_HACK(NETWORK_INDEX NetworkId, BOOL Visible, BOOL RemotelyVisible = false) = "0xa630ac70e7b02764"

//INFO:
//PARAM NOTES:
//PURPOSE: Keeps the local visibility flag (set by SET_NETWORK_ID_VISIBLE_IN_CUTSCENE) remain set after the cutscene has ended
NATIVE PROC SET_NETWORK_ID_VISIBLE_IN_CUTSCENE_REMAIN_HACK(NETWORK_INDEX NetworkId, BOOL set) = "0x2b6a68d9acfe718e"

//INFO: 
//PARAM NOTES:
//PURPOSE: If this called with TRUE, any entities subsequently created during a cutscene will be networked as normal. By default, entities
//         created during a cutscene are not networked as they are only needed locally for the cutscene.
NATIVE PROC SET_NETWORK_CUTSCENE_ENTITIES(BOOL Network) = "0x96aa1b6a2212ecc4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns current setting of whether entities created during a cutscene are networked
NATIVE FUNC BOOL ARE_CUTSCENE_ENTITIES_NETWORKED() = "0x66d6a5e9c511214a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Objects with flag will be passed to other players when the players enters a tutorial session. If there are no
//		   players to pass this object to, it will be hidden from the player
NATIVE PROC SET_NETWORK_ID_PASS_CONTROL_IN_TUTORIAL(NETWORK_INDEX NetworkId, BOOL PassControl) = "0x3673eb5a3c81ba8a"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL IS_NETWORK_ID_OWNED_BY_PARTICIPANT(NETWORK_INDEX NetworkId) = "0x3ba0a79b368faa6d"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL SET_ALWAYS_CLONE_PLAYER_VEHICLE(BOOL bAlwaysClone) = "0xfbacb5bdb38bd11c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Call this every frame to make the local player invisible only on our local machine
NATIVE PROC SET_LOCAL_PLAYER_INVISIBLE_LOCALLY(bool bIncludePlayersVehicle = FALSE) = "0xe41d3e7a282e576d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Call this every frame to make the local player visible only on our local machine
NATIVE PROC SET_LOCAL_PLAYER_VISIBLE_LOCALLY(bool bIncludePlayersVehicle = FALSE) = "0xb18e70e8229e0da6"

//INFO:
//PARAM NOTES:
//PURPOSE: Resets the local player's remote invisible override.
NATIVE PROC RESET_LOCAL_PLAYER_REMOTE_VISIBILITY_OVERRIDE(bool bIncludePlayersVehicle = FALSE) = "0x6C4BC4029e0da6"

//INFO:
//PARAM NOTES: Avoid using this unless you know what you are doing. Players will be invisible but still interactable by other players.
//			   This can caused unexpected behaviour. DO NOT FORGET to reset this via RESET_LOCAL_PLAYER_REMOTE_VISIBILITY_OVERRIDE
//PURPOSE: Sets the local player to be invisible on other machines only.
NATIVE PROC SET_LOCAL_PLAYER_INVISIBLE_REMOTELY(bool bIncludePlayersVehicle = FALSE) = "0xD3D3A6AE229e0da6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Call this every frame to make the given player invisible only on our local machine
NATIVE PROC SET_PLAYER_INVISIBLE_LOCALLY(PLAYER_INDEX PlayerId, bool bIncludePlayersVehicle = FALSE) = "0x75886f399fa24e61"

//INFO: 
//PARAM NOTES:
//PURPOSE: Call this every frame to make the given player visible only on our local machine
NATIVE PROC SET_PLAYER_VISIBLE_LOCALLY(PLAYER_INDEX PlayerId, bool bIncludePlayersVehicle = FALSE) = "0xb5f13d9832e1f2ae"

//INFO: 
//PARAM NOTES: bFadeOut - if true, set player fading out. If false the fade out is removed and the player will be immediately visible again
//PURPOSE: Fades out the local player locally and remotely
NATIVE PROC FADE_OUT_LOCAL_PLAYER(BOOL bFadeOut) = "0x5c53af694de011e8"

//INFO: 
//PARAM NOTES: bFlash - if true, the entity will flash during the fade, if false the entity will do a smooth fade
//			   bNetwork - if true, the fade will be networked and appear on other machines
//PURPOSE: Fades out the entity locally and remotely
NATIVE PROC NETWORK_FADE_OUT_ENTITY(ENTITY_INDEX EntityIndex, BOOL bFlash, BOOL bNetwork) = "0xb970266897bdb48d"

//INFO: 
//PARAM NOTES: bNetwork - if true, the fade will be networked and appear on other machines
//PURPOSE: Fades in the entity with flash
NATIVE PROC NETWORK_FADE_IN_ENTITY(ENTITY_INDEX EntityIndex, BOOL bNetwork, BOOL flash = TRUE) = "0x28271fbfa024090b"

//INFO: Will cause the entity to flash fade out for the given duration.
//PARAM NOTES: iDuration - The duration to flash fade for
//			   bNetwork - if true, the fade will be networked and appear on other machines
//PURPOSE: Fades out the entity locally and remotely
NATIVE PROC NETWORK_FLASH_FADE_OUT_ENTITY_ADVANCED(ENTITY_INDEX EntityIndex, INT iDuration, BOOL bNetwork) = "0xa8c1b312724b9b8c"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns true if the player is fading in or out
NATIVE FUNC BOOL NETWORK_IS_PLAYER_FADING(PLAYER_INDEX PlayerIndex) = "0xf7a68678b96e517c"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns true if the entity is fading in or out
NATIVE FUNC BOOL NETWORK_IS_ENTITY_FADING(ENTITY_INDEX EntityIndex) = "0x3f1009a1e4e10c6a"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Fixup player after cutscene
NATIVE PROC NETWORK_PATCH_POST_CUTSCENE_HS4F_TUN_ENT(ENTITY_INDEX playerPedIndex) = "0x90df9c4b37bb2e9d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Call this to start syncing the local peds look at position
NATIVE PROC NETWORK_SET_LOCAL_PLAYER_SYNC_LOOK_AT(BOOL bSyncLookAt) = "0x962a0c925eda4345"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets a remote player to be visible in our local cutscene.
//         Keep in mind that when the cutscene starts because of sync delays, the remote player might not be in a cutscene yet and could be in full control of their ped
//         So only use this when you can guarantee that the remote player won't behave strangely during the time of the cutscene.
NATIVE PROC SET_REMOTE_PLAYER_VISIBLE_IN_CUTSCENE(PLAYER_INDEX playerIndex, BOOL LocallyVisible) = "0x33796CE71e8f4c75"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_LOCAL_PLAYER_VISIBLE_IN_CUTSCENE(BOOL LocallyVisible, BOOL RemotelyVisible = FALSE) = "0x1555f2f21e8f4c75"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL IS_PLAYER_IN_CUTSCENE(PLAYER_INDEX PlayerId) = "0xd70f3341fff70270"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether a script entity is visible in the cutscene, locally and/or remotely. The entity must be networked.
NATIVE PROC SET_ENTITY_VISIBLE_IN_CUTSCENE(ENTITY_INDEX EntityIndex, BOOL Visible, BOOL RemotelyVisible = false) = "0x176a3f5786237102"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the entity invisible only on the local machine. Can be called on clones. Must be called every frame while you require the entity to be invisible
NATIVE PROC SET_ENTITY_LOCALLY_INVISIBLE(ENTITY_INDEX EntityIndex) = "0xc2c78fe6cde262fe"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the entity visible only on the local machine. Can be called on clones. Must be called every frame while you require the entity to be invisible
NATIVE PROC SET_ENTITY_LOCALLY_VISIBLE(ENTITY_INDEX EntityIndex) = "0x10ce349989cf554b"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL IS_DAMAGE_TRACKER_ACTIVE_ON_NETWORK_ID(NETWORK_INDEX NetworkId) = "0x4426d33401c3dda7"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC ACTIVATE_DAMAGE_TRACKER_ON_NETWORK_ID(NETWORK_INDEX NetworkId, BOOL ActivateTracker) = "0x6f6515f8d9c6f573"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL IS_DAMAGE_TRACKER_ACTIVE_ON_PLAYER(PLAYER_INDEX PlayerId) = "0xe18ea3d7a6a0bca5"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC ACTIVATE_DAMAGE_TRACKER_ON_PLAYER(PLAYER_INDEX PlayerId, BOOL ActivateTracker) = "0x53ab50c5a3c80ffe"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_THIS_MACHINE_RUNNING_SERVER_SCRIPT(BOOL Set) = "0x09559beee3898c2b"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL IS_SPHERE_VISIBLE_TO_ANOTHER_MACHINE(VECTOR Pos, FLOAT Radius) = "0x9a7f99fb89f853b2"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL IS_SPHERE_VISIBLE_TO_PLAYER(PLAYER_INDEX PlayerId, VECTOR Pos, FLOAT Radius) = "0x0809d748691dca79"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL IS_SPHERE_VISIBLE_TO_TEAM(INT iTeam, VECTOR Pos, FLOAT Radius) = "0x34555a11b96d6b44"

//INFO: 
//PARAM NOTES:
//PURPOSE: Reserves space in the population pool for the given number of objects. This space will also be reserved in the population pools of nearby players not running this script
NATIVE PROC RESERVE_NETWORK_MISSION_OBJECTS(INT NumObjectsToReserve) = "0x6f2e4667a6039155"

//INFO: 
//PARAM NOTES:
//PURPOSE: Reserves space in the population pool for the given number of peds. This space will also be reserved in the population pools of nearby players not running this script.
NATIVE PROC RESERVE_NETWORK_MISSION_PEDS(INT NumPedsToReserve) = "0xf8b8a6edaa31f196"

//INFO: 
//PARAM NOTES:
//PURPOSE: Reserves space in the population pool for the given number of vehicles. This space will also be reserved in the population pools of nearby players not running this script.
NATIVE PROC RESERVE_NETWORK_MISSION_VEHICLES(INT NumVehiclesToReserve) = "0xc1f83f3b5f8e7d3b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Reserves space in the population pool for the given number of objects. 
//         ** This space will only be reserved locally, and will be added to the reservation in RESERVE_NETWORK_MISSION_OBJECTS. Use this if you don't want the reservations
//         affecting the populations of nearby players who are not running the script **
NATIVE PROC RESERVE_LOCAL_NETWORK_MISSION_OBJECTS(INT NumObjectsToReserve) = "0x793e115a707d0bf5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Reserves space in the population pool for the given number of peds. 
//         ** This space will only be reserved locally, and will be added to the reservation in RESERVE_NETWORK_MISSION_PEDS. Use this if you don't want the reservations
//         affecting the populations of nearby players who are not running the script **
NATIVE PROC RESERVE_LOCAL_NETWORK_MISSION_PEDS(INT NumPedsToReserve) = "0x597076e4da5ff2c8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Reserves space in the population pool for the given number of vehicles. 
//         ** This space will only be reserved locally, and will be added to the reservation in RESERVE_NETWORK_MISSION_VEHICLES. Use this if you don't want the reservations
//         affecting the populations of nearby players who are not running the script **
NATIVE PROC RESERVE_LOCAL_NETWORK_MISSION_VEHICLES(INT NumVehiclesToReserve) = "0x24f74da00e9a5f6f"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL CAN_REGISTER_MISSION_OBJECTS(INT NumObjectsToRegister) = "0x853ffa3d0a54864f"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL CAN_REGISTER_MISSION_PEDS(INT NumPedsToRegister) = "0xa777df215ccfcc77"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL CAN_REGISTER_MISSION_VEHICLES(INT NumVehiclesToRegister) = "0x993e56b8150c834f"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL CAN_REGISTER_MISSION_PICKUPS(INT NumPickupsToRegister) = "0xd5410f7a2dfbf144"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL CAN_REGISTER_MISSION_DOORS(INT NumDoorsToRegister) = "0x8920a9ffccdd08a4"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL CAN_REGISTER_MISSION_ENTITIES(INT NumPedsToRegister, INT NumVehiclesToRegister, INT NumObjectsToRegister, INT NumPickupsToRegister) = "0xaed41619adf56fa1"

//INFO: 
//PARAM NOTES:
//     bForAllScripts - if true, returns the totla number of reservations for all running scripts, if false, it returns the reservation for this script
//     reservationType - specifies whether to return the total reservations, local-only reservations, or global-only reservations
//PURPOSE: 
NATIVE FUNC INT GET_NUM_RESERVED_MISSION_OBJECTS(BOOL bForAllScripts = FALSE, NETWORK_RESERVATION_TYPE reservationType = RESERVATION_ALL) = "0xc162eec794cbb80b"

//INFO: 
//PARAM NOTES:
//     bForAllScripts - if true, returns the totla number of reservations for all running scripts, if false, it returns the reservation for this script
//     reservationType - specifies whether to return the total reservations, local-only reservations, or global-only reservations
//PURPOSE: 
NATIVE FUNC INT GET_NUM_RESERVED_MISSION_PEDS(BOOL bForAllScripts = FALSE, NETWORK_RESERVATION_TYPE reservationType = RESERVATION_ALL) = "0x8736933282d0483c"

//INFO: 
//PARAM NOTES:
//     bForAllScripts - if true, returns the totla number of reservations for all running scripts, if false, it returns the reservation for this script
//     reservationType - specifies whether to return the total reservations, local-only reservations, or global-only reservations
//PURPOSE: 
NATIVE FUNC INT GET_NUM_RESERVED_MISSION_VEHICLES(BOOL bForAllScripts = FALSE, NETWORK_RESERVATION_TYPE reservationType = RESERVATION_ALL) = "0xbd7b8099c8298d2f"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC INT GET_NUM_CREATED_MISSION_OBJECTS(BOOL bForAllScripts = FALSE) = "0xd768f3d3e0b175ba"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC INT GET_NUM_CREATED_MISSION_PEDS(BOOL bForAllScripts = FALSE) = "0xd2a20a5254d61849"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC INT GET_NUM_CREATED_MISSION_VEHICLES(BOOL bForAllScripts = FALSE) = "0x0659dfd69713128d"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC GET_RESERVED_MISSION_ENTITIES_FOR_THREAD(THREADID thread, INT& numReservedPeds, INT& numReservedVehicles, INT& numReservedObjects, INT& numCreatedPeds, INT& numCreatedVehicles, INT& numCreatedObjects) = "0x33b7ba889fa48f98"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC GET_RESERVED_MISSION_ENTITIES_IN_AREA(VECTOR location, BOOL includeLocalScripts, INT& numReservedPeds, INT& numReservedVehicles, INT& numReservedObjects) = "0xe3044344abe71c51"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the maximum number of objects (i.e. crates) supported by the network game. This includes those
//         available for use by the ambient population.
NATIVE FUNC INT GET_MAX_NUM_NETWORK_OBJECTS() = "0x18b73745d9f21827"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the maximum number of peds supported by the network game. This includes those
//         available for use by the ambient population.
NATIVE FUNC INT GET_MAX_NUM_NETWORK_PEDS() = "0x99e3ad53c601992b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the maximum number of vehicles supported by the network game. This includes those
//         available for use by the ambient population.
NATIVE FUNC INT GET_MAX_NUM_NETWORK_VEHICLES() = "0x7ffc70fd55827ec2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the maximum number of pickups supported by the network game.
NATIVE FUNC INT GET_MAX_NUM_NETWORK_PICKUPS() = "0xa577826f8efd9e96"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the scope distance for an object - this is the distance in metres from a remote player at which the object will get created on his machine. Passing in 0 will make the object revert to the default distance.
NATIVE PROC NETWORK_SET_OBJECT_SCOPE_DISTANCE(OBJECT_INDEX ObjectID, INT distance) = "0x75792f006b6dd7a3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Allows a network object(currently only Submarine) to be cloned for other while the owner player is in a tutorial
//         This resets when the script shuts down but can be reset manually
NATIVE PROC NETWORK_ALLOW_CLONING_WHILE_IN_TUTORIAL(NETWORK_INDEX NetworkId, BOOL allow) = "0x9c0542ceb9d1bdb9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Overrides the CTaskCutscene's scoping distance for remote players. Must be reset to 1.0f when no longer needed
NATIVE PROC NETWORK_SET_TASK_CUTSCENE_INSCOPE_MULTIPLER(FLOAT multiplier) = "0xC6FCEE21C6FCEE21"

//INFO: Returns the network time. This will return the same time for all calls within a frame. 
NATIVE FUNC TIME_DATATYPE GET_NETWORK_TIME() = "0x0a89fdfa763dcaed"

//INFO: Returns the network time. This will return the time *now*
NATIVE FUNC TIME_DATATYPE GET_NETWORK_TIME_ACCURATE() = "0xe75390f3ca208d5e"

//INFO: Returns the network time pausable by script. This allows script to use a synced
//		timer that they can stop and start on demand. Implemented as a separate timer as
//		some usages of network time don't want to support pausing
//		The timer can be paused via STOP_NETWORK_TIME_PAUSABLE() and RESTART_NETWORK_TIME_PAUSABLE()
NATIVE FUNC TIME_DATATYPE GET_NETWORK_TIME_PAUSABLE() = "0xd5a4a73aa4f7c470"

//INFO: Returns whether network clock has started. 
NATIVE FUNC BOOL HAS_NETWORK_TIME_STARTED() = "0x75876798a41dd8fb"

//INFO: Stops the pausable network timer. This allows script to use a synced
//		timer that they can stop and start on demand. Implemented as a separate timer as
//		some usages of network time don't want to support pausing
//		Access to this pausable timer is via GET_NETWORK_TIME_PAUSABLE()
NATIVE PROC STOP_NETWORK_TIME_PAUSABLE() = "0xcc3b71cbaf5e6d7f"

//INFO: Restarts the pausable network timer. This allows script to use a synced
//		timer that they can stop and start on demand. Implemented as a separate timer as
//		some usages of network time don't want to support pausing
//		Access to this pausable timer is via GET_NETWORK_TIME_PAUSABLE()
NATIVE PROC RESTART_NETWORK_TIME_PAUSABLE() = "0xcb300d54b68be87a"

//INFO: Returns a time datatype variable offset by Offset milliseconds
NATIVE FUNC TIME_DATATYPE GET_TIME_OFFSET(TIME_DATATYPE Time1, INT Offset) = "0x35de445e5254afed"

//INFO: Return TRUE if Time1 is less than Time2. FALSE otherwise.     
NATIVE FUNC BOOL IS_TIME_LESS_THAN(TIME_DATATYPE Time1, TIME_DATATYPE Time2) = "0x516fe5ef30df734d"
 
//INFO: Return TRUE if Time1 is greater than Time2. FALSE otherwise. 
NATIVE FUNC BOOL IS_TIME_MORE_THAN(TIME_DATATYPE Time1, TIME_DATATYPE Time2) = "0xe17ff5faec73b872"
  
//INFO: Return TRUE if Time1 is equal to Time2. FALSE otherwise. 
NATIVE FUNC BOOL IS_TIME_EQUAL_TO(TIME_DATATYPE Time1, TIME_DATATYPE Time2) = "0x12b09bf1b251174f"

//INFO: Return INT representing time between Time1 and Time2
NATIVE FUNC INT GET_TIME_DIFFERENCE(TIME_DATATYPE Time1, TIME_DATATYPE Time2) = "0x780a854e3a976a66"

//INFO: Return time formatted in h:mm:ss.ms
NATIVE FUNC STRING GET_TIME_AS_STRING(TIME_DATATYPE Time) = "0x441086029f1a02ac"

//INFO: Return cloud time as string (in seconds since midnight 1970-01-01)
NATIVE FUNC STRING GET_CLOUD_TIME_AS_STRING() = "0x8546487b176b3a16"

//INFO: Return cloud time as int (in seconds since midnight 1970-01-01)
//      This will not do what you expect after sometime in ~2038
NATIVE FUNC INT GET_CLOUD_TIME_AS_INT() = "0x48352343bc5a41ae"

//INFO: Return cloud time as int (in seconds since midnight 1970-01-01)
//      This will not do what you expect after sometime in ~2038
NATIVE PROC CONVERT_POSIX_TIME(INT nContentIndex, UGC_DATE& sDate) = "0x2351ad81ce3040e7"


//~>					Single player commands

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL NETWORK_STORE_SINGLE_PLAYER_GAME() = "0xfd881248993e8ff9"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SHUTDOWN_AND_LAUNCH_SINGLE_PLAYER_GAME() = "0xc0bcf14f60b6723a"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SHUTDOWN_AND_LAUNCH_NETWORK_GAME(INT EpisodeToLaunch) = "0xa67137b9e8820402"


//PURPOSE: Attempts to start a new single player game and load the most recent single player savegame.
//			The code must first queue a savegame operation. If that fails then this command will behave like SHUTDOWN_AND_LAUNCH_SINGLE_PLAYER_GAME(). It will also return FALSE.
//			If the savegame operation can be queued then this command will return TRUE. It will take a number of frames to find the most recent save so this command won't be as immediate as SHUTDOWN_AND_LAUNCH_SINGLE_PLAYER_GAME()
NATIVE FUNC BOOL SHUTDOWN_AND_LOAD_MOST_RECENT_SAVE() = "0xad8c8a4fc6466e66"

//~>				Spectator commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the local in spectator Mode. pedIndex - Ped index to spectate.
//         If the index is -1 the it only sets the spectator flag.
NATIVE PROC NETWORK_SET_IN_SPECTATOR_MODE(BOOL InSpectatorMode, PED_INDEX playerIndex) = "0x86998d41f61b3824"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the local in spectator Mode. pedIndex - Ped index to spectate.
//         If the index is -1 the it only sets the spectator flag.
//         By default it's not allowed to start spectating a player in a different tutorial session, this can
//         be allowed by setting the skipTutorialCheck parameter
NATIVE PROC NETWORK_SET_IN_SPECTATOR_MODE_EXTENDED(BOOL InSpectatorMode, PED_INDEX playerIndex, BOOL skipTutorialCheck) = "0x1fd50aaf9da2199e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the local in free cam Mode. This is used to ensure remote machines track
//         where the free cam is looking
NATIVE PROC NETWORK_SET_IN_FREE_CAM_MODE(BOOL InFreeCamMode) = "0x027db13bd5d494cc"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the localplayer antagonistic to. pedIndex - .
//         If the index is -1 the it only sets the antagonistic flag.
NATIVE PROC NETWORK_SET_ANTAGONISTIC_TO_PLAYER(BOOL IsAntagonisticTo, PLAYER_INDEX playerIndex) = "0x88136d6f0b181ac5"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL NETWORK_IS_IN_SPECTATOR_MODE() = "0xd852449bf2e2ba8d"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC NETWORK_SET_IN_MP_TUTORIAL(BOOL InMPTutorial) = "0xf9cbd5d59932efc9"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC NETWORK_SET_IN_MP_CUTSCENE(BOOL InMPCutscene, BOOL MakePlayerInvincible = TRUE) = "0x3dc5858acd1e01cb"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL NETWORK_IS_IN_MP_CUTSCENE() = "0xc96a605cf3e9295b"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL NETWORK_IS_PLAYER_IN_MP_CUTSCENE(PLAYER_INDEX playerIndex) = "0x6ecbf4ab299fabc8"

#IF IS_DEBUG_BUILD

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL NETWORK_IS_IN_CODE_DEVELOPMENT_MODE() = "0xf4f4632825caad72"

#ENDIF // IS_DEBUG_BUILD

//INFO: Call this before starting cutscene to hide all projectiles during cutscene
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC NETWORK_HIDE_PROJECTILE_IN_CUTSCENE() = "0x93298603b7b45e44"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_NETWORK_VEHICLE_RESPOT_TIMER(NETWORK_INDEX NetworkId, INT Timer, BOOL flashRemotely = TRUE, BOOL flashLocally = FALSE) = "0x1da01ba2f8b68b2c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns weather the vehicle is running respotting. This can be the original respot timer or the extended timer used if there is an overlap
NATIVE FUNC BOOL IS_NETWORK_VEHICLE_RUNNING_RESPOT_TIMER(NETWORK_INDEX NetworkId) = "0x63c922a179fe1872"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_NETWORK_VEHICLE_AS_GHOST(VEHICLE_INDEX VehicleIndex, BOOL bSet) = "0xe06a9b86c360e754"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Used to increase the pop distance threshold for vehicles.
NATIVE PROC SET_NETWORK_VEHICLE_MAX_POSITION_DELTA_MULTIPLIER(VEHICLE_INDEX VehicleIndex, FLOAT multiplier) = "0x17e509655d220fc4"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Used to add aditional checks for vehicles that might go over the edge of the map on cartain mods/races.
NATIVE PROC SET_NETWORK_ENABLE_HIGH_SPEED_EDGE_FALL_DETECTION(VEHICLE_INDEX VehicleIndex, BOOL enable) = "0xd221ac9d6c50c068"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the local player as a ghost, so that other players are displayed semi-transparent and the local player will not be able to collide with them.
//PARAMS: If bInvertGhosting is set to TRUE and bSet is TRUE, then the local player will be displayed semi-transparent instead (remote players will be rendered as normal) 
NATIVE PROC SET_LOCAL_PLAYER_AS_GHOST(BOOL bSet, BOOL bInvertGhosting = FALSE) = "0x6ca6298e3e0086f4"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL IS_ENTITY_A_GHOST(ENTITY_INDEX EntityIndex) = "0x1843cf59bb5efd96"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether non-participants of this script are ghosted out and non-interactable with the local player. Use when you don't want non-participants griefing participants.
NATIVE PROC SET_NON_PARTICIPANTS_OF_THIS_SCRIPT_AS_GHOSTS(BOOL bSet) = "0x42c38ac3d109cfe1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a specific player to be ghosted out and non-interactable with the local player
NATIVE PROC SET_REMOTE_PLAYER_AS_GHOST(PLAYER_INDEX PlayerId, BOOL bSet) = "0x6870fb27b885e344"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the alpha used for ghosting. This will be reset when the calling script shuts down. You must call this with a value greater than 0 and less than 256.
NATIVE PROC SET_GHOST_ALPHA(INT alphavalue) = "0xde2669f371bb4158"

//INFO: 
//PARAM NOTES:
//PURPOSE: Resets the alpha used for ghosting back to the code default.
NATIVE PROC RESET_GHOST_ALPHA() = "0x7d11369301267ef0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets an entity to be displayed as ghosted for any player that is a ghost. Currently only works for networked entities.
NATIVE PROC SET_ENTITY_GHOSTED_FOR_GHOST_PLAYERS(ENTITY_INDEX entityIndex, BOOL bSet) = "0xbcc4fa7ba265ff12"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets an entity's parachute to be displayed as ghosted for any player that is a ghost. Currently only works for networked entities.
NATIVE PROC SET_PARACHUTE_OF_ENTITY_GHOSTED_FOR_GHOST_PLAYERS(ENTITY_INDEX pedIndex, BOOL bSet) = "0x3c09bc347f7b67c6"

//INFO: 
//PARAM NOTES:
//PURPOSE: If ghosting is inverted, then the local player (or spectated player) will be displayed semi-transparent instead (remote players will be rendered as normal) 
NATIVE PROC SET_INVERT_GHOSTING(BOOL bSet) = "0xe6345a881f643908"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if this entity is intersecting other entities due to ghost mode (this may be the case after ghost mode is switched off)
NATIVE FUNC BOOL IS_ENTITY_IN_GHOST_COLLISION(ENTITY_INDEX EntityIndex) = "0x0bf4b1193e541c22"

//~>				Network tables commands

//INFO:This message is for information purposes and the player has to press button A to continue 
//  the load of the single player game.
//PARAM NOTES:
//PURPOSE: Sets a message that will be displayed during the loading screen. More info
NATIVE PROC SET_MSG_FOR_LOADING_SCREEN(STRING msg) = "0x25bc49d8a4ef820c"

//INFO: 
//PARAM NOTES://  iKillerIndex - index of the player that was the killer.
//  iVictimIndex - index of the player that died.
//  iWeaponType  - index of the weapon that the killer used.
//PURPOSE: When a player kills another player this must be called to register the death. More info..
NATIVE PROC NETWORK_PLAYER_KILLED(PLAYER_INDEX iKillerIndex, PLAYER_INDEX iVictimIndex, WEAPON_TYPE iWeaponType) = "0x6385db6ad2deb066"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL IS_OBJECT_REASSIGNMENT_IN_PROGRESS() = "0xc6c2ffff48ce1bcd"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SAVE_SCRIPT_ARRAY_IN_SCRATCHPAD(STRUCT &Address, INT Size, INT ScriptID, INT ScratchpadIndex = 0) = "0xe146869590d33a8d"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC RESTORE_SCRIPT_ARRAY_FROM_SCRATCHPAD(STRUCT &Address, INT Size, INT ScriptID, INT ScratchpadIndex = 0) = "0x01acb610a3df0017"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC CLEAR_SCRIPT_ARRAY_FROM_SCRATCHPAD(INT ScratchpadIndex = 0) = "0x2cf3280811ca9ad9"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SAVE_SCRIPT_ARRAY_IN_PLAYER_SCRATCHPAD(STRUCT &Address, INT Size, INT ScriptID, PLAYER_INDEX Plr, INT ScratchpadIndex = 0) = "0x22fe2d126238a297"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC RESTORE_SCRIPT_ARRAY_FROM_PLAYER_SCRATCHPAD(STRUCT &Address, INT Size, INT ScriptID, PLAYER_INDEX Plr, INT ScratchpadIndex = 0) = "0xefffdbaf3c83eb0b"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC CLEAR_SCRIPT_ARRAY_FROM_PLAYER_SCRATCHPAD(PLAYER_INDEX Plr, INT ScratchpadIndex = 0) = "0x3228141a1cf4891b"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC CLEAR_SCRIPT_ARRAY_FROM_ALL_PLAYER_SCRATCHPADS(INT ScratchpadIndex = 0) = "0x4b53e9ccbe717ec6"

//INFO: 
//PARAM NOTES:
// PURPOSE:  forces the player colour to be used for the radar and gametag instead of team colours
NATIVE PROC USE_PLAYER_COLOUR_INSTEAD_OF_TEAM_COLOUR(BOOL bActive) = "0x14d30880e9487ecb"

//INFO: 
//PARAM NOTES:
/// PURPOSE:   Returns true if the command -netStartPos was used.
NATIVE FUNC BOOL NETWORK_PARAM_NETSTARTPOS_EXISTS() = "0x983b8a6217bc2f23"

/// PURPOSE:
///    Returns the value set in the command -netStartPos
NATIVE FUNC VECTOR NETWORK_GET_PARAM_NETSTARTPOS() = "0x9a9dd0a4195aba58"

//INFO: 
//PARAM NOTES:
/// PURPOSE:   Returns true if the command -netTeam was used.
NATIVE FUNC BOOL NETWORK_PARAM_TEAM_EXISTS() = "0x5a43bdd288977f2a"

/// PURPOSE:
///    Returns the value set in the command -netTeam
NATIVE FUNC INT NETWORK_GET_PARAM_TEAM() = "0xd1f58c125fea8bd2"


//INFO: 
//PARAM NOTES:
//PURPOSE: Prints a debug string to the console.
NATIVE PROC NET_DEBUG(STRING text, BOOL extraInfo = FALSE) = "0x73ec056a618d7b77"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prints a debug string and int to the console.
NATIVE PROC NET_DEBUG_INT(STRING text, INT i, BOOL extraInfo = FALSE) = "0x0c03ab85c407d127"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prints a debug string and float to the console.
NATIVE PROC NET_DEBUG_FLOAT(STRING text, FLOAT f, BOOL extraInfo = FALSE) = "0xd9d74623f2981726"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prints a debug string and vector to the console.
NATIVE PROC NET_DEBUG_VECTOR(STRING text, VECTOR v, BOOL extraInfo = FALSE) = "0x20ffe9d92a4fb4cb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prints 2 debug string to the console.
NATIVE PROC NET_DEBUG_STRING(STRING text, STRING v, BOOL extraInfo = FALSE) = "0x99cb1d222c496a89"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prints a error string to the console.
NATIVE PROC NET_ERROR(STRING t, BOOL extraInfo = FALSE) = "0x0e432b96db79bf29"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prints a error string to the console.
NATIVE PROC NET_ERROR_INT(STRING t, INT f, BOOL extraInfo = FALSE) = "0x9d2d39a40063151c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prints a error string to the console.
NATIVE PROC NET_ERROR_FLOAT(STRING t, FLOAT f, BOOL extraInfo = FALSE) = "0xf97f9e5a3a80e344"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prints a error string to the console.
NATIVE PROC NET_ERROR_VECTOR(STRING t, VECTOR v, BOOL extraInfo = FALSE) = "0xedd92d9bd774274b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prints a error string to the console.
NATIVE PROC NET_ERROR_STRING(STRING t, STRING s, BOOL extraInfo = FALSE) = "0x77642b4aca2744c4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prints a warning string to the console.
NATIVE PROC NET_WARNING(STRING t, BOOL extraInfo = FALSE) = "0xa30d8b9a5b97688b"
 
//INFO: 
//PARAM NOTES:
//PURPOSE: Prints a warning string to the console.
NATIVE PROC NET_WARNING_INT(STRING t, INT f, BOOL extraInfo = FALSE) = "0x40c64d5db315586d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prints a warning string to the console.
NATIVE PROC NET_WARNING_FLOAT(STRING t, FLOAT f, BOOL extraInfo = FALSE) = "0xe88a89b5b3438670"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prints a warning string to the console.
NATIVE PROC NET_WARNING_VECTOR(STRING t, VECTOR v, BOOL extraInfo = FALSE) = "0x9df1fb62f55e8789"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prints a warning string to the console.
NATIVE PROC NET_WARNING_STRING(STRING t, STRING s, BOOL extraInfo = FALSE) = "0xb51e31274596e7d2"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Returns true if the given player is visible on screen, and not occluded. Can be called every frame.
NATIVE FUNC BOOL NETWORK_IS_PLAYER_VISIBLE(PLAYER_INDEX NetPlayerID) = "0x7d465e8e800fdba9"

//PURPOSE: Returns TRUE if head shot tracking is active in a specified ped model with the specified weapon (or any weapon if WEAPONTYPE_INVALID is specified)
NATIVE FUNC BOOL IS_HEADSHOT_TRACKING_ACTIVE(MODEL_NAMES ModelHashKey, WEAPON_TYPE TypeOfWeapon) = "0xda5d310f3f00e4a7"

//PURPOSE: Start tracking how many times the local player head shots the specified ped model with the specified weapon (or any weapon if WEAPONTYPE_INVALID is specified)
NATIVE PROC START_HEADSHOT_TRACKING(MODEL_NAMES ModelHashKey, WEAPON_TYPE TypeOfWeapon) = "0x006bd7eef261c86b"

//PURPOSE: Stop tracking how many times the local player head shots the specified ped model with the specified weapon (or any weapon if WEAPONTYPE_INVALID is specified)
NATIVE PROC STOP_HEADSHOT_TRACKING(MODEL_NAMES ModelHashKey, WEAPON_TYPE TypeOfWeapon) = "0xbdc6b06fe2b01b34"

//PURPOSE: Return how many times the local player has head shots a ped with the specified ped model with the specified weapon (or any weapon if WEAPONTYPE_INVALID is specified)
NATIVE FUNC INT GET_HEADSHOT_TRACKING_RESULTS(MODEL_NAMES ModelHashKey, WEAPON_TYPE TypeOfWeapon) = "0x3eb663b8765a0bc1"

//PURPOSE: Resets the current count of how many times the local player has headshotted a ped with the specified ped model with the specified weapon (or any weapon if WEAPONTYPE_INVALID is specified)
NATIVE PROC RESET_HEADSHOT_TRACKING_RESULTS(MODEL_NAMES ModelHashKey, WEAPON_TYPE TypeOfWeapon) = "0xae537696e7a2fe18"

//PURPOSE: Returns TRUE if kill tracking is active in a specified ped model with the specified weapon (or any weapon if WEAPONTYPE_INVALID is specified)
NATIVE FUNC BOOL IS_KILL_TRACKING_ACTIVE(MODEL_NAMES ModelHashKey, WEAPON_TYPE TypeOfWeapon) = "0xf0392be8ff226ddb"

//PURPOSE: Start tracking how many times the local player kills the specified ped model with the specified weapon (or any weapon if WEAPONTYPE_INVALID is specified)
NATIVE PROC START_KILL_TRACKING(MODEL_NAMES ModelHashKey, WEAPON_TYPE TypeOfWeapon) = "0x2eea39c146024d2a"

//PURPOSE: Stop tracking how many times the local player kills the specified ped model with the specified weapon (or any weapon if WEAPONTYPE_INVALID is specified)
NATIVE PROC STOP_KILL_TRACKING(MODEL_NAMES ModelHashKey, WEAPON_TYPE TypeOfWeapon) = "0x4ea095a3060d47d7"

//PURPOSE: Return how many times the local player has kills a ped with the specified ped model with the specified weapon (or any weapon if WEAPONTYPE_INVALID is specified)
NATIVE FUNC INT GET_KILL_TRACKING_RESULTS(MODEL_NAMES ModelHashKey, WEAPON_TYPE TypeOfWeapon) = "0x91defd631d3a5d57"

//PURPOSE: Resets the current count of how many times the local player has kills a ped with the specified ped model with the specified weapon (or any weapon if WEAPONTYPE_INVALID is specified)
NATIVE PROC RESET_KILL_TRACKING_RESULTS(MODEL_NAMES ModelHashKey, WEAPON_TYPE TypeOfWeapon) = "0xb857a5dca39dea34"

//PURPOSE: Registers a ped model for tracking when a ped using it is killed for the purposes of assigning rank points
NATIVE PROC REGISTER_MODEL_FOR_RANK_POINTS(MODEL_NAMES ModelHashKey) = "0x6aecd7ab54a56ce8"

//PURPOSE: Return how many times the local player has killed a ped using the specified ped model, all kills of peds with models not registered are tracked separately and returned as a combined total
NATIVE FUNC INT GET_NUM_KILLS_FOR_RANK_POINTS(MODEL_NAMES ModelHashKey) = "0x0ab7d25707702977"

//PURPOSE: Resets the current count of how many times the local player has killed a ped using the specified ped model, all kills of peds with models not registered are tracked separately and returned as a combined total
NATIVE PROC RESET_NUM_KILLS_FOR_RANK_POINTS(MODEL_NAMES ModelHashKey) = "0x293f644ecaae7cb6"

//PURPOSE: Start tracking how many times the local player has killed a civilian ped
NATIVE PROC START_TRACKING_CIVILIAN_KILLS() = "0x178aefd2b12744e5"

//PURPOSE: Stop tracking how many times the local player has killed a civilian ped
NATIVE PROC STOP_TRACKING_CIVILIAN_KILLS() = "0xb0ce936956432ac5"

//PURPOSE: Returns whether the number of civilians killed is currently being tracked
NATIVE FUNC BOOL ARE_CIVILIAN_KILLS_BEING_TRACKED() = "0xd4311d782cb1f42f"

//PURPOSE: Return how many times the local player has killed a civilian ped
NATIVE FUNC INT GET_NUM_CIVILIAN_KILLS() = "0xce798fbc830114b8"

//PURPOSE: Resets the current count of how many times the local player has killed a civilian ped
NATIVE PROC RESET_NUM_CIVILIAN_KILLS() = "0x6d0885e6fa22cd61"

//PURPOSE: Start tracking how many times the local player has killed a specified ped classification type
NATIVE PROC START_TRACKING_PED_KILLS(PED_CLASSIFICATION pedClassification) = "0xb380139c3610e57b"

//PURPOSE: Stop tracking how many times the local player has killed a specified ped classification type
NATIVE PROC STOP_TRACKING_PED_KILLS(PED_CLASSIFICATION pedClassification) = "0xed4b3cae79f223b8"

//PURPOSE: Returns whether the number of a specified ped classification type killed is currently being tracked
NATIVE FUNC BOOL ARE_PED_KILLS_BEING_TRACKED(PED_CLASSIFICATION pedClassification) = "0xa4f353ae88373449"

//PURPOSE: Return how many times the local player has killed a specified ped classification type
NATIVE FUNC INT GET_NUM_PED_KILLS(PED_CLASSIFICATION pedClassification) = "0xeb00aa5a8b2bb449"

//PURPOSE: Resets the current count of how many times the local player has killed a specified ped classification type
NATIVE PROC RESET_NUM_PED_KILLS(PED_CLASSIFICATION pedClassification) = "0x9ab030608106e298"


//PURPOSE: Set a name to display for the specified player
#IF IS_DEBUG_BUILD
NATIVE PROC DISPLAY_PLAYER_NAME(PLAYER_INDEX NetPlayerID, STRING DisplayName, STRING DisplayInfo1 = NULL, STRING DisplayInfo2 = NULL, STRING DisplayInfo3 = NULL, STRING DisplayInfo4 = NULL, STRING DisplayInfo5 = NULL) = "0xcdd939a4b7919690"
#ENDIF	//	IS_DEBUG_BUILD

NATIVE PROC BEGIN_DISPLAY_PLAYER_NAME() = "0xe754e91cb3249589"
NATIVE PROC END_DISPLAY_PLAYER_NAME(PLAYER_INDEX NetPlayerID) = "0xb8890aa016b7414b"
NATIVE FUNC BOOL DISPLAY_PLAYER_NAME_HAS_FREE_ROWS() = "0x65d9264e3fe41012"


//PURPOSE: Returns whether a display name has been set for the specified player
NATIVE FUNC BOOL IS_PLAYER_NAME_DISPLAYED(PLAYER_INDEX NetPlayerID) = "0x966b0ae3ae5786bc"

//PURPOSE: Adds a fake player name to the specified ped. Fake player names are useful for simulating the appearence of a network player outside the network game (e.g. for use in MP tutorials)
NATIVE PROC ADD_FAKE_PLAYER_NAME(PED_INDEX PedIndex, STRING PlayerName, INT Red, INT Green, INT Blue, INT alpha_param) = "0x61bfa77dd2f1513b"

//PURPOSE: Removes a fake player name from the specified ped
NATIVE PROC REMOVE_FAKE_PLAYER_NAME(PED_INDEX PedIndex) = "0x1961e98bc68f36cc"

//PURPOSE: Removes all previously added fake names
NATIVE PROC REMOVE_ALL_FAKE_PLAYER_NAMES() = "0xf781984e87e5bd73"

//PURPOSE: Returns whether the specified ped has been given a fake player name
NATIVE FUNC BOOL DOES_PED_HAVE_FAKE_PLAYER_NAME(PED_INDEX PedIndex) = "0xcbab6983b095f9eb"

//PURPOSE: Returns the current number of fake player names added
NATIVE FUNC INT GET_NUM_FAKE_PLAYER_NAMES() = "0x567fd417e3dc8ea5"

//PURPOSE: Returns the network ID of a script created rope (consistent across machines)
NATIVE FUNC INT NETWORK_GET_NETWORK_ID_FROM_ROPE_ID(INT ScriptRopeID) = "0x76a68f0871651192"

//PURPOSE: Returns the script ID of a script created rope from the network ID (used to call rope script command, not consistent across machines)
NATIVE FUNC INT NETWORK_GET_ROPE_ID_FROM_NETWORK_ID(INT NetworkRopeID) = "0x5e4474c4f41d0b9f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Creates a new networked synchronised scene - this is similar to normal synchronised scenes but a lot more network friendly. Call this on
//         a one machine only, add any peds (regardless of whether they are locally controlled or not) via the NETWORK_ADD_PED_TO_SYNCHRONISED_SCENE,
//         and then start it running with the NETWORK_START_SYNCHRONISED_SCENE command. The scene will automatically be synced to all machines.
NATIVE FUNC INT NETWORK_CREATE_SYNCHRONISED_SCENE( VECTOR scenePosition, VECTOR sceneOrientation, EULER_ROT_ORDER RotOrder = EULER_YXZ, BOOL HoldLastFrame = FALSE, BOOL Looped = FALSE, FLOAT PhaseToStopScene = 1.0, FLOAT PhaseToStartScene = 0.0, FLOAT StartRate = 1.0) = "0x497e09037a63d346"

//INFO: 
//PARAM NOTES:
//PURPOSE: Adds a ped and associated animation data to a previous created network synchronised scene.
NATIVE PROC NETWORK_ADD_PED_TO_SYNCHRONISED_SCENE(PED_INDEX PedIndex, INT NetworkSceneID, STRING animDictionary, STRING anim, FLOAT blendInDelta, FLOAT blendOutDelta, SYNCED_SCENE_PLAYBACK_FLAGS flags = SYNCED_SCENE_NONE, RAGDOLL_BLOCKING_FLAGS ragdollFlags = RBF_NONE, FLOAT moverBlendInDelta = 1000.0, IK_CONTROL_FLAGS ikFlags = AIK_NONE) = "0xff47c397a9269a1a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Adds a ped and associated animation data to a previous created network synchronised scene. Extends NETWORK_ADD_PED_TO_SYNCHRONISED_SCENE to support IK flags.
NATIVE PROC NETWORK_ADD_PED_TO_SYNCHRONISED_SCENE_WITH_IK(PED_INDEX PedIndex, INT NetworkSceneID, STRING animDictionary, STRING anim, FLOAT blendInDelta, FLOAT blendOutDelta, SYNCED_SCENE_PLAYBACK_FLAGS flags = SYNCED_SCENE_NONE, RAGDOLL_BLOCKING_FLAGS ragdollFlags = RBF_NONE, FLOAT moverBlendInDelta = 1000.0, INT ikFlags = 0) = "0xbd37dcd8f01f7304"

//INFO: 
//PARAM NOTES:
//PURPOSE: Adds a non-ped entity and associated animation data to a previous created network synchronised scene.
NATIVE PROC NETWORK_ADD_ENTITY_TO_SYNCHRONISED_SCENE(ENTITY_INDEX EntityIndex, INT NetworkSceneID, STRING animDictionary, STRING anim, FLOAT blendInDelta, FLOAT blendOutDelta, SYNCED_SCENE_PLAYBACK_FLAGS flags = SYNCED_SCENE_NONE) = "0xf6ac18061d64c197"

//INFO: 
//PARAM NOTES:
//PURPOSE: Adds a map entity and associated animation data to a previous created network synchronised scene.
NATIVE PROC NETWORK_ADD_MAP_ENTITY_TO_SYNCHRONISED_SCENE(INT NetworkSceneID, MODEL_NAMES ModelHashKey, VECTOR ModelPosition, STRING animDictionary, STRING anim, FLOAT blendInDelta, FLOAT blendOutDelta, SYNCED_SCENE_PLAYBACK_FLAGS flags = SYNCED_SCENE_NONE) = "0x20cec04bd78f2a17"

//INFO: 
//PARAM NOTES:
//PURPOSE: Adds a camera and associated animation data to a previous created network synchronised scene.
NATIVE PROC NETWORK_ADD_SYNCHRONISED_SCENE_CAMERA(INT NetworkSceneID, STRING animDictionary, STRING anim) = "0x2424cfd501cdb1b4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Attaches a previously created synchronised scene to an entity using the specified bone
NATIVE PROC NETWORK_ATTACH_SYNCHRONISED_SCENE_TO_ENTITY(INT NetworkSceneID, ENTITY_INDEX EntityIndex, INT BoneIndex) = "0xc88dd27ea053f0d3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Starts a previously created network synchronised scene
NATIVE PROC NETWORK_START_SYNCHRONISED_SCENE(INT NetworkSceneID) = "0x60e9dd146055c13e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Stops a previously started network synchronised scene
NATIVE PROC NETWORK_STOP_SYNCHRONISED_SCENE(INT NetworkSceneID) = "0x0b92578fb47da084"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns a local synchronised scene ID (for use with single player synced scene commands) from the network ID created by
//         NETWORK_CREATE_SYNCHRONISED_SCENE
NATIVE FUNC INT NETWORK_GET_LOCAL_SCENE_FROM_NETWORK_ID(INT NetworkSceneID) = "0x57736a7b8965a88a"

//PURPOSE: Forces the local use of any camera attached to the synchronised scene to play, even if the local
//         player ped has not been added to the scene. If this is not called the camera will only animate for
//         scenes with the player ped involved. This only affects the local player as this data is not synced
NATIVE PROC NETWORK_FORCE_LOCAL_USE_OF_SYNCED_SCENE_CAMERA(INT NetworkSceneID) = "0x139b73ed8532309a"

//PURPOSE: Flags that the script is in a section where remote players starting synced scenes involving the local player
//		   is appropriate. This is necessary to prevent hackers from starting synced scenes on players unexpectly as
//		   a grief strategy. Please call this command with TRUE at the start of the section of script where this is
//		   valid, and then again with FALSE when it is no longer appropriate
//
//		   THE TIGHTER TIME PERIOD WE CAN ALLOW THIS, THE LESS OPPORTUNITY HACKERS HAVE TO GRIEF OUR PLAYERS!
//
NATIVE PROC NETWORK_ALLOW_REMOTE_SYNCED_SCENE_LOCAL_PLAYER_REQUESTS(BOOL AllowRemoteRequest) = "0xb7a821850d99237b"

//PURPOSE: Returns the time in seconds that the code will wait for an unresponding player before disconnecting them. 
// 	   If -notimeouts is being used, this will return 0.
NATIVE FUNC INT NETWORK_GET_TIMEOUT_TIME() = "0x3d474216c4f0d38b"

//INFO: Returns TRUE if the local PLAYER ped can be left behind.
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL NETWORK_CAN_LEAVE_PED_BEHIND() = "0x6b76d2352809bd86"

//INFO: Removes all sticky bombs attached to the given entity by informing the remote players who own them to destroy them.
//PARAM NOTES: OwnerIndex: Will only remove projectiles that are owned by a specific ped.
//PURPOSE: 
NATIVE PROC REMOVE_ALL_STICKY_BOMBS_FROM_ENTITY(ENTITY_INDEX EntityIndex, PED_INDEX OwnerIndex = NULL) = "0x72432781eb27d057"

//INFO: Leave an AI ped behind in place of the player when they are being warped to a new location
//PARAM NOTES: keepPickups: if true then any portable pickups attached to the player are kept attached to him, otherwise they are detached 
//PURPOSE: 
NATIVE PROC NETWORK_LEAVE_PED_BEHIND_BEFORE_WARP(PLAYER_INDEX playerIndex, VECTOR VecNewCoors, BOOL killPed = false, BOOL keepPickups = false) = "0xd680ad74cb93547f"

//INFO: Leave an AI ped behind in place of the player when they are moving to an MP cutscene
//PARAM NOTES: keepPickups: if true then any portable pickups attached to the player are kept attached to him, otherwise they are detached 
//PURPOSE: 
NATIVE PROC NETWORK_LEAVE_PED_BEHIND_BEFORE_CUTSCENE(PLAYER_INDEX playerIndex, BOOL keepPickups = false) = "0xf0ff9641ad2902cc"

#IF IS_DEBUG_BUILD
//INFO: Get the focus Ped index.
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC PED_INDEX NETWORK_GET_FOCUS_PED_LOCAL_ID() = "0x90aa771702364404"
#ENDIF

//INFO: Returns the network bot player ID.
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC PLAYER_INDEX NETWORK_BOT_GET_PLAYER_ID(INT botIndex) = "0xba707d8fb514e561"

//INFO: Stops the Cutscene anim manager from enabling the collision of the entity
//PARAM NOTES:
// Has to be called on all machines
//PURPOSE: 
NATIVE PROC NETWORK_KEEP_ENTITY_COLLISION_DISABLED_AFTER_ANIM_SCENE(ENTITY_INDEX entityIndex, BOOL keepCollisionDisabled) = "0x4fe6b5a7ac60d232"

// Network Bot Commands

#IF IS_DEBUG_BUILD

//INFO: Returns the name of the network bot with index botIndex is local.
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC STRING NETWORK_BOT_GET_NAME(INT botIndex) = "0x905e83e8a9686ef1"

//INFO: Returns TRUE when the network bot with index botIndex is local.
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL NETWORK_BOT_IS_LOCAL(INT botIndex) = "0x6b990b3ba12b482d"

//INFO: Returns the number of active network bots.
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC INT NETWORK_BOT_GET_NUMBER_OF_ACTIVE_BOTS() = "0xf986d9c0130ec542"

//INFO: Returns the index of the network bot assigned with this script.
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC INT NETWORK_BOT_GET_SCRIPT_BOT_INDEX() = "0x945a1a16b5193398"

//INFO: Resurrect network bot with index botIndex.
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC NETWORK_BOT_RESURRECT(INT botIndex) = "0x82842b79d03cfbb9"

//INFO: Create a new network bot and add it to the match.  Returns the botindex created. 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC INT NETWORK_BOT_ADD() = "0x572e05c945757b02"

//INFO: Remove network bot with index botIndex from the match and delete it.
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL NETWORK_BOT_REMOVE(INT botIndex) = "0x2b9330064a48ffc8"

//INFO: Launch script with name scriptName and assign it to bot botIndex.
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL NETWORK_BOT_LAUNCH_SCRIPT(INT botIndex, STRING scriptName) = "0xad0e58ee08d3723f"

//INFO: Stop script being executed for bot with index botIndex.
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL NETWORK_BOT_STOP_SCRIPT(INT botIndex) = "0x913ad33ceeeab80d"

//INFO: Pause script being executed for bot with index botIndex.
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL NETWORK_BOT_PAUSE_SCRIPT(INT botIndex) = "0x902569b855cf47bf"

//INFO: Continue script being executed for bot with index botIndex.
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL NETWORK_BOT_CONTINUE_SCRIPT(INT botIndex) = "0xe441ae4311edc2ce"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the main player exists.
NATIVE FUNC BOOL NETWORK_BOT_EXISTS(PLAYER_INDEX plr) = "0x6bed444499b7ff02"

//INFO: Joins the given network bot with the script that calls this command
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC NETWORK_BOT_JOIN_THIS_SCRIPT(INT botIndex) = "0x2a89f505e47b59d1"

//INFO: Removes the given network bot from the script that calls this command
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC NETWORK_BOT_LEAVE_THIS_SCRIPT(INT botIndex) = "0x745b5d5e82c9167e"

//INFO: Joins the given network bot with the given script thread
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC NETWORK_BOT_JOIN_SCRIPT(THREADID thread, INT botIndex) = "0x87c72ac6511ef089"

//INFO: Removes the given network bot from the given script thread
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC NETWORK_BOT_LEAVE_SCRIPT(THREADID thread, INT botIndex) = "0x1e8e496c6d501d64"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the number of available network soak test parameters (these are specified as comma separated variables on the commandline via -netsoaktestparams=<arglist>
NATIVE FUNC INT NETWORK_SOAK_TEST_GET_NUM_PARAMETERS() = "0x7e22a2a7c4c0807c"

//INFO:
//PARAM NOTES: ParameterIndex - The index of the parameter in the comma separated list
//PURPOSE: Returns the soak test parameter at the specified index as an integer
NATIVE FUNC INT NETWORK_SOAK_TEST_GET_INT_PARAMETER(INT ParameterIndex) = "0x8baf50c199d6fe3d"


#ENDIF // IS_DEBUG_BUILD

/// PURPOSE:
///    Returns TRUE if participants were found near coordinates.
/// PARAMS:
///    retPlayerIds - Returns the global player index. Each bit represents one player. 
///                   Look for the bits that are set to know the player global player index.
///    retNumber - Returns the number of players that are near.
///    pos - center point for the search.
///    radius - radius for the search.
///    in3d - make search using Z coordinate as well.
NATIVE FUNC BOOL NETWORK_IS_ANY_PLAYER_NEAR(INT& retPlayerIds, INT& retNumber, VECTOR pos, FLOAT radius, BOOL in3d = true) = "0x1c6bc905758240d5"

/// PURPOSE:
///    Returns true if the clan service is a ready.
///    Make sure the service is available before operations.
NATIVE FUNC BOOL  NETWORK_CLAN_SERVICE_IS_VALID() = "0xf453de81bdfdae6f"

/// PURPOSE:
///    Returns true if the player primary clan is Active.
NATIVE FUNC BOOL NETWORK_CLAN_PLAYER_IS_ACTIVE(GAMER_HANDLE& gamerHandle) = "0x8c992447292d600f"

/// PURPOSE:
///    Retrieve information about the player clan description.
NATIVE FUNC BOOL NETWORK_CLAN_PLAYER_GET_DESC(NETWORK_CLAN_DESC& memberInfo, INT sizeOfData, GAMER_HANDLE& gamerHandle) = "0x4ffbf2c0d8249e45"


/// PURPOSE:
///    Determines if a given clan is a Rockstar clan or not
///    (Isn't actually stored in the data we get back)
/// NOTES:
///    Requires that it's set up from NETWORK_CLAN_PLAYER_GET_DESC previously
NATIVE FUNC BOOL NETWORK_CLAN_IS_ROCKSTAR_CLAN(NETWORK_CLAN_DESC& clanToCheck, INT sizeOfData) = "0x780a8bce22fa646b"

/// PURPOSE:
///    Returns a clantag formatted the way the UI expects for (some) functions
/// PARAMS:
///    clanToCheck - 
///    sizeOfData - 
///    outTag - 
NATIVE PROC NETWORK_CLAN_GET_UI_FORMATTED_TAG(NETWORK_CLAN_DESC& clanToCheck, INT sizeOfData, TEXT_LABEL_15& outTag) = "0xaf42af0c81b996d0"

/// convenience wrapper for NETWORK_CLAN_GET_UI_FORMATTED_TAG
PROC NETWORK_CLAN_GET_UI_FORMATTED_TAG_EZ(NETWORK_CLAN_DESC& clanToCheck, TEXT_LABEL_15& outTag)
	NETWORK_CLAN_GET_UI_FORMATTED_TAG(clanToCheck, SIZE_OF(clanToCheck), outTag)
ENDPROC

/// PURPOSE:
///    Returns true if the clan data has been synched at least once.
///    This does not mean the player has definitely a clan, just that the data is ready to be read
NATIVE FUNC BOOL NETWORK_CLAN_IS_MEMBERSHIP_SYNCHED(GAMER_HANDLE& gamerHandle) = "0xdb557cb3ab834f81"

/// PURPOSE:
///    Invite a player to my clan.
NATIVE FUNC BOOL NETWORK_CLAN_INVITE_PLAYER(PLAYER_INDEX PlayerIndex) = "0x9f1e190b4e6005f6"

/// PURPOSE:
///    Invite a friend to my clan.
NATIVE FUNC BOOL NETWORK_CLAN_INVITE_FRIEND(INT FriendIndex) = "0x9ed612c1402e8ff1"

/// PURPOSE:
///    Join a open clan.
NATIVE FUNC BOOL NETWORK_CLAN_JOIN(INT clanId) = "0x6c0f53dcb3246608"

/// PURPOSE:
///    Get the CREW memberships count for the local gamer. (Number of crews we have)
//	NOTE: Returns -1 if we're waiting for the server to respond with our count.
//		  It will assert if your don't have a valid Rockstar Id.
NATIVE FUNC INT NETWORK_CLAN_GET_LOCAL_MEMBERSHIPS_COUNT() = "0xbb7a0f7375123a7c"

/// PURPOSE:
///    Get the CREW memberships description for the local gamer.
NATIVE FUNC BOOL NETWORK_CLAN_GET_MEMBERSHIP_DESC(NETWORK_CLAN_DESC& memberInfo, INT membershipIndex) = "0xef45f91cee9ca825"


/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
///
/// THE FOLLOWING COMMANDS ARE USED TO DOWNLOAD CREW DESCRIPTION 
///    INFORMATION FOR A GAMER THAT ARE OFFLINE. OFFLINE MEANS ANY GAMER NOT IN YOUR 
///    SESSION OR OFFCOURSE NOT THE LOCAL GAMER
///
/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////

/// PURPOSE:
///    Download a Gamer Crew membership description.
NATIVE FUNC BOOL NETWORK_CLAN_DOWNLOAD_MEMBERSHIP(GAMER_HANDLE& gamerHandle) = "0xf30425262d5f8ff0"

/// PURPOSE:
///    Check if the call to Download a Gamer Crew membership description is still pending.
NATIVE FUNC BOOL NETWORK_CLAN_DOWNLOAD_MEMBERSHIP_PENDING(GAMER_HANDLE& gamerHandle) = "0x578851b712f5c31c"

/// PURPOSE:
///    Check if the call to Download a Gamer Crew membership description is still pending, for any player.
NATIVE FUNC BOOL NETWORK_CLAN_ANY_DOWNLOAD_MEMBERSHIP_PENDING() = "0xb32cd3b3788304e9"

/// PURPOSE:
//	   Code always remembers the last remote player's downloaded memberships retreived using NETWORK_CLAN_DOWNLOAD_MEMBERSHIP.
//	   Script can use this func to check if data is there, and avoid calling NETWORK_CLAN_DOWNLOAD_MEMBERSHIP if we don't need to force a refresh
NATIVE FUNC BOOL NETWORK_CLAN_REMOTE_MEMBERSHIPS_ARE_IN_CACHE(GAMER_HANDLE& gamerHandle) = "0x8ad3afcf48718c59"

/// PURPOSE:
///    Return the number of crews for the gamer.
NATIVE FUNC INT NETWORK_CLAN_GET_MEMBERSHIP_COUNT(GAMER_HANDLE& gamerHandle) = "0x4a765cb3bad82b21"

/// PURPOSE:
///    Returns TRUE if the membership at index is membershipIndex. Check for the Number. 0 for the Primary membership.
NATIVE FUNC BOOL NETWORK_CLAN_GET_MEMBERSHIP_VALID(GAMER_HANDLE& gamerHandle, INT membershipIndex) = "0x7bfa0b3f8046061d"

/// PURPOSE:
///    Get the membership description - you must call with NETWORK_CLAN_DOWNLOAD_MEMBERSHIP and NETWORK_CLAN_DOWNLOAD_MEMBERSHIP_PENDING.
NATIVE FUNC BOOL NETWORK_CLAN_GET_MEMBERSHIP(GAMER_HANDLE& gamerHandle, NETWORK_CLAN_DESC& memberInfo, INT membershipIndex) = "0xff87c3c6fb687efd"

/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////


/// PURPOSE:
///		Get the TXD/texture name of the giveh player's crew emblem.
//	PARAMS:
//		gamerHandle - of the gamer you want to get the emblem TXD name for
//		outTXDName - the TXD AND texture name of the emblem (they are the same)
//  RETURNS: 
//		True if the emblem txd name was successfully retrieved and packed into outTXDNAME
//	NOTE:
//		!!!!READ THIS!!!!
//		The crew emblem for a player can take time to download (a second or two), so if this returns false, but the player 
//		is in a valid crew, you may need to try again later.
//		The crew emblem for each player is requested automatically when the player enters the session
NATIVE FUNC BOOL NETWORK_CLAN_GET_EMBLEM_TXD_NAME(GAMER_HANDLE& gamerHandle, TEXT_LABEL_63& outTXDName) = "0xf9518f925a4a1894"

/// PURPOSE:
///		Requests a crew emblem for a clan. Call this only once and make sure that you release it when done (NETWORK_CLAN_RELEASE_EMBLEM)
//	PARAMS:
//		clanId - the id of the clan
NATIVE FUNC BOOL NETWORK_CLAN_REQUEST_EMBLEM(INT clanId) = "0x31060c3326fab3cb"

/// PURPOSE:
///		Returns true when a requested clan emblem (via NETWORK_CLAN_REQUEST_EMBLEM) is loaded
//	PARAMS:
//		clanId - the id of the clan
//		outTXDName - the TXD AND texture name of the emblem (they are the same)
NATIVE FUNC BOOL NETWORK_CLAN_IS_EMBLEM_READY(INT clanId, TEXT_LABEL_63& outTXDName) = "0xa2f783fae138e2f7"

/// PURPOSE:
///		Releases a crew emblem for a clan, so that it can be removed. Please make sure you remember to call this when finished with an emblem
//	PARAMS:
//		clanId - the id of the clan
NATIVE PROC		 NETWORK_CLAN_RELEASE_EMBLEM(INT clanId) = "0x57c0860a5387f6e1"

// PURPOSE:
//		Set the local player's crew rank title, that will be sync'd amongst players
// PARAMS:
//		crewRankTitle - the player's current crew rank title
NATIVE PROC NETWORK_CLAN_SET_LOCAL_CREWRANKTITLE_FOR_SYNC(STRING crewRankTitle) = "0x77baaf26bb88b415"

// PURPOSE:
//		Get the crew rank title for the given remote player
// PARAMS:
//		index - player index of player
//		outCrewRankTitle - crew rank title that the player is using
// RETURNS:
//		True if the player has a crew rank title set.
// NOTE:
//	This is set on each player by calling NETWORK_CLAN_SET_LOCAL_CREWRANKTITLE_FOR_SYNC
NATIVE FUNC BOOL NETWORK_CLAN_GET_CREWRANKTITLE_FOR_PLAYER(PLAYER_INDEX index, TEXT_LABEL_31& outCrewRankTitle) = "0xd05cfb9feee1d213"

// PURPOSE:
//    For the the local gamer's primary crew, check to see how many items the given "setName"
// RETURNS the number of items in the given set
//NATIVE FUNC INT NETWORK_CLAN_METADATA_GET_SETNAME_COUNT(STRING setName)

// PUROSE:
//     For the the local gamer's primary crew, get the metadata value at the given index for the given setName
// PARAMS:
//		setName: Name of set to index into
//		index: The index of the item in the set to access.  Use NETWORK_CLAN_METADATA_GET_SETNAME_COUNT to get the 
//				number of metadata items in that set.
//		outValue: the string version of the value at the given index.
// RETURN:
//		true if a value was assigned to 'outValue'
//NATIVE FUNC BOOL NETWORK_CLAN_METADATA_GET_VALUE_SETNAME_INDEX(STRING setName, INT index, TEXT_LABEL_63& outValue)

// PURPOSE:
//    Check to see if the local gamer's primary crew has the given item 'CrewAttributes' set.
// PARAMS:
//		attrName: Name of the attribute 
// RETURN:
//		Returns true if there is an item in the 'CrewAttributes' set of the given name.
//NATIVE FUNC BOOL NETWORK_CLAN_METADATA_HAS_CREWATTRIBUTE(STRING attrName)

// PURPOSE:
//    Get the crew title for the given rank
// NOTE: This function checks for the title for the EXACT rank, not the closest;
NATIVE FUNC BOOL NETWORK_CLAN_CREWINFO_GET_CREWRANKTITLE(INT rank, TEXT_LABEL_63& outValue) = "0x0b5da73f91f42f3a"

// PURPOSE:
//   Returns true if the metadata and crewinfo requests have been finished successfully
// NOTE:
//	Because teh metadata and the crew info for crews aren't always complete, just because 
//  this function returns true, it doesn't mean that the data you're asking for it there.  
//	It may not be included in the crew info.  Rely on the return values of the request functions
//	to be sure.
NATIVE FUNC BOOL NETWORK_CLAN_HAS_CREWINFO_METADATA_BEEN_RECEIVED() = "0x8847c687db7d17e2"

// PUROSE:
//    Get the value of the given STRING variable in the crew info object for the gamer's primary crew
// RETURN:
//  Returns true if there is an INT object in teh crew info of the given 'name'.  'outValue' will contain 
//  the value
NATIVE FUNC BOOL NETWORK_CLAN_CREWINFO_GET_INT_VALUE(STRING name, INT& outValue) = "0x5e98ea58473e238c"

// PURPOSE:
//    Get the value of the given STRING variable in the crew info object for the gamer's primary crew
// RETURN:
//  Returns true if there is a STRING object in thh crew info of the given 'name'.  'outValue' will contain 
//  the value
NATIVE FUNC BOOL NETWORK_CLAN_CREWINFO_GET_STRING_VALUE(STRING name, TEXT_LABEL_63& outValue) = "0x8c2bfdacd7ed9a3b"

STRUCT CREW_RECVD_INVITE_DATA
	NETWORK_CLAN_DESC clanDesc
	STRING	szGTag
	STRING	szMsg
ENDSTRUCT

// PURPOSE:
//	Get the data associated with the invite at the given index
NATIVE FUNC BOOL NETWORK_CLAN_GET_RECEIVED_INVITE_DATA(INT index, CREW_RECVD_INVITE_DATA& outData) = "0x425a4f92f6ecc951"

// PURPOSE:
//	Get the number of recv'd invites we have.
NATIVE FUNC INT NETWORK_CLAN_GET_RECEIVED_INVITES_COUNT() = "0x9995b3eddd4afc5b"



/// PURPOSE:
///    Resets player damage trackers used for the player ticker damage message.
NATIVE PROC NETWORK_RESET_PLAYER_DAMAGE_TICKER() = "0xbe3980d1bba7192d"

/// PURPOSE:
///    This command finds the largest bunch of either friendly or enemy players
/// PARAMS:
///    bFriendly - whether we should look for a friendly or enemy bunch
///    vPosition - the average position of the bunch
NATIVE FUNC BOOL NETWORK_FIND_LARGEST_BUNCH_OF_PLAYERS(BOOL bFriendly, VECTOR& vPosition) = "0x0535942f1f26d363"

/// PURPOSE:
///    This command initiates a search for spawn coordinates unsing the navmesh
/// PARAMS:
///    vSearchPos - the location where you wish to find a spawn coordinate
///    fSearchRadius - the range of the search
///    vFaceTowardsPos - the position which you wish the spawn coordinate to face towards
///    iFlags - optional flags
///      NOTE: one or both of RESPAWN_QUERY_FLAG_MAY_SPAWN_IN_INTERIOR and RESPAWN_QUERY_FLAG_MAY_SPAWN_IN_EXTERIOR should always be specified!
NATIVE FUNC BOOL NETWORK_START_RESPAWN_SEARCH(VECTOR vSearchPos, FLOAT fSearchRadius, VECTOR vFaceTowardsPos, RESPAWN_QUERY_FLAGS iFlags=RESPAWN_QUERY_FLAG_DEFAULT) = "0x40bbace1068c49a6"

/// PURPOSE:
///    This command initiates a search for spawn coordinates using the navmesh, using a spherical volume
/// PARAMS:
///    PlayerIndex - the index of the player to respawn
///    vSearchPos - the location where you wish to find a spawn coordinate
///    fSearchRadius - the range of the search
///    vFaceTowardsPos - the position which you wish the spawn coordinate to face towards
///    iFlags - optional flags
///      NOTE: one or both of RESPAWN_QUERY_FLAG_MAY_SPAWN_IN_INTERIOR and RESPAWN_QUERY_FLAG_MAY_SPAWN_IN_EXTERIOR should always be specified!
NATIVE FUNC BOOL NETWORK_START_RESPAWN_SEARCH_FOR_PLAYER(PLAYER_INDEX PlayerIndex, VECTOR vSearchPos, FLOAT fSearchRadius, VECTOR vFaceTowardsPos, RESPAWN_QUERY_FLAGS iFlags=RESPAWN_QUERY_FLAG_DEFAULT) = "0x93946e27b42aa58e"

/// PURPOSE:
///    This command initiates a search for spawn coordinates using the navmesh, using an angled area
/// PARAMS:
///    See 'NETWORK_START_RESPAWN_SEARCH_FOR_PLAYER' above

NATIVE FUNC BOOL NETWORK_START_RESPAWN_SEARCH_IN_ANGLED_AREA_FOR_PLAYER(PLAYER_INDEX PlayerIndex, VECTOR vAngledAreaPos1, VECTOR vAngledAreaPos2, FLOAT fAngledAreaWidth, VECTOR vFaceTowardsPos, RESPAWN_QUERY_FLAGS iFlags=RESPAWN_QUERY_FLAG_DEFAULT) = "0x20139897f77c3b3f"

/// PURPOSE:
///    This command initiates a search for spawn coordinates using the navmesh
/// PARAMS:
///    Team - the team of the ped to be spawned
///    vSearchPos - the location where you wish to find a spawn coordinate
///    fSearchRadius - the range of the search
///    vFaceTowardsPos - the position which you wish the spawn coordinate to face towards
///    iFlags - optional flags
///      NOTE: one or both of RESPAWN_QUERY_FLAG_MAY_SPAWN_IN_INTERIOR and RESPAWN_QUERY_FLAG_MAY_SPAWN_IN_EXTERIOR should always be specified!
NATIVE FUNC BOOL NETWORK_START_RESPAWN_SEARCH_FOR_TEAM(INT iTeam, VECTOR vSearchPos, FLOAT fSearchRadius, VECTOR vFaceTowardsPos, RESPAWN_QUERY_FLAGS iFlags=RESPAWN_QUERY_FLAG_DEFAULT) = "0xeb3d3fb61e0e8798"

/// PURPOSE:
///    This command queries progress & retrieves spawn coordinates
/// PARAMS:
///    Return value is one of the RESPAWN_QUERY_RESULTS enumerated type
///    vOutSpawnPos, fOutSpawnHeading - the results, only valid if RESPAWN_QUERY_RESULTS_SUCCEEDED was returned
///    fOutSpawnFlags - for future expansion, will be zero for now
NATIVE FUNC RESPAWN_QUERY_RESULTS NETWORK_QUERY_RESPAWN_RESULTS(INT & iNumResults) = "0xfcb1dfefd6237222"

/// PURPOSE:
///    This command retrieves a single spawn point, must be in the valid range as returned by the above command
/// PARAMS:
///    vOutSpawnPos, fOutSpawnHeading - the results, only valid if RESPAWN_QUERY_RESULTS_SUCCEEDED was returned
NATIVE PROC NETWORK_GET_RESPAWN_RESULT(INT iResultIndex, VECTOR & vOutSpawnPos, FLOAT & fOutSpawnHeading) = "0x95cfc066b227f10d"

/// PURPOSE:
///    This command retrieves associated flags for a single spawn point, must be in the valid range as returned by the above command
///    Flags will be a combination of values from the enumeration RESPAWN_RESULT_FLAGS
NATIVE FUNC INT NETWORK_GET_RESPAWN_RESULT_FLAGS(INT iResultIndex) = "0x821cedaf62c8b557"

/// PURPOSE:
///    Cancels any respawn search which is currently active
NATIVE PROC NETWORK_CANCEL_RESPAWN_SEARCH() = "0x8caea922d207d693"

/// PURPOSE:
///    Puts the local player in a solo tutorial session - they will remain connected to other players in the session,
///    but will be unable to interact with any of them. Any locally controlled ambient population will be removed when
//     this command is called, so ensure the player is placed where this will not be noticeable
NATIVE PROC NETWORK_START_SOLO_TUTORIAL_SESSION() = "0x5ddf0eb4876633fc"

/// PURPOSE:
///    Puts the local player in a gang tutorial session - they will remain connected to other players in the session,
///    but will be unable to interact with any players that have not called this command with the same iTeam value.
///    Any locally controlled ambient population will be removed when this command is called, so ensure the player
//     is placed where this will not be noticeable.
/// PARAMS:
///    iTeam - Multiple gangs may want to be in tutorial sessions at the same time, so the team ID is necessary to
///            distinguish between these sessions
///    iInstanceID - Script determined instance ID, allows a larger number of gang players to be split
///                  into multiple tutorial sessions
NATIVE PROC NETWORK_ALLOW_GANG_TO_JOIN_TUTORIAL_SESSION(INT iTeam, INT iInstanceID) = "0x2401ff328f02f86c"

/// PURPOSE:
///    Ends a tutorial session previously began via a call to either NETWORK_START_SOLO_TUTORIAL_SESSION() or NETWORK_ALLOW_GANG_TO_JOIN_TUTORIAL_SESSION()
///    The local player will be able to interact will all connected players again. Any locally controlled ambient population will be removed when
//     this command is called, so ensure the player is placed where this will not be noticeable
NATIVE PROC NETWORK_END_TUTORIAL_SESSION() = "0x68ca8f8b95ddea66"

/// PURPOSE:
///    Returns whether the local player is currently in a tutorial session began via a call to either
///    NETWORK_START_SOLO_TUTORIAL_SESSION() or NETWORK_ALLOW_GANG_TO_JOIN_TUTORIAL_SESSION()
NATIVE FUNC BOOL NETWORK_IS_IN_TUTORIAL_SESSION() = "0x0843570206f71f38"

/// PURPOSE:
///    Returns whether the local player is currently waiting for all remaining population to have been removed or a timer for this has timed out after tutorial transistion.
//	   Initially set true when NETWORK_START_SOLO_TUTORIAL_SESSION() or NETWORK_ALLOW_GANG_TO_JOIN_TUTORIAL_SESSION() or NETWORK_END_TUTORIAL_SESSION()
//     is called, and will only be set false some time after NETWORK_IS_TUTORIAL_SESSION_CHANGE_PENDING() has completed and returned false. 
//     The criteria for being false will be if a timer has timed out or the all the population flagged for clearing has been cleared, whichever happens first.
//     
NATIVE FUNC BOOL NETWORK_WAITING_POP_CLEAR_TUTORIAL_SESSION() = "0x055278a6247d56c0"

/// PURPOSE:
///    Returns whether the local player is currently pending a tutorial session change began via a call to either
///    NETWORK_START_SOLO_TUTORIAL_SESSION() or NETWORK_ALLOW_GANG_TO_JOIN_TUTORIAL_SESSION() or NETWORK_END_TUTORIAL_SESSION()
NATIVE FUNC BOOL NETWORK_IS_TUTORIAL_SESSION_CHANGE_PENDING() = "0xdd19976f3302fb36"

/// PURPOSE:
///    Returns the tutorial session instance for the specified player
NATIVE FUNC INT NETWORK_GET_PLAYER_TUTORIAL_SESSION_INSTANCE(PLAYER_INDEX PlayerIndex) = "0xc9aa2d3128922353"

/// PURPOSE:
///    Returns whether the specified two players are in the same tutorial session (or are both not in a tutorial session)
/// PARAMS:
///    FirstPlayerIndex  - Player index of first player to check
///    SecondPlayerIndex - Player index of second player to check
NATIVE FUNC BOOL NETWORK_ARE_PLAYERS_IN_SAME_TUTORIAL_SESSION(PLAYER_INDEX FirstPlayerIndex, PLAYER_INDEX SecondPlayerIndex) = "0xa9e699d3dc7c0b15"

// PURPOSE:
// Blocks the migration of network objects between players that are in different tutorial instances. This flag has to be unset when no longer needed.
NATIVE PROC NETWORK_BLOCK_PROXY_MIGRATION_BETWEEN_TUTORIAL_SESSIONS(BOOL block) = "0xfea7a352ddb34d52"

/// PURPOSE:
///    Sets the concealed status for the specific player. This can be used to hide a remote player that is in the
///    same tutorial session as the local player
/// PARAMS:
///    PlayerIndex - Player index of player to change conceal status for
///    Conceal     - Indicates whether the player should be concealed
NATIVE PROC NETWORK_CONCEAL_PLAYER(PLAYER_INDEX PlayerIndex, BOOL Conceal, BOOL allowDamagingWhileConcealed = FALSE) = "0xc6f4f426f21b03ea"

/// PURPOSE:
///    Returns the concealed status for the specified player.
/// PARAMS:
///    PlayerIndex - Player index of player to return conceal status for
NATIVE FUNC BOOL NETWORK_IS_PLAYER_CONCEALED(PLAYER_INDEX PlayerIndex) = "0x4fe8fd62895d0a5a"

/// PURPOSE:
///    Sets the concealed status for the specific entity. This can be used to hide a remote entity (ped, object, vehicle) that is in the
///    same tutorial session as the local player
/// PARAMS:
///    VehicleIndex - Ebtity index of player to change conceal status for
///    Conceal      - Indicates whether the entity should be concealed
NATIVE PROC NETWORK_CONCEAL_ENTITY(ENTITY_INDEX entityIndex, BOOL Conceal) = "0x8863e3cffcaed924"

/// PURPOSE:
///    Returns the concealed status for the specified entity.
/// PARAMS:
///    VehicleIndex - Vehicle index of player to return conceal status for
NATIVE FUNC BOOL NETWORK_IS_ENTITY_CONCEALED(ENTITY_INDEX entityIndex) = "0x8015438625493270"

/// PURPOSE:
///    Overrides the game clock time for the local player only. Other players will not be informed about the change in time
/// PARAMS:
///    Hour   - The time to set locally in hours
///    Minute - The time to set locally in minutes
///    Second - The time to set locally in seconds
NATIVE PROC NETWORK_OVERRIDE_CLOCK_TIME(INT Hour, INT Minute, INT Second) = "0x42ea11f7821d9466"

/// PURPOSE:
///    Overrides the game clock rate for the local player only. Other players will not be informed about the change in time
/// PARAMS:
///	   MsPerGameMinute - The amount of time in milliseconds it takes for a minute of game time
NATIVE PROC NETWORK_OVERRIDE_CLOCK_RATE(INT MsPerGameMinute) = "0x28357fa46a5896e7"

/// PURPOSE:
///    Stops overriding the local game clock time and returns to the synchronised time for the session
NATIVE PROC NETWORK_CLEAR_CLOCK_TIME_OVERRIDE() = "0x5f25f942f5f8ef3e"

/// PURPOSE:
///    Sync the local player override to other players. They will all override to the same time.
///    Must have overridden for this to do anything. 
NATIVE PROC NETWORK_SYNC_CLOCK_TIME_OVERRIDE() = "0x944ed54b66cfb2bf"

/// PURPOSE:
///    Returns whether the local game clock time has been overridden by script
NATIVE FUNC BOOL NETWORK_IS_CLOCK_TIME_OVERRIDDEN() = "0xf95eec86c216952d"

/// PURPOSE:
///    Sets the lock on whether the clock override may be set or removed
NATIVE PROC NETWORK_SET_CLOCK_OVERRIDE_LOCKED(BOOL bLocked) = "0x0929cb201fbea500"

/// PURPOSE:
///    Get the current global session time (without any local overrides).
///    This will only work if the clock is currently overridden
///    Returns 
NATIVE FUNC BOOL NETWORK_GET_GLOBAL_CLOCK(INT& nHour, INT& nMinute, INT& nSecond) = "0x9080789dc6e47038"

/// PURPOSE:
///    Adds an entity area with the specified start and end points
///	   The return value is a script ID that can be used to refer to the same entity area again
NATIVE FUNC INT NETWORK_ADD_ENTITY_AREA(VECTOR VecStart, VECTOR VecEnd) = "0xd3077b6d45cd100e"

/// PURPOSE:
///    Adds an entity angled area with the specified start and end points
///	   The return value is a script ID that can be used to refer to the same entity area again
NATIVE FUNC INT NETWORK_ADD_ENTITY_ANGLED_AREA(VECTOR VecStart, VECTOR VecEnd, FLOAT fAreaWidth) = "0xc2e24b2aedcc8a1a"

/// PURPOSE:
///    Adds an entity area with the specified start and end points that will be cleaned up when the player that created it leaves the session
///	   The return value is a script ID that can be used to refer to the same entity area again
NATIVE FUNC INT NETWORK_ADD_CLIENT_ENTITY_AREA(VECTOR VecStart, VECTOR VecEnd) = "0x198d8d2abc1b1c9b"

/// PURPOSE:
///    Adds an entity angled area with the specified start and end points that will be cleaned up when the player that created it leaves the session
///	   The return value is a script ID that can be used to refer to the same entity area again
NATIVE FUNC INT NETWORK_ADD_CLIENT_ENTITY_ANGLED_AREA(VECTOR VecStart, VECTOR VecEnd, FLOAT fAreaWidth) = "0x47ddb3f2bd4cb6fa"

/// PURPOSE:
///    Removes the specified entity area. This is not required on script termination - these
///	   will be cleaned up in code. 
///    The areaID is the ID returned by NETWORK_ADD_ENTITY_AREA
///	   Returns whether this areaID was found or not
NATIVE FUNC BOOL NETWORK_REMOVE_ENTITY_AREA(INT areaID) = "0x6e248b3e8cd8823c"

/// PURPOSE:
///    Checks if areaID is valid and points to an existing entityArea
///    The areaID is the ID returned by NETWORK_ADD_ENTITY_AREA 
NATIVE FUNC BOOL NETWORK_ENTITY_AREA_DOES_EXIST(INT areaID) = "0xd0c6888814987992"

/// PURPOSE:
///    Checks if all players have replied to say whether this area is occupied or not
///    The areaID is the ID returned by NETWORK_ADD_ENTITY_AREA 
NATIVE FUNC BOOL NETWORK_ENTITY_AREA_HAVE_ALL_REPLIED(INT areaID) = "0x1c2607b54ddc8b70"

/// PURPOSE:
///    Checks if a particular players have replied to say whether this area is occupied or not
///    The areaID is the ID returned by NETWORK_ADD_ENTITY_AREA 
NATIVE FUNC BOOL NETWORK_ENTITY_AREA_HAS_PLAYER_REPLIED(INT areaID, PLAYER_INDEX playerIndex) = "0x876bb218c32cb935"

/// PURPOSE:
///    Checks if this area is occupied on any machine
///    The areaID is the ID returned by NETWORK_ADD_ENTITY_AREA 
NATIVE FUNC BOOL NETWORK_ENTITY_AREA_IS_OCCUPIED(INT areaID) = "0x39d52f5cdfc288e7"

/// PURPOSE:
///    Checks if this area is occupied on a particular machine
///    The areaID is the ID returned by NETWORK_ADD_ENTITY_AREA 
NATIVE FUNC BOOL NETWORK_ENTITY_AREA_IS_OCCUPIED_ON(INT areaID, PLAYER_INDEX playerIndex) = "0xc506fb9c49d2fc35"

/// PURPOSE:
///    Sets whether to use high precision network blending for the specified network ID. Currently this can only be
///    called on objects (not vehicles and peds). High precision blending is useful for small objects that need to be kept
///    very tightly in sync for gameplay purposes (e.g. a golf ball in a golf mini-game)
/// PARAMS:
///    NetworkId        - Network ID of the object to change the blending mode
///    UseHighPrecision - Flag indicating whether to use high precision or standard network blending
NATIVE PROC NETWORK_USE_HIGH_PRECISION_BLENDING(NETWORK_INDEX NetworkId, BOOL UseHighPrecision) = "0x4b3731cb7c1cf225"

/// PURPOSE:
///    Sets custom parameters for ball smoothing in arena.
/// PARAMS:
///    NetworkId        - Network ID of the object
NATIVE PROC NETWORK_SET_CUSTOM_ARENA_BALL_PARAMS(NETWORK_INDEX NetworkId) = "0x74c6fdcb43b8233e"

/// PURPOSE:
///    Sets whether to use high precision rotation network for the specified network ID. Currently this can only be
///    called on objects (not vehicles and peds).
/// PARAMS:
///    NetworkId        - Network ID of the object
///    UseHighPrecision - Flag indicating whether to use high precision or not
NATIVE PROC NETWORK_ENTITY_USE_HIGH_PRECISION_ROTATION(NETWORK_INDEX NetworkId, BOOL UseHighPrecision) = "0x68b190dbcb3bf614"

/// PURPOSE:
///    Caches the current players head blend data (call when the player is not wearing a mask, etc)
NATIVE PROC NETWORK_CACHE_LOCAL_PLAYER_HEAD_BLEND_DATA() = "0x379ab1a8b2d2cf41"

/// PURPOSE:
///    Returns true if there is cached head blend data for the given player
NATIVE FUNC BOOL NETWORK_HAS_CACHED_PLAYER_HEAD_BLEND_DATA(PLAYER_INDEX playerIndex) = "0xa19048b0a5b800b2"

/// PURPOSE:
///    Apply the given player's cached head blend data to the given ped
//  RETURNS:
//     False if the data could not be applied (eg if the ped's model is not streamed in)
NATIVE FUNC BOOL NETWORK_APPLY_CACHED_PLAYER_HEAD_BLEND_DATA(PED_INDEX pedIndex, PLAYER_INDEX playerIndex) = "0xc3aa694bb8b65a30"

/// BACKGROUND SCRIPT FUNCTIONS
//   

/// PURPOSE:
///    Requests the background scripts
NATIVE FUNC BOOL NETWORK_REQUEST_CLOUD_BACKGROUND_SCRIPTS() = "0x2d1a01516592199a"
NATIVE FUNC INT NETWORK_GET_CLOUD_BACKGROUND_SCRIPT_MODIFIED_TIME() = "0x4f301abf8d9fd7c4"
NATIVE FUNC BOOL NETWORK_IS_CLOUD_BACKGROUND_SCRIPT_REQUEST_PENDING() = "0x049d6c87562c80cd"

/// TUNABLE FUNCTIONS
//   

/// PURPOSE:
///    Requests the cloud tunables file. 
NATIVE PROC NETWORK_REQUEST_CLOUD_TUNABLES() = "0x24da28ab3b6ab1da"
NATIVE FUNC BOOL NETWORK_IS_TUNABLE_CLOUD_REQUEST_PENDING() = "0x7072a36933a02b3f"
NATIVE FUNC INT NETWORK_GET_TUNABLE_CLOUD_CRC() = "0x2844e705662ae9e3"

/// PURPOSE:
///    Checks if the tunable (szTunableName) in context (szContext) exists   
NATIVE FUNC BOOL NETWORK_DOES_TUNABLE_EXIST(STRING szContext, STRING szTunableName) = "0xbd821152194e690f"
NATIVE FUNC BOOL NETWORK_DOES_TUNABLE_EXIST_HASH(INT nContextHash, INT nTunableHash) = "0x9141a9af147a1ef7"

/// PURPOSE:
///    Retrieves the tunable (szTunableName) in context (szContext) 
///    For FLOAT and INT, the value will be stored in the nTunable / fTunable variables. The return value 
///    indicates whether the variable exists. We cannot pass bools by references so the bool value is just
///    returned. Use NETWORK_DOES_TUNABLE_EXIST if you want to check if a BOOL tunable exists. 
///
NATIVE FUNC BOOL NETWORK_ACCESS_TUNABLE_INT(STRING szContext, STRING szTunableName, INT& nTunable) = "0xee6ab2ca90b5b970"
NATIVE FUNC BOOL NETWORK_ACCESS_TUNABLE_FLOAT(STRING szContext, STRING szTunableName, FLOAT& fTunable) = "0xd12fb7896e13d186"
NATIVE FUNC BOOL NETWORK_ACCESS_TUNABLE_BOOL(STRING szContext, STRING szTunableName) = "0xea13158bcb052874"

NATIVE FUNC INT NETWORK_TRY_ACCESS_TUNABLE_INT(STRING szContext, STRING szTunableName, INT nDefault) = "0xd838202c3e540741"
NATIVE FUNC FLOAT NETWORK_TRY_ACCESS_TUNABLE_FLOAT(STRING szContext, STRING szTunableName, FLOAT fDefault) = "0x2c9f1e6d5e7c052f"
NATIVE FUNC BOOL NETWORK_TRY_ACCESS_TUNABLE_BOOL(STRING szContext, STRING szTunableName, BOOL bDefault) = "0x39916fb617c155c0"

NATIVE FUNC BOOL NETWORK_ACCESS_TUNABLE_MODIFICATION_DETECTION_CLEAR() = "0xe195a10a5d4be5a1"

NATIVE FUNC BOOL NETWORK_ACCESS_TUNABLE_INT_HASH(INT nContextHash, INT nTunableHash, INT& nTunable) = "0x79b0a08580eba74c"
NATIVE FUNC BOOL NETWORK_ACCESS_TUNABLE_INT_MODIFICATION_DETECTION_REGISTRATION_HASH(INT nContextHash, INT nTunableHash, INT& nTunable) = "0xc5d08122ec634870"

NATIVE FUNC BOOL NETWORK_ACCESS_TUNABLE_FLOAT_HASH(INT nContextHash, INT nTunableHash, FLOAT& fTunable) = "0xa0d79393a2e01ed3"
NATIVE FUNC BOOL NETWORK_ACCESS_TUNABLE_FLOAT_MODIFICATION_DETECTION_REGISTRATION_HASH(INT nContextHash, INT nTunableHash, FLOAT& nTunable) = "0x0d334de6bb80ccea"

NATIVE FUNC BOOL NETWORK_ACCESS_TUNABLE_BOOL_HASH(INT nContextHash, INT nTunableHash) = "0x836cfc11d9e48985"
NATIVE FUNC BOOL NETWORK_ACCESS_TUNABLE_BOOL_MODIFICATION_DETECTION_REGISTRATION_HASH(INT nContextHash, INT nTunableHash, BOOL& nTunable) = "0x3a4da2bf180493ee"

NATIVE FUNC INT NETWORK_TRY_ACCESS_TUNABLE_INT_HASH(INT nContextHash, INT nTunableHash, INT nDefault) = "0xcfba9e73530de0f7"
NATIVE FUNC FLOAT NETWORK_TRY_ACCESS_TUNABLE_FLOAT_HASH(INT nContextHash, INT nTunableHash, FLOAT fDefault) = "0x849fb3f6376b2be8"
NATIVE FUNC BOOL NETWORK_TRY_ACCESS_TUNABLE_BOOL_HASH(INT nContextHash, INT nTunableHash, BOOL bDefault) = "0xbb4d0f1297c41e2f"

/// PURPOSE:
///    Inserts the tunable (szTunableName) inti context (szContext)   
NATIVE FUNC BOOL NETWORK_INSERT_TUNABLE_INT(STRING szContext, STRING szTunableName, INT nTunable) = "0x9031eef364d8b864"
NATIVE FUNC BOOL NETWORK_INSERT_TUNABLE_FLOAT(STRING szContext, STRING szTunableName, FLOAT fTunable) = "0x9da0510ca44c1ce7"
NATIVE FUNC BOOL NETWORK_INSERT_TUNABLE_BOOL(STRING szContext, STRING szTunableName, BOOL bTunable) = "0x9495de94d72445f7"

NATIVE FUNC BOOL NETWORK_INSERT_TUNABLE_INT_HASH(STRING szContext, STRING szTunableName, INT nTunable) = "0xefbdd2e953945183"
NATIVE FUNC BOOL NETWORK_INSERT_TUNABLE_FLOAT_HASH(STRING szContext, STRING szTunableName, FLOAT fTunable) = "0x68f0bc3a808c181e"
NATIVE FUNC BOOL NETWORK_INSERT_TUNABLE_BOOL_HASH(STRING szContext, STRING szTunableName, BOOL bTunable) = "0x30e793930ca600e3"

/// PURPOSE:
///    Returns modifier list ID that this content is part of.
///    Returns -1 if not in a modifier list.
NATIVE FUNC INT NETWORK_GET_CONTENT_MODIFIER_LIST_ID(INT nContentHash) = "0x28f06ebd3cac9b0a"

#IF IS_DEBUG_BUILD

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the network object ID of the specified player
NATIVE FUNC INT NETWORK_GET_PLAYER_CODE_DEBUG_ID(PLAYER_INDEX Plr) = "0x5e95fe793d22ed20"

#ENDIF // IS_DEBUG_BUILD

/// PURPOSE:
///    Returns true if a certain body part of the local Player has been damaged.
NATIVE FUNC BOOL NETWORK_HAS_BONE_BEEN_HIT(INT bone) = "0x0c4aef0f28b2a78e"

/// PURPOSE:
///    Returns true if a certain body part of the local Player has been damaged by the player that made that was awarded the fatal blow.
NATIVE FUNC BOOL NETWORK_HAS_BONE_BEEN_HIT_BY_KILLER(INT bone) = "0x45094204ed611a06"

/// PURPOSE:
///    Returns the bone that is the fatal hit. Returns -1 if there is no bone.
NATIVE FUNC INT NETWORK_GET_BONE_ID_OF_FATAL_HIT() = "0xac57be480ee4bf62"

/// PURPOSE:
///    Clear all body parts damaged.
NATIVE PROC NETWORK_RESET_BODY_TRACKER() = "0x56f781bb73fb147f"

/// PURPOSE:
///    Returns the total number of body parts hit in the player;
NATIVE FUNC INT NETWORK_GET_NUMBER_BODY_TRACKER_HITS() = "0x4b64b165b5c876a4"

/// PURPOSE:
///    Set if a entity is needed or not;
NATIVE PROC NETWORK_SET_NO_LONGER_NEEDED(ENTITY_INDEX EntityIndex, BOOL assert) = "0x5beaad56e722f32e"

/// PURPOSE:
///    Returns TRUE is the entity has been marked to assert if removed;
NATIVE FUNC BOOL NETWORK_GET_NO_LONGER_NEEDED(ENTITY_INDEX EntityIndex) = "0x97cbdf816bf9f4a4"

/// PURPOSE:
///    Returns TRUE is the entity has been marked to assert if removed;
NATIVE FUNC BOOL NETWORK_EXPLODE_VEHICLE(VEHICLE_INDEX VehicleIndex, BOOL AddExplosion = TRUE, BOOL KeepDamageEntity = FALSE, INT culprit = -1) = "0x04375aabe1be38ae"

/// PURPOSE:
///    Makes a helicopter explode. This doesn't trigger the crash task on abandoned helis it just blows them up
NATIVE PROC NETWORK_EXPLODE_HELI(VEHICLE_INDEX VehicleIndex, BOOL AddExplosion=TRUE, BOOL KeepDamageEntity=FALSE, NETWORK_INDEX NetworkId = NULL) = "0x5d0fecef9219b83c"

//INFO: Only works in DEV / XENON builds
//PURPOSE: Returns the XUID of the passed in gamertag as a string 
NATIVE FUNC STRING NETWORK_GET_XUID_FROM_GAMERTAG(STRING szGamertag) = "0x6377cd9a3d9e25af"

//INFO: 
//PARAM NOTES:
//PURPOSE: Flags the specified network entity to use logarithmic network blending for this frame only, this blending mode
//         prevents overshooting the target and can make things look smoother if the target object is not
//         behaving physically (i.e. being positioned by script each frame) at the expense of lagging behind.
//         *IMPORTANT* - This needs to be called every frame this behaviour is desired
NATIVE PROC NETWORK_USE_LOGARITHMIC_BLENDING_THIS_FRAME(ENTITY_INDEX EntityIndex) = "0x624ff48c5cd7ce25"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a ped to a specified heading and position and will set override blend for a period
//         This function is recommended for use when updating a clone every frame to a tightly controlled position such as 
//			required for hands clasped with close in camera in arm-wrestling
NATIVE PROC NETWORK_OVERRIDE_COORDS_AND_HEADING(ENTITY_INDEX EntityIndex, VECTOR VecNewCoors, FLOAT NewHeading ) = "0xbf129fbfc0575920"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set a cloned network object to ignore blend updates for the specified time in miliseconds
//			e.g. for the cloned golf ball prevent any movement until a stroke anim is in the correct position of its phase
//			by setting the timeToOverrideBlender to a positive value and then set to 0 when ready to allow movement 
NATIVE PROC NETWORK_OVERRIDE_BLENDER_FOR_TIME(NETWORK_INDEX NetworkId, INT timeToOverrideBlender) = "0x45eac26960636ade"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set a cloned network vehicle to perform extra validation checks when blending it's orientation based on network
//		   updates. This is useful for network modes where players are expected to crash into each other a lot (not races,
//		   rather specific modes that encourage crashing) to reduce physics popping issues
//		   ***** IMPORTANT NOTE - THIS IS AN EXPENSIVE FUNCTION - ONLY USE WHEN NECESSARY AND TURN OFF WHEN NOT REQUIRED ***************
NATIVE PROC NETWORK_ENABLE_EXTRA_VEHICLE_ORIENTATION_BLEND_CHECKS(NETWORK_INDEX NetworkId, BOOL EnableExtraChecks) = "0xb226a538eb9367e1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prevents the entity dynamically migrating to nearby players, it can still migrate by other means. You need to call this every frame 
//		   while you need it disabled
NATIVE PROC NETWORK_DISABLE_PROXIMITY_MIGRATION(NETWORK_INDEX NetworkId) = "0x74ca2009185992ec"

//PURPOSE: Sets the garage index for the specified vehicle - this vehicle will only be created on players
//         that are viewing/inside the specified garage
NATIVE PROC NETWORK_SET_VEHICLE_GARAGE_INDEX(VEHICLE_INDEX vehID, INT GarageIndex) = "0x458c49b0799610b4"

//PURPOSE: Clears the garage index for the specified vehicle - this vehicle will only be created on players
//         that are viewing/inside the specified garage
NATIVE PROC NETWORK_CLEAR_VEHICLE_GARAGE_INDEX(VEHICLE_INDEX vehID) = "0xa7b51ba39ecd82dc"

//PURPOSE: Sets the garage index for the local player - any vehicles associated with the specified
//         garage index will then be created on the local players machine
NATIVE PROC NETWORK_SET_PLAYER_GARAGE_INDEX(INT GarageIndex) = "0x782c4258a29094d2"

//PURPOSE: Clears the garage index for the local player - any vehicles associated with the specified
//         garage index will then be created on the local players machine
NATIVE PROC NETWORK_CLEAR_PLAYER_GARAGE_INDEX() = "0x7e867180cb9f5244"

//PURPOSE: Sets the player property ID. 
NATIVE PROC NETWORK_SET_PROPERTY_ID(INT nPropertyID) = "0x71e6b83029935f72"
NATIVE PROC NETWORK_CLEAR_PROPERTY_ID() = "0x41d7a90359f93d19"

NATIVE PROC NETWORK_SET_PLAYER_MENTAL_STATE(INT nMentalState) = "0xd9dc868e619ea7fd"

//PURPOSE: Sets the minimum player rank for the mission. Players with a lower rank than this will be discouraged from joining 
NATIVE PROC NETWORK_SET_MINIMUM_RANK_FOR_MISSION(INT nMinimumRank) = "0x2ce8f2b0d96fcfb8"

/// CLOUD FUNCTIONS
//   

//PURPOSE: Requests a cloud file (szFilename) from the member namespace using the gamer handle supplied.
//		   This returns an INT that can be used to track this request.
NATIVE FUNC INT CLOUD_REQUEST_MEMBER_FILE(STRING szFilename, GAMER_HANDLE &hGamer, BOOL bCache) = "0xfe9a21fa5ed32531"

//PURPOSE: Deletes a cloud file (szFilename) from the member namespace. 
//		   This returns an INT that can be used to track this request.
NATIVE FUNC INT CLOUD_DELETE_MEMBER_FILE(STRING szFilename) = "0x79d2907ece3668af"

//PURPOSE: Deletes a cloud file (szFilename) from the crew namespace using the clan ID supplied. 
//		   This returns an INT that can be used to track this request.
NATIVE FUNC INT CLOUD_REQUEST_CREW_FILE(STRING szFilename, INT nClanID, BOOL bCache) = "0xefcf77aaa4a66bc7"

//PURPOSE: Deletes a cloud file (szFilename) from the title namespace using the clan ID supplied. 
//		   This returns an INT that can be used to track this request.
NATIVE FUNC INT CLOUD_REQUEST_TITLE_FILE(STRING szFilename, BOOL bCache) = "0x0360925bde1623ef"

//PURPOSE: Deletes a cloud file (szFilename) from the global namespace using the clan ID supplied. 
//		   This returns an INT that can be used to track this request.
NATIVE FUNC INT CLOUD_REQUEST_GLOBAL_FILE(STRING szFilename, BOOL bCache) = "0x455b6fea4b18c348"

//PURPOSE: Checks if a cloud request has completed
NATIVE FUNC BOOL CLOUD_HAS_REQUEST_COMPLETED(INT nRequestID) = "0x4e72a404734f96dd"

//PURPOSE: Checks if a cloud request was successful (only valid for one frame)
NATIVE FUNC BOOL CLOUD_DID_REQUEST_SUCCEED(INT nRequestID) = "0xd3d7e67cb9d9ee46"

//PURPOSE: Gets a cloud request result code (only valid for one frame)
NATIVE FUNC INT CLOUD_GET_REQUEST_RESULT_CODE(INT nRequestID) = "0xa1d6a9d07c2c5f24"

//PURPOSE: Use this to check if cloud is up
//         This just requests a small cloud file but is behind a function so that 
//         we can swap out the functionality for something better if needed
//
//         CLOUD_GET_AVAILABILITY_CHECK_POSIX is the POSIX of when the check was last
//         run. Will be 0 if never called. 
//
NATIVE PROC CLOUD_CHECK_AVAILABILITY() = "0x45a55f26e1745337"
NATIVE FUNC BOOL CLOUD_IS_CHECKING_AVAILABILITY() = "0x7e1eecf1c1475c69"
NATIVE FUNC INT CLOUD_GET_AVAILABILITY_CHECK_POSIX() = "0x677b552bdd78e372"
NATIVE FUNC BOOL CLOUD_GET_AVAILABILITY_CHECK_RESULT() = "0x99169228e980267d"

//PURPOSE: Returns the type of UGC to load.
NATIVE FUNC UGC_TYPE GET_CONTENT_TO_LOAD_TYPE() = "0x596ca3c113ec82ce"

//PURPOSE: Checks for system service parameters
NATIVE FUNC BOOL GET_IS_LAUNCH_FROM_LIVE_AREA() = "0xced879009d9e18c3"
NATIVE FUNC BOOL GET_IS_LIVE_AREA_LAUNCH_WITH_CONTENT() = "0x77f0949bf4301609"
NATIVE FUNC BOOL GET_HAS_LAUNCH_PARAM(STRING szParamName) = "0x8d43b5912f8aec40"
NATIVE FUNC STRING GET_LAUNCH_PARAM_VALUE(STRING szParamName) = "0x2f2d2dc351da1421"
NATIVE PROC CLEAR_SERVICE_EVENT_ARGUMENTS() = "0xbb74f8878bf41a7b"

//PURPOSE: These use the CREATE accessors
// 
NATIVE FUNC BOOL UGC_COPY_CONTENT(STRING szContentID, STRING szContentType) = "0x35c3cba87df81d03"

//PURPOSE: Query results of CREATE function
// 
NATIVE FUNC BOOL UGC_IS_CREATING() = "0xdc819ef22f7e17f3"
NATIVE FUNC BOOL UGC_HAS_CREATE_FINISHED() = "0x177da740cdc1ebc4"
NATIVE FUNC BOOL UGC_DID_CREATE_SUCCEED() = "0x090d542bb6126759"
NATIVE FUNC UGC_ERROR UGC_GET_CREATE_RESULT() = "0x69ecdf325db9c589"
NATIVE FUNC STRING UGC_GET_CREATE_CONTENT_ID() = "0x46181aa928699fe3"

//PURPOSE: Clear out the last results from a CREATE
// 
NATIVE PROC UGC_CLEAR_CREATE_RESULT() = "0x3a4b6d510ad495d8"

//PURPOSE: Gets UGC - this allows script to bypass code and make queries directly
//PARAMS:
//    szQueryName - Name of query (this would come from SC)
//    szQueryParams - Query parameters (per query parameters, would come from SC)
//
NATIVE FUNC BOOL UGC_QUERY_CONTENT(STRING szQueryName, STRING szQueryParams, INT nOffset, INT nMaxCount, STRING szContentType) = "0x093a809749bc908b"

ENUM UGC_BOOL_OPTION
	OPTION_NOT_SPECIFIED,
	OPTION_TRUE,
	OPTION_FALSE
ENDENUM

ENUM UGC_SORT_TYPE
	SORT_NOT_SPECIFIED = -1,
	SORT_CREATED_DATE
ENDENUM

//PURPOSE: Gets UGC via pre-defined queries
//PARAMS:
//    nOffset - Where to start reading content from (i.e. 10 will start reading from content item 10)
//    nType - Type of UGC we want of type UGC_TYPE via GET_UGC_TYPE_STRING         
//
NATIVE FUNC BOOL UGC_QUERY_BOOKMARKED_CONTENT(INT nOffset, INT nMaxCount, STRING szContentType) = "0x69f0c72492f326fc"
NATIVE FUNC BOOL UGC_QUERY_MY_CONTENT(INT nOffset, INT nMaxCount, STRING szContentType, UGC_BOOL_OPTION nPublishedOption, INT nMissionType, UGC_BOOL_OPTION nOpenOption) = "0x2c18a42f18346fa0"
NATIVE FUNC BOOL UGC_QUERY_FRIEND_CONTENT(INT nOffset, INT nMaxCount, STRING szContentType) = "0x79669804efba998b"
NATIVE FUNC BOOL UGC_QUERY_CREW_CONTENT(INT nClanID, INT nOffset, INT nMaxCount, STRING szContentType) = "0x1781904d723e55cf"
NATIVE FUNC BOOL UGC_QUERY_BY_CATEGORY(UGC_CATEGORY nCategory, INT nOffset, INT nMaxCount, STRING szContentType, UGC_SORT_TYPE nSortType = SORT_NOT_SPECIFIED, BOOL bDescending = FALSE) = "0x1f36263db64b7bfb"
NATIVE FUNC BOOL UGC_QUERY_BY_CONTENT_ID(STRING szContentID, BOOL bLatest, STRING szContentType) = "0x1e7c0d06935a3584"
NATIVE FUNC BOOL UGC_QUERY_BY_CONTENT_IDS(UGC_CONTENT_ID_QUERY& aQueryIDs, INT numIDs, BOOL bLatest, STRING szContentType) = "0xc4b1b0cbd90fe418"
NATIVE FUNC BOOL UGC_QUERY_MOST_RECENTLY_CREATED_CONTENT(INT nOffset, INT nMaxCount, STRING szContentType, UGC_BOOL_OPTION nOpenOption) = "0x3eaf63f4bf02fd1c"
NATIVE FUNC BOOL UGC_QUERY_MOST_RECENTLY_PLAYED_CONTENT(INT nOffset, INT nMaxCount, STRING szContentType) = "0x01851a2e22eded85"
NATIVE FUNC BOOL UGC_QUERY_TOP_RATED_CONTENT(INT nOffset, INT nMaxCount, STRING szContentType) = "0x60159e4c53b211ca"

//DEPRECATED
//PURPOSE: Gets UGC via pre-defined queries
//PARAMS:
//    nOffset - Where to start reading content from (i.e. 10 will start reading from content item 10)
//    nType - Type of UGC we want of type UGC_TYPE via GET_UGC_TYPE_STRING         
//
NATIVE FUNC BOOL UGC_GET_BOOKMARKED_CONTENT(INT nOffset, INT nMaxCount, STRING szContentType, INT& descriptionsId) = "0xc7882fe99e70b1c8"
NATIVE FUNC BOOL UGC_GET_MY_CONTENT(INT nOffset, INT nMaxCount, STRING szContentType, INT& descriptionsId) = "0xfb43158d2429d92e"
NATIVE FUNC BOOL UGC_GET_MY_CONTENT_PUBLISHED(INT nOffset, INT nMaxCount, STRING szContentType, INT& descriptionsId) = "0x9051d22ddb894920"
NATIVE FUNC BOOL UGC_GET_MY_CONTENT_UNPUBLISHED(INT nOffset, INT nMaxCount, STRING szContentType, INT& descriptionsId) = "0xdb84ba7a86b7d50b"
NATIVE FUNC BOOL UGC_GET_FRIEND_CONTENT(INT nOffset, INT nMaxCount, STRING szContentType, INT& descriptionsId) = "0xaf6af7e3ecf80083"
NATIVE FUNC BOOL UGC_GET_CREW_CONTENT(INT nClanID, INT nOffset, INT nMaxCount, STRING szContentType, INT& descriptionsId) = "0xf9d794f30c50a9f1"
NATIVE FUNC BOOL UGC_GET_GET_BY_CATEGORY(UGC_CATEGORY nCategory, INT nOffset, INT nMaxCount, STRING szContentType, INT& descriptionsId) = "0xb0a734543397e52f"
NATIVE FUNC BOOL UGC_GET_GET_BY_CONTENT_ID(STRING szContentID, STRING szContentType) = "0x11daab9c154637e3"
NATIVE FUNC BOOL UGC_GET_GET_BY_CONTENT_IDS(UGC_CONTENT_ID_QUERY& aQueryIDs, INT numIDs, STRING szContentType) = "0xf34e2911670c2363"
NATIVE FUNC BOOL UGC_GET_MOST_RECENTLY_CREATED_CONTENT(INT nOffset, INT nMaxCount, STRING szContentType, INT& descriptionsId) = "0xd8d80f4e817ecbb3"
NATIVE FUNC BOOL UGC_GET_MOST_RECENTLY_PLAYED_CONTENT(INT nOffset, INT nMaxCount, STRING szContentType, INT& descriptionsId) = "0x969db4f2fd753474"
NATIVE FUNC BOOL UGC_GET_TOP_RATED_CONTENT(INT nOffset, INT nMaxCount, STRING szContentType, INT& descriptionsId) = "0x8b555ddac77146dd"

//PURPOSE: Cancel an active query
// 
NATIVE PROC UGC_CANCEL_QUERY() = "0x604b7d5bd0ab3773"

//PURPOSE: Query results of GET functions
// 
NATIVE FUNC BOOL UGC_IS_GETTING() = "0xc3383a29bd0605fd"
NATIVE FUNC BOOL UGC_HAS_GET_FINISHED() = "0x77c220c0b39ffacc"
NATIVE FUNC BOOL UGC_DID_GET_SUCCEED() = "0x59b715ab2121ba3e"
NATIVE FUNC BOOL UGC_WAS_QUERY_FORCE_CANCELLED() = "0x6dbcc00c8455d0aa"
NATIVE FUNC UGC_ERROR UGC_GET_QUERY_RESULT() = "0x4d0fd82ea4bc8c1d"
NATIVE FUNC INT UGC_GET_CONTENT_NUM() = "0xf3aa45cd776289e6"
NATIVE FUNC INT UGC_GET_CONTENT_TOTAL() = "0x2c013cee3c920c85"
NATIVE FUNC INT UGC_GET_CONTENT_HASH() = "0xfb5f8a6ea8aae873"

//PURPOSE: Clear out the last results from a query
// 
NATIVE PROC UGC_CLEAR_QUERY_RESULTS() = "0xaef7e3ff512e6708"

//PURPOSE: Access to content properties
// 
NATIVE FUNC STRING UGC_GET_CONTENT_USER_ID(INT nContentIndex) = "0xf0ab55ff8283fc28"
NATIVE FUNC BOOL UGC_GET_CONTENT_CREATOR_GAMER_HANDLE(INT nContentIndex, GAMER_HANDLE& hGamer) = "0xb7a103bbd4c9d097"
NATIVE FUNC BOOL UGC_GET_CONTENT_CREATED_BY_LOCAL_PLAYER(INT nContentIndex) = "0x3b5fdb74f543499e"
NATIVE FUNC STRING UGC_GET_CONTENT_USER_NAME(INT nContentIndex) = "0x090ffa33edbab655"
NATIVE FUNC BOOL UGC_GET_CONTENT_IS_USING_SC_NICKNAME(INT nContentIndex) = "0x84408d6da0441dc1"
NATIVE FUNC UGC_CATEGORY UGC_GET_CONTENT_CATEGORY(INT nContentIndex) = "0x3cf4fd7a9d95ee16"
NATIVE FUNC STRING UGC_GET_CONTENT_ID(INT nContentIndex) = "0xf72292ef34ed9e5c"
NATIVE FUNC STRING UGC_GET_ROOT_CONTENT_ID(INT nContentIndex) = "0x799bf71eb6225205"
NATIVE FUNC STRING UGC_GET_CONTENT_NAME(INT nContentIndex) = "0xce98fa0d055b7884"
NATIVE FUNC STRING UGC_GET_CONTENT_DESCRIPTION(INT nContentIndex) = "0x2a8c27f80a5f3b8b"
NATIVE FUNC INT UGC_GET_CONTENT_DESCRIPTION_HASH(INT nContentIndex) = "0x1223cfaaa0ac38fe"
NATIVE FUNC STRING UGC_GET_CONTENT_PATH(INT nContentIndex, INT nFileID = 0) = "0xfbf31990d24f2c95"
NATIVE PROC UGC_GET_CONTENT_CREATED_DATE(INT nContentIndex, UGC_DATE& sDate) = "0x33bbd58dc0893801"
NATIVE PROC UGC_GET_CONTENT_UPDATED_DATE(INT nContentIndex, UGC_DATE& sDate) = "0xf8bbd854abcc35f0"
NATIVE FUNC INT UGC_GET_CONTENT_FILE_VERSION(INT nContentIndex, INT nFileIndex) = "0xd84e34e7763a288f"
NATIVE FUNC BOOL UGC_GET_CONTENT_HAS_LO_RES_PHOTO(INT nContentIndex) = "0x7c9d4d56da841652"
NATIVE FUNC BOOL UGC_GET_CONTENT_HAS_HI_RES_PHOTO(INT nContentIndex) = "0xa428761b64babfae"
NATIVE FUNC INT UGC_GET_CONTENT_LANGUAGE(INT nContentIndex) = "0x1f02bdfd3c4b7fa4"
NATIVE FUNC INT UGC_GET_CONTENT_VERSION(INT nContentIndex) = "0x80e5b5efe82c4429"
NATIVE FUNC BOOL UGC_GET_CONTENT_IS_PUBLISHED(INT nContentIndex) = "0x179fad3a441f20b3"
NATIVE FUNC BOOL UGC_GET_CONTENT_IS_VERIFIED(INT nContentIndex) = "0x941b4d709bcc8c10"


//PURPOSE: Access to HDD cached descriptions
// 
NATIVE FUNC INT UGC_REQUEST_CACHED_DESCRIPTION(INT nHash) = "0xc554b8b09b05cf3f"
NATIVE FUNC BOOL UGC_IS_DESCRIPTION_REQUEST_IN_PROGRESS(INT nHash) = "0x1bfdc48299591ee7"
NATIVE FUNC BOOL UGC_HAS_DESCRIPTION_REQUEST_FINISHED(INT nHash) = "0xc4e6bb4d008b1a0d"
NATIVE FUNC BOOL UGC_DID_DESCRIPTION_REQUEST_SUCCEED(INT nHash) = "0x3cda5f7958322c2b"
NATIVE FUNC STRING UGC_GET_CACHED_DESCRIPTION(INT nHash, INT nMaxLength) = "0xbe68e8ef2908ab25"
NATIVE FUNC BOOL UGC_RELEASE_CACHED_DESCRIPTION(INT nHash) = "0xb1bb0770ddaba505"
NATIVE PROC UGC_RELEASE_ALL_CACHED_DESCRIPTIONS() = "0x965ee1ea5dcebc17"

//PURPOSE: Access to rating information (FLOAT values from 0.0 to 1.0)
//PARAMS:
//    bXv - Determines whether the ratings are aggregated across all versions 
//			or just the latest version
//
NATIVE FUNC FLOAT UGC_GET_CONTENT_RATING(INT nContentIndex, BOOL bXv) = "0xc52c7e90982ff46a"
NATIVE FUNC FLOAT UGC_GET_CONTENT_RATING_POSITIVE_PCT(INT nContentIndex, BOOL bXv) = "0x9764c81f93137f04"
NATIVE FUNC FLOAT UGC_GET_CONTENT_RATING_NEGATIVE_PCT(INT nContentIndex, BOOL bXv) = "0x4d0d5459cd9a3d84"
NATIVE FUNC INT UGC_GET_CONTENT_RATING_COUNT(INT nContentIndex, BOOL bXv) = "0x1a15e0f70d9f0e28"
NATIVE FUNC INT UGC_GET_CONTENT_RATING_POSITIVE_COUNT(INT nContentIndex, BOOL bXv) = "0xec359ed95ac57467"
NATIVE FUNC INT UGC_GET_CONTENT_RATING_NEGATIVE_COUNT(INT nContentIndex, BOOL bXv) = "0x20022932d1196962"

//PURPOSE: Whether the local player has a record
//         This won't be the case until the player has rated, bookmarked or set player data
NATIVE FUNC BOOL UGC_GET_CONTENT_HAS_PLAYER_RECORD(INT nContentIndex) = "0x4f7dbaf2b4ee590f"

//PURPOSE: Access to rating information for the local player
//		   Allows player to check whether they have rated a particular item already and show the rating
NATIVE FUNC BOOL UGC_GET_CONTENT_HAS_PLAYER_RATED(INT nContentIndex) = "0x9b3ffb2f1aebb18e"
NATIVE FUNC INT UGC_GET_CONTENT_PLAYER_RATING(INT nContentIndex) = "0x88059889b0456ad7"
NATIVE FUNC BOOL UGC_GET_CONTENT_HAS_PLAYER_BOOKMARKED(INT nContentIndex) = "0x9b05b2451539f08d"

//PURPOSE: Gets data associated with content
// 
NATIVE FUNC INT UGC_REQUEST_CONTENT_DATA_FROM_INDEX(INT nContentIndex,
												    INT nFileID) = "0x171df6a0c07fb3dc"

//PURPOSE: Gets data associated with content
// 
NATIVE FUNC INT UGC_REQUEST_CONTENT_DATA_FROM_PARAMS(STRING szContentType,
													 STRING szContentID, 
													 INT nFileID, 
													 INT nFileVersion, 
													 INT nLanguage) = "0x7fd2990af016795e"

//PURPOSE: Returns true if RLROS_PRIVILEGEID_UGCWRITE is set. This is true for most players. Players who
//         are abusive with UGC may have the privilege revoked.
NATIVE FUNC BOOL UGC_HAS_PERMISSION_TO_WRITE() = "0x646d0f60e507030b"

//PURPOSE: Modify existing content
// 
NATIVE FUNC BOOL UGC_PUBLISH(STRING szContentID, STRING szBaseContentID, STRING szContentType) = "0xdd7c2159ad30f8a0"
NATIVE FUNC BOOL UGC_SET_BOOKMARKED(STRING szContentID, BOOL bIsBookmarked, STRING szContentType) = "0x810db8b8dfe37018"
NATIVE FUNC BOOL UGC_SET_DELETED(STRING szContentID, BOOL bIsDeleted, STRING szContentType) = "0xbccf9c02415cbb67"
NATIVE FUNC BOOL UGC_RATE_CONTENT(STRING szContentID, FLOAT fRating, STRING szContentType) = "0x5eae3908b1f86e32"

//PURPOSE: Query results of MODIFY functions
// 
NATIVE FUNC BOOL UGC_IS_MODIFYING() = "0x412d9a1c024b8983"
NATIVE FUNC BOOL UGC_HAS_MODIFY_FINISHED() = "0x8f43810a0b1a356b"
NATIVE FUNC BOOL UGC_DID_MODIFY_SUCCEED() = "0xb72414ad66bce7d2"
NATIVE FUNC UGC_ERROR UGC_GET_MODIFY_RESULT() = "0xa9433df0579e7ac5"
NATIVE FUNC STRING UGC_GET_MODIFY_CONTENT_ID() = "0xf6132437d28da363"

//PURPOSE: Clear out the last results from a MODIFY (call after UPDATE / VERSION)
// 
NATIVE PROC UGC_CLEAR_MODIFY_RESULT() = "0x9b41481e8e2456e1"

//PURPOSE: Query content creators
// 
NATIVE FUNC BOOL UGC_GET_CREATORS_TOP_RATED(INT nOffset, STRING szContentType) = "0x9f4f7ba8b635d80e"
NATIVE FUNC BOOL UGC_GET_CREATORS_BY_USER_ID(STRING szUserID, STRING szContentType) = "0xe00f6b08b8b1b39d"
NATIVE FUNC BOOL UGC_GET_CREATORS_BY_USER_IDS(UGC_USERID_ID_QUERY& aQueryIDs, INT numIDs, STRING szContentType) = "0x9b1676a3edc30eb5"

//PURPOSE: Clear out the last results from a query
// 
NATIVE PROC UGC_CLEAR_CREATOR_RESULTS() = "0x6ed61fded0826ee9"

//PURPOSE: Query results of QUERY CREATOR functions
// 
NATIVE FUNC BOOL UGC_IS_QUERYING_CREATORS() = "0x52a93740fac98df3"
NATIVE FUNC BOOL UGC_HAS_QUERY_CREATORS_FINISHED() = "0xa8828f4df76464d0"
NATIVE FUNC BOOL UGC_DID_QUERY_CREATORS_SUCCEED() = "0x924d2c3702fa1571"
NATIVE FUNC BOOL UGC_GET_QUERY_CREATORS_RESULT() = "0xf550dc287c67598a"

//PURPOSE: Get number of returned creators and maximum number of creators
// 
NATIVE FUNC INT UGC_GET_CREATOR_NUM() = "0xa1a05a5b5955c3d9"
NATIVE FUNC INT UGC_GET_CREATOR_TOTAL() = "0xc89a30e1142d8715"

//PURPOSE: Access to creator information
//
NATIVE FUNC STRING UGC_GET_CREATOR_USER_ID(INT nCreatorIndex) = "0xcaecc99bacb3ec42"
NATIVE FUNC STRING UGC_GET_CREATOR_USER_NAME(INT nCreatorIndex) = "0xdcdbcd5359a0ead8"
NATIVE FUNC INT UGC_GET_CREATOR_NUM_CREATED(INT nCreatorIndex) = "0x3cd8dfbc595f487f"
NATIVE FUNC INT UGC_GET_CREATOR_NUM_PUBLISHED(INT nCreatorIndex) = "0x93f2a72dbcb213d0"
NATIVE FUNC FLOAT UGC_GET_CREATOR_RATING(INT nCreatorIndex) = "0xed3f2d76221bc551"
NATIVE FUNC FLOAT UGC_GET_CREATOR_RATING_POSITIVE_PCT(INT nCreatorIndex) = "0x02f85e1cbb4c2b70"
NATIVE FUNC FLOAT UGC_GET_CREATOR_RATING_NEGATIVE_PCT(INT nCreatorIndex) = "0x9e425b6b06919440"
NATIVE FUNC INT UGC_GET_CREATOR_RATING_COUNT(INT nCreatorIndex) = "0x26d1d66ba1a5cfbb"
NATIVE FUNC INT UGC_GET_CREATOR_RATING_POSITIVE_COUNT(INT nCreatorIndex) = "0xb4d7ed79c9fe56a1"
NATIVE FUNC INT UGC_GET_CREATOR_RATING_NEGATIVE_COUNT(INT nCreatorIndex) = "0xe95d8e704b5b497a"
NATIVE FUNC BOOL UGC_GET_CREATOR_IS_USING_SC_NICKNAME(INT nCreatorIndex) = "0xf143a04110d436b5"

//PURPOSE: Offline query data loading
//
NATIVE FUNC BOOL UGC_LOAD_OFFLINE_QUERY(UGC_CATEGORY nCategory) = "0x7751c3c783a70f9a"
NATIVE PROC UGC_CLEAR_OFFLINE_QUERY() = "0xa16c11d391768742"
NATIVE PROC UGC_SET_QUERY_DATA_FROM_OFFLINE(BOOL bFromOffline) = "0xdec7f1514aac76a1"

//PURPOSE: Indicates that we're using offline content from script - this will be considered
//         for matchmaking and players with different content 
//
NATIVE PROC UGC_SET_USING_OFFLINE_CONTENT(BOOL bUsingOffline) = "0x2dd4b5731b5aaee8"

//PURPOSE: Returns TRUE if a language is supported on the local console. 
//         Use UGC_GET_CONTENT_LANGUAGE to get the language of a content item. 
//
NATIVE FUNC BOOL UGC_IS_LANGUAGE_SUPPORTED(INT nLanguage) = "0x9f9e97c8a7248d6c"

//PURPOSE: Returns whether the player is allowed access to the mission creators
NATIVE FUNC BOOL NETWORK_CAN_USE_MISSION_CREATORS() = "0xb46cf3b318a0b834"

// Facebook

// returned from FACEBOOK_GET_POST_RESULT_CODE()
ENUM FACEBOOK_TYPE_ERROR
	FB_ERROR_OK,
	FB_ERROR_NOACTIVEGAMER,
	FB_ERROR_INVALIDLOCALGAMERIDX,
	FB_ERROR_INVALIDACCESSTOKEN,
	FB_ERROR_NOTSIGNEDIN,
	FB_ERROR_OFFLINE,
	FB_ERROR_GETACESSTOKEN,
	FB_ERROR_POST	
ENDENUM

NATIVE FUNC BOOL FACEBOOK_POST_PLAY_MISSION( STRING missionId, INT xpEarned, INT rank ) = "0xcf5e7911655290a2"
NATIVE FUNC BOOL FACEBOOK_POST_LIKE_MISSION( STRING missionId ) = "0xc7b57b24ece97d3d"
NATIVE FUNC BOOL FACEBOOK_POST_PUBLISH_MISSION( STRING missionId ) = "0x387504917c8ac588"
NATIVE FUNC BOOL FACEBOOK_POST_PUBLISH_PHOTO( STRING screenshotId ) = "0x9ada1dfab1a3bb4b"
NATIVE FUNC BOOL FACEBOOK_POST_COMPLETED_HEIST( STRING heistId, INT cashEarned, INT xpEarned ) = "0x44946083ae7967c4"
NATIVE FUNC BOOL FACEBOOK_POST_COMPLETED_MILESTONE( MILESTONE_ID milestoneId ) = "0x3e772791462c2e1f"
NATIVE FUNC BOOL FACEBOOK_POST_CREATE_CHARACTER() = "0xd69f92c01e2b80d6"

NATIVE FUNC BOOL FACEBOOK_HAS_POST_COMPLETED() = "0x4d08678e990c28f6"
NATIVE FUNC BOOL FACEBOOK_DID_POST_SUCCEED() = "0xbfe3a24077843158"
NATIVE FUNC INT FACEBOOK_GET_POST_RESULT_CODE() = "0x9dcfab417e624997"

//PURPOSE: Enable the display of the GUI if the player does not have an access token.
//         This defaults to TRUE. 
//
NATIVE PROC FACEBOOK_ENABLE_GUI( BOOL enableFlag ) = "0xbfd94f76e70a52ea"

//PURPOSE: Enable functionality to retrieve an access token if one doesn't exist.
//         This defaults to FALSE
//         The pause menu contains functionality to retrieve an access token.
//
NATIVE PROC FACEBOOK_ENABLE_AUTO_GETACCESSTOKEN( BOOL enableFlag ) = "0xde44937ce7cefc1e"

//PURPOSE: Check if an access token has ben retrieved.
//
NATIVE FUNC BOOL FACEBOOK_HAS_ACCESSTOKEN() = "0x19bbaa873c2b0f22"

//PURPOSE: Retrieve the last returned post ID
//
NATIVE FUNC STRING FACEBOOK_GET_LAST_POSTRETURNID() = "0xe387aa8e977e9255"


//PURPOSE: Determine if the option to post to facebook should be allowed by the player.
//
NATIVE FUNC BOOL FACEBOOK_CAN_POST_TO_FACEBOOK() = "0xc59963203bab59df"

/// GAMER HANDLE UTILITY FUNCTIONS
//     
//  These functions are wrappers around the gamer handle functionality to make things a little simpler. To use:
//
//      GAMER_HANDLE gamerHandle = GET_GAMER_HANDLE_PLAYER(playerIndex)
//
//  The gamer handle can then be used in any of the functions taking a gamer handle. For instance:
// 	
// 		GAMER_HANDLE gamerHandle = GET_GAMER_HANDLE_PLAYER(playerIndex)
//		IF NETWORK_IS_FRIEND(gamerHandle)
// 			NETWORK_SHOW_PROFILE_UI(gamerHandle)
// 		ENDIF
//
//  The gamer handle variable can be re-used and would still be valid if, for instance, the player indicated left
//  the game session. It is not possible to use the functions in place like this:
//
//  	NETWORK_SHOW_PROFILE_UI(GET_GAMER_HANDLE_PLAYER(playerIndex))
//
//  You'll see errors like this:
//
//      Error: Invalid implicit string conversion or VECTOR passed by value to VARARGS 
//		Error: Unable to convert to reference in parameter 
///		

/// PURPOSE:
///    Utility function to wrap calls to NETWORK_GET_LOCAL_HANDLE (use in place of)
FUNC GAMER_HANDLE GET_LOCAL_GAMER_HANDLE()
	GAMER_HANDLE gamerHandle 
	NETWORK_GET_LOCAL_HANDLE(gamerHandle, SIZE_OF(gamerHandle))
	return gamerHandle
ENDFUNC

/// PURPOSE:
///    Utility function to wrap calls to NETWORK_HANDLE_FROM_USER_ID (use in place of)
FUNC GAMER_HANDLE GET_GAMER_HANDLE_USER(STRING userID)
	GAMER_HANDLE gamerHandle 
	NETWORK_HANDLE_FROM_USER_ID(userID, gamerHandle, SIZE_OF(gamerHandle))
	return gamerHandle
ENDFUNC

/// PURPOSE:
///    Utility function to wrap calls to NETWORK_HANDLE_FROM_MEMBER_ID (use in place of)
FUNC GAMER_HANDLE GET_GAMER_HANDLE_MEMBER(STRING memberID)
	GAMER_HANDLE gamerHandle 
	NETWORK_HANDLE_FROM_MEMBER_ID(memberID, gamerHandle, SIZE_OF(gamerHandle))
	return gamerHandle
ENDFUNC

/// PURPOSE:
///    Utility function to wrap calls to NETWORK_HANDLE_FROM_STRING (use in place of)
FUNC GAMER_HANDLE GET_GAMER_HANDLE_STRING(STRING handle)
	GAMER_HANDLE gamerHandle 
	NETWORK_HANDLE_FROM_STRING(handle, gamerHandle, SIZE_OF(gamerHandle))
	return gamerHandle
ENDFUNC

/// PURPOSE:
///    Utility function to wrap calls to NETWORK_PLAYER_GET_HANDLE (use in place of)
FUNC GAMER_HANDLE GET_GAMER_HANDLE_PLAYER(PLAYER_INDEX playerIndex)
	GAMER_HANDLE gamerHandle 
	NETWORK_HANDLE_FROM_PLAYER(playerIndex, gamerHandle, SIZE_OF(gamerHandle))
	return gamerHandle
ENDFUNC

/// PURPOSE:
///    Utility function to wrap calls to NETWORK_GET_FRIEND_HANDLE (use in place of)
FUNC GAMER_HANDLE GET_GAMER_HANDLE_FRIEND(INT friendIndex)
	GAMER_HANDLE gamerHandle 
	NETWORK_HANDLE_FROM_FRIEND(friendIndex, gamerHandle, SIZE_OF(gamerHandle))
	return gamerHandle
ENDFUNC

/// PURPOSE:
///    Utility function to wrap calls to NETWORK_GET_MET_PLAYER_HANDLE (use in place of)
FUNC GAMER_HANDLE GET_GAMER_HANDLE_MET_PLAYER(INT metPlayerIndex)
	GAMER_HANDLE gamerHandle 
	NETWORK_HANDLE_FROM_MET_PLAYER(metPlayerIndex, gamerHandle, SIZE_OF(gamerHandle))
	return gamerHandle
ENDFUNC

/// PURPOSE:
///    Utility function to wrap calls to NETWORK_IS_HANDLE_VALID (use in place of)
FUNC BOOL IS_GAMER_HANDLE_VALID(GAMER_HANDLE gamerHandle)
	return NETWORK_IS_HANDLE_VALID(gamerHandle, SIZE_OF(gamerHandle))
ENDFUNC



//**************************************************************
//Commerce enums
//
//Candidate for splitting into a seperate script header in the future (hence being down here).
//
//*****************************************************************

//PURPOSE: Enum to be passed into SET_COMMERCE_STORE_BRANDING
ENUM E_COMMERCE_STORE_BRANDING
	CS_BRAND_NONE,
	CS_BRAND_AMMUNATION,
	CS_BRAND_PONSONBYS,
	CS_BRAND_BOBMULLET,
	CS_BRAND_PECKERWOOD,
	CS_BRAND_BINCO
ENDENUM

ENUM E_PREMIUM_PACK_TYPE
	EPPT_NONE,
    EPPT_STANDALONE,
    EPPT_BUNDLED_WITH_GREAT_WHITE,
    EPPT_BUNDLED_WITH_WHALE,
    EPPT_BUNDLED_WITH_MEGALODON  
ENDENUM

//**************************************************************
//Commerce data access functions
//
//Candidate for splitting into a seperate script header in the future.
//
//**************************************************************

//INFO: Sets the Branding on the store for the next time it is initialised.
//PARAM NOTES: Takes the enum E_COMMERCE_STORE_BRANDING
NATIVE PROC SET_COMMERCE_STORE_BRANDING( E_COMMERCE_STORE_BRANDING nBrandingType ) = "0x3e43a0cbd01511bf"

//INFO: Gets the number of products stored in thin data. Will return 0 in the event of no populated data.
//PURPOSE: 
NATIVE FUNC INT GET_NUM_COMMERCE_ITEMS() = "0x6c7efc463dfad900"


/// PURPOSE:
///    Function to check for the presence of valid commerce data
NATIVE FUNC BOOL IS_COMMERCE_DATA_VALID( ) = "0x1b0dbb0f140d5933"

NATIVE PROC TRIGGER_COMMERCE_DATA_FETCH( BOOL forceRefetch ) = "0x1e29737690a77055"

NATIVE FUNC BOOL IS_COMMERCE_DATA_FETCH_IN_PROGRESS( ) = "0xace33ab19f1e4988"

//INFO: Gets the identifier for a product
//PARAM NOTES: The numerical index for a product
//PURPOSE: 
NATIVE FUNC STRING GET_COMMERCE_ITEM_ID( INT index ) = "0x65268f667261e774"

//INFO: Gets the name for a product
//PARAM NOTES: The numerical index for a product 
//PURPOSE: 
NATIVE FUNC STRING GET_COMMERCE_ITEM_NAME( INT index ) = "0xb56bc582fabe5d03"


NATIVE FUNC STRING GET_COMMERCE_ITEM_IMAGENAME( INT index ) = "0x4cdcb72b9777ce2a"

NATIVE FUNC STRING GET_COMMERCE_ITEM_DESC( INT index ) = "0x5fab8b4b6513166c"

NATIVE FUNC BOOL IS_COMMERCE_ITEM_PURCHASED( INT index ) = "0x6510567e1c0437e5"

NATIVE FUNC STRING GET_COMMERCE_PRODUCT_PRICE( INT index ) = "0x47a3d2989833fe42"

//INFO: Gets the number of categories a specified product is contained in
//PARAM NOTES: The numerical index for a product, retrieved from 
//PURPOSE: 
NATIVE FUNC INT GET_COMMERCE_ITEM_NUM_CATS( INT index ) = "0xb8c8fd440a6ec714"

//INFO: Retrieve the category text ID for a specific product and cat index
//PARAM NOTES: The numerical index for a product, and the numerical index for the category (iterating up to the value returned by GET_COMMERCE_ITEM_NUM_CATS) 
NATIVE FUNC STRING GET_COMMERCE_ITEM_CAT( INT itemIndex, INT catIndex ) = "0x74ae0841bf4b0964"
 

// Status returned from PROFILE STATS READ operation.
ENUM STORE_PURCHASE_LOCATION
	SPL_UNKNOWN,
	SPL_SCUI,
	SPL_INGAME, // Pause menu 'Store' tab
	SPL_STORE, // All insufficient fund alerts
	SPL_PHONE, // Contact requests
	SPL_AMBIENT, // Most ambient script systems
	SPL_ONLINE_TAB, // Pause menu 'Online' tab
	SPL_STORE_GUN, // Direct access from shop
	SPL_STORE_CLOTH, // Direct access from shop
	SPL_STORE_HAIR, // Direct access from shop
	SPL_STORE_CARMOD, // Direct access from shop
	SPL_STORE_TATTOO, // Direct access from shop
	SPL_STORE_PERSONAL_MOD, // Direct access from shop
	SPL_STARTER_PACK, // Pause menu 'Online' tab starter pack option
	SPL_LANDING_MP, // A landing page ol-menu button
	SPL_LANDING_SP_UPSELL, // The single player upsell page
	SPL_PRIORITY_FEED, // The priority feed
	SPL_WHATS_NEW, // the whats new feed
#IF FEATURE_GTAO_MEMBERSHIP
	SPL_MEMBERSHIP_INGAME, // The membership button in-game from the online tab
#ENDIF
#IF NOT FEATURE_GTAO_MEMBERSHIP
	SPL_UNUSED,
#ENDIF
	SPL_PAUSE_PLAY_SP, // The play single player button from the MP pause menu when SP is not owned
	SPL_CHARACTER_SELECTION_WHEEL // The character selection whell when SP is not owned
ENDENUM

//INFO: Can be used to set the STORE_PURCHASE_LOCATION for the next time the store will be opened. To be used only if the store open has to go through some external steps first.
NATIVE PROC RESERVE_COMMERCE_STORE_PURCHASE_LOCATION( STORE_PURCHASE_LOCATION location ) = "0x0fe78a4aa52c6a19"

//INFO: Open the actual commerce store
//PARAM NOTES: The product ID to start with in the store, and the category to use as a base for the store. Both can be NULL to get to the default store head. 
NATIVE PROC OPEN_COMMERCE_STORE( STRING szProductID, STRING szCategory, STORE_PURCHASE_LOCATION location = SPL_UNKNOWN #IF FEATURE_GEN9_STANDALONE , BOOL launchLandingPageOnClose = FALSE #ENDIF) = "0xbe25f6f5d34768e7"

//INFO: Open the commerce store on the platform specific checkout page for the specified product
NATIVE PROC CHECKOUT_COMMERCE_PRODUCT( STRING szProductID, STORE_PURCHASE_LOCATION location = SPL_UNKNOWN #IF FEATURE_GEN9_STANDALONE , BOOL launchLandingPageOnClose = FALSE #ENDIF ) = "0xc3ec3470bf795d95"

//INFO: Returns if the commerce store has been opened (includes both ad and main screen)
NATIVE FUNC BOOL IS_COMMERCE_STORE_OPEN() = "0x06c559386ad19942"

//INFO: Allows script to set whether the DLC store is available from the pause menu
//PARAM NOTES: false to disable store, true to re-enable
NATIVE PROC SET_STORE_ENABLED( BOOL enabled ) = "0x91792061e06f1a74"

//INFO: Sets if the store will display cash pack products. Call before opening the store
//PARAM NOTES: false to hide cash products, true to show
NATIVE PROC SET_CASH_COMMERCE_PRODUCTS_ENABLED( BOOL enabled ) = "0xd8bd21f54279c784"

//INFO: Retrieves if this user has permissions to use the store
//PARAM NOTES: None
NATIVE FUNC BOOL IS_STORE_AVAILABLE_TO_USER() = "0x6ccc428f989dfd8a"

//INFO: Retrieves if this user has permissions to use the store
//PARAM NOTES: None
NATIVE FUNC BOOL IS_USER_OLD_ENOUGH_TO_ACCESS_STORE() = "0x4e357c5de898adf0"

//INFO: Delays the store from opening by 3 frames. This is to allow such transitions as skycam to complete.
//PARAM NOTES: None
NATIVE PROC DELAY_MP_STORE_OPEN() = "0x61d4dda88f814946"

//INFO: Resets network game tracking in the store. 
//PARAM NOTES: None
NATIVE PROC RESET_STORE_NETWORK_GAME_TRACKING() = "0xd6ea0ca2391c3180"

//INFO: Sets the id of the last visited store. Used to track the purchase flow
//PARAM NOTES: None
NATIVE PROC SET_LAST_VIEWED_SHOP_ITEM(INT itemHash, INT itemPrice, INT shopNameHash) = "0xdd3a3c508f4e1c08"

//INFO: Retrieves the type of pack, if any, which grants the user access to the premium pack content
NATIVE FUNC E_PREMIUM_PACK_TYPE GET_USER_PREMIUM_ACCESS() = "0x40aceb5063a03a88"

//INFO: Retrieves the type of pack, if any, which grants the user access to the starter pack content
NATIVE FUNC E_PREMIUM_PACK_TYPE GET_USER_STARTER_ACCESS() = "0x2acfe7dfd4ffdb10"



//**************************************************************
//Commerce image functions
//
//Candidate for splitting into a seperate script header in the future.
//
//**************************************************************

//INFO: Returns true if the image is loaded, so it can repeatedly called until the image is available.
// Once loaded the image is in the TXD:TextureName returned by GET_COMMERCE_ITEM_TEXTURENAME
// For example, GET_COMMERCE_ITEM_TEXTURENAME returns "TestTexture", the downloaded texture is in TestTexture:TestTexture
NATIVE FUNC BOOL REQUEST_COMMERCE_ITEM_IMAGE ( INT index ) = "0x6c4bfff27e4c73e2"

//INFO: Releases any downloaded texture for this item if one is present.
NATIVE PROC RELEASE_COMMERCE_ITEM_IMAGE ( INT index ) = "0x855b4d2860322b93"

//INFO: Releases any downloaded textures and cancels downloads.
// Please call this when operations on store textures are complete.
NATIVE PROC RELEASE_ALL_COMMERCE_ITEM_IMAGES ( ) = "0x924457e1f136ba37"

//INFO: Returns null string if image is not available (product has no image path). 
//		Otherwise returns the texture/txd name of the items texture
//		Note: Cannot be used to check for texture download state, is just a manipulation of the string returned by GET_COMMERCE_ITEM_IMAGENAME
NATIVE FUNC STRING GET_COMMERCE_ITEM_TEXTURENAME( INT index ) = "0xb49c489a8421a360"

//**************************************************************
// Cheating detection commands
//**************************************************************

//INFO: Returns TRUE if the local player has been flagged as a cheater.
NATIVE FUNC BOOL NETWORK_PLAYER_IS_CHEATER() = "0xc8eb486898ddbcf0"

//INFO: Returns code for the reason the player has been deemed a cheater
NATIVE FUNC INT NETWORK_PLAYER_GET_CHEATER_REASON() = "0xc0f485c2828ff715"

//INFO: Returns TRUE if the local player has been flagged as a bad sport.
NATIVE FUNC BOOL NETWORK_PLAYER_IS_BADSPORT() = "0x515503e8eff18d25"

//INFO: Triggers network checksum comparison between two players. When triggered, player A asks player B what's the crc of system&subsystem
// (for instance of CItemInfo->WEAPON_APPISTOL). Player B will reply with a runtime specific crc, and player A will compare it against his own calculation.
// If they differ, a CRC_COMPROMISED code telemetry event is sent to R*, identifying players A and B and what system&subsystem pair was compared.
// Please refer to HASHABLE_SYSTEM script enum to see what values subsystem may have for each system.
// Returns TRUE if the crc comparison network event was correctly sent. Hashing and comparison happens async in code.
NATIVE FUNC BOOL TRIGGER_PLAYER_CRC_HACKER_CHECK(PLAYER_INDEX receiver, HASHABLE_SYSTEM system, INT subsystem) = "0x096a1c82a39ee942"

//INFO: Same exact behaviour as TRIGGER_PLAYER_CRC_HACKER_CHECK.
// This is a wrapper to perform just CRC_TUNING_SYSTEM script checks passing strings as a param (nicer input). 
// Code will internally pack them into an INT subsystem and pass it to a TRIGGER_PLAYER_CRC_HACKER_CHECK call.
// Example input: group "Player Targetting" and instance "CPlayerPedTargeting"
NATIVE FUNC BOOL TRIGGER_TUNING_CRC_HACKER_CHECK(PLAYER_INDEX receiver, STRING tuningGroup, STRING tuningInstance) = "0x0f37c55ff7e6fb97"

//INFO: Same exact behaviour as TRIGGER_PLAYER_CRC_HACKER_CHECK.
// This is a wrapper to perform whole file hash checks passing filename string as a param. 
// Code will internally decide if this can be handled as a CRC_DATA_FILE_CONTENTS or a CRC_GENERIC_FILE_CONTENTS check, and process the string accordingly.
NATIVE FUNC BOOL TRIGGER_FILE_CRC_HACKER_CHECK(PLAYER_INDEX receiver, STRING fileToHash) = "0x4a20c2b73c123028"

//INFO: Sends telemetry event to R* informing that this machine thinks given remote player is cheating/hacker.
// Event contains both player A and B, is flagged as a SCRIPT_CHEAT_DETECTION cheat detected, and attaches extraInfo1&2 as script extra proofs.
// extraInfo may contain whatever script needs relevant to identify which actual script triggered this event, or why remote may be a hacker.
// Returns TRUE if the ROS telemetry event was corretly sent to R* servers.
NATIVE FUNC BOOL REMOTE_CHEATER_PLAYER_DETECTED(PLAYER_INDEX plyCheater, INT extraInfo1, INT extraInfo2) = "0xc3bda394e3a18b01"

//INFO: Sends telemetry event to R* informing that a remote player (who is not anymore in the game) was a bad sport quitter
NATIVE FUNC BOOL BAD_SPORT_PLAYER_LEFT_DETECTED(GAMER_HANDLE& gamerHandle, INT extraInfo1, INT extraInfo2) = "0x65ee68ba2c50ae3d"

//INFO: Sets a binary map for invalid models created in multiplayer. A telemetry event to R* will be sent when a remote player creates an object with an invalid model
NATIVE PROC NETWORK_ADD_INVALID_OBJECT_MODEL(MODEL_NAMES modelHashKey) = "0x7f562dbc212e81f9"
NATIVE PROC NETWORK_REMOVE_INVALID_OBJECT_MODEL(MODEL_NAMES modelHashKey) = "0x791edb5803b2f468"
NATIVE PROC NETWORK_CLEAR_INVALID_OBJECT_MODELS() = "0x03b2f03a53d85e41"

//INFO: Populates the list of models that are allowed to be registered when in instanced content
NATIVE PROC ADD_MODEL_TO_INSTANCED_CONTENT_ALLOW_LIST(MODEL_NAMES modelHashKey) = "0xbcaaa30292cf0dfd"

//INFO: Clears the list of allowed models for instanced content
NATIVE PROC REMOVE_ALL_MODELS_FROM_INSTANCED_CONTENT_ALLOW_LIST() = "0x96c7a61f6d568953"

//INFO: Peers send telemetry reporting this guy as a cheater.
NATIVE PROC NETWORK_REPORT_CODE_TAMPER( ) = "0x68777339a1ec6068"

//INFO: Returns the last position for this entity received over the network (Note: This may be different to where the entity is on the local machine currently)
NATIVE FUNC VECTOR NETWORK_GET_LAST_ENTITY_POS_RECEIVED_OVER_NETWORK(ENTITY_INDEX entityIndex) = "0x5c01ec35a233b127"

//INFO: Returns the last position for this player received over the network (Note: This may be different to where the player is on the local machine currently)
NATIVE FUNC VECTOR NETWORK_GET_LAST_PLAYER_POS_RECEIVED_OVER_NETWORK(PLAYER_INDEX playerIndex) = "0x4805881668bffd1d"

//INFO: Returns the last received velocity of a clone entity. Don't use it on local entities
NATIVE FUNC VECTOR NETWORK_GET_LAST_VEL_RECEIVED_OVER_NETWORK(ENTITY_INDEX entityIndex) = "0x2f9bb68e2516d8e1"

//INFO: Returns the predicted velocity of a clone entity. Don't use it on local entities
// maxSpeedToPredict should be set to the maximum we think this entity can travel (meter/second)
NATIVE FUNC VECTOR NETWORK_GET_PREDICTED_VELOCITY(ENTITY_INDEX entityIndex, FLOAT maxSpeedToPredict) = "0x8a6ade9f697703bd"

//**************************************************************
// Texture download commands
//**************************************************************

//INFO: Requests to download a texture from member space. The texture will not be immediately available; the user needs to query its state
//      by calling TEXTURE_DOWNLOAD_HAS_FAILED, TEXTURE_DOWNLOAD_GET_NAME or GET_STATUS_OF_TEXTURE_DOWNLOAD
//PARAM NOTES:	gamerHandle - gamer handle
//		cloudPath   - relative path to the file in the cloud, including the file name and extension
//		textureName - the name the user wants to give to the texture once it's downloaded;
//			      the texture dictionary containing this texture will have the same name
//		useCacheWithoutCloudChecks - sets whether the request should avoid checking with the server if a locally cached version
//					     of the texture (if it exists) is up-to-date. This flag should always be set to TRUE if the 
//					     user knows there's no need to hit the server. 
//RETURNS: a handle to use in the other texture download commands, can return NULL if the request failed.
NATIVE FUNC INT TEXTURE_DOWNLOAD_REQUEST( GAMER_HANDLE& gamerHandle, STRING cloudPath, STRING textureName, BOOL useCacheWithoutCloudChecks = FALSE ) = "0x1af529be61f700f2"

//INFO: Variant of TEXTURE_DOWNLOAD_REQUEST that uses TITLE namespace. Same comments apply
//
NATIVE FUNC INT TITLE_TEXTURE_DOWNLOAD_REQUEST( STRING cloudPath, STRING textureName, BOOL useCacheWithoutCloudChecks = FALSE ) = "0x6848bf6959c9e5fa"

//INFO: Variant of TEXTURE_DOWNLOAD_REQUEST that uses UGC namespace. Same comments apply
//
NATIVE FUNC INT UGC_TEXTURE_DOWNLOAD_REQUEST( STRING contentID, INT nFileID, INT nFileVersion, INT nLanguage, STRING textureName, BOOL useCacheWithoutCloudChecks = FALSE ) = "0x72385362add8885f"

//INFO: Releases the reference script had to this texture. This command must to be called when the texture is no longer
//	needed.
//PARAM NOTES:	textureDownloadHandle - handle to the texture
NATIVE PROC TEXTURE_DOWNLOAD_RELEASE( INT textureDownloadHandle ) = "0x93d704c0cb05bee9"

//INFO: Queries whether a texture download request has failed
//PARAM NOTES:	textureDownloadHandle - handle to the texture
//RETURNS: TRUE if the request failed, false otherwise
NATIVE FUNC BOOL TEXTURE_DOWNLOAD_HAS_FAILED( INT textureDownloadHandle ) = "0xf108966ca9582f54"
	
//INFO: Queries the name of the texture for a given handle. The texture cannot be used until this commands
//	returns a valid string.
//PARAM NOTES:	textureDownloadHandle - handle to the texture
//RETURNS: A valid string if the texture is ready to be used (both the TXD and texture names match), NULL otherwise
NATIVE FUNC STRING TEXTURE_DOWNLOAD_GET_NAME( INT textureDownloadHandle ) = "0xe14fcb457d28c3e8"

//INFO: Queries the state of a texture download. The texture cannot be used until this command returns PHOTO_OPERATION_SUCCEEDED
//PARAM NOTES:	textureDownloadHandle - handle to the texture
//RETURNS: an enum value to say whether the download has succeeded, failed or is still in progress
NATIVE FUNC PHOTO_OPERATION_STATUS GET_STATUS_OF_TEXTURE_DOWNLOAD( INT textureDownloadHandle ) = "0xc9cd4cf726ea8561"

//INFO: call to attribute damage done by this ped PedIndex to PlayerIndex
//RETURNS: TRUE if it managed to set the damage to that player.
NATIVE FUNC BOOL NETWORK_SET_ATTRIBUTE_DAMAGE_TO_PLAYER(PED_INDEX PedIndex, PLAYER_INDEX PlayerIndex) = "0x0f1f0c82fa94500f"

//INFO: call retrieve if the damage done by this ped PedIndex is attributed to PlayerIndex
//RETURNS: TRUE if it the ped damage is attributed to a player, returns the Player Id in PlayerIndex.
NATIVE FUNC BOOL NETWORK_GET_ATTRIBUTE_DAMAGE_TO_PLAYER(PED_INDEX PedIndex, PLAYER_INDEX& PlayerIndex) = "0xd5ccb1fedf2b38b3"

//INFO: When set, damage events will trigger for invincible entities
NATIVE PROC NETWORK_TRIGGER_DAMAGE_EVENT_FOR_ZERO_DAMAGE(ENTITY_INDEX EntityIndex, BOOL shouldTrigger) = "0xe68484a03fb77128"

//INFO: When set, damage events will trigger even if they have damage weapon hash as 0
NATIVE PROC NETWORK_TRIGGER_DAMAGE_EVENT_FOR_ZERO_WEAPON_HASH(ENTITY_INDEX EntityIndex, BOOL shouldTrigger) = "0x077379c7e4ea63d3"

/// PURPOSE
///    Call to retrieve if in the last session the ROS connection (cloud) went down but not the platform network connection.
///    When this is called it will clear any status so this must be called in the network game once only. During transition from SP to MP since 
///    I will adding some asserts and checks to make sure this is done in FREEMODE.
NATIVE FUNC BOOL NETWORK_CHECK_ROS_LINK_WENTDOWN_NOT_NET( ) = "0xc1f1f0583b10bd60"

/// PURPOSE
///    Call to retrieve the Gamer Nat Type.
NATIVE FUNC NET_NAT_TYPE NETWORK_GET_NAT_TYPE( ) = "0x4ac96dbd130b6e46"

/// PURPOSE
///    Call to determine whether to show the warning about having a Strict NAT.
NATIVE FUNC BOOL NETWORK_SHOULD_SHOW_STRICT_NAT_WARNING() = "0x93ff52d531fcf4ef"

/// PURPOSE
///    Call to retrieve if game received from R* an event to force us to update all presence info to the server.
//	   Using this function also resets the flag. So for instance, if called twice in a row, the second return is going to be FALSE
NATIVE FUNC BOOL HAS_RECEIVED_FORCE_PRESENCE_UPDATE_SIGNAL() = "0xe793a96dd70e824e"


//INFO: Specifies that the radio should not be reset for singleplayer the next time the network is closed; ie script is going straight back into MP
//PARAM NOTES:
NATIVE PROC NETWORK_SKIP_RADIO_RESET_NEXT_CLOSE() = "0xc189969327d9bda0"

//INFO: Specifies that the radio should not be reset for multiplayer the next time the network is opened
//PARAM NOTES:
NATIVE PROC NETWORK_SKIP_RADIO_RESET_NEXT_OPEN() = "0x832a85c371e68507"

//INFO: The name of this function is intentionally incorrect.
//      This function returns true if the game has naively, though successfully, detected mods attached to the game.
//      This function returns false if the game has NOT detected mods attached to the game (again through an over-simplistic and naive detection)
//PARAM NOTES:
NATIVE FUNC BOOL NETWORK_SKIP_RADIO_WARNING() = "0x2dcd9a6218733e97"

//INFO: Forces a sync update of the player scar data to all remote players - THIS IS A VERY BANDWIDTH INTENSIVE FUNCTION - PLEASE USE WITH CARE
//PARAM NOTES:
NATIVE PROC NETWORK_FORCE_LOCAL_PLAYER_SCAR_SYNC() = "0x1bd8dc43a2949227"

//INFO: Makes sure that if something happens to the local player that other machines dont leave a ped behind if 
//        the connection is lost somehow with our Player.
NATIVE PROC NETWORK_DISABLE_LEAVE_REMOTE_PED_BEHIND( BOOL flag ) = "0xff472c078825e148"

//INFO: Clear data from previous operations. Must not be PENDING.
NATIVE FUNC BOOL NETWORK_GET_PRIMARY_CLAN_DATA_CLEAR( ) = "0x0fa854f129d64245"

//INFO: Cancel data retrieval in progress. Must be PENDING.
NATIVE PROC NETWORK_GET_PRIMARY_CLAN_DATA_CANCEL( ) = "0x827a9c646775bb87"

//PURPOSE: 
STRUCT GAMERS_HANDLES
    GAMER_HANDLE m_GamerHandle
ENDSTRUCT

//PURPOSE: 
STRUCT GAMERS_CLAN_DATA
    GAMER_HANDLE    m_GamerHandle
    INT             m_ClanId
	TEXT_LABEL_31   m_ClanName
	TEXT_LABEL_7    m_ClanTag
ENDSTRUCT

//INFO: Returns TRUE if data retrieval has been started Successfully. Must not be PENDING and data must from 
//        previous requests must be cleared before.
//PARAM NOTES:
//      gamerHandleData - Must be a Struct of gamer handles, for instance GAMERS_HANDLES.
NATIVE FUNC BOOL NETWORK_GET_PRIMARY_CLAN_DATA_START( GAMERS_HANDLES& gamerHandleData[], INT nGamerHandles ) = "0xb3fd534ed90bc3ea"

//INFO: Returns TRUE if data retrieval with NETWORK_GET_PRIMARY_CLAN_DATA_START is pending.
NATIVE FUNC BOOL NETWORK_GET_PRIMARY_CLAN_DATA_PENDING() = "0xa0d4159bb7ca57e7"

//INFO: Returns TRUE if data retrieval with NETWORK_GET_PRIMARY_CLAN_DATA_START has been successfull.
NATIVE FUNC BOOL NETWORK_GET_PRIMARY_CLAN_DATA_SUCCESS() = "0x7a6139e192a01fc6"

//INFO: Returns TRUE if data retrieval with NETWORK_GET_PRIMARY_CLAN_DATA_START has been successfull.
NATIVE FUNC BOOL NETWORK_GET_PRIMARY_CLAN_DATA( GAMERS_CLAN_DATA& gamerClanData[], INT& nGamers ) = "0xcb8d4709cce503ff"

//INFO: Returns TRUE if data retrieval with NETWORK_GET_PRIMARY_CLAN_DATA_START has been successfull.
NATIVE FUNC BOOL NETWORK_GET_PRIMARY_CLAN_DATA_NEW( GAMER_HANDLE& hGamer, NETWORK_CLAN_DESC& memberInfo ) = "0x711a9ee5baf70932"

//INFO: Same as ADD_PED_DECORATION_WITH_HASHES, except for an additional tournament id parameter - used when a tournament winners decal is required
NATIVE PROC NETWORK_ADD_PLAYER_PED_DECORATION(INT CollectionNameHash, INT PresetNameHash, INT tournamentId = 0) = "0x1055997247f64d53"

//INFO: Flags an object to allow local attachments for remotely controlled objects - generally this is a bad thing to do but
//      is necessary in some cases (such as remote players using roller coasters, which use local only objects for the carriages
//PARAM NOTES:
//      EntityIndex - Entity to allow local modification
//      CanModify   - Indicates whether local modifications are allowed
NATIVE PROC NETWORK_ALLOW_REMOTE_ATTACHMENT_MODIFICATION(ENTITY_INDEX EntityIndex, BOOL CanModify) = "0x9ea64d6bf7698fa0"

//INFO: Returns whether an object to allow local attachments for remotely controlled objects - generally this is a bad thing to do but
//      is necessary in some cases (such as remote players using roller coasters, which use local only objects for the carriages
//PARAM NOTES:
//      EntityIndex - Entity to check whether local modification is allowed
NATIVE FUNC BOOL NETWORK_IS_REMOTE_ATTACHMENT_MODIFICATION_REQUIRED(ENTITY_INDEX EntityIndex) = "0xd4212b10090e2418"

//INFO: Retrieve read operation status.
NATIVE FUNC NETWORK_PROFILE_STATS_STATUS NETWORK_PROFILE_STATS_READER_GET_STATUS(  ) = "0x62b8502e363049f5"

//INFO: Done reading and reclaim memory back.
NATIVE PROC NETWORK_PROFILE_STATS_READER_END( ) = "0x85735d6be67b5378"

//INFO: Start reading.
NATIVE FUNC BOOL NETWORK_PROFILE_STATS_READER_START(  ) = "0x56e3f5ef646b5916"

//INFO: Add gamer.
NATIVE FUNC BOOL NETWORK_PROFILE_STATS_READER_ADD_GAMER( GAMER_HANDLE& gamerHandle ) = "0x9c6ae5b6daf4b649"

//INFO: Add stat id.
NATIVE FUNC BOOL NETWORK_PROFILE_STATS_READER_ADD_STATID( STATSENUM keyHash ) = "0xddf4b4c93bc9814c"

//INFO: Retrieve the value for a certain stat. If noValue is set to true then it means the value does not exist yet.
NATIVE FUNC BOOL NETWORK_PROFILE_STATS_READER_GET_STAT_VALUE( STATSENUM keyHash, GAMER_HANDLE& gamerHandle, INT& i_value, FLOAT& f_value, INT& noValue ) = "0x924911e50692ed38"

//INFO: Call to show system message about chat restriction.
NATIVE PROC NETWORK_SHOW_CHAT_RESTRICTION_MSC(PLAYER_INDEX localGamerIndex) = "0x503cfb13397de761"

//INFO: Call to show system message about chat restriction.
NATIVE PROC NETWORK_SHOW_PSN_UGC_RESTRICTION( ) = "0x4ebea6157716da7a"

ENUM PLAYER_REVIEW_MODE
	PLAYER_REVIEW_ALL_PLAYERS,
	PLAYER_REVIEW_TEAM_ONLY
ENDENUM

//INFO: Show the PS5 player review dialog.
//PARAMS:
//	mode    - If all players or only the players on the local players team shoudl be reviewed.
NATIVE PROC NETWORK_SHOW_PLAYER_REVIEW(PLAYER_REVIEW_MODE mode) = "0xe3700a0c2bb5bdfc"

//INFO: Opens the console web browser with the specified url.
NATIVE FUNC BOOL NETWORK_SHOW_WEB_BROWSER(STRING url) = "0xf927a5690fd44650"

// INFO: Checks if title update is required
NATIVE FUNC BOOL NETWORK_IS_TITLE_UPDATE_REQUIRED() = "0x4d0ce705937d9f5c"

// INFO: Properly quits the multiplayer, then shows the confirmation warning.
NATIVE PROC NETWORK_QUIT_MP_TO_DESKTOP() = "0x734f2f6840164511"

//INFO: Returns whether we are connected to the specified player via a relay server connection. This should only be called on remote players.
NATIVE FUNC BOOL NETWORK_IS_CONNECTED_VIA_RELAY(PLAYER_INDEX PlayerIndex) = "0xb06bb95c00f97612"

//INFO: Returns the average one-way latency for messages received from the specified remote player. This should only be called on remote players.
NATIVE FUNC FLOAT NETWORK_GET_AVERAGE_LATENCY(PLAYER_INDEX PlayerIndex) = "0xe872127df9da80af"

//INFO: Returns the average ping time between the local player and the specified remote player. This is the time it takes for a message to be sent
//      and then received, processed and the ACK received. This should only be called on remote players.
NATIVE FUNC FLOAT NETWORK_GET_AVERAGE_PING(PLAYER_INDEX PlayerIndex) = "0xdca10c3f0c7c2585"

//INFO: Returns a packet loss metric for packets send to the specified remote player. This is just a ratio of sync messages acked divided by sync messages sent.
//		This should only be called on remote players.
NATIVE FUNC FLOAT NETWORK_GET_AVERAGE_PACKET_LOSS(PLAYER_INDEX PlayerIndex) = "0x30bcef9a45373f3b"

//INFO: Returns the number of current unacked reliable messages to the specified remote player.
//		This should only be called on remote players.
NATIVE FUNC INT NETWORK_GET_NUM_UNACKED_RELIABLES(PLAYER_INDEX PlayerIndex) = "0x3e660d71ff46a508"

//INFO: Returns the number unreliable messages that have been resent to the specified remote player within a sampling interval
//		This should only be called on remote players.
NATIVE FUNC INT NETWORK_GET_UNRELIABLE_RESEND_COUNT(PLAYER_INDEX PlayerIndex) = "0x4ca7fa6467bc236a"

//INFO: Returns the higest number of times a reliable message currently on the queue has been resent to a remote player (the player
//		will be disconnected if it gets too high)
//		This should only be called on remote players.
NATIVE FUNC INT NETWORK_GET_HIGHEST_RELIABLE_RESEND_COUNT(PLAYER_INDEX PlayerIndex) = "0xd0304299f1734942"

STRUCT NET_SIGNALLING_INFO
	INT m_TotalMemSize
	INT m_CurrentMemUsage
	INT m_MaxMemUsage
ENDSTRUCT

STRUCT NET_STATISTICS_INFO
	INT m_KernelMemFreeSize
	INT m_KernelMemFreeMin
	INT m_PacketCount
	INT m_PacketQosCount
	INT m_LibNetFreeSize
	INT m_LibNetFreeMin
ENDSTRUCT

NATIVE PROC NETWORK_DUMP_NET_IF_CONFIG() = "0xb11f288de4ec5dc9"
NATIVE PROC NETWORK_GET_NET_STATISTICS_INFO(NET_STATISTICS_INFO& info) = "0xf93a1a140a08d563"
NATIVE PROC NETWORK_GET_SIGNALLING_INFO(NET_SIGNALLING_INFO& info) = "0x8a1270c53f7b3a9c"

//INFO: Returns the PlayerAccountId of the given player. This is a persistent unique identifier received from ROS in our credentials.
NATIVE FUNC INT NETWORK_GET_PLAYER_ACCOUNT_ID(PLAYER_INDEX playerIndex) = "0xe6dc7ee71bce8000"


#IF FEATURE_GEN9_STANDALONE

// !!! Must match code value of MAX_SECONDARY_ACTORS (minus buffer) !!!
CONST_INT MAX_SECONDARY_ACTORS 8

STRUCT ACTIVITY_SECONDARY_ACTORS
	STRING m_SecondaryActors[MAX_SECONDARY_ACTORS]
ENDSTRUCT

// !!! Must match code value of MAX_ACTIVITY_TASKS (minus buffer) !!!
CONST_INT MAX_ACTIVITY_TASKS 32

STRUCT ACTIVITY_TASK_STATUS
	STRING m_InProgressTasks[MAX_ACTIVITY_TASKS]
	STRING m_CompletedTasks[MAX_ACTIVITY_TASKS]
ENDSTRUCT

ENUM UDS_UPDATE_MODE
	UDS_UPDATE_MODE_FULL,
	UDS_UPDATE_MODE_DELTA
ENDENUM

// !!! Must match code value of MAX_AVAILABILITY_ACTIVITIES (minus buffer) !!!
CONST_INT MAX_AVAILABILITY_ACTIVITIES 64

STRUCT ACTIVITY_AVAILABLITY_DATA
	STRING m_AvailableActivities[MAX_AVAILABILITY_ACTIVITIES]
	STRING m_UnavailableActivities[MAX_AVAILABILITY_ACTIVITIES]
	UDS_UPDATE_MODE m_UpdateMode
ENDSTRUCT

// !!! Must match code value of MAX_PRIORITISED_ACTIVITIES (minus buffer) !!!
CONST_INT MAX_PRIORITISED_ACTIVITIES 128

STRUCT ACTIVITY_PRIORITY_CHANGE_DATA
	STRING m_ActivityIdStrings[MAX_PRIORITISED_ACTIVITIES]
	INT m_ActivityPriorities[MAX_PRIORITISED_ACTIVITIES] // Value range -128 to 128, higher number means higher priority
ENDSTRUCT

//!!! DO NOT CHANGE THIS ORDER, DICTATED BY BACKEND SETUP !!!
ENUM UDS_ACTIVITY_END_REASON
	UDS_ACTIVITY_END_REASON_NONE,
	UDS_ACTIVITY_END_REASON_COMPLETED,
	UDS_ACTIVITY_END_REASON_FAILED,
	UDS_ACTIVITY_END_REASON_ABANDONED
ENDENUM

CONST_INT RL_PRESENCE_ACTIVITY_INVALID_DIFFICULTY -1
CONST_INT RL_PRESENCE_ACTIVITY_INVALID_SCORE -1

//INFO: Populate and post UDS activityStart event
//PARAM NOTES:
//		activityId - Specifies the object ID of activity when the player starts. (Required)
//		primaryActorId - Specifies the object ID of actor (primary actor). (Optional)
//		secondaryActors - Contains object IDs of secondary actors. (Optional)
NATIVE PROC NETWORK_POST_UDS_ACTIVITY_START(STRING activityId) = "0xc81704a9680b971d"

NATIVE PROC NETWORK_POST_UDS_ACTIVITY_START_WITH_ACTORS(STRING activityId, STRING primaryActorId, ACTIVITY_SECONDARY_ACTORS& secondaryActors) = "0x92b3edec07bcd480"

//INFO: Populate and post UDS activityEnd event
//PARAM NOTES:
//		activityId - Specifies the object ID of activity when the player ends. (Required)
//		iOutcome - Specifies the outcome in order to report the result when the activity ends. Values that can be specified are (see UDS_ACTIVITY_END_REASON) (Optional)
//		iScore - Specifies the score when the activity ends. (Optional)
NATIVE PROC NETWORK_POST_UDS_ACTIVITY_END(STRING activityId, UDS_ACTIVITY_END_REASON iOutcome = UDS_ACTIVITY_END_REASON_NONE, INT iScore = RL_PRESENCE_ACTIVITY_INVALID_SCORE) = "0x9faff35541af6351"

//INFO: Populate and post UDS activityResume event
//PARAM NOTES:
//		activityId - Specifies the object ID of activity that is active. (Required)
//		taskStatus - Contains status of tasks and sub-tasks as either in progress or completed. (Optional)
NATIVE PROC NETWORK_POST_UDS_ACTIVITY_RESUME(STRING activityId) = "0xae7d878126959d27"

NATIVE PROC NETWORK_POST_UDS_ACTIVITY_RESUME_WITH_TASKS(STRING activityId, ACTIVITY_TASK_STATUS& taskStatus) = "0xb6ee0f6133d81273"

NATIVE PROC NETWORK_POST_UDS_ACTIVITY_AVAILABILITY_CHANGE(ACTIVITY_AVAILABLITY_DATA& availablityData) = "0x0b0f9169d0200e5c"

NATIVE PROC NETWORK_POST_UDS_ACTIVITY_PRIORITY_CHANGE(ACTIVITY_PRIORITY_CHANGE_DATA& priorityChangeData) = "0x1297a10a4fa73c6d"

//INFO: Resets all activities for user to a not started state, clears all current activity progress
NATIVE PROC NETWORK_POST_UDS_ACTIVITY_TERMINATE() = "0x221fe5a7c24e1cfd"

#ENDIF

// SC MEMBERSHIP 

STRUCT NET_SC_MEMBERSHIP_INFO
	BOOL m_HasMembership
	INT m_MembershipStartPosix
	INT m_MembershipEndPosix
ENDSTRUCT

ENUM NET_SC_MEMBERSHIP_EVENT_TYPE
	MEMBERSHIP_EVENT_TYPE_STATUS_RECEIVED,
	MEMBERSHIP_EVENT_TYPE_STATUS_CHANGED
ENDENUM

// data for EVENT_NETWORK_SC_MEMBERSHIP_STATUS event
// for MEMBERSHIP_EVENT_TYPE_STATUS_RECEIVED, the previous information will be invalid (false, 0, 0)
STRUCT NET_SC_MEMBERSHIP_STATUS_EVENT_DATA
	NET_SC_MEMBERSHIP_EVENT_TYPE EventType
	NET_SC_MEMBERSHIP_INFO MembershipInfo
	NET_SC_MEMBERSHIP_INFO PrevInfo
ENDSTRUCT

ENUM NET_SC_BENEFITS_EVENT_TYPE
	BENEFITS_EVENT_TYPE_BENEFITS_CLAIMED
ENDENUM

// data for EVENT_NETWORK_SC_BENEFITS_STATUS event
STRUCT NET_SC_BENEFITS_STATUS_EVENT_DATA
	NET_SC_BENEFITS_EVENT_TYPE EventType
	INT NumBenefits
	INT BenefitValue
ENDSTRUCT

NATIVE FUNC BOOL NETWORK_HAS_SC_MEMBERSHIP_INFO() = "0x553c1673b308873f"
NATIVE FUNC BOOL NETWORK_HAS_SC_MEMBERSHIP() = "0xdb04a0452c496eb1"
NATIVE PROC NETWORK_GET_SC_MEMBERSHIP_INFO(NET_SC_MEMBERSHIP_INFO& info) = "0xb84c3659a0012ec9"
NATIVE FUNC BOOL NETWORK_CAN_SC_MEMBERSHIP_EXPIRE() = "0x0d9dd8fcf803b414"
NATIVE FUNC BOOL NETWORK_HAS_SHOWN_MEMBERSHIP_WELCOME() = "0x6c1e73dfcbe2a0ce"

// UGC UI METRIC

NATIVE PROC NETWORK_UGC_NAV(INT feature, INT location) = "0x8b2712081f047817"

// eof

