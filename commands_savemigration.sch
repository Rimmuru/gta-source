USING "rage_builtins.sch"
USING "types.sch"

//PURPOSE: This structure contains the possible codes for the save migration.
ENUM SAVEMIGRATION_PLATFORM_GENERATION
	SAVEMIGRATION_PLATFORM_NONE     = 0,
	SAVEMIGRATION_PLATFORM_GEN8     = 8,
	SAVEMIGRATION_PLATFORM_GEN9     = 9
ENDENUM

#IF FEATURE_GEN9_STANDALONE
//PURPOSE: This structure contains the possible codes for the save migration.
ENUM SAVEMIGRATION_STATUS_CODES
	SAVEMIGRATION_STATUS_NONE 		= 0,
	SAVEMIGRATION_STATUS_OK			= 1,
	SAVEMIGRATION_STATUS_PENDING	= 2,
	SAVEMIGRATION_STATUS_INPROGRESS	= 3,
	SAVEMIGRATION_STATUS_TIMEOUT	= 4,
	SAVEMIGRATION_STATUS_CANCELED	= 5,
	SAVEMIGRATION_STATUS_ROLLEDBACK	= 6,
	SAVEMIGRATION_STATUS_ERROR		= 7
ENDENUM
#ENDIF // #IF FEATURE_GEN9_STANDALONE

#IF NOT FEATURE_GEN9_STANDALONE
//PURPOSE: This structure contains the possible codes for the save migration.
ENUM SAVEMIGRATION_STATUS_CODES
	SAVEMIGRATION_STATUS_NONE 		= 0,
	SAVEMIGRATION_STATUS_OK			= 1,
	SAVEMIGRATION_STATUS_PENDING	= 2,
	SAVEMIGRATION_STATUS_INPROGRESS	= 3,
	SAVEMIGRATION_STATUS_CANCELED	= 4,
	SAVEMIGRATION_STATUS_ROLLEDBACK	= 5,
	SAVEMIGRATION_STATUS_ERROR		= 6
ENDENUM
#ENDIF // #IF NOT FEATURE_GEN9_STANDALONE

//PURPOSE: Structure that contains a savemigration account
STRUCT STRUCT_SAVEMIGRATION_ACCOUNT
    INT				m_accountId
	INT				m_statusCount
	BOOL            m_available
	TEXT_LABEL		m_platform
    TEXT_LABEL_63	m_gamerName
    TEXT_LABEL_63	m_gamerHandle
    TEXT_LABEL_63	m_ErrorCode
ENDSTRUCT

//PURPOSE: Structure that contains a savemigration stat
STRUCT STRUCT_SAVEMIGRATION_STAT
	TEXT_LABEL_63	m_name
    TEXT_LABEL_63	m_value
ENDSTRUCT

/// PURPOSE: Returns TRUE if save migration is enabled.
NATIVE FUNC BOOL SAVEMIGRATION_IS_MP_ENABLED() = "0x522cbfb9bc78c5a8"

/// PURPOSE: Request the current users accounts, it will returns TRUE if the operation has succeeded.
NATIVE FUNC BOOL SAVEMIGRATION_MP_REQUEST_ACCOUNTS() = "0x85f41f9225d08c72"

/// PURPOSE: Request the current status of the accounts request, if it returns SAVEMIGRATION_STATUS_OK the accounts request has compleded without error.
NATIVE FUNC SAVEMIGRATION_STATUS_CODES SAVEMIGRATION_MP_GET_ACCOUNTS_STATUS() = "0xc8cb5999919ea2ca"

/// PURPOSE: Get the number of accounts avaliable.
NATIVE FUNC INT SAVEMIGRATION_MP_NUM_ACCOUNTS() = "0x77a16200e18e0c55"

/// PURPOSE: Get the account data at the specified index it will returns TRUE if the operation has succeeded.
NATIVE FUNC BOOL SAVEMIGRATION_MP_GET_ACCOUNT(INT index, STRUCT_SAVEMIGRATION_ACCOUNT& data) = "0xfce2747eef1d05fc"

/// PURPOSE: Get the account stat at the specified index it will returns TRUE if the operation has succeeded.
NATIVE FUNC BOOL SAVEMIGRATION_MP_GET_ACCOUNT_STAT(INT index, INT stat, STRUCT_SAVEMIGRATION_STAT& data) = "0x83f619aa7b5992db"

/// PURPOSE: Request an account to be migrated, it will returns TRUE if the operation has succeeded.
NATIVE FUNC BOOL SAVEMIGRATION_MP_MIGRATE_ACCOUNT(INT sourceAccountId, TEXT_LABEL sourcePlatform) = "0x472ec2413d9cfc26"

/// PURPOSE: Get the current status of the account migration, if it returns SAVEMIGRATION_STATUS_OK if the user has completed the migration without error.
NATIVE FUNC SAVEMIGRATION_STATUS_CODES SAVEMIGRATION_MP_GET_ACCOUNT_MIGRATION_STATUS() = "0x5988c7025ab82599"

/// PURPOSE: Request the status of the users save migration.
///
/// Should be called by the game client before entering into multiplayer, on both gen8 and gen9 consoles, 
/// so that a user doesn't enter into MP while a transfer is in progress for them, as this would cause them 
/// to stomp on the changes being made, potentially corrupting the account.
NATIVE FUNC BOOL SAVEMIGRATION_MP_REQUEST_STATUS() = "0xa06b0c3f6c7cb4bc"

/// PURPOSE: Get the current status of the users save migration, if it returns SAVEMIGRATION_STATUS_OK if the user can enter a multiplayer session.
NATIVE FUNC SAVEMIGRATION_STATUS_CODES SAVEMIGRATION_MP_GET_STATUS() = "0x3e4ea30497613d3d"

/// PURPOSE: Request to see which platform generation the profile is from, if it returns TRUE then it is the generation passed in.
NATIVE FUNC BOOL SAVEMIGRATION_MP_IS_PLATFORM_GENERATION(SAVEMIGRATION_PLATFORM_GENERATION nGeneration) = "0x18a958b38123ed15"

// Eof
