USING "rage_builtins.sch"
USING "types.sch"
USING "event_enums.sch"
USING "pickup_enums.sch"
USING "commands_player.sch"

//PURPOSE: Structure representing a gamer handle
// This should not be used directly in script
STRUCT GAMER_HANDLE
    INT	Data1
	INT	Data2
	INT	Data3
	INT	Data4
	INT	Data5
	INT	Data6
	INT	Data7
	INT	Data8
	INT	Data9
	INT	Data10
	INT	Data11
	INT	Data12
	INT	Data13
ENDSTRUCT


ENUM SCRIPT_EVENT_QUEUES
	SCRIPT_EVENT_QUEUE_AI,
	SCRIPT_EVENT_QUEUE_NETWORK,
	SCRIPT_EVENT_QUEUE_ERRORS,
	NUM_SCRIPT_EVENT_QUEUES
ENDENUM

//~> Event structures that can be used to retrieve data from the AI events

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_AI_ENTITY_DAMAGED.
//          - EVENT_AI_ENTITY_DESTROYED.
STRUCT STRUCT_ENTITY_ID
	ENTITY_INDEX	EntityId
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//			- EVENT_AI_PLAYER_UNABLE_TO_ENTER_VEHICLE.
STRUCT STRUCT_VEHICLE_ID
	VEHICLE_INDEX	VehicleId
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//			- EVENT_STAT_VALUE_CHANGED.
STRUCT STRUCT_STAT_HASH
	INT	StatHash
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//			- EVENT_CRIME_REPORTED
STRUCT STRUCT_CRIME_REPORTED
	BOOL			ChangedWantedLevel
	CRIME_TYPE		CrimeType
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//			- EVENT_PED_SEEN_DEAD_PED.
STRUCT STRUCT_DEAD_PED_SEEN
	PED_INDEX	DeadPedId
	PED_INDEX	FindingPedId
ENDSTRUCT

//~> Event structures that can be used to retrieve data from the network events

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_PLAYER_JOIN_SESSION.
//          - EVENT_NETWORK_PLAYER_LEFT_SESSION.
//          - EVENT_NETWORK_PLAYER_SPAWN.
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
//STRUCT STRUCT_PLAYER_SESSION_EVENTS
//
//	TEXT_LABEL_23	PlayerName
//	PLAYER_INDEX	PlayerIndex
//	INT				PlayerTeam
//
//ENDSTRUCT

ENUM PLAYER_SOURCE
	SOURCE_NORMAL,
	SOURCE_TRANSITION,
	SOURCE_STORE
ENDENUM

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_PLAYER_JOIN_SCRIPT.
//          - EVENT_NETWORK_PLAYER_LEFT_SCRIPT.
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
STRUCT STRUCT_PLAYER_SCRIPT_EVENTS

	TEXT_LABEL_63		PlayerName
	PLAYER_INDEX		PlayerIndex
	INT					PlayerTeam
	PLAYER_SOURCE		nSource			// where did the player come from / going to
	INT					NumThreads
	THREADID			Threads[20]	
	GAMER_HANDLE	 	hPlayer			// If a player left there was no way script could retrieve this value
	INT					PlayerFlags		// Bit shifted value for different player flags. BIT 0 = Is Player a Boss
	INT					nBailReason		// If a player left this will provide why. -1 = unknown/invalid reason
ENDSTRUCT

//PURPOSE: Response from host when joining a session
//		   Comments next to the types that script might consider relaying to the user on failing to join an
//		   invite session. For others, check with code or display general message
//		   
ENUM NETWORK_REASON_PED_LEFT_BEHIND
	REASON_DEFAULT,              // Triggered in a normal leave ped behind.
	REASON_PLAYER_LEFT_SESSION   // Triggered when player leaves the session.
ENDENUM

//PURPOSE: This structure can be used to retrieve information from these events: 
//          - EVENT_NETWORK_PED_LEFT_BEHIND
//          - Possible Reasons are:
//             ... REASON_DEFAULT
//             ... REASON_PLAYER_LEFT_SESSION
STRUCT STRUCT_PED_LEFT_BEHIND

	PED_INDEX  pedIndex
	INT        Reason     // see possible reason in NETWORK_REASON_PED_LEFT_BEHIND

ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_BROADCAST_VARIABLES_UPDATED.
STRUCT STRUCT_BROADCAST_VARIABLES_UPDATED

	THREADID	Thread	
	INT 		Type		// PlayerBroadcast or HostBroadcast, depending what type of broadcast variables were updated

ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_DAMAGE_ENTITY.
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
STRUCT STRUCT_ENTITY_DAMAGE_EVENT

	ENTITY_INDEX	VictimIndex
	ENTITY_INDEX	DamagerIndex
	FLOAT           Damage
	FLOAT           EnduranceDamage
	BOOL			VictimIncapacitated
	BOOL            VictimDestroyed
	INT             WeaponUsed
	FLOAT           VictimSpeed
	FLOAT           DamagerSpeed
	BOOL            IsResponsibleForCollision //TRUE if the damager is responsible for the collision - Only set on vehicle collisions.
	BOOL            IsHeadShot // TRUE if the damage is a headshot.
	BOOL            IsWithMeleeWeapon // TRUE if the damage is "with melee" - using a whip will set this to true.
	INT				HitMaterial // 8 bit material id

ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_PLAYER_COLLECTED_PICKUP.
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
STRUCT STRUCT_PICKUP_EVENT

	PICKUP_INDEX PickupIndex
	PLAYER_INDEX PlayerIndex
	PICKUP_TYPE  PickupType
	INT 	     PickupAmount
	MODEL_NAMES	 PickupCustomModel
	INT			 PickupCollected
	 
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_PLAYER_COLLECTED_AMBIENT_PICKUP.
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
STRUCT STRUCT_AMBIENT_PICKUP_EVENT

	PICKUP_TYPE  PickupType
	INT 	     PickupAmount
	PLAYER_INDEX PlayerIndex
	MODEL_NAMES	 PickupModel	
	BOOL		 PlayerGift 
	BOOL		 DroppedByPed 
	INT			 PickupCollected
	INT			 PickupIndex
	
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_PLAYER_COLLECTED_PORTABLE_PICKUP.
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
STRUCT STRUCT_PORTABLE_PICKUP_EVENT

	OBJECT_INDEX  PickupID
	NETWORK_INDEX PickupNetID
	PLAYER_INDEX  PlayerIndex
	MODEL_NAMES	  PickupModel	 
	
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_PICKUP_RESPAWNED.
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
STRUCT STRUCT_PICKUP_RESPAWN_EVENT

	PICKUP_INDEX PickupIndex
	PICKUP_TYPE  PickupType
	MODEL_NAMES	 PickupModel	
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_INVITE_ARRIVED.
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
STRUCT STRUCT_INVITE_ARRIVED_EVENT

	INT InviteIndex
	INT GameMode
	BOOL IsFriend
	
ENDSTRUCT

ENUM SESSION_TYPE
	SESSION_TYPE_GAME,
	SESSION_TYPE_TRANSITION
ENDENUM

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_INVITE_ACCEPTED.
//          - EVENT_NETWORK_INVITE_CONFIRMED.
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.

ENUM INVITE_FLAGS
	INVITE_PLATFORM,
	INVITE_JVP,
	INVITE_VIA_PARTY,
	INVITE_VIA_PRESENCE,
	INVITE_SCTV, 
    INVITE_PRIVATE,
    INVITE_PRESENCE_INACTIVE,
    INVITE_FOLLOW
ENDENUM

STRUCT STRUCT_INVITE_EVENT
	GAMER_HANDLE hInviter
	INT GameMode
	SESSION_TYPE SessionType
	BOOL IsViaParty
	INT nAimType
	INT nActivityType
	INT nActivityID
	BOOL bIsSCTV
	INVITE_FLAGS nFlags
	INT nNumBosses
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_SUMMON.
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
STRUCT STRUCT_SUMMON_EVENTS

	INT GameMode
	SESSION_TYPE SessionType
	
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_NETWORK_HOST_MIGRATION, EVENT_NETWORK_ATTEMPT_HOST_MIGRATION
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
//STRUCT STRUCT_SCRIPTED_EVENT_HOST_MIGRATION
//
//	THREADID		Thread	
//	PLAYER_INDEX	HostPlayerIndex // the index of the new host
//	
//ENDSTRUCT

//PURPOSE: Response from host when joining a session
//		   Comments next to the types that script might consider relaying to the user on failing to join an
//		   invite session. For others, check with code or display general message
//		   
ENUM JOIN_RESPONSE_CODE
	RESPONSE_ACCEPT,						// Join successful
	RESPONSE_DENY_UNKNOWN,					// Unknown - Indicates bug - Use Generic Error
	RESPONSE_DENY_WRONG_SESSION,			// Different session - Indicates bug - Use Generic Error 
	RESPONSE_DENY_NOT_HOSTING,				// User not hosting - (might have left and come back) - Use Generic Error
	RESPONSE_DENY_NOT_READY,				// Session still starting - would occur if someone hosted and immediately sent an invite.
											//      We start straight away so this should be very difficult in practice. Use Generic Error
	RESPONSE_DENY_BLACKLISTED,				// Gamer is blacklisted from session
	RESPONSE_DENY_INVALID_REQUEST_DATA,		// Indicates bug - Use Generic Error 
	RESPONSE_DENY_INCOMPATIBLE_ASSETS,		// Different assets 
	RESPONSE_DENY_SESSION_FULL,				// Session is full
	RESPONSE_DENY_GROUP_FULL,				// Selected group is full
	RESPONSE_DENY_WRONG_VERSION,			// Different session - Dev only - Use Generic Error
	RESPONSE_DENY_NOT_VISIBLE,				// Session not visible for Matchmaking - Won't happen for Invites (would be a bug)
											//		Use Generic Error
	RESPONSE_DENY_BLOCKING,					// Session has been blocked for invites by host (this would be set by script and, 
											//		for instance, might be to block players joining during a race)
	RESPONSE_DENY_AIM_PREFERENCE,			// Different aim settings
	RESPONSE_DENY_CHEATER,					// Cheater setting different (either local or session is flagged as cheater)
	RESPONSE_DENY_TIMEOUT,					// Different time out - Dev only - Use Generic Error
	RESPONSE_DENY_DATA_HASH,				// Different data hash - Indicates cloud assets different
	RESPONSE_DENY_CREW_LIMIT,				// Too many crews
	RESPONSE_DENY_POOL_NORMAL,				// Pool we tried to join is NORMAL. Player must be bad sport or cheater
	RESPONSE_DENY_POOL_BAD_SPORT,			// Pool we tried to join is BAD SPORT. Player must be normal or cheater
	RESPONSE_DENY_POOL_CHEATER,				// Pool we tried to join is CHEATER. Player must be normal or bad sport
	RESPONSE_DENY_NOT_JOINABLE,				// Session no longer exists
	RESPONSE_DENY_PRIVATE_ONLY,				// Session has only private slots. Player was not invited. 
	RESPONSE_DENY_DIFFERENT_BUILD,			// Different build type - Dev Only
	RESPONSE_DENY_DIFFERENT_PORT,			// Different socket port - Dev Only
	RESPONSE_DENY_DIFFERENT_CONTENT_SETTING,// Different content setting (online vs. offline)
	RESPONSE_DENY_NOT_FRIEND,               // A player who is not a friend of the host is trying to join a friends-only session
	RESPONSE_DENY_REPUTATION,				// Reputation of players is different (One is bad, other is good). Xbox One only.
	RESPONSE_DENY_FAILED_TO_ESTABLISH,		// Couldn't contact the session. It may no longer exist
	RESPONSE_DENY_PREMIUM,					// Premium session, no access
	RESPONSE_SOLO,							// Solo session
	RESPONSE_DENY_ADMIN_BLOCKED,			// Admin blocked due to no notification
	RESPONSE_DENY_TOO_MANY_BOSSES			// Too many bosses in the session
ENDENUM

//PURPOSE: This structure can be used to retrieve information from these events:
//       - EVENT_NETWORK_JOIN_SESSION_RESPONSE.
STRUCT STRUCT_JOIN_SESSION_RESPONSE

	BOOL bWasSuccessful
	JOIN_RESPONSE_CODE nResponseCode 
	
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_CHEAT_TRIGGERED.

ENUM CHEAT_EVENT_TYPES
   CHEAT_EVENT_INVINCIBLE,
   CHEAT_EVENT_WEAPONS,
   CHEAT_EVENT_HEALTH,
   CHEAT_EVENT_VEHICLE,
   CHEAT_EVENT_WARP
ENDENUM

STRUCT STRUCT_CHEAT_EVENT

	CHEAT_EVENT_TYPES CheatType	
	
ENDSTRUCT



ENUM ARREST_EVENT_TYPES
  	ARREST_EVENT_CUFF_SUCCESSFUL,
  	ARREST_EVENT_CUFF_FAILED,
	ARREST_EVENT_UNCUFF_SUCCESSFUL,
	ARREST_EVENT_UNCUFF_FAILED,
  	ARREST_EVENT_TAKENCUSTODY,
  	ARREST_EVENT_CUSTODY_EXIT_CUSTODIAN_DEAD,
	ARREST_EVENT_CUSTODY_EXIT_ABANDONED,
	ARREST_EVENT_CUSTODY_EXIT_CUSTODIAN_OUTOFRANGE,
	ARREST_EVENT_CUSTODY_EXIT_UNCUFFED,
	ARREST_EVENT_TAKENCUSTODY_FAILED
ENDENUM

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_PLAYER_ARREST.
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
STRUCT STRUCT_PLAYER_ARREST_EVENT

	PED_INDEX arresterIndex
	PED_INDEX arresteeIndex
	ARREST_EVENT_TYPES arrestEventType
	
ENDSTRUCT


//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_PLAYER_ENTERED_VEHICLE.
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
STRUCT STRUCT_PLAYER_ENTERED_VEHICLE_EVENT
	PLAYER_INDEX playerIndex
	VEHICLE_INDEX vehicleIndex
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_PLAYER_ACTIVATED_SPECIAL_ABILITY.
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
STRUCT STRUCT_PLAYER_ACTIVATED_SPECIAL_ABILITY_EVENT
	PLAYER_INDEX playerIndex
	INT specialAbility
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_PLAYER_DEACTIVATED_SPECIAL_ABILITY.
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
STRUCT STRUCT_PLAYER_DEACTIVATED_SPECIAL_ABILITY_EVENT
	PLAYER_INDEX playerIndex
	INT specialAbility
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_PLAYER_SPECIAL_ABILITY_FAILED_ACTIVATION.
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
STRUCT STRUCT_PLAYER_SPECIAL_ABILITY_FAILED_ACTIVATION
	PLAYER_INDEX playerIndex
	INT specialAbility
ENDSTRUCT


//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_TIMED_EXPLOSION.
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
STRUCT STRUCT_TIMED_EXPLOSION_EVENT

	VEHICLE_INDEX nVehicleIndex
	PED_INDEX nCulpritIndex
	
ENDSTRUCT

ENUM BAIL_REASON
	BAIL_FROM_SCRIPT,
	BAIL_FROM_RAG,
	BAIL_PROFILE_CHANGE,
	BAIL_NEW_CONTENT_INSTALLED,
	BAIL_SESSION_FIND_FAILED,
	BAIL_SESSION_HOST_FAILED,
	BAIL_SESSION_JOIN_FAILED,
	BAIL_SESSION_START_FAILED,
	BAIL_SESSION_ATTR_FAILED,
	BAIL_SESSION_MIGRATE_FAILED,
	BAIL_PARTY_HOST_FAILED,
	BAIL_PARTY_JOIN_FAILED,
	BAIL_START_TIMED_OUT,
	BAIL_OUT_OF_MEMORY,
	BAIL_TRANSITION_LAUNCH_FAILED,
	BAIL_END_TIMED_OUT,
	BAIL_MATCHMAKING_TIMED_OUT,
	BAIL_CLOUD_FAILED,
	BAIL_COMPAT_PACK_CONFIG_INCORRECT,
	BAIL_CONSOLE_BAN,
	BAIL_MATCHMAKING_FAILED,
	BAIL_ONLINE_PRIVILEGE_REVOKED,
	BAIL_SYSTEM_SUSPENDED,
	BAIL_EXIT_GAME,
	BAIL_TOKEN_REFRESH_FAILED,
	BAIL_CATALOG_REFRESH_FAILED,
	BAIL_SESSION_REFRESH_FAILED,
	BAIL_SESSION_RESTART_FAILED,
	BAIL_GAME_SERVER_MAINTENANCE,
	BAIL_GAME_SERVER_FORCE_BAIL,
	BAIL_GAME_SERVER_HEART_BAIL,
	BAIL_GAME_SERVER_GAME_VERSION,
	BAIL_CATALOGVERSION_REFRESH_FAILED,
	BAIL_CATALOG_BUFFER_TOO_SMALL,
	BAIL_INVALIDATED_ROS_TICKET
ENDENUM

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_NETWORK_BAIL
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
STRUCT STRUCT_BAIL_EVENT
	BAIL_REASON nBailReason
	INT nBailErrorCode
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_CLOUD_FILE_RESPONSE
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
STRUCT STRUCT_CLOUD_FILE_RESPONSE_EVENT
	INT nRequestID
	BOOL bWasSuccessful
ENDSTRUCT

//PURPOSE: This structure can be use use to retrieve info for 
// 		- EVENT_NETWORK_PRESENCE_STAT_UPDATE
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
STRUCT STRUCT_GAME_PRESENCE_EVENT_STAT_UPDATE
	INT statHash			//  The stat that the update was sent for
	TEXT_LABEL_63 fromGamer //The gamer tag of the gamer from whom the event came from
	INT iValue				// Integer version of the stat if it's a integer stat
	FLOAT fValue			// FLOAT version of the stat if it's a FLOAT stat
	INT iValue2				// 
	TEXT_LABEL_63 szStringValue //More DATA!
ENDSTRUCT

//PURPOSE: These structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_CASH_TRANSACTION_LOG
ENUM eTransactionTypes
		 CASH_TRANSACTION_DEPOSIT
		,CASH_TRANSACTION_WITHDRAW
ENDENUM

ENUM eTransactionIds
		 CASH_TRANSACTION_ATM   //Money deposited/withdrawn by the player - this is relation to VC commands - So deposit or withdraw from BANk Account.
		,CASH_TRANSACTION_GAMER //Money received/paid from friends.
		,CASH_TRANSACTION_STORE //STORE money always credits the BANK account
		,CASH_TRANSACTION_BANK  //BANK account transaction
ENDENUM

STRUCT STRUCT_CASH_TRANSACTION_LOG_EVENT
	INT                 iTransactionId
	eTransactionIds     iId
	eTransactionTypes   iType
	INT                 iAmount
	INT                 ItemId
	GAMER_HANDLE        hGamer
	TEXT_LABEL_63       szStringAmount
ENDSTRUCT


//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_DAMAGE_ENTITY.
//         Should be passed in GET_EVENT_DATA() as the data STRUCT member.
STRUCT STRUCT_VEHICLE_UNDRIVABLE_EVENT

	VEHICLE_INDEX	VehicleId
	ENTITY_INDEX	DamagerIndex
	INT             WeaponUsed

ENDSTRUCT


//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_SHOP_TRANSACTION.
STRUCT STRUCT_SHOP_TRANSACTION_EVENT
	INT 		m_Id
	INT 		m_Type
	INT 		m_ResultCode
	INT 		m_Action
	INT 		m_Serviceid
	INT 		m_Bank
	INT 		m_Wallet
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_STUNT_PERFORMED.
STRUCT STRUCT_STUNT_PERFORMED_EVENT
	INT 		m_StuntType
	FLOAT 		m_Value
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_FIRED_DUMMY_PROJECTILE.
STRUCT STRUCT_NETWORK_FIRED_DUMMY_PROJECTILE_EVENT
	PED_INDEX 		nFiringPedIndex
	ENTITY_INDEX 	nFiredProjectileIndex
	INT 	        nWeaponType
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_NETWORK_FIRED_VEHICLE_PROJECTILE.
STRUCT STRUCT_NETWORK_FIRED_VEHICLE_PROJECTILE_EVENT
	VEHICLE_INDEX 	nFiringVehicleIndex
	PED_INDEX 		nFiringPedIndex
	ENTITY_INDEX 	nFiredProjectileIndex
	INT 	        nWeaponType
ENDSTRUCT

//PURPOSE: This structure can be used to retrieve information from these events:
//          - EVENT_ERRORS_ARRAY_OVERFLOW.
//			- EVENT_ERRORS_INSTRUCTION_LIMIT
//			- EVENT_ERRORS_STACK_OVERFLOW
//			- EVENT_ERRORS_UNKNOWN_ERROR
STRUCT STRUCT_SCRIPT_ERROR
	INT 		m_scriptID
ENDSTRUCT

//INFO: 
//PARAM NOTES:
//PURPOSE: Request a script program to be loaded
NATIVE PROC REQUEST_SCRIPT(STRING scriptname) = "0xaf76a37c80efd1d8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tell the code that this script can safely be removed from memory once there are no instances of it running
NATIVE PROC SET_SCRIPT_AS_NO_LONGER_NEEDED(STRING scriptname) = "0xd195d79715508efa"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the script program is in memory
NATIVE FUNC BOOL HAS_SCRIPT_LOADED(STRING scriptname) = "0xf79f112ce5999680"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the script file can be found on disc
NATIVE FUNC BOOL DOES_SCRIPT_EXIST(STRING scriptname) = "0x11adef87bad88f70"


//PURPOSE: Request a script program to be loaded.
// Does the same as REQUEST_SCRIPT but takes an integer containing the hash of the script name instead of the name as a string.
NATIVE PROC REQUEST_SCRIPT_WITH_NAME_HASH(INT hashOfScriptName) = "0x251c5c1ddc74d01d"

//PURPOSE: Tell the code that this script can safely be removed from memory once there are no instances of it running. 
// Does the same as SET_SCRIPT_AS_NO_LONGER_NEEDED but takes an integer containing the hash of the script name instead of the name as a string.
NATIVE PROC SET_SCRIPT_WITH_NAME_HASH_AS_NO_LONGER_NEEDED(INT hashOfScriptName) = "0xd48ac12d763bbe7f"

//PURPOSE: Returns TRUE if the script program is in memory.
// Does the same as HAS_SCRIPT_LOADED but takes an integer containing the hash of the script name instead of the name as a string.
NATIVE FUNC BOOL HAS_SCRIPT_WITH_NAME_HASH_LOADED(INT hashOfScriptName) = "0x095032c22dee1587"

//PURPOSE: Returns TRUE if the script file can be found on disc
// Does the same as DOES_SCRIPT_EXIST but takes an integer containing the hash of the script name instead of the name as a string.
NATIVE FUNC BOOL DOES_SCRIPT_WITH_NAME_HASH_EXIST(INT hashOfScriptName) = "0xff09675ec057a8d2"


//INFO: 
//PARAM NOTES:
//PURPOSE: Stops a thread running and deletes it
NATIVE PROC TERMINATE_THREAD(THREADID thread) = "0x5b71484d4dac41e5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the thread is still running
NATIVE FUNC BOOL IS_THREAD_ACTIVE(THREADID thread) = "0x87c0da419f19ff57"

//PURPOSE: Returns the name of the script. Returns an empty string if the id does not refer to a valid script
NATIVE FUNC STRING GET_NAME_OF_SCRIPT_WITH_THIS_ID(THREADID thread) = "0xfcc2c8d6f42dbd7e"

//PURPOSE: Call this before the first call to SCRIPT_THREAD_ITERATOR_GET_NEXT_THREAD_ID each frame to reset the array index to 0
NATIVE PROC SCRIPT_THREAD_ITERATOR_RESET() = "0x27053be21ec6a549"

//PURPOSE: Returns the Thread Id of the next valid script and then moves the array index on to the next entry ready for the next call to this command. Returns NULL when the end of the array is reached
NATIVE FUNC THREADID SCRIPT_THREAD_ITERATOR_GET_NEXT_THREAD_ID() = "0x2b33daa8227a8dae"


//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the ID of this thread
NATIVE FUNC THREADID GET_ID_OF_THIS_THREAD() = "0x69ce66b03b2184eb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Terminates this script
NATIVE PROC TERMINATE_THIS_THREAD() = "0xafbdf6a5e54114c1"

//PURPOSE: Replacement for GET_NUMBER_OF_THREADS_RUNNING_THIS_SCRIPT. Should be faster.
NATIVE FUNC INT GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(INT HashOfScriptName) = "0xb4c854dd86e40fda"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the name of the script that calls this command
NATIVE FUNC STRING GET_THIS_SCRIPT_NAME() = "0x05cba41180f5d521"

//PURPOSE: Returns the hash of the name of the script that calls this command
NATIVE FUNC INT GET_HASH_OF_THIS_SCRIPT_NAME() = "0x1307d54181723a6e"

//PURPOSE: Returns true if this script is a world point script. Also returns the positionHash used to identify the script.
NATIVE FUNC BOOL IS_THIS_SCRIPT_A_WORLD_POINT_SCRIPT(INT& positionHash) = "0xe7d485c11e8cd1d7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the number of events in the given script queue.
NATIVE FUNC INT GET_NUMBER_OF_EVENTS(SCRIPT_EVENT_QUEUES eventQueue) = "0x9418088815c89d59"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns TRUE if the given type of event is on the given event queue
NATIVE FUNC BOOL GET_EVENT_EXISTS(SCRIPT_EVENT_QUEUES eventQueue, EVENT_NAMES eventType) = "0x32c089fafda9ba2f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the type of the event located at the given index on the given event queue.
NATIVE FUNC EVENT_NAMES GET_EVENT_AT_INDEX(SCRIPT_EVENT_QUEUES eventQueue, INT eventIndex) = "0xb1d84e0ef6979085"

//INFO: 
//PARAM NOTES: 
//PURPOSE:  Retrieves data from the event. One of the structures defined about is passed in and filled out.
NATIVE FUNC BOOL GET_EVENT_DATA(SCRIPT_EVENT_QUEUES eventQueue, INT eventIndex, STRUCT &data, INT dataSize) = "0x92039f20b184ab4d"

//INFO: 
//PARAM NOTES: 
//   eventType    - type of the event so that you can have difference sizes for the event data.
//   data         - data
//   sizeOfData   - size of the data being sent.
//   playerFlags  - Only used in network game. Each bit of the int corresponds to a player id.
//                   So this 00000000 00000000 00000000 00010000 the event is sent to player with ID 4.
//					If playerFlags is 0 then this event is only triggered locally.
//PURPOSE:  Sets an event as processed so that the event is removed from the queue.
NATIVE PROC TRIGGER_SCRIPT_EVENT(SCRIPT_EVENT_QUEUES eventQueue, STRUCT &data, INT sizeOfData, INT playerFlags = 0) = "0xa29c2ecc2c86354d"

//INFO: 
//PARAM NOTES: 
//PURPOSE:  Retrieves data from the event. One of the structures defined about is passed in and filled out.
NATIVE FUNC INT CONVERT_FILENAME_TO_INT(STRING filename) = "0xe60c4631a160725b"

//INFO: 
//PARAM NOTES: 
//PURPOSE:  Retrieves data from the event. One of the structures defined about is passed in and filled out.
NATIVE PROC SHUTDOWN_LOADING_SCREEN() = "0xcdee827e5ce50ca4"


//INFO: 
//PARAM NOTES: 
//PURPOSE:  Stop the game from using the actual loading screen. to be used when displaying script command while loading data. USE WITH EXTREME CARE.
NATIVE PROC SET_NO_LOADING_SCREEN(BOOL state) = "0x94b5910a9c945688"

//INFO: 
//PARAM NOTES: 
//PURPOSE:  Returns the last value passed to SET_NO_LOADING_SCREEN - I.e. this function will return TRUE if there is no loading screen.
NATIVE FUNC BOOL GET_NO_LOADING_SCREEN() = "0x1088b18071adccbd"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Set the loading screen to use the blank context.
NATIVE FUNC BOOL SET_LOADING_SCREEN_BLANK() = "0x8a519a9f853aba8d"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns true if the loading screen is to use the blank context.
NATIVE FUNC BOOL GET_LOADING_SCREEN_BLANK() = "0xf29489825d441421"

//INFO: 
//PARAM NOTES: 
//PURPOSE:   Commit to the players selection of multiplayer or single player on the loading screen.
//           (This will also hide the button which can't be selected after this call)
NATIVE PROC COMMIT_TO_LOADINGSCREEN_SELCTION() = "0xc8fc2af21935c18e"

//INFO: 
//PARAM NOTES: 
//PURPOSE:   Returns wether the user has comitted to a selection so further inputs should be ignored.
NATIVE FUNC BOOL IS_LOADINGSCREEN_COMMITTED_TO_SELECTION() = "0xa93c974ce6ca9e38"

// --- Background Scripts --------------------------------------------------------------------------------------------------------------
// -- DO NOT CHANGE without also changing BackgroundScripts.h -----------------------------
ENUM BG_SCRIPT_TYPES
	SCRIPT_TYPE_UNKNOWN = -1,
	SCRIPT_TYPE_UTIL
ENDENUM

STRUCT launch_Data
	INT id
	BG_SCRIPT_TYPES scriptType
ENDSTRUCT

STRUCT EventReceivedCash
	INT characterId
	INT cashAmount
ENDSTRUCT


/// PURPOSE: 
///    Sets the state of the context, so background scripts will know if they should run or not.
/// PARAMS:
///    context - The context to affect
NATIVE PROC BG_START_CONTEXT_HASH(INT context) = "0x3b4d9908a204de37"
NATIVE PROC BG_END_CONTEXT_HASH(INT context) = "0x24b10d7aa3a45b84"
NATIVE PROC BG_START_CONTEXT(STRING context) = "0x6eebdda01d438e11"
NATIVE PROC BG_END_CONTEXT(STRING context) = "0xd08d25cbd7b14310"

/// PURPOSE:
///    Checks if the exit flag for the current script is set. If so, break out of the main loop and start cleaning up.
/// RETURNS:
///    TRUE if the exit flag is set
NATIVE FUNC BOOL BG_IS_EXITFLAG_SET() = "0x6231d60cba3296d1"

/// PURPOSE:
///    Sets the exit flag response. This lets code know that the script successfully exited and didn't get stuck in a loop during clean up.
NATIVE PROC BG_SET_EXITFLAG_RESPONSE() = "0x5fec2fc5ade05110"

/// PURPOSE: 
///    Returns true if he param exists for the script.
NATIVE FUNC BOOL BG_DOES_LAUNCH_PARAM_EXIST(INT bgScriptId, STRING paramName) = "0x82b35eceebc89fa3"

/// PURPOSE: 
///    Returns the value of the param if it exists, or 0.
NATIVE FUNC INT BG_GET_LAUNCH_PARAM_VALUE(INT bgScriptId, STRING paramName) = "0xe5538467850e2536"

/// PURPOSE: 
///    Returns script ID of the script when the given name hash.  returns -1 if not found.
NATIVE FUNC INT BG_GET_SCRIPT_ID_FROM_NAME_HASH(INT scriptNameHash) = "0x9da3bf7ed82b02c6"

NATIVE PROC SEND_TU_SCRIPT_EVENT(SCRIPT_EVENT_QUEUES eventQueue, STRUCT &data, INT sizeOfData, INT playerFlags = 0) = "0x2700c00f82c16bf0"
