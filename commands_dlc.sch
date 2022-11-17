USING "types.sch"

ENUM eMapChangeStates
	MCS_INVALID = -1, 
	MCS_NONE,
	MCS_INIT,
	MCS_UPDATE,
	MCS_END,
	MCS_COUNT
ENDENUM

ENUM eDlcCloudResult
	DLCRESULT_NOT_READY = -1,
	DLCRESULT_OK,
	DLCRESULT_CONNECTION_ERROR,
	DLCRESULT_TIMEOUT,
	DLCRESULT_COUNT
ENDENUM

#IF FEATURE_GEN9_STANDALONE

ENUM USER_ENTITLEMENT_STATUS
	USER_ENTITLEMENT_STATUS_UNKNOWN = 0,
	USER_ENTITLEMENT_STATUS_NONE,
	USER_ENTITLEMENT_STATUS_ENTITLED
ENDENUM

STRUCT USER_ENTITLEMENTS
	USER_ENTITLEMENT_STATUS storyMode
ENDSTRUCT

#ENDIF // FEATURE_GEN9_STANDALONE

// ******************************************************************************************
// **** DLC commands
// ******************************************************************************************

// INFO: Gets the status of the extracontent cloud transfers
// PARAM NOTES: Should be used after HAS_CLOUD_REQUESTS_FINISHED is finalised
NATIVE FUNC INT GET_EXTRACONTENT_CLOUD_RESULT() = "0xdfe8bafb2c491fed"


// INFO: Detects if a DLC pack is present
// PARAM NOTES: NameHash - hash of DLC pack name for example HASH("dlcPack1")
// RETURNS: True if pack is enumerated and valid
NATIVE FUNC BOOL IS_DLC_PRESENT(INT NameHash) = "0x014d8c5910a5b01b"

// INFO: Detects if a DLC pack is present
// RETURNS: True if DLC compatibility pack configuration is valid
NATIVE FUNC BOOL DLC_CHECK_COMPAT_PACK_CONFIGURATION() = "0x8346229c60b14feb"

// INFO: Detects if a DLC pack is present
// RETURNS: True if savegame DLC pack configuration is valid
NATIVE FUNC BOOL DLC_CHECK_SAVEGAME_PACK_CONFIGURATION() = "0x3a51fbcf38249657"

// INFO: Returns number of corrupted DLC packs
// RETURNS: number of corrupted DLC packs
NATIVE FUNC INT DLC_GET_CORRUPTED_PACKS_COUNT() = "0x274cc1797dba5a17"

// INFO: Returns name of corrupted DLC pack
// PARAM NOTES: index - index of corrupted DLC pack within range 0 <= index < DLC_GET_CORRUPTED_PACKS_COUNT()
// RETURNS: True if savegame DLC pack configuration is valid
NATIVE FUNC STRING DLC_GET_CORRUPTED_PACK_FILENAME(INT index) = "0x0a33d1d08b4fc5d9"

// INFO: Returns the variation name hash and local index of a prop for a given ped
NATIVE PROC GET_LOCAL_PROP_DATA(INT pedIndex, INT anchorId, INT propIndx, INT& outVarInfoHash, INT& outLocalIndex) = "0x00aa9b730d4e646b"

// INFO: Returns the global index of a prop given the variation info hash and the local index
NATIVE FUNC INT GET_GLOBAL_PROP_DATA(INT pedIndex, INT anchorId, INT varInfoHash, INT localIndex) = "0x6f620aed55686106"

// INFO: Returns the variation name hash and local index of a component for a given ped
NATIVE PROC GET_LOCAL_COMP_DATA(INT pedIndex, INT compId, INT compIdx, INT& outVarInfoHash, INT& outLocalIndex) = "0x6e8de2d847355622"

// INFO: Returns the global index of a component given the variation info hash and the local index
NATIVE FUNC INT GET_GLBOAL_COMP_DATA(INT pedIndex, INT compId, INT varInfoHash, INT localIndex) = "0x86ef1c19e089bd88"

// INFO: Returns true if the loading screens are active
NATIVE FUNC BOOL GET_IS_LOADING_SCREEN_ACTIVE() = "0x36f8d1c6ab25af2b"

// INFO: Returns true if the initial loading screens are active (when you boot the game)
NATIVE FUNC BOOL GET_IS_INITIAL_LOADING_SCREEN_ACTIVE() = "0xc0bf59543a218f2c"

// INFO: Performs a bail with compatibility pack missing message
NATIVE PROC  BAIL_COMPAT_PACK_MISSING() = "0xe6b10be161e4e720"
// INFO: Performs a bail with cloud data retrieval failed message
NATIVE PROC  BAIL_CLOUD_DATA_FAILED() = "0x45b4e36c590d5d27"
// INFO: Checks whether the extracontent cloud data is correct
NATIVE FUNC BOOL DLC_CHECK_CLOUD_DATA_CORRECT() = "0xa9ed124071c968be"

//INFO: Checks whether the extracontent cloud requests are finalized, 
//INFO: We should ensure that this function returns true before checking 
//INFO: for the state of cloud data and compatibility pack configuration.
//PARAM NOTES	: bTimedOut - this boolean is set to true if it keeps returning false for <uWaitDuration>
//PARAM NOTES	: uWaitDuration - timeout duration in milliseconds. 
//PARAM			: Passing 0 as uWaitDuration will make it fall back to the value defined in the code (30 sec)
//NOTES			: This function should be queried in a state and we should only leave that state when we time out or return true
NATIVE FUNC BOOL HAS_CLOUD_REQUESTS_FINISHED(BOOL &bTimedOut, INT uWaitDuration) = "0x1b2f8af8aaba3482"

// INFO: Requests the manifest one last time, should be done as earliest as possible when entering MP
NATIVE PROC REQUEST_DLC_MANIFEST() = "0x815e1c9a3854d573"

// INFO: Sets the current state (eMapChangeStates) of the map change transition
NATIVE PROC SET_MAP_CHANGE_STATE(INT value) = "0x52747c299ffb11d3"

// INFO: Gets the current state (eMapChangeStates) of the map change transition
NATIVE FUNC INT GET_MAP_CHANGE_STATE() = "0xcda69baeff79542b"

// INFO: Gets whether the order of DLC has ever been bad since the session started
NATIVE FUNC BOOL GET_EVER_HAD_BAD_PACK_ORDER() = "0x87803acdd52e54f1"

// INFO: Tells code that script has made an irreversable transition to SP
NATIVE PROC ON_ENTER_SP() = "0x5cdcf73e81e343a7"

// INFO: Tells code that script has made an irreversable transition to MP
NATIVE PROC ON_ENTER_MP() = "0xfa1496e29f396739"

// INFO: States whether or not any content change sets are pending
NATIVE FUNC BOOL ARE_ANY_CCS_PENDING() = "0x10d127b791140a41"

#IF FEATURE_GEN9_STANDALONE

// INFO: Check if it is necessary to request updated entitlements, e.g. the player has signed in since we last queried entitlements.
NATIVE FUNC BOOL ARE_USER_ENTITLEMENTS_UP_TO_DATE() = "0x5b2e954ce345fb7f"

// INFO: Attempt to populate entitlements data or retrieve it if not currently available.
NATIVE FUNC BOOL TRY_GET_USER_ENTITLEMENTS(USER_ENTITLEMENTS& sEntitlements) = "0x67cef75da3ff4c05"

// INFO: Advises code that player is currently in multiplayer permitted content for entitlement purposes.
NATIVE PROC DECLARE_IN_MULTIPLAYER_THIS_FRAME() = "0xaa3eabf6286b9f4e"

#ENDIF // FEATURE_GEN9_STANDALONE

// ******************************************************************************************
// **** End of DLC commands ****
// ******************************************************************************************


// Script-side wrapper around IsRockstarDev C++ function. Implemented through IS_DLC_PRESENT to
// make life more awkward for hackers, who have already managed to find the IsRockstarDev() C++
// function and patch it to always return true.
FUNC BOOL IS_ROCKSTAR_DEV()
	RETURN IS_DLC_PRESENT(HASH("XX_I$RAWKST4H_D3V_XX"))
ENDFUNC

