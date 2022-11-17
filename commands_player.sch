USING "hud_colours.sch"
USING "types.sch"
USING "model_enums.sch"
USING "commands_misc.sch"
USING "commands_vehicle.sch"
USING "commands_ped.sch"
USING "commands_task.sch"

ENUM NETWORK_COLOUR
    DEFAULT_COLOUR,
    BLUE_COLOUR,
    RED_COLOUR,
    GREEN_COLOUR,
    YELLOW_COLOUR,
    TURQUOISE_COLOUR,
    PURPLE_COLOUR,
    WHITE_COLOUR,
    ORANGE_COLOUR
ENDENUM

ENUM ACHIEVEMENT_IDS
          VIRALKILLME = 50,
        MPCOOPWINALL = 49,
        MPSTARRATING = 48,
        MPRACEWINALL = 47,
        MPCOMPWINALL = 46,
        MPTEAMWINALL = 45,
        MPCOOPWIN1 = 44,
        MPRACEWIN1 = 43,
        MPCOMPWIN1 = 42,
        MPTEAMWIN1 = 41,
        GAMECOMPLETION100 = 40,
        STREETLIGHTSDOWN = 39,
        STORYDONE = 38,
        KEYMISSION4 = 37,
        METRANDOM = 36,
        FRIENDSLIKEYOU = 35,
        KEYMISSION3 = 34,
        SABOMBCAR = 33,
        UNDERALLBRIDGES = 32,
        HIDDENPACKAGES = 31,
        ASSASSIN = 30,
        USJDONE = 29,
        SMSTHEFTDONE = 28,
        OPENEDALDERNEY = 27,
        KEYMISSION2 = 26,
        HALFMILLION = 25,
        SAHELI = 24,
        DATING = 23,
        ALLHELITOURTAKEN = 22,
        TAXIPASSANGER = 21,
        KEYMISSION0 = 20,
        VIGILDONE = 19,
        WANTEDDONE = 18,
        IMPORTDONE = 17,
        KEYMISSION1 = 16,
        WANTEDLEVEL6STARSURVIVAL = 15,
        CHAINREACTION = 14,
        SAGUNCAR = 13,
        DRUGDONE = 12,
        LOSERATING = 11,
        CARROLLS = 10,
        SATAXI = 9,
        TURKEY = 8,
        BIKEWHEELIE = 7,
        STREETRACE = 6,
        MELEECOUNTER = 5,
        QUBBEAT = 4,
        POOLWIN = 3,
        SCOREDARTGAME = 2,
        THETOUR = 1
ENDENUM

// SET_PLAYER_CONTROL_FLAGS - These are the flags passed into SET_PLAYER_CONTROL
// NB: These values must match those in PlayerInfo.h, even though not all are exposed to script.

ENUM SET_PLAYER_CONTROL_FLAGS
	SPC_NONE		        = 0,	// No flags set
	SPC_AMBIENT_SCRIPT		= 2,	// whether this was called by an ambient script
	SPC_CLEAR_TASKS			= 4,	// also clears the player's taks
	SPC_REMOVE_FIRES		= 8,	// removes fires in the vicinity of the player
	SPC_REMOVE_EXPLOSIONS		= 16,	// removes explosions in the vicinity of the player
	SPC_REMOVE_PROJECTILES		= 32,	// removes all projectiles
	SPC_DEACTIVATE_GADGETS		= 64,	// deactivates all the player's gadgets
	SPC_REENABLE_CONTROL_ON_DEATH	= 128,	// re-enables the player's controls if they die whilst not under control
	SPC_LEAVE_CAMERA_CONTROL_ON		= 256,	// Leaves the camera control on when disabling player control (Off by default if removing player control, turned back on when resuming control)
	SPC_ALLOW_PLAYER_DAMAGE				= 512,	//Allow the player to be damaged even if his control is turned off. 
	SPC_DONT_STOP_OTHER_CARS_AROUND_PLAYER	= 1024,	//Tells nearby vehicles to stop moving or get out of the way
	SPC_PREVENT_EVERYBODY_BACKOFF = 2048,	// Prevent everybody from backing off when player controls are disabled
	SPC_ALLOW_PAD_SHAKE			  = 4096	// Allows pad to rumble
ENDENUM

ENUM ASSISTED_MOVEMENT_FLAGS
	ASS_REDUCE_SPEED_FOR_CORNERS			= 1,	// these nodes should be slowed down for if necessary
	ASS_IS_UNDERWATER						= 2		// this node is underwater (modifies its behaviour)
ENDENUM

// Have to keep in sync with the enum list in crime.h, wanted.meta and parcodegen in wanted.cpp
ENUM CRIME_TYPE
	CRIME_NONE = 0,
	CRIME_POSSESSION_GUN,
	CRIME_RUN_REDLIGHT,
	CRIME_RECKLESS_DRIVING,
	CRIME_SPEEDING,
	CRIME_DRIVE_AGAINST_TRAFFIC,
	CRIME_RIDING_BIKE_WITHOUT_HELMET,
	CRIME_LAST_MINOR_CRIME = CRIME_RIDING_BIKE_WITHOUT_HELMET,		// Minor crimes will not automatically make the wanted level go up but it will start a parole instead. If the player does anything wrong doing the parole period he will get a wanted level.
	
	CRIME_STEAL_VEHICLE,
	CRIME_STEAL_CAR,
	CRIME_LAST_ONE_NO_REFOCUS = CRIME_STEAL_CAR,					// Some crimes will not refocus the search area.

	CRIME_BLOCK_POLICE_CAR,
	CRIME_STAND_ON_POLICE_CAR,
	CRIME_HIT_PED,
	CRIME_HIT_COP,
	CRIME_SHOOT_PED,
	CRIME_SHOOT_COP,
	CRIME_RUNOVER_PED,
	CRIME_RUNOVER_COP,
	CRIME_DESTROY_HELI,
	CRIME_PED_SET_ON_FIRE,
	CRIME_COP_SET_ON_FIRE,
	CRIME_CAR_SET_ON_FIRE,
	CRIME_DESTROY_PLANE,
	CRIME_CAUSE_EXPLOSION,
	CRIME_STAB_PED,
	CRIME_STAB_COP,
	CRIME_DESTROY_VEHICLE,
	CRIME_DAMAGE_TO_PROPERTY,
	CRIME_TARGET_COP,
	CRIME_FIREARM_DISCHARGE,
	CRIME_RESIST_ARREST,
	CRIME_MOLOTOV,
	CRIME_SHOOT_NONLETHAL_PED,
	CRIME_SHOOT_NONLETHAL_COP,
	CRIME_KILL_COP,
	CRIME_SHOOT_AT_COP,
	CRIME_SHOOT_VEHICLE,
	CRIME_TERRORIST_ACTIVITY,
	CRIME_HASSLE,
	CRIME_THROW_GRENADE,
	CRIME_VEHICLE_EXPLOSION,
	CRIME_KILL_PED,
	CRIME_STEALTH_KILL_COP,
	CRIME_SUICIDE,
	CRIME_DISTURBANCE,
	CRIME_CIVILIAN_NEEDS_ASSISTANCE,
	CRIME_STEALTH_KILL_PED,
	CRIME_SHOOT_PED_SUPPRESSED,
	CRIME_JACK_DEAD_PED,
	CRIME_CHAIN_EXPLOSION,
	MAX_CRIMES
ENDENUM

//Match with eWrecklessType in PlayerInfo.h
ENUM WRECKLESS_TYPE
	WT_ON_PAVEMENT = 0,
	WT_RAN_RED_LIGHT,
	WT_DROVE_AGAINST_TRAFFIC
ENDENUM

ENUM TARGETING_MODE_TYPE
	TARGETING_OPTION_GTA_TRADITIONAL = 0,
	TARGETING_OPTION_ASSISTED_AIM,
	TARGETING_OPTION_ASSISTED_FREEAIM,
	TARGETING_OPTION_FREEAIM
ENDENUM

ENUM PLAYER_TARGET_LEVEL
	PTL_TARGET_EVERYONE = 0,
	PTL_TARGET_STRANGERS,
	PTL_TARGET_ATTACKERS
ENDENUM

ENUM CLOTH_PACKAGE_TYPE
  	CLOTH_PACKAGE_DEFAULT = 0,
	CLOTH_PACKAGE_MINIGUN,
	CLOTH_PACKAGE_TOP_SKINNED
ENDENUM

// Match values with eArcadeTeam in game/Peds/PlayerArcadeInformation.h
ENUM ARCADE_TEAM
	eARCADETEAM_NONE = 0,
	
	eARCADETEAM_COP,
	eARCADETEAM_CROOK,
	
	eARCADETEAM_NUM_TYPES
ENDENUM	

// Match values with eArcadeRole in game/Peds/PlayerArcadeInformation.h
ENUM ARCADE_ROLE
	eARCADEROLE_NONE = 0,
	
	eARCADEROLE_COP_OFFICER,
	eARCADEROLE_COP_TACTICAL,
	eARCADEROLE_COP_TECH,
	
	eARCADEROLE_CROOK_SOLDIER,
	eARCADEROLE_CROOK_ENFORCER,
	eARCADEROLE_CROOK_HACKER,
	
	eARCADEROLE_NUM_TYPES
ENDENUM

ENUM ARCADE_PASSIVE_ABILITY_TYPE
	ARCADE_ABILITY_NONE = -1,
	ARCADE_ABILITY_PARKOUR,
	ARCADE_ABILITY_SNITCH,
	ARCADE_ABILITY_MARATHON_MAN,
	ARCADE_ABILITY_SECOND_WIND,
	ARCADE_ABILITY_HACK_THE_SYSTEM,
	ARCADE_ABILITY_FREIGHT_TRAIN,
	ARCADE_ABILITY_NUM_TYPES
ENDENUM

ENUM ARCADE_SPECIAL_ABILITY_TYPE
	ARCADE_SPECIAL_ABILITY_NONE = -1,
	ARCADE_SPECIAL_ABILITY_ENRAGED,
	ARCADE_SPECIAL_ABILITY_GHOST,
	ARCADE_SPECIAL_ABILITY_SPRINT_SPEED_BOOST,
	ARCADE_SPECIAL_ABILITY_SPIKE_MINE,
	ARCADE_SPECIAL_ABILITY_FULL_THROTTLE,
	ARCADE_SPECIAL_ABILITY_BACKUP,
	ARCADE_SPECIAL_ABILITY_NUM_TYPES
ENDENUM

ENUM ARCADE_VEHICLE_ABILITY_TYPE
	ARCADE_VEHICLE_ABILITY_NONE = -1,
	ARCADE_VEHICLE_ABILITY_NITRO,
	ARCADE_VEHICLE_ABILITY_EMP,
	ARCADE_VEHICLE_ABILITY_PUMPED_UP,
	ARCADE_VEHICLE_ABILITY_OIL_SLICK,
	ARCADE_VEHICLE_ABILITY_KINETIC_RAM,
	ARCADE_VEHICLE_ABILITY_NUM_TYPES
ENDENUM

ENUM SPECIAL_ABILITY_TYPE
	SAT_INVALID = -1,
	SAT_CAR_SLOWDOWN,
	SAT_RAGE,
	SAT_BULLET_TIME,
	SAT_SNAPSHOT,
	SAT_INSULT,
	SAT_ARCADE_ENRAGED,
	SAT_ARCADE_GHOST,
	SAT_ARCADE_SPRINT_SPEED_BOOST,
	SAT_ARCADE_NITRO_COP,
	SAT_ARCADE_NITRO_CROOK,
	SAT_ARCADE_EMP,
	SAT_ARCADE_SPIKE_MINE,
	SAT_ARCADE_FULL_THROTTLE,
	SAT_ARCADE_PUMPED_UP,
	SAT_ARCADE_BACKUP,
	SAT_ARCADE_OIL_SLICK,
	SAT_ARCADE_KINETIC_RAM
ENDENUM

// INFO: Player Incapacitation Query States
ENUM INCAPACITATION_STATE
    INCAPACITATION_STATE_INVALID		= -1,	// Ped is not in a valid Incapacitation state
    INCAPACITATION_STATE_FALLING		= 0,
    INCAPACITATION_STATE_INCAPACITATED	= 1,
    INCAPACITATION_STATE_ESCAPING		= 2,
    INCAPACITATION_STATE_ARRESTED		= 3
ENDENUM

// The maximum number of scripted assisted movement routes.

CONST_INT ASSISTED_MOVEMENT_MAX_NUM_ROUTES		8

// The maximum number of points in any assisted movement route

CONST_INT ASSISTED_MOVEMENT_ROUTE_MAX_NUM_POINTS	16


//~>					Player check commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the main player exists.
NATIVE FUNC BOOL DOES_MAIN_PLAYER_EXIST( ) = "0x5a0286552d34c344"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the given player is dead. 
NATIVE FUNC BOOL IS_PLAYER_DEAD( PLAYER_INDEX PlayerIndex ) = "0xe08d4560995e7946"

//INFO: Returns FALSE if the screen is fading due to the player being killed or arrested or failing a critical mission.
//PARAM NOTES:
//PURPOSE: Returns TRUE if the player is in control. More info..
NATIVE FUNC BOOL IS_PLAYER_PLAYING( PLAYER_INDEX PlayerIndex ) = "0x3583a42587543334"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the ped index from the players index. If PlayerIndex is -1, then the local player ped is returned.
NATIVE FUNC PED_INDEX GET_PLAYER_PED(PLAYER_INDEX PlayerIndex) = "0x407e03586628e458"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the player index for the main player.
NATIVE FUNC PLAYER_INDEX GET_PLAYER_INDEX() = "0xb6ba8b8e3d0b41c6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Converts an int to a player index.
NATIVE FUNC PLAYER_INDEX INT_TO_PLAYERINDEX(INT Arg) = "0xa1087a6350cd9244"

//INFO: 
//PARAM NOTES:
//PURPOSE: Converts the player index, to the script id used in the decorator functions.
NATIVE FUNC PLAYER_SCRIPT_ID GET_PLAYER_PED_SCRIPT_INDEX(PLAYER_INDEX PlayerIndex) = "0xe0fcabb9fcdf25ed"

//INFO: 
//PARAM NOTES:
//PURPOSE: Converts an int to a participant index.
NATIVE FUNC PARTICIPANT_INDEX INT_TO_PARTICIPANTINDEX(INT Arg) = "0x54f800f95142c750"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the player index for the main player. This is the same as GET_PLAYER_INDEX().
NATIVE FUNC PLAYER_INDEX PLAYER_ID() = "0x9e2d6c50374fcfa9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the player index for the main player. 
NATIVE FUNC PED_INDEX PLAYER_PED_ID() = "0xe2d3d51028f0428a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the player index for the main player as an int
NATIVE FUNC INT NETWORK_PLAYER_ID_TO_INT() = "0xa52c4f51ecab7e02"

//~> 					Player control commands

//INFO: This command can be used to temporarily disable the player’s controls. The controls should be switched back on again as soon as possible. 
//	NOTE Turning this on will make vehicles proof from bullets etc. Likewise when the player controls are turned back on it will make ALL the vehicles vunerable again, 
//	so you will have to set them back with SET_CAR_CAN_BE_DAMAGED(vehicle_name, FALSE). 
//PARAM NOTES: The flags are taken as a combination of the values in 'SET_PLAYER_CONTROL_FLAGS' above.
//PURPOSE: Sets the players control state. More info..
NATIVE PROC SET_PLAYER_CONTROL( PLAYER_INDEX iPlayerIndex, BOOL bSetControlOn, SET_PLAYER_CONTROL_FLAGS iFlags = 0 ) = "0x64e21045781afbc9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the players control is on.
NATIVE FUNC BOOL IS_PLAYER_CONTROL_ON( PLAYER_INDEX PlayerIndex ) = "0x1c7a1a7e9e4766cf"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the main player's camera controls are disabled. This returns true if the there is no main player info.
NATIVE FUNC BOOL GET_ARE_CAMERA_CONTROLS_DISABLED() = "0x87694b2faa0fc0c7"

//INFO: Even if this command returns TRUE, player control could still have been turned off by something else like camera or cutscene code
//PARAM NOTES:
//PURPOSE: returns FALSE if the player control has been turned off by a script. More info.. 
NATIVE FUNC BOOL IS_PLAYER_SCRIPT_CONTROL_ON( PLAYER_INDEX PlayerIndex ) = "0x9895f96718388657"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gives the player control of the ragdoll.
NATIVE PROC GIVE_PLAYER_RAGDOLL_CONTROL(PLAYER_INDEX PlayerIndex, BOOL bGiveControl) = "0xb5e6954fe3fb7cce"

//INFO: Checks that the player is in control (not falling), is not being arrested etc
//PARAM NOTES:
//PURPOSE: Returns TRUE if it is safe for the player to start a mission. More info..
NATIVE FUNC BOOL CAN_PLAYER_START_MISSION( PLAYER_INDEX PlayerIndex ) = "0x4965181a7de78866"
//~>					Movement commands

//INFO: Checks that the player can do a stealth kill
//PARAM NOTES:
//PURPOSE: Returns TRUE if a stealth kill move is possible. More info..
NATIVE FUNC BOOL CAN_PLAYER_DO_STEALTH_KILL( PLAYER_INDEX PlayerIndex ) = "0x6a367975aa530ddb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if the player can sprint.
NATIVE PROC SET_PLAYER_SPRINT( PLAYER_INDEX PlayerIndex, bool DisableSprint ) = "0xb7baa0aa99553c94"

//INFO: 
//PARAM NOTES:
//PURPOSE: Reset Player stamina to its maximun value.
NATIVE PROC RESET_PLAYER_STAMINA( PLAYER_INDEX PlayerIndex ) = "0x511842c558980f8a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Restores a percentage of the player's stamina.
NATIVE PROC RESTORE_PLAYER_STAMINA( PLAYER_INDEX PlayerIndex, FLOAT fPercent ) = "0x699b5067386de80c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the current sprint stamina remaining
NATIVE FUNC FLOAT GET_PLAYER_SPRINT_STAMINA_REMAINING( PLAYER_INDEX PlayerIndex ) = "0xfdb293b712306c65"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the current sprint time remaining
//		   At the minute this is for on foot only.  Can be modified for bikes/swimming if needed.
NATIVE FUNC FLOAT GET_PLAYER_SPRINT_TIME_REMAINING( PLAYER_INDEX PlayerIndex ) = "0x7fb7b029eb5d5a31"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the current underwater time remaining before drowning begins (negative result means drowning)
NATIVE FUNC FLOAT GET_PLAYER_UNDERWATER_TIME_REMAINING( PLAYER_INDEX PlayerIndex ) = "0x8d856ff63e29934b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the underwater time remaining before drowning begins.
NATIVE FUNC FLOAT SET_PLAYER_UNDERWATER_BREATH_PERCENT_REMAINING( PLAYER_INDEX PlayerIndex, FLOAT fPercent ) = "0xaa17f3802978cc19"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the player is climbing.
NATIVE FUNC BOOL IS_PLAYER_CLIMBING( PLAYER_INDEX PlayerIndex ) = "0xd28b9359d0f02aca"

//INFO: 
//PARAM NOTES:	CheckBustedTask - If this is set to FALSE then we'll only rely on the player's game state, which is set to arrested
//				once the player is no longer allowed to break out of the busted task
NATIVE FUNC BOOL IS_PLAYER_BEING_ARRESTED( PLAYER_INDEX PlayerIndex, BOOL CheckBustedTask = TRUE ) = "0x99c20d75af0fb22e"

//INFO: 
//PARAM NOTES:	Set the players state to be arrested.
NATIVE PROC SET_PLAYER_ARRESTED( PLAYER_INDEX PlayerIndex ) = "0x5d89fd0b951b3e35"

//INFO: 
//PARAM NOTES:	Reset arrest state if we want to go back to the playing state.
NATIVE PROC RESET_PLAYER_ARREST_STATE( PLAYER_INDEX PlayerIndex ) = "0x4ef216bdd5c4ca98"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the player can preform arrest.
NATIVE FUNC BOOL CAN_PLAYER_PERFORM_ARREST( PLAYER_INDEX PlayerIndex ) = "0x14c0b14c939cfeab"


//~>					Attribute commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the model for the player.
NATIVE PROC SET_PLAYER_MODEL(PLAYER_INDEX PlayerIndex, MODEL_NAMES PlayerModelHashKey) = "0xbece2b5c03bb4f09"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Changes the player from one Ped to another.
//			After this command is called the players PED_INDEX will change to that of newPed.
//			The old player ped will be left with the same PED_INDEX as the player had previously.
//			The old player ped will be left as an AI mission character and it is up to the scripts to clean the old ped up using the players old PED_INDEX
NATIVE PROC CHANGE_PLAYER_PED(PLAYER_INDEX PlayerIndex, PED_INDEX newPed, BOOL KeepScriptedTasks = FALSE, BOOL ClearPedDamage = TRUE) = "0xb10d8e27c549787d"

//INFO: 
//PARAM NOTES:
//PURPOSE:Sets whether the player is able to fire an uzi from a vehicle. 
NATIVE PROC SET_PLAYER_CAN_DO_DRIVE_BY( PLAYER_INDEX PlayerIndex, BOOL CanDoDriveBy ) = "0xf82507ebd42c6070"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if the player can use cover.
NATIVE PROC SET_PLAYER_CAN_USE_COVER( PLAYER_INDEX PlayerIndex, BOOL CanUseCover ) = "0x8830bfbe22c483c8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the players max armour value.
NATIVE FUNC INT GET_PLAYER_MAX_ARMOUR(PLAYER_INDEX PlayerIndex ) = "0x57a3e5a15723f6ca"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the players jack speed value.
NATIVE FUNC INT GET_PLAYER_JACK_SPEED(PLAYER_INDEX PlayerIndex ) = "0x881f0bb5bb902a7e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the RGB colour of the player.
NATIVE PROC GET_PLAYER_RGB_COLOUR( PLAYER_INDEX PlayerIndex, INT &Red, INT &Green, INT &Blue ) = "0xea0963c9e116ac55"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the HUD colour of the player, i.e. matches the player color in the menus and the radar.
NATIVE FUNC HUD_COLOURS GET_NATIVE_PLAYER_HUD_COLOUR( PLAYER_INDEX PlayerIndex ) = "0x9f53470fbc61099d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the player invincible to all damage types.
NATIVE PROC SET_PLAYER_INVINCIBLE(PLAYER_INDEX PlayerIndex, BOOL Invincible) = "0xc099da307dd6bc62"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets if the player is invincible to all damage types.
NATIVE FUNC BOOL GET_PLAYER_INVINCIBLE(PLAYER_INDEX PlayerIndex) = "0xf81d8e7ed654a736"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets if the player has debug invincible to all damage types.
NATIVE FUNC BOOL GET_PLAYER_DEBUG_INVINCIBLE(PLAYER_INDEX PlayerIndex) = "0x76df66470b55ae8f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the player invincible to all damage types, but player will react to the damage (ie explosions, fire etc).
NATIVE PROC SET_PLAYER_INVINCIBLE_BUT_HAS_REACTIONS(PLAYER_INDEX PlayerIndex, BOOL Invincible) = "0x7e9ca7389ef595e6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the player able to collect money pickups dropped by other dead peds/players
NATIVE PROC SET_PLAYER_CAN_COLLECT_DROPPED_MONEY(PLAYER_INDEX PlayerIndex, BOOL CanCollect) = "0x01a3f029bd732372"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the player to be able to use vehicle search lights
NATIVE PROC SET_PLAYER_CAN_USE_VEHICLE_SEARCH_LIGHT(PLAYER_INDEX PlayerIndex, BOOL CanUseSearchLight) = "0xd16bed9cfa9181a9"


//~>					Network commands

//INFO: 
//PARAM NOTES:
//PURPOSE:   Returns true if the player is online wrt Sony NP - implies he is also signed in locally.
NATIVE FUNC BOOL IS_PLAYER_ONLINE_NP() = "0xc0402d65d01d8b65"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the player is online wrt Gamespy - implies he is also signed in locally.
NATIVE FUNC BOOL IS_PLAYER_ONLINE_GAMESPY() = "0xc90b211a7c9b4754"

//INFO: This assumes there is a system-provided sign-in UI (as on Xbox Live).
//PARAM NOTES:
//PURPOSE: Shows the system sign-in UI.  More info..
NATIVE PROC DISPLAY_SYSTEM_SIGNIN_UI(BOOL bForce = FALSE) = "0x7ee945726afadacf"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true is a system UI (e.g. the sign-in UI) is showing.
NATIVE FUNC BOOL IS_SYSTEM_UI_BEING_DISPLAYED() = "0xdfa2e5162727d6d2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks the player has a vaild ped.
NATIVE FUNC BOOL NETWORK_PLAYER_HAS_PED(PLAYER_INDEX PlayerIndex) = "0xa49d19d03dcc3578"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the number of players.
NATIVE FUNC INT GET_NUMBER_OF_PLAYERS( ) = "0x3a0de5c10c341c80"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the team the player is in.
NATIVE FUNC INT GET_PLAYER_TEAM( PLAYER_INDEX PlayerIndex ) = "0x0e40f846a70ba3ec"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the players current team. 
NATIVE PROC SET_PLAYER_TEAM( PLAYER_INDEX PlayerIndex, INT Team ) = "0x78a9f1d1065c4165"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the number of players in a team
NATIVE FUNC INT GET_NUMBER_OF_PLAYERS_IN_TEAM( INT Team ) = "0xe9cb4976f6bdca99"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set lockon active state for mulitplayer games.
NATIVE PROC SET_PLAYER_LOCKON(PLAYER_INDEX PlayerIndex, BOOL bActive) = "0x05611fa30193f5b5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Multiplayer only, this explicitly allows player vs friendly player lockons in a network game: By default its disabled
NATIVE PROC SET_LOCKON_TO_FRIENDLY_PLAYERS(PLAYER_INDEX PlayerIndex, BOOL Allow) = "0x074d7227ca41020a"

//INFO: 
//PARAM NOTES:
//PURPOSE: set targeting mode (0 = hardlock, 1 = softlock, 2 = freeaim).
NATIVE PROC SET_PLAYER_TARGETING_MODE(TARGETING_MODE_TYPE TargetMode) = "0x74970e4fa8f6b345"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get player's targeting mode
NATIVE FUNC TARGETING_MODE_TYPE GET_PLAYER_TARGETING_MODE() = "0x2751fbc4e04e92f4"

//INFO: 
//PARAM NOTES:
//PURPOSE: set player targeting level (e.g. to increase/lower remote player target threat.
NATIVE PROC SET_PLAYER_TARGET_LEVEL(PLAYER_TARGET_LEVEL TargetLevel) = "0x50a5fc22a168dda2"

//INFO: 
//PARAM NOTES:
// PURPOSE: Returns if we are using third perspon cover in FPS Mode.
NATIVE FUNC BOOL GET_IS_USING_FPS_THIRD_PERSON_COVER() = "0x425d4ff8ff23ee78"

//INFO: 
//PARAM NOTES:
// PURPOSE: Returns true if we are using hood camera.
NATIVE FUNC BOOL GET_IS_USING_HOOD_CAMERA() = "0x64edc8d24bf9eec0"


//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the name of the player.
NATIVE FUNC STRING GET_PLAYER_NAME( PLAYER_INDEX PlayerIndex ) = "0x61042ca2a97bbb69"


//INFO: 
//PARAM NOTES:
//PURPOSE: Set the player can only entr this vehicle, set to null if you want them to enter any vehicle.
NATIVE PROC SET_PLAYER_MAY_ONLY_ENTER_THIS_VEHICLE(PLAYER_INDEX PlayerIndex, VEHICLE_INDEX iVehicleID) = "0x40da51fc390b094d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a reset falg to stop the player entering any vehicle. Must call every frame.
NATIVE PROC SET_PLAYER_MAY_NOT_ENTER_ANY_VEHICLE(PLAYER_INDEX PlayerIndex) = "0x5dd154885519bd3d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Award an achievement to the main player
//PARAMS: AchievementId - Id of achievement to award.  More info.. 
NATIVE FUNC BOOL GIVE_ACHIEVEMENT_TO_PLAYER(INT AchievementId) = "0xb8d77780df8e1242"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set progress of an achievement to the main player
//PARAMS: AchievementId - Id of achievement to award. Progress - Achievement progress 
NATIVE FUNC BOOL SET_ACHIEVEMENT_PROGRESS(INT AchievementId, INT Progress) = "0xee587cff91cf5eda"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get progress of an achievement to the main player
//PARAMS: AchievementId - Id of achievement to award.
NATIVE FUNC INT GET_ACHIEVEMENT_PROGRESS(INT AchievementId) = "0xe70cd2cdee98df14"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Verify if an achievement has been completed
//PARAMS: AchievementId - Id of achievement to award.  More info.. 
NATIVE FUNC BOOL HAS_ACHIEVEMENT_BEEN_PASSED(INT AchievementId) = "0xda4421f81df4b90d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the player is online - implies he is also signed in locally.
NATIVE FUNC BOOL IS_PLAYER_ONLINE() = "0xc65b603e7942d0db"

//INFO:  If this returns true,IS_PLAYER_ONLINE_NP() will return false because, although the player is logged in, he's not fully connected to all necessary back end services, and therefore not online.
//PARAM NOTES:
//PURPOSE:  Returns true if the player is logging in to Sony NP. More info..
NATIVE FUNC BOOL IS_PLAYER_LOGGING_IN_NP() = "0xaa6218da66d7e3ff"

//INFO: Returns -1 if the player hasn't been arrested yet since starting a session. 
//PARAM NOTES:
//PURPOSE: Returns the time in milliseconds since the player was arrested and got respawned outside a police station.  More info.. 
NATIVE FUNC INT GET_TIME_SINCE_LAST_ARREST() = "0x6824a90851dbf244"

//INFO:  Returns -1 if the player hasn't been killed yet since starting a session. 
//PARAM NOTES:
//PURPOSE: Returns the time in milliseconds since the player died.  More info.. 
NATIVE FUNC INT GET_TIME_SINCE_LAST_DEATH() = "0x23c8a58f6f1c9b52"

//~>				Wanted level commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the centre position of the current players wanted area
NATIVE FUNC VECTOR GET_PLAYER_WANTED_CENTRE_POSITION( PLAYER_INDEX PlayerIndex ) = "0x0e218e8a8c75638d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the centre position of the current players wanted area
NATIVE FUNC FLOAT GET_WANTED_LEVEL_RADIUS( INT WantedLevel ) = "0xe923e49e6f7d32e2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the centre position of the current players wanted area
NATIVE PROC SET_PLAYER_WANTED_CENTRE_POSITION( PLAYER_INDEX PlayerIndex, VECTOR VecCoors ) = "0x1eae781eaa7f5613"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the threshold for a specified wanted level
NATIVE FUNC INT GET_WANTED_LEVEL_THRESHOLD( INT wantedLevel ) = "0x1ac3ecc14fa9cd77"


//INFO: The wanted level change will not take place for 10 seconds or su (emulating the time it takes a citizen to report the crime) unless SET_PLAYER_WANTED_LEVEL_NOW is called immediately after 
//PARAM NOTES:
//PURPOSE: Sets the wanted level for the player.  More info.. 
NATIVE PROC SET_PLAYER_WANTED_LEVEL( PLAYER_INDEX PlayerIndex, INT WantedLevel, BOOL bDelayLawResponse = FALSE ) = "0xbcd99b4edae55be6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the wanted level only if its higher than the current.
NATIVE PROC SET_PLAYER_WANTED_LEVEL_NO_DROP( PLAYER_INDEX PlayerIndex, INT WantedLevel, BOOL bDelayLawResponse = FALSE ) = "0x007d28b99df625b1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the wanted level for the player immediately..
NATIVE PROC SET_PLAYER_WANTED_LEVEL_NOW( PLAYER_INDEX PlayerIndex, BOOL bDelayLawResponse = FALSE ) = "0xb78cbe6c9550e5ef"

//INFO: 
//PARAM NOTES:
//PURPOSE: If the player has a wanted level and is outside the circle this command returns true
NATIVE FUNC BOOL ARE_PLAYER_FLASHING_STARS_ABOUT_TO_DROP( PLAYER_INDEX PlayerIndex ) = "0x5e4795798d5a9125"

//INFO: because the police haven't spotted the player for a while.
//PARAM NOTES:
//PURPOSE: Returns true if the player in question (usually 0) has a wanted level and the stars are displayed grey.  More info.. 
NATIVE FUNC BOOL ARE_PLAYER_STARS_GREYED_OUT( PLAYER_INDEX PlayerIndex ) = "0xea9f0d44b6d1c2d6"

//INFO: returns true if player is wanted and has been seen at least once by cops.
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL IS_WANTED_AND_HAS_BEEN_SEEN_BY_COPS( PLAYER_INDEX PlayerIndex ) = "0xe6f58896ab252846"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if the cops will be dispatched for the player.
NATIVE PROC SET_DISPATCH_COPS_FOR_PLAYER( PLAYER_INDEX PlayerIndex, BOOL flag ) = "0xf0ca50ac5d6cfd41"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the wanted level is less than a certain value.
NATIVE FUNC BOOL IS_PLAYER_WANTED_LEVEL_GREATER( PLAYER_INDEX PlayerIndex, INT WantedLevel ) = "0x37bbf9acd752871a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Clears the players wanted level immediately
NATIVE PROC CLEAR_PLAYER_WANTED_LEVEL( PLAYER_INDEX PlayerIndex ) = "0xba5d7196eacb9282"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the local player has crimes queued for processing which have not yet been processed
NATIVE FUNC BOOL LOCAL_PLAYER_HAS_PENDING_CRIMES() = "0x345ecf3f6b5bda08"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the players wanted level.
NATIVE FUNC INT GET_PLAYER_WANTED_LEVEL( PLAYER_INDEX PlayerIndex) = "0xc378b7f0d175a5b0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the max wanted level the player can get.
NATIVE PROC SET_MAX_WANTED_LEVEL( INT NewMaxLevel ) = "0xc0f70a3cdec87ece"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if police blips are displayed on the radar.
NATIVE PROC SET_POLICE_RADAR_BLIPS( BOOL bBlips) = "0x6eac3a35d1bb9b9f"

//INFO: If you set the wanted multiplier to a low value 0.01 and a cop see you shoot a ped in face you wil still get a wanted level.
//PARAM NOTES:1.0f is the default value and it will automatically be reset when MISSION_HAS_FINISHED is called.
//	A value of 2.0f means that the player’s wanted level will go up twice as fast when he commits crimes. 
//PURPOSE: Sets the chance that the player will get a wanted level.  More info.. 
NATIVE PROC SET_WANTED_LEVEL_MULTIPLIER( FLOAT Multiplier ) = "0x8576657a629c4b0a"

//INFO:
//PARAM NOTES: Difficulty must fall between 0 and 1.
//PURPOSE: Sets the difficulty for the wanted system.
NATIVE PROC SET_WANTED_LEVEL_DIFFICULTY(PLAYER_INDEX PlayerIndex, FLOAT Difficulty) = "0x48a2ec087250e1bc"

//INFO:
//PARAM NOTES:
//PURPOSE: Resets the difficulty for the wanted system.
NATIVE PROC RESET_WANTED_LEVEL_DIFFICULTY(PLAYER_INDEX PlayerIndex) = "0x6e31398aa6a7c5ce"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the players max wanted level.
NATIVE FUNC INT GET_MAX_WANTED_LEVEL( ) = "0x847ba8d143d888d1"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the time (in milliseconds) the player needs to be outside of the wanted radius for the stars to go away
NATIVE FUNC INT GET_WANTED_LEVEL_TIME_TO_ESCAPE( ) = "0xcb57195468bc75e4"

//INFO:
//PARAM NOTES: Pass in the wanted level that we want to set the escape time on.
//PURPOSE: Sets the time (in milliseconds) the player needs hide outside of the search area before the wanted level is removed.
NATIVE PROC SET_WANTED_LEVEL_HIDDEN_ESCAPE_TIME(PLAYER_INDEX PlayerIndex, INT iWantedLevel, INT timeToEscape) = "0x439fce01cc242689"

//INFO:
//PARAM NOTES:
//PURPOSE: Resets the time override script can set on the hidden evasion time
NATIVE PROC RESET_WANTED_LEVEL_HIDDEN_ESCAPE_TIME(PLAYER_INDEX PlayerIndex) = "0x1c1af50a180090aa"

//INFO:
//PARAM NOTES:
//PURPOSE: Arcade mode CNC only: Sets the local player's V Offender status
NATIVE PROC SET_ARCADE_CNC_V_OFFENDER(BOOL bIsVOffender) = "0x3464edd4c4fd9610"

//INFO:
//PARAM NOTES:
//PURPOSE: Arcade mode CNC only: Returns the V Offender status of the player with the provided index
NATIVE FUNC BOOL GET_ARCADE_CNC_V_OFFENDER(PLAYER_INDEX PlayerIndex) = "0xfb53be1acc57eb56"

//INFO:
//PARAM NOTES: can be overridden to specify an amount, if left at 0 the crime will get evaluated. Custom crimes that aren't supported in code
//			   need to make sure to provide a crimeValue, otherwise they'll get thrown out when evaluated
//PURPOSE: Report a crime from script, crimeValue
NATIVE PROC REPORT_CRIME( PLAYER_INDEX PlayerIndex, CRIME_TYPE crimeToReport, INT crimeValue = 0 ) = "0xda63aad3559a7fb5"

//INFO:
//PARAM NOTES: 
//PURPOSE: Can be use to disable all instances of a crime type on this frame
NATIVE PROC SUPPRESS_CRIME_THIS_FRAME( PLAYER_INDEX PlayerIndex, CRIME_TYPE crimeToReport ) = "0x01e6fd194dcbeb7d"


//PURPOSE: This sets a bool value in the wanted system of the player ped that will center the wanted position to the players position
// 		   This value gets reest every frame so this function must be called each frame.
NATIVE PROC UPDATE_WANTED_POSITION_THIS_FRAME( PLAYER_INDEX PlayerIndex ) = "0xb2cc2a0592c4efcf"

//PURPOSE: Disables the wanted level hidden evasion for this frame
NATIVE PROC SUPPRESS_LOSING_WANTED_LEVEL_IF_HIDDEN_THIS_FRAME( PLAYER_INDEX PlayerIndex ) = "0xabb7d34a8925c872"

//PURPOSE: Allow evasion HUD when calling SUPPRESS_LOSING_WANTED_LEVEL_IF_HIDDEN_THIS_FRAME
//PARAM NOTES: fTimeBeforeAllowReport: Player will not be reported for this amount of time after command is first called (if set, ie not -1.0). Timer will reset if a different value is passed in if timer is still running.
//									   Time is in seconds.
NATIVE PROC ALLOW_EVASION_HUD_IF_DISABLING_HIDDEN_EVASION_THIS_FRAME( PLAYER_INDEX PlayerIndex, FLOAT fTimeBeforeAllowReport = -1.0) = "0x02affbcc3b11c52a"

//PURPOSE: Can be used at any point that police "know" where the player is to force hidden evasion to start (i.e. flashing stars, cops use vision cones)
NATIVE PROC FORCE_START_HIDDEN_EVASION( PLAYER_INDEX PlayerIndex ) = "0x894e9c42b8740f5e"

//PURPOSE: Disables witnesses from calling the police for this frame
NATIVE PROC SUPPRESS_WITNESSES_CALLING_POLICE_THIS_FRAME( PLAYER_INDEX PlayerIndex ) = "0x11a68a2ddd8cd574"

//PURPOSE: To enable/disable CnC style crime reporting (which as of writing this means we make sure the WL is raised at least one star for every two cop kills)
NATIVE PROC ENABLE_CNC_STYLE_CRIME_REPORTING( BOOL bEnable ) = "0x443c2153a70d4895"

//PURPOSE: This will tell the wanted system of the specified player that they were seen by police THIS FRAME.
NATIVE PROC REPORT_POLICE_SPOTTED_PLAYER( PLAYER_INDEX PlayerIndex ) = "0xec1fa12f2050bd84"

//PURPOSE: Set how long law response will be delayed when the player gets wanted level (this MUST be set before the WL is actually given).
NATIVE PROC SET_LAW_RESPONSE_DELAY_OVERRIDE( FLOAT fLawResponseDelay ) = "0xe831cbc76e6851d3"

//PURPOSE: Disables the law response delay override
NATIVE PROC RESET_LAW_RESPONSE_DELAY_OVERRIDE() = "0x72555a32a7f6481e"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Allows law peds to attack player even if they have no wanted level. Essentially acts like a global "PCF_CanAttackNonWantedPlayerAsLaw" flag on all law peds. Must be called every frame to maintain effect.
NATIVE PROC SET_LAW_PEDS_CAN_ATTACK_NON_WANTED_PLAYER_THIS_FRAME(PLAYER_INDEX PlayerIndex) = "0xef2c918f9b332bfd"

//~>				Ability commands

//INFO: 
//PARAM NOTES: player index of player to initialise abilities for
//PURPOSE: Call to ensure arcade abilties are in a valid state for starting use
NATIVE PROC INIITIALISE_ARCADE_ABILITIES(PLAYER_INDEX PlayerIndex) = "0x66276c0759050711"

//INFO: 
//PARAM NOTES: player index of player to activate ability for, ability type to activate
//PURPOSE: activate an arcade ability on a player
NATIVE PROC ACTIVATE_ARCADE_ABILITY(PLAYER_INDEX PlayerIndex, ARCADE_PASSIVE_ABILITY_TYPE AbilityType) = "0xeba93b47c5c09cbf"


//INFO: 
//PARAM NOTES: player index of player to deactivate ability for, ability type to deactivate
//PURPOSE: deactivate an arcade ability on a player
NATIVE PROC DEACTIVATE_ARCADE_ABILITY(PLAYER_INDEX PlayerIndex, ARCADE_PASSIVE_ABILITY_TYPE AbilityType) = "0xdd5e360eb2170111"

//INFO: 
//PARAM NOTES: the player to check, the ability type to check
//PURPOSE: return true if the arcade ability is active on this player
NATIVE FUNC BOOL IS_ARCADE_ABILITY_ACTIVE(PLAYER_INDEX PlayerIndex, ARCADE_PASSIVE_ABILITY_TYPE AbilityType) = "0x582155efa93aad59"

//INFO: 
//PARAM NOTES: the player to set the ability modifer for, the ability type to set the modifer for, the ability modifier to set
//PURPOSE: set the modifier on an ability for this player
NATIVE PROC SET_ARCADE_ABILITY_MODIFIER(PLAYER_INDEX PlayerIndex, ARCADE_PASSIVE_ABILITY_TYPE AbilityType, float AbilityModifer) = "0x8e6fd476c8c37b82"

//INFO: 
//PARAM NOTES: the player to get the ability modifer from, the ability type to get the modifer from
//PURPOSE: returns the current ability modifier of the provided type for the provided player
NATIVE FUNC FLOAT GET_ARCADE_ABILITY_MODIFIER(PLAYER_INDEX PlayerIndex, ARCADE_PASSIVE_ABILITY_TYPE AbilityType) = "0x9d33969ae27b02be"

//INFO: 
//PARAM NOTES: the player index of the player to clean up abilities for 
//PURPOSE: Call to ensure that arcade abilities are reset on finishing use
NATIVE PROC CLEANUP_ARCADE_ABILITIES(PLAYER_INDEX PlayerIndex) = "0xb4ade47c2ec2a996"

//INFO: 
//PARAM NOTES: the player index of the player to query
//PURPOSE: Get the arcade team of the player
NATIVE FUNC ARCADE_TEAM GET_PLAYER_ARCADE_TEAM(PLAYER_INDEX PlayerIndex) = "0xd657131873bca926"

//INFO: 
//PARAM NOTES: the player index of the player to query
//PURPOSE: Get the arcade role of the player
NATIVE FUNC ARCADE_ROLE GET_PLAYER_ARCADE_ROLE(PLAYER_INDEX PlayerIndex) = "0x85f98c2154092a64"

//INFO: 
//PARAM NOTES: the player index of the player to modify, the player's new arcade team, the player's new arcade role
//PURPOSE: Set the arcade team and role of the player
NATIVE PROC SET_PLAYER_ARCADE_TEAM_AND_ROLE(PLAYER_INDEX PlayerIndex, ARCADE_TEAM arcadeTeam, ARCADE_ROLE arcadeRole) = "0x4d0990bbcea4e345"

//INFO: 
//PARAM NOTES: the vehicle index of the local player's active vehicle
//PURPOSE: Set the active vehicle on the player
NATIVE PROC SET_LOCAL_PLAYER_ARCADE_ACTIVE_VEHICLE(VEHICLE_INDEX vehicleIndex) = "0x74ab49aab277a3cc"

//~>								Vehicle commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Force higher air drag mult on any car or bike the player uses until the mission ends or this command is called again with 1.0, fDragMult range 1.0 - 15.0  (5.0 is standard for high air resistance zones on the map)
NATIVE PROC SET_AIR_DRAG_MULTIPLIER_FOR_PLAYERS_VEHICLE(PLAYER_INDEX PlayerIndex, FLOAT fDragMult) = "0xcf7f6e047025528c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Exposing the ability to let the player swim slightly faster, 1.0 - 1.5. Default: 1.0 
NATIVE PROC SET_SWIM_MULTIPLIER_FOR_PLAYER(PLAYER_INDEX PlayerIndex, FLOAT fMultiplier) = "0xc04f56833375054e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Exposing the ability to let the player run and sprint slightly faster, 1.0 - 1.5. Default: 1.0 
NATIVE PROC SET_RUN_SPRINT_MULTIPLIER_FOR_PLAYER(PLAYER_INDEX PlayerIndex, FLOAT fMultiplier) = "0x0c6ebabc089a80be"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the specified Player is in a vehicle and is pressing the Horn button. 
NATIVE FUNC BOOL IS_PLAYER_PRESSING_HORN( PLAYER_INDEX PlayerIndex ) = "0x98d590fb7ba7df44"

//INFO:if  the player is currently in a vehicle that vehicle will be returned.
//	If the player has not been in a vehicle yet or it somehow got destroyed/removed the value returned will be NULL. 
//PARAM NOTES:
//PURPOSE:Returns the last vehicle that the player has been in.  More info.. 
NATIVE FUNC VEHICLE_INDEX GET_PLAYERS_LAST_VEHICLE() = "0x9993ef7fdbcdb632"

//INFO: The player has to be in a car himself to do this. Can be used to detect whether the player is driving recklessly.
//	Before the player hits anything the return value is really large.
//	To see what the command would return use the debug widget: 'Car AI and Nodes/Display Reckless driving debug' 
//PARAM NOTES:
//PURPOSE: Return (in milliseconds) how long ago the player (in a car) last hit a car.  More info.. 
NATIVE FUNC INT GET_TIME_SINCE_PLAYER_HIT_VEHICLE( PLAYER_INDEX PlayerIndex ) = "0xafb2d9a35cc1f82d"

//INFO: The player has to be in a car himself to do this. Can be used to detect whether the player is driving recklessly.
//	Before the player hits anything the return value is really large.
//	To see what the command would return use the debug widget: 'Car AI and Nodes/Display Reckless driving debug' 
//PARAM NOTES:
//PURPOSE: Returns (in milliseconds) how long ago the player (in a car)  last hit a ped.  More info.. 
NATIVE FUNC INT GET_TIME_SINCE_PLAYER_HIT_PED( PLAYER_INDEX PlayerIndex ) = "0xb2d0b5ae5881bc0e"

//INFO: The player has to be in a car himself to do this. Can be used to detect whether the player is driving recklessly.
//	Before the player hits anything the return value is really large.
//	To see what the command would return use the debug widget: 'Car AI and Nodes/Display Reckless driving debug' 
//PARAM NOTES:
//PURPOSE: Returns (in milliseconds) how long ago the player (in a car)  last hit a building.  More info.. 
NATIVE FUNC INT GET_TIME_SINCE_PLAYER_HIT_BUILDING( PLAYER_INDEX PlayerIndex ) = "0xaec5115ef4b500ef"

//INFO: The player has to be in a car himself to do this. Can be used to detect whether the player is driving recklessly.
//	Before the player hits anything the return value is really large.
//	To see what the command would return use the debug widget: 'Car AI and Nodes/Display Reckless driving debug' 
//PARAM NOTES:
//PURPOSE: Returns (in milliseconds) how long ago the player (in a car)  last hit a object.  More info.. 
NATIVE FUNC INT GET_TIME_SINCE_PLAYER_HIT_OBJECT( PLAYER_INDEX PlayerIndex ) = "0xcfaf27ac3cad2e5a"

//INFO: The player has to be in a car himself to do this. Can be used to detect whether the player is driving recklessly.
//	Before the player hits anything the return value is really large.
//	To see what the command would return use the debug widget: 'Car AI and Nodes/Display Reckless driving debug' 
//PARAM NOTES:
//PURPOSE: Returns (in milliseconds) how long ago the player drove on the pavement.  More info.. 
NATIVE FUNC INT GET_TIME_SINCE_PLAYER_DROVE_ON_PAVEMENT( PLAYER_INDEX PlayerIndex ) = "0x70959fe6aaf74c96"

//INFO: The player has to be in a car himself to do this. Can be used to detect whether the player is driving recklessly.
//	Before the player hits anything the return value is really large.
//	To see what the command would return use the debug widget: 'Car AI and Nodes/Display Reckless driving debug' 
//PARAM NOTES:
//PURPOSE: Returns (in milliseconds) how long ago the player last ran a red light.  More info.. 
NATIVE FUNC INT GET_TIME_SINCE_PLAYER_RAN_LIGHT( PLAYER_INDEX PlayerIndex ) = "0x756550b7f103e66f"

//INFO: The player has to be in a car himself to do this. Can be used to detect whether the player is driving recklessly.
//	Before the player hits anything the return value is really large.
//	To see what the command would return use the debug widget: 'Car AI and Nodes/Display Reckless driving debug' 
//PARAM NOTES:
//PURPOSE: Returns (in milliseconds) how long ago the player last drove against the flow of traffic.  More info.. 
NATIVE FUNC INT GET_TIME_SINCE_PLAYER_DROVE_AGAINST_TRAFFIC( PLAYER_INDEX PlayerIndex ) = "0x5962f6054bc15dd5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the train the player would like to enter.
NATIVE FUNC VEHICLE_INDEX GET_TRAIN_PLAYER_WOULD_ENTER(PLAYER_INDEX PlayerIndex) = "0x04c13134f5cb89d1"

//~> 								Cutscene commands

//INFO: the player is considered safe if they are:
//    In a car and not entering or exiting or
//    On foot and not ragdolling 
//	  Use CAN_PLAYER_START_CUTSCENE() - this calls the above function, but also checks that the player is not a passenger in a taxi. 
//PARAM NOTES:
//PURPOSE: Returns if the player is in a safe state to trigger a cutscene.  More info.. 
NATIVE FUNC BOOL IS_PLAYER_READY_FOR_CUTSCENE( PLAYER_INDEX PlayerIndex ) = "0x682283641e48e60d"

//INFO: Call this before starting an animated cutscene. This tries to prevent the player from dying while the cutscene is playing. 
//	All fires, explosions and projectiles are removed from the world. All car fires are extinguished and it should be impossible to damage any car. 
//	Finally, a flag is set to tell the game that a cutscene is in progress. 
//	This command relies on CLEAR_CUTSCENE being called to set everything back to normal. 
//PARAM NOTES:
//PURPOSE: t makes the player everything-proof, disables his controls and stops anyone attacking him. More info
NATIVE PROC SET_PLAYER_SAFE_FOR_CUTSCENE( PLAYER_INDEX PlayerIndex ) = "0xf7ff5edcd2c90b51"

//~>							Targetting commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the player is pointing his weapon at the specified entity. 
NATIVE FUNC BOOL IS_PLAYER_TARGETTING_ENTITY( PLAYER_INDEX PlayerIndex, ENTITY_INDEX EntityIndex ) = "0x8bf92a6d56a911eb"

//INFO:
//PARAM NOTES:	The ENTITY_INDEX of the target aimed at by the specified player
//				will be returned by reference via EntityIndex
//PURPOSE:		Returns TRUE if the player is locked on to a valid entity
NATIVE FUNC BOOL GET_PLAYER_TARGET_ENTITY( PLAYER_INDEX PlayerIndex, ENTITY_INDEX& EntityIndex ) = "0x269c23e72e54a04e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Overrides the current player lock-on range (for this frame, needs to be called every frame to remain active)
NATIVE PROC SET_PLAYER_LOCKON_RANGE_OVERRIDE( PLAYER_INDEX PlayerIndex, FLOAT Range ) = "0x37f5f63782291e3b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the player is free aiming.
NATIVE FUNC BOOL IS_PLAYER_FREE_AIMING( PLAYER_INDEX PlayerIndex ) = "0x55e78b6aafef4eb8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the player is pointing his weapon at the specified entity.
NATIVE FUNC BOOL IS_PLAYER_FREE_AIMING_AT_ENTITY( PLAYER_INDEX PlayerIndex, ENTITY_INDEX EntityIndex ) = "0x24e6c39aac2154d0"

//INFO:
//PARAM NOTES:	The ENTITY_INDEX of the target aimed at by the specified player
//				will be returned by reference via EntityIndex
//PURPOSE:		Returns TRUE if the player is free aiming at an entity
NATIVE FUNC BOOL GET_ENTITY_PLAYER_IS_FREE_AIMING_AT( PLAYER_INDEX PlayerIndex, ENTITY_INDEX& EntityIndex) = "0xfd48978e4e1baa06"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the player is pointing his weapon at the specified entity
NATIVE FUNC BOOL IS_PLAYER_TARGETTING_ANYTHING( PLAYER_INDEX PlayerIndex ) = "0x20f5a2db460ab9bb"


//~>					Group commands 

//INFO: When the player is created, a group is also created with the player as its leader.
//	You should never need to create another group for the player to lead. 
//PARAM NOTES:
//PURPOSE: Gets the players group.  More info.. 
NATIVE FUNC GROUP_INDEX  GET_PLAYER_GROUP( PLAYER_INDEX PlayerIndex) = "0xfd8e434495ec2f26"


//~>								Mood commands

//INFO: 
//PARAM NOTES:
//PURPOSE: The players mood is set to normal.
NATIVE PROC SET_PLAYER_MOOD_NORMAL(PLAYER_INDEX PlayerIndex) = "0x31b4ebc58552715b"

//~> 							Force cleanup commands - a replacement for the death arrest system

// These first three flags are used by code
CONST_INT FORCE_CLEANUP_FLAG_PLAYER_KILLED_OR_ARRESTED	1
CONST_INT FORCE_CLEANUP_FLAG_SP_TO_MP					2
CONST_INT FORCE_CLEANUP_PAUSE_MENU_TERMINATED			4 // used exclusively when a ContinualUpdate script fired up by the pausemenu is told to shut down
// The scripts can define more values after this. Make sure that they are powers of 2 (8, 16, 32, ...)
CONST_INT FORCE_CLEANUP_FLAG_RANDOM_EVENTS				8
CONST_INT FORCE_CLEANUP_FLAG_DEBUG_MENU					16
CONST_INT FORCE_CLEANUP_FLAG_MAGDEMO					32
CONST_INT FORCE_CLEANUP_FLAG_REPEAT_PLAY				64
CONST_INT FORCE_CLEANUP_FLAG_DIRECTOR					128

//INFO: Using this command with FORCE_CLEANUP_FLAG_PLAYER_KILLED_OR_ARRESTED in a script means that you don't have to check IS_PLAYER_PLAYING in every loop. 
//	The command should be called just after SCRIPT and should only appear once in the script. 
//	If the player dies or gets arrested later then the script will jump back to this line and return TRUE
//	so you should probably have something like this in your script. 
//SCRIPT
//   IF HAS_FORCE_CLEANUP_OCCURRED(FORCE_CLEANUP_FLAG_PLAYER_KILLED_OR_ARRESTED)
//       MISSION_CLEANUP()   // or whatever your cleanup function is called
//   ENDIF
//	You can combine flags using the vertical bar to OR the bits like this
//	IF HAS_FORCE_CLEANUP_OCCURRED(FORCE_CLEANUP_FLAG_PLAYER_KILLED_OR_ARRESTED|FORCE_CLEANUP_FLAG_SP_TO_MP)
//       MISSION_CLEANUP()   // or whatever your cleanup function is called
//   ENDIF
//	The MISSION_CLEANUP routine will then be run whenever the player is killed or arrested, or a script calls 
//	FORCE_CLEANUP(FORCE_CLEANUP_FLAG_SP_TO_MP)
//PARAM NOTES: ForceCleanupBitField - specifies the types of force cleanup "events" that this script will respond to
//PURPOSE: Tells the game that if a force cleanup "event" that this script is interested in occurs then the script should jump back to the line after the command and continue processing from there. More info.. 
CONST_INT DEFAULT_FORCE_CLEANUP_FLAGS				FORCE_CLEANUP_FLAG_PLAYER_KILLED_OR_ARRESTED|FORCE_CLEANUP_FLAG_SP_TO_MP
NATIVE FUNC BOOL HAS_FORCE_CLEANUP_OCCURRED(INT ForceCleanupBitField = DEFAULT_FORCE_CLEANUP_FLAGS) = "0x4b34601c5c56f3ee"

//INFO: This command will cause all scripts that are listening for the given force cleanup event to jump back to the HAS_FORCE_CLEANUP_OCCURRED line and continue processing from there.
//PARAM NOTES: ForceCleanupBitField - the type of force cleanup "event" to send out to all active scripts
NATIVE PROC FORCE_CLEANUP(INT ForceCleanupBitField = FORCE_CLEANUP_FLAG_PLAYER_KILLED_OR_ARRESTED) = "0x2481b055c8b5ca09"

//INFO: This command works in the same way as FORCE_CLEANUP but only affects script threads with the given name
NATIVE PROC FORCE_CLEANUP_FOR_ALL_THREADS_WITH_THIS_NAME(STRING pName, INT ForceCleanupBitField = FORCE_CLEANUP_FLAG_PLAYER_KILLED_OR_ARRESTED) = "0x7dd73f7f62179990"

//INFO: This command works in the same way as FORCE_CLEANUP but only affects the script thread with the given thread ID
NATIVE PROC FORCE_CLEANUP_FOR_THREAD_WITH_THIS_ID(THREADID Thread_Id, int ForceCleanupBitField = FORCE_CLEANUP_FLAG_PLAYER_KILLED_OR_ARRESTED) = "0xd4798e4f64b31c25"

//PURPOSE: Returns the flag that caused force cleanup to trigger. It only makes sense to call this after HAS_FORCE_CLEANUP_OCCURRED has returned TRUE
NATIVE FUNC INT GET_CAUSE_OF_MOST_RECENT_FORCE_CLEANUP() = "0x27400a3ffa074f8b"

//~>								Ped interaction commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Use this to stop the police arresting the player. 
NATIVE PROC SET_POLICE_IGNORE_PLAYER( PLAYER_INDEX PlayerIndex, BOOL IgnorePlayer ) = "0xb5b3aae149fc278d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets all peds (including police) will ignore the player. 
NATIVE PROC SET_EVERYONE_IGNORE_PLAYER( PLAYER_INDEX PlayerIndex, BOOL IgnorePlayer ) = "0xac58ba7d19452704"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if thre player can be hassled by gangs.
NATIVE PROC SET_PLAYER_CAN_BE_HASSLED_BY_GANGS( PLAYER_INDEX PlayerIndex, BOOL bCanBeHassled ) = "0x9c7e01e1a0eaa797"

//INFO: Deprecated! Please now use SET_ALL_RANDOM_PEDS_FLEE_THIS_FRAME
//PARAM NOTES:
//PURPOSE: Stops all random peds from attacking the player, except cops. More info..
NATIVE PROC SET_ALL_RANDOM_PEDS_FLEE( PLAYER_INDEX PlayerIndex, BOOL PedsFlee ) = "0x7a8df8c7511be48a"


//INFO: Gang peds and randoms will all flee instead on this frame
//PARAM NOTES:
//PURPOSE: Stops all random peds from attacking the player, except cops. More info..
NATIVE PROC SET_ALL_RANDOM_PEDS_FLEE_THIS_FRAME( PLAYER_INDEX PlayerIndex ) = "0xfecbe8ed0e1259a5"


//INFO: Deprectaed! Please now use SET_ALL_NEUTRAL_RANDOM_PEDS_FLEE_THIS_FRAME
//PARAM NOTES:
//PURPOSE: Stops all random peds from attacking the player, except cops. More info..
NATIVE PROC SET_ALL_NEUTRAL_RANDOM_PEDS_FLEE( PLAYER_INDEX PlayerIndex, BOOL PedsFlee ) = "0x7f9fba1d5bb2ca14"


//INFO: Neutral randoms will all flee instead on this frame
//PARAM NOTES:
//PURPOSE: Stops all random peds from attacking the player, except cops. More info..
NATIVE PROC SET_ALL_NEUTRAL_RANDOM_PEDS_FLEE_THIS_FRAME( PLAYER_INDEX PlayerIndex ) = "0x710e43300e497e2a"

//INFO: Deprecated! Please now use SET_RANDOM_PEDS_ONLY_ATTACK_WITH_GUNS_THIS_FRAME
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_RANDOM_PEDS_ONLY_ATTACK_WITH_GUNS( PLAYER_INDEX PlayerIndex, BOOL Val ) = "0xc466b2cc66f5e0d4"

//INFO: Any random peds not armed with gun will flee instead of attacking on this frame
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_RANDOM_PEDS_ONLY_ATTACK_WITH_GUNS_THIS_FRAME( PLAYER_INDEX PlayerIndex ) = "0xd971e122e85dc9eb"

//~> 								Damage commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Call this once before you start checking HAS_PLAYER_DAMAGED_AT_LEAST_ONE_PED
NATIVE PROC CLEAR_PLAYER_HAS_DAMAGED_AT_LEAST_ONE_PED(PLAYER_INDEX PlayerIndex) = "0x3c2a46bb06553cee"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the player has damaged any peds since the last time that CLEAR_PLAYER_HAS_DAMAGED_AT_LEAST_ONE_PED was called
NATIVE FUNC BOOL HAS_PLAYER_DAMAGED_AT_LEAST_ONE_PED(PLAYER_INDEX PlayerIndex) = "0x51223ab40e2f620e"

//INFO: Exclude the animals.
//PARAM NOTES:
//PURPOSE: Call this once before you start checking HAS_PLAYER_DAMAGED_AT_LEAST_ONE_NON_ANIMAL_PED
NATIVE PROC CLEAR_PLAYER_HAS_DAMAGED_AT_LEAST_ONE_NON_ANIMAL_PED(PLAYER_INDEX PlayerIndex) = "0xf01ad4af166855d2"

//INFO: Exclude the animals.
//PARAM NOTES:
//PURPOSE: Returns TRUE if the player has damaged any peds since the last time that CLEAR_PLAYER_HAS_DAMAGED_AT_LEAST_ONE_NON_ANIMAL_PED was called
NATIVE FUNC BOOL HAS_PLAYER_DAMAGED_AT_LEAST_ONE_NON_ANIMAL_PED(PLAYER_INDEX PlayerIndex) = "0x7246ae6e7c9ca089"

//~>								Misc commands

//INFO: Note it might work best if ambient tasks make sure the player has been free for an ambient task for a few seconds depending on the situation.
//	(E.g. if the player hasn't done anything interesting for 5 seconds, allow cab hailing) 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the player is currently not in combat, climbing, jumping or firing a gun. More info..
NATIVE FUNC BOOL IS_PLAYER_FREE_FOR_AMBIENT_TASK(PLAYER_INDEX PlayerIndex) = "0x26ddf157f01e6504"

//INFO: 
//PARAM NOTES:
//PURPOSE: Peds ignore lower priority shocking events, for use in tightly scripted situations, must be reset to false when finished. More info..
NATIVE PROC SET_IGNORE_LOW_PRIORITY_SHOCKING_EVENTS( PLAYER_INDEX PlayerIndex, BOOL IgnoreEvents ) = "0xec26897438239334"

//INFO: This should be called when a mission is passed or on autosave.
//PARAM NOTES:
//PURPOSE: Any contributions to the wanted level are blocked for 5 seconds or so. More info..
NATIVE PROC START_FIRING_AMNESTY(INT iDuration = 5000) = "0x3b97c4414e778c45"

//INFO: 
//PARAM NOTES:If ForceRemove is set to TRUE, instantly removes helmet in a pop. If set to FALSE, will take it off in the same way that getting on/off bikes do – playing animation etc. 
//PURPOSE: Will remove the players helmet if they have one. More info..
NATIVE PROC REMOVE_PLAYER_HELMET(PLAYER_INDEX PlayerIndex, BOOL ForceRemove) = "0x2f163a300f34f245"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the ID of the object that the player will pick up if they press PICKUP now.
NATIVE FUNC OBJECT_INDEX GET_OBJECT_PLAYER_WILL_PICKUP(PLAYER_INDEX PlayerIndex) = "0x0757a4b70196ab75"

//INFO: 
//PARAM NOTES:
//PURPOSE:	Disable / Enable drawing of the specified player component as required. 
NATIVE PROC DISPLAY_PLAYER_COMPONENT(PED_COMPONENT ComponentIdx, BOOL bEnable) = "0x7e6a207868f07b7d"


//~>					Assisted Movement commands

//INFO: 
//PARAM NOTES: iRouteIndex must be from 0..ASSISTED_MOVEMENT_MAX_NUM_ROUTES
//PURPOSE: Open a scriptable Assisted Movement route for editing
NATIVE PROC ASSISTED_MOVEMENT_OPEN_ROUTE( INT iRouteIndex ) = "0x5b9800e127b28910"

//INFO: 
//PARAM NOTES:
//PURPOSE: Closes the Assisted Movement route which is currently being edited
NATIVE PROC ASSISTED_MOVEMENT_CLOSE_ROUTE( ) = "0x647dc34f84b77534"

//INFO: 
//PARAM NOTES:
//PURPOSE: Clears the Assisted Movement route which is currently being edited
NATIVE PROC ASSISTED_MOVEMENT_FLUSH_ROUTE( ) = "0x662e7343c29d10eb"

//INFO: 
//PARAM NOTES:
// x,y,z    : the location in worldspace, should be at ped's waist-height
// fWitdh   : the width of the route, governs from how far ped gets pulled in & how far they may stray from center
// fTension : how strongly the stickiness to the route is (0.0=weak, 0.5=default, 1.0=strong)
// iFlags   : a bitfield of flags from the ASSISTED_MOVEMENT_FLAGS enumeration (see top of this file), or '0' is none required.
//PURPOSE: Adds a point to the Assisted Movement route currently being edited
NATIVE PROC ASSISTED_MOVEMENT_ADD_POINT( FLOAT x, FLOAT y, FLOAT z, FLOAT fWidth=0.75, FLOAT fTension=0.5, INT iFlags=0 ) = "0xb2a3c724543d6261"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns whether the player is attached to any Assisted Movement route
NATIVE FUNC BOOL ASSISTED_MOVEMENT_IS_ON_ANY_ROUTE( ) = "0x977fc240046bc725"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns whether the player is attached to a script-created Assisted Movement
//         route.  The index of the scripted route is returned if so, or -1 otherwise.
NATIVE FUNC INT ASSISTED_MOVEMENT_IS_ON_SCRIPTED_ROUTE( ) = "0xc2e604bb77c0436c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Forces the player to be skip the aim intro next time they press the aim button
NATIVE PROC SET_PLAYER_FORCE_SKIP_AIM_INTRO(PLAYER_INDEX PlayerIndex, BOOL SkipIntro) = "0x29bd7dc6acd28546"

//INFO: 
//PARAM NOTES: This flag gets reset each frame, so should be called each frame while you want this behaviour
//PURPOSE: Forces the player to be zoomed in by default when aiming
NATIVE PROC SET_PLAYER_FORCED_ZOOM(PLAYER_INDEX PlayerIndex, BOOL ForcedZoom) = "0x921859563fe3c7d8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Forces the player to always aim
NATIVE PROC SET_PLAYER_FORCED_AIM(PLAYER_INDEX PlayerIndex, BOOL ForcedAim) = "0xf5a5b768549ee604"

//INFO: 
//PARAM NOTES:
//PURPOSE: Disables player ambient melee move - remember to reenable it after you're done!
NATIVE PROC SET_DISABLE_AMBIENT_MELEE_MOVE(PLAYER_INDEX PlayerIndex, BOOL Disable) = "0x0917a1352a09c319"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the maximum move blend ratio of the given player. e.g. can stop the ped running, sprinting etc.
NATIVE PROC SET_PLAYER_MAX_MOVE_BLEND_RATIO(PLAYER_INDEX PlayerIndex, FLOAT MaxMoveBlendRatio) = "0xea6ca3528cf9441b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether the local players walk controls are inverted
NATIVE PROC SET_INVERT_PLAYER_WALK(BOOL invert) = "0xdc6bf5ef8e0e75e7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether the local players look controls are inverted
NATIVE PROC SET_INVERT_PLAYER_LOOK(BOOL invert) = "0xc37b97ae6a42bcb1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Disables the player from firing
NATIVE PROC DISABLE_PLAYER_FIRING(PLAYER_INDEX PlayerIndex, BOOL disable) = "0xb07ec4599255161e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Disables the player from throwing grenades while in a gun aiming/firing state
NATIVE PROC DISABLE_PLAYER_THROW_GRENADE_WHILE_USING_GUN() = "0x4ad02a972d2153c3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the player's maximum armour to the specified value
NATIVE PROC SET_PLAYER_MAX_ARMOUR(PLAYER_INDEX PlayerIndex, INT MaxArmour) = "0x89a7d91fa86a73f1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the player's jack speed to the specified value (MP_ONLY)
NATIVE PROC SET_PLAYER_JACK_SPEED(PLAYER_INDEX PlayerIndex, INT JackSpeed) = "0xc4fa1b1238f97dda"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the player's stealth speed to the specified value, where 100 is normal speed
NATIVE PROC SET_PLAYER_STEALTH_SPEED(PLAYER_INDEX PlayerIndex, INT StealthSpeed) = "0x59f960d6f9f18040"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the index of the player's selected special ability slot
NATIVE FUNC INT GET_PLAYER_SELECTED_ABILITY_SLOT(PLAYER_INDEX PlayerIndex) = "0xb82d8d9ea7aba971"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the player's special ability in MP
NATIVE PROC SET_SPECIAL_ABILITY_MP(PLAYER_INDEX PlayerIndex, INT abilityType, INT abilitySlot = 0) = "0x5134e3f4c3ed2572"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the local player's special ability in MP
NATIVE FUNC SPECIAL_ABILITY_TYPE GET_LOCAL_PLAYER_SPECIAL_ABILITY_MP(INT abilitySlot = 0) = "0x40df36b3febdd50c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Deactivate the player's special ability in MP
NATIVE PROC SPECIAL_ABILITY_DEACTIVATE_MP(PLAYER_INDEX PlayerIndex, INT abilitySlot = 0) = "0x3a6863cc483284fd"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the player's special ability can be activated
NATIVE FUNC BOOL CAN_SPECIAL_ABILITY_BE_ACTIVATED(PLAYER_INDEX PlayerIndex, INT abilitySlot = 0) = "0x515321622d11b14c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the player's special ability can be activated
NATIVE FUNC BOOL CAN_SPECIAL_ABILITY_BE_SELECTED_IN_ARCADE_MODE(PLAYER_INDEX PlayerIndex, INT abilitySlot = 0) = "0x4149c64e5fcc4466"

//INFO: 
//PARAM NOTES:
//PURPOSE: Activates the player's special ability
NATIVE PROC SPECIAL_ABILITY_ACTIVATE(PLAYER_INDEX PlayerIndex, INT abilitySlot = 0) = "0xaef827744eca5aea"

//INFO: 
//PARAM NOTES:
//PURPOSE: Deactivates the player's special ability
NATIVE PROC SPECIAL_ABILITY_DEACTIVATE(PLAYER_INDEX PlayerIndex, INT abilitySlot = 0) = "0xc204033758e4127f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Deactivates the player's special ability immediately without applying the fadeout fx
NATIVE PROC SPECIAL_ABILITY_DEACTIVATE_FAST(PLAYER_INDEX PlayerIndex, INT abilitySlot = 0) = "0x85b547885d8f8b40"

//INFO: 
//PARAM NOTES:
//PURPOSE: Resets the player's special ability, i.e. deactivates and fully depletes the meter
NATIVE PROC SPECIAL_ABILITY_RESET(PLAYER_INDEX PlayerIndex, INT abilitySlot = 0) = "0xc59f3672444b1ee5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Should be called when the player has failed a mission. The logic to decide if the ability
//		   is charged by this happens in code
NATIVE PROC SPECIAL_ABILITY_CHARGE_ON_MISSION_FAILED(PLAYER_INDEX PlayerIndex, INT abilitySlot = 0) = "0xa131cc850da50cf0"

//INFO: 
//PARAM NOTES:
//PURPOSE: If the player is driving on a highway, returns true otherwise false.
NATIVE FUNC BOOL GET_IS_PLAYER_DRIVING_ON_HIGHWAY(PLAYER_INDEX PlayerIndex) = "0xe7cdc562b263ca12"

//INFO: 
//PARAM NOTES:
//PURPOSE: Used to test if the player has performed a WRECKLESS_TYPE. This will be valid over a number of frames depending on the type.
NATIVE FUNC BOOL GET_IS_PLAYER_DRIVING_WRECKLESS(PLAYER_INDEX PlayerIndex, WRECKLESS_TYPE wreckless) = "0xf2162c96615104e4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Modifies the player special ability meter with a small charge.
//		   If increment is true it will add a charge other remove.
//		   If ignoreActive is true the charge will be added even if the ability is currently active
//		   otherwise command is ignored.
NATIVE PROC SPECIAL_ABILITY_CHARGE_SMALL(PLAYER_INDEX PlayerIndex, BOOL increment, BOOL ignoreActive, INT abilitySlot = 0) = "0x7c94b5047d73de57"

//INFO: 
//PARAM NOTES:
//PURPOSE: Modifies the player special ability meter with a medium charge.
//		   If increment is true it will add a charge other remove.
//		   If ignoreActive is true the charge will be added even if the ability is currently active
//		   otherwise command is ignored.
NATIVE PROC SPECIAL_ABILITY_CHARGE_MEDIUM(PLAYER_INDEX PlayerIndex, BOOL increment, BOOL ignoreActive, INT abilitySlot = 0) = "0x3f2a203e395eb931"

//INFO: 
//PARAM NOTES:
//PURPOSE: Modifies the player special ability meter with a large charge.
//		   If increment is true it will add a charge other remove.
//		   If ignoreActive is true the charge will be added even if the ability is currently active
//		   otherwise command is ignored.
NATIVE PROC SPECIAL_ABILITY_CHARGE_LARGE(PLAYER_INDEX PlayerIndex, BOOL increment, BOOL ignoreActive, INT abilitySlot = 0) = "0x06055697ad0bc5eb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Flags the continuous charge as active. This needs to be called every frame while charging should take place.
//		   If ignoreActive is true the charge will be added even if the ability is currently active
//		   otherwise command is ignored.
NATIVE PROC SPECIAL_ABILITY_CHARGE_CONTINUOUS(PLAYER_INDEX PlayerIndex, BOOL ignoreActive, INT abilitySlot = 0) = "0x38a059a79a45e98d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Adds an absolute charge in seconds to the player special ability meter. By default the ability
//		   meter is 30 seconds so adding a charge of 30 or higher will fill the meter.
NATIVE PROC SPECIAL_ABILITY_CHARGE_ABSOLUTE(PLAYER_INDEX PlayerIndex, INT charge, BOOL ignoreActive, INT abilitySlot = 0) = "0x8c8a3177ffab2a2d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Adds a normalized charge to the player special ability. Example: 0.1 is 10% of the meter
//		   and a charge of 1.0 will fill the meter.
NATIVE PROC SPECIAL_ABILITY_CHARGE_NORMALIZED(PLAYER_INDEX PlayerIndex, FLOAT charge, BOOL ignoreActive, INT abilitySlot = 0) = "0x266e4b6e6c97e2cb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Fills the player special ability meter.
NATIVE PROC SPECIAL_ABILITY_FILL_METER(PLAYER_INDEX PlayerIndex, BOOL ignoreActive, INT abilitySlot = 0) = "0x6dd7ec85b970fff8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Depletes the player special ability meter.
NATIVE PROC SPECIAL_ABILITY_DEPLETE_METER(PLAYER_INDEX PlayerIndex, BOOL ignoreActive, INT abilitySlot = 0) = "0x8c6a1e9558ae8255"

//INFO: 
//PARAM NOTES:
//PURPOSE: Locks the player special ability for the given player.
NATIVE PROC SPECIAL_ABILITY_LOCK(MODEL_NAMES PlayerModelHashKey, BOOL isArcadePlayer = FALSE) = "0x36f8265cd4c1dc7b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Unlocks the player special ability for the given player.
NATIVE PROC SPECIAL_ABILITY_UNLOCK(MODEL_NAMES PlayerModelHashKey, BOOL isArcadePlayer = FALSE) = "0x9af618154f4af9d7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets a value that shows how much time is left on an active ability (0 - 100)
NATIVE FUNC FLOAT GET_SPECIAL_ABILITY_REMAINING_PERCENTAGE(PLAYER_INDEX PlayerIndex, INT abilitySlot = 0) = "0x9c2aba0bdeb048e7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the special ability has been unlocked for the given player.
NATIVE FUNC BOOL IS_SPECIAL_ABILITY_UNLOCKED(MODEL_NAMES PlayerModelHashKey) = "0xbde74e4e16908df5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns if the player special ability is active or not.
NATIVE FUNC BOOL IS_SPECIAL_ABILITY_ACTIVE(PLAYER_INDEX PlayerIndex, INT abilitySlot = 0) = "0xa89c6f3818cc3acb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true when the player's special ability meter is full.
NATIVE FUNC BOOL IS_SPECIAL_ABILITY_METER_FULL(PLAYER_INDEX PlayerIndex, INT abilitySlot = 0) = "0xc9eabec2eb7eac4a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true when the player's special ability is enabled.
NATIVE FUNC BOOL IS_SPECIAL_ABILITY_ENABLED(PLAYER_INDEX PlayerIndex, INT abilitySlot = 0) = "0x74eacb77c7688f1c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the multiplier that modifies special ability charges
NATIVE PROC SET_SPECIAL_ABILITY_MULTIPLIER(float multiplier) = "0xe4fd06c1760ec85e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Use after setting the special ability value through the stat variable
NATIVE PROC UPDATE_SPECIAL_ABILITY_FROM_STAT(PLAYER_INDEX PlayerIndex, INT abilitySlot = 0) = "0xd7072950313d43d7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Starts local player vfx for the ability in the provided slot
NATIVE PROC START_LOCAL_PLAYER_SPECIAL_ABILITY_FX(INT abilitySlot = 0) = "0xb97d5fbf7d02b645"

//INFO: 
//PARAM NOTES:
//PURPOSE: Stops local player vfx for the ability in the provided slot
NATIVE PROC STOP_LOCAL_PLAYER_SPECIAL_ABILITY_FX(INT abilitySlot = 0) = "0x43d20c82aa9fe610"

//INFO: A disabled special ability will allow the meter to be filled/depleted but the player can't activate the ability.
//PARAM NOTES:
//PURPOSE: Enables or disables the player special ability.
NATIVE PROC ENABLE_SPECIAL_ABILITY(PLAYER_INDEX PlayerIndex, BOOL enable, INT abilitySlot = 0) = "0x9f1fd386a42a87da"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns if the area in front of the player is free for mopping, expensive!
NATIVE FUNC BOOL GET_IS_MOPPING_AREA_FREE_IN_FRONT_OF_PLAYER(PLAYER_INDEX PlayerIndex, float fRadius) = "0xa61d663494402396"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the last vehicle that the player had a near miss with
NATIVE FUNC VEHICLE_INDEX GET_LAST_NEAR_MISS_VEHICLE(PLAYER_INDEX PlayerIndex) = "0x2f6194032ec5ec20"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the time since the last near vehicle miss occured
NATIVE FUNC INT GET_TIME_SINCE_LAST_NEAR_MISS(PLAYER_INDEX PlayerIndex) = "0x6bdcc60e2c06d024"

//INFO: This function handles map and population loading. UPDATE_PLAYER_TELEPORT should be queried for completion.
//PARAM NOTES:
//PURPOSE: Starts a player teleport to the given coordinates. More...
NATIVE PROC START_PLAYER_TELEPORT(PLAYER_INDEX PlayerIndex, Vector VecCoors, FLOAT heading, BOOL teleportVehicle = TRUE, BOOL snapToGround = TRUE, BOOL fadePlayerOut = TRUE) = "0x8a87922c72f578ec"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true when a player teleport has finished and everything is loaded. Should be called every frame.
NATIVE FUNC BOOL UPDATE_PLAYER_TELEPORT(PLAYER_INDEX PlayerIndex) = "0x0c752c2ccfc18307"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if a player teleport is currently active
NATIVE FUNC BOOL IS_PLAYER_TELEPORT_ACTIVE() = "0xbc4351060befb0d2"

//INFO:
//PARAM NOTES:
//PURPOSE: Stops teleport, shuts down the load scene, if active
NATIVE PROC STOP_PLAYER_TELEPORT() = "0x093f334b2f3729db"

//INFO: The return value can roughly be considered as a noise range in meters, ramping down over time towards zero.
//PARAM NOTES: PlayerIndex should be a valid SP or MP player.
//PURPOSE: Get an estimate of how much noise a player is making, primarily intended for blipping purposes.
NATIVE FUNC FLOAT GET_PLAYER_CURRENT_STEALTH_NOISE(PLAYER_INDEX PlayerIndex) = "0x62dde94612b5849e"

//INFO: This function alters how quicky the players health can recharge
//PARAM NOTES: Mult: 1.0 uses the default rate, lower being slower, higher being quicker.  e.g. 1.5 is 50% quicker, 0.0 doesn't recharge
//PURPOSE: Allows the script to modify how quickly the players health recharges
NATIVE PROC SET_PLAYER_HEALTH_RECHARGE_MULTIPLIER(PLAYER_INDEX PlayerIndex, FLOAT Mult) = "0xc0d061dfdaf121ee"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the current max percentage that a player's health can recharge to, as a float between 0.0 and 1.0
NATIVE FUNC FLOAT GET_PLAYER_HEALTH_RECHARGE_MAX_PERCENT(PLAYER_INDEX PlayerIndex) = "0x3c2c079ce6f46b91"

//INFO: This function alters the maximum percentage that a player's health can recharge to
//PARAM NOTES: Percent: Must be greater than 0.0, and equal or less than 1.0. Default percentage set in code is 0.5 (50%)
//PURPOSE: Allows the script to modify the max percentage that a player's health can recharge to
NATIVE PROC SET_PLAYER_HEALTH_RECHARGE_MAX_PERCENT(PLAYER_INDEX PlayerIndex, FLOAT Percent) = "0x7effc69e5350eed6"

//INFO: This function disables the players health for a frame. 
//PARAM NOTES: Needs to be called every frame.
//PURPOSE: Allows the script to disable the players health recharges
NATIVE PROC DISABLE_PLAYER_HEALTH_RECHARGE(PLAYER_INDEX PlayerIndex) = "0x196e0bb6e33c96bb"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the current override of the minimum fall height that causes the ped to trigger ragdoll in meters. If less than 0.0, we're not applying an override (default -1.0).
NATIVE FUNC FLOAT GET_PLAYER_FALL_DISTANCE_TO_TRIGGER_RAGDOLL_OVERRIDE(PLAYER_INDEX PlayerIndex) = "0xef60704068e3e7c1"

//INFO: This function alters the minimum fall height that causes the ped to trigger ragdoll.
//PARAM NOTES: Distance (m): Must be greater or equal to 0.0. The default fall distance trigger is between 6m and 8.5m (depending on strength stat).
//PURPOSE: Allows the script to modify the minimum fall height that causes the ped to trigger ragdoll.
NATIVE PROC SET_PLAYER_FALL_DISTANCE_TO_TRIGGER_RAGDOLL_OVERRIDE(PLAYER_INDEX PlayerIndex, FLOAT Distance) = "0x9d4c11eeebeddcff"

//INFO: This function will change the given players damage multiplier
//PARAM NOTES:
//PURPOSE: Applies a damage modifier to the player when inflicting weapon damage
NATIVE PROC SET_PLAYER_WEAPON_DAMAGE_MODIFIER(PLAYER_INDEX PlayerIndex, FLOAT Modifier) = "0xd27f869625866850"

//INFO: This function will change the given players defense multiplier against damage 
//PARAM NOTES:
//PURPOSE: Applies a modifier to the player damage when receiving weapon damage
NATIVE PROC SET_PLAYER_WEAPON_DEFENSE_MODIFIER(PLAYER_INDEX PlayerIndex, FLOAT Modifier) = "0xefe4775047323c19"

//INFO: This function will change the given players defense multiplier against damage 
//PARAM NOTES:
//PURPOSE: Applies a modifier to the player damage when receiving weapon damage from a minigun
NATIVE PROC SET_PLAYER_WEAPON_MINIGUN_DEFENSE_MODIFIER(PLAYER_INDEX PlayerIndex, FLOAT Modifier) = "0xbf94e55ee11dabdf"

//INFO: This function will change the given players melee damage multiplier
//PARAM NOTES:
//PURPOSE: Applies a damage modifier to the player when inflicting weapon damage
NATIVE PROC SET_PLAYER_MELEE_WEAPON_DAMAGE_MODIFIER(PLAYER_INDEX PlayerIndex, FLOAT Modifier, BOOL AffectsUnarmed = TRUE) = "0xabb7c36b502bf82e"

//INFO: This function will change the given players defense multiplier against melee damage
//PARAM NOTES:
//PURPOSE: Applies a modifier to the player damage when receiving weapon damage
NATIVE PROC SET_PLAYER_MELEE_WEAPON_DEFENSE_MODIFIER(PLAYER_INDEX PlayerIndex, FLOAT Modifier) = "0x59c6987f8fa159ba"

//INFO: This function will change the given players impulse force when inflicting melee damage against players
//PARAM NOTES:
//PURPOSE: Applies a modifier to the force inflicted by melee damage. Can only increase (modifier >= 1.0)
NATIVE PROC SET_PLAYER_MELEE_WEAPON_FORCE_MODIFIER(PLAYER_INDEX PlayerIndex, FLOAT Modifier) = "0x6183b4f11f0b8d09"

//INFO: This function will change the given players vehicle damage multiplier
//PARAM NOTES:
//PURPOSE: Applies a vehicle damage modifier to the player when inflicting vehicle damage
NATIVE PROC SET_PLAYER_VEHICLE_DAMAGE_MODIFIER(PLAYER_INDEX PlayerIndex, FLOAT Modifier) = "0x12aa10f5fac06542"

//INFO: This function will change the given players defense multiplier against vehicle damage (rammed by, collision damage).
//PARAM NOTES:
//PURPOSE: Applies a vehicle defense modifier to the player when receiving vehicle damage
NATIVE PROC SET_PLAYER_VEHICLE_DEFENSE_MODIFIER(PLAYER_INDEX PlayerIndex, FLOAT Modifier) = "0x0acd4d4123d79892"

//INFO: This function will set the max amount of damage the given playrer will receive when it receives an explosive damage event.
//PARAM NOTES: MaxExplosiveDamage: Reset this to -1.0 when finished! 
//PURPOSE: Sets the maximum amount of damage the player will receive from an explosive damage event. 
NATIVE PROC SET_PLAYER_MAX_EXPLOSIVE_DAMAGE(PLAYER_INDEX PlayerIndex, FLOAT MaxExplosiveDamage = -1.0) = "0xfa556584ae68db4b"

//INFO: This function will change the given players explosive damage multiplier.
//PARAM NOTES: Modifier: Reset this to 1.0f when finished!
//PURPOSE: Applies an explosive damage modifier to the player when receiving explosive damage.
NATIVE PROC SET_PLAYER_EXPLOSIVE_DAMAGE_MODIFIER(PLAYER_INDEX PlayerIndex, FLOAT Modifier = 1.0) = "0x9b8b6c9b77039457"

//INFO: This function will change the given players defense multiplier against armed weapon takedowns, potentially making it non-lethal
//PARAM NOTES:
//PURPOSE: Applies a modifier to the player damage when receiving a weapon takedown
NATIVE PROC SET_PLAYER_WEAPON_TAKEDOWN_DEFENSE_MODIFIER(PLAYER_INDEX PlayerIndex, FLOAT Modifier) = "0x9e5ca28f9b676421"

//INFO: This function sets the tint index of the parachute for the player
//PARAM NOTES:
//PURPOSE: Allows script to control the tint index of the parachute
NATIVE PROC SET_PLAYER_PARACHUTE_TINT_INDEX(PLAYER_INDEX PlayerIndex, INT TintIndex) = "0x5b315b77ff0579f4"

//INFO: This function gets the tint index of the parachute for the player
//PARAM NOTES:
//PURPOSE: Allows script to control the tint index of the parachute
NATIVE PROC GET_PLAYER_PARACHUTE_TINT_INDEX(PLAYER_INDEX PlayerIndex, INT& TintIndex) = "0xfc2bfa7cbd781b8f"

//INFO: This function sets the tint index of the reserve parachute for the player
//PARAM NOTES:
//PURPOSE: Allows script to control the tint index of the reserve parachute
NATIVE PROC SET_PLAYER_RESERVE_PARACHUTE_TINT_INDEX(PLAYER_INDEX PlayerIndex, INT TintIndex) = "0x4ffa0b650332a748"

//INFO: This function gets the tint index of the reserve parachute for the player
//PARAM NOTES:
//PURPOSE: Allows script to control the tint index of the reserve parachute
NATIVE PROC GET_PLAYER_RESERVE_PARACHUTE_TINT_INDEX(PLAYER_INDEX PlayerIndex, INT& TintIndex) = "0x4d70bbbc048f9efe"

//INFO: This function sets the tint index of the parachute pack for the player
//PARAM NOTES:
//PURPOSE: Allows script to control the tint index of the parachute pack
NATIVE PROC SET_PLAYER_PARACHUTE_PACK_TINT_INDEX(PLAYER_INDEX PlayerIndex, INT TintIndex) = "0x6a9da6a45b05cbac"

//INFO: This function gets the tint index of the parachute pack for the player
//PARAM NOTES:
//PURPOSE: Allows script to control the tint index of the parachute pack
NATIVE PROC GET_PLAYER_PARACHUTE_PACK_TINT_INDEX(PLAYER_INDEX PlayerIndex, INT& TintIndex) = "0x5a52ede69663ab67"

//INFO: This function gives the player a reserve parachute.
//PARAM NOTES:
//PURPOSE: Allows script to control the tint index of the parachute pack
NATIVE PROC SET_PLAYER_HAS_RESERVE_PARACHUTE(PLAYER_INDEX PlayerIndex) = "0xadaf9b9713526673"

//INFO: This function returns true if player has a reserve parachute.
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC BOOL GET_PLAYER_HAS_RESERVE_PARACHUTE(PLAYER_INDEX PlayerIndex) = "0xe37296e8bded7a5c"

//INFO: This function controls whether the player is allowed to leave a smoke trail during parachuting
//PARAM NOTES:
//PURPOSE: Allows script to control parachute smoke trails for the player
NATIVE PROC SET_PLAYER_CAN_LEAVE_PARACHUTE_SMOKE_TRAIL(PLAYER_INDEX PlayerIndex, BOOL CanLeaveParachuteSmokeTrail) = "0x0b5cb004ea93110f"

//INFO: This function sets the color of the parachute smoke trail for the player
//PARAM NOTES:
//PURPOSE: Allows script to control the color of the parachute smoke trails
NATIVE PROC SET_PLAYER_PARACHUTE_SMOKE_TRAIL_COLOR(PLAYER_INDEX PlayerIndex, INT Red, INT Green, INT Blue) = "0x2a4c3472cd44ab3c"

//INFO: This function gets the color of the parachute smoke trail for the player
//PARAM NOTES:
//PURPOSE: Allows script to control the color of the parachute smoke trails
NATIVE PROC GET_PLAYER_PARACHUTE_SMOKE_TRAIL_COLOR(PLAYER_INDEX PlayerIndex, INT& Red, INT& Green, INT& Blue) = "0x593c0beb67fa713d"

//INFO: Allows script to softly force players to prefer entering the rear seats of the specified vehicle
//PARAM NOTES: If VehicleIndex is NULL this will apply to all vehicles
//PURPOSE: 
NATIVE PROC SET_PLAYER_RESET_FLAG_PREFER_REAR_SEATS(PLAYER_INDEX PlayerIndex, VEHICLE_INDEX VehicleIndex) = "0x11d2f13707a54f0a"

//INFO: Allows script to softly force players to prefer entering the front passenger of the specified vehicle
//PARAM NOTES: If VehicleIndex is NULL this will apply to all vehicles
//PURPOSE: 
NATIVE PROC SET_PLAYER_RESET_FLAG_PREFER_FRONT_PASSENGER_SEAT(PLAYER_INDEX PlayerIndex, VEHICLE_INDEX VehicleIndex) = "0x5f013a06717af95a"

//INFO: This function sets the palette index of the player's phone.
//PARAM NOTES:
//PURPOSE: Allows script to control the color of the phone
NATIVE PROC SET_PLAYER_PHONE_PALETTE_IDX(PLAYER_INDEX PlayerIndex, INT Index) = "0x801bbd5e2830170e"

//INFO: This function returns the palette index of the player's phone.
//PARAM NOTES:
//PURPOSE: Allows script to know the color of the phone
NATIVE FUNC INT GET_PLAYER_PHONE_PALETTE_IDX(PLAYER_INDEX PlayerIndex) = "0x01cbf2e57ed4fcf1"

//INFO: Debug only function
//PARAM NOTES:
//PURPOSE: Displays damage info for all players
NATIVE PROC SET_DISPLAY_PLAYER_DAMAGE_INFO(BOOL Display) = "0xde816b2a86175f36"

//INFO:  A return value of 1.0 is the default, > 1.0 is noisier, < 1.0 is quieter (for AI reaction purposes).
//PARAM NOTES: PlayerIndex should be a valid SP player.
//PURPOSE: Returns what factor a given player's stealth noise (for AI reaction purposes) is being adjusted by.  The multiplier returned 
//         varies based on if the player is sneaking or not (see SET_PLAYER_NOISE_MULTIPLIER and SET_PLAYER_SNEAKING_NOISE_MULTIPLIER)
NATIVE FUNC FLOAT GET_PLAYER_NOISE_MULTIPLIER(PLAYER_INDEX PlayerIndex) = "0x0275327f7112d849"

//INFO: Sets how noisy a player is for AI reaction purposes.
//PARAM NOTES: Mult:  1.0 is the default, > 1.0 is to scale a player to be noisier, < 1.0 scales a player to be quieter.
//PURPOSE: Allows script to control how noisy a player is for AI reaction purposes.  This multiplier affects the player while moving normally (not sneaking).
NATIVE PROC SET_PLAYER_NOISE_MULTIPLIER(PLAYER_INDEX PlayerIndex, FLOAT Mult) = "0xf3e520d4ddfe531b"

//INFO: Sets how noisy a player is while sneaking for AI reaction purposes.
//PARAM NOTES: Mult:  1.0 is the default, > 1.0 is to scale a sneaking player to be noiser, < 1.0 scales a player while sneaking to be quieter.
//PURPOSE:  Allows script to control how noisy a player is for AI reaction purposes.  This multiplier affects the player while sneaking.
NATIVE PROC SET_PLAYER_SNEAKING_NOISE_MULTIPLIER(PLAYER_INDEX PlayerIndex, FLOAT Mult) = "0xa79405544d13368b"

//INFO: Returns if a player's stealth noise value is smaller than the distance to the given ped.
//PARAM NOTES: PlayerIndex should be a valid SP player.
//PURPOSE: Returns if a player's stealth noise value is smaller than the distance to the given ped.
NATIVE FUNC BOOL CAN_PED_HEAR_PLAYER(PLAYER_INDEX PlayerIndex, PED_INDEX PedIndex) = "0x42a51c8e69566474"

//INFO: Set if auto-give the player a parachute when he gets into a plane or helicopter.
//PARAM NOTES:
//PURPOSE: Give the player a parchute automatically when he gets into a plane or helicoper. It will be auto-equipped when the player jump out.
NATIVE PROC SET_AUTO_GIVE_PARACHUTE_WHEN_ENTER_PLANE(PLAYER_INDEX PlayerIndex, BOOL GiveParachute) = "0xc5504757fd12bb7b"

//INFO: Set if auto-give the player scuba gear when he exits certain vehicles.
//PARAM NOTES:
//PURPOSE: Give the player scuba gear automatically when he exits certain vehicles.
NATIVE PROC SET_AUTO_GIVE_SCUBA_GEAR_WHEN_EXIT_VEHICLE(PLAYER_INDEX PlayerIndex, BOOL GiveScubaGear) = "0xc7bfb1837a4167db"

// PURPOSE: This will simulate the player's controller input. This simulation would move the player
//			actor forward until the left stick is touched or the timer is reached.
// NOTE:	To skip tranisation when coming out a cut scene, e.g., form idle to run, the vignette leadout should sequence the player to the run node.  
// PARAMS:  playerIdx - index of the player to check
//			moveBlendRatio - move blend ratio to simulate as if the player were inputing it on the controller. (1.0: walk; 2.0: run; 3.0: sprint)
//			timer - this can be interrupted if left stick is touched, in millisecond. 
//			heading - simulated heading. Range from -180.0 to 180.0 degrees.
//			useRelativeHeading - if the heading is global or local to the ped.
//			noInputInterruption - if true, don't break out on input changes, it just times out.
NATIVE PROC SIMULATE_PLAYER_INPUT_GAIT(PLAYER_INDEX playerIdx, FLOAT moveBlendRatio, INT timer=2000, FLOAT heading=0.0, BOOL useRelativeHeading=TRUE, BOOL noInputInterruption=FALSE) = "0x44b88fb74a8ddc72"

// PURPOSE: This will reset the simulated player gait 
NATIVE PROC RESET_PLAYER_INPUT_GAIT(PLAYER_INDEX playerIdx) = "0x2fa820332400f593"

//INFO: Modify how easy AI can see the player when stealthed
//PARAM NOTES:
//PURPOSE: Modify how easy AI can see the player when stealthed
NATIVE PROC SET_PLAYER_STEALTH_PERCEPTION_MODIFIER(PLAYER_INDEX PlayerIndex, FLOAT StealthPerceptionModifier) = "0xa5695a8b4fdb4f5e"

//INFO: Get the current stealth modifier for the player
//PARAM NOTES:
//PURPOSE: Get the current stealth modifier for the player
NATIVE FUNC FLOAT GET_PLAYER_STEALTH_PERCEPTION_MODIFIER(PLAYER_INDEX PlayerIndex) = "0x3288b5aa51284100"

//INFO: Returns whether the specified player is a remote player in a vehicle that doesn't exist on the local machine
//PURPOSE: Returns whether the specified player is a remote player in a vehicle that doesn't exist on the local machine
NATIVE FUNC BOOL IS_REMOTE_PLAYER_IN_NON_CLONED_VEHICLE(PLAYER_INDEX PlayerIndex) = "0xe1e3700d85b26c1b"
//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a reset flag to more easily prevent player from jumping if a climb point is nearby.
NATIVE PROC INCREASE_PLAYER_JUMP_SUPPRESSION_RANGE(PLAYER_INDEX PlayerIndex) = "0x7544277489901b13"

//INFO: Enable/disable player simulating aiming. 
//PARAM NOTES:
//PURPOSE: Simulate player aiming input. Disabled on input detection.
NATIVE PROC SET_PLAYER_SIMULATE_AIMING(PLAYER_INDEX PlayerIndex, BOOL SimulateAiming) = "0xe528977784fc248a"

//INFO: Set pin frames on peds character cloth 
//PARAM NOTES:
//PURPOSE: Set pin frames on peds character cloth 
NATIVE PROC SET_PLAYER_CLOTH_PIN_FRAMES(PLAYER_INDEX PlayerIndex, INT pinFrames) = "0x1dd4b2f07d800518"

//INFO: Set number of frames to lock cloth
//PARAM NOTES:
//PURPOSE: Set number of frames to lock cloth
NATIVE PROC SET_PLAYER_CLOTH_LOCK_COUNTER(INT lockCounter) = "0x148b70d5e8887d3f"

//INFO: Create and attach collision bound to ped's character cloth
//PARAM NOTES:
//PURPOSE: Create and attach collision bound to ped's character cloth
NATIVE PROC PLAYER_ATTACH_VIRTUAL_BOUND(VECTOR pos, VECTOR rot, FLOAT fCapsuleLen, FLOAT fCapsuleRad) = "0x45ab8ba30f865cb3"

//INFO: Detach collision bound from ped's character cloth
//PARAM NOTES:
//PURPOSE: Detach collision bound from ped's character cloth
NATIVE PROC PLAYER_DETACH_VIRTUAL_BOUND() = "0x0040caada929b9a5"

//INFO: Switch to extra set of pin radiuses
//PARAM NOTES:
//PURPOSE: Switch to extra set of pin radiuses
NATIVE PROC SET_PLAYER_CLOTH_PACKAGE_INDEX(INT packageIndex) = "0x3c42bb73c8569132"

//INFO: Checks if the player has been spotted in a stolen vehicle
//PARAM NOTES:
//PURPOSE: Checks if the player has been spotted in a stolen vehicle
NATIVE FUNC BOOL HAS_PLAYER_BEEN_SPOTTED_IN_STOLEN_VEHICLE(PLAYER_INDEX PlayerIndex) = "0xbeeefdea6103f9d5"

//INFO: Gets the ped that has spotted the player in a stolen vehicle
//PARAM NOTES:
//PURPOSE: Gets the ped that has spotted the player in a stolen vehicle
NATIVE FUNC PED_INDEX GET_SPOTTER_OF_PLAYER_IN_STOLEN_VEHICLE(PLAYER_INDEX PlayerIndex) = "0x3b9b5f040dbecaa3"

//INFO: Needs to be set each frame
//PARAM NOTES:
//PURPOSE: Makes the player cover search scoring take into account the threats about the player for cover selection
NATIVE PROC SET_PLAYER_TO_USE_COVER_THREAT_WEIGHTING(PLAYER_INDEX PlayerIndex) = "0xd7ec8c7119c8f543"

//INFO: 
//PARAM NOTES:
//PURPOSE: Is player currently in a gun fight?
NATIVE FUNC BOOL IS_PLAYER_BATTLE_AWARE(PLAYER_INDEX PlayerIndex) = "0xaf3f5649b6d00465"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get last battle event time. 
NATIVE FUNC BOOL GET_PLAYER_RECEIVED_BATTLE_EVENT_RECENTLY(PLAYER_INDEX PlayerIndex, INT nTime, BOOL bIncludeLocalEvents = FALSE) = "0x97e6091aa1973956"

//INFO: 
//PARAM NOTES:
//PURPOSE: Extend the world boundary to include the given coordinate
NATIVE PROC EXTEND_WORLD_BOUNDARY_FOR_PLAYER(VECTOR VecCoors) = "0xf9b446afd56f5445"

//INFO: 
//PARAM NOTES:
//PURPOSE: Rest the world boundary to default
NATIVE PROC RESET_WORLD_BOUNDARY_FOR_PLAYER() = "0xc6c76b77086d3daa"

//INFO: 
//PARAM NOTES:
//PURPOSE: Is player riding a train?
NATIVE FUNC BOOL IS_PLAYER_RIDING_TRAIN(PLAYER_INDEX PlayerIndex) = "0xe267eaf3df9f6bd1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Is player outside of world boundary?
NATIVE FUNC BOOL HAS_PLAYER_LEFT_THE_WORLD(PLAYER_INDEX PlayerIndex) = "0x4f9fbd9d1f101839"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a reset flag that will prevent the dispatched helicopters for this target player from refueling
NATIVE PROC DISABLE_DISPATCH_HELI_REFUELING(PLAYER_INDEX PlayerIndex) = "0x881ac55434ed380a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a reset flag that will prevent the spawn delay for the next heli when a dispatched heli (for this target player) is destroyed
NATIVE PROC DISABLE_HELI_DESTROYED_DISPATCH_SPAWN_DELAY(PLAYER_INDEX PlayerIndex) = "0x139c854370f25197"

//INFO: Enable/disable whether a player leaves behind a ped if they leave a session. 
//PARAM NOTES:
//PURPOSE: To allow script the capability to control whether a player leaves behind a ped or not.
NATIVE PROC SET_PLAYER_LEAVE_PED_BEHIND(PLAYER_INDEX PlayerIndex, BOOL LeavePedBehind) = "0xedd6fa5743d3a359"

//INFO:  An override for parachute variation. Used to sync up script and code.
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_PLAYER_PARACHUTE_VARIATION_OVERRIDE(PLAYER_INDEX PlayerIndex, PED_COMPONENT ComponentNumber, INT NewDrawableNumber, INT TexID = 0, INT AltDrawableID = 0) = "0x5663081cf61457eb"

//INFO:  An override for parachute variation. clears the call to SET_PED_PARACHUTE_VARIATION_OVERRIDE.
//PARAM NOTES:
//PURPOSE:
NATIVE PROC CLEAR_PLAYER_PARACHUTE_VARIATION_OVERRIDE(PLAYER_INDEX PlayerIndex) = "0xdfce9946492b1ebb"

//INFO:  An override for parachute model.
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER_INDEX PlayerIndex, INT ModelNameHash) = "0x4b91103eae3ecfbb"

//INFO:  An override for reserve parachute model.
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_PLAYER_RESERVE_PARACHUTE_MODEL_OVERRIDE(PLAYER_INDEX PlayerIndex, INT ModelNameHash) = "0x97a7e5b40d58666e"

//INFO:  Gets overriden parachute modelname hash. Returns 0 if invalid.
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC INT GET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER_INDEX PlayerIndex) = "0x64180d3cb343acf9"

//INFO:  Gets overriden reserve parachute modelname hash. Returns 0 if invalid.
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC INT GET_PLAYER_RESERVE_PARACHUTE_MODEL_OVERRIDE(PLAYER_INDEX PlayerIndex) = "0x4ace43a0376677b0"

//INFO:  An override for parachute model. clears the call to SET_PLAYER_PARACHUTE_MODEL_OVERRIDE.
//PARAM NOTES:
//PURPOSE:
NATIVE PROC CLEAR_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER_INDEX PlayerIndex) = "0x0dedd914eb7a1ce6"

//INFO:  An override for the reserve parachute model. clears the call to SET_PLAYER_RESERVE_PARACHUTE_MODEL_OVERRIDE.
//PARAM NOTES:
//PURPOSE:
NATIVE PROC CLEAR_PLAYER_RESERVE_PARACHUTE_MODEL_OVERRIDE(PLAYER_INDEX PlayerIndex) = "0x812f5aaf0bbe170f"

//INFO:  An override for parachute pack model.
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(PLAYER_INDEX PlayerIndex, INT ModelNameHash) = "0xd386a07b18792f21"

//INFO:  An override for parachute pack model. clears the call to SET_PLAYER_PARACHUTE_MODEL_OVERRIDE.
//PARAM NOTES:
//PURPOSE:
NATIVE PROC CLEAR_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(PLAYER_INDEX PlayerIndex) = "0xd07bc41548db6391"

//INFO:  Disabled vehicle rewards when entering a vehicle (e.g. player is given a shotgun when entering a police vehicle).
//PARAM NOTES:
//PURPOSE:
NATIVE PROC DISABLE_PLAYER_VEHICLE_REWARDS(PLAYER_INDEX PlayerIndex) = "0x73d32b6c724386d4"

//INFO:  Disable wanted group reset (e.g. when script want to take complete control of police, army etc rel group)
//PARAM NOTES:
//PURPOSE:
NATIVE PROC DISABLE_WANTED_REL_GROUP_RESET_THIS_FRAME(PLAYER_INDEX PlayerIndex, REL_GROUP_HASH relGroup) = "0xa975b6508bf58958"

//INFO:  
//PARAM NOTES:
//PURPOSE: Returns whether or not the vehicle radio override is set when spectating players.
NATIVE FUNC BOOL IS_PLAYER_SPECTATED_VEHICLE_RADIO_OVERRIDE() = "0x6dafc808e24c0ded"

//INFO:  
//PARAM NOTES:
//PURPOSE: Sets the player override for using the local radio when spectating another player in a vehicle. Resetting will engage the spectated players vehicle.
NATIVE PROC SET_PLAYER_SPECTATED_VEHICLE_RADIO_OVERRIDE(BOOL bOverride) = "0x904a1a06bb7d0b76"

//INFO:  
//PARAM NOTES:
//PURPOSE: Sets the state of the bluetooth headset of a player
NATIVE PROC SET_PLAYER_BLUETOOTH_STATE(PLAYER_INDEX PlayerIndex, BOOL State) = "0x6f5a4936c4df72a0"

//INFO:  
//PARAM NOTES:
//PURPOSE: Get the state of the bluetooth headset of a player
NATIVE FUNC BOOL IS_PLAYER_BLUETOOTH_ENABLE(PLAYER_INDEX PlayerIndex) = "0xae84a55f7e62c04c"

//INFO:  
//PARAM NOTES:
//PURPOSE: Disables the view mode switch this frame
NATIVE PROC DISABLE_CAMERA_VIEW_MODE_CYCLE(PLAYER_INDEX PlayerIndex) = "0x1784ea330ee3ad4e"

//INFO:  
//PARAM NOTES:
//PURPOSE: Get the fake wanted level for a player
NATIVE FUNC INT GET_PLAYER_FAKE_WANTED_LEVEL(PLAYER_INDEX PlayerIndex) = "0x161c7b2e8d844c6c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if a player ped can be damaged by a specific player (network game only). 
//		   NOTE: This must be set up locally on all machines, no information here is synced (same as SET_PED_CAN_BE_TARGETTED_BY_PLAYER).
//PARAMS
//  PlayerIndex - Player index.
//  TargetPlayerIndex - Target player index.
NATIVE PROC SET_PLAYER_CAN_DAMAGE_PLAYER(PLAYER_INDEX PlayerIndex, PLAYER_INDEX TargetPlayerIndex, BOOL bAllowDamageFlag) = "0x6abb3d68b10d5597"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a player id who's waypoint will override the local player's waypoint.
NATIVE PROC SET_APPLY_WAYPOINT_OF_PLAYER(PLAYER_INDEX PlayerIndex, HUD_COLOURS color = -1) = "0xc8004c24dae59107"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks to see if a player's currently selected vehicle weapon has been toggled to 'Non-Homing' through the weapon selector
//		   NOTE: Will return false if the player does not have a vehicle weapon selected, or the weapon does not have the ability to be homing toggled.
NATIVE FUNC BOOL IS_PLAYER_VEHICLE_WEAPON_TOGGLED_TO_NON_HOMING(PLAYER_INDEX PlayerIndex) = "0xd21ca22014584990"

//INFO: 
//PARAM NOTES:
//PURPOSE: Switches a weapon that can be toggled between homing and non-homing ('HomingToggle' weapon flag) to the non-homing state
//		   NOTE: Will do nothing if the weapon does not have the homing toggle ability, or the weapon is already in the non-homing state
NATIVE PROC SET_PLAYER_VEHICLE_WEAPON_TO_NON_HOMING(PLAYER_INDEX PlayerIndex) = "0x86ac447a712352ff"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a player targeting bool that disables homing for all vehicle weapons on the vehicle this player is in. 
//		   NOTE: Weapons that were always homing will show the '(Homing Off)' prefix. Weapons that could toggle between homing and non-homing will only show the '(Homing Off)' version.
NATIVE PROC SET_PLAYER_HOMING_DISABLED_FOR_ALL_VEHICLE_WEAPONS(PLAYER_INDEX PlayerIndex, BOOL DisableHoming) = "0x15167583e169ed45"

//INFO: 
//PARAM NOTES:
//PURPOSE: Allows script to specify specific targetable entities that wouldn't get picked up by the targeting search normally (ie for CObjects, as we don't iterate over them by default).
// NOTE: Can only register a MAXIMUM of 5 entities! Please contact Blair Trusler, Paulius Bernotas or David Hynd if you need this increased.
//		 This does not guarantee target will be locked-on to, normal validation will still be run (for example CObjects will still need to be flagged as targetable via SET_OBJECT_TARGETTABLE)
NATIVE PROC ADD_PLAYER_TARGETABLE_ENTITY(PLAYER_INDEX PlayerIndex, ENTITY_INDEX TargetIndex) = "0x07e8eabdfe9fdf42"

//INFO: 
//PARAM NOTES:
//PURPOSE: Remove entity added to targetable array via ADD_PLAYER_TARGETABLE_ENTITY
NATIVE PROC REMOVE_PLAYER_TARGETABLE_ENTITY(PLAYER_INDEX PlayerIndex, ENTITY_INDEX TargetIndex) = "0x86841c9019b7f41c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Remove ALL entities added to targetable array via ADD_PLAYER_TARGETABLE_ENTITY
NATIVE PROC CLEAR_PLAYER_TARGETABLE_ENTITIES(PLAYER_INDEX PlayerIndex) = "0x4afaed887f949d14"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if entity has been registered to targeting array via ADD_PLAYER_TARGETABLE_ENTITY.
NATIVE FUNC BOOL GET_IS_ENTITY_IN_TARGETABLE_BY_PLAYER_ARRAY(PLAYER_INDEX PlayerIndex, ENTITY_INDEX TargetIndex) = "0x2d676bf42a0cf7fa"

//INFO:  
//PARAM NOTES:
//PURPOSE: Manually sets the previous variation data, restored when the parachute / scuba prop is removed as part of CTaskTakeOffPedVariation.
NATIVE PROC SET_PLAYER_PREVIOUS_VARIATION_DATA(PLAYER_INDEX PlayerIndex, PED_COMPONENT ComponentNumber, INT DrawableID, INT AltDrawableID = 0, INT TextureID = 0, INT PaletteID = 0) = "0x8840802df7e20b30"

//INFO:  
//PARAM NOTES:
//PURPOSE: Remove the firing position set by script scripted weapon to allow correct fire possition to be passed over network
NATIVE PROC REMOVE_SCRIPT_FIRE_POSITION() = "0x483de9cec1cbfd93"

//INFO:  
//PARAM NOTES:
//PURPOSE: Set the position we are firing from when in a scripted weapon to allow correct fire possition to be passed over network
NATIVE PROC SET_SCRIPT_FIRE_POSITION(VECTOR VecCoors) = "0x23793ff4ded698b1"
