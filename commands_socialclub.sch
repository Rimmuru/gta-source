USING "types.sch"
USING "commands_network.sch"

////////////////////////////////////////////////////////////////////////////////////////////////////////
//			Support for processing the Social Club Inbox (aka rlInbox).
//
//
//
HASH_ENUM INBOX_MSG_TYPE
	INVALID = 0,
	StatUpdate,
	FriendCrewJoined,
	FriendCreatedCrew,
	mission_verified,
	rockstar_message,
	crew_message,
	UGCStatUpdate,
	game_award,
	crew_challenge_ended,
	mission_published,
	bounty,
	tournament_winner_message,
	gs_award
ENDENUM

//PURPOSE: Gets the number of 'new' messages that have been received to the inbox.
//         'New' implies that the message has been newly recieved locally by the inbox system
NATIVE FUNC INT SC_INBOX_GET_NUM_NEW_MESSAGES() = "0x9b98ce8028ae2ec7"

//PURPOSE: 
//	Get the total number of messages in the inbox available to be processed
//NOTE: 
//	This number may change (bigger or smaller) as we refresh our local inbox
NATIVE FUNC INT SC_INBOX_GET_TOTAL_NUM_MESSAGES() = "0x760892c3297ba019"

//PURPOSE: 
//	Get's the 'type' of message at the given index.
NATIVE FUNC INBOX_MSG_TYPE SC_INBOX_GET_MESSAGE_TYPE_AT_INDEX(INT msgIndex) = "0x905892ad8906fdda"

//PURPOSE:
//	Check to see if the message at this index is read
NATIVE FUNC BOOL SC_INBOX_GET_MESSAGE_IS_READ_AT_INDEX(INT msgIndex) = "0x3f17eb622eb3d931"

//PURPOSE:
//	Check if the inbox message at this index is valid (i.e. is there a message in that index)
NATIVE FUNC BOOL SC_INBOX_GET_MESSAGE_IS_VALID_AT_INDEX(INT msgIndex) = "0x89d49e095fd8336c"

//PURPOSE:
//	Marks the inbox message at the given index a LOCALLY read...as a way to locally mark that the 
//		message has been processed.  Next time the inbox is locally cleaned, the read messages are purged.
NATIVE FUNC BOOL SC_INBOX_SET_MESSAGE_AS_READ_AT_INDEX(INT msgIndex) = "0x4d50e76db46856be"

//PURPOSE: 
//	Retrieve the given named value of the given type from the message at the given index.
//PARAMS:	
// 	msgIndex: index of the message in the inbox 
// 	name:	  name of teh varialbe/value in the message
// 	value:	  The value of the variables if found and set
//RETUTRN:
// True if teh value is found and set, otherwise false
//
NATIVE FUNC BOOL SC_INBOX_MESSAGE_GET_DATA_INT(INT msgIndex, STRING name, INT& value) = "0x53e079a99d1d5d10"
NATIVE FUNC BOOL SC_INBOX_MESSAGE_GET_DATA_FLOAT(INT msgIndex,STRING name, FLOAT& value) = "0xe0e10f370ddf4eeb"
NATIVE FUNC BOOL SC_INBOX_MESSAGE_GET_DATA_BOOL(INT msgIndex, STRING name) = "0x2ac15d104b353af3"
NATIVE FUNC BOOL SC_INBOX_MESSAGE_GET_DATA_STRING(INT msgIndex,STRING name, TEXT_LABEL_63& value) = "0x6ddf5a0c0be5196f"

//PURPOSE: Post ship support to get the raw name of the message type, so we don't necessarily need to ahve it defined in the enum
NATIVE FUNC STRING SC_INBOX_MESSAGE_GET_RAW_TYPE_AT_INDEX(INT msgIndex) = "0xcc8ccc7d32770f5b"

//PURPOSE:  
//	Most Inbox messages have custom handlers in code.  Use this function to trigger it on the given message
//RETURNS:
//	True if the message is a deffined message and is handled.
NATIVE FUNC BOOL SC_INBOX_MESSAGE_DO_APPLY(INT mgsIndex) = "0xd6e798eb9f6b8156"

HASH_ENUM SCMSG_SENDTYPE_ENUM
	SC_Send_AllFriends,
	SC_Send_Crew,
	SC_Send_RecipList //Uses recipiants from SC_INBOX_MESSAGE_PUSH_GAMER_T0_RECIP_LIST
ENDENUM

//PURPOSE:  
//	Messages are limited to 32 recipients - call this before SC_INBOX_MESSAGE_PUSH_GAMER_T0_RECIP_LIST
//  to make sure we have room
//RETURNS:
//	True if the message if we have room
NATIVE FUNC BOOL SC_INBOX_CAN_PUSH_GAMER_TO_RECIP_LIST() = "0xd77319f56db0ebb8"

//PURPOSE:
//	Push this gamer into the recipient list used to send INBOX messages
//NOTE:
//  Call this function a bunch of times to put together the list, then call 
//	an INBOX_SEND function.  The list is cleared each time the list is used 
//	to send a message
NATIVE PROC SC_INBOX_MESSAGE_PUSH_GAMER_T0_RECIP_LIST(GAMER_HANDLE &hGamer) = "0x52ebd349a5063d3f"

///
// UGC Inbox Msg
//
STRUCT UGCStateUpdate_Data
	TEXT_LABEL_31 tl31MissionContentId
	INT			  Score
	INT			  Score2
	
	//For sending, sender info is is filled in by code.
	TEXT_LABEL_31 tl31SenderGamerTag
	GAMER_HANDLE  hSenderGamer
	
	TEXT_LABEL_63 tl31MissionName
	TEXT_LABEL_31 tl31CoPlayerName
	INT 		  MissionType
	INT 		  MissionSubType
	INT			  Laps
	BOOL		  bSwapSenderWithCoPlayer
ENDSTRUCT

// PURPOSE:
//		Send a UGCStatUpdate event to the inboxes of the recipient list created with 
//			SC_INBOX_MESSAGE_PUSH_GAMER_T0_RECIP_LIST
// PARAMS:
//		ugcdata - UGCStateUpdate_Data filled out wit the necessay data
NATIVE PROC SC_INBOX_SEND_UGCSTATUPDATE_TO_RECIP_LIST(UGCStateUpdate_Data& ugcdata ) = "0x206bb1e46df7a9e6"

// PURPOSE:
//	For UGCStatUpdate messages, get the data associated with that message
// PARAMS:
//	index - index of the Inbox message to get the data off of.  It should be of type UGCStatUpdate
//  out_data - struct that will be filled with the data of the message
// RETURNS:
//	True if the message exists, is the right type, and out_data was filled.	
NATIVE FUNC BOOL SC_INBOX_MESSAGE_GET_UGCDATA(INT index, UGCStateUpdate_Data& out_data) = "0x0110e2cc5c76c791"

//
//	Award Message
//

// PURPOSE:
// For sending a GameAward message to our friend, crew, or a specific recipiant list
// PARAMS:
//	sendType - specify the send type to use from the SCMSG_SENDTYPE_ENUM
NATIVE FUNC BOOL SC_INBOX_SEND_AWARD_MSG(SCMSG_SENDTYPE_ENUM sendType, STRING awardType, FLOAT amount) = "0x4f37752cba432541"


//
//	Bounty Message
//

STRUCT scrBountyInboxMsg_Data
	TEXT_LABEL_31 tl31FromGamerTag
	TEXT_LABEL_31 tl31TargetGamerTag
	INT iOutcome
	INT iCash
	INT iRank
	INT iTime
ENDSTRUCT

// PURPOSE:
//	For sending a bounty completed notification message to the gamer's in teh recipiant 
//		list, as created with SC_INBOX_MESSAGE_PUSH_GAMER_T0_RECIP_LIST
// PARAMS:
//	A filled out scrBountyInboxMsg_Data object to be serialized and sent
NATIVE FUNC BOOL SC_INBOX_SEND_BOUNTY_TO_RECIP_LIST(scrBountyInboxMsg_Data& pBountyData) = "0x617ddc361a45b42b"

// PURPOSE:
//  For getting the data of a bounty messag that is at the given index in the inbox queue
// PARAMS:
//	index - inbox message queue index
//	BountyData - data from the inbox message for this bounty msg.
NATIVE FUNC BOOL SC_INBOX_GET_BOUNTY_DATA_AT_INDEX(INT index, scrBountyInboxMsg_Data& BountyData) = "0x86251d087efda1b1"

//
//	Emails
//

STRUCT scrEmail_Data
	INT					Id
	INT					CreatePosixTime
	TEXT_LABEL_31		SenderName
	GAMER_HANDLE		SenderHandle
	TEXT_LABEL_63		Subject[2]
	TEXT_LABEL_63		Contents[16]
	INT					Image
ENDSTRUCT

ENUM eEMAIL_RETRIEVAL_STATUS
	EMAIL_RETRIEVAL_NONE,
	EMAIL_RETRIEVAL_PENDING,
	EMAIL_RETRIEVAL_FAILED,
	EMAIL_RETRIEVAL_SUCCEEDED,
	EMAIL_RETRIEVAL_CANCELLED
ENDENUM	

// PURPOSE:
//  For retrieving emails from the social club server
// PARAMS:
//	startIndex - the first index of the emails (0 being most recent)
//	numEmails - the number of emails to retrieve from the first index
NATIVE PROC SC_EMAIL_RETRIEVE_EMAILS(INT startIndex, INT numEmails) = "0x2ba03554ad79aa4c"

// PURPOSE:
//  Returns the retrieval status after SC_EMAIL_RETRIEVE_EMAILS has been called
NATIVE FUNC eEMAIL_RETRIEVAL_STATUS SC_EMAIL_GET_RETRIEVAL_STATUS() = "0x3eaddb16d5bd2cba"

// PURPOSE:
//  Returns the number of retrieved emails (from the call to SC_EMAIL_GET_EMAILS)
NATIVE FUNC INT SC_EMAIL_GET_NUM_RETRIEVED_EMAILS() = "0x36da2f4516577796"

// PURPOSE:
//  Returns the retrieved email at the given index 
// PARAMS:
//	index - the index (0 - SC_EMAIL_GET_NUM_RETRIEVED_EMAILS-1)
//	email - the email struct which will be filled out with the email details
// RETURNS:
//	True if the email was successfully found at the given index, and the emailData populated
NATIVE FUNC BOOL SC_EMAIL_GET_EMAIL_AT_INDEX(INT index, scrEmail_Data& emailData) = "0xa44368a741c80fb8"

// PURPOSE:
//  Deletes a number of emails
// PARAMS:
//	emailIds - an array of email ids to delete
//  numIds - the number of ids in the array
NATIVE PROC SC_EMAIL_DELETE_EMAILS(INT& emailIds[], INT numIds) = "0x5518d197833303c8"

//PURPOSE:
//	Push this gamer into the recipient list used to send email messages
//NOTE:
//  Call this function a bunch of times to put together the list, then call 
//	an SC_EMAIL_SEND_EMAIL function.  The list is cleared each time the list is used 
//	to send a message
NATIVE PROC SC_EMAIL_MESSAGE_PUSH_GAMER_TO_RECIP_LIST(GAMER_HANDLE &hGamer) = "0xf21a2f0928b0611e"

//PURPOSE:
//	Clears the recipient list used to send email messages
NATIVE PROC SC_EMAIL_MESSAGE_CLEAR_RECIP_LIST() = "0xc226569e8ae3b12f"

//PURPOSE:
//	Sends an email
// PARAMS:
//	sendType - Send an email to the gamers on the recipient list (via SC_EMAIL_MESSAGE_PUSH_GAMER_T0_RECIP_LIST)
//	email - the email struct which has been filled out with the email details. You only need to fill out subject and content info here.
NATIVE PROC SC_EMAIL_SEND_EMAIL(scrEmail_Data& emailData) = "0x22c4d9470feca02f"

//PURPOSE:
//	Sets current 'tag' used for email messages. You can set these tags - {"gta5email", "gta5mkt_en", "gta5mkt_fr", "gta5mkt_ge", "gta5mkt_it", "gta5mkt_sp", "gta5mkt_pt", "gta5mkt_pl", "gta5mkt_ru", "gta5mkt_ko", "gta5mkt_ch", "gta5mkt_ja", "gta5mkt_me", "gta5mkt_cn"} -.
//  By default the system will reset the current email tag to "gta5email" when you call SC_EMAIL_RETRIEVE_EMAILS for the cases
//  You forget to do it. So your code should always have something like this when you want to retrieve marketing messages:
//
//  SC_EMAIL_SET_CURRENT_EMAIL_TAG("gta5mkt_en" | "gta5mkt_fr" | "gta5mkt_ge", etc ...)
//  SC_EMAIL_RETRIEVE_EMAILS(...) ==> this way you dont need to worry about if you are using the correct tag or not.
//
NATIVE FUNC BOOL SC_EMAIL_SET_CURRENT_EMAIL_TAG(STRING tag) = "0x447cb94777f3ebb0"

// PURPOSE:
//  Start/stop caching the latest Rockstar Message
// PARAMS:
//	bCache = TRUE if we should cache the mssage (for script to collect via SC_GET_NEW_ROCKSTAR_MSG), 
//	bCache = FALSE if we should automatically post the message to the Game Stream (Feed)
NATIVE PROC SC_CACHE_NEW_ROCKSTAR_MSGS(BOOL bCache) = "0xa368680985014a94"

// PURPOSE:
// 	Returns whether there is a new Rockstar Message.  If this returns TRUE, script can safely collect the new message via SC_HAS_NEW_ROCKSTAR_MSG
NATIVE FUNC BOOL SC_HAS_NEW_ROCKSTAR_MSG() = "0x6224e1e91811520e"

// PURPOSE:
//  Retrieves the last new Rockstar Message sent via the SC Admin site.
//  Note:  	This should only be called if SC_HAS_NEW_ROCKSTAR_MSG has returned TRUE
// 			Once this function is called, SC_HAS_NEW_ROCKSTAR_MSG will return FALSE until a new message is posted.
NATIVE FUNC STRING SC_GET_NEW_ROCKSTAR_MSG() = "0x435f23fafd94822c"

///////////////////////////////////////////////////////////////////////////////////////
//
//  Social Club Presence Attributes - 
//	Per player attributes store on our own R* servers.  These attributes are used to broadcast
//	various real-time attributes for each player
//
//
//  NOTE: all lower case on purpose.
HASH_ENUM SC_PRES_ATTR_ID_ENUM
	mp_mis_str,
	mp_mis_inst,
	mp_team,
	mp_cash,
	mp_rank,
	mp_curr_gamemode,
	mp_mis_id
ENDENUM

NATIVE FUNC BOOL SC_PRESENCE_ATTR_SET_INT(SC_PRES_ATTR_ID_ENUM valueId, INT value) = "0x0b0cea604d2360ab"
NATIVE FUNC BOOL SC_PRESENCE_ATTR_SET_FLOAT(SC_PRES_ATTR_ID_ENUM valueId, FLOAT value) = "0x39a629d663853569"
NATIVE FUNC BOOL SC_PRESENCE_ATTR_SET_STRING(SC_PRES_ATTR_ID_ENUM valueId, STRING value) = "0x148a0559a9e2d543"

CONST_INT MAX_ACTIVITY_ID 11

// PURPOSE:
//   For setting a players skill / rating at a particular activity
// PARAMS:
//	 nActivityID - ID from 0 to MAX_ACTIVITY_ID (giving MAX_ACTIVITY_ID + 1 distinct attributes)
//   fRating - Player skill at activity from 0.0 (bad) to 1.0 (good)
//
NATIVE FUNC BOOL SC_PRESENCE_SET_ACTIVITY_RATING(INT nActivityID, FLOAT fRating) = "0x795eef0392d65e0a"


////////////////////////////////////////////////////////////////////////////////////////
//
//	SC Gamer Data - 
//  Per player flags and/or values that can be set ON a user to give them server based 
//	things.
////////////////////////////////////////////////////////////////////////////////////////

//Check for raw value by name (since we can add then whenever we want)
NATIVE FUNC BOOL SC_GAMERDATA_GET_INT (STRING name, INT &value) = "0xe530979b4add2f80"
NATIVE FUNC BOOL SC_GAMERDATA_GET_FLOAT (STRING name, FLOAT &value) = "0xf62752900e6ad1fd"
NATIVE FUNC BOOL SC_GAMERDATA_GET_BOOL (STRING name) = "0x24734f3518b2bbf2"
NATIVE FUNC BOOL SC_GAMERDATA_GET_STRING(STRING name, TEXT_LABEL_63& value) = "0x83cb3ffb98d67e00"

//PURPOSE:  Check to see if the user has an xp bonus (multiplier) added
//RETURNS:  True if there a xpBonus active.  xpBonusMult will have the value of the multiplier
NATIVE FUNC BOOL SC_GAMERDATA_GET_ACTIVE_XP_BONUS (FLOAT& xpBounsMult) = "0xce5978ddb0cb1d76"

//PURPOSE: Check to see if this user has an admin set licensePlate to use.
//RETURNS: True if there is a license plate set on their gamer data.  'licPlate' 
//			will have the license plate to use.  Can then be applied with SET_VEHICLE_NUMBER_PLATE_TEXT
NATIVE FUNC BOOL SC_GAMERDATA_GET_LICENSE_PLATE(TEXT_LABEL_15& licPlate) = "0x6f0a62a7df104fba"

//PURPOSE:  Can be used to overrid the sc gamer data bIsCheater and iIsCheater SC gamer data values.
NATIVE PROC SC_GAMERDATA_BANK_CHEATER_OVERRIDE(BOOL bCheaterOverride) = "0xdca255535c360373"
NATIVE PROC SC_GAMERDATA_BANK_CHEATER_RATING_OVERRIDE(INT ratingOverride) = "0xc00e786ec57382bd"

////////////////////////////////////////////////////////////////////////////////////////
//
//	Profanity filtering - 
//		Submit a string to the profanity server to verify if the string is profane, wait for reply, 
//		and check the result.
//
//	When starting the request, you'll get a token for referencing the request you made.

//PURPOSE:
//	Submit the given string to profanity checking.
//PARAMS:
//	textString - string to verified
//	outToken - returned token that can be used to check the status of the pending check
//RETURN:
//	True if the request has been been sent to the server for validation.  Use outToken to 
//		monitor the status.
//	If this function returns false, something failed to send the string to the server for 
//	validation.
NATIVE FUNC BOOL SC_PROFANITY_CHECK_STRING(STRING textString, INT& outToken) = "0xcc5050a709f16570"


//PURPOSE:
//	Submit the given string to profanity checking for UGC text. UGC text validation has special cases for dev
//PARAMS:
//	textString - string to verified
//	outToken - returned token that can be used to check the status of the pending check
//RETURN:
//	True if the request has been been sent to the server for validation.  Use outToken to 
//		monitor the status.
//	If this function returns false, something failed to send the string to the server for 
//	validation.
NATIVE FUNC BOOL SC_PROFANITY_CHECK_STRING_UGC(STRING textString, INT& outToken) = "0xdd48701476147cf4"

//PURPOSE:
//	check if the request associated with the given token is valid and not expired
//PARAMS:
//	token - the token returned when the string was submitted.
//RETURNS
//	True if the token represents an unexpired profanity check
NATIVE FUNC BOOL SC_PROFANITY_GET_CHECK_IS_VALID(INT token) = "0xf4e7b156e5a4b520"

//PURPOSE:
//	check if the given request is still pending
//RETURN:
// True if the request is still pending.
// False if the request has returned with a response or is invalid
NATIVE FUNC BOOL SC_PROFANITY_GET_CHECK_IS_PENDING(INT token) = "0x82531db473114086"

//PURPOSE:
// check to see if the string submitted under the given token passed profanity check
//RETURN:
//  True if the server responded that the string passed the profanity check.
//  False if the request failed the check, pending, or invalid
//NOTE:
//	Check IS_VALID(token) AND NOT IS_PENDING(token) before calling this to find whether is passed or fail
NATIVE FUNC BOOL SC_PROFANITY_GET_STRING_PASSED(INT token) = "0x3b16c45d63fdb882"


ENUM ePROFANITY_CHECK_STATUS
	PROFANITY_RESULT_OK,
	PROFANITY_RESULT_FAILED,
	PROFANITY_RESULT_PENDING,
	PROFANITY_RESULT_INVALID_TOKEN,
	PROFANITY_RESULT_ERROR = -1
ENDENUM	

//PURPOSE:
//	get the current status of the string for this token
//RETURN:
//	Returns the current status code for the given profanity string check.
// 
//NOTES:
//	Use SC_PROFANITY_GET_CHECK_IS_PENDING() and wait for the request to finish.  Once 
//	it's finished, use SC_PROFANITY_GET_STRING_STATUS() to get the status of the result.
NATIVE FUNC ePROFANITY_CHECK_STATUS SC_PROFANITY_GET_STRING_STATUS(INT token) = "0x043879210cb3356d"

//PURPOSE:
//	get the profane word for this token
//RETURN:
//	Returns the first profane word for the given profanity string check in profaneWord.
//  And a boolean, true if the retriving of the word succeeded, false otherwise
// 
//NOTES:
//	Use SC_PROFANITY_GET_PROFANE_WORD() only when the check is finished and failed.
NATIVE FUNC BOOL SC_PROFANITY_GET_PROFANE_WORD(INT token, TEXT_LABEL_63& outProfaneWord) = "0xc025033f28aae59d"

////////////////////////////////////////////////////////////////////////////////////////
//
//	License Plate Validation - 
//		Submit a license plate string to the check against the players approved and recorded 
//	    license plates.  Players have multiple records for license plates online.  This will
//		retrieve those plate records and compare a given license plate to them.  The plate
//		should be in the list of viable plates.  Otherwise the player may have cheated and
//		faked the online license plate.
//
//	When starting the request, you'll get a token for referencing the request you made.

//PURPOSE:
//	Submit the given string to license plate checking.
//PARAMS:
//	textString - string to verify
//	outToken - returned token that can be used to check the status of the pending check
//RETURN:
//	True if the request has been been sent to the server for validation.  Use outToken to 
//		monitor the status.
//	If this function returns false, something failed to send the string to the server for 
//	validation.
NATIVE FUNC BOOL SC_LICENSEPLATE_CHECK_STRING(STRING textString, INT& outToken) = "0xd1956b5a20ca5580"

//PURPOSE:
//	check if the request associated with the given token is valid and not expired
//PARAMS:
//	token - the token returned when the string was submitted.
//RETURNS
//	True if the token represents an unexpired profanity check
NATIVE FUNC BOOL SC_LICENSEPLATE_GET_CHECK_IS_VALID(INT token) = "0xbe869dfec7b44d4b"

//PURPOSE:
//	check if the given request is still pending
//RETURN:
// True if the request is still pending.
// False if the request has returned with a response or is invalid
NATIVE FUNC BOOL SC_LICENSEPLATE_GET_CHECK_IS_PENDING(INT token) = "0xa2d53ed0bef60c91"

//PURPOSE:
// check to see if the string submitted under the given token passed the license plate check
//RETURN:
//  True if the server responded that the string passed the profanity check.
//  False if the request failed the check, pending, or invalid
//NOTE:
//	Check IS_VALID(token) AND NOT IS_PENDING(token) before calling this to find whether is passed or fail
NATIVE FUNC BOOL SC_LICENSEPLATE_GET_STRING_PASSED(INT token) = "0x07a006d8de323afb"


ENUM eLICENSEPLATE_CHECK_STATUS
	LICENSEPLATE_RESULT_OK,
	LICENSEPLATE_RESULT_FAILED,
	LICENSEPLATE_RESULT_PENDING,
	LICENSEPLATE_RESULT_INVALID_TOKEN,
	LICENSEPLATE_RESULT_ERROR = -1
ENDENUM	

//PURPOSE:
//	get the current status of the string for this token
//RETURN:
//	Returns the current status code for the given license plate string check.
// 
//NOTES:
//	Use SC_LICENSEPLATE_GET_CHECK_IS_PENDING() and wait for the request to finish.  Once 
//	it's finished, use SC_LICENSEPLATE_GET_STRING_STATUS() to get the status of the result.
NATIVE FUNC eLICENSEPLATE_CHECK_STATUS SC_LICENSEPLATE_GET_STRING_STATUS(INT token) = "0xede682d0d32d7fee"

//PURPOSE:
//	get the current count of license plates retrieved for this token
//RETURN:
//	Returns the current count of license plates retrieved for this token
// 
//NOTES:
//	Use SC_LICENSEPLATE_GET_CHECK_IS_PENDING() and wait for the request to finish.  Once 
//	it's finished, use SC_LICENSEPLATE_GET_COUNT() to get the count of license plates retrieved.
NATIVE FUNC INT SC_LICENSEPLATE_GET_COUNT(INT token) = "0x27e3ea5e1a5d8359"

//PURPOSE:
//	get the current license plate at a given index retrieved for this token
//RETURN:
//	Returns the current license plate at a given index retrieved for this token
// 
//NOTES:
//	Use SC_LICENSEPLATE_GET_CHECK_IS_PENDING() and wait for the request to finish.  Once 
//	it's finished, use SC_LICENSEPLATE_GET_COUNT() to get the count of license plates retrieved,
//  then iterate using an index to get individual license plates.
NATIVE FUNC STRING SC_LICENSEPLATE_GET_PLATE(INT token, INT index) = "0x2bc4091f0e7d790f"

//PURPOSE:
//	get the current license plate data at a given index retrieved for this token.
//RETURN:
//	Returns the current license plate at a given index retrieved for this token.
// 
//NOTES:
//	Use SC_LICENSEPLATE_GET_CHECK_IS_PENDING() and wait for the request to finish.  Once 
//	it's finished, use SC_LICENSEPLATE_GET_COUNT() to get the count of license plates retrieved,
//  then iterate using an index to get individual license plates.
NATIVE FUNC STRING SC_LICENSEPLATE_GET_PLATE_DATA(INT token, INT index) = "0x8964657c740d2d02"

//PURPOSE:
//	Update the GET list with a new license added with SC_LICENSEPLATE_ADD - use the GET token.
NATIVE FUNC BOOL SC_LICENSEPLATE_GET_ADD_PLATE(INT token, STRING plateName, STRING plateData) = "0x8462d6184bfec8f8"

////////////////////////////////////////////////////////////////////////////////////////
//
//	License Plate Adding - 
//		Submit a license plate string to add as a license plate.
//
//	When starting the request, you'll get a token for referencing the request you made.

//PURPOSE:
//	Submit the given string as your new license plate.
//PARAMS:
//	textString - string for the plate
//	outToken - returned token that can be used to check the status of the pending check
//RETURN:
//	True if the request has been been sent to the server for validation.  Use outToken to 
//		monitor the status.
//	If this function returns false, something failed to send the string to the server for 
//	validation.
NATIVE FUNC BOOL SC_LICENSEPLATE_ADD(STRING textString, STRING plateData, INT& outToken) = "0x3fedb6c23a0cadc3"

//PURPOSE:
//	check if the given request is still pending
//RETURN:
// True if the request is still pending.
// False if the request has returned with a response or is invalid
NATIVE FUNC BOOL SC_LICENSEPLATE_GET_ADD_IS_PENDING(INT token) = "0x077d5881cef1e026"

ENUM eLICENSEPLATE_ADD_STATUS
	LICENSEPLATE_ADD_OK,
	LICENSEPLATE_ADD_PENDING,
	LICENSEPLATE_ADD_INVALID_TOKEN,
	LICENSEPLATE_ADD_ERROR = -1
ENDENUM	

//PURPOSE:
//	get the current status of the string for this token
//RETURN:
//	Returns the current status code for the given license plate add.
// 
//NOTES:
//	Use SC_LICENSEPLATE_GET_ADD_IS_PENDING() and wait for the request to finish.  Once 
//	it's finished, use SC_LICENSEPLATE_GET_ADD_STATUS() to get the status of the result.
NATIVE FUNC eLICENSEPLATE_ADD_STATUS SC_LICENSEPLATE_GET_ADD_STATUS(INT token) = "0xc5a506671fed32c1"


//Bit fields used to specify the plate data.
ENUM ePlateDataValuesBits
	PLATE_DATA_GIFTED_PLATE = 1 // == �NoDelete� string
	,PLATE_DATA_SPPLATE     = 2 // == �SPPlate� string
ENDENUM

//PURPOSE:
//	Change current license plate data.
// 
//RETURN:
//	True if the request has been been sent to the server for validation.  Use outToken to 
//		monitor the status.
//	If this function returns false, something failed to send the string to the server for 
//	validation.
NATIVE FUNC BOOL  SC_LICENSEPLATE_SET_PLATE_DATA(STRING oldPlateText, STRING newPlateText, STRING plateData) = "0x1850a282903b7f14"


ENUM eLICENSEPLATE_CHANGE_STATUS
	LICENSEPLATE_CHANGE_RESULT_OK,
	LICENSEPLATE_CHANGE_RESULT_PENDING,
	LICENSEPLATE_CHANGE_RESULT_ERROR = -1
ENDENUM	

//PURPOSE:
//	get the current status of the string.
//RETURN:
//	Returns the current status code for the given license plate data change.
// 
NATIVE FUNC eLICENSEPLATE_CHANGE_STATUS SC_LICENSEPLATE_SET_PLATE_STATUS( ) = "0xa347ef64b241baf6"



////////////////////////////////////////////////////////////////////////////////////////
//
//	License Plate IsValid - 
//		Submit a license plate string to check for license plate validity.
//
//	When starting the request, you'll get a token for referencing the request you made.

//PURPOSE:
//	Submit the given string as your new license plate to test validity.
//PARAMS:
//	textString - string for the plate
//	outToken - returned token that can be used to check the status of the pending check
//RETURN:
//	True if the request has been been sent to the server for validation.  Use outToken to 
//		monitor the status.
//	If this function returns false, something failed to send the string to the server for 
//	validation.
NATIVE FUNC BOOL SC_LICENSEPLATE_ISVALID(STRING textString, INT& outToken) = "0x1b8f82cfbaefcf2a"

//PURPOSE:
//	check if the given request is still pending
//RETURN:
// True if the request is still pending.
// False if the request has returned with a response or is invalid
NATIVE FUNC BOOL SC_LICENSEPLATE_GET_ISVALID_IS_PENDING(INT token) = "0x200bd2b668159774"

ENUM eLICENSEPLATE_ISVALID_STATUS
	LICENSEPLATE_ISVALID_OK,
	LICENSEPLATE_ISVALID_PENDING,
	LICENSEPLATE_ISVALID_PROFANE,
	LICENSEPLATE_ISVALID_RESERVED,
	LICENSEPLATE_ISVALID_MALFORMED,
	LICENSEPLATE_ISVALID_NOTVALID,	
	LICENSEPLATE_ISVALID_INVALID_TOKEN,
	LICENSEPLATE_ISVALID_ERROR = -1
ENDENUM	

//PURPOSE:
//	get the current status of the string for this token
//RETURN:
//	Returns the current status code for the given license plate add.
// 
//NOTES:
//	Use SC_LICENSEPLATE_GET_ISVALID_IS_PENDING() and wait for the request to finish.  Once 
//	it's finished, use SC_LICENSEPLATE_GET_ISVALID_STATUS() to get the status of the result.
NATIVE FUNC eLICENSEPLATE_ISVALID_STATUS SC_LICENSEPLATE_GET_ISVALID_STATUS(INT token) = "0xd07a6d6812cf15d5"

//////////////////////////////////////////////////////////////////////////
//
//  Social Club Community Events
//
//////////////////////////////////////////////////////////////////////////
//PURPOSE:
//	Returns true if a social club community multiplayer event is active
NATIVE FUNC BOOL SC_COMMUNITY_EVENT_IS_ACTIVE() = "0xd5a3cfd28abc1dcd"

//PURPOSE:
//	If thre is an active SC community event, this function will return the event Id 
//		string, which can be used as a category value for leaderboard submissions
//PARAMS:
//	outEventId - filled with the string of teh event Id
//RETURN:
//	True if there is an event active and outEventId is filled with a value.
NATIVE FUNC INT SC_COMMUNITY_EVENT_GET_EVENT_ID() = "0xe95ef73b1eb447e9"

//PURPOSE:
//	Get the values of extra data for the ACTIVE social club event (if there is one active)
//RETURNS:
//	True if the value was found an returned.  OTherwise false.
NATIVE FUNC BOOL SC_COMMUNITY_EVENT_GET_EXTRA_DATA_INT(STRING name, INT& value) = "0xc9497291fe019bdd"
NATIVE FUNC BOOL SC_COMMUNITY_EVENT_GET_EXTRA_DATA_FLOAT(STRING name, FLOAT& value) = "0xff6eb2bfa3722d5b"
NATIVE FUNC BOOL SC_COMMUNITY_EVENT_GET_EXTRA_DATA_STRING(STRING name, TEXT_LABEL_63& value) = "0x0969b80bd6ef0448"

//PURPOSE:
//	Get the "display name" for the active event.
NATIVE FUNC BOOL SC_COMMUNITY_EVENT_GET_DISPLAY_NAME(TEXT_LABEL_63& value) = "0xae88927b2e59627e"

//PURPOSE:
//	Returns true if a social club community multiplayer event with given type is active
NATIVE FUNC BOOL SC_COMMUNITY_EVENT_IS_ACTIVE_FOR_TYPE(STRING eventType) = "0xd271bdf216949c05"
NATIVE FUNC BOOL SC_COMMUNITY_EVENT_IS_ACTIVE_BY_ID(INT eventId) = "0x7c6a47cf803393f4"

//PURPOSE:
//	If thre is an active SC community event with given type, this function will return the event Id 
//		string, which can be used as a category value for leaderboard submissions
NATIVE FUNC INT SC_COMMUNITY_EVENT_GET_EVENT_ID_FOR_TYPE(STRING eventType) = "0xacb1492c0ac1508e"

//PURPOSE:
//	Get the values of extra data for the ACTIVE social club event (if there is one active with given type)
//RETURNS:
//	True if the value was found an returned.  OTherwise false.
NATIVE FUNC BOOL SC_COMMUNITY_EVENT_GET_EXTRA_DATA_INT_FOR_TYPE(STRING name, INT& value, STRING eventType) = "0x1faf6e2303414888"
NATIVE FUNC BOOL SC_COMMUNITY_EVENT_GET_EXTRA_DATA_FLOAT_FOR_TYPE(STRING name, FLOAT& value, STRING eventType) = "0x899d6dd23b6333b7"
NATIVE FUNC BOOL SC_COMMUNITY_EVENT_GET_EXTRA_DATA_STRING_FOR_TYPE(STRING name, TEXT_LABEL_63& value, STRING eventType) = "0x7c3d8ecbf2948404"

//PURPOSE:
//	Get the values of extra data for the ACTIVE social club event (if there is one active with given type)
//RETURNS:
//	True if the value was found an returned.  OTherwise false.
NATIVE FUNC BOOL SC_COMMUNITY_EVENT_GET_EXTRA_DATA_INT_BY_ID(INT eventId, STRING name, INT& value) = "0xbe0a744f66c123fa"
NATIVE FUNC BOOL SC_COMMUNITY_EVENT_GET_EXTRA_DATA_FLOAT_BY_ID(INT eventId, STRING name, FLOAT& value) = "0xa44df352c7f035f4"
NATIVE FUNC BOOL SC_COMMUNITY_EVENT_GET_EXTRA_DATA_STRING_BY_ID(INT eventId, STRING name, TEXT_LABEL_63& value) = "0x8c7e520683702281"


//PURPOSE:
//	Get the "display name" for the active event with given type.
NATIVE FUNC BOOL SC_COMMUNITY_EVENT_GET_DISPLAY_NAME_FOR_TYPE(TEXT_LABEL_63& value) = "0x715d80baa018340a"
NATIVE FUNC BOOL SC_COMMUNITY_EVENT_GET_DISPLAY_NAME_BY_ID(INT eventID, TEXT_LABEL_63& value) = "0x906a3ddd892efd32"

//PURPOSE: Will start a request to repopulate social club event info from the cloud
NATIVE PROC SC_COMMUNITY_EVENT_REPOPULATE_DO_REQUEST() = "0x7a096aaeebc56f8e"
//PURPOSE: Will return TRUE if a request to repopulate social club event info from the cloud is still pending
NATIVE FUNC BOOL SC_COMMUNITY_EVENT_REPOPULATE_IS_REQUEST_PENDING() = "0xaa36c94a36a35ced"
//PURPOSE: Will return TRUE if last request to repopulate social club event info from the cloud succeeded
NATIVE FUNC BOOL SC_COMMUNITY_EVENT_REPOPULATE_DID_LAST_REQUEST_SUCCEED() = "0xb8f683b1f203be95"


///////////////////////////////////////////////////////////////////////////////
//
// Social Club Ticker News
//
///////////////////////////////////////////////////////////////////////////////
//PURPOSE:
//	Tell the news system to request the assets for the next news story and send
//		it to the gameStream (in-game feed).  
//PARAMS:
//	delaySecsBeforeNextShow - How long to wait before allowing the next news story to show.
//RETURNS:
//	TRUE if there are news stories to show and this function is worth calling again.
//NOTE:
//	You can spam this call whenever you have an open window of time where you want news stories
//		to appear in the feed.  While you're spamming it, it will wait delaySecsBeforeNextShow
//		before actually sending the next one to the gamestream.
NATIVE FUNC BOOL SC_NEWS_SHOW_NEXT_ITEM(INT delaySecsBeforeNextShow) = "0xbd9ef1411241346b"

//PURPOSE:
//	Tell the news system to request the assets for the previous news story and send
//		it to the gameStream (in-game feed).  
//PARAMS:
//	delaySecsBeforeNextShow - How long to wait before allowing the next news story to show.
//RETURNS:
//	TRUE if there are news stories to show and this function is worth calling again.
//NOTE:
//	You can spam this call whenever you have an open window of time where you want news stories
//		to appear in the feed.  While you're spamming it, it will wait delaySecsBeforeNextShow
//		before actually sending the next one to the gamestream.
NATIVE FUNC BOOL SC_NEWS_SHOW_PREV_ITEM(INT delaySecsBeforeNextShow) = "0x6db23ae3b73c62de"


///////////////////////////////////////////////////////////////////////////////
//
// Social Club Transition News
//
///////////////////////////////////////////////////////////////////////////////
//PURPOSE:
//	Queue a transition news story before showing
//
NATIVE FUNC BOOL SC_TRANSITION_NEWS_QUEUE_STORY() = "0x5739fbea8e2780cb"

//PURPOSE:
//	Start and show the transition news.  If a news story hasn't been queued, it will queue one.
//	
//	moveID to make requests for scaleform on
NATIVE FUNC BOOL SC_TRANSITION_NEWS_SHOW(SCALEFORM_INDEX moveID) = "0x0d2a179a72de9835"

//PURPOSE:
//	Start and show the transition news.  If a news story hasn't been queued, it will queue one.
//	
//	moveID - to make requests for scaleform on
//  iStoryOnscreenDuration - the amount of time (in ms) to display each story for.  If this value == 0, then the news controller will only show one news item and never transition to another.
//RETURNS:
//	True if there are stories to show
NATIVE FUNC BOOL SC_TRANSITION_NEWS_SHOW_TIMED(SCALEFORM_INDEX moveID, INT iStoryOnscreenDuration) = "0x1d7ff1570191d740"

//PURPOSE:
//	Loads and shows the next news item
//
NATIVE FUNC BOOL SC_TRANSITION_NEWS_SHOW_NEXT_ITEM() = "0xd3d69d182eb4f47b"

//PURPOSE:
//	Loads and shows the previous news item
//	
NATIVE FUNC BOOL SC_TRANSITION_NEWS_SHOW_PREV_ITEM() = "0xcdab77e920bbd01f"

//PURPOSE:
//	Find whether the currently displayed news item contains extra data
//
//RETURNS:
//	True if the there is a news item currently being shown and it contains extra data.  Otherwise false.
NATIVE FUNC BOOL SC_TRANSITION_NEWS_HAS_EXTRA_DATA_TU() = "0x4a80e5be1282b9f6"

//PURPOSE:
//	Get the values of extra data for the current news item being shown
//RETURNS:
//	True if the value was found and returned.  Otherwise false.
NATIVE FUNC BOOL SC_TRANSITION_NEWS_GET_EXTRA_DATA_INT_TU(STRING name, INT& value) = "0x173f6700006f426f"
NATIVE FUNC BOOL SC_TRANSITION_NEWS_GET_EXTRA_DATA_FLOAT_TU(STRING name, FLOAT& value) = "0x83f8b60ec7067eaf"
NATIVE FUNC BOOL SC_TRANSITION_NEWS_GET_EXTRA_DATA_STRING_TU(STRING name, TEXT_LABEL_63& value) = "0xe8f8013da034fd4e"

//PURPOSE:
//	Hides the transition news
//
NATIVE PROC SC_TRANSITION_NEWS_END() = "0x5689e28a3cf63014"

///////////////////////////////////////////////////////////////////////////////
//
// Social Club Transition News
//
///////////////////////////////////////////////////////////////////////////////

// Keep in sync with sNewsStoryData
STRUCT SC_NEWS_STORY_DATA
	STRING		title
	STRING		subtitle
	STRING		content
	STRING		url
	STRING		headline // footer
	STRING		textureName
ENDSTRUCT

//PURPOSE:
//	Initialize Social Club Pause Menu News Controller
//
NATIVE FUNC BOOL SC_PAUSE_NEWS_INIT_STARTER_PACK(BOOL isOwned) = "0x60172adf60baa91e"

HASH_ENUM NEWS_STORY_TYPE
	newswire,
	store,
	rockstareditor,
	starterpackowned,
	starterpacknotowned
ENDENUM

//PURPOSE:
//	Initialize Social Club Pause Menu News Controller with the specified story type
//PARAMS:	
// 	storyType: The story type to read
// 	textOnly:  If true the texts will be downloaded but the image won't
NATIVE FUNC BOOL SC_PAUSE_NEWS_INIT_STORY_TYPE(NEWS_STORY_TYPE storyType, BOOL textOnly) = "0x0571f1c333b15078"

//PURPOSE:
//	Retrieves number of SC pause menu news stories for current active news controller
//
NATIVE FUNC INT SC_PAUSE_NEWS_GET_NUM_STORIES() = "0xfef27588e68c17b3"

//PURPOSE:
//	Retrieves index of current pending SC pause menu news story
//
NATIVE FUNC INT SC_PAUSE_NEWS_GET_PENDING_STORY_INDEX() = "0x5a675aaca79f0b23"

//PURPOSE:
//	Retrieves pending story data.
//NOTE:
//	Call this only once, and check return value before using data.
//WARNING:
//	DO NOT STORE SC_NEWS_STORY_DATA!  You should retrieve the data, and operate on it immediately.
//
NATIVE FUNC BOOL SC_PAUSE_NEWS_GET_PENDING_STORY(SC_NEWS_STORY_DATA& newsStoryData) = "0xf349a7e5fb1a1df0"

//PURPOSE:
//	Cycles to (requests) next/previous SC pause menu news story
//
NATIVE FUNC BOOL SC_PAUSE_NEWS_CYCLE_STORY(BOOL cycleForward) = "0xa61064c58220b56b"

//PURPOSE:
//	Shuts down the Social Club Pause News Controller
//
NATIVE PROC SC_PAUSE_NEWS_SHUTDOWN() = "0x45de407092cb2039"

//PURPOSE:
//	Retrieve local player social club account nickname
//RETURNS:
//	Nickname Otherwise "UNKNOWN".
NATIVE FUNC STRING SC_ACCOUNT_INFO_GET_NICKNAME() = "0xb2acfc559a277939"

//PURPOSE:
//	Retrieve status about social club achievement availability.
//RETURNS:
//	Returns TRUE if the status SUCCEEDED.
//NOTES:
//  (status == -1) - INVALID status request to read achievements has not even started.
//  (status ==  0) - Read SUCCEEDED information is available.
//  (status ==  1) - Read is PENDING, in progress.
//  (status ==  2) - Read FAILED.
//  (status ==  3) - Read CANCELED.
//
//   If the Status is FAILED/CANCELED you can call SC_ACHIEVEMENT_SYNCHRONIZE once to restart everything
//    but make sure the player is online and has ROS credentials.
//
NATIVE FUNC BOOL SC_ACHIEVEMENT_INFO_STATUS(INT& status) = "0x0b032b4a939192d3"

//PURPOSE:
//	Synchronize local platform achievements with Social Club.
//RETURNS:
//	Returns TRUE if the request was started.
NATIVE FUNC BOOL SC_ACHIEVEMENT_SYNCHRONIZE( ) = "0x5b726816f402dec9"

//PURPOSE:
//	Returns TRUE if the achievement has been passed.
NATIVE FUNC BOOL SC_HAS_ACHIEVEMENT_BEEN_PASSED( INT id ) = "0xbea131afb70a18a2"
