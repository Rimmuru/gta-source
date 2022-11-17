USING "types.sch"
USING "model_enums.sch"
USING "generic.sch"
USING "eulers.sch"
USING "weapon_enums.sch"

ENUM VEHICLE_MISSION
    MISSION_NONE = 0,               // 0
    MISSION_CRUISE,                 // 1
    MISSION_RAM,                    // 2
    MISSION_BLOCK,                  // 3
    MISSION_GOTO,                   // 4
    MISSION_STOP,                   // 5
    MISSION_ATTACK,                 // 6
    MISSION_FOLLOW,                 // 7
    MISSION_FLEE,                   // 8
    MISSION_CIRCLE,                 // 9
    MISSION_ESCORT_LEFT,            // 10
    MISSION_ESCORT_RIGHT,           // 11
    MISSION_ESCORT_REAR,            // 12
    MISSION_ESCORT_FRONT,           // 13
    MISSION_GOTO_RACING,            // 14
    MISSION_FOLLOW_RECORDING,       // 15
    MISSION_POLICE_BEHAVIOUR,       // 16
    MISSION_PARK_PERPENDICULAR,     // 17
    MISSION_PARK_PARALLEL,          // 18
    MISSION_LAND,                   // 19
    MISSION_LAND_AND_WAIT,          // 20
    MISSION_CRASH,                  // 21
    MISSION_PULL_OVER,               // 22
	MISSION_PROTECT					// 23
ENDENUM

ENUM LOCK_STATE
    VEHICLELOCK_NONE = 0,
    VEHICLELOCK_UNLOCKED,                   //  1
    VEHICLELOCK_LOCKED,                     //  2
    VEHICLELOCK_LOCKOUT_PLAYER_ONLY,        //  3
    VEHICLELOCK_LOCKED_PLAYER_INSIDE,       //  4
    VEHICLELOCK_LOCKED_INITIALLY,           //  5
    VEHICLELOCK_FORCE_SHUT_DOORS,           //  6
    VEHICLELOCK_LOCKED_BUT_CAN_BE_DAMAGED,  //  7
    VEHICLELOCK_LOCKED_BUT_BOOT_UNLOCKED,   //  8
    VEHICLELOCK_LOCKED_NO_PASSENGERS,		//  9
    VEHICLELOCK_CANNOT_ENTER				// 10
ENDENUM

ENUM GARAGE_TYPE
    GARAGE_NONE,                                        // 0
    GARAGE_MISSION,                                     // 1
    GARAGE_RESPRAY,                                     // 2
    GARAGE_FOR_SCRIPT_TO_OPEN_AND_CLOSE,                            // 3
    GARAGE_AMBIENT_PARKING                                  // 4
ENDENUM


ENUM VEHICLE_STATUS
    STATUS_PLAYER = 0,
    STATUS_PLAYER_PLAYBACKFROMBUFFER,
    STATUS_SIMPLE,
    STATUS_PHYSICS,
    STATUS_ABANDONED,
    STATUS_WRECKED,
    STATUS_TRAIN_MOVING,
    STATUS_TRAIN_NOT_MOVING,
    STATUS_PLAYER_REMOTE,
    STATUS_PLAYER_DISABLED,
    STATUS_TRAILER,
    STATUS_SIMPLE_TRAILER,
    STATUS_GHOST,
    STATUS_NETWORK
ENDENUM

ENUM SC_WHEEL_LIST              //CAR_WHEEL_TYPE
    SC_WHEEL_CAR_FRONT_LEFT = 0,
    SC_WHEEL_CAR_FRONT_RIGHT,
    SC_WHEEL_CAR_MID_LEFT,
    SC_WHEEL_CAR_MID_RIGHT,
    SC_WHEEL_CAR_REAR_LEFT,
    SC_WHEEL_CAR_REAR_RIGHT,
    SC_WHEEL_BIKE_FRONT,
    SC_WHEEL_BIKE_REAR,
	SC_MAX_WHEELS
ENDENUM

ENUM SC_DOOR_LIST               //CAR_DOOR_TYPE
	SC_DOOR_INVALID = -1,
    SC_DOOR_FRONT_LEFT = 0,
    SC_DOOR_FRONT_RIGHT,
    SC_DOOR_REAR_LEFT,
    SC_DOOR_REAR_RIGHT,
    SC_DOOR_BONNET,
    SC_DOOR_BOOT,
	SC_MAX_DOORS
ENDENUM

ENUM SC_WINDOW_LIST             //CAR_WINDOW_TYPE
    SC_WINDOW_FRONT_LEFT = 0,
    SC_WINDOW_FRONT_RIGHT,
    SC_WINDOW_REAR_LEFT,
    SC_WINDOW_REAR_RIGHT,
    SC_WINDOW_MIDDLE_LEFT,
    SC_WINDOW_MIDDLE_RIGHT,
    SC_WINDSCREEN_FRONT,
    SC_WINDSCREEN_REAR
ENDENUM

ENUM VEHICLE_LIGHT_SETTING
    NO_VEHICLE_LIGHT_OVERRIDE = 0,
    FORCE_VEHICLE_LIGHTS_OFF,     //  1
    FORCE_VEHICLE_LIGHTS_ON,      //  2
	SET_VEHICLE_LIGHTS_ON,        //  3
	SET_VEHICLE_LIGHTS_OFF        //  4
ENDENUM

ENUM VEHICLE_HEADLIGHT_SHADOW_FLAGS
	NO_HEADLIGHT_SHADOWS			= 0,
	HEADLIGHTS_CAST_DYNAMIC_SHADOWS = 1,
	HEADLIGHTS_CAST_STATIC_SHADOWS  = 2,
	HEADLIGHTS_CAST_FULL_SHADOWS    = 3
ENDENUM

ENUM CUSTOM_PLATE_DESIGNS
    CARPLATE_DESIGN_SF = 0,
    CARPLATE_DESIGN_VEGAS,      //  1
    CARPLATE_DESIGN_LA,         //  2
    CARPLATEMGR_PLATEDESIGN_NUM //  3
ENDENUM

ENUM WINCH_TYPES
    WINCHTYPE_NONE = 0,
    WINCHTYPE_MAGNET,           //  1
    WINCHTYPE_PEOPLEPICKUP,     //  2
    WINCHTYPE_RCHELI            //  3
ENDENUM

ENUM VEHICLE_LAYOUT_TYPE
    LAYOUT_INVALID			= 0,
    LAYOUT_4X4				= HASH("LAYOUT_4X4"),
    LAYOUT_BISON			= HASH("LAYOUT_BISON"),
    LAYOUT_LOW				= HASH("LAYOUT_LOW"),
    LAYOUT_LOW_BFINJECTION	= HASH("LAYOUT_LOW_BFINJECTION"),
    LAYOUT_LOW_CHEETAH		= HASH("LAYOUT_LOW_CHEETAH"),
    LAYOUT_LOW_DUNE			= HASH("LAYOUT_LOW_DUNE"),
    LAYOUT_LOW_ENTITYXF		= HASH("LAYOUT_LOW_ENTITYXF"),
    LAYOUT_LOW_INFERNUS		= HASH("LAYOUT_LOW_INFERNUS"),
    LAYOUT_LOW_RESTRICTED	= HASH("LAYOUT_LOW_RESTRICTED"),
    LAYOUT_LOW_SENTINEL2	= HASH("LAYOUT_LOW_SENTINEL2"),
    LAYOUT_RANGER			= HASH("LAYOUT_RANGER"),
    LAYOUT_RANGER_SWAT		= HASH("LAYOUT_RANGER_SWAT"),
    LAYOUT_STANDARD			= HASH("LAYOUT_STANDARD"),
    LAYOUT_STD_EXITFIXUP	= HASH("LAYOUT_STD_EXITFIXUP"),
    LAYOUT_STD_HIGHWINDOW	= HASH("LAYOUT_STD_HIGHWINDOW"),
    LAYOUT_STD_HABANERO		= HASH("LAYOUT_STD_HABANERO"),
    LAYOUT_STD_LOWROOF		= HASH("LAYOUT_STD_LOWROOF"),
    LAYOUT_STD_RIPLEY		= HASH("LAYOUT_STD_RIPLEY"),
    LAYOUT_STD_STRATUM		= HASH("LAYOUT_STD_STRATUM"),
    LAYOUT_STD_STRETCH		= HASH("LAYOUT_STD_STRETCH"),
    LAYOUT_STD_ZTYPE		= HASH("LAYOUT_STD_ZTYPE"),
    LAYOUT_VAN				= HASH("LAYOUT_VAN"),
    LAYOUT_VAN_BODHI		= HASH("LAYOUT_VAN_BODHI"),
    LAYOUT_VAN_BOXVILLE		= HASH("LAYOUT_VAN_BOXVILLE"),
    LAYOUT_VAN_CADDY		= HASH("LAYOUT_VAN_CADDY"),
    LAYOUT_VAN_JOURNEY		= HASH("LAYOUT_VAN_JOURNEY"),
    LAYOUT_VAN_MULE			= HASH("LAYOUT_VAN_MULE"),
    LAYOUT_VAN_POLICE		= HASH("LAYOUT_VAN_POLICE"),
    LAYOUT_VAN_PONY			= HASH("LAYOUT_VAN_PONY"),
    LAYOUT_VAN_TRASH		= HASH("LAYOUT_VAN_TRASH"),
	
	// DLC Layouts
	LAYOUT_4X4_DUBSTA		= HASH("LAYOUT_4X4_DUBSTA"),
	LAYOUT_LOW_BLADE		= HASH("LAYOUT_LOW_BLADE"),
    LAYOUT_LOW_DUKES2		= HASH("LAYOUT_LOW_DUKES2"),
    LAYOUT_LOW_TURISMOR		= HASH("LAYOUT_LOW_TURISMOR"),
    LAYOUT_LOW_FURORE		= HASH("LAYOUT_LOW_FURORE"),
    LAYOUT_LOW_OSIRIS		= HASH("LAYOUT_LOW_OSIRIS"),
    LAYOUT_LOW_FELTZER3		= HASH("LAYOUT_LOW_FELTZER3"),
    LAYOUT_LOW_VERLIERER	= HASH("LAYOUT_LOW_VERLIERER"),
    LAYOUT_STD_BALLER4		= HASH("LAYOUT_STD_BALLER4"),
    LAYOUT_STD_BASIC		= HASH("LAYOUT_STD_BASIC"),
    LAYOUT_STD_BLISTA2		= HASH("LAYOUT_STD_BLISTA2"),
    LAYOUT_STD_CHINO		= HASH("LAYOUT_STD_CHINO"),
    LAYOUT_STD_HUNTLEY		= HASH("LAYOUT_STD_HUNTLEY"),
    LAYOUT_STD_KURUMA		= HASH("LAYOUT_STD_KURUMA"),
    LAYOUT_STD_KURUMA2		= HASH("LAYOUT_STD_KURUMA2"),
    LAYOUT_STD_PANTO		= HASH("LAYOUT_STD_PANTO"),
    LAYOUT_STD_TECHNICAL	= HASH("LAYOUT_STD_TECHNICAL"),
    LAYOUT_STD_WARRENER		= HASH("LAYOUT_STD_WARRENER"),
    LAYOUT_VAN_ARMORED		= HASH("LAYOUT_VAN_ARMORED"),
	LAYOUT_VAN_ROOSEVELT	= HASH("LAYOUT_VAN_ROOSEVELT"),
	LAYOUT_VAN_SLAMVAN		= HASH("LAYOUT_VAN_SLAMVAN"),
	
	// DLC Lowrider Layouts
    LAYOUT_LOW_LOWRIDER				= HASH("LAYOUT_LOW_LOWRIDER"),
    LAYOUT_LOW_LOWRIDER_FACTION		= HASH("LAYOUT_LOW_LOWRIDER_FACTION"),
    LAYOUT_LOW_LOWRIDER_FACTION3	= HASH("LAYOUT_LOW_LOWRIDER2_FACTION3"),
    LAYOUT_STD_LOWRIDER				= HASH("LAYOUT_STD_LOWRIDER"),
    LAYOUT_STD_LOWRIDER_CHINO		= HASH("LAYOUT_STD_LOWRIDER_CHINO"),
    LAYOUT_STD_LOWRIDER_SIDEDOOR	= HASH("LAYOUT_STD_LOWRIDER_SIDEDOOR"),
    LAYOUT_STD_LOWRIDER_SLAMVAN		= HASH("LAYOUT_STD_LOWRIDER_SLAMVAN")
ENDENUM    

ENUM DOOR_DAMAGE
    DT_DOOR_INTACT = 0,
    DT_DOOR_SWINGING_FREE,              //  1
    DT_DOOR_BASHED,                     //  2
    DT_DOOR_BASHED_AND_SWINGING_FREE,   //  3
    DT_DOOR_MISSING,                    //  4
	DT_DOOR_NO_RESET	                //  5
ENDENUM

ENUM DRIVINGMODE

	DF_StopForCars					= 1,
	DF_StopForPeds					= 2,
	DF_SwerveAroundAllCars			= 4,
	DF_SteerAroundStationaryCars	= 8,
	DF_SteerAroundPeds				= 16,
	DF_SteerAroundObjects			= 32,
	DF_DontSteerAroundPlayerPed		= 64,
	DF_StopAtLights					= 128,
	DF_GoOffRoadWhenAvoiding		= 256,
	DF_DriveIntoOncomingTraffic		= 512,
	DF_DriveInReverse				= 1024,
	
	//if pathfinding fails, cruise randomly instead of going on a straight line
	DF_UseWanderFallbackInsteadOfStraightLine = 2048,

	DF_AvoidRestrictedAreas			= 4096,

	// These only work on MISSION_CRUISE
	DF_PreventBackgroundPathfinding		= 8192,
	DF_AdjustCruiseSpeedBasedOnRoadSpeed = 16384,
	
	DF_UseShortCutLinks				=  262144,
	DF_ChangeLanesAroundObstructions = 524288,
	DF_UseSwitchedOffNodes			=  2097152,	//cruise tasks ignore this anyway--only used for goto's
	DF_PreferNavmeshRoute			=  4194304,	//if you're going to be primarily driving off road
	
	// Only works for planes using MISSION_GOTO, will cause them to drive along the ground instead of fly
	DF_PlaneTaxiMode				=  8388608,

	DF_ForceStraightLine			= 16777216,
	DF_UseStringPullingAtJunctions	= 33554432,
	
	DF_AvoidHighways				= 536870912,
	DF_ForceJoinInRoadDirection		= 1073741824,

	//standard driving mode. stops for cars, peds, and lights, goes around stationary obstructions
	DRIVINGMODE_STOPFORCARS = 786603,//DF_StopForCars|DF_StopForPeds|DF_SteerAroundObjects|DF_SteerAroundStationaryCars|DF_StopAtLights|DF_UseShortCutLinks|DF_ChangeLanesAroundObstructions,		// Obey lights too
	
	//like the above, but doesn't steer around anything in its way--will only wait instead.
	DRIVINGMODE_STOPFORCARS_STRICT = 262275,//DF_StopForCars|DF_StopForPeds|DF_StopAtLights|DF_UseShortCutLinks,		// Doesn't deviate an inch.
	
	//default "alerted" driving mode. drives around everything, doesn't obey lights
	DRIVINGMODE_AVOIDCARS = 786469, //DF_SwerveAroundAllCars|DF_SteerAroundObjects|DF_UseShortCutLinks|DF_ChangeLanesAroundObstructions|DF_StopForCars,
	
	//very erratic driving. difference between this and AvoidCars is that it doesn't use the brakes at ALL to help with steering
	DRIVINGMODE_AVOIDCARS_RECKLESS = 786468, //DF_SwerveAroundAllCars|DF_SteerAroundObjects|DF_UseShortCutLinks|DF_ChangeLanesAroundObstructions,
	
	//smashes through everything
	DRIVINGMODE_PLOUGHTHROUGH = 262144, //DF_UseShortCutLinks
	
	//drives normally except for the fact that it ignores lights
	DRIVINGMODE_STOPFORCARS_IGNORELIGHTS =786475,//DF_StopForCars|DF_SteerAroundStationaryCars|DF_StopForPeds|DF_SteerAroundObjects|DF_UseShortCutLinks|DF_ChangeLanesAroundObstructions
	
	//try to swerve around everything, but stop for lights if necessary
	DRIVINGMODE_AVOIDCARS_OBEYLIGHTS = 786597,//DF_SwerveAroundAllCars|DF_StopAtLights|DF_SteerAroundObjects|DF_UseShortCutLinks|DF_ChangeLanesAroundObstructions|DF_StopForCars
	
	//swerve around cars, be careful around peds, and stop for lights
	DRIVINGMODE_AVOIDCARS_STOPFORPEDS_OBEYLIGHTS = 786599//DF_SwerveAroundAllCars|DF_StopAtLights|DF_StopForPeds|DF_SteerAroundObjects|DF_UseShortCutLinks|DF_ChangeLanesAroundObstructions|DF_StopForCars,
ENDENUM

ENUM BOATMODE
	BCF_StopAtEnd					= 1,	
	BCF_StopAtShore					= 2,	
	BCF_AvoidShore					= 4,	
	BCF_PreferForward				= 8,	
	BCF_NeverStop					= 16,	
	BCF_NeverNavMesh				= 32,	
	BCF_NeverRoute					= 64,	
	BCF_ForceBeached				= 128,	
	BCF_UseWanderRoute				= 256,	
	BCF_UseFleeRoute				= 512,	
	BCF_NeverPause					= 1024,	
	BCF_DEFAULTSETTINGS				= 7, // CF_StopAtEnd | CF_StopAtShore | CF_AvoidShore
	BCF_OPENOCEANSETTINGS			= 111, // CF_StopAtEnd | CF_StopAtShore | CF_AvoidShore | BCF_PreferForward | BCF_NeverNavMesh | BCF_NeverRoute
	BCF_BOATTAXISETTINGS			= 1071 // CF_StopAtEnd | CF_StopAtShore | CF_AvoidShore | BCF_PreferForward | BCF_NeverNavMesh | BCF_NeverPause

ENDENUM

ENUM HELIMODE
	
	HF_AttainRequestedOrientation = 1,
    HF_DontModifyOrientation = 2,
    HF_DontModifyPitch = 4,
    HF_DontModifyThrottle = 8,
    HF_DontModifyRoll = 16,
	HF_LandOnArrival = 32,
	HF_DontDoAvoidance = 64,
	HF_StartEngineImmediately = 128,
	HF_ForceHeightMapAvoidance = 256,
	HF_DontClampProbesToDestination = 512,
	HF_EnableTimeslicingWhenPossible = 1024,
	HF_CircleOppositeDirection = 2048,
	HF_MaintainHeightAboveTerrain = 4096,
	HF_IgnoreHiddenEntitiesDuringLand = 8192,
	HF_DisableAllHeightMapAvoidance = 16384,
	
	HF_NONE = 0,
	HF_HEIGHTMAPONLYAVOIDANCE = 320

ENDENUM

ENUM DRIVINGSTYLE
    DRIVINGSTYLE_NORMAL=0,
    DRIVINGSTYLE_ACCURATE=0,        // will be removed eventually
    DRIVINGSTYLE_STRAIGHTLINE=0,    // will be removed eventually
    DRIVINGSTYLE_RACING=1,
    DRIVINGSTYLE_REVERSING=2
ENDENUM

ENUM TEMPACTION
    TEMPACT_NONE = 0,
    TEMPACT_WAIT,
    TEMPACT_EMPTYTOBEREUSED,
    TEMPACT_REVERSE,
    TEMPACT_HANDBRAKETURNLEFT,
    TEMPACT_HANDBRAKETURNRIGHT,
    TEMPACT_HANDBRAKESTRAIGHT,
    TEMPACT_TURNLEFT,
    TEMPACT_TURNRIGHT,
    TEMPACT_GOFORWARD,
    TEMPACT_SWERVELEFT,
    TEMPACT_SWERVERIGHT,
    TEMPACT_EMPTYTOBEREUSED2,
    TEMPACT_REVERSE_LEFT,
    TEMPACT_REVERSE_RIGHT,
    TEMPACT_PLANE_FLY_UP,
    TEMPACT_PLANE_FLY_STRAIGHT,
    TEMPACT_PLANE_SHARP_LEFT,
    TEMPACT_PLANE_SHARP_RIGHT,
    TEMPACT_HEADON_COLLISION,
    TEMPACT_SWERVELEFT_STOP,
    TEMPACT_SWERVERIGHT_STOP,
    TEMPACT_REVERSE_STRAIGHT,
    TEMPACT_BOOST_USE_STEERING_ANGLE,
    TEMPACT_BRAKE,
    TEMPACT_HANDBRAKETURNLEFT_INTELLIGENT,
	TEMPACT_HANDBRAKETURNRIGHT_INTELLIGENT,
	TEMPACT_HANDBRAKESTRAIGHT_INTELLIGENT,
	TEMPACT_REVERSE_STRAIGHT_HARD,
	TEMPACT_EMPTYTOBEREUSED3,
	TEMPACT_BURNOUT,
	TEMPACT_REV_ENGINE,
	TEMPACT_GOFORWARD_HARD,
	TEMPACT_SURFACE_SUBMARINE
ENDENUM

ENUM PLAYBACKDISPLAYMODE
    RDM_NONE = 0,
    RDM_WHOLELINE,
    RDM_JUSTINFRONT,
    RDM_JUSTBEHIND,
    RDM_AROUNDVEHICLE
ENDENUM

ENUM LANDING_GEAR_COMMAND
    LGC_DEPLOY = 0,
    LGC_RETRACT,
    LGC_DEPLOY_INSTANT,
    LGC_RETRACT_INSTANT,
    LGC_BREAK
ENDENUM

ENUM LANDING_GEAR_STATE
    LGS_LOCKED_DOWN,
    LGS_RETRACTING,
	LGS_RETRACTING_INSTANT,
    LGS_DEPLOYING,
    LGS_LOCKED_UP,
    LGS_BROKEN
ENDENUM

ENUM CONVERTIBLE_ROOF_STATE
    CRS_RAISED,
    CRS_LOWERING,
    CRS_LOWERED,
    CRS_RAISING,
    CRS_CLOSING_BOOT,
    CRS_ROOF_STUCK_RAISED,
    CRS_ROOF_STUCK_LOWERED
ENDENUM

ENUM MOD_TYPE
    MOD_SPOILER = 0,
    MOD_BUMPER_F,
    MOD_BUMPER_R,
    MOD_SKIRT,
    MOD_EXHAUST,
    MOD_CHASSIS,
    MOD_GRILL,
    MOD_BONNET,
    MOD_WING_L,
    MOD_WING_R,
    MOD_ROOF,
    
    MOD_ENGINE,
    MOD_BRAKES,
    MOD_GEARBOX,
    MOD_HORN,
    MOD_SUSPENSION,
    MOD_ARMOUR,
    
    MOD_TOGGLE_NITROUS,
    MOD_TOGGLE_TURBO,
    MOD_TOGGLE_SUBWOOFER,
    MOD_TOGGLE_TYRE_SMOKE,
    MOD_TOGGLE_HYDRAULICS,
    MOD_TOGGLE_XENON_LIGHTS,
    
    MOD_WHEELS,
    MOD_REAR_WHEELS,

    // Lowrider
    MOD_PLTHOLDER,
    MOD_PLTVANITY,
  
    MOD_INTERIOR1,
    MOD_INTERIOR2,
    MOD_INTERIOR3,
    MOD_INTERIOR4,
    MOD_INTERIOR5,
    MOD_SEATS,
    MOD_STEERING,
    MOD_KNOB,
    MOD_PLAQUE,
    MOD_ICE,
  
    MOD_TRUNK,
    MOD_HYDRO,
  
    MOD_ENGINEBAY1,
    MOD_ENGINEBAY2,
    MOD_ENGINEBAY3,
  
    MOD_CHASSIS2,
    MOD_CHASSIS3,
    MOD_CHASSIS4,
    MOD_CHASSIS5,
  
    MOD_DOOR_L,
    MOD_DOOR_R,
  
    MOD_LIVERY
ENDENUM

ENUM MOD_KIT_TYPE
	MKT_STANDARD = 0,
	MKT_SPORT,
	MKT_SUV,
	MKT_SPECIAL
ENDENUM

ENUM MOD_CAMERA_POS
    MCP_DEFAULT = 0,
    MCP_FRONT,
    MCP_FRONT_LEFT,
    MCP_FRONT_RIGHT,
    MCP_REAR,
    MCP_REAR_LEFT,
    MCP_REAR_RIGHT,
    MCP_LEFT,
    MCP_RIGHT,
    MCP_TOP,
    MCP_BOTTOM
ENDENUM

ENUM MOD_WHEEL_TYPE
	MWT_INVALID = -1,
	MWT_SPORT = 0,
	MWT_MUSCLE,
	MWT_LOWRIDER,
	MWT_SUV,
	MWT_OFFROAD,
	MWT_TUNER,
	MWT_BIKE,
    MWT_HIEND,
	MWT_SUPERMOD1,
	MWT_SUPERMOD2,
	MWT_SUPERMOD3,
	MWT_SUPERMOD4,
	MWT_SUPERMOD5
ENDENUM

ENUM MOD_COLOR_TYPE
    MCT_METALLIC = 0,
    MCT_CLASSIC,
    MCT_PEARLESCENT,
    MCT_MATTE,
    MCT_METALS,
    MCT_CHROME,
    MCT_CHAMELEON,
    MCT_NONE // if this is set, the vehicle doesn't use mod colors, it uses the regular color system
ENDENUM

ENUM VEHICLE_PLATE_TYPE
	VPT_FRONT_AND_BACK_PLATES = 0,
	VPT_FRONT_PLATES,
	VPT_BACK_PLATES,
	VPT_NONE
ENDENUM

// Keep in sync with VehicleResourceFlags in VehicleScriptResource.h
ENUM VEHICLE_RESOURCE_FLAGS
	VRF_REQUEST_SEAT_ANIMS = 1,
	VRF_REQUEST_ENTRY_ANIMS = 2,
	VRF_REQUEST_EXIT_TO_AIM_ANIMS = 4,
	VRF_REQUEST_ALTERNATE_ENTRY_ANIMS = 8,
	VRF_REQUEST_BASIC_ANIMS = 3,	// VRF_REQUEST_SEAT_ANIMS|VRF_REQUEST_ENTRY_ANIMS
	VRF_REQUEST_ALL_ANIMS = 15 		// VRF_REQUEST_SEAT_ANIMS|VRF_REQUEST_ENTRY_ANIMS|VRF_REQUEST_EXIT_TO_AIM_ANIMS|VRF_REQUEST_ALTERNATE_ENTRY_ANIMS
ENDENUM

ENUM VEHICLE_CLASS
    VC_COMPACT = 0,
    VC_SEDAN,
    VC_SUV,
    VC_COUPE,
    VC_MUSCLE,
    VC_SPORT_CLASSIC,
    VC_SPORT,
    VC_SUPER,
    VC_MOTORCYCLE,
    VC_OFF_ROAD,
    VC_INDUSTRIAL,
    VC_UTILITY,
    VC_VAN,
    VC_CYCLE,
    VC_BOAT,
    VC_HELICOPTER,
    VC_PLANE,
	VC_SERVICE,
	VC_EMERGENCY,
	VC_MILITARY,
	VC_COMMERCIAL,
	VC_RAIL,
	VC_OPEN_WHEEL
ENDENUM

ENUM PICKUP_GADGET_TYPE
	PICKUP_HOOK,
	PICKUP_MAGNET
ENDENUM

ENUM PLANE_DAMAGE_SECTION
	WING_L,
	WING_R,
	TAIL,
	ENGINE_L,
	ENGINE_R,
	ELEVATOR_L,
	ELEVATOR_R,
	AILERON_L,
	AILERON_R,
	RUDDER,
	RUDDER_2,
	AIRBRAKE_L,
	AIRBRAKE_R
ENDENUM

ENUM LANDING_GEAR_DAMAGE_SECTION
	GEAR_F,
	GEAR_RL,
	GEAR_LM1,
	GEAR_RM,
	GEAR_RM1,
	GEAR_RR
ENDENUM

// Keep in sync with eScriptCarSearchFlags in commands_vehicle.cpp
CONST_INT VEHICLE_SEARCH_FLAG_RETURN_LAW_ENFORCER_VEHICLES                                                                      1   //  Don't mind if the returned vehicle is a law enforcer
CONST_INT VEHICLE_SEARCH_FLAG_RETURN_MISSION_VEHICLES                                                                                    2  //  Don't mind if the returned vehicle has been created by a script
CONST_INT VEHICLE_SEARCH_FLAG_RETURN_RANDOM_VEHICLES                                                                                   4    //  Don't mind if the returned vehicle hasn't been created by a script (You will usually want to set this)
CONST_INT VEHICLE_SEARCH_FLAG_RETURN_VEHICLES_CONTAINING_GROUP_MEMBERS                                              8   //  Don't mind if the returned vehicle contains group members
CONST_INT VEHICLE_SEARCH_FLAG_RETURN_VEHICLES_CONTAINING_A_PLAYER                                                           16  //  Don't mind if the returned vehicle contains a player ped
CONST_INT VEHICLE_SEARCH_FLAG_RETURN_VEHICLES_CONTAINING_A_DEAD_OR_DYING_PED                                    32  //  Don't mind if the returned vehicle contains a dead or dying ped
CONST_INT VEHICLE_SEARCH_FLAG_RETURN_VEHICLES_WITH_PEDS_ENTERING_OR_EXITING                                         64  //  Don't mind if peds are in the process of entering or exiting the returned vehicle
CONST_INT VEHICLE_SEARCH_FLAG_DO_NETWORK_CHECKS                                                                                     128 //  Don't return a network clone or a deletable network object(?)
CONST_INT VEHICLE_SEARCH_FLAG_CHECK_VEHICLE_OCCUPANTS_STATES                                                            256 //Only return the vehicle if all its occupants have a PedState of PED_DRIVING or PED_DEAD (not sure if it matters if this is set or not)
CONST_INT VEHICLE_SEARCH_FLAG_RETURN_LAW_ENFORCER_VEHICLES_ONLY                                                             1024    //  Only return law enforcement vehicles
CONST_INT VEHICLE_SEARCH_FLAG_ALLOW_VEHICLE_OCCUPANTS_TO_BE_PERFORMING_A_SCRIPTED_TASK      2048 // Usually cars are only returned if all the occupants are performing their default task  (see also PERFORMING_A_NON_DEFAULT_TASK below. It's less strict)
CONST_INT VEHICLE_SEARCH_FLAG_RETURN_HELICOPTORS_ONLY										4096	// Only return helicoptor (can be combimed with the boats_only and planes_only flags)
CONST_INT VEHICLE_SEARCH_FLAG_RETURN_BOATS_ONLY												8192	// Only return boats (can be combimed with the helicoptor_only and planes_only flags)
CONST_INT VEHICLE_SEARCH_FLAG_RETURN_PLANES_ONLY											16384	// Only return planes (can be combimed with the helicoptor_only and boats_only flags)
CONST_INT VEHICLE_SEARCH_FLAG_ALLOW_LAW_ENFORCER_VEHICLES_WITH_WANTED_LEVEL					32768	// Allow return law enforcement vehs if player has a wanted level
CONST_INT VEHICLE_SEARCH_FLAG_ALLOW_VEHICLE_OCCUPANTS_TO_BE_PERFORMING_A_NON_DEFAULT_TASK	65536	// Usually cars are only returned if all the occupants are performing their default task (see also PERFORMING_A_SCRIPTED_TASK above. It's stricter)
CONST_INT VEHICLE_SEARCH_FLAG_ALLOW_TRAILERS	131076 // allow trailers to be included
CONST_INT VEHICLE_SEARCH_FLAG_ALLOW_BLIMPS		262144 // allow blimps to be included
CONST_INT VEHICLE_SEARCH_FLAG_ALLOW_SUBMARINES		524288 // allow submarines to be included

// Behaviour flags for when releasing trains back to ambient population
// Keep in sync with ReleaseTrainFlags enum in CTrain (train.h)
ENUM RELEASE_TRAIN_FLAGS
	RTF_DEFAULT				= 0,
	RTF_KEEP_OLD_SPEED		= 1		// Upon release maintain the speed previously assigned by script, rather than taking it from the track
ENDENUM

//  Setting this flag allows the occupants to be performing a scripted or their default task.
//  Could be dangerous. Only really added for Neil's taxi script where he needs to grab the taxi again as it drives off
//  when the driver is performing a scripted sequence.

//~>                             Create Remove Car Commands                                 <~

//INFO: 
//PARAM NOTES: Model_names is taken from Model_enums.sch,
//             RegisterAsNetworkObject:		The new object will be created and synced on other machines if a network game is running
//	       ScriptHostObject:		If true, this object has been created by the host portion of a network script and is vital to that script - it must always exist regardless of who is hosting the script.
//						If false, the object has been created by the client portion of a network script and can be removed when the client who created it leaves the script session.
//PURPOSE: Ceates a vehicle at a coord with a heading   More info..
NATIVE FUNC VEHICLE_INDEX CREATE_VEHICLE(MODEL_NAMES ModelHashKey, VECTOR VecCoors, FLOAT fVehicleHeading = 0.0 , BOOL RegisterAsNetworkObject = TRUE, BOOL ScriptHostObject = TRUE, BOOL bIgnoreGroundCheck = FALSE) = "0xba715a7beba5a1f9"

//INFO:  Ensure you only set this for car that you want to remain active inside a cutscene - not to be used for mission cars that are in the cutscene - the cutscene will deal with that itself.
//PARAM NOTES:
//PURPOSE: Allow a MISSION vehicle to function while a cutscene is running. More info..
NATIVE PROC SET_VEHICLE_IN_CUTSCENE(VEHICLE_INDEX VehicleIndex, BOOL bShow) = "0x90497b5e4fa16480"

//PURPOSE: Allow a MISSION vehicle to disable homing missle targetting 
NATIVE PROC SET_VEHICLE_ALLOW_HOMING_MISSLE_LOCKON(VEHICLE_INDEX VehicleIndex, BOOL bAllowHomingMissileLockon, BOOL bIgnoreMisisonVehCheck = false) = "0x4793e369e98dc1b3"

//PURPOSE: Allow a MISSION vehicle to disable homing missle targetting (synced over network).
//		   This is a different flag to "SET_VEHICLE_ALLOW_HOMING_MISSLE_LOCKON", please ensure it's set/cleared accordingly!
NATIVE PROC SET_VEHICLE_ALLOW_HOMING_MISSLE_LOCKON_SYNCED(VEHICLE_INDEX VehicleIndex, BOOL bAllowHomingMissileLockon, BOOL bIgnoreMisisonVehCheck = false) = "0x52ed1ceb870c0a42"

//PURPOSE: Allow a MISSION vehicle to be targeted despite having no passengers. Note: vehicle must still otherwise be targetable.
NATIVE PROC SET_VEHICLE_ALLOW_NO_PASSENGERS_LOCKON(VEHICLE_INDEX VehicleIndex, BOOL bAllowLockon) = "0x31048e31eaaf3aba"

// Keep in sync with eHomingLockOnState enum in CEntity (Entity.h)
ENUM HOMING_LOCKON_STATE
	HLOS_NONE		= 0,
	HLOS_ACQUIRING	= 1,	
	HLOS_ACQUIRED	= 2
ENDENUM

// PURPOSE: Checks if the provided vehicle is locked on anything other entity
NATIVE FUNC HOMING_LOCKON_STATE GET_VEHICLE_HOMING_LOCKON_STATE(VEHICLE_INDEX VehicleIndex) = "0x09878227cf5b2063"

// PURPOSE: Checks if someone else is locked onto this vehicle
NATIVE FUNC HOMING_LOCKON_STATE GET_VEHICLE_HOMING_LOCKEDONTO_STATE(VEHICLE_INDEX VehicleIndex) = "0x9035dfa99b4e0838"

// PURPOSE: Sets the vehicle locked-onto state for a target vehicle (for when we need to emulate the homing code)
NATIVE PROC SET_VEHICLE_HOMING_LOCKEDONTO_STATE(VEHICLE_INDEX VehicleIndex, HOMING_LOCKON_STATE LockOnState) = "0x8955d96a20ff3811"

//~>                             Population Commands                                    <~

// *** BEING REMOVED SOON ***
//INFO: If the Denisty multiplier is set to 0.0 then ambients cars will stop spawning.
//PARAM NOTES: DensityMultiplier default = 1.0
//PURPOSE: Sets the amount of ambient traffic and parked vehicles being spawned. More info..
//NATIVE PROC SET_VEHICLE_DENSITY_MULTIPLIER(FLOAT DensityMultiplier)

// *** BEING REMOVED SOON ***
//INFO: If the Denisty multiplier is set to 0.0 then ambients traffic will stop spawning.
//PARAM NOTES:DensityMultiplier default = 1.0
//PURPOSE: Sets the amount of ambient traffic being spawned. More info..
//NATIVE PROC SET_RANDOM_VEHICLE_DENSITY_MULTIPLIER(FLOAT DensityMultiplier)

// *** BEING REMOVED SOON ***
//INFO:  If the Denisty multiplier is set to 0.0 then parked vehicles will stop spawning.
//PARAM NOTES: DensityMultiplier default = 1.0
//PURPOSE: Sets the amount of  parked vehicles being spawned. More info..
//NATIVE PROC SET_PARKED_VEHICLE_DENSITY_MULTIPLIER(FLOAT DensityMultiplier)

// *** BEING REMOVED SOON ***
//INFO: Applies a multiplier to the default ranges used for creation/removal of vehicles
//PARAM NOTES: RangeMultiplier default = 1.0
//NATIVE PROC SET_AMBIENT_VEHICLE_RANGE_MULTIPLIER(FLOAT RangeMultiplier)



//INFO: If the Denisty multiplier is set to 0.0 then ambients cars will stop spawning.
//PARAM NOTES: DensityMultiplier default = 1.0
//PURPOSE: Sets the amount of ambient traffic and parked vehicles being spawned. More info..
NATIVE PROC SET_VEHICLE_DENSITY_MULTIPLIER_THIS_FRAME(FLOAT DensityMultiplier) = "0x6b81df75fa671549"

//INFO: If the Denisty multiplier is set to 0.0 then ambients traffic will stop spawning.
//PARAM NOTES:DensityMultiplier default = 1.0
//PURPOSE: Sets the amount of ambient traffic being spawned. More info..
NATIVE PROC SET_RANDOM_VEHICLE_DENSITY_MULTIPLIER_THIS_FRAME(FLOAT DensityMultiplier) = "0xbb35b4e1d532f811"

//INFO:  If the Denisty multiplier is set to 0.0 then parked vehicles will stop spawning.
//PARAM NOTES: DensityMultiplier default = 1.0
//PURPOSE: Sets the amount of  parked vehicles being spawned. More info..
NATIVE PROC SET_PARKED_VEHICLE_DENSITY_MULTIPLIER_THIS_FRAME(FLOAT DensityMultiplier) = "0x3c92b0470b23a5d2"

//INFO: Applies a multiplier to the default ranges used for creation/removal of vehicles
//PARAM NOTES: RangeMultiplier default = 1.0
NATIVE PROC SET_AMBIENT_VEHICLE_RANGE_MULTIPLIER_THIS_FRAME(FLOAT RangeMultiplier) = "0xf02e66a4059dc629"

//INFO: Sets whether the deserted street multiplier can be affected by events such as firing
NATIVE PROC SET_DESERTED_STREET_MULTIPLIER_LOCKED(BOOL bLocked) = "0x4eecda2a46438b49"

//PURPOSE: Set whether random train creation is allowed this frame
NATIVE PROC SET_DISABLE_RANDOM_TRAINS_THIS_FRAME(BOOL bVal) = "0x83d185533a7a8e2e"

//INFO: Activate / deactivate the far draw 
//PARAM NOTES: far draw default = false
NATIVE PROC SET_FAR_DRAW_VEHICLES(BOOL bVal) = "0x9b2661f051d4de62"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the number of parked cars budget.
NATIVE PROC SET_NUMBER_OF_PARKED_VEHICLES(INT NewNumberOfParkedCars) = "0x7fb3477c478f833e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Stops a certain vehicle model being spawned.
NATIVE PROC SET_VEHICLE_MODEL_IS_SUPPRESSED(MODEL_NAMES VehicleModelHashKey, BOOL IsSuppressed) = "0x7cd708deb04f8474"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if mad drivers are spawned
NATIVE PROC SET_MAD_DRIVERS(BOOL bMadDriversActive) = "0xfb24b9dc688170ee"

//INFO: ONLY use this command for cars that are expected to be static most of the time. Otherwise the game may end up with too many moving cars and slow down. 
//PARAM NOTES:
//PURPOSE: Removes a vehicle from the parked vehicle budget allowing for more parked cars. More info..
NATIVE PROC REMOVE_VEHICLE_FROM_PARKED_VEHICLES_BUDGET(VEHICLE_INDEX VehicleIndex, BOOL bTakeCarOutOfParkedCarsBudget) = "0x2bae2b907287f34c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set random boats active.
NATIVE PROC SET_RANDOM_BOATS(BOOL RandomBoatsFlag) = "0x5b336ff89a289cb3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set random boats active in MP.
NATIVE PROC SET_RANDOM_BOATS_MP(BOOL RandomBoatsFlag) = "0xf2c4c91339d8e00b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets garbage trucks active
NATIVE PROC SET_GARBAGE_TRUCKS(BOOL Flag) = "0x63e14b0ea0bbf0ff"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the nearest cable car to a coord. 
NATIVE FUNC VEHICLE_INDEX GET_NEAREST_CABLE_CAR(VECTOR VecCoors, FLOAT Radius) = "0x5ca45074df8d5cc5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Attempts to instantly populate roads with the currently desired number of vehicles (regardless of whether in-view or not)
NATIVE PROC INSTANTLY_FILL_VEHICLE_POPULATION() = "0xc545abad8d25a872"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the instantly fill process has finished spawning all cars
NATIVE FUNC BOOL HAS_INSTANT_FILL_VEHICLE_POPULATION_FINISHED() = "0xc13e0cba57f5b9d6"

/// PURPOSE:
///    Enables aggressive removal of empty vehicles crowding players in a network game
/// PARAMS:
///    bEnableThisFrame - Whether to enable removal this frame
NATIVE PROC NETWORK_ENABLE_EMPTY_CROWDING_VEHICLES_REMOVAL(BOOL bEnableThisFrame) = "0x4a65f9005ec6e45f"

/// PURPOSE:
///    Sets the total number of vehicles at which the aggressive removal will kick in
/// PARAMS:
///    capNum - the number of vehicles, beyond which will trigger agressive removal (if it is enabled for this frame)
NATIVE PROC NETWORK_CAP_EMPTY_CROWDING_VEHICLES_REMOVAL(INT capNum) = "0xe6f7627bbb394bf9"

//~>                        Model commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that the vehicle is a specific model.
NATIVE FUNC BOOL IS_VEHICLE_MODEL(VEHICLE_INDEX VehicleIndex, MODEL_NAMES ModelHashKey) = "0x7010991fda59d3f2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that vehicle model is a boat model
NATIVE FUNC BOOL IS_THIS_MODEL_A_BOAT(MODEL_NAMES VehicleModelHashKey) = "0xd2b5b1c8fc84fe0f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that vehicle model is a jetski model
NATIVE FUNC BOOL IS_THIS_MODEL_A_JETSKI(MODEL_NAMES VehicleModelHashKey) = "0x5c921200ca5cbf8e"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Checks that vehicle model is a plane model
NATIVE FUNC BOOL IS_THIS_MODEL_A_PLANE(MODEL_NAMES VehicleModelHashKey) = "0xd6f7d32a98e07f93"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Checks that vehicle model is a heli model
NATIVE FUNC BOOL IS_THIS_MODEL_A_HELI(MODEL_NAMES VehicleModelHashKey) = "0x4262b4dceadc2695"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that vehicle model is a car model
NATIVE FUNC BOOL IS_THIS_MODEL_A_CAR(MODEL_NAMES VehicleModelHashKey) = "0xcb09a834f0c86fbb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that vehicle model is a train model
NATIVE FUNC BOOL IS_THIS_MODEL_A_TRAIN(MODEL_NAMES VehicleModelHashKey) = "0xf4ad75b2d964d8ab"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that vehicle model is a bike model
NATIVE FUNC BOOL IS_THIS_MODEL_A_BIKE(MODEL_NAMES VehicleModelHashKey) = "0x6f0299ed3ceb4e5d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that vehicle model is a bicycle model
NATIVE FUNC BOOL IS_THIS_MODEL_A_BICYCLE(MODEL_NAMES VehicleModelHashKey) = "0x532c99faf70c652b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that vehicle model is a quadbike model
NATIVE FUNC BOOL IS_THIS_MODEL_A_QUADBIKE(MODEL_NAMES VehicleModelHashKey) = "0xcd8c08fa7d84c27e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that vehicle model is an amphibious car model
NATIVE FUNC BOOL IS_THIS_MODEL_AN_AMPHIBIOUS_CAR(MODEL_NAMES VehicleModelHashKey) = "0x49305e8836792d92"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that vehicle model is an amphibious quadbike model
NATIVE FUNC BOOL IS_THIS_MODEL_AN_AMPHIBIOUS_QUADBIKE(MODEL_NAMES VehicleModelHashKey) = "0x2ac65a9c213b5bc8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that the vehicle has a roof.
NATIVE FUNC BOOL DOES_VEHICLE_HAVE_ROOF(VEHICLE_INDEX VehicleIndex) = "0xbcf71e2c4b3df832"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tag this vehicle to be removed aggressively when parked in carjack missions
NATIVE PROC SET_VEHICLE_REMOVE_AGGRESSIVE_CARJACK_MISSION(VEHICLE_INDEX VehicleIndex) = "0x1a7b12c9ee8ed1d4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tag this vehicle to avoid only the player vehicle. Only to be used for riot van mission
NATIVE PROC SET_VEHICLE_AVOID_PLAYER_VEHICLE_RIOT_VAN_MISSION(VEHICLE_INDEX VehicleIndex) = "0xe216632002dcc397"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set min number tagged vehicles in radius before aggressive removal starts
NATIVE PROC SET_CARJACK_MISSION_REMOVAL_PARAMETERS(INT iNumVehiclesInArea, FLOAT fRadiusForRemoval) = "0x1379dc7e5c1a210c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the vehicle big e.g plane .
NATIVE FUNC BOOL IS_BIG_VEHICLE(VEHICLE_INDEX VehicleIndex) = "0xa94e098b1788a730"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets a random vehicle model firom memory.
NATIVE PROC GET_RANDOM_VEHICLE_MODEL_IN_MEMORY(BOOL OnlyPickNormalCarsFlag, MODEL_NAMES &ReturnVehicleModelHashKey, INT &ReturnVehicleClass) = "0x20c186dc005af163"

//INFO:  The model returned will be streamed in apart from during the first 20 or so seconds at the start of the game. (So the script has to make sure it is loaded but only to make sure it doesn't crash) 
//              The returned model can only be the 2 basic models.
//PARAM NOTES:
//PURPOSE: Gets the basic police car model irrespective of  wanted level. More info..
NATIVE FUNC MODEL_NAMES GET_CURRENT_BASIC_POLICE_VEHICLE_MODEL() = "0x750529756f666a1b"

//INFO: This command will give you the one that is currently loaded. 
//          The model returned will be streamed in apart from during the first 20 or so seconds at the start of the game. (So the script has to make sure it is loaded but only to make sure it doesn't crash) 
//          The returned model could be a noose, police hummer or stockade as well as the basic police cars
//PARAM NOTES:
//PURPOSE:  Gets the basic police car model. More info..
NATIVE FUNC MODEL_NAMES  GET_CURRENT_POLICE_VEHICLE_MODEL() = "0x78463883a202d38c"

//INFO:  The game loads 2 taxi models at any one time.When the script needs a taxi model it should call this command to find out which one to use. 
//          You don't need to REQUEST the model after this but you have to make sure it is loaded (HAS_MODEL_LOADED). 
//          This should return true straight away apart from during the first 20 seconds of the game running. 
//PARAM NOTES:
//PURPOSE: Gets the cuurent taxi model loaded. More info..
NATIVE FUNC MODEL_NAMES GET_CURRENT_TAXI_VEHICLE_MODEL() = "0xa7097cc1850fb867"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the monetary value of a vehicles model.
NATIVE FUNC INT GET_VEHICLE_MODEL_VALUE(MODEL_NAMES VehicleModelHashKey) = "0xe0bdb19a85d41c89"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the the model name of the vehicle.
NATIVE FUNC STRING GET_DISPLAY_NAME_FROM_VEHICLE_MODEL(MODEL_NAMES VehicleModelHashKey) = "0x01e2429b82e280e6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the the make of the vehicle.
NATIVE FUNC STRING GET_MAKE_NAME_FROM_VEHICLE_MODEL(MODEL_NAMES VehicleModelHashKey) =  "0xf7af4f159ff99f97"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the the layout hash of the vehicle layout.
NATIVE FUNC INT GET_VEHICLE_LAYOUT_HASH(VEHICLE_INDEX Vehicle) = "0x816a3adb189bd123"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the the in vehicle clipset hash of the vehicle seat.
NATIVE FUNC INT GET_IN_VEHICLE_CLIPSET_HASH_FOR_SEAT(VEHICLE_INDEX Vehicle, VEHICLE_SEAT seat) = "0x5f7d161e0e6a21b6"

//INFO: Used primarily for cut scenes
//PARAM NOTES:
//PURPOSE: Requests the high detail model for this vehicle. More info.. 
NATIVE PROC REQUEST_VEHICLE_HIGH_DETAIL_MODEL (VEHICLE_INDEX Vehicle) = "0x6b137db2c9c0c754"

//INFO: Used primarily for cut scenes
//PARAM NOTES:
//PURPOSE: Removes the vehicles loaded high detail model. More info..
NATIVE PROC REMOVE_VEHICLE_HIGH_DETAIL_MODEL (VEHICLE_INDEX Vehicle) = "0x6ba431f131a11a0e"

//INFO: Used primarily for cut scenes
//PARAM NOTES:
//PURPOSE: Returns true when the high detail model is in memory and ready to be rendered
NATIVE FUNC BOOL IS_VEHICLE_HIGH_DETAIL(VEHICLE_INDEX Vehicle) = "0x89c8af90aef28755"

//INFO: Used to prevent delays for missions peds getting out/in to vehicles waiting for anims to load
//PARAM NOTES: iVehicleRequestFlags can be from the enum VEHICLE_RESOURCE_FLAGS, then can be combined together using "|"
//PURPOSE: Requests the peds enter/exit/in vehicle animationsfor this vehicle. More info.. 
NATIVE PROC REQUEST_VEHICLE_ASSET (MODEL_NAMES VehicleModelHashKey, INT iVehicleRequestFlags = VRF_REQUEST_BASIC_ANIMS) = "0x6b9a9289f29f4166"

//INFO:
//PARAM NOTES:
//PURPOSE: Check to see if the anims have loaded for this vehicle. More info..
NATIVE FUNC BOOL HAS_VEHICLE_ASSET_LOADED (MODEL_NAMES VehicleModelHashKey) = "0x08a9bdfe90d7cfe2"

//INFO:
//PARAM NOTES:
//PURPOSE: Removes the peds enter/exit/in vehicle animations for this vehicle. More info.. 
NATIVE PROC REMOVE_VEHICLE_ASSET (MODEL_NAMES VehicleModelHashKey) = "0x72dbc5d8e674e2ed"

//~>                                    Damage commands


//INFO: Ths only deforms the car and does not knock off doors etc. the values paassed in to damage and deformation are direct forces. 
//PARAM NOTES:  localDamage: Applys the damage local to the vehicles space.
//                          Deformation: Sets how  much the vehicle is deformed by 
//                          VecDamageCoors: is where the damage is applied to the vehicle 
//                          Damage: scales how much damage is applied to the vehicle
//PURPOSE: Applies damage deformation to a vehicle. More info..
NATIVE PROC SET_VEHICLE_DAMAGE(VEHICLE_INDEX TrainIndex, VECTOR VecDamageCoors, FLOAT Damage, FLOAT Deformation, BOOL localDamage) = "0xbdb27a4f81702f96"

//INFO: Sets whether vehicle occupants can take explosive damage if the vehicle is invincible/explosion proof. 
//PARAM NOTES: Ensure this is reset to false when finished!!!
//PURPOSE: Ensures occupants will take damage even if their attached vehicle is flagged as invincible/explosion proof. Won't work if ped is flagged as invincible/explosion proof.
NATIVE PROC SET_VEHICLE_OCCUPANTS_TAKE_EXPLOSIVE_DAMAGE(VEHICLE_INDEX VehicleIndex, BOOL bVehicleOccupantsTakeExplosiveDamage = FALSE) = "0x079a535265838a8a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets all vehicles can be damaged
NATIVE PROC SET_ALL_VEHICLES_CAN_BE_DAMAGED(BOOL AllCarsCanBeDamagedFlag) = "0x2f93d1a4b5592913"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if the vehicle shows veisible damage.
NATIVE PROC SET_VEHICLE_CAN_BE_VISIBLY_DAMAGED(VEHICLE_INDEX VehicleIndex, BOOL VisibleDamageFlag) = "0xe0af417cbbb366f3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if the vehicle's light can be broken.
NATIVE PROC SET_VEHICLE_HAS_UNBREAKABLE_LIGHTS(VEHICLE_INDEX VehicleIndex, BOOL UnbreakableLightFlag) = "0x436bfe83f6ae0d30"

//INFO: 
//PARAM NOTES:
//PURPOSE: Vehicle locks are ignored for vehicles with drivers by default - setting this flag ensures locks are always checked
NATIVE PROC SET_VEHICLE_RESPECTS_LOCKS_WHEN_HAS_DRIVER(VEHICLE_INDEX VehicleIndex, BOOL RespectLocks) = "0x0cd9b67a70aad552"

//INFO: 
//PARAM NOTES:
//PURPOSE: Passengers are ejected if we have locked passengers out with CARLOCK_LOCKED_NO_PASSENGERS
NATIVE PROC SET_VEHICLE_CAN_EJECT_PASSENGERS_IF_LOCKED(VEHICLE_INDEX VehicleIndex, BOOL RespectLocks) = "0x4694f96d00a3b8eb"

//INFO: 
//PARAM NOTES:
// find out how much a car has deformed at a specific position on the vehicle (local coordinates)
NATIVE FUNC VECTOR GET_VEHICLE_DEFORMATION_AT_POS(VEHICLE_INDEX VehicleIndex, VECTOR vecPos) = "0x279f4d7315daeac0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Stop a vehicle exploding instantly when hit by another explosion
NATIVE PROC SET_VEHICLE_EXPLODES_ON_HIGH_EXPLOSION_DAMAGE(VEHICLE_INDEX VehicleIndex, BOOL bSet) = "0x1af469c927341a18"

//INFO: 
//PARAM NOTES:
//PURPOSE: Vehicle will explode when reaching zero body health and receives explosion damage (useful if vehicle is not using petrol tank damage).
NATIVE PROC SET_VEHICLE_EXPLODES_ON_EXPLOSION_DAMAGE_AT_ZERO_BODY_HEALTH(VEHICLE_INDEX VehicleIndex, BOOL bSet) = "0xc6672a1a9fbe00a1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Use to override the SHOULD_EXPLODE_ON_CONTACT flag from vehicle meta deta
NATIVE PROC SET_ALLOW_VEHICLE_EXPLODES_ON_CONTACT(VEHICLE_INDEX VehicleIndex, BOOL bSet) = "0x18fef16687c831e3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Stop a tow truck from automatically picking up a vehicle
NATIVE PROC SET_VEHICLE_DISABLE_TOWING(VEHICLE_INDEX VehicleIndex, BOOL bDisable) = "0x1b3814e11b085f5e"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Pops off the vehicles roof
NATIVE PROC POP_OFF_VEHICLE_ROOF(VEHICLE_INDEX VehicleIndex) = "0xf0ced02b540a165b"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Pops off the vehicles roof
NATIVE PROC POP_OFF_VEHICLE_ROOF_WITH_IMPULSE(VEHICLE_INDEX VehicleIndex, VECTOR vecPos) = "0x26d7c8d88cb890cf"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Gets the source of destruction for the vehicle
NATIVE FUNC ENTITY_INDEX GET_VEHICLE_SOURCE_OF_DESTRUCTION(VEHICLE_INDEX VehicleIndex) = "0x2a08bfc960e3ebd4"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Gets the cause of destruction for the vehicle
NATIVE FUNC WEAPON_TYPE GET_VEHICLE_CAUSE_OF_DESTRUCTION(VEHICLE_INDEX VehicleIndex) = "0xbca4e9d520d10b01"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Gets the time of destruction for the vehicle
NATIVE FUNC INT GET_VEHICLE_TIME_OF_DESTRUCTION(VEHICLE_INDEX VehicleIndex) = "0xf7d3de9d4188b1e0"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Overrides the plane damage threshold (currently 900). Reset the override by passing in zero.
NATIVE PROC OVERRIDE_PLANE_DAMAGE_THREHSOLD(VEHICLE_INDEX VehicleIndex, FLOAT value) = "0xb6d3cf89988e9305"



//~>                                     Vehicle Physics Commands                               <~

//INFO:
//PARAM NOTES:	StoppingDistance - the distance from the initial coords at which the vehicle should come to rest.
//				nTimeToStopFor - the length of time in seconds to hold the car at rest after stopping.
//				bControlVerticalVelocity - "false" by default which allows gravity to act normally in the z direction. Set to
//											true to also arrest the car's vertical velocity. Don't use if the command can be called on
//											on a car which is already moving up / down.
//PURPOSE: Decelerates a vehicle until it comes to rest, possibly in an unphysically short distance.
NATIVE PROC BRING_VEHICLE_TO_HALT(VEHICLE_INDEX VehicleIndex, FLOAT StoppingDistance, INT nTimeToStopFor, BOOL ControlVerticalVelocity=FALSE) = "0xd28e3800883ded83"

//INFO:
//PURPOSE: Checks if a vehicle is being brought to a halt
NATIVE FUNC BOOL IS_VEHICLE_BEING_BROUGHT_TO_HALT(VEHICLE_INDEX VehicleIndex) = "0x14ac6820e96ac452"

//INFO:
//PURPOSE: Stops bringing the vehicle to a halt
NATIVE PROC STOP_BRINGING_VEHICLE_TO_HALT(VEHICLE_INDEX VehicleIndex) = "0x7bd360f9bdf6e098"

//INFO:
//PARAM NOTES:	VehicleIndex - vehicle of interest
//PURPOSE: Get the estimated top speed of the vehicle (with mods) on a flat surface
NATIVE FUNC FLOAT GET_VEHICLE_ESTIMATED_MAX_SPEED(VEHICLE_INDEX VehicleIndex) = "0x0bea3e6c636cae2b"

//INFO:
//PARAM NOTES:	VehicleIndex - vehicle of interest
//PURPOSE: Get the maximum braking force this vehicle (with mods) can apply, may not be accurate due to tyres slipping
NATIVE FUNC FLOAT GET_VEHICLE_MAX_BRAKING(VEHICLE_INDEX VehicleIndex) = "0x0d50b7306353e678"

//INFO:
//PARAM NOTES:	VehicleIndex - vehicle of interest
//PURPOSE: Get the maximum traction force this vehicles tyres can apply
NATIVE FUNC FLOAT GET_VEHICLE_MAX_TRACTION(VEHICLE_INDEX VehicleIndex) = "0x1bb1047bf054186c"

//INFO:
//PARAM NOTES:	VehicleIndex - vehicle of interest
//PURPOSE: Get the maximum drive force this vehicle (with mods) can apply to the ground. This isn't particularly accurate and should be used as a guide and referenced with top speed.
NATIVE FUNC FLOAT GET_VEHICLE_ACCELERATION(VEHICLE_INDEX VehicleIndex) = "0x243d924feea17838"

//INFO:
//PARAM NOTES:	VehicleModelName - model name of vehicle
//PURPOSE: Get the estimated top speed of the vehicle model on a flat surface
NATIVE FUNC FLOAT GET_VEHICLE_MODEL_ESTIMATED_MAX_SPEED(MODEL_NAMES VehicleModelHashKey) = "0x21adaa2a197d4d0f"

//INFO:
//PARAM NOTES:	VehicleModelName - model name of vehicle
//PURPOSE: Get the maximum braking force this vehicle model can apply, may not be accurate due to tyres slipping
NATIVE FUNC FLOAT GET_VEHICLE_MODEL_MAX_BRAKING(MODEL_NAMES VehicleModelHashKey) = "0x218c5b0472f0b2b3"

//INFO:
//PARAM NOTES:	VehicleModelName - model name of vehicle
//PURPOSE: Get the maximum braking force this vehicle model can apply with mods, may not be accurate due to tyres slipping
NATIVE FUNC FLOAT GET_VEHICLE_MODEL_MAX_BRAKING_MAX_MODS(MODEL_NAMES VehicleModelHashKey) = "0xbeeb8f910a7bfade"

//INFO:
//PARAM NOTES:	VehicleModelName - model name of vehicle
//PURPOSE: Get the maximum traction force this vehicles tyres can apply
NATIVE FUNC FLOAT GET_VEHICLE_MODEL_MAX_TRACTION(MODEL_NAMES VehicleModelHashKey) = "0x049ca97a39eaa3b8"

//INFO:
//PARAM NOTES:	VehicleModelName - model name of vehicle
//PURPOSE: Get the maximum drive force this vehicles can apply to the ground. This isn't particularly accurate and should be used as a guide and referenced with top speed.
NATIVE FUNC FLOAT GET_VEHICLE_MODEL_ACCELERATION(MODEL_NAMES VehicleModelHashKey) = "0xdca867e594b1c1f4"

//INFO:
//PARAM NOTES:	VehicleClass - the VEHICLE_CLASS type
//PURPOSE: Get the maximum drive force this vehicles can apply to the ground with mods. This isn't particularly accurate and should be used as a guide and referenced with top speed.
NATIVE FUNC FLOAT GET_VEHICLE_MODEL_ACCELERATION_MAX_MODS(MODEL_NAMES VehicleModelHashKey) = "0x2d5bf7969a651e1f"

//INFO:
//PARAM NOTES:	VehicleModelName - model name of vehicle
//PURPOSE: get the agility of boats.
NATIVE FUNC FLOAT GET_BOAT_VEHICLE_MODEL_AGILITY(MODEL_NAMES VehicleModelHashKey) = "0x353a3619cd479b9b"

//INFO:
//PARAM NOTES:	VehicleModelName - model name of vehicle
//PURPOSE: Get the agility of planes and heli's
NATIVE FUNC FLOAT GET_FLYING_VEHICLE_MODEL_AGILITY(MODEL_NAMES VehicleModelHashKey) = "0x58153c894737bf15"

//INFO:
//PARAM NOTES:	VehicleClass - the VEHICLE_CLASS type
//PURPOSE: Get the estimated max speed for this vehicle class
NATIVE FUNC FLOAT GET_VEHICLE_CLASS_ESTIMATED_MAX_SPEED(VEHICLE_CLASS VehicleClass) = "0x629583b4ee13ccd4"

//INFO:
//PARAM NOTES:	VehicleClass - the VEHICLE_CLASS type
//PURPOSE: Get the max traction for this vehicle class
NATIVE FUNC FLOAT GET_VEHICLE_CLASS_MAX_TRACTION(VEHICLE_CLASS VehicleClass) = "0x6d4756fd96e33a30"

//INFO:
//PARAM NOTES:	VehicleClass - the VEHICLE_CLASS type
//PURPOSE: Get the max agility for this vehicle class
NATIVE FUNC FLOAT GET_VEHICLE_CLASS_MAX_AGILITY(VEHICLE_CLASS VehicleClass) = "0x15a6b87b67f505a3"

//INFO:
//PARAM NOTES:	VehicleClass - the VEHICLE_CLASS type
//PURPOSE: Get the max acceleration for this vehicle class
NATIVE FUNC FLOAT GET_VEHICLE_CLASS_MAX_ACCELERATION(VEHICLE_CLASS VehicleClass) = "0x0ddceafa6835ab9a"

//INFO:
//PARAM NOTES:	VehicleClass - the VEHICLE_CLASS type
//PURPOSE: Get the max braking for this vehicle class
NATIVE FUNC FLOAT GET_VEHICLE_CLASS_MAX_BRAKING(VEHICLE_CLASS VehicleClass) = "0xe61ae55777273d7c"

/// PURPOSE:
///    Turn off gravity on a vehicle that is having it's position set every frame, so things can walk around inside it.
/// PARAMS:
///    vehicleIndex - Index of the vehicle to be tracked. enableGravity - pass in true to turn gravity on false to turn it off.
NATIVE PROC SET_VEHICLE_GRAVITY(VEHICLE_INDEX vehicleIndex, BOOL enableGravity) = "0x63e35ce7a9e5aed2"

/// PURPOSE:
///    Turns slipstreaming (speeding up when trailing another vehicle) on or off for ALL vehicles
/// PARAMS:
///    EnableSlipstreaming - Enable or disable slipstreaming for all vehicles
NATIVE PROC SET_ENABLE_VEHICLE_SLIPSTREAMING(BOOL EnableSlipstreaming) = "0xed7c8628ea95c8c9"

/// PURPOSE:
///    Turns whether we should turn the slipstreaming timeout (a nax slipstream time of 10 seconds) on or off for ALL vehicles
/// PARAMS:
///    ShouldTimeout - Enable or disable slipstreaming timeout for all vehicles
NATIVE PROC SET_VEHICLE_SLIPSTREAMING_SHOULD_TIME_OUT(BOOL ShouldTimeout) = "0xe80599445b597dc2"

/// PURPOSE:
///    Returns how long this car has been slipstreaming for
/// PARAMS:
///    Car that you want to know how long it has been slipstreaming.
NATIVE FUNC FLOAT GET_VEHICLE_CURRENT_TIME_IN_SLIP_STREAM(VEHICLE_INDEX vehicleIndex) = "0x5921e530f215af43"

//INFO:
//PARAM NOTES:
/// PURPOSE: Returns whether this vehicle is producing a slipstream for another vehicle.
NATIVE FUNC BOOL IS_VEHICLE_PRODUCING_SLIP_STREAM(VEHICLE_INDEX vehicleIndex) = "0xd775397e28c2d359"

//~>                                     Forklift Commands                                  <~

//INFO:
//PARAM NOTES:
//PURPOSE: Drive the forklift forks to their maximum height extent.
NATIVE PROC RAISE_FORKLIFT_FORKS(VEHICLE_INDEX ForkliftIndex) = "0x63581dbc79f6d1a5"

//INFO:
//PARAM NOTES:
//PURPOSE: Drive the forklift forks to their minimum height extent.
NATIVE PROC LOWER_FORKLIFT_FORKS(VEHICLE_INDEX ForkliftIndex) = "0x2aaf406915a80983"

//INFO:
//PARAM NOTES: ForkHeight specifies the height to drive the forks to: 0.0 = bottom, 1.0 = top.
//PURPOSE: Drive the forklift forks to an arbitrary position.
NATIVE PROC SET_FORKLIFT_FORK_HEIGHT(VEHICLE_INDEX ForkliftIndex, FLOAT ForkHeight) = "0x191fe5efd6bc0329"

//INFO:
//PARAM NOTES:
//PURPOSE: Lock the forklift forks in their current position. Needs to be called every frame.
NATIVE PROC LOCK_FORKLIFT_FORKS(VEHICLE_INDEX ForkliftIndex) = "0x5e98610343786a43"

//INFO:
//PARAM NOTES:
//PURPOSE: Determines whether a specific object is attached to the forklift forks.
NATIVE FUNC BOOL IS_ENTITY_ATTACHED_TO_FORKLIFT_FORKS(VEHICLE_INDEX ForkliftIndex, ENTITY_INDEX EntityIndex) = "0x84484da67bcbf778"

//INFO:
//PARAM NOTES:
//PURPOSE: Determines whether any object is attached to the forklift forks.
NATIVE FUNC BOOL IS_ANY_ENTITY_ATTACHED_TO_FORKLIFT_FORKS(VEHICLE_INDEX ForkliftIndex) = "0xd42e522cba88f0bd"

//INFO:	This command will complain if the forklift already has something attached to its forks.
//PARAM NOTES:
//PURPOSE:	Warps an instance of the special pallet prop used with the forlift (and any other objects which have
//			been attached to that) onto the forklift forks and attaches it properly.	 
NATIVE PROC ATTACH_PALLET_TO_FORKLIFT_FORKS(VEHICLE_INDEX ForkliftIndex, ENTITY_INDEX EntityIndex) = "0xbbc1611503773a0b"

//INFO:	This command will complain if nothing is attached to the forklift's forks.
//PARAM NOTES:
//PURPOSE:	Detaches any pallet which has been attached to the forklift's forks. It is up to the script what to
//			do with the objects once detached.
NATIVE PROC DETACH_PALLET_FROM_FORKLIFT_FORKS(VEHICLE_INDEX ForkliftIndex) = "0x8334d0808a48cd35"


//~>                                     Handler Commands                                  <~

//INFO:
//PARAM NOTES:
//PURPOSE: Drive the handler's frame to its maximum height extent.
NATIVE PROC RAISE_HANDLER_FRAME(VEHICLE_INDEX HandlerIndex) = "0xe8e0c37a369d84bb"

//INFO:
//PARAM NOTES:
//PURPOSE: Drive the handler's frame to its minimum height extent.
NATIVE PROC LOWER_HANDLER_FRAME(VEHICLE_INDEX HandlerIndex) = "0x31a3ce65c2b365f3"

//INFO:
//PARAM NOTES: FrameHeight specifies the height to drive the frame to: 0.0 = bottom, 1.0 = top.
//PURPOSE: Drive the handler's frame to an arbitrary position.
NATIVE PROC SET_HANDLER_FRAME_HEIGHT(VEHICLE_INDEX HandlerIndex, FLOAT FrameHeight) = "0x8c28cdb1ca6f46ce"

//INFO:
//PARAM NOTES:
//PURPOSE: Lock the handler's frame in their current position. Needs to be called every frame.
NATIVE PROC LOCK_HANDLER_FRAME(VEHICLE_INDEX HandlerIndex) = "0x5521b58680ab752e"

//INFO:
//PARAM NOTES:
//PURPOSE: Determines whether any object is attached to the handler's frame.
NATIVE FUNC BOOL IS_ANY_ENTITY_ATTACHED_TO_HANDLER_FRAME(VEHICLE_INDEX HandlerIndex) = "0x70e571bf95be7243"

//INFO:
//PARAM NOTES:
//PURPOSE: Searches through all vehicles to find a handler vehicle with a particular container object attached.
NATIVE FUNC VEHICLE_INDEX FIND_HANDLER_VEHICLE_CONTAINER_IS_ATTACHED_TO(ENTITY_INDEX EntityIndex) = "0xdc86a1752a8ada54"

//INFO:
//PARAM NOTES:
//PURPOSE: Determines whether a specific container object is attached to this handler's frame.
NATIVE FUNC BOOL IS_ENTITY_ATTACHED_TO_HANDLER_FRAME(VEHICLE_INDEX HandlerIndex, ENTITY_INDEX ContainerIndex) = "0xc27ac1adfd86ac9d"

//INFO:	This command will complain if the handler already has something attached to its frame.
//PARAM NOTES:
//PURPOSE: Determines if the handler frame is in a good position and orientation with for attaching to the container prop.
NATIVE FUNC BOOL IS_HANDLER_FRAME_LINED_UP_WITH_CONTAINER(VEHICLE_INDEX HandlerIndex, ENTITY_INDEX EntityIndex) = "0x36d170c816c17270"

//INFO:	This command will complain if the handler already has something attached to its frame.
//PARAM NOTES:
//PURPOSE:	Warps an instance of the special container prop used with the handler onto the handler's frame and attaches it properly.
NATIVE PROC ATTACH_CONTAINER_TO_HANDLER_FRAME(VEHICLE_INDEX HandlerIndex, ENTITY_INDEX EntityIndex) = "0x664cb1654b43ee76"

//INFO:	This command will complain if the handler already has something attached to its frame.
//PARAM NOTES:
//PURPOSE:	Attaches an instance of the special container prop used with the handler onto the handler's frame by
//			lerping it instead of warping it so the caller is responsible for first checking that the container
//			is in position with IS_HANDLER_FRAME_LINED_UP_WITH_CONTAINER.
NATIVE PROC ATTACH_CONTAINER_TO_HANDLER_FRAME_WHEN_LINED_UP(VEHICLE_INDEX HandlerIndex, ENTITY_INDEX EntityIndex) = "0x618335ab4b1ad654"

//INFO:	This command will complain if nothing is attached to the handler's frame.
//PARAM NOTES:
//PURPOSE:	Detaches any container which has been attached to the handler's frame. It is up to the script what to
//			do with the objects once detached.
NATIVE PROC DETACH_CONTAINER_FROM_HANDLER_FRAME(VEHICLE_INDEX HandlerIndex) = "0xc58cd2901ebceef1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the vehicle to ignore calls to set the wheel compression (ie. from SET_VEHICLE_ON_GROUND_PROPERLY)
//		   to allow blending back into the game from a cutscene task without the wheels popping. Use this command only 
//		   if you're sure the cutscene places the vehicle/wheels in a state that is okay to enter the game with
NATIVE FUNC BOOL SET_VEHICLE_USE_CUTSCENE_WHEEL_COMPRESSION (VEHICLE_INDEX VehicleIndex, BOOL UseCutsceneWheelCompression = TRUE, BOOL AnimateWheels = TRUE, BOOL AnimateJoints = TRUE) = "0xf9639b5c765fed1f"

//~>                                    Position Commands                                   <~                                  

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the vehicle on the ground taking nto account the angle of the ground.
NATIVE FUNC BOOL SET_VEHICLE_ON_GROUND_PROPERLY (VEHICLE_INDEX VehicleIndex, FLOAT hightSampleRangeUp = 5.0 ) = "0x9f65b3bafa302a65"

//INFO: 
//PARAM NOTES:
//PURPOSE: Rotates the vehicle so that it faces toward the given co-ordinate. 
NATIVE PROC SET_VEHICLE_TURNS_TO_FACE_COORD(VEHICLE_INDEX VehicleIndex, FLOAT PointAtX, FLOAT PointAtY) = "0xd8121ce97bd336f9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that the vehicle is stopped
NATIVE FUNC BOOL IS_VEHICLE_STOPPED(VEHICLE_INDEX VehicleIndex) = "0xa7a8e89ea6c5e222"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that a vehicle is stopped at lights 
NATIVE FUNC BOOL IS_VEHICLE_STOPPED_AT_TRAFFIC_LIGHTS(VEHICLE_INDEX VehicleIndex) = "0x7f25db35334461e0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks  that the vehicle has stopped because of the traffic lights.
NATIVE FUNC BOOL HAS_VEHICLE_STOPPED_BECAUSE_OF_LIGHT(VEHICLE_INDEX VehicleIndex) = "0x2601fedae60b7d23"

//~>                                      Location Commands                                 <~

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the vehicle is not in contact with anything.
NATIVE FUNC BOOL IS_VEHICLE_ON_ALL_WHEELS(VEHICLE_INDEX VehicleIndex) = "0x78006d212fd7243e"

//~>                        Wheel commands

//INFO: 
//PARAM NOTES: SC_WHEEL_LIST is in commands_vehicle.sch
//			   IsBurstToRim true will return true only when just the rim remains for the tyre
//PURPOSE: Checks if a vehicles tyre is burst
NATIVE FUNC BOOL IS_VEHICLE_TYRE_BURST(VEHICLE_INDEX VehicleIndex, SC_WHEEL_LIST WheelNumber, BOOL IsBurstToRim = FALSE) = "0xb4c63f21d1dc6c23"

//INFO: 
//PARAM NOTES: InstantBurst set to true will play burst VFX and tyres will switch to rims
//PURPOSE: Sets a vehicles tyre burst.
NATIVE PROC SET_VEHICLE_TYRE_BURST(VEHICLE_INDEX VehicleIndex, SC_WHEEL_LIST WheelNumber, BOOL InstantBurst = FALSE, FLOAT Damage = 1000.0) = "0x7517a117ea38d570"

//INFO: 
//PARAM NOTES:
//PURPOSE: Fixes a vehicles burts tyre
NATIVE PROC SET_VEHICLE_TYRE_FIXED(VEHICLE_INDEX VehicleIndex, SC_WHEEL_LIST WheelNumber) = "0xf66e9c612e9bcd20"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the number plate to the specified literal string
NATIVE PROC SET_VEHICLE_NUMBER_PLATE_TEXT(VEHICLE_INDEX VehicleIndex, STRING licencePlateTxt_Max8Chars) = "0x2c2f2f6bee7ac7e7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns a vehicle's license plate. Note it will only return alphanumeric characters.
NATIVE FUNC STRING GET_VEHICLE_NUMBER_PLATE_TEXT(VEHICLE_INDEX VehicleIndex) = "0x80d16db58890b7bc"

//PURPOSE: Returns one character from the number plate string
NATIVE FUNC STRING GET_VEHICLE_NUMBER_PLATE_CHARACTER(STRING pNumberPlateText, INT CharacterIndex) = "0x77de26a07abbc76e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the number of different license plates that have been set up by the vehicle artists and
//			can be used by SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX
NATIVE FUNC INT GET_NUMBER_OF_VEHICLE_NUMBER_PLATES() = "0xacf41d856b7ccb39"

//INFO: 
//PARAM NOTES: index should be greater than or equal to 0 and less than the value returned by GET_NUMBER_OF_VEHICLE_NUMBER_PLATES.
//PURPOSE: Sets the number plate to one of a set specified by the vehicle artists.
NATIVE PROC SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(VEHICLE_INDEX VehicleIndex, INT index) = "0xe56b65c6b89cfcf2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the number plate index
NATIVE FUNC INT GET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(VEHICLE_INDEX VehicleIndex) = "0xc264f708491d88d7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if a vehicles tyre can burst.
NATIVE PROC SET_VEHICLE_TYRES_CAN_BURST(VEHICLE_INDEX VehicleIndex, BOOL CanBurstTyresFlag) = "0xafe1b52f0de91595"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets if a vehicles tyres can burst.
NATIVE FUNC BOOL GET_VEHICLE_TYRES_CAN_BURST(VEHICLE_INDEX VehicleIndex) = "0xc8e55aeb1e2b047f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if a vehicles tyre can strip to the rim after they burst.
NATIVE PROC SET_VEHICLE_TYRES_CAN_BURST_TO_RIM(VEHICLE_INDEX VehicleIndex, BOOL CanBurstTyresFlag) = "0x5e6ddf43008276cc"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets if a vehicles tyres can strip to the rim after they burst.
NATIVE FUNC BOOL GET_VEHICLE_TYRES_CAN_BURST_TO_RIM(VEHICLE_INDEX VehicleIndex) = "0x1e6652013b0d5cf9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if a vehicles wheels can break.
NATIVE PROC SET_VEHICLE_WHEELS_CAN_BREAK(VEHICLE_INDEX VehicleIndex, BOOL CanBreakWheelsFlag) = "0xf5a71ed585ae4eac"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets if a vehicles wheels can break.
NATIVE FUNC BOOL GET_VEHICLE_WHEELS_CAN_BREAK(VEHICLE_INDEX VehicleIndex) = "0xd376c327e507f32c"

//INFO: 
//PARAM NOTES:
//PURPOSE :Reset vehicle wheels to original (modelled) position, or to fully extended position
NATIVE PROC RESET_VEHICLE_WHEELS(VEHICLE_INDEX VehicleIndex, BOOL bExtend) = "0x672374e428bf31db"

//INFO: 
//PARAM NOTES:
//PURPOSE :Removes all the vehicles windows
NATIVE PROC ROLL_DOWN_WINDOWS(VEHICLE_INDEX VehicleIndex) = "0xabaf363c566079cf"

//INFO: 
//PARAM NOTES:
//PURPOSE: Rolls down a given vehicle window. NB - it only snaps the window down. Probably want to do this off-screen.
NATIVE PROC ROLL_DOWN_WINDOW(VEHICLE_INDEX VehicleIndex, SC_WINDOW_LIST WindowNumber) = "0xa664b3d039ffded1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Rolls up a given vehicle window. NB - it only snaps the window up. Probably want to do this off-screen.
NATIVE PROC ROLL_UP_WINDOW(VEHICLE_INDEX VehicleIndex, SC_WINDOW_LIST WindowNumber) = "0x16dbb2e2df4aeedd"

//INFO: 
//PARAM NOTES: only works on automobiles
//PURPOSE: Forces the car to have lower friction tyres on the driven wheels
NATIVE PROC SET_VEHICLE_BURNOUT(VEHICLE_INDEX VehicleIndex, BOOL bEnableBurnout) = "0xdaca4dfbfd1bec8a"

//INFO: 
//PARAM NOTES: only works on automobiles
//PURPOSE: Returns true if the player is performing a burnout
NATIVE FUNC BOOL IS_VEHICLE_IN_BURNOUT(VEHICLE_INDEX VehicleIndex) = "0x6aca3842dd7f2536"

//INFO: 
//PARAM NOTES: only works on automobiles
//PURPOSE: Forces the car to have lower friction tyres
NATIVE PROC SET_VEHICLE_REDUCE_GRIP(VEHICLE_INDEX VehicleIndex, BOOL bEnableReduceGrip) = "0x03e7ca3dc742fa72"

//INFO: 
//PARAM NOTES: only works on automobiles
//PURPOSE: Sets the grip level to use, from 0 to 3, when the above function SET_VEHICLE_REDUCE_GRIP is called
NATIVE PROC SET_VEHICLE_REDUCE_GRIP_LEVEL(VEHICLE_INDEX VehicleIndex, INT ReducedGripLevel) = "0xbc1cdf8c3ef5fa95"

//~>                                 Stuck & Upside Down Commands                   <~

//INFO: This command is similar to the basic ADD_STUCK_CAR_CHECK except that the game will attempt to warp the car as soon as it becomes stuck. 
//          The three flags are used to control whether the car is warped if it has become stuck, as soon as it is upside-down or as soon as it is in water.
//PARAM NOTES: WarpMethod: if WarpMethod is negative then the car will attempt to warp back on to its last route node.
//                          If WarpMethod is greater than 0 then the car will try to warp to that number of closest car nodes, starting with the closest. 
//                          In both cases (last route node or closest car nodes), the car will only warp if both it and the destination coordinates are offscreen.
//PURPOSE: Will attempt to warp a vehicle out of a stuck or upsidedown or in water position. More info..
NATIVE PROC ADD_VEHICLE_STUCK_CHECK_WITH_WARP(VEHICLE_INDEX VehicleIndex, FLOAT MinimumMoveDistance, INT CheckFrequency, BOOL WarpIfStuckFlag, BOOL WarpIfUpsideDownFlag, BOOL WarpIfInWaterFlag, INT WarpMethod) = "0x4ccfba59b410315d"

//INFO: Use this command to tell the game that this car should be checked for being stuck on its roof. 
//              If the deatharrest code is switched on and the specified car does become stuck then a message will be displayed and the current mission will fail. 
//PARAM NOTES:
//PURPOSE: Adds a vehicle is upside down check. More info..
NATIVE PROC ADD_VEHICLE_UPSIDEDOWN_CHECK(VEHICLE_INDEX VehicleIndex) = "0x66e36c5e6e28930c"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Remove a upsidedown vehicle check
NATIVE PROC REMOVE_VEHICLE_UPSIDEDOWN_CHECK(VEHICLE_INDEX VehicleIndex) = "0xf5644c53558c678d"

//INFO:  If the deatharrest code is switched off, it is still possible to check for a particular car being stuck on its roof. Before using this command, you must have called ADD_VEHICLE_UPSIDEDOWN_CHECK for CarID. 
//PARAM NOTES:
//PURPOSE:  Checks that a vehicle is stuck on its roof. More info..
NATIVE FUNC BOOL IS_VEHICLE_STUCK_ON_ROOF(VEHICLE_INDEX VehicleIndex) = "0x66aa8bc9ca1be26c"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Removes a vehicle stuck check
NATIVE PROC REMOVE_VEHICLE_STUCK_CHECK(VEHICLE_INDEX VehicleIndex) = "0x64859f2b7f1e9459"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that a vehicle has a atuck check
NATIVE FUNC BOOL DOES_VEHICLE_HAVE_STUCK_VEHICLE_CHECK(VEHICLE_INDEX VehicleIndex) = "0x79a822779cc6508a"

ENUM eVehStuckTypes
    VEH_STUCK_ON_ROOF = 0,
    VEH_STUCK_ON_SIDE,
    VEH_STUCK_HUNG_UP,
    VEH_STUCK_JAMMED,
    VEH_STUCK_RESET_ALL
ENDENUM
// each check has its own timer, max RequiredTime = 65536.
// on roof means upside down on roof                            (suggest check time  5000)
// on side means                                                (suggest check time 20000 - player may be able to free themselves if wheels touch enough)
// hung up means colliding and no drive wheels on the ground    (suggest check time 30000 - player may be able to free themselves by rocking the car and burnouts)
// jammed means using the accelerator but not getting anywhere  (suggest check time 60000)

//INFO: 
//PARAM NOTES:
//PURPOSE: Has a timer for a specific stuck check expired.
NATIVE FUNC BOOL IS_VEHICLE_STUCK_TIMER_UP(VEHICLE_INDEX VehicleIndex, eVehStuckTypes StuckType, INT RequiredTime) = "0xf798dcf92c74b531"

//INFO: 
//PARAM NOTES: eVehStuckTypes is in ciommands_vehicle.sch
//PURPOSE: Resets a vehicles stuck check.  More info..
NATIVE PROC RESET_VEHICLE_STUCK_TIMER(VEHICLE_INDEX VehicleIndex, eVehStuckTypes StuckType) = "0xd8948f63b2ebc20e"

//~>                                Colour Commands                             <~

//INFO: 
//PARAM NOTES:
//PURPOSE:  Gets the vehicles colours. 
NATIVE PROC GET_VEHICLE_COLOURS(VEHICLE_INDEX VehicleIndex, INT &ReturnColour1, INT &ReturnColour2) = "0xdca20dba52b32eec"

//INFO: Colours can be found in carcols.dat
//PARAM NOTES:
//PURPOSE: Sets the body colours of the cars
NATIVE PROC SET_VEHICLE_FULLBEAM(VEHICLE_INDEX VehicleIndex, BOOL bOn) = "0x7eeabc35fcfa08b7"

//INFO: 
//PARAM NOTES:
//PURPOSE: If bRacing is set to true, vehicle will use more aggressive
//avoidance parameters when avoiding other vehicles that are also racing
NATIVE PROC SET_VEHICLE_IS_RACING(VEHICLE_INDEX VehicleIndex, BOOL bRacing) = "0xe4a910d49c232c19"

//INFO: Colours can be found in carcols.dat
//PARAM NOTES:
//PURPOSE: Sets the body colours of the cars
NATIVE PROC SET_VEHICLE_COLOURS(VEHICLE_INDEX VehicleIndex, INT Colour1, INT Colour2) = "0x58dafdeb2f46a5ea"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the primary colour of a car. 
NATIVE PROC SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(VEHICLE_INDEX VehicleIndex, INT Red, INT Green, INT Blue) = "0x401f3880d64cb7d9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the primary colour of a car. 
NATIVE PROC GET_VEHICLE_CUSTOM_PRIMARY_COLOUR(VEHICLE_INDEX VehicleIndex, INT& Red, INT& Green, INT& Blue) = "0x3d8bb85a33e13d09"

//INFO: 
//PARAM NOTES:
//PURPOSE: Clears the primary colour of a car. 
NATIVE PROC CLEAR_VEHICLE_CUSTOM_PRIMARY_COLOUR(VEHICLE_INDEX VehicleIndex) = "0x812006f6c16bbea2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the current primary color on the specified vehicle is custom, false otherwise
NATIVE FUNC BOOL GET_IS_VEHICLE_PRIMARY_COLOUR_CUSTOM(VEHICLE_INDEX VehicleIndex) = "0xa4429f0196864bb8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the secondary colour of a car. 
NATIVE PROC SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(VEHICLE_INDEX VehicleIndex, INT Red, INT Green, INT Blue) = "0x4a498f8f5db5d526"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the secondary colour of a car. 
NATIVE PROC GET_VEHICLE_CUSTOM_SECONDARY_COLOUR(VEHICLE_INDEX VehicleIndex, INT& Red, INT& Green, INT& Blue) = "0xfb61e9a85a29dda7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Clears the secondary colour of a car. 
NATIVE PROC CLEAR_VEHICLE_CUSTOM_SECONDARY_COLOUR(VEHICLE_INDEX VehicleIndex) = "0xd27cad777bb60ae5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the current secondary color on the specified vehicle is custom, false otherwise
NATIVE FUNC BOOL GET_IS_VEHICLE_SECONDARY_COLOUR_CUSTOM(VEHICLE_INDEX VehicleIndex) = "0x21db5182c34b6c0e"

//PURPOSE: Gets the number of valid colours for a given vehicle model
NATIVE FUNC INT GET_NUMBER_OF_VEHICLE_MODEL_COLOURS(MODEL_NAMES VehicleModelHashKey) = "0x109bef77799d08dc"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets EnvEff scale on vehicle
NATIVE PROC SET_VEHICLE_ENVEFF_SCALE(VEHICLE_INDEX VehicleIndex, FLOAT scale) = "0x6df92db1542a3e0d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets EnvEff scale from vehicle
NATIVE FUNC FLOAT GET_VEHICLE_ENVEFF_SCALE(VEHICLE_INDEX VehicleIndex) = "0x09566e2739f599fa"


//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the number of vehicle colours
NATIVE FUNC INT GET_NUMBER_OF_VEHICLE_COLOURS(VEHICLE_INDEX VehicleIndex) = "0x76910b06be582258"

//INFO: Car models have a number of colour combinations preset for them in carvariations.pso.meta
//          Use GET_NUM_CAR_COLOURS first to find out how many combinations there are. 
//PARAM NOTES:
//PURPOSE: Set some of the preselcted colour combinations. More info..
NATIVE PROC SET_VEHICLE_COLOUR_COMBINATION(VEHICLE_INDEX VehicleIndex, INT ColourCombination) = "0xd584204572df0440"

//INFO: Car models have a number of colour combinations preset for them in carvariations.pso.meta
//          Use GET_NUM_CAR_COLOURS first to find out how many combinations there are. 
//PARAM NOTES:
//PURPOSE: Get the active color combination on a vehicle. More info..
NATIVE FUNC INT GET_VEHICLE_COLOUR_COMBINATION(VEHICLE_INDEX VehicleIndex) = "0xe0095ca086337962"

//INFO: Colour3 and Colour4 should be taken from the list in carcols.dat. 
//PARAM NOTES:
//PURPOSE: Set a vehicles extra colours. More info..
NATIVE PROC SET_VEHICLE_EXTRA_COLOURS(VEHICLE_INDEX VehicleIndex, INT ExtraColour1, INT ExtraColour2) = "0x952b5201cc721090"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets a vehicles extra colours
NATIVE PROC GET_VEHICLE_EXTRA_COLOURS(VEHICLE_INDEX VehicleIndex, INT &ReturnExtraCarColour1, INT &ReturnExtraCarColour2) = "0x356c37f1aa6ea3aa"

//INFO: Colour5 should be taken from the list in carcols.dat. 
//PARAM NOTES:
//PURPOSE: Set a vehicles extra colour 5.
NATIVE PROC SET_VEHICLE_EXTRA_COLOUR_5(VEHICLE_INDEX VehicleIndex, INT ExtraColour5) = "0x63140c89ad7622ef"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets a vehicles extra colour 5
NATIVE PROC GET_VEHICLE_EXTRA_COLOUR_5(VEHICLE_INDEX VehicleIndex, INT &ReturnExtraCarColour5) = "0x1e4d0d5de3802bc2"

//INFO: Colour6 should be taken from the list in carcols.dat. 
//PARAM NOTES:
//PURPOSE: Set a vehicles extra colour 6.
NATIVE PROC SET_VEHICLE_EXTRA_COLOUR_6(VEHICLE_INDEX VehicleIndex, INT ExtraColour6) = "0xce01344f3cabba9d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets a vehicles extra colour 6
NATIVE PROC GET_VEHICLE_EXTRA_COLOUR_6(VEHICLE_INDEX VehicleIndex, INT &ReturnExtraCarColour6) = "0x04ce0bf11e7d9de4"


//INFO:
//PARAM NOTES:
//PURPOSE: Set Xenon light index for the vehicle
NATIVE PROC SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(VEHICLE_INDEX VehicleIndex, INT XenonColorLightIndex) = "0x300bfaa8e2a36a8e"

//INFO:
//PARAM NOTES:
//PURPOSE: Get Xenon light index for the vehicle (0xFF is invalid)
NATIVE FUNC INT GET_VEHICLE_XENON_LIGHT_COLOR_INDEX(VEHICLE_INDEX VehicleIndex) = "0xdb29312237512d99"


//~>                            Door commands

//INFO: 
//PARAM NOTES:
//PURPOSE:  Shuts all the doors on a vehicle
NATIVE PROC SET_VEHICLE_DOORS_SHUT(VEHICLE_INDEX VehicleIndex, BOOL bShutInstantly = TRUE) = "0x0e97fae15bee6379"

//INFO: 
//PARAM NOTES: SC_DOOR_LIST and DOOR_DAMAGE are in commands_vehicle.sch
//                      fAngleRatio should be between (0.0=shut 1.0=open ) or use -1.0 to ignore. 
//PURPOSE: Sets a vehicles door to a new state. More info..
NATIVE PROC SET_VEHICLE_DOOR_CONTROL(VEHICLE_INDEX VehicleIndex, SC_DOOR_LIST DoorNumber, DOOR_DAMAGE DoorStatus, FLOAT AngleRatio) = "0x59492c1b3db11bde"

//INFO: 
//PARAM NOTES: SC_DOOR_LIST is in commands_vehicle.sch
//PURPOSE: Gets the door angle of a door between 0.0 and 1.0. More info..
NATIVE FUNC FLOAT GET_VEHICLE_DOOR_ANGLE_RATIO(VEHICLE_INDEX VehicleIndex, SC_DOOR_LIST DoorNumber) = "0x7df569d9e616d55e"

//INFO: 
//PARAM NOTES: SC_DOOR_LIST is in commands_vehicle.sch
//PURPOSE: Gets the door target ratio of a door between 0.0 and 1.0. 
NATIVE FUNC FLOAT GET_VEHICLE_DOOR_TARGET_RATIO(VEHICLE_INDEX VehicleIndex, SC_DOOR_LIST DoorNumber) = "0xf63231a9bb567dd2"

//INFO: 
//PARAM NOTES: SC_DOOR_LIST is in commands_vehicle.sch
//PURPOSE: Gets the ped that current holds a door reservation for the requested vehicle door
NATIVE FUNC PED_INDEX GET_PED_USING_VEHICLE_DOOR(VEHICLE_INDEX VehicleIndex, SC_DOOR_LIST DoorNumber) = "0xbc76e5204e0d5382"

//INFO: 
//PARAM NOTES: SC_DOOR_LIST is in commands_vehicle.sch
//PURPOSE: Sets a vehicle door to latch. More info..
NATIVE PROC SET_VEHICLE_DOOR_LATCHED(VEHICLE_INDEX VehicleIndex, SC_DOOR_LIST DoorNumber, BOOL SetLatched, BOOL WillAutoLatch, BOOL bApplyForceForDoorClosed = TRUE) = "0x3707f224fa0050ea"

//INFO: 
//PARAM NOTES: SC_DOOR_LIST is in commands_vehicle.sch
//PURPOSE: Opens a vehicle door.More info..
NATIVE PROC SET_VEHICLE_DOOR_OPEN(VEHICLE_INDEX VehicleIndex, SC_DOOR_LIST DoorNumber, BOOL SwingFree = FALSE, BOOL Instant = FALSE) = "0x2476be9932670cad"

//INFO: 
//PARAM NOTES: SC_DOOR_LIST is in commands_vehicle.sch
//PURPOSE: Sets a vehicle door to auto lock when closed.
NATIVE PROC SET_VEHICLE_DOOR_AUTO_LOCK(VEHICLE_INDEX VehicleIndex, SC_DOOR_LIST DoorNumber, BOOL AutoLock) = "0xb14ac5c9d3b8d524"

//INFO: 
//PARAM NOTES: SC_DOOR_LIST is in commands_vehicle.sch
//PURPOSE: The door will be avoided like it was open in the pathfinder, pass in -1 or SC_DOOR_INVALID to open / close all doors. Make sure this is reset when done
NATIVE PROC SET_VEHICLE_DOOR_OPEN_FOR_PATHFINDER(VEHICLE_INDEX VehicleIndex, SC_DOOR_LIST DoorNumber, BOOL Open = TRUE) = "0xa88e6b0bfa86c1b9"

//INFO: 
//PARAM NOTES: SC_DOOR_LIST is in commands_vehicle.sch
//PURPOSE: Shuts a vehicle door. More info..
NATIVE PROC SET_VEHICLE_DOOR_SHUT(VEHICLE_INDEX VehicleIndex, SC_DOOR_LIST DoorNumber, BOOL bShutInstantly = TRUE) = "0xcaa02c32ec0c2462"

//INFO: 
//PARAM NOTES: SC_DOOR_LIST is in commands_vehicle.sch
//PURPOSE: Breaks a vehicle door. More info..
NATIVE PROC SET_VEHICLE_DOOR_BROKEN(VEHICLE_INDEX VehicleIndex, SC_DOOR_LIST DoorNumber, BOOL bDissapear) = "0xf2a3bd88ac59d1b0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the vehicle so it can break apart
NATIVE PROC SET_VEHICLE_CAN_BREAK(VEHICLE_INDEX VehicleIndex, BOOL bAllowBreaking) = "0x5bb40fec6faa468d"

//INFO: 
//PARAM NOTES: LOCK_STATE is in commands_vehicle.sch
//PURPOSE: Set the vehicle doors to a certain locked state. More info..
NATIVE PROC SET_VEHICLE_DOORS_LOCKED(VEHICLE_INDEX VehicleIndex, LOCK_STATE NewLockState) = "0x3b2646b62e7bbe11"

//INFO: 
//PARAM NOTES: LOCK_STATE is in commands_vehicle.sch
//PURPOSE: Set the given doors to a certain locked state. More info..
NATIVE PROC SET_VEHICLE_INDIVIDUAL_DOORS_LOCKED(VEHICLE_INDEX VehicleIndex, INT DoorIndex, LOCK_STATE NewLockState) = "0xea390390606de844"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Locks the doors for the given player. Only used in the network game. 
NATIVE PROC SET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(VEHICLE_INDEX VehicleIndex, PLAYER_INDEX PlayerIndex, BOOL Locked) = "0xceefce6c0d7566c9"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Unlocks vehicles that have been flagged as enterable only in the special edition of the game.
NATIVE PROC SET_ENTER_LOCKED_FOR_SPECIAL_EDITION_VEHICLES(BOOL bCanEnter) = "0x0b71df77491c6940"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Tells the vehicle not to quit it's task when its achieved
NATIVE PROC SET_VEHICLE_DONT_TERMINATE_TASK_WHEN_ACHIEVED(VEHICLE_INDEX VehicleIndex) = "0x9c2afd6cc05195ef"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns true if the doors are locked the given player. Only used in the network game. 
NATIVE FUNC BOOL GET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(VEHICLE_INDEX VehicleIndex, PLAYER_INDEX PlayerIndex) = "0xe63219d598ed6478"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Locks the doors for all players. Only used in the network game. 
NATIVE PROC SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(VEHICLE_INDEX VehicleIndex, BOOL Locked) = "0x2706c6faa25ab1b7"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Locks the doors for all players that are not participating in the script that created the vehicle. Only used in the network game. 
NATIVE PROC SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(VEHICLE_INDEX VehicleIndex, BOOL Locked) = "0x484ccfb803fcfd80"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Locks the doors for the given team. Only used in the network game. 
NATIVE PROC SET_VEHICLE_DOORS_LOCKED_FOR_TEAM(VEHICLE_INDEX VehicleIndex, INT TeamIndex, BOOL Locked) = "0x00810c7d84492ae4"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns true if the doors are locked for the given team. Only used in the network game. 
NATIVE FUNC BOOL GET_VEHICLE_DOORS_LOCKED_FOR_TEAM(VEHICLE_INDEX VehicleIndex, INT TeamIndex) = "0x20fa5b4ddfd395e0"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Locks the doors for all teams. Only used in the network game. 
NATIVE PROC SET_VEHICLE_DOORS_LOCKED_FOR_ALL_TEAMS(VEHICLE_INDEX VehicleIndex, BOOL Locked) = "0xdb3d9d1ce4f105fb"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Overrides team locking for the specified player. This allows a player access to a vehicle that is locked
//         for their team. Only used in the network game.
NATIVE PROC SET_VEHICLE_DOORS_TEAM_LOCK_OVERRIDE_FOR_PLAYER(VEHICLE_INDEX VehicleIndex, PLAYER_INDEX PlayerIndex, BOOL Override) = "0x2bfc202fd3859038"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Locks the doors for all vehicles of a vehicle type for a given player. Only used in the network game. 
NATIVE PROC SET_VEHICLE_MODEL_DOORS_LOCKED_FOR_PLAYER(PLAYER_INDEX PlayerIndex, MODEL_NAMES ModelHashKey, BOOL Locked) = "0x15d2ec556ea8dfb7"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Locks the doors for all vehicles of a vehicle type for a given player. Only used in the network game. 
NATIVE PROC SET_VEHICLE_MODEL_INSTANCE_DOORS_LOCKED_FOR_PLAYER(PLAYER_INDEX PlayerIndex, VEHICLE_INDEX VehicleIndex, BOOL Locked) = "0x923a8a885d782623"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Clears the locked vehicle models for local network player. Only used in the network game.
NATIVE PROC CLEAR_VEHICLE_MODEL_DOORS_LOCKED_FOR_PLAYER(PLAYER_INDEX PlayerIndex) = "0x71f98db115d00c5f"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Clears the locked vehicle instances for local network player. Only used in the network game.
NATIVE PROC CLEAR_VEHICLE_MODEL_INSTANCE_DOORS_LOCKED_FOR_PLAYER(PLAYER_INDEX PlayerIndex) = "0x066d46dd818c3ef2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the vehicle lock status.
NATIVE FUNC LOCK_STATE GET_VEHICLE_DOOR_LOCK_STATUS(VEHICLE_INDEX VehicleIndex) = "0xa09765d2ade13cae"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the door lock status for given door index.
NATIVE FUNC LOCK_STATE GET_VEHICLE_INDIVIDUAL_DOOR_LOCK_STATUS(VEHICLE_INDEX VehicleIndex, INT DoorIndex) = "0x2aa76deb8bb593a3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the vehicle door is intact
NATIVE FUNC BOOL IS_VEHICLE_DOOR_DAMAGED(VEHICLE_INDEX VehicleIndex, SC_DOOR_LIST DoorNumber) = "0x2abe742a1b0bf1a6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that a vehicle door is open 
NATIVE FUNC BOOL IS_VEHICLE_DOOR_FULLY_OPEN(VEHICLE_INDEX VehicleIndex, SC_DOOR_LIST DoorNumber) = "0x9e2309ac10d3abe6"

//INFO: 
//PARAM NOTES:
//PURPOSE:  opens a car boot.
NATIVE PROC SET_CAR_BOOT_OPEN(VEHICLE_INDEX VehicleIndex) = "0xa4fcb26551d216b8"

//INFO: 
//PARAM NOTES: SC_DOOR_LIST is in commands_vehicle.sch
//PURPOSE: Prevent a door from being broken off.
NATIVE PROC SET_DOOR_ALLOWED_TO_BE_BROKEN_OFF(VEHICLE_INDEX VehicleIndex, SC_DOOR_LIST DoorNumber, BOOL bDoorBreakageAllowed) = "0x6d60abba76db955a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if a bumper (front or rear) is bouncing from damage
NATIVE FUNC BOOL IS_VEHICLE_BUMPER_BOUNCING(VEHICLE_INDEX VehicleIndex, bool front) = "0xb27089b11e5dbcad"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if a bumper (front or rear) is broken off
NATIVE FUNC BOOL IS_VEHICLE_BUMPER_BROKEN_OFF(VEHICLE_INDEX VehicleIndex, bool front) = "0xc9d76a6a7441f5a4"

//INFO: Command to open a bomb bay, this isn't setup like a normal door.
//PARAM NOTES: 
//PURPOSE: Drives the bomb bay doors to their extents
NATIVE PROC OPEN_BOMB_BAY_DOORS(VEHICLE_INDEX VehicleIndex) = "0x374a31568f76efaf"

//INFO: Command to close a bomb bay, this isn't setup like a normal door.
//PARAM NOTES: 
//PURPOSE: Drives the bomb bay doors to a close
NATIVE PROC CLOSE_BOMB_BAY_DOORS(VEHICLE_INDEX VehicleIndex) = "0x93a61d7cd6f5537d"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns whether the bomb bay doors are open
NATIVE FUNC BOOL GET_ARE_BOMB_BAY_DOORS_OPEN(VEHICLE_INDEX VehicleIndex) = "0x2f3c82da3a15cd5e"

//INFO: Forces this plane's doors to use the large rear ramp tuning values
//PARAM NOTES: 
//PURPOSE: Allow the Cargoplane's rear door to drive slowly and smoothly for some missions
NATIVE PROC SET_VEHICLE_USES_LARGE_REAR_RAMP(VEHICLE_INDEX VehicleIndex, BOOL Use) = "0xea6971de99dd06ce"

//INFO: Command to check if the direct access entry point for a seat is clear (ped can enter/exit). This is quite expensive,
// So don't call it too often!
//PARAM NOTES: CheckSide - some vehicle seats can be entered from two sides (e.g. bike / jetski), 
//			if set to true, this checks the entry point corresponding to the LeftSide (set to FALSE to check the right side entry)
//PURPOSE:
NATIVE FUNC BOOL IS_ENTRY_POINT_FOR_SEAT_CLEAR(PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, VEHICLE_SEAT Seat, BOOL CheckSide = FALSE, BOOL LeftSide = FALSE) = "0x33168c7a83d47cc0"

//INFO: Command to check if a ped could shuffle from this seat. This is a bit expensive,
//PARAM NOTES: 
//PURPOSE:
NATIVE FUNC BOOL CAN_SHUFFLE_SEAT(VEHICLE_INDEX VehicleIndex, VEHICLE_SEAT Seat) = "0xcc63baf56c17834c"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Enables Full Throttle mode on vehicle for specified duration
NATIVE PROC SET_VEHICLE_FULL_THROTTLE_TIMER(VEHICLE_INDEX VehicleIndex, INT nTimeFromNowMs) = "0x8af5a56952b85be2"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Removes driver if available and sets the vehicle to be abandoned
NATIVE PROC SET_VEHICLE_OUT_OF_CONTROL(VEHICLE_INDEX VehicleIndex, BOOL KillPedsInVehicle = TRUE, BOOL ExplodeOnNextImpact = TRUE) = "0x15c98c9826ee029a"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns number of entry points for the specified vehicle. 
NATIVE FUNC INT GET_NUM_ENTRY_POINTS(VEHICLE_INDEX VehicleIndex) = "0xf4a2f4525f67b076"

//INFO: 
//PARAM NOTES: EntryPointIndex: Use GET_NUM_ENTRY_POINTS to get number of entry points. Pass in any value between 0 and GET_NUM_ENTRY_POINTS.
//PURPOSE: Returns the position of the specified entry point. 
NATIVE FUNC VECTOR GET_ENTRY_POINT_POSITION(VEHICLE_INDEX VehicleIndex, INT EntryPointIndex) = "0x6cd0b79c6a87ba2d"

//~>                        Explode commands

//INFO: 
//PARAM NOTES: Add Explosion will determines if an explosion happens
//PURPOSE: Explodes a vehicle. More info..
NATIVE PROC EXPLODE_VEHICLE(VEHICLE_INDEX VehicleIndex, BOOL AddExplosion=TRUE, BOOL KeepDamageEntity=FALSE) = "0x207617ce1796d28e"

//INFO: 
//PARAM NOTES:
//PURPOSE:  explosed a vehicle in a cutscene
NATIVE PROC EXPLODE_VEHICLE_IN_CUTSCENE(VEHICLE_INDEX VehicleIndex, BOOL AddExplosion=TRUE) = "0x6931de5ef0f6ed65"

/// INFO: 
/// PARAM NOTES: Only available in network games
/// PURPOSE: Blow up a vehicle after a particular time
/// PARAMS:
///    PedIndex - Index of the ped that is responsible for the explosion. 
NATIVE PROC SET_VEHICLE_TIMED_EXPLOSION(VEHICLE_INDEX VehicleIndex, PED_INDEX PedIndex, INT nTimeFromNow) = "0xc91d36e05e1b8246"

/// INFO: 
/// PARAM NOTES: Only available in network games
/// PURPOSE: Adds a device to a vehicle that can be detonated at a later date with 
/// PARAMS:
///    PedIndex - Index of the ped that is responsible for the explosion. 
NATIVE PROC ADD_VEHICLE_PHONE_EXPLOSIVE_DEVICE(VEHICLE_INDEX VehicleIndex) = "0xdc7a3584f47a942c"

/// INFO: 
/// PARAM NOTES: Only available in network games
/// PURPOSE: Detonate a explosive device tied to the players mobile phone
/// PARAMS:
NATIVE PROC DETONATE_VEHICLE_PHONE_EXPLOSIVE_DEVICE() = "0x4e9b81412bfbab75"

/// INFO: 
/// PARAM NOTES: Only available in network games
/// PURPOSE: Clears a explosive device tied to the players mobile phone
/// PARAMS:
NATIVE PROC CLEAR_VEHICLE_PHONE_EXPLOSIVE_DEVICE() = "0x62a0df6cf911efd1"

/// INFO: 
/// PARAM NOTES: Only available in network games
/// PURPOSE: Check if a player has a currently triggered phone explosive
/// PARAMS: 
NATIVE FUNC BOOL HAS_VEHICLE_PHONE_EXPLOSIVE_DEVICE() = "0x9a31ea3ceae94e4a"

/// INFO: 
/// PARAM NOTES: 
/// PURPOSE: Check if the vehicles rear doors have been blown open by a stickybomb
/// PARAMS: 
NATIVE FUNC BOOL HAVE_VEHICLE_REAR_DOORS_BEEN_BLOWN_OPEN_BY_STICKYBOMB(VEHICLE_INDEX VehicleIndex) = "0x55102167e76f0bee"


//~>                        Dirt commands

//INFO: 
//PARAM NOTES:
//PURPOSE:  Gets the vehicles dirt level 0.0 (clean) to 15.9 (dirty). 
NATIVE FUNC FLOAT GET_VEHICLE_DIRT_LEVEL(VEHICLE_INDEX VehicleIndex) = "0xd3ff3a3c2d524a18"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Sets the vehicles dirt level 0.0 (clean) to 15.0 (dirty). 
NATIVE PROC SET_VEHICLE_DIRT_LEVEL(VEHICLE_INDEX VehicleIndex, FLOAT DirtLevel) = "0x2ec6505629d78cce"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Returns true if there are any bang or scuff decals on the vehicle
NATIVE FUNC BOOL GET_DOES_VEHICLE_HAVE_DAMAGE_DECALS(VEHICLE_INDEX VehicleIndex) = "0xd37b43eb5fb2e301"


//~>                    Engine commands

//INFO: 
//PARAM NOTES: bNoDelay only has an effect when EngineOnFlag is TRUE. If bNoDelay is TRUE then the engine will start immediately. 
//PURPOSE: Sets the vehicles engine. More info..
NATIVE PROC SET_VEHICLE_ENGINE_ON(VEHICLE_INDEX VehicleIndex, BOOL EngineOnFlag, BOOL bNoDelay, BOOL bOnlyStartWithPlayerInput = false) = "0x371d594409a68a18"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Find out whether the engine on this car is running
NATIVE FUNC BOOL GET_IS_VEHICLE_ENGINE_RUNNING(VEHICLE_INDEX VehicleIndex) = "0xa11c4a6609ca663a"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Sets the vehicle to be undriveable (but still enterable). More info..
NATIVE PROC SET_VEHICLE_UNDRIVEABLE(VEHICLE_INDEX VehicleIndex, BOOL UnDriveableFlag) = "0x7570fb331dfe5904"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the actual vehicle lights off, but keep coronas and emissibe alive (useful to save on precious GPU time.)
NATIVE PROC SET_ACTUAL_VEHICLE_LIGHTS_OFF( BOOL lightsOff) = "0x79506f3cc4a3e135"


//INFO: 
//PARAM 
//PURPOSE: Force a vehicle to behave as if it was driven by a player (meaning longer, bigger lights, use with care).
NATIVE PROC SET_VEHICLE_USE_PLAYER_LIGHT_SETTINGS(VEHICLE_INDEX VehicleIndex, BOOL state) = "0x447ee3dfaa41270f"

//INFO: 
//PARAM NOTES:VEHICLE_LIGHT_SETTING is in commands_vehicle.sch
//PURPOSE: Sets the vehicle lights status. More info..
NATIVE PROC SET_VEHICLE_LIGHTS(VEHICLE_INDEX VehicleIndex, VEHICLE_LIGHT_SETTING CarLightSetting) = "0xe5283b3a324d3fb0"


//INFO: 
//PARAM NOTES:SET_VEHICLE_HEADLIGHT_SHADOWS is in commands_vehicle.sch
//PURPOSE: Sets the vehicle headlight shadow flags. see ENUM VEHICLE_HEADLIGHT_SHADOW_FLAGS, for valid values
NATIVE PROC SET_VEHICLE_HEADLIGHT_SHADOWS(VEHICLE_INDEX VehicleIndex, VEHICLE_HEADLIGHT_SHADOW_FLAGS flags) = "0xfc402b6af164b125"


//~>                        Alarm commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the vehicle alarm status.
NATIVE PROC SET_VEHICLE_ALARM(VEHICLE_INDEX VehicleIndex, BOOL AlarmSet) = "0x909ff2867c7e0cae"

//INFO: 
//PARAM NOTES:
//PURPOSE: Starts the vehicle alarm
NATIVE PROC START_VEHICLE_ALARM(VEHICLE_INDEX VehicleIndex) = "0x32c1b93fd1667ddb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns whether the alarm is going off or not
NATIVE FUNC BOOL IS_VEHICLE_ALARM_ACTIVATED(VEHICLE_INDEX VehicleIndex) = "0xaa2961a9653c5853"

//~>                    Light commands

//INFO: 
//PARAM NOTES:
//PURPOSE:Sets the vehicles interior lights
NATIVE PROC SET_VEHICLE_INTERIORLIGHT(VEHICLE_INDEX VehicleIndex, BOOL interiorSetting) = "0xebdc1fad110777e3"

//INFO: 
//PARAM NOTES:
//PURPOSE:Forces the vehicles interior lights (regardless of time-of-day)
NATIVE PROC SET_VEHICLE_FORCE_INTERIORLIGHT(VEHICLE_INDEX VehicleIndex, BOOL forceInteriorLight) = "0xa29fa0e1023d5c9d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets how bright the vehicles headlights are.
NATIVE PROC SET_VEHICLE_LIGHT_MULTIPLIER(VEHICLE_INDEX VehicleIndex, FLOAT multiplier) = "0x26f7481668f849a8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks whether left vehicle headlight is damaged
NATIVE FUNC BOOL GET_IS_LEFT_VEHICLE_HEADLIGHT_DAMAGED(VEHICLE_INDEX VehicleIndex) = "0x957511ea92cf8139"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks whether right vehicle headlight is damaged
NATIVE FUNC BOOL GET_IS_RIGHT_VEHICLE_HEADLIGHT_DAMAGED(VEHICLE_INDEX VehicleIndex) = "0x2dfaf27126d5d66a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks whether both vehicle headlights are damaged
NATIVE FUNC BOOL GET_BOTH_VEHICLE_HEADLIGHTS_DAMAGED(VEHICLE_INDEX VehicleIndex) = "0x5761f497677d0402"

//INFO: 
//PARAM NOTES:
//PURPOSE: Counts the number vehicle headlights damaged
NATIVE FUNC INT GET_NUMBER_OF_DAMAGED_VEHICLE_HEADLIGHTS(VEHICLE_INDEX VehicleIndex) = "0x844c0858290e8275"



//~>                            Attribute Commands                                  <~

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if a vehicle provides cover
NATIVE PROC SET_VEHICLE_PROVIDES_COVER(VEHICLE_INDEX VehicleIndex, BOOL ProvidesCoverFlag) = "0xaa207a327a73d480"

//INFO: 
//PARAM NOTES:
//PURPOSE:Sets the vehicle so it only takes 25% of the normal damage when hit. 
NATIVE PROC SET_VEHICLE_STRONG(VEHICLE_INDEX VehicleIndex, BOOL StrongFlag) = "0xff74dec3f62d3654"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets so that axles dont break easily 
NATIVE PROC SET_VEHICLE_HAS_STRONG_AXLES(VEHICLE_INDEX VehicleIndex, BOOL bSet) = "0x05eab38f5ac8da1d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the vehicles forward speed in m/s
NATIVE PROC SET_VEHICLE_FORWARD_SPEED(VEHICLE_INDEX VehicleIndex, FLOAT CarSpeed) = "0xb2d5451cc5606248"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the vehicles forward speed in m/s - if the vehicle is in the air this will only set the xy speed
NATIVE PROC SET_VEHICLE_FORWARD_SPEED_XY(VEHICLE_INDEX VehicleIndex, FLOAT CarSpeed) = "0xde738043797837a5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if a vehicle can be targetted
NATIVE PROC SET_VEHICLE_CAN_BE_TARGETTED(VEHICLE_INDEX VehicleIndex, BOOL CanBeTargettedFlag) = "0xabbfd0819c89c140"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if a vehicle can be entered if its locked for the player (MP only)
NATIVE PROC SET_DONT_ALLOW_PLAYER_TO_ENTER_VEHICLE_IF_LOCKED_FOR_PLAYER(VEHICLE_INDEX VehicleIndex, BOOL DontAllowPlayerToEnter) = "0x28c1aa9789ab5554"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if freebies are spawned in vehicles.
NATIVE PROC SET_FREEBIES_IN_VEHICLE(VEHICLE_INDEX VehicleIndex, BOOL ContainsFreebiesFlag) = "0xee1c2510e0379120"

//INFO: 
//PARAM NOTES: Makes the player play the hotwire anim.
//PURPOSE: Sets the vehicle must be hotwired. More info..
NATIVE PROC SET_VEHICLE_NEEDS_TO_BE_HOTWIRED(VEHICLE_INDEX VehicleIndex, BOOL bNewVal) = "0x0bae77e76ebd33d2"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_VEHICLE_BLIP_THROTTLE_RANDOMLY(VEHICLE_INDEX VehicleIndex, BOOL bNewVal) = "0x9830d9c399b40156"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC BOOL GET_IS_VEHICLE_USING_PRETEND_OCCUPANTS(VEHICLE_INDEX VehicleIndex) = "0xb37d86b310a38b43"

//INFO: Is the vehicle stopping for a door.
//NOTES: will return true regardless of whether the door is opening or not
NATIVE FUNC BOOL GET_IS_VEHICLE_STOPPED_FOR_DOOR(VEHICLE_INDEX VehicleIndex) = "0x4fe30f9f6b4fa7e0"



// ~>                               Seat commands Commands                              <~

//INFO: 
//PARAM NOTES:
//PURPOSE: get the number of passengers in a vehicle.
NATIVE FUNC INT GET_VEHICLE_NUMBER_OF_PASSENGERS(VEHICLE_INDEX VehicleIndex, BOOL bIncludeDriversSeat = FALSE, BOOL bIncludeDeadPeds = TRUE) = "0x5eb186df27ffcf1a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the max number of pasengers a vehicle can have.
NATIVE FUNC INT GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(VEHICLE_INDEX VehicleIndex) = "0xadd893bd545be5fc"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the number of seats in this vehicle model's layout
NATIVE FUNC INT GET_VEHICLE_MODEL_NUMBER_OF_SEATS(MODEL_NAMES VehicleModelHashKey) = "0xd664875c4bdb14b0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns if the seat is only accessible by warping
NATIVE FUNC BOOL IS_SEAT_WARP_ONLY(VEHICLE_INDEX VehicleIndex, VEHICLE_SEAT seat) = "0xe632c45f7e4013b9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns if the seat has a turret (one the ped holds) associated with it
NATIVE FUNC BOOL IS_TURRET_SEAT(VEHICLE_INDEX VehicleIndex, VEHICLE_SEAT seat) = "0x38b74904557f43cc"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns if the vehicle allows rappeling from it.
NATIVE FUNC BOOL DOES_VEHICLE_ALLOW_RAPPEL(VEHICLE_INDEX VehicleIndex) = "0x18cee6d8a7493206"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns if the vehicle has rear seat activities available (currently just SWIFT2/LUXOR2).
NATIVE FUNC BOOL DOES_VEHICLE_HAVE_REAR_SEAT_ACTIVITIES(VEHICLE_INDEX VehicleIndex) = "0x1cbdd0f7fdea8fe3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set whether or not all vehicles consume petrol as they drive around
NATIVE PROC SET_CONSUME_PETROL(BOOL value) = "0xf941a60db2cca5bb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get whether or not all vehicles consume petrol as they drive around
NATIVE FUNC BOOL GET_CONSUME_PETROL() = "0x0808853f711bc981"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Gets the max and current petrol values for a given vehicle
NATIVE PROC GET_VEHICLE_PETROL_STATS(VEHICLE_INDEX VehicleIndex, FLOAT& maxPetrol, FLOAT& currPetrol) = "0x6b6914c292aaadc0"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Sets the petrol consumption rate for a vehicle
NATIVE PROC SET_PETROL_CONSUMPTION_RATE(VEHICLE_INDEX VehicleIndex, float newRate) = "0x9f9f53e9757720db"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the the vehicle is free.
NATIVE FUNC BOOL IS_VEHICLE_SEAT_FREE(VEHICLE_INDEX VehicleIndex, VEHICLE_SEAT seat = VS_DRIVER, BOOL ConsiderPedUsingSeat = FALSE ) = "0x7158135695fae89d"

//INFO: 
//PARAM NOTES: Cannont use VS_ANY_PASSENGER
//PURPOSE: Gets the ped in a vehicle seat. More info.. 
NATIVE FUNC PED_INDEX GET_PED_IN_VEHICLE_SEAT(VEHICLE_INDEX VehicleIndex, VEHICLE_SEAT seat = VS_DRIVER, BOOL ConsiderPedUsingSeat = FALSE) = "0xab793ea186ab8daa"

//INFO: 
//PARAM NOTES: Cannont use VS_ANY_PASSENGER
//PURPOSE: Gets the last ped to use the designated vehicle seat.
NATIVE FUNC PED_INDEX GET_LAST_PED_IN_VEHICLE_SEAT(VEHICLE_INDEX VehicleIndex, VEHICLE_SEAT seat = VS_DRIVER) = "0x48512ac2c4218836"



// ~>                               Aircraft Commands                               <~

//INFO: 
//PARAM NOTES:
//PURPOSE: Activates the heli speed cheat.
NATIVE PROC SET_HELI_SPEED_CHEAT(VEHICLE_INDEX HeliIndex, INT SpeedBoostValue) = "0x1ebd3021a7fb35a2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the helli blades to full speed
NATIVE PROC SET_HELI_BLADES_FULL_SPEED(VEHICLE_INDEX VehicleIndex) = "0xbaab64584d161c4d"

//INFO: 
//PARAM NOTES: Full speed is 1.0f 
//PURPOSE: Sets the helli blades to given speed
NATIVE PROC SET_HELI_BLADES_SPEED(VEHICLE_INDEX VehicleIndex, FLOAT SpeedRatio) = "0x4394f7f852a22b94"

//INFO: 
//PARAM NOTES: Full speed is 1.0f 
//PURPOSE: Sst the sub throttle to specific value for some number of seconds
NATIVE PROC FORCE_SUB_THROTTLE_FOR_TIME(VEHICLE_INDEX VehicleIndex, FLOAT Throttle, FLOAT Seconds) = "0x86c7e0a8ed5445d8"


//INFO: 
//PARAM NOTES:
//PURPOSE: Sets that rocket launcher freebie appers in the heli.
NATIVE PROC SET_ROCKET_LAUNCHER_FREEBIE_IN_HELI(BOOL bFlag) = "0x2a02a7339eb52073"

//INFO: 
//PARAM NOTES:
// PURPOSE: Checks that a specific part of a heli is broken
NATIVE FUNC BOOL IS_HELI_PART_BROKEN(VEHICLE_INDEX VehicleIndex, BOOL bCheckMainRotor, BOOL bCheckRearRotor, BOOL bCheckTailBoom) = "0x266d8e87c6f0c244"

//INFO: 
//PARAM NOTES:
// PURPOSE: Returns the health of the heli main rotor
NATIVE FUNC FLOAT GET_HELI_MAIN_ROTOR_HEALTH(VEHICLE_INDEX VehicleIndex) = "0xc3c4ab879e734270"

//INFO: 
//PARAM NOTES:
// PURPOSE: Returns the health of the heli tail rotor
NATIVE FUNC FLOAT GET_HELI_TAIL_ROTOR_HEALTH(VEHICLE_INDEX VehicleIndex) = "0x714854dc0f74197f"


//INFO: 
//PARAM NOTES:
// PURPOSE: set the health of the heli main rotor
NATIVE PROC SET_HELI_MAIN_ROTOR_HEALTH(VEHICLE_INDEX VehicleIndex, FLOAT rotorHealth) = "0xe95f6c594f509d09"

//INFO: 
//PARAM NOTES:
// PURPOSE: set the health of the heli tail rotor
NATIVE PROC SET_HELI_TAIL_ROTOR_HEALTH(VEHICLE_INDEX VehicleIndex, FLOAT rotorHealth) = "0xa20a708fc9d21460"

//INFO: 
//PARAM NOTES:
// PURPOSE: returns the health of the heli tail boom
NATIVE FUNC FLOAT GET_HELI_TAIL_BOOM_HEALTH(VEHICLE_INDEX VehicleIndex) = "0xc564f95537ff5300"

//INFO: 
//PARAM NOTES:
// PURPOSE: Set the heli tail boom can be broken off or not
NATIVE FUNC BOOL SET_HELI_TAIL_BOOM_CAN_BREAK_OFF(VEHICLE_INDEX VehicleIndex, BOOL bCanBreakOff) = "0x392ada18c88106d8"

//INFO:  Sets whether a wing should be broken off or not
//		 
//PARAM NOTES:
//PURPOSE: Breaks off the right or left wing
NATIVE PROC SET_VEHICLE_WING_BROKEN(VEHICLE_INDEX VehicleIndex, BOOL bRightWing, BOOL bDissapear) = "0x90da3d6f0b3b993a"

//INFO:  Sets whether a rudder should be broken off or not
//		 
//PARAM NOTES:
//PURPOSE: Breaks off the rudder
NATIVE PROC SET_VEHICLE_RUDDER_BROKEN(VEHICLE_INDEX VehicleIndex, BOOL bDissapear) = "0x4241f426fda9a558"

//INFO:  Sets whether a tail should be broken off or not
//		 
//PARAM NOTES:
//PURPOSE: Breaks off the tail
NATIVE PROC SET_VEHICLE_TAIL_BROKEN(VEHICLE_INDEX VehicleIndex, BOOL bDissapear) = "0xfe7e1f62c34516bd"

//INFO:  Sets whether a wing should be broken off or not
//PURPOSE: Detects if anything is attached to the heli ropes other than the heli, which would imply that a ped is rappelling
NATIVE FUNC BOOL IS_ANY_PED_RAPPELLING_FROM_HELI(VEHICLE_INDEX VehicleIndex) = "0xa9bb7a0a20b07b48"

// ~>                               Boat Commands                       <~

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the boat anchor.
NATIVE PROC SET_BOAT_ANCHOR(VEHICLE_INDEX VehicleIndex, BOOL AnchoredFlag) = "0xae2662f6a912f71e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Makes the boat not do any checks for land probes when in combat
NATIVE PROC SET_BOAT_IGNORE_LAND_PROBES(VEHICLE_INDEX VehicleIndex, BOOL IgnoreProbes) = "0x7f44d71e8e7ad640"

//INFO: 
//PARAM NOTES:
//PURPOSE: Makes the boat not do any checks for land probes when in combat
NATIVE PROC SET_VEHICLE_STEER_FOR_BUILDINGS(VEHICLE_INDEX VehicleIndex, BOOL bSteerForBuildings) = "0x8ede85651d0232a2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Makes ambient vehicles swerve for this vehicle when head on collisions
NATIVE PROC SET_VEHICLE_CAUSES_SWERVING(VEHICLE_INDEX VehicleIndex, BOOL bCausesSwerving) = "0x91830eecd92c6800"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets planes flag to ignore small pitch differences
NATIVE PROC SET_IGNORE_PLANES_SMALL_PITCH_CHANGE(VEHICLE_INDEX VehicleIndex, BOOL bIgnorePitching) = "0xca3b69c048341635"


//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if a boat can be anchored at its present position without possibly intersecting collision later.
NATIVE FUNC BOOL CAN_ANCHOR_BOAT_HERE(VEHICLE_INDEX VehicleIndex) = "0x59901c7e30dcb902"

//INFO: 
//PARAM NOTES:
//PURPOSE: This is the same as the above function but will ignore any players who are stood on the vehicle
NATIVE FUNC BOOL CAN_ANCHOR_BOAT_HERE_IGNORE_PLAYERS(VEHICLE_INDEX VehicleIndex) = "0x97a5f80399e1beb1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set this to true on boats which should remain anchored even when a player is driving it.
NATIVE PROC SET_BOAT_REMAINS_ANCHORED_WHILE_PLAYER_IS_DRIVER(VEHICLE_INDEX VehicleIndex, BOOL ForcePlayerBoatAnchorFlag) = "0x577f790cb611bd49"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set this to true on boats which should remain in the non-physical, low LOD anchor mode even when a player is driving it.
NATIVE PROC SET_FORCE_LOW_LOD_ANCHOR_MODE(VEHICLE_INDEX VehicleIndex, BOOL ForcePlayerLowLodAnchorFlag) = "0x860e5b23064dfcbb"

//INFO: 
//PARAM NOTES:	Set LodDistance to -1.0 to reset the LOD distance to the default value.
//PURPOSE:		Sets the distance from the player at which anchored boats switch between high / low LOD buoyancy mode.
NATIVE PROC SET_BOAT_LOW_LOD_ANCHOR_DISTANCE(VEHICLE_INDEX VehicleIndex, FLOAT LodDistance) = "0x9f5508fed14c9e13"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if a boat is currently anchored.
NATIVE FUNC BOOL IS_BOAT_ANCHORED(VEHICLE_INDEX VehicleIndex) = "0xc8bbe1bc9cd6658c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Determines whether a boat should be set to sink when wrecked or not. If this is never set, a boat has
//         has a 50% chance of sinking or floating when wrecked.
NATIVE PROC SET_BOAT_SINKS_WHEN_WRECKED(VEHICLE_INDEX VehicleIndex, BOOL ShouldSink) = "0x033cf61c91c35914"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a boat as wrecked
NATIVE PROC SET_BOAT_WRECKED(VEHICLE_INDEX VehicleIndex) = "0xef08e9e3afd3fb8e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prevent fleeing vehicles from using switched off nodes globally
NATIVE PROC SET_FLEEING_VEHICLES_USE_SWITCHED_OFF_NODES(bool bCanUseSwitchedOffNodes) = "0xb0998f6290b6ce9c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Forces a submarine to sit higher out of the water like it does automatically when there is no driver.
NATIVE PROC FORCE_SUBMARINE_SURFACE_MODE(VEHICLE_INDEX VehicleIndex, BOOL ForceSurface) = "0xa216bc5d0f68ced4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Force a submarine to maintain neutral buoyancy (prevent sub from rising with no driver).
NATIVE PROC FORCE_SUBMARINE_NEUTRAL_BUOYANCY(VEHICLE_INDEX VehicleIndex, INT iTimeMS) = "0x3a6032fb27feb48c"

//INFO: Needs to be called every frame or it will be reset to the current global defaults.
//PARAM NOTES: All depths should be negative values.
//		EnableCrushDamage  - Whether or not to allow any crush damage effects.
//		VisibleDamageDepth - below this depth the sub starts to look like it's being crushed but doesn't harm the player.
//		AirLeakDepth       - time spent below this depth will lead to air bubbles coming from the sub and the player starting to drown.
//		CrushDepth         - at this depth the sub will be wrecked and the occupants killed instantly.
//PURPOSE: 
NATIVE PROC SET_SUBMARINE_CRUSH_DEPTHS(VEHICLE_INDEX VehicleIndex, BOOL EnableCrushDamage, FLOAT VisibleDamageDepth, FLOAT AirLeakDepth, FLOAT CrushDepth) = "0x7cd91126b58f25ed"

//INFO: Get whether the submarine is under its crush depth
//PARAM NOTES: 
//PURPOSE: 
NATIVE FUNC BOOL GET_SUBMARINE_IS_UNDER_CRUSH_DEPTH(VEHICLE_INDEX VehicleIndex) = "0xbda170f210c62871"

//INFO: Get whether the submarine is under its design depth
//PARAM NOTES: 
//PURPOSE: 
NATIVE FUNC BOOL GET_SUBMARINE_IS_UNDER_DESIGN_DEPTH(VEHICLE_INDEX VehicleIndex) = "0xc1b954f29c44e286"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if a Submarine has any air leaks, when there is more than 4 the player will drown.
NATIVE FUNC INT GET_SUBMARINE_NUMBER_OF_AIR_LEAKS(VEHICLE_INDEX VehicleIndex) = "0x532b2915c613363f"


//~>                                Taxi commands 

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the light on the taxi.
NATIVE PROC SET_TAXI_LIGHTS(VEHICLE_INDEX VehicleIndex, BOOL TaxiLightsFlag) = "0x8861c13bcb159f69"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the taxi light is on
NATIVE FUNC BOOL IS_TAXI_LIGHT_ON(VEHICLE_INDEX VehicleIndex) = "0x9d4f3b95ed8fcb0c"

//~>                            Siren/horn commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the vehicle siren
NATIVE PROC SET_VEHICLE_SIREN(VEHICLE_INDEX VehicleIndex, BOOL SirenFlag) = "0xbf0ddddacd98c554"

//INFO: 
//PARAM NOTES:
//PURPOSE: gets the vehicles siren health
NATIVE FUNC INT GET_VEHICLE_SIREN_HEALTH(VEHICLE_INDEX VehicleIndex) = "0x1043281456646348"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the vehicle siren is on
NATIVE FUNC BOOL IS_VEHICLE_SIREN_ON (VEHICLE_INDEX VehicleIndex) = "0xe3f9ed416083bae0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the vehicle siren audio is on
NATIVE FUNC BOOL IS_VEHICLE_SIREN_AUDIO_ON (VEHICLE_INDEX VehicleIndex) = "0xfd37e16f7768e05a"

//INFO
//PARAM NOTES:
//PURPOSE: Sets whether or not a vehicle has muted sirens (still flashin)
NATIVE PROC SET_VEHICLE_HAS_MUTED_SIRENS(VEHICLE_INDEX VehicleIndex, BOOL SirensAreMuted) = "0xaf026bfb427d2c6f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sounds a vehicle horn for the given time and type.
//the type is the hash name, at the moment we only allow "NORMAL" and "HELDDOWN"
NATIVE PROC START_VEHICLE_HORN(VEHICLE_INDEX VehicleIndex, INT TimeToSoundHorn, INT HornTypeHash = 0, BOOL isMusicalHorn = FALSE) = "0x8024c4a99a470a8e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set if a is in the car mod shop
NATIVE PROC SET_VEHICLE_IN_CAR_MOD_SHOP(VEHICLE_INDEX VehicleIndex, BOOL InCarModShop) = "0xe78d2b33c23f2020"

//INFO: 
//PARAM NOTES:
//PURPOSE: toggles on off height map avoidance for planes and helicopters
NATIVE PROC SET_VEHICLE_DISABLE_HEIGHT_MAP_AVOIDANCE(VEHICLE_INDEX VehicleIndex, BOOL bDisableHeightmapAvoidance ) = "0xdfbc290c98373d69"

//INFO: 
//PARAM NOTES:
//PURPOSE: toggles on off boat avoidance
NATIVE PROC SET_BOAT_DISABLE_AVOIDANCE(VEHICLE_INDEX VehicleIndex, BOOL bDisableBoatAvoidance ) = "0x21fe8b68c655751b"

//INFO: 
//PARAM NOTES:
//PURPOSE: query if the landing for the heli is blocked
NATIVE FUNC BOOL IS_HELI_LANDING_AREA_BLOCKED(VEHICLE_INDEX VehicleIndex ) = "0x03af66bae091dee2"
 
//INFO: 
//PARAM NOTES:
//PURPOSE: hack - fix landing task not working
NATIVE PROC SET_SHORT_SLOWDOWN_FOR_LANDING(VEHICLE_INDEX VehicleIndex ) = "0x2e1294a4fa6aeb0f"

//INFO: 
//PARAM NOTES: scale the turbulence by value.  1.0 is default tuning
//PURPOSE: allows you to increase or decrease turbulence from script
NATIVE PROC SET_HELI_TURBULENCE_SCALAR(VEHICLE_INDEX VehicleIndex, FLOAT scalar) = "0x0eb48250b8f38fcf"

//~>                    Convoy commands 

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the vehicle as a convoy vehicle.
NATIVE PROC SET_VEHICLE_AS_CONVOY_VEHICLE(VEHICLE_INDEX VehicleIndex, BOOL ConvoyFlag) = "0x9f8d3bca1e36ecbf"

// ~>                               Car Generator Commands                              <~

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the vehicle generator exists, false otherwise.
NATIVE FUNC BOOL DOES_SCRIPT_VEHICLE_GENERATOR_EXIST(VEHICLE_GENERATOR_INDEX CarGeneratorIndex) = "0xd23a6eb80c5ca596"

//INFO: 
//PARAM NOTES:
//PURPOSE: Creates a vehicle generator 
NATIVE FUNC VEHICLE_GENERATOR_INDEX CREATE_SCRIPT_VEHICLE_GENERATOR(VECTOR VecNewCoors, FLOAT fHeadingInDegrees, FLOAT fMaxLength, FLOAT MaxWidth, MODEL_NAMES ModelHashKey, INT Remap1, INT Remap2, INT Remap3, INT Remap4, BOOL HighPriorityFlag, INT ChanceOfCarAlarm, INT ChanceOfLocked, BOOL PreventEntryIfNotQualified = FALSE, BOOL CanBeStolen = TRUE, INT livery = -1) = "0x375bb75b2409befc"

//INFO: 
//PARAM NOTES:
//PURPOSE: Deletes a scripted vehicle generator
NATIVE PROC DELETE_SCRIPT_VEHICLE_GENERATOR(VEHICLE_GENERATOR_INDEX CarGeneratorIndex) = "0xfe29ec7e7bcc0e15"

//INFO: To switch the given car generator off, pass in 0 as the NumberToGenerate. To switch the car generator on, pass in a number greater than 100. 
//          If a number less than or equal to 100 is passed in then the generator will generate that number of cars and then switch itself off. 
//PARAM NOTES:
//PURPOSE: Sets a script vehicle generator to generate a number of vehicles. More info..
NATIVE PROC SET_SCRIPT_VEHICLE_GENERATOR(VEHICLE_GENERATOR_INDEX CarGeneratorIndex, INT NumberOfCarsToGenerate) = "0xe8eeb9e60d338c50"

//INFO: Max allowed areas is 48. Let code know if that needs increasing
//PARAM NOTES:
//PURPOSE: Sets all generators map and script active in the area.
NATIVE PROC SET_ALL_VEHICLE_GENERATORS_ACTIVE_IN_AREA(VECTOR VecMinCoors, VECTOR VecMaxCoors, BOOL bActive, BOOL bSyncOverNetwork = TRUE) = "0x84a65e2e9cfb6a77"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets all generators map and script active.
NATIVE PROC SET_ALL_VEHICLE_GENERATORS_ACTIVE() = "0x7b8dc5701d211549"

//INFO: Emergency vehicle map gens and high priorty gens will remain active
//PARAM NOTES:
//PURPOSE: Sets low priority generators active. More info..
NATIVE PROC SET_ALL_LOW_PRIORITY_VEHICLE_GENERATORS_ACTIVE    (BOOL bActive) = "0x8c3444d417673c8a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Any vehicles spawned by car gen this frame will be locked
NATIVE PROC SET_VEH_GEN_SPAWN_LOCKED_THIS_FRAME() = "0x03b9f94cb412deb3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the percentage of vehicles that will be spawned locked
NATIVE PROC SET_VEH_GEN_LOCKED_PERCENTAGE(int lockedPercentage) = "0x4619793e335d1135"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC NETWORK_SET_ALL_LOW_PRIORITY_VEHICLE_GENERATORS_WITH_HELI_ACTIVE          (BOOL bActive) = "0x8634ecf8afeb90f6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Removes vehicles for all gens in the area.
NATIVE PROC REMOVE_VEHICLES_FROM_GENERATORS_IN_AREA(VECTOR VecMinCoors, VECTOR VecMaxCoors, BOOL isNetworked=false) = "0x06b8fba220c6488c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Specifies an area of interest where cargens will focus on spawning vehicles
NATIVE PROC SET_VEHICLE_GENERATOR_AREA_OF_INTEREST(VECTOR position, float radius) = "0x289aed7c360b6f6c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Removes the cargen area of interest and resumes normal cargen spawning
NATIVE PROC CLEAR_VEHICLE_GENERATOR_AREA_OF_INTEREST() = "0x2da7b08cec309602"

//~>                                 Garage Commands                                        <~

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the vehicle is an a garage. 
NATIVE FUNC BOOL IS_VEHICLE_IN_GARAGE_AREA(STRING pGarageName, VEHICLE_INDEX VehicleIndex) = "0xbef939cd3af0b8f0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the vehicle can be resparyed
NATIVE PROC SET_CAN_RESPRAY_VEHICLE(VEHICLE_INDEX VehicleIndex, BOOL CanChangeColourFlag) = "0x65abd7fbffdbb638"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enable special enter / exit vehicle functionality. Only when holding enter input,
// the Boss will enter rear seat, while the Goon will not be able to leave or enter it
NATIVE PROC SET_GOON_BOSS_VEHICLE(VEHICLE_INDEX VehicleIndex, BOOL EnableSpecialEnterFunc) = "0x04f8a1fbe3e7bf6b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prevents or allows the rear doors of the vehicle from opening from a sticky bomb explosion
NATIVE PROC SET_OPEN_REAR_DOORS_ON_EXPLOSION(VEHICLE_INDEX VehicleIndex, BOOL OpenRearDoorsOnExplosion) = "0x1f68e53a00b640e2"

//INFO:  Check with the artist for the garage name 
//PARAM NOTES: GARAGE_TYPE is in commands_vehicle.sch
//PURPOSE: Sets the garage type. More info..
NATIVE PROC SET_GARAGE_TYPE(STRING pGarageName, GARAGE_TYPE NewGarageType) = "0xb0d68498f687a960"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the garage does not grab the game camera.
NATIVE PROC SET_GARAGE_LEAVE_CAMERA_ALONE(STRING pGarageName, BOOL NewFlag) = "0x6786dfd085f5db0d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Opens a garage
NATIVE PROC OPEN_GARAGE(STRING pGarageName) = "0x3e6826cc6f518225"

//INFO: 
//PARAM NOTES:
//PURPOSE: Close a grage door
NATIVE PROC CLOSE_GARAGE(STRING pGarageName) = "0x92686ea75bc16ee4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the garage is open 
NATIVE FUNC BOOL IS_GARAGE_OPEN(STRING pGarageName) = "0xd28e53d9795c7e9b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Cheks if the garage is closed
NATIVE FUNC BOOL IS_GARAGE_CLOSED(STRING pGarageName) = "0x005cd51f07fbe04c"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_FREE_RESPRAYS(BOOL FreeRespraysFlag) = "0x4df623dceca9bfc6"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_RESPRAYS(BOOL NoRespraysFlag) = "0x852392e6504088d8"

//INFO: 
//PARAM NOTES:
//PURPOSE: All garages are openend and if a garage had a players control blocked that player will be released.
NATIVE PROC STOP_ALL_GARAGE_ACTIVITY() = "0x973a0b294c1dbd4f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that a vehicle has be resprayed
NATIVE FUNC BOOL HAS_VEHICLE_BEEN_RESPRAYED(VEHICLE_INDEX VehicleIndex) = "0x408b36fa2f9168db"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if any of tha pay-n-spray garages in the game a re currently opening/closing or repairing the player car. 
NATIVE FUNC BOOL IS_PAY_N_SPRAY_ACTIVE( ) = "0x342c2aab6df25120"

//INFO: 
//PARAM NOTES:
//PURPOSE:Checksif the playerâ€™s car has just been resprayed in any garage. 
NATIVE FUNC BOOL HAS_RESPRAY_HAPPENED( ) = "0xcc7d76244c734830"


//~>                                 Get Random Car Commands                        <~

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets a random of vehicle in a 2d area
NATIVE FUNC VEHICLE_INDEX GET_RANDOM_VEHICLE_OF_TYPE_IN_AREA(FLOAT MinX, FLOAT MinY, FLOAT MaxX, FLOAT MaxY, MODEL_NAMES VehicleModelHashKey) = "0x5b533b41117fefce"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if a cop vehicle is in a 3d area
NATIVE FUNC BOOL IS_COP_VEHICLE_IN_AREA_3D(VECTOR VecFirstCoors, VECTOR VecSecondCoors) = "0x0c9b32757ae0b2bf"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Gets a random vehicle a sphere area
NATIVE FUNC VEHICLE_INDEX GET_RANDOM_VEHICLE_IN_SPHERE(VECTOR VecCentreCoors, FLOAT Radius, MODEL_NAMES VehicleModelHashKey, INT SearchFlags) = "0x8aa54390e994ce1b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets a random vehicle in from the front bumber of a vehicle
NATIVE FUNC VEHICLE_INDEX GET_RANDOM_VEHICLE_FRONT_BUMPER_IN_SPHERE(VECTOR VecCentreCoors, FLOAT Radius, MODEL_NAMES VehicleModelHashKey,INT SearchFlags, VEHICLE_INDEX VehicleToBeIgnored = NULL) = "0x106c0716304470c2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets a random vehicle in from the back bumber of a vehicle
NATIVE FUNC VEHICLE_INDEX GET_RANDOM_VEHICLE_BACK_BUMPER_IN_SPHERE(VECTOR VecCentreCoors, FLOAT Radius, MODEL_NAMES VehicleModelHashKey, INT SearchFlags, VEHICLE_INDEX VehicleToBeIgnored = NULL) = "0xc3048e3e178b269b"

//INFO: 
//PARAM NOTES: 
//	VehicleModelHashKey - Specifiy a certain type of vehicle to search for, or DUMMY_MODEL_FOR_SCRIPT to ignore the type check
//	SearchFlags - See the VEHICLE_SEARCH_XXXX commands at the top of commands_vehicle.sch
//PURPOSE:Get the closet random vehicle to a coord 
NATIVE FUNC VEHICLE_INDEX GET_CLOSEST_VEHICLE(VECTOR Centre, FLOAT Radius, MODEL_NAMES VehicleModelHashKey, INT SearchFlags) = "0xfe15feb341652241"


//~>                                  Vehicle Control Commands                          <~

//INFO: If the players' vehicle is told to do something (ie SHAPESHIP_GOTO_COORDS) control isn't automatically handed back to the player when the task is done. 
//          SET_VEHICLE_CONTROL_TO_PLAYER can be used to force control back into the hands of the player. 
//PARAM NOTES:
//PURPOSE: Gives control of the vehicle back to the player. More info..
NATIVE PROC SET_VEHICLE_CONTROL_TO_PLAYER(VEHICLE_INDEX VehicleIndex) = "0xe0a0c63800fbe7c8"

//INFO: Passing FALSE to this command will make the player not consider this vehicle when pressing triangle to enter a vehicle. The player will instead pick the next closest vehicle to steal/enter.
//PARAM NOTES: ConsideredByPlayerFlag default = true
//PURPOSE: Sets if the player can enter a vehicle pressing triangle. More info..
NATIVE PROC SET_VEHICLE_IS_CONSIDERED_BY_PLAYER(VEHICLE_INDEX VehicleIndex, BOOL ConsideredByPlayerFlag) = "0xf838539c61c30896"

//INFO: Passing TRUE to this command will make Other vehicles always stop behind the vehicle rather than swerving around.
//PURPOSE: This is used for cases where a car is parked in the middle of the road and you want traffic to queue rather than try
//			and swerve around.
// NOTE: This is a reset flag and needs to be called each frame
NATIVE PROC SET_VEHICLE_WILL_FORCE_OTHER_VEHICLES_TO_STOP(VEHICLE_INDEX VehicleIndex, BOOL ForceOtherVehiclesToStop) = "0x7928629159f456d1"

//INFO: This is a reset flag, it must be called each frame
//PARAM NOTES:
//PURPOSE: Makes this vehicle act as if it's a sirened vehicle, like a police car or ambulance
NATIVE PROC SET_VEHICLE_ACT_AS_IF_HAS_SIREN_ON(VEHICLE_INDEX VehicleIndex, BOOL ActAsIfSirenOn) = "0xa0525d286052cdd0"

//INFO: Passing TRUE to this command will do some extra trajectory checks with this vehicle to prevent other vehicles
//		from spawning in its way
//PURPOSE: This is used for cases where a car might be driving on the wrong side of the road or avoiding cars
//		at a distance away from the player where other cars might be trying to spawn. It's somewhat expensive
//		so we don't do it for everybody
// NOTE: This is a reset flag and needs to be called each frame
NATIVE PROC SET_VEHICLE_USE_MORE_RESTRICTIVE_SPAWN_CHECKS(VEHICLE_INDEX VehicleIndex, BOOL UseRestrictiveCheck) = "0x22aae0eeac98904b"

//INFO: Normally peds tasked with GOTO_POINT_ANY_MEANS will only be able to commandeer vehicles from the ambient population.
//      Settting TRUE via this command will allow peds to use specified mission vehicles also.
NATIVE PROC SET_VEHICLE_MAY_BE_USED_BY_GOTO_POINT_ANY_MEANS(VEHICLE_INDEX VehicleIndex, BOOL bState) = "0x60e9b6f76bd38b78"

//INFO: This is a reset flag, it must be called each frame
//PARAM NOTES:
//PURPOSE: Makes this vehicle cause ambient vehicles that get in its way to hurry away.
//Does not affect mission vehicles
NATIVE PROC SET_VEHICLE_WILL_TELL_OTHERS_TO_HURRY(VEHICLE_INDEX vehicleIndex, BOOL TellOthersToHurry) = "0x11db11e02c3d15b8"

//INFO: The steer bias value gets added to the players control input for that car. 
//          The bias is in the range -1.0f (hard right) to 1.0f (hard left). Ie If you set the bias to 0.1 the car will pull to the left a little bit. 
//          By modifying the value from frame to frame you can emulate buggered controls or somebody fighting over control of the wheel. 
//PARAM NOTES:
//PURPOSE: Sets a vehicle control bias -1.0f (hard right) to 1.0f (hard left). More info..
NATIVE PROC SET_VEHICLE_STEER_BIAS(VEHICLE_INDEX VehicleIndex, FLOAT Bias) = "0x77451b49db5a200a"

//INFO: The pitch bias value gets added to the players control input for that plane. 
//          The bias is in the range -1.0f to 1.0f.
//          By modifying the value from frame to frame you can emulate buggered controls or somebody fighting over control of the stick. 
//PARAM NOTES:
//PURPOSE: Sets a vehicle control bias -1.0f (hard right) to 1.0f (hard left). More info..
NATIVE PROC SET_VEHICLE_PITCH_BIAS(VEHICLE_INDEX VehicleIndex, FLOAT Bias) = "0xc66b05488813fdb0"

//INFO: The roll bias value gets added to the players control input for that plane. 
//          The bias is in the range -1.0f to 1.0f. 
//          By modifying the value from frame to frame you can emulate buggered controls or somebody fighting over control of the stick. 
//PARAM NOTES:
//PURPOSE: Sets a vehicle control bias -1.0f (hard right) to 1.0f (hard left). More info..
NATIVE PROC SET_VEHICLE_ROLL_BIAS(VEHICLE_INDEX VehicleIndex, FLOAT Bias) = "0x0849fb557e3ce3bb"

//INFO: Disable or re-enable the planes ailerons(large flaps on wings) Can be used to prevent movement and to effect the handling of a plane
//
//
//PARAM NOTES: plane vehicle index, whether you want to effect the left or right hand aileron(facing from back of plane), enable or disable aileron control
//PURPOSE: Disable movement of aileron and effect handling.
NATIVE PROC DISABLE_PLANE_AILERON(VEHICLE_INDEX VehicleIndex, BOOL bLeftSide, BOOL bDisable) = "0x6c98742dfe00c9ad"


//~>                                  Car Recording Commands                            <~

//INFO: 
//PARAM NOTES:
//PURPOSE: Get recording id from number and name
//RETURNS: vehicle recording id
NATIVE FUNC RECORDING_ID GET_VEHICLE_RECORDING_ID(INT FileNumber, STRING pRecordingName) = "0x395075b91017d334"

#IF IS_DEBUG_BUILD

//PURPOSE: Get name of vehicle recording (name + number) given a recording id
//RETURNS: vehicle recording name
NATIVE FUNC STRING GET_VEHICLE_RECORDING_NAME(RECORDING_ID id) = "0xf340551847ff5988"

#ENDIF

#IF IS_DEBUG_BUILD

//INFO: 
//PARAM NOTES:
//PURPOSE: Starts recording a vehicle
//RETURNS: False if the record fails
NATIVE FUNC BOOL START_RECORDING_VEHICLE(VEHICLE_INDEX VehicleIndex, INT FileNumber, STRING pRecordingName, BOOL AllowOverwrite = FALSE) = "0xe6ffbfe41d721f6b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Starts recording a vehicle but assumes the vehicle was playing a recording to begin with. The recording being played back up until that point will be copied into the new recording without loss of quality
//RETURNS: False if the record fails
NATIVE FUNC BOOL START_RECORDING_VEHICLE_TRANSITION_FROM_PLAYBACK(VEHICLE_INDEX VehicleIndex, INT FileNumber, STRING pRecordingName, BOOL AllowOverwrite = FALSE) = "0x29c629a71e2d754c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Stops recording all vehicles
NATIVE PROC STOP_RECORDING_ALL_VEHICLES() = "0xf9ea4c6112f6b65f"

#ENDIF	//	IS_DEBUG_BUILD

//INFO: 
//PARAM NOTES:
//PURPOSE: Starts the playback for a recorded vehicle
//NOTES: This will start the engine automatically, to control this use START_PLAYBACK_RECORDED_VEHICLE_WITH_FLAGS
NATIVE PROC START_PLAYBACK_RECORDED_VEHICLE(VEHICLE_INDEX VehicleIndex, INT FileNumber, STRING pRecordingName, BOOL DoPlaceOnRoadAdjustment=true) = "0x2f4db11a0db3685a"

ENUM VEHICLE_RECORDING_PLAYBACK_FLAGS
	SWITCH_ON_PLAYER_VEHICLE_IMPACT = 1,
	SWITCH_ON_ANY_VEHICLE_IMPACT = 2,
	TURN_ON_ENGINE_INSTANTLY = 4, // Starts the engine instantly at the start of the car recording.
	TURN_ON_ENGINE_INCLUDING_START = 8, // Starts the engine including the engine start audio.
	CONTINUE_RECORDING_IF_CAR_DESTROYED = 16 //Keeps the recording playing if the car dies
ENDENUM

//INFO: 
//PARAM NOTES: Flags can be from the enum VEHICLE_RECORDING_PLAYBACK_FLAGS, then can be combined together using "|"
// delayInMillisecondsToRevertIfSwitchedToAI is used to specify how long the vehicle will wait before reverting back to a normal recording.
//											IF 0 is specified (the default) the car will never revert back
//PURPOSE: Starts the playback for a recorded vehicle
NATIVE PROC START_PLAYBACK_RECORDED_VEHICLE_WITH_FLAGS(VEHICLE_INDEX VehicleIndex, INT FileNumber, STRING pRecordingName, INT iFlags = TURN_ON_ENGINE_INSTANTLY, INT delayInMillisecondsToRevertIfSwitchedToAI = 0, DRIVINGMODE Mode = DRIVINGMODE_STOPFORCARS) = "0x0d1d3bf940d4c760"

//INFO: 
//PARAM NOTES:
//PURPOSE: Forces through a playback update of a vehicle recording, allowing this to be performed on the same game update that the request is made to start playback. This makes it easier to synchronise vehicle recordings with entity warping and scripted camera cuts.
NATIVE PROC FORCE_PLAYBACK_RECORDED_VEHICLE_UPDATE(VEHICLE_INDEX VehicleIndex, BOOL DoPlaceOnRoadAdjustment=true) = "0x92ee3ed9242dcb76"

//INFO: 
//PARAM NOTES:
//PURPOSE: Stops the playback for a recorded vehicle
NATIVE PROC STOP_PLAYBACK_RECORDED_VEHICLE(VEHICLE_INDEX VehicleIndex) = "0x90f8f7d270431fae"

//INFO: 
//PARAM NOTES:
//PURPOSE: Pauses the playback for a recorded vehicle
NATIVE PROC PAUSE_PLAYBACK_RECORDED_VEHICLE(VEHICLE_INDEX VehicleIndex) = "0x9b24ca8f49e61f9e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Unpauses the playback for a recorded vehicle
NATIVE PROC UNPAUSE_PLAYBACK_RECORDED_VEHICLE(VEHICLE_INDEX VehicleIndex) = "0x4f918d011b31cb9b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the playback is going on for a vehicle.
NATIVE FUNC BOOL IS_PLAYBACK_GOING_ON_FOR_VEHICLE(VEHICLE_INDEX VehicleIndex) = "0xe896049ad1887ff0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the playback is going on for a vehicle and if so if that playback is currently using ai. Can be used to test whether vehicle has already snapped back to full recording.
NATIVE FUNC BOOL IS_PLAYBACK_USING_AI_GOING_ON_FOR_VEHICLE(VEHICLE_INDEX VehicleIndex) = "0x8f33d7496432068d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the current playback recording id for a vehicle
NATIVE FUNC RECORDING_ID GET_CURRENT_PLAYBACK_FOR_VEHICLE(VEHICLE_INDEX VehicleIndex) = "0xfd0eae8e8428f6a3"

#IF IS_DEBUG_BUILD
//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if a recording is going for a vehicle
NATIVE FUNC BOOL IS_RECORDING_GOING_ON_FOR_VEHICLE(VEHICLE_INDEX VehicleIndex) = "0xf2efd7d71b8d5853"
#ENDIF	//	IS_DEBUG_BUILD

//INFO: 
//PARAM NOTES:
//PURPOSE: Skips to the end and stops a playback
NATIVE PROC SKIP_TO_END_AND_STOP_PLAYBACK_RECORDED_VEHICLE(VEHICLE_INDEX VehicleIndex) = "0x5b8ecad4a9e4355d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the playback speed
NATIVE PROC SET_PLAYBACK_SPEED(VEHICLE_INDEX VehicleIndex, FLOAT PlaybackSpeed) = "0xffe9ff137bafdfd8"

//INFO: The veghicle wil try and 
//PARAM NOTES:
//PURPOSE: Starts the playback using the vehicle AI
NATIVE PROC START_PLAYBACK_RECORDED_VEHICLE_USING_AI(VEHICLE_INDEX VehicleIndex, INT FileNumber, STRING pRecordingName, FLOAT CruiseSpeed = 10.0, DRIVINGMODE Mode = DRIVINGMODE_STOPFORCARS) = "0x1b70646075a0f088"

//INFO: 
//PARAM NOTES:
//PURPOSE: Skips a certain amount in a car recording
NATIVE PROC SKIP_TIME_IN_PLAYBACK_RECORDED_VEHICLE(VEHICLE_INDEX VehicleIndex, FLOAT TimeSkip) = "0x4030f85138a50df6"

//INFO: 
//PARAM NOTES: Rotation: The amount of addition rotation to apply, expressed as Euler angles in degrees.
// RotOrder: Defines the rotation order to use when composing a rotation matrix from Euler angles, defaults to YXZ order, which will be appropriate for almost all uses.
//PURPOSE: Applies an additional rotation to a plane upon which a vehicle recording is currently playing back.
NATIVE PROC SET_ADDITIONAL_ROTATION_FOR_RECORDED_VEHICLE_PLAYBACK(VEHICLE_INDEX VehicleIndex, VECTOR Rotation, EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0x99a7dd7fc16db91b"

//INFO:
//PARAM NOTES:
// Offset - A local offset added to the position of the vehicle during the recording
//PURPOSE: Add a position offset to a vehicle during a recording
NATIVE PROC SET_POSITION_OFFSET_FOR_RECORDED_VEHICLE_PLAYBACK(VEHICLE_INDEX VehicleIndex, VECTOR Offset) = "0xe98f26077277cec7"

//INFO:
//PARAM NOTES:
// Offset - A global offset added to the position of the vehicle during the recording
//PURPOSE: Add a position offset to a vehicle during a recording
NATIVE PROC SET_GLOBAL_POSITION_OFFSET_FOR_RECORDED_VEHICLE_PLAYBACK(VEHICLE_INDEX VehicleIndex, VECTOR Offset) = "0xeee959888040c97b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the distance of tha car in the  recording
NATIVE FUNC FLOAT GET_POSITION_IN_RECORDING(VEHICLE_INDEX VehicleIndex) = "0x21f08de9d609bdc9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the time position of the recording
NATIVE FUNC FLOAT GET_TIME_POSITION_IN_RECORDING(VEHICLE_INDEX VehicleIndex) = "0xfe9c4864a7c4cedb"

#IF IS_DEBUG_BUILD

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the time position of the recorded recording
NATIVE FUNC FLOAT GET_TIME_POSITION_IN_RECORDED_RECORDING(VEHICLE_INDEX VehicleIndex) = "0x3f69b0d80e2fb186"

//INFO: 
//PARAM NOTES:
//PURPOSE: Stops recording a vehicle
NATIVE PROC STOP_RECORDING_VEHICLE(VEHICLE_INDEX VehicleIndex) = "0x225617d3b93a2f4c"

#ENDIF	//	IS_DEBUG_BUILD

//INFO: 
//PARAM NOTES:
//PURPOSE: Request a vehicle recording file.
NATIVE PROC REQUEST_VEHICLE_RECORDING(INT FileNumber, STRING pRecordingName) = "0xb018baa4ed9aa217"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the vehicle recording has loaded
NATIVE FUNC BOOL HAS_VEHICLE_RECORDING_BEEN_LOADED(INT FileNumber, STRING pRecordingName) = "0xf777caa43f4b281a"

//INFO:  t can be used to get rid of car recordings that were streamed in but ended up not being used because of skipping a cutscene or the actions of the player. 
//PARAM NOTES:
//PURPOSE: Removes a recording from memory thats not being used. More info..
NATIVE PROC REMOVE_VEHICLE_RECORDING(INT FileNumber, STRING pRecordingName) = "0xa72858c94e70296c"

#IF IS_DEBUG_BUILD
//INFO: Checks if the vehicle recording file exists. Would always return TRUE if called by a release exe
//PARAM NOTES:
//PURPOSE: Useful for debugging commands that need to know whether a recording exists
NATIVE FUNC BOOL DOES_VEHICLE_RECORDING_FILE_EXIST(INT FileNumber, STRING pRecordingName) = "0xc3bead5b5b693b13"

//INFO: Checks if the vehicle recording file exists in the cdimage (rpf files). Would always return TRUE 
//			if called by a release exe
//PARAM NOTES:
//PURPOSE: Useful for debugging commands that need to know whether a recording exists
NATIVE FUNC BOOL DOES_VEHICLE_RECORDING_FILE_EXIST_IN_CDIMAGE(INT FileNumber, STRING pRecordingName) = "0x2f2d48e78494f912"
#ENDIF

#IF IS_DEBUG_BUILD

//INFO: This command allows you to see the route that the car will follow during playback.
//          PlaybackDisplayMode should be taken from the Playback Display Modes List. 
//          This doesn't work in the final version of the game and can only be used for debug purposes
//PARAM NOTES:
//PURPOSE: DIsplays the route that the car will follow during playback. More info..
NATIVE PROC DISPLAY_PLAYBACK_RECORDED_VEHICLE(VEHICLE_INDEX VehicleIndex, PLAYBACKDISPLAYMODE DisplayMode) = "0x0c7be48cb23783ac"

#ENDIF	//	IS_DEBUG_BUILD

//INFO: After this command is called the car will use ai to try and stay close to the original recording
//PARAM NOTES:
//PURPOSE: Stes a vehicle recording for a certain vehicle from being exact to be using AI. More info..
NATIVE PROC SET_PLAYBACK_TO_USE_AI(VEHICLE_INDEX VehicleIndex, DRIVINGMODE Mode = DRIVINGMODE_STOPFORCARS) = "0xf4e68ebd83914967"

//INFO: After this command is called the car will use ai to try and stay close to the original recording. After the specified time (in ms) expires the recording will turn itself back into a non-ai one if it is close enough to the route.
//PARAM NOTES:
//PURPOSE: Stes a vehicle recording for a certain vehicle from being exact to be using AI. More info..
NATIVE PROC SET_PLAYBACK_TO_USE_AI_TRY_TO_REVERT_BACK_LATER(VEHICLE_INDEX VehicleIndex, INT delayInMilliseconds, DRIVINGMODE Mode = DRIVINGMODE_STOPFORCARS, BOOL SnapToPositionIfNotVisible = FALSE) = "0x40d396d9ecf69add"

//INFO: Allows access to the translation of the vehicle in a recording at a given point in time
//PARAM NOTES: There is two versions of this function. One that takes a RECORDING_ID and one that takes the number and name. It is preferable to use the RECORDING_ID
//PURPOSE: Returns the translation of the vehicle at a given time during the recording
NATIVE FUNC VECTOR GET_POSITION_OF_VEHICLE_RECORDING_ID_AT_TIME( RECORDING_ID index, FLOAT fTime) = "0xad6ef15ccc57aa73"
NATIVE FUNC VECTOR GET_POSITION_OF_VEHICLE_RECORDING_AT_TIME( INT iRecordingNumber, FLOAT fTime, STRING pRecordingName) = "0xa53596fa06de5ecb"

//INFO: Allows access to the rotation of the vehicle in a recording at a given point in time
//PARAM NOTES: There is two versions of this function. One that takes a RECORDING_ID and one that takes the number and name. It is preferable to use the RECORDING_ID
//PURPOSE: Returns the rotation of the vehicle at a given time during the recording
NATIVE FUNC VECTOR GET_ROTATION_OF_VEHICLE_RECORDING_ID_AT_TIME( RECORDING_ID index, FLOAT fTime) = "0xa978194a1e680f26"
NATIVE FUNC VECTOR GET_ROTATION_OF_VEHICLE_RECORDING_AT_TIME( INT iRecordingNumber, FLOAT fTime, STRING pRecordingName) = "0xabe8e3132c9d7251"

//INFO: 
//PARAM NOTES: There is two versions of this function. One that takes a RECORDING_ID and one that takes the number and name. It is preferable to use the RECORDING_ID
//PURPOSE: Gets the total duration of the recording 
NATIVE FUNC FLOAT GET_TOTAL_DURATION_OF_VEHICLE_RECORDING_ID( RECORDING_ID index) = "0x48612b013e0ccba2"
NATIVE FUNC FLOAT GET_TOTAL_DURATION_OF_VEHICLE_RECORDING( INT iRecordingNumber, STRING pRecordingName) = "0x733908dbfa08cead"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Flags this car to interpolate from the current position in an AI recording when switching to a full recording to avoid pops in heading/position
NATIVE PROC SET_SHOULD_LERP_FROM_AI_TO_FULL_RECORDING(VEHICLE_INDEX vehicleIndex, BOOL INTERPOLATE) = "0x3bbbbdbfc1da3fa5"


//~>                                   Attach Commands                              <~

//INFO: 
//PARAM NOTES:
//PURPOSE: Attaches a vehicle to a trailer
NATIVE PROC ATTACH_VEHICLE_TO_TRAILER(VEHICLE_INDEX VehicleIndex, VEHICLE_INDEX TrailerIndex, FLOAT InverseMassScale = 1.0) = "0xfe1d9d8bff8d8ea6"

//INFO: 
//PARAM NOTES: Pass in the Truck vehicle index not the trailers.
//PURPOSE: Detaches a vehicle from a trailer
NATIVE PROC DETACH_VEHICLE_FROM_TRAILER(VEHICLE_INDEX VehicleIndex) = "0x6c2ff30b05b4d198"

//INFO: THIS COMMAND IS BEING REMOVED, please do not use.
//PARAM NOTES: Pass in the Trailer
//PURPOSE: Forces the trailer to become undetachable, only call once connected to trailer
NATIVE PROC DISABLE_TRAILER_BREAKING_FROM_VEHICLE(VEHICLE_INDEX TrailerIndex, BOOL DisableBreaking) = "0xfad25982f0299b43"

//INFO: 
//PARAM NOTES: Pass in the Truck
//PURPOSE: Checks if a vehicle is attached to trailer
NATIVE FUNC BOOL IS_VEHICLE_ATTACHED_TO_TRAILER(VEHICLE_INDEX VehicleIndex) = "0x817b926b53c0589a"

//INFO: 
//PARAM NOTES: Pass in the trailer
//PURPOSE: Sets the inverse mass scales on the trailer constraints
NATIVE PROC SET_TRAILER_INVERSE_MASS_SCALE(VEHICLE_INDEX TrailerIndex, float InvMassScale) = "0x6f8aba9f3a136b93"

//INFO: 
//PARAM NOTES: Pass in the trailer
//PURPOSE: Instantly raises the trailers legs, useful when attaching a trailer in script to prevent popping
NATIVE PROC SET_TRAILER_LEGS_RAISED(VEHICLE_INDEX TrailerIndex) = "0xeec059ac0da1daed"

//INFO: 
//PARAM NOTES: Pass in the trailer
//PURPOSE: Instantly lowers the trailers legs
NATIVE PROC SET_TRAILER_LEGS_LOWERED(VEHICLE_INDEX TrailerIndex) = "0x4976f71e5a906e42"

//INFO: 
//PARAM NOTES:
//PURPOSE: Attaches a vehicle on to the back of a trailer. This limits the mass of the vehicle put onto the trailer to reduce physics issues 
NATIVE PROC ATTACH_VEHICLE_ON_TO_TRAILER(VEHICLE_INDEX VehicleIndex, VEHICLE_INDEX TrailerIndex, VECTOR FirstEntityOffset, VECTOR SecondEntityOffset, VECTOR vecRotation, FLOAT PhysicalStrength) = "0x0584f9efa7ee3834"


//INFO: 
//PARAM NOTES:Pass NULL into EntityIndex to turn off stabilisation
//PURPOSE: Stabilises an attached entity
NATIVE PROC STABILISE_ENTITY_ATTACHED_TO_HELI(VEHICLE_INDEX VehicleIndex, ENTITY_INDEX EntityIndex, FLOAT SpringDistance) = "0xd0c0c836fb290d0d"

//INFO: 
//PURPOSE: Tells the specified helicopter to watch out so that the specified entity doesn't hit anything when flying over obstructions
//You must call CLEAR_ENTITY_FOR_HELICOPTER_TO_DO_HEIGHT_CHECKS_FOR when this entity is detached, the helicopter won't know about it otherwise
NATIVE PROC SET_ENTITY_FOR_HELICOPTER_TO_DO_HEIGHT_CHECKS_FOR(VEHICLE_INDEX VehicleIndex, ENTITY_INDEX EntityIndex) = "0xf79c37c15e566532"

//INFO: 
//PURPOSE: To be called when the entity set by SET_ENTITY_FOR_HELICOPTER_TO_DO_HEIGHT_CHECKS_FOR is no longer attached to the specified vehicle
NATIVE PROC CLEAR_ENTITY_FOR_HELICOPTER_TO_DO_HEIGHT_CHECKS_FOR(VEHICLE_INDEX VehicleIndex) = "0x112d87c1ebdce6e1"

//~>                                   Train Commands                               <~

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets random trains active
NATIVE PROC SET_RANDOM_TRAINS(BOOL RandomTrainsFlag) = "0x50cf518fb6f3bbde"

//INFO: 
//PARAM NOTES:
//PURPOSE: Create a mission train
NATIVE FUNC VEHICLE_INDEX CREATE_MISSION_TRAIN(INT CarriageConfiguration, VECTOR VecNewCoors, BOOL DirectionFlag, BOOL bRegisterAsNetworkObject=FALSE, BOOL bScriptHostObject=FALSE) = "0x27a58935528fc12f"
//INFO: 
//PARAM NOTES:
//PURPOSE: Create a mission train
NATIVE FUNC VEHICLE_INDEX CREATE_MISSION_TRAIN_BY_NAME(INT CarriageConfigurationName, VECTOR VecNewCoors, BOOL DirectionFlag) = "0xa8ab1e935fb305ac"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets a train vehicle to be removable by population. Only use if the train was created via CREATE_VEHICLE. If possible use: CREATE_MISSION_TRAIN
NATIVE PROC ALLOW_TRAIN_TO_BE_REMOVED_BY_POPULATION(VEHICLE_INDEX vehicleIndex) = "0x0ff532f1f7d2bc7f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Deletes all non-mission trains.
NATIVE PROC DELETE_ALL_TRAINS() = "0x4e012c90db4d2b14"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the train spped in m/s
NATIVE PROC SET_TRAIN_SPEED(VEHICLE_INDEX VehicleIndex, FLOAT NewTrainSpeed) = "0x95f65274c3ab868e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the train cruise speed
NATIVE PROC SET_TRAIN_CRUISE_SPEED(VEHICLE_INDEX VehicleIndex, FLOAT NewTrainCruiseSpeed) = "0x2fb817738fffdc38"

//INFO: 
//PARAM NOTES:
//PURPOSE :Gets last carriage of the train with the given engine. 
NATIVE FUNC VEHICLE_INDEX GET_TRAIN_CABOOSE(VEHICLE_INDEX TrainIndex) = "0xee34e3ad7ce9079b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the train stops for staions
NATIVE PROC SET_TRAIN_STOPS_FOR_STATIONS(VEHICLE_INDEX TrainIndex, BOOL Stops) = "0x2e79d025b3f29270"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the train to be stopped in the station 
NATIVE PROC SET_TRAIN_IS_STOPPED_AT_STATION(VEHICLE_INDEX TrainIndex) = "0x724c93286b44db54"

//INFO: 
//PARAM NOTES:
//PURPOSE:Set train leaves the station
NATIVE PROC SET_TRAIN_LEAVES_STATION(VEHICLE_INDEX TrainIndex) = "0x543ed7a84f4d1470"

//INFO: ReturnTrainCarriageID will be NULL if the carriage couldn't be found. 
//PARAM NOTES: A CarriageNumber of 0 will return a pointer to the engine
//PURPOSE: he specified carriage of the train with the given engine. More info..
NATIVE FUNC VEHICLE_INDEX GET_TRAIN_CARRIAGE(VEHICLE_INDEX TrainEngineIndex, INT CarriageNumber) = "0xc1ee596291035d51"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if the train is a mission train
NATIVE FUNC BOOL IS_MISSION_TRAIN(VEHICLE_INDEX TrainIndex) = "0x91e77d03171a5783"

//INFO: 
//PARAM NOTES:
//PURPOSE: Deletes a mission train (must have been created by this script)
NATIVE PROC DELETE_MISSION_TRAIN(VEHICLE_INDEX &TrainIndex) = "0xf49d9d19b56dc6d4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a mission train as no longer needed (must have been created by this script)
NATIVE PROC SET_MISSION_TRAIN_AS_NO_LONGER_NEEDED(VEHICLE_INDEX &TrainIndex, INT iFlags=RTF_DEFAULT) = "0x419230303abc3b0b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set mission train coords
NATIVE PROC SET_MISSION_TRAIN_COORDS(VEHICLE_INDEX TrainIndex, VECTOR VecNewCoors) = "0xcc2da9dc117955cc"

//INFO: This should be used with care because if the player gets his hands on a train that isnâ€™t forced to slow down he could drive though the barriers into the next part of the map. 
//PARAM NOTES:
//PURPOSE: Makes the tarin slow down. More info..
NATIVE PROC SET_TRAIN_FORCED_TO_SLOW_DOWN(VEHICLE_INDEX TrainIndex, BOOL SlowDownFlag) = "0x636cf3c77c65eb2b"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC BOOL GET_TRAIN_DIRECTION(VEHICLE_INDEX TrainIndex) = "0x2b97e440e8bbe9e0"

//INFO: Toggles whether random trains are created for the specified train track
//PARAM NOTES: You'll need to speak with John to find out which track is which in-game
//PURPOSE: If you don't switch tracks back off, they will be automatically switched off when your script terminates
NATIVE PROC SWITCH_TRAIN_TRACK(INT iTrackIndex, BOOL bSwitchOn) = "0x8aa588abcb86e05d"

//INFO: Specifies the maximum spawn frequency for trains on the specified track; trains will not be generated more frequently that this.
//PARAM NOTES: Time value is in millisecs; using -1 will set the train track spawn freq back to default (also done automatically at end of mission scripts)
//             You'll need to speak with John to find out which track is which in-game
//             This defines the maximum frequency premissible - trains may well appear a lot less frequently than this, due to streaming, etc
NATIVE PROC SET_TRAIN_TRACK_SPAWN_FREQUENCY(INT iTrackIndex, INT iTimeMS) = "0xf2b3b5bdf87008c0"

//INFO: 
//PARAM NOTES:
//PURPOSE:Sets the train to stop at stations the playe ris allowed to be in.
NATIVE PROC SKIP_TO_NEXT_ALLOWED_STATION(VEHICLE_INDEX TrainIndex) = "0xfef29191da0385f0"

//INFO: If this value is set to true the carriages will be rendered at a slight random angle. This will make it look like the train has derailed. 
//          In every other way the train is a normal train and it can still move. The player can still get on it etc. 
//PARAM NOTES:
//PURPOSE:Sets the train to look derailed. More info..
NATIVE PROC SET_RENDER_TRAIN_AS_DERAILED(VEHICLE_INDEX TrainIndex, BOOL bVal) = "0x67196474beffda91"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC INT GET_NEXT_STATION_FOR_TRAIN(VEHICLE_INDEX TrainEngineIndex) = "0x5aaf6c2280e43a27"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC INT GET_CURRENT_STATION_FOR_TRAIN(VEHICLE_INDEX TrainEngineIndex) = "0x6642ecb9ee1c3c5e"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC INT GET_TIME_TIL_NEXT_STATION(VEHICLE_INDEX TrainEngineIndex) = "0x07e509a579d5264c"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC STRING GET_STATION_NAME(VEHICLE_INDEX TrainEngineIndex, INT StationId) = "0x211b95dc549c845b"


/// PURPOSE:
///    Sets whether to use high precision network blending for the specified network ID. 
///    High precision blending is useful for small objects that need to be kept very tightly in sync for gameplay purposes 
/// PARAMS:
///    NetworkId        - Network ID of the object to change the blending mode
///    UseHighPrecision - Flag indicating whether to use high precision or standard network blending
NATIVE PROC NETWORK_USE_HIGH_PRECISION_TRAIN_BLENDING(NETWORK_INDEX NetworkId, BOOL UseHighPrecision) = "0xf3beb7beccdbf0b3"


//~>                                Extra commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if a vehicle extra is turned on.
NATIVE FUNC BOOL IS_VEHICLE_EXTRA_TURNED_ON( VEHICLE_INDEX VehicleIndex, INT Extra) = "0xc49329a4e58d025b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a vehcile extra 
NATIVE PROC SET_VEHICLE_EXTRA( VEHICLE_INDEX VehicleIndex, INT Extra, BOOL TurnOff) = "0x45a6ea15139a0c54"

//INFO: 
//PARAM NOTES:
//PURPOSE: does the specified extra exist
NATIVE FUNC BOOL DOES_EXTRA_EXIST( VEHICLE_INDEX VehicleIndex, INT Extra) = "0x2c52b3cc96343f32"

//INFO: 
//PARAM NOTES:
//PURPOSE: Is this Extra broken off
NATIVE FUNC BOOL IS_EXTRA_BROKEN_OFF( VEHICLE_INDEX VehicleIndex, INT Extra) = "0x390a3d0aa379ba97"

//INFO: 
//PARAM NOTES:
//PURPOSE: Forces teh vehicle indicator on or off, needs to be called each frame to override the vehicle AI
NATIVE PROC SET_VEHICLE_INDICATOR_LIGHTS(VEHICLE_INDEX VehicleIndex, BOOL bLeft, BOOL bOn) = "0xffcd7c1bd59ed815"


//INFO: 
//PARAM NOTES:
//PURPOSE: Forces a vehicles brake lights on or off, needs to be called each frame to override the vehicle AI
NATIVE PROC SET_VEHICLE_BRAKE_LIGHTS(VEHICLE_INDEX VehicleIndex, BOOL bOn) = "0xa3e3fc2853e2107b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Forces a vehicles tail lights on or off, needs to be called each frame 
NATIVE PROC SET_VEHICLE_TAIL_LIGHTS(VEHICLE_INDEX VehicleIndex, BOOL bOn) = "0x130d281128da6a9e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a vehicles handbrake on or off
NATIVE PROC SET_VEHICLE_HANDBRAKE(VEHICLE_INDEX VehicleIndex, BOOL bOn) = "0x399cfa9720ccdf92"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a vehicles brake value
NATIVE PROC SET_VEHICLE_BRAKE(VEHICLE_INDEX VehicleIndex, FLOAT Brakes) = "0xfea9d72485628c49"

//INFO: 
//PARAM NOTES:
//PURPOSE: Disables a vehicle pretend occupants, Ped inside will not be removed and always rendered. 
NATIVE PROC SET_DISABLE_PRETEND_OCCUPANTS(VEHICLE_INDEX VehicleIndex, BOOL bVal) = "0x11647d34b93a72eb"


//~>                            Health commands 

//INFO: Must be used before using many of the other vehicle commands.
//PARAM NOTES: Will return false for cars on fire if and only if bCheckFire is true.
//PURPOSE: Checks that the vehicle is fit to be driven.  More info..
NATIVE FUNC BOOL IS_VEHICLE_DRIVEABLE(VEHICLE_INDEX VehicleIndex, BOOL bCheckFire = FALSE) = "0x55a0c756c4a8220c"

//INFO: 1000.0 = full,  0.0 = go on fire,  -1000.0 = burnt out 
//          While on fire, burning engine "may" set the petrol tank on fire as well, but there's only a chance of this.
//          While on fire engine health will drop until it reaches -1000.0
//          Engine health < 0.0 means engine won't work. 
//PARAM NOTES:
//PURPOSE: Get engine health for a vehicle. More info..
NATIVE FUNC FLOAT GET_VEHICLE_ENGINE_HEALTH(VEHICLE_INDEX VehicleIndex) = "0x20e1198e4672f72d"

//INFO: 1000.0 = full,  0.0 = go on fire,  -1000.0 = burnt out 
//PARAM NOTES:
//PURPOSE: Set engine health for a vehicle. More info..
NATIVE PROC SET_VEHICLE_ENGINE_HEALTH(VEHICLE_INDEX VehicleIndex, FLOAT health) = "0x2ee80cd0eaeb9b5b"

//INFO: 
//PARAM NOTES:
//PURPOSE: the same as the above function but it allows the engine health on planes to be set higher than the max health
NATIVE PROC SET_PLANE_ENGINE_HEALTH(VEHICLE_INDEX VehicleIndex, FLOAT health) = "0x9740b00ff15d67e4"


//INFO: 1000.0 = full,  0.0 = go on fire,  -1000.0 = burnt out 
            //Petrol tank "will" explode when health reaches -1000.0
            //Petrol tank health will drop if on fire until it explodes 
//PARAM NOTES:
//PURPOSE: Get petrol tank health for a vehicle.More info..
NATIVE FUNC FLOAT GET_VEHICLE_PETROL_TANK_HEALTH(VEHICLE_INDEX VehicleIndex) = "0xda70f2c4f36b81cb"

//INFO:  Petrol tank "will" explode when health reaches -1000.0 Petrol tank health will drop if on fire until it explodes 
//PARAM NOTES: 1000.0 = full 0.0 = go on fire -1000.0 = burnt out
//PURPOSE: Set petrol tank health for a vehicle. More info..
NATIVE PROC SET_VEHICLE_PETROL_TANK_HEALTH(VEHICLE_INDEX VehicleIndex, FLOAT health) = "0x448ad51b3157c957"

//INFO: Restores the health of the vehicle and fixes any damage
NATIVE PROC SET_VEHICLE_FIXED(VEHICLE_INDEX VehicleIndex) = "0x02443408423266f9"

//INFO: Fixes deformation damages only, scratch, health and broken part will stay broken
NATIVE PROC SET_VEHICLE_DEFORMATION_FIXED(VEHICLE_INDEX VehicleIndex) = "0x5dacc304f20af7e6"

//INFO:  Sets whether a vehicles engine can missfire
//PARAM NOTES:
//PURPOSE: Allow a MISSION vehicle engine to missfire
NATIVE PROC SET_VEHICLE_CAN_ENGINE_MISSFIRE(VEHICLE_INDEX VehicleIndex, BOOL bVal) = "0x4f71024e0c6500dd"

//INFO:  Sets whether a vehicle can leak oil
//PARAM NOTES:
//PURPOSE: Allow a MISSION vehicle to leak oil
NATIVE PROC SET_VEHICLE_CAN_LEAK_OIL(VEHICLE_INDEX VehicleIndex, BOOL bVal) = "0x076b41121bfb1c77"

//INFO:  Sets whether a vehicle can leak petrol
//PARAM NOTES:
//PURPOSE: Allow a MISSION vehicle to leak petrol
NATIVE PROC SET_VEHICLE_CAN_LEAK_PETROL(VEHICLE_INDEX VehicleIndex, BOOL bVal) = "0xf80f852786cb8bb0"

//INFO:  Sets whether a petrol tank fire can occur
//PARAM NOTES:
//PURPOSE: Disable a MISSION vehicle from starting a petrol tank fire
NATIVE PROC SET_DISABLE_VEHICLE_PETROL_TANK_FIRES(VEHICLE_INDEX VehicleIndex, BOOL bVal) = "0xdc41f053565f1481"

//INFO:  Sets whether a petrol tank can take damage
//PARAM NOTES:
//PURPOSE: Disable a MISSION vehicle from taking damage to its petrol tank
NATIVE PROC SET_DISABLE_VEHICLE_PETROL_TANK_DAMAGE(VEHICLE_INDEX VehicleIndex, BOOL bVal) = "0xcdd48501873ff1bc"

//INFO:  Sets whether an engine fire can occur
//PARAM NOTES:
//PURPOSE: Disable a MISSION vehicle from starting an engine fire
NATIVE PROC SET_DISABLE_VEHICLE_ENGINE_FIRES(VEHICLE_INDEX VehicleIndex, BOOL bVal) = "0x86a3d2835b8f8645"

//INFO:  Sets whether a player controlled vehicle will limit it's speed when the
//		 player's control is disabled (used in cutscenes etc).  Default is to limit
//PARAM NOTES:
//PURPOSE: Disable the limiting of player vehicle speed when the player loses control
NATIVE PROC SET_VEHICLE_LIMIT_SPEED_WHEN_PLAYER_INACTIVE(VEHICLE_INDEX VehicleIndex, BOOL bVal) = "0x9874270e3081a06a"

//INFO:  Sets whether a player controlled vehicle will stop instantly when the
//		 player's control is disabled (used in cutscenes etc).  Default is to stop instantly
//PARAM NOTES:
//PURPOSE: Allow/prevent the player vheicle loss all its velocity instantly when the player loses control
NATIVE PROC SET_VEHICLE_STOP_INSTANTLY_WHEN_PLAYER_INACTIVE(VEHICLE_INDEX VehicleIndex, BOOL bVal) = "0xeae08e51369cea78"

//~>                        Window commands

//INFO: 
//PARAM NOTES: SC_WINDOW_LIST is in commands_vehicle.sch
//PURPOSE: Removes a vehicles window.  More info..
NATIVE PROC REMOVE_VEHICLE_WINDOW(VEHICLE_INDEX VehicleIndex, SC_WINDOW_LIST WindowNumber) = "0xf6fba55b09506b23"

//INFO: 
//PARAM NOTES: SC_WINDOW_LIST is in commands_vehicle.sch
//PURPOSE: Smashes a vehicles window.  More info..
NATIVE PROC SMASH_VEHICLE_WINDOW(VEHICLE_INDEX VehicleIndex, SC_WINDOW_LIST WindowNumber) = "0xbdba586f627a444a"

//INFO: 
//PARAM NOTES: SC_WINDOW_LIST is in commands_vehicle.sch
//PURPOSE: Fixes a vehicles window.  More info..
NATIVE PROC FIX_VEHICLE_WINDOW(VEHICLE_INDEX VehicleIndex, SC_WINDOW_LIST WindowNumber) = "0xd30ba8c994da4a59"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Pops the windscreen out of the vehicle
NATIVE PROC POP_OUT_VEHICLE_WINDSCREEN(VEHICLE_INDEX VehicleIndex) = "0xfc9192010268ed99"

//INFO: 
//PARAM NOTES:
// PURPOSE: Returns true if a window exists and is not smashed, false otherwise.
NATIVE FUNC BOOL IS_VEHICLE_WINDOW_INTACT(VEHICLE_INDEX VehicleIndex, SC_WINDOW_LIST WindowNumber) = "0x49e701a18d345b0e"

//INFO: 
//PARAM NOTES:
// PURPOSE: Returns true if all windows exist and are not smashed, false otherwise.
NATIVE FUNC BOOL ARE_ALL_VEHICLE_WINDOWS_INTACT(VEHICLE_INDEX VehicleIndex) = "0x9ca0cb41f81c959c"

//INFO: 
//PARAM NOTES:
// PURPOSE: Returns true if there is at least one free seat in the vehicle, false otherwise.
NATIVE FUNC BOOL ARE_ANY_VEHICLE_SEATS_FREE(VEHICLE_INDEX VehicleIndex) = "0x10a4f356f2dcea52"

//~>                        Mission commands 

//INFO: f vehicle has not been owned by player, the player will get a wanted level when entering (if spotted by police).
//          If the player has already owned a vehicle he is free to use it. (The game will set this flag to true first time the player drives a vehicle)
//          Mission vehicles will default to true 
//PARAM NOTES:
//PURPOSE: Sets a vehicle owned by the player so he wont get a wanted level when entering it. More info..
NATIVE PROC SET_VEHICLE_HAS_BEEN_OWNED_BY_PLAYER(VEHICLE_INDEX VehicleIndex, BOOL bNewVal) = "0x84934728f6567814"


//~>                            Police commands

//INFO: If this is set to true the police focus circle is always focussed on the car. If this is false the player has a chance to escape police attention if undetected.
//          By default law enforcement vehicles have this bit set to true and all other cars have false. 
//PARAM NOTES:
//PURPOSE: Sets the police focus on the vehicle. More info..
NATIVE PROC SET_POLICE_FOCUS_WILL_TRACK_VEHICLE(VEHICLE_INDEX VehicleIndex, BOOL bNewVal) = "0x01640baf2d975118"

//~>                        Livery commands

//INFO: 
//PARAM NOTES:
// PURPOSE: Set the livery of the vehicle
NATIVE PROC SET_VEHICLE_LIVERY(VEHICLE_INDEX VehicleIndex, INT LiveryID) = "0xe1f8dbcf9a6e205e"

//INFO: 
//PARAM NOTES:
// PURPOSE: Set the livery2 of the vehicle
NATIVE PROC SET_VEHICLE_LIVERY2(VEHICLE_INDEX VehicleIndex, INT LiveryID) = "0x9e56f3b30f9945a4"

//INFO: 
//PARAM NOTES:
// PURPOSE: Return the livery of the vehicle
NATIVE FUNC INT GET_VEHICLE_LIVERY(VEHICLE_INDEX VehicleIndex) = "0x3a5087062a6dbaef"

//INFO: 
//PARAM NOTES:
// PURPOSE: Return the livery2 of the vehicle
NATIVE FUNC INT GET_VEHICLE_LIVERY2(VEHICLE_INDEX VehicleIndex) = "0xca76a695ac878584"

//INFO: 
//PARAM NOTES:
// PURPOSE: Return the number of liveries for this vehicle
NATIVE FUNC INT GET_VEHICLE_LIVERY_COUNT(VEHICLE_INDEX VehicleIndex) = "0x8f0bc830ffcf7f2a"

//INFO: 
//PARAM NOTES:
// PURPOSE: Return the number of liveries2 for this vehicle
NATIVE FUNC INT GET_VEHICLE_LIVERY2_COUNT(VEHICLE_INDEX VehicleIndex) = "0x5e17421c6ddf16af"

//INFO: 
//PARAM NOTES:
//PURPOSE: Force all cars to always use their high LOD. More info..
NATIVE PROC SET_ALL_VEHICLES_HIGH_LOD(bool bForceHighLOD) = "0x17de2ac78e60565f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the vehicle's name, can be displayed by selecting the PedName option from the debug widget->AI toggle display drop down box
NATIVE PROC SET_VEHICLE_NAME_DEBUG ( VEHICLE_INDEX VehicleIndex, STRING debugName ) = "0x892981d1dd897c93"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns whether a vehicle has a landing gear (all planes and some helicopters)
NATIVE FUNC BOOL GET_VEHICLE_HAS_LANDING_GEAR ( VEHICLE_INDEX VehicleIndex) = "0x03377f11051bc47f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Control an aircraft's landing gear
NATIVE PROC CONTROL_LANDING_GEAR ( VEHICLE_INDEX VehicleIndex, LANDING_GEAR_COMMAND nCommand) = "0x3739deed4a756e69"

//INFO: 
//PARAM NOTES:
//PURPOSE: Control an aircraft's landing gear
NATIVE FUNC LANDING_GEAR_STATE GET_LANDING_GEAR_STATE ( VEHICLE_INDEX VehicleIndex ) = "0xc56def5c90606858"

//~>                        Area commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if any vehicle's pivot point lies within the sphere with the given radius at the given point
NATIVE FUNC BOOL IS_ANY_VEHICLE_NEAR_POINT ( VECTOR point, FLOAT radius ) = "0x34faa537d539192c"

//INFO: Returns FALSE if vehicle does not exist
//PARAM NOTES: Values returned by parameter; NB I've had to use INTEGERS because script doesn't allow for "BOOL &" parameters
//             The returned values of bLightsOn and bFullBeam will only ever be 0 or 1
//PURPOSE: Gets the state of the vehicle's lights
NATIVE FUNC BOOL GET_VEHICLE_LIGHTS_STATE( VEHICLE_INDEX iVehicleID, INT & bLightsOn, INT & bFullBeam ) = "0x9a899383ad37fc41"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the proximity to the player at which vehicles' occupants become real peds, rather than pretend occupants
NATIVE FUNC FLOAT GET_VEHICLE_PRETEND_OCCUPANTS_CONVERSION_RANGE() = "0xcf8ae4549d9580a9"

// INFO:  
// PARAM NOTES:
//    SearchPos - Position to search outward from (most of the time you want the local player's position)
//    Result - Coordinates to spawn a vehicle, passed back by reference
//    DesiredHeading - Try to find a node facing this direction.
//    DesiredHeadingTolerance - How far away from the desired heading can we be?  (Pass in 180 if you don't care)
//    MinCreationDistance - What's the minimum distance from SearchPos that you'd like a vehicle to spawn?
//    bIncludeSwitchedOffNodes - Search areas not currently switched on
//    bNoWater - TRUE to prevent finding a position in water
// PURPOSE:  Gets a position to create a new vehicle.  Searches outward from the position in targetPos (recommended:  pass in local player's position)  
NATIVE FUNC BOOL GENERATE_VEHICLE_CREATION_POS_FROM_PATHS(VECTOR& SearchPos, VECTOR& Result, VECTOR& ResultLinkDir, FLOAT DesiredHeading = 0.0, FLOAT DesiredHeadingTolerance = 180.0, float MinCreationDistance = 0.0, bool bIncludeSwitchedOffNodes=FALSE, bool bNoWater=TRUE, bool bAllowAgainstTraffic=TRUE) = "0xae32ae15890aa504"

//~>                                   Digger Commands                              <~

//INFO: Sets a vehicle digger arm position, 0.0 on the ground 1.0 in the air
//PARAM NOTES:
//PURPOSE: Sets a vehicle digger arm position, 0.0 on the ground 1.0 in the air
NATIVE PROC SET_VEHICLE_DIGGER_ARM_POSITION(VEHICLE_INDEX VehicleIndex, FLOAT ArmPosition) = "0xe69be11860e4723e"

//INFO: Sets a vehicle bulldozer arm position
//PARAM NOTES: bulldozer vehicle index, ratio between 0 and 1
//PURPOSE: Sets a vehicle bulldozer arm position
NATIVE PROC SET_VEHICLE_BULLDOZER_ARM_POSITION(VEHICLE_INDEX VehicleIndex, FLOAT ArmPosition, BOOL SnapToPosition = FALSE) = "0xf2d70f64da5b8c27"

//INFO: Sets a tank vehicle's turret position
//PARAM NOTES: tank vehicle index, ratio between 0 and 1
//PURPOSE: Sets a vehicle bulldozer arm position
NATIVE PROC SET_VEHICLE_TANK_TURRET_POSITION(VEHICLE_INDEX VehicleIndex, FLOAT TurretPosition, BOOL SnapToPosition = FALSE) = "0xb551d01ea2292b47"

//INFO: Sets the target position for a turret to point at
//PARAM NOTES: If TurretIndex is -1 all turrets will point at the target.
//PURPOSE:
NATIVE PROC SET_VEHICLE_TURRET_TARGET(VEHICLE_INDEX VehicleIndex, INT TurretIndex, VECTOR TargetPosition, BOOL SnapToPosition = FALSE) = "0x8f43872427e3508a"

//INFO: Makes the tank stay still when shooting at a target
NATIVE PROC SET_VEHICLE_TANK_STATIONARY(VEHICLE_INDEX VehicleIndex, BOOL bStationary) = "0x537574ee39db9104"

//INFO: Sets a vehicle's turret speed on a per-frame basis
//PARAM NOTES:
//PURPOSE: Sets a tank or heli's turret speed
NATIVE PROC SET_VEHICLE_TURRET_SPEED_THIS_FRAME(VEHICLE_INDEX VehicleIndex, FLOAT TurretSpeed) = "0xff85d4893258e0be"

//INFO: Sets a vehicle's turret speed on a per-frame basis
//PARAM NOTES:
//PURPOSE: Disables a tank or heli's turret movement
NATIVE PROC DISABLE_VEHICLE_TURRET_MOVEMENT_THIS_FRAME(VEHICLE_INDEX VehicleIndex) = "0x6fdbcebfe9de2bd2"


//~>                                   Tow truck Commands                              <~


//INFO: Sets a tow truck arm position, 0.0 on the ground 1.0 in the air
//PARAM NOTES:
//PURPOSE: Sets a tow truck arm position, 0.0 on the ground 1.0 in the air
NATIVE PROC SET_VEHICLE_TOW_TRUCK_ARM_POSITION(VEHICLE_INDEX TowTruckVehicleIndex, FLOAT ArmPosition) = "0x71aaa22c257241e2"

//INFO: Attaches a vehicle to a tow truck
//PARAM NOTES:
//PURPOSE: Attaches a vehicle to a tow truck at a bone with an offset from that bone, use -1 to do an offset against the whole vehicle
//		   This does not reposition the vehicles, please try and position the vehicle around 0.5m behind the truck
NATIVE PROC ATTACH_VEHICLE_TO_TOW_TRUCK(VEHICLE_INDEX TowTruckVehicleIndex, VEHICLE_INDEX VehicleIndex, INT VehicleBoneIndex, VECTOR VehicleAttachPointOffset) = "0xad0c529621854370"

//INFO: Detach a vehicle to from a towtruck
//PARAM NOTES:
//PURPOSE: Detach a vehicle to from a towtruck
NATIVE PROC DETACH_VEHICLE_FROM_TOW_TRUCK(VEHICLE_INDEX TowTruckVehicleIndex, VEHICLE_INDEX VehicleIndex) = "0x25780288ab87ba6f"

//INFO: Detaches specified vehicle from any tow truck it might be attached through, loops through all vehicles so could be expensive
//PARAM NOTES:
//PURPOSE: Returns true if it has been detached from a tow truck
NATIVE FUNC BOOL DETACH_VEHICLE_FROM_ANY_TOW_TRUCK(VEHICLE_INDEX VehicleIndex) = "0x3c5e540babd9e8aa"

//INFO: Check if a vehicle is attached to the tow truck
//PARAM NOTES:
//PURPOSE: Check if a vehicle is attached to a tow truck, returns true if it is.
NATIVE FUNC BOOL IS_VEHICLE_ATTACHED_TO_TOW_TRUCK(VEHICLE_INDEX TowTruckVehicleIndex, VEHICLE_INDEX VehicleIndex) = "0x671cb92f637fdb33"

//INFO: 
//PARAM NOTES:	
//PURPOSE: Returns the entity index of the entity attached to this tow truck (-1 if is not attached)
NATIVE FUNC ENTITY_INDEX GET_ENTITY_ATTACHED_TO_TOW_TRUCK (ENTITY_INDEX TowTruckVehicleIndex) = "0x5dff6b0d4f63c800"

//~>                                   Attaching Commands                              <~

//INFO: 
//PARAM NOTES:	ScanWithNonPlayerDriver - when set to true on a truck will scan for trailers even without a player driver
//PURPOSE: If this vehicle is detected by a tow truck or truck whether it should automatically attach to it
NATIVE FUNC ENTITY_INDEX SET_VEHICLE_AUTOMATICALLY_ATTACHES (ENTITY_INDEX TowTruckVehicleIndex, BOOL AutomaticallyAttach, BOOL ScanWithNonPlayerDriver = FALSE) = "0x2eabff5efcb7e6cf"

//~>								  Plane Commands									<~

//INFO: 
//PARAM NOTES: pass in a value between 0.0f and 1.0f;
//PURPOSE: Use this command to adjust the vertical flight nozzles position on the vulkan, this controls whether the vehicle is in vertical flight mode or not.
NATIVE PROC SET_VEHICLE_FLIGHT_NOZZLE_POSITION (ENTITY_INDEX PlaneIndex, FLOAT NozzleRatio) = "0x606f297da0a55aff"

//INFO: 
//PARAM NOTES: pass in a value between 0.0f and 1.0f;
//PURPOSE: Use this command to adjust the vertical flight nozzles position immediately on the vulkan, this controls whether the vehicle is in vertical flight mode or not.
NATIVE PROC SET_VEHICLE_FLIGHT_NOZZLE_POSITION_IMMEDIATE (ENTITY_INDEX PlaneIndex, FLOAT NozzleRatio) = "0x01c0a017e00bcf82"

//INFO: 
//PARAM NOTES: pass in a VTOL plane
//PURPOSE: Use this command to get the vertical flight nozzles position on the vulkan.
NATIVE FUNC FLOAT GET_VEHICLE_FLIGHT_NOZZLE_POSITION (ENTITY_INDEX PlaneIndex) = "0x5c729d34ad6cb405"

//INFO: 
//PARAM NOTES: pass in a VTOL plane
//PURPOSE: Use this command to get the vertical flight nozzles position on the vulkan.
NATIVE PROC SET_DISABLE_VERTICAL_FLIGHT_MODE_TRANSITION (ENTITY_INDEX PlaneIndex, BOOL DisableTransition) = "0xc66e93f49a6a7aa3"

//~>                                   Convertible Commands                              <~

//INFO: Lower the roof on a convertible
//PARAM NOTES: Use move instantly to move the roof to the position with out transitioning through the anim
//PURPOSE: Used to lower the roof on a vehicle if it has avaliable animations
NATIVE PROC LOWER_CONVERTIBLE_ROOF(VEHICLE_INDEX VehicleIndex, BOOl MoveInstantly = FALSE) = "0x47b16f33dd2893cf"

//INFO: Raise the roof on a convertible
//PARAM NOTES: Use move instantly to move the roof to the position with out transitioning through the anim
//PURPOSE: Used to raise the roof on a vehicle if it has avaliable animations
NATIVE PROC RAISE_CONVERTIBLE_ROOF(VEHICLE_INDEX VehicleIndex, BOOl MoveInstantly = FALSE) = "0xa36a3ab3d2350ccd"

//INFO: Get the current state of a convertible roof
//PARAM NOTES:
//PURPOSE: returns the CONVERTIBLE_ROOF_STATE of the vehicle if it has a convertible roof, defaults to CRS_RAISED
NATIVE FUNC CONVERTIBLE_ROOF_STATE GET_CONVERTIBLE_ROOF_STATE(VEHICLE_INDEX VehicleIndex) = "0x0c2181485e5fb7c2"

//INFO: Transform the submarine car to a submarine
//PARAM NOTES: Set InstantlyTransform to true to instantly transform without animating
//PURPOSE: Used to transform a vehicle if it has avaliable animations	   
NATIVE FUNC BOOL TRANSFORM_TO_SUBMARINE(VEHICLE_INDEX VehicleIndex, BOOL InstantlyTransform = FALSE) = "0x457a7eb3bab235b6"

//INFO: Transform the submarine car back to a car
//PARAM NOTES: Set InstantlyTransform to true to instantly transform without animating
//PURPOSE: Used to transform a vehicle if it has avaliable animations	   
NATIVE PROC TRANSFORM_TO_CAR(VEHICLE_INDEX VehicleIndex, BOOL InstantlyTransform = FALSE) = "0xe1202d8d620aa25e"

//INFO: Checks to see if the vehicle is in submarine mode
//PARAM NOTES:
//PURPOSE: returns true if the vehicle is in submarine mode
NATIVE FUNC BOOL IS_VEHICLE_IN_SUBMARINE_MODE(VEHICLE_INDEX VehicleIndex) = "0xd01f664cef70d0b0"

//INFO: 
//PARAM NOTES: Set CheckRoofExtras to true to also check for roofs without animation (ie. using VEH_EXTRAs)
//PURPOSE: returns whether the vehicle has a converitble roof and an animation to lower/raise it.	   
NATIVE FUNC BOOL IS_VEHICLE_A_CONVERTIBLE(VEHICLE_INDEX VehicleIndex, BOOL CheckRoofExtras = FALSE) = "0x351e83123efc0a15"

//INFO: 
//PARAM NOTES:
//PURPOSE: returns whether the vehicle has a trailer (and the trailer vehicle index)
NATIVE FUNC BOOL GET_VEHICLE_TRAILER_VEHICLE(VEHICLE_INDEX vehicle, VEHICLE_INDEX& trailer) = "0xcd52e82290c8c97a"

//INFO: 
//PARAM NOTES:
//PURPOSE: latch or unlatch a convertible roof
NATIVE PROC SET_CONVERTIBLE_ROOF_LATCH_STATE(VEHICLE_INDEX vehicle, BOOL bLatched) = "0xb7ca8f6b9d629efc"

//INFO: 
//PARAM NOTES:
//PURPOSE: turn on and off old style GTA IV roofs, that are not animated.
NATIVE PROC SET_CONVERTIBLE_ROOF(VEHICLE_INDEX vehicle, BOOL bTurnOn) = "0xc5b25a5d478730a6"

/// PURPOSE:
///    Adds a road speed zone at the specified position+radius.  Cars cruising in this volume will travel]
///    at a max speed of the param "maxSpeed".  This only affects cars running TASK_VEHICLE_CRUISE
/// PARAMS:
///    center - Position to add the speed zone
///    radius - Radius
///    maxSpeed - Maximum speed that vehicles will cruise in this area
///    AllowAffectMissionVehs - Should this also slow down mission vehicles
/// RETURNS
///    The index of the speed node.  You will need to save this in order to remove it properly
NATIVE FUNC INT ADD_ROAD_NODE_SPEED_ZONE(VECTOR center, FLOAT radius, FLOAT maxSpeed, BOOL AllowAffectMissionVehs = FALSE) = "0xbf1778fe3ac12e6e"

/// PURPOSE:
///    Removes a road node speed zone
/// PARAMS:
///    index - Index of the speed zone to remove.  This is the valued returned by ADD_ROAD_NODE_SPEED_ZONE
/// RETURNS:
///    TRUE if the zone was found and removed, false if it couldn't find it
NATIVE FUNC BOOL REMOVE_ROAD_NODE_SPEED_ZONE(INT index) = "0x11240d265de9105f"

//INFO:
//PARAM NOTES: PercentChange is a value from -100.0 to 100.0
//PURPOSE: Sets the vehicle's top speed to the specified percent of his previous top speed
NATIVE PROC MODIFY_VEHICLE_TOP_SPEED(VEHICLE_INDEX vehicle, FLOAT PercentChange) = "0xd356c8928e61c3f6"

//INFO:
//PARAM NOTES: 
//PURPOSE: Sets the vehicle's max speed
NATIVE PROC SET_VEHICLE_MAX_SPEED(VEHICLE_INDEX vehicle, FLOAT MaxSpeed) = "0x9611b039ccc9132f"

//PARAM NOTES: bStaysFrozen - FALSE is the default behaviour
//PURPOSE: Call this with TRUE if you've already called FREEZE_ENTITY_POSITION(TRUE) for this vehicle and you 
//		want it to stay frozen even after it's marked as no longer needed
NATIVE PROC SET_VEHICLE_STAYS_FROZEN_WHEN_CLEANED_UP(VEHICLE_INDEX VehicleIndex, BOOL bStaysFrozen) = "0xd3bdaed335d2db3e"

//INFO:  This is a reset flag, and will only stay set for one frame
//PARAM NOTES: You should never need to pass in false here, since the flag resets itself after the frame
//PURPOSE: Call this to set a vehicle to act as if it has a very high speed when colliding with a frag.
//			Mostly useful for scripted sequencse where a vehicle needs to break through a barrier, but may
//			not be going fast enough to break it
NATIVE PROC SET_VEHICLE_ACT_AS_IF_HIGH_SPEED_FOR_FRAG_SMASHING(VEHICLE_INDEX VehicleIndex, BOOL bActHighSpeed=TRUE) = "0x3edc5ce75ab1b296"

//INFO: These values are reset and will only stay set for one frame.
//PARAM NOTES: Any negative value of fVelThreshold will leave the default value for this vehicle. The higher the positive value, the
//			   greater the fall that the bike / quad can sustain before the passengers are knocked off.
//PURPOSE: Call this on a bike / quad every frame to change the likelihood that peds will be knocked off after a heavy fall.
NATIVE PROC SET_PEDS_CAN_FALL_OFF_THIS_VEHICLE_FROM_LARGE_FALL_DAMAGE(VEHICLE_INDEX VehicleIndex, BOOL bEnable, FLOAT fVelThreshold=-1.0) = "0x6d8e0ccf51d7c022"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets whether this vehicle forces enemy peds to fall off - regardless of how slow the vehicle is going
NATIVE PROC SET_ENEMY_PEDS_FORCE_FALL_OFF_THIS_VEHICLE(VEHICLE_INDEX VehicleIndex, BOOL bEnable) = "0xc2125f1d79401426"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the specified vehicles searchlight is currently on
NATIVE FUNC BOOL IS_VEHICLE_SEARCHLIGHT_ON(VEHICLE_INDEX vehicle) = "0x09113f944fb63ed2"

//INFO: 
//PARAM NOTES: AlwaysOn will guarantee that headlight will not turn off UNLESS THE FOLLOWING OCCURS:
//1. Vehicle goes into Water
//2. Time of Day is morning (not night)
//3. We are in interior scene
//4. If Target is above us
//5. If no Driver is there or if driver is dead
//PURPOSE: turn on/off a vehicle search light
NATIVE PROC SET_VEHICLE_SEARCHLIGHT(VEHICLE_INDEX vehicle, BOOL on, BOOL AlwaysOn = FALSE) = "0xa132a7a6a765a696"

/// PURPOSE:
///    Returns the number of mod kits available for the specified vehicle type
/// PARAMS:
///    index - vehicle entity index
/// RETURNS:
///    Number of mod kits available

NATIVE FUNC BOOL DOES_VEHICLE_HAVE_SEARCHLIGHT(VEHICLE_INDEX vehicle) = "0xcd1df129e7e656d9"

/// PURPOSE:
///    Checks if the vehicle has a search light.
/// PARAMS:
///    index - vehicle entity index
/// RETURNS:
///    Returns true if the vehicle has a searchlight if not returns false.

NATIVE FUNC INT GET_NUM_MOD_KITS(VEHICLE_INDEX vehicle) = "0x03ac3319d1b50189"

//INFO: 
//PARAM NOTES:
//PURPOSE: Activates a mod kit on the specified vehicle
NATIVE PROC SET_VEHICLE_MOD_KIT(VEHICLE_INDEX vehicle, INT kitIndex) = "0x3c1bce3438ecbfc0"

/// PURPOSE:
///    Returns the current mod kit used on this vehicle
/// PARAMS:
///    index - vehicle entity index
/// RETURNS:
///    Number the current mod kit used on this vehicle
NATIVE FUNC INT GET_VEHICLE_MOD_KIT(VEHICLE_INDEX vehicle) = "0x741835e0ef89491d"

/// PURPOSE:
///    Returns the type of the current mod kit onthe specified vehicle. Note: vehicle must have a kit set!
/// PARAMS:
///    index - vehicle entity index
/// RETURNS:
///    Type of current mod kit on the vehicle
NATIVE FUNC MOD_KIT_TYPE GET_VEHICLE_MOD_KIT_TYPE(VEHICLE_INDEX vehicle) = "0xf3f5d16790870112"

/// PURPOSE:
///    Returns the type of the wheel pack set on this vehicle type
/// PARAMS:
///    index - vehicle entity index
/// RETURNS:
///    Type of wheel pack
NATIVE FUNC MOD_WHEEL_TYPE GET_VEHICLE_WHEEL_TYPE(VEHICLE_INDEX vehicle) = "0xd9b8afe0dd1ad635"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the current wheel type on the vehicle specified
NATIVE PROC SET_VEHICLE_WHEEL_TYPE(VEHICLE_INDEX vehicle, MOD_WHEEL_TYPE type) = "0xe19d99912c7661c6"

//INFO: If base is false it willr eturn the index of the specular color index. This only applies for MCT_PEARLESCENT, the rest have only one index
//PARAM NOTES:
//PURPOSE: Returns the number of available color for a specific color type. More...
NATIVE FUNC INT GET_NUM_MOD_COLORS(MOD_COLOR_TYPE colorType, BOOL base = TRUE) = "0xed439e3cac3259f9"

//INFO: specColIndex only applies to MCT_PEARLESCENT
//PARAM NOTES:
//PURPOSE: Sets color 1 to a mod color on the specified vehicle. More...
NATIVE PROC SET_VEHICLE_MOD_COLOR_1(VEHICLE_INDEX vehicle, MOD_COLOR_TYPE colorType, INT baseColIndex, INT specColIndex) = "0xf8359e159a574462"

//INFO: specColIndex only applies to MCT_PEARLESCENT
//PARAM NOTES:
//PURPOSE: Sets color 2 to a mod color on the specified vehicle. More...
NATIVE PROC SET_VEHICLE_MOD_COLOR_2(VEHICLE_INDEX vehicle, MOD_COLOR_TYPE colorType, INT baseColIndex) = "0x774ad997bb23cd05"

//INFO: specColIndex only applies to MCT_PEARLESCENT
//PARAM NOTES:
//PURPOSE: Returns the type and index of color 1 on the specified vehicle. More...
NATIVE PROC GET_VEHICLE_MOD_COLOR_1(VEHICLE_INDEX vehicle, MOD_COLOR_TYPE& colorType, INT& baseColIndex, INT& specColIndex) = "0x0595a3cf1ba9c95c"

//INFO: specColIndex only applies to MCT_PEARLESCENT
//PARAM NOTES:
//PURPOSE: Returns the type and index of color 2 on the specified vehicle. More...
NATIVE PROC GET_VEHICLE_MOD_COLOR_2(VEHICLE_INDEX vehicle, MOD_COLOR_TYPE& colorType, INT& baseColIndex) = "0xb0800355bab891dd"

//PURPOSE: Returns the mod color name text label
//RETURNS:
NATIVE FUNC STRING GET_VEHICLE_MOD_COLOR_1_NAME(VEHICLE_INDEX vehicle, BOOL spec) = "0xf2e12eefb9affe62"

//PURPOSE: Returns the mod color name text label
//RETURNS:
NATIVE FUNC STRING GET_VEHICLE_MOD_COLOR_2_NAME(VEHICLE_INDEX vehicle) = "0xbe5387f9b686eab0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Disables the current (if any) active mod kit on the vehicle
NATIVE PROC REMOVE_VEHICLE_MOD_KIT(VEHICLE_INDEX vehicle) = "0xee0098dcb7b9c9ef"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true when all previously set mods have finished streaming in
NATIVE FUNC BOOL HAVE_VEHICLE_MODS_STREAMED_IN(VEHICLE_INDEX vehicle) = "0xe9e8be4cf922470d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the specified vehicle mod is only available on Gen9 platforms.
// The data for this exists in titleupdate\<branch>\common\data\gen9_exclusive_assets_vehicles.meta
NATIVE FUNC BOOL IS_VEHICLE_MOD_GEN9_EXCLUSIVE(VEHICLE_INDEX vehicle, MOD_TYPE modSlot, INT modIndex) = "0x00834eac4a96e010"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a mod on the specified mod slot. Use GET_NUM_VEHICLE_MODS to find out the count available
NATIVE PROC SET_VEHICLE_MOD(VEHICLE_INDEX vehicle, MOD_TYPE modSlot, INT modIndex, BOOL variation = false) = "0x0061b7c9351b41ed"

/// PURPOSE:
///    Returns the current mod index on the given slot, -1 if no active mod
/// PARAMS:
///    vehicle - vehicle entity index
///	   modSlot - mod slot to query
/// RETURNS:
///    Returns the current mod index on the given slot, -1 if no active mod
NATIVE FUNC INT GET_VEHICLE_MOD(VEHICLE_INDEX vehicle, MOD_TYPE modSlot) = "0x0dd0bc46c4cfd6ad"

/// PURPOSE:
///    Returns the current mod variation on the given slot, 0 if none active
/// PARAMS:
///    vehicle - vehicle entity index
///	   modSlot - mod slot to query
/// RETURNS:
///    Returns the current mod variation on the given slot, 0 if none active
NATIVE FUNC INT GET_VEHICLE_MOD_VARIATION(VEHICLE_INDEX vehicle, MOD_TYPE modSlot) = "0xccee7d38fc5d9fd6"

/// PURPOSE:
///    Returns the number of available mods on the given slot
/// PARAMS:
///    vehicle - vehicle entity index
///	   modSlot - mod slot to query
/// RETURNS:
///    Returns the number of available mods on the given slot
NATIVE FUNC INT GET_NUM_VEHICLE_MODS(VEHICLE_INDEX vehicle, MOD_TYPE modSlot) = "0x6b83f5ae0478286f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Clears the specified slot from any mods
NATIVE PROC REMOVE_VEHICLE_MOD(VEHICLE_INDEX vehicle, MOD_TYPE modSlot) = "0x0cf999545677298a"

//INFO: This can only be used with the toggle mods specified in the enum
//PARAM NOTES:
//PURPOSE: Toggles a toggle mod on or off. More info...
NATIVE PROC TOGGLE_VEHICLE_MOD(VEHICLE_INDEX vehicle, MOD_TYPE modSlot, BOOL toggleOn) = "0x6c6188d0f8ab739a"

//INFO: Note that modSlot has to be one of the toggle mods or the function always returns false
//PARAM NOTES:
//PURPOSE: Return if the toggle mod on the given slot is turned on or off. More...
NATIVE FUNC BOOL IS_TOGGLE_MOD_ON(VEHICLE_INDEX vehicle, MOD_TYPE modSlot) = "0x75b2c853cb0b3047"

//PURPOSE: Returns the mod name text label
//RETURNS:
NATIVE FUNC STRING GET_MOD_TEXT_LABEL(VEHICLE_INDEX vehicle, MOD_TYPE modSlot, INT modIndex) = "0xac1327f86ac1314a"

//PURPOSE: Returns the mod slot name to display in the mod shop ui
//RETURNS:
NATIVE FUNC STRING GET_MOD_SLOT_NAME(VEHICLE_INDEX vehicle, MOD_TYPE modSlot) = "0xfa9c34b5d0539761"

//PURPOSE: Returns the specified livery name
//RETURNS:
NATIVE FUNC STRING GET_LIVERY_NAME(VEHICLE_INDEX vehicle, INT livery) = "0x66b61200529ab970"

//PURPOSE: Returns the specified livery2 name
//RETURNS:
NATIVE FUNC STRING GET_LIVERY2_NAME(VEHICLE_INDEX vehicle, INT livery2) = "0xf9852988c8f04cbf"


//PURPOSE: Returns the modifier value for the specified mod
//RETURNS:
NATIVE FUNC INT GET_VEHICLE_MOD_MODIFIER_VALUE(VEHICLE_INDEX vehicle, MOD_TYPE modSlot, INT modIndex) = "0xd90d01d41407f76c"

//PURPOSE: Returns the identifier hash value for the specified mod
//RETURNS:
NATIVE FUNC INT GET_VEHICLE_MOD_IDENTIFIER_HASH(VEHICLE_INDEX vehicle, MOD_TYPE modSlot, INT modIndex) = "0x3e54ce58c7eb63b4"

//INFO:
//PARAM NOTES:
//PURPOSE: Return the requested camera position for the mod currently active in the given slot.
NATIVE FUNC MOD_CAMERA_POS GET_CAMERA_POSITION_FOR_MOD(VEHICLE_INDEX vehicle, MOD_TYPE modSlot) = "0xd1587801d4cf2472"

//INFO:
//PARAM NOTES:
//PURPOSE: Streams in a vehicle mod without setting it visually on the vehicle
NATIVE PROC PRELOAD_VEHICLE_MOD(VEHICLE_INDEX vehicle, MOD_TYPE modSlot, INT modIndex) = "0x7dd405d4677e064c"

//INFO:
//PARAM NOTES:
//PURPOSE: Streams in a vehicle mod without setting it visually on the vehicle
NATIVE FUNC BOOL HAS_PRELOAD_MODS_FINISHED(VEHICLE_INDEX vehicle) = "0x09d3ef67fa2e1e4b"

//INFO:
//PARAM NOTES:
//PURPOSE: Streams in a vehicle mod without setting it visually on the vehicle
NATIVE PROC RELEASE_PRELOAD_MODS(VEHICLE_INDEX vehicle) = "0x781a6ec21b72b52e"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if the specified vehicle can be modded 
NATIVE FUNC BOOL CAN_VEHICLE_BE_MODDED(VEHICLE_INDEX vehicle) = "0xe0cc93e11fa599c5"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the tyre smoke color
NATIVE PROC SET_VEHICLE_TYRE_SMOKE_COLOR(VEHICLE_INDEX vehicle, INT red, INT green, INT blue) = "0xfef0c9a733c7b609"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the tyre smoke color
NATIVE PROC GET_VEHICLE_TYRE_SMOKE_COLOR(VEHICLE_INDEX vehicle, INT &red, INT &green, INT &blue) = "0x2ee88eb83af61b18"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the window tint color index.
NATIVE PROC SET_VEHICLE_WINDOW_TINT(VEHICLE_INDEX vehicle, INT colorIndex) = "0x2eb7787881686751"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the window tint color index.
NATIVE FUNC INT GET_VEHICLE_WINDOW_TINT(VEHICLE_INDEX vehicle) = "0xf9d204d7598c0239"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the number of window tints available, global for all vehicles
NATIVE FUNC INT GET_NUM_VEHICLE_WINDOW_TINTS() = "0x847f16ba535b65c8"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the vehicle color in r/g/b components
NATIVE PROC GET_VEHICLE_COLOR(VEHICLE_INDEX vehicle, INT &Red, INT &Green, INT &Blue) = "0xc320571daaedfaab"

//PURPOSE: Returns a bitset that shows which colours will have a visible effect when you call one of 
//			the "set colour" commands. Use IS_BIT_SET 0,1,2,3,4 for Colours 1,2,3,4,5
NATIVE FUNC INT GET_VEHICLE_COLOURS_WHICH_CAN_BE_SET(VEHICLE_INDEX vehicle) = "0xe4a58617db957843"

//INFO:
//PARAM NOTES:
//PURPOSE: Adds a vehicle combat avoidance area
NATIVE FUNC VEHICLE_COMBAT_AVOIDANCE_AREA_INDEX ADD_VEHICLE_COMBAT_ANGLED_AVOIDANCE_AREA(VECTOR vStart, VECTOR vEnd, FLOAT fWidth) = "0x6d025f93a22a9d4f"

//INFO:
//PARAM NOTES:
//PURPOSE: Adds a vehicle combat avoidance area
NATIVE FUNC VEHICLE_COMBAT_AVOIDANCE_AREA_INDEX ADD_VEHICLE_COMBAT_SPHERE_AVOIDANCE_AREA(VECTOR vCenter, FLOAT fRadius) = "0x9c4ee7d7129a411f"

//INFO:
//PARAM NOTES:
//PURPOSE: Removes a vehicle combat avoidance area
NATIVE PROC REMOVE_VEHICLE_COMBAT_AVOIDANCE_AREA(VEHICLE_COMBAT_AVOIDANCE_AREA_INDEX iIndex) = "0xdf86fbfcd72e39e9"

//INFO:
//PARAM NOTES:
//PURPOSE: Clears all vehicle combat avoidance areas
NATIVE PROC CLEAR_VEHICLE_COMBAT_AVOIDANCE_AREAS() = "0x3ef3f0ba14f3add4"

//INFO:
//PARAM NOTES:
//PURPOSE: Please dont use this before speaking to Phil H
NATIVE PROC SET_VEHICLE_CHEAT_POWER_INCREASE(VEHICLE_INDEX vehicle, FLOAT Increase) = "0x8f7d5ed5832ac0aa"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets whether or not a vehicle has an effect on the wanted level if that vehicle is specified as the "victim"
NATIVE PROC SET_VEHICLE_INFLUENCES_WANTED_LEVEL(VEHICLE_INDEX VehicleIndex, BOOL bInfluenceWantedLevel) = "0x67e2c3dcb85cced2"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets whether or not a vehicle is wanted. Cops can identify peds in wanted vehicles easier
NATIVE PROC SET_VEHICLE_IS_WANTED(VEHICLE_INDEX VehicleIndex, BOOL bIsWanted) = "0x5c7a358e1c48def4"

//~>                                   Boat Boom commands                             <~

//INFO: Swing the boat boom outwards
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SWING_OUT_BOAT_BOOM(VEHICLE_INDEX VehicleIndex) = "0x0c8e58638d9e3a59"
        
//INFO: Swing the boat boom in
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SWING_IN_BOAT_BOOM(VEHICLE_INDEX VehicleIndex) = "0x8f5d42a1e0060075"

//INFO: Swing the boat boom to ratio
//PARAM NOTES:angle ratio between 0 and 1
//PURPOSE: 
NATIVE PROC SWING_BOAT_BOOM_TO_RATIO(VEHICLE_INDEX VehicleIndex, FLOAT fTargetRatio) = "0xfb72e02a4b6d025b"

//INFO: Allow the boat boom to swing freely
//PARAM NOTES: pass in true to swing freely or false so it moves to whatever the current desired ratio is
//PURPOSE: 
NATIVE PROC SWING_BOAT_BOOM_FREELY(VEHICLE_INDEX VehicleIndex, BOOL bSwingFreely) = "0xe96af53282be9e05"

//INFO: Allow the boat boom to be animated, this means the boom moves exactly with the animation played on it
//PARAM NOTES: pass in true to allow animationa dn false to turn it off. Please turn this off after the anim has played
//PURPOSE: 
NATIVE PROC ALLOW_BOAT_BOOM_TO_ANIMATE(VEHICLE_INDEX VehicleIndex, BOOL bSwingFreely) = "0x0269717aa3500f6b"

//INFO:
//PARAM NOTES:
//PURPOSE: Get the current position ratio of the boat boom
NATIVE FUNC FLOAT GET_BOAT_BOOM_POSITION_RATIO(VEHICLE_INDEX VehicleIndex) = "0x48ce4aa48303ad3a"

//INFO:
//PARAM NOTES:
//PURPOSE: Set this vehicle to use alternate handling
NATIVE PROC SET_VEHICLE_USE_ALTERNATE_HANDLING(VEHICLE_INDEX VehicleIndex, BOOL bUseAlternateHandling) = "0xfdca79f3a2039825"

//INFO: Find if the rider's feet are off the ground from the given bike
//PARAM NOTES:
//PURPOSE: Return if the rider's feet are off the ground
NATIVE FUNC BOOL GET_BIKERS_FEED_OFF_GROUND(VEHICLE_INDEX vehicle) = "0xb2ccec9990e461e2"

//INFO: Set a given bike to be on it's kick stand
//PARAM NOTES:
//PURPOSE: Used to override default steer and lean angles for bikes on stands
NATIVE PROC SET_BIKE_ON_STAND(VEHICLE_INDEX vehicle, FLOAT SteerAngle, FLOAT LeanAngle) = "0x003aa43765a7e9bf"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a vehicle so that it can't be stealable by an ambient ped.
NATIVE PROC SET_VEHICLE_NOT_STEALABLE_AMBIENTLY(VEHICLE_INDEX vehicle, BOOL bStealable) = "0xfa37094e2df03e75"

//INFO: 
//PARAM NOTES:
//PURPOSE: Locks all the vehicle doors when it is marked as no longer needed
NATIVE PROC LOCK_DOORS_WHEN_NO_LONGER_NEEDED(VEHICLE_INDEX vehicle) = "0x64c030791cea9715"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the player interesting vehicle which will be kept around in the world for longer than regular vehicles
NATIVE PROC SET_LAST_DRIVEN_VEHICLE(VEHICLE_INDEX vehicle) = "0x7a75dc202144accf"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the player interesting vehicle
NATIVE FUNC VEHICLE_INDEX GET_LAST_DRIVEN_VEHICLE() = "0x78291c96efbbdc75"

//INFO: 
//PARAM NOTES:
//PURPOSE: Clears reference to the player interesting vehicle so it can be removed from the world
NATIVE PROC CLEAR_LAST_DRIVEN_VEHICLE() = "0xb6e0e11dc88e5013"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the vehicle flag which records whether this vehicle has been driven.
// Scripted/cargen vehicles which have not yet been driven are not cleaned up so aggressively as those which have been driven & then abandoned.
NATIVE PROC SET_VEHICLE_HAS_BEEN_DRIVEN_FLAG(VEHICLE_INDEX vehicle, BOOL bState) = "0xddee81f50a761f49"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the min height above the terrain on current taskvehiclegototask if it's currently running
NATIVE PROC SET_TASK_VEHICLE_GOTO_PLANE_MIN_HEIGHT_ABOVE_TERRAIN(VEHICLE_INDEX vehicle, INT iMinHeightAboveTerrain) = "0x1195689fecae45c7"
 
//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a lod multiplier for the given vehicle. Start by using low values (1.1, 1.5, etc) until the wanted result is achieved. Large values are not appropriate and will be expensive!
NATIVE PROC SET_VEHICLE_LOD_MULTIPLIER(VEHICLE_INDEX vehicle, FLOAT multiplier) = "0x09042d5723106b97"

//INFO: 
//PARAM NOTES:
//PURPOSE: Clamps the highest lod the specified vehicle can render.
// A clamp value of 0 will allow lod 0 (the highest detailed lod) to render but will not stream in any HD assets.
// A clamp value of 1 will only render the medium lod (lod 1) as the highest one, etc.
NATIVE PROC SET_VEHICLE_LOD_CLAMP(VEHICLE_INDEX vehicle, INT clamp) = "0x55027d576b3ab452"

//INFO: 
//PARAM NOTES: Vehicle index
//PURPOSE: Get the number of broken off parts from the given vehicle, include doors, bumpers, bonnets, etc
NATIVE FUNC INT GET_VEHICLE_NUM_OF_BROKEN_OFF_PARTS(VEHICLE_INDEX vehicle) = "0x2ad597af2ba2c3ba"

//INFO: 
//PARAM NOTES:
//PURPOSE: Specifies if the given vehicles can be saved in a garage or not, should be used for special mission vehicles
NATIVE PROC SET_VEHICLE_CAN_SAVE_IN_GARAGE(VEHICLE_INDEX vehicle, BOOL canSave) = "0x0fcb0a306ff51eca"

//INFO: 
//PARAM NOTES: Vehicle index
//PURPOSE: Gets the number of loosen parts from the given vehicle, include any knocked open doors, bonnets or bouncy bumpers
NATIVE FUNC INT GET_VEHICLE_NUM_OF_BROKEN_LOOSEN_PARTS(VEHICLE_INDEX vehicle) = "0xce3ff89646c9c806"

//INFO: 
//PARAM NOTES:
//PURPOSE: Force the engine to be damaged when vehicle gets hit by bullet at any position
NATIVE PROC SET_FORCE_VEHICLE_ENGINE_DAMAGE_BY_BULLET(VEHICLE_INDEX vehicle, BOOL forceEngineDamage) = "0x8753d1a4e2a2cfc1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Force the car to blow up when all its wheels are missing.
NATIVE PROC SET_CAR_BLOWS_UP_WHEN_MISSING_ALL_WHEELS(VEHICLE_INDEX vehicle, BOOL blowUpWhenMissingAllWheels) = "0xb2ee455af6505db7"

//INFO:
//PARAM NOTES:
//PURPOSE: Mark the vehicle as one that can generate engine related shocking events such as CEventPlaneFlyBy or CEventShockingHelicopterOverhead
NATIVE PROC SET_VEHICLE_GENERATES_ENGINE_SHOCKING_EVENTS(VEHICLE_INDEX vehicle, BOOL allowedToGenerateEvents) = "0x2b1869f1a1d940f8"

//INFO:
//PARAM NOTES:
//PURPOSE: Modify the radius at which a vehicle will automatically try and bring in path nodes.
//Default for mission vehicles is 300, and anything lower than this value will be ignored
//PLEASE use sparingly
NATIVE PROC SET_VEHICLE_CUSTOM_PATH_NODE_STREAMING_RADIUS(VEHICLE_INDEX vehicle, FLOAT Radius) = "0xe5972da7f32861af"

//INFO: 
//PARAM NOTES: Vehicle have to be different
//PURPOSE: copy damages and move decals from one vehicle to another
NATIVE PROC COPY_VEHICLE_DAMAGES(VEHICLE_INDEX srcVehicle, VEHICLE_INDEX dstVehicle) = "0xd9734ad3534a452f"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Disables parts breaking off during vehicle explosion. Helps in reducing cost of physics
//			This should be called every frame as the code re-enables this in every frame
NATIVE PROC DISABLE_VEHICLE_EXPLOSION_BREAK_OFF_PARTS() = "0x6635bfd11849c0a5"

//INFO: 
//PARAM NOTES: value in metres
//PURPOSE: sets the cutoff distance tweak for lights
NATIVE PROC SET_LIGHTS_CUTOFF_DISTANCE_TWEAK(FLOAT dist) = "0xd3c7df69c235a6d3"

//INFO:  
//PARAM NOTES:	pedIndex: the ped in the vehicle.
//				targetEntity: fire at this entity if not NULL. 
//				vecTargetCoors: fire at this location if it's not <<0.0, 0.0, 0.0>> and the target entity is NULL. Ignore this if the target entity is not NULL. 
//PURPOSE: Fire the ped's current vehicle weapon. It will fire the bullets or rockets in the direction of vehicle is facing if the target entity is NULL and target location is <<0.0, 0.0, 0.0>>. 
NATIVE PROC SET_VEHICLE_SHOOT_AT_TARGET(PED_INDEX pedIndex, ENTITY_INDEX targetEntity, VECTOR vecTargetCoors) = "0x91909f6b2950d5a4"

//INFO:
//PARAM NOTES:	The ENTITY_INDEX of the target of the target vehicle is aiming at.
//	
//PURPOSE:		Returns TRUE if the vehicle is locked on to a valid entity
NATIVE FUNC BOOL GET_VEHICLE_LOCK_ON_TARGET( VEHICLE_INDEX vehicleIndex, ENTITY_INDEX& EntityIndex ) = "0xa774c52677e02d95"
		
//INFO: 
//PARAM NOTES: vehicle index and value to either force or stopf orcign HD assets
//PURPOSE: Flags the specified vehicle to always render the HD assets if passed in true
NATIVE PROC SET_FORCE_HD_VEHICLE(VEHICLE_INDEX vehicleIndex, BOOL forceHd) = "0x44b7e38f69d1e462"

/// PURPOSE:
///    Returns the type of plates the vehicle has
/// PARAMS:
///    index - vehicle entity index
/// RETURNS:
///    Type of plates the vehicle has
NATIVE FUNC VEHICLE_PLATE_TYPE GET_VEHICLE_PLATE_TYPE(VEHICLE_INDEX vehicle) = "0x0634fde853d3cb3b"

/// PURPOSE:
///    Request visibility tracking for a vehicle
/// PARAMS:
///    vehicleIndex - Index of the vehicle to be tracked.
NATIVE PROC TRACK_VEHICLE_VISIBILITY(VEHICLE_INDEX vehicleIndex) = "0xe0a93e5adbed87de"

/// PURPOSE:
///    Request results of visibility tracking for a vehicle
///    return TRUE if visibile, FALSE if not.
/// PARAMS:
///    vehicleIndex - Index of the vehicle to be tracked.
NATIVE FUNC BOOL IS_VEHICLE_VISIBLE(VEHICLE_INDEX vehicleIndex) = "0xe390839fc176621d"

/// PURPOSE:
///    Force the vehicle staying inactive during the playback recording
/// PARAMS:
///    vehicleIndex - Index of the vehicle to be tracked.
///	   bForceInactive - Force the vehicle being inactive (or not).
NATIVE PROC SET_VEHICLE_INACTIVE_DURING_PLAYBACK(VEHICLE_INDEX vehicleIndex, BOOL bForceInactive) = "0x61a0ce40cdd0cf3e"

/// PURPOSE:
///    Force the vehicle staying active during the playback recording
/// PARAMS:
///    vehicleIndex - Index of the vehicle to be tracked.
///	   bForceActive - Force the vehicle being active (or not).
NATIVE PROC SET_VEHICLE_ACTIVE_DURING_PLAYBACK(VEHICLE_INDEX vehicleIndex, BOOL bForceActive) = "0x6ae2ded7bd7b93b8"

/// PURPOSE:
///    Checks if a vehicle can be repsrayed
/// PARAMS:
///    vehicleIndex - Index of the vehicle to be tracked.
NATIVE FUNC BOOL IS_VEHICLE_SPRAYABLE(VEHICLE_INDEX vehicleIndex) = "0xcdec1eee2f3b81f4"

/// PURPOSE:
///		Enable/disable the aircraft engine degrade
/// PARAMS:
///		vehicleIndex - Index of the vehicle.
///		bEnableDegrading - enable/disable engine degrading
NATIVE PROC SET_VEHICLE_ENGINE_CAN_DEGRADE(VEHICLE_INDEX vehicleIndex, BOOL bEnableDegrading) = "0x67829e7e051ca476"

/// PURPOSE:
///		Disable the dynamic update of the ambient scales on a vehicle
/// PARAMS:
///		vehicleIndex - Index of the vehicle.
///		iNaturalAmbientScale - value for the natural scale (between 0 and 255)
///		iArtificialAmbientscale - value for the artificial scale (between 0 and 255)
NATIVE PROC DISABLE_VEHCILE_DYNAMIC_AMBIENT_SCALES(VEHICLE_INDEX vehicleIndex, INT iNaturalAmbientScale, INT iArtificialAmbientscale) = "0xf4a87fa177976c03"

/// PURPOSE:
///		Enable the dynamic update of the ambient scales on a vehicle
/// PARAMS:
///		vehicleIndex - Index of the vehicle.
NATIVE PROC ENABLE_VEHICLE_DYNAMIC_AMBIENT_SCALES(VEHICLE_INDEX vehicleIndex) = "0x52a9803bafa30601"

/// PURPOSE:
///		Query if plane's landing gear is intact
/// PARAMS:
///		vehicleIndex - Index of the vehicle.
NATIVE FUNC BOOL IS_PLANE_LANDING_GEAR_INTACT(VEHICLE_INDEX vehicleIndex) = "0x333a68465eab12b7"

/// PURPOSE:
///		Query if plane's propellers are intact
/// PARAMS:
///		vehicleIndex - Index of the vehicle.
NATIVE FUNC BOOL ARE_PLANE_PROPELLERS_INTACT(VEHICLE_INDEX vehicleIndex) = "0x386b922b324dadee"

/// PURPOSE:
///		Sets the health of the propellers on a plane
/// PARAMS:
///		vehicleIndex - Index of the vehicle.
///		health - the health value to set
NATIVE FUNC BOOL SET_PLANE_PROPELLER_HEALTH(VEHICLE_INDEX vehicleIndex, FLOAT health) = "0x5db16eb519ae4f6d"

/// PURPOSE:
///		Allow/disable the wheel deformation
/// PARAMS:
///		vehicleIndex - Index of the vehicle.
///		bCanDeformWheels - enable/disable wheel deformation
NATIVE PROC SET_VEHICLE_CAN_DEFORM_WHEELS(VEHICLE_INDEX vehicleIndex, BOOL bCanDeformWheels) = "0x2ab75bba1381e289"

/// PURPOSE:
///		Check if a vehicle is considered stolen
/// PARAMS:
///		vehicleIndex - Index of the vehicle.
NATIVE FUNC BOOL IS_VEHICLE_STOLEN(VEHICLE_INDEX vehicleIndex) = "0x8b56dbbe237edf1f"

/// PURPOSE:
///		Toggle whether a vehicle is considered stolen
/// PARAMS:
///		vehicleIndex - Index of the vehicle.
///		bIsStolen - value
NATIVE PROC SET_VEHICLE_IS_STOLEN(VEHICLE_INDEX vehicleIndex, BOOL bIsStolen) = "0x4fa753674d81bf2e"

/// PURPOSE:
///		Allow/disable ambient vehicles pathing around adverse conditions
/// PARAMS:
///		bAllow - Whether to enable it or not (default is TRUE / enabled)
/// NOTES: Depricated, this function no longer does anything, left in to not break scripts
NATIVE PROC ALLOW_AMBIENT_VEHICLES_TO_AVOID_ADVERSE_CONDITIONS(BOOL bAllow) = "0x4cdbb300386d729e"

/// PURPOSE:
///		Allow script to control the turbulence scale
/// PARAMS:
///		vehicleIndex - Index of the vehicle.
///		bVal - turbulence scale
NATIVE PROC SET_PLANE_TURBULENCE_MULTIPLIER(VEHICLE_INDEX vehicleIndex, FLOAT bVal) = "0xfcf9858c931e0022"

/// PURPOSE:
///    Checks if a wings of plane are intact
/// PARAMS:
///    vehicleIndex - Index of the vehicle to be tracked.
NATIVE FUNC BOOL ARE_WINGS_OF_PLANE_INTACT(VEHICLE_INDEX vehicleIndex) = "0xb5d888782d450a38"

/// PURPOSE:
///    Detach the vehicle from cargobob
/// PARAMS:
NATIVE PROC DETACH_VEHICLE_FROM_CARGOBOB(VEHICLE_INDEX cargobobIndex, VEHICLE_INDEX vehicleIndex) = "0x752b2d45ee2ff015"

/// PURPOSE:
///    Detach the vehicle from any cargobob
/// PARAMS:
NATIVE FUNC BOOL DETACH_VEHICLE_FROM_ANY_CARGOBOB(VEHICLE_INDEX vehicleIndex) = "0xb27b37a448cca2fd"

/// PURPOSE:
///    Detach the entity from any cargobob
/// PARAMS:
NATIVE FUNC BOOL DETACH_ENTITY_FROM_CARGOBOB(VEHICLE_INDEX cargobobIndex, ENTITY_INDEX entityIndex) = "0x5f9ffbd75039cf11"

/// PURPOSE:
///    Is vehicle attached to cargobob
/// PARAMS:
NATIVE FUNC BOOL IS_VEHICLE_ATTACHED_TO_CARGOBOB(VEHICLE_INDEX cargobobIndex, VEHICLE_INDEX vehicleIndex) = "0xc25fbab58dc1031d"

/// PURPOSE:
///    Is entity attached to cargobob
/// PARAMS:
NATIVE FUNC BOOL IS_ENTITY_ATTACHED_TO_CARGOBOB(VEHICLE_INDEX cargobobIndex, VEHICLE_INDEX vehicleIndex) = "0x495d570cd2eec42b"

/// PURPOSE:
///    Return the vehicle index that is attached to cargobob
/// PARAMS:
NATIVE FUNC ENTITY_INDEX GET_VEHICLE_ATTACHED_TO_CARGOBOB(VEHICLE_INDEX cargobobIndex) = "0xb5c8c9a4385f1f4b"

/// PURPOSE:
///    Return the entity index that is attached to cargobob
/// PARAMS:
NATIVE FUNC ENTITY_INDEX GET_ENTITY_ATTACHED_TO_CARGOBOB(VEHICLE_INDEX cargobobIndex) = "0x96df8c50a64d66a8"

//INFO: Attaches a vehicle to a tow truck
//PARAM NOTES:
//PURPOSE: Attaches a vehicle to a cargobob at a bone with an offset from that bone, use -1 to do an offset against the whole vehicle
//		   This does not reposition the vehicles, please try and position the vehicle around 0.5m under the cargobob
NATIVE PROC ATTACH_VEHICLE_TO_CARGOBOB(VEHICLE_INDEX cargobobIndex, VEHICLE_INDEX VehicleIndex, INT VehicleBoneIndex, VECTOR VehicleAttachPointOffset) = "0xd9af6077705e4e5c"

//INFO: Attaches an entity to a cargobob
//PARAM NOTES:
//PURPOSE: Attaches an entity to a cargobob at a bone with an offset from that bone, use -1 to do an offset against the whole vehicle
//		   This does not reposition the entity, please try and position the entity around 0.5m under the cargobob
NATIVE PROC ATTACH_ENTITY_TO_CARGOBOB(VEHICLE_INDEX cargobobIndex, ENTITY_INDEX VehicleIndex, INT EntityBoneIndex, VECTOR VehicleAttachPointOffset) = "0x8820194facff8f5b"

//INFO: Sets an entity to never be picked up by a specific cargobob
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_CARGOBOB_FORCE_DONT_DETACH_VEHICLE(VEHICLE_INDEX cargobobIndex, BOOL bNoDetach) = "0x8c7f8ce503fca873"

//INFO: Attaches an entity to a cargobob
//PARAM NOTES:
//PURPOSE: Sets a flag that forces a vehicle to not be detached from the cargobob even if there are collisions
NATIVE PROC SET_CARGOBOB_EXCLUDE_FROM_PICKUP_ENTITY(VEHICLE_INDEX cargobobIndex, ENTITY_INDEX EntityIndex) = "0xc6f3ddf3187e4494"

//INFO: Returns whether the given entity can be pickup up by the cargobob
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL CAN_CARGOBOB_PICK_UP_ENTITY(VEHICLE_INDEX cargobobIndex, ENTITY_INDEX EntityIndex) = "0x4291d19bdeb13f01"

/// PURPOSE:
///    Return position of attached pick up hook. Will assert if no pick up rope attached
/// PARAMS:
NATIVE FUNC VECTOR GET_ATTACHED_PICK_UP_HOOK_POSITION(VEHICLE_INDEX vehicleIndex) = "0x7e2eacab40c87020"

/// PURPOSE:
///    Check if cargobob has pick up rope
/// PARAMS:
NATIVE FUNC BOOL DOES_CARGOBOB_HAVE_PICK_UP_ROPE(VEHICLE_INDEX cargobobIndex) = "0xe420a4190e3e41aa"

/// PURPOSE:
///    Generate the pick up rope for cargobob
/// PARAMS:
NATIVE PROC CREATE_PICK_UP_ROPE_FOR_CARGOBOB(VEHICLE_INDEX cargobobIndex, PICKUP_GADGET_TYPE pickupType = PICKUP_HOOK) = "0xd4113ee2bf196c99"

/// PURPOSE:
///    remove the pick up rope for cargobob
/// PARAMS:
NATIVE PROC REMOVE_PICK_UP_ROPE_FOR_CARGOBOB(VEHICLE_INDEX cargobobIndex) = "0x12bef18a46d6ab20"

/// PURPOSE:
///    Generate the pick up rope for cargobob
/// PARAMS:
///		detachedRopeLength - Desired rope length when nothing is attached to the rope
///		attachedRopeLength - Desired rope length when rope is attached to something
NATIVE PROC SET_PICKUP_ROPE_LENGTH_FOR_CARGOBOB(VEHICLE_INDEX cargobobIndex, FLOAT detachedRopeLength, FLOAT attachedRopeLength, BOOL bSetRopeLengthInstantly = false) = "0xceb7f0703415589d"

/// PURPOSE:
///    Generate the pick up rope for cargobob
/// PARAMS:
///		detachedRopeLength - Desired rope length when nothing is attached to the rope
///		attachedRopeLength - Desired rope length when rope is attached to something
NATIVE PROC SET_PICKUP_ROPE_LENGTH_WITHOUT_CREATING_ROPE_FOR_CARGOBOB(VEHICLE_INDEX cargobobIndex, FLOAT detachedRopeLength, FLOAT attachedRopeLength) = "0x4c545c35d0b0655b"

/// PURPOSE:
///	   Specifiy a multiplier that modifies the strength of the damping force applied to the entity attached to the pick-up rope.
/// PARAMS:
NATIVE PROC SET_CARGOBOB_PICKUP_ROPE_DAMPING_MULTIPLIER(VEHICLE_INDEX cargobobIndex, FLOAT dampingMult) = "0x03d8deff992b8869"

/// PURPOSE:
///	   Set what kind of pick-up rope gadget the cargobob will have when deployed.
/// PARAMS:
NATIVE PROC SET_CARGOBOB_PICKUP_ROPE_TYPE(VEHICLE_INDEX cargobobIndex, PICKUP_GADGET_TYPE type) = "0x2270c69ffec1fc93"

/// PURPOSE:
///    Determines if the given cargobob currently has a pick-up magnet gadget.
/// PARAMS:
NATIVE FUNC BOOL DOES_CARGOBOB_HAVE_PICKUP_MAGNET(VEHICLE_INDEX cargobobIndex) = "0xe9fbc1941336531b"

/// PURPOSE:
///    Change the magnet active state. When active, the magnet will pull in its target entity. When inactive, the magnet will have a reduced effect on nearby entities and will point at its current target.
/// PARAMS:
NATIVE PROC SET_CARGOBOB_PICKUP_MAGNET_ACTIVE(VEHICLE_INDEX cargobobIndex, BOOL active) = "0x4733e81aa7724c96"

/// PURPOSE:
///    Get the entity that the magnet is currently targeting (Might be nothing).
///	   In ambient mode, this will be the closest entity to the magnet. In targeted mode, it will be the entity specified as the target.
/// PARAMS:
NATIVE FUNC VEHICLE_INDEX GET_CARGOBOB_PICKUP_MAGNET_TARGET_ENTITY(VEHICLE_INDEX cargobobIndex) = "0xf73603492540f71d"

/// PURPOSE:
///    Set the overall strength of the magnet force that is applied to the entity that is being picked up.
/// PARAMS:
NATIVE PROC SET_CARGOBOB_PICKUP_MAGNET_STRENGTH(VEHICLE_INDEX cargobobIndex, FLOAT magnetStrength) = "0xb158ef3c34e943b3"

/// PURPOSE:
///    Set how the force magnitude drops off as the distance to the entity increases while the entity is being picked up.
/// PARAMS:
NATIVE PROC SET_CARGOBOB_PICKUP_MAGNET_FALLOFF(VEHICLE_INDEX cargobobIndex,  FLOAT magnetFalloff) = "0xbe43b65ce2f5e213"

/// PURPOSE:
///    Set the overall strength of the magnet force that is applied to entities in range of the magnet, but not being actively picked up.
/// PARAMS:
NATIVE PROC SET_CARGOBOB_PICKUP_MAGNET_REDUCED_STRENGTH(VEHICLE_INDEX cargobobIndex, FLOAT magnetStrength) = "0xdd6b1358a060226e"

/// PURPOSE:
///    Set how the reduced force magnitude drops off as the distance to an entity increases.
/// PARAMS:
NATIVE PROC SET_CARGOBOB_PICKUP_MAGNET_REDUCED_FALLOFF(VEHICLE_INDEX cargobobIndex,  FLOAT magnetFalloff) = "0xb196a05e5f7f0973"

/// PURPOSE:
///    Set how strongly the magnet pulls itself towards the nearest entity.
/// PARAMS:
NATIVE PROC SET_CARGOBOB_PICKUP_MAGNET_PULL_STRENGTH(VEHICLE_INDEX cargobobIndex, FLOAT magnetPullStrength) = "0xea199d281ab3bdab"

/// PURPOSE:
///	   Set how much extra rope will be provided to allow the magnet to pull itself to the nearest entity.
/// PARAMS:
NATIVE PROC SET_CARGOBOB_PICKUP_MAGNET_PULL_ROPE_LENGTH(VEHICLE_INDEX cargobobIndex,  FLOAT magnetPullRopeLength) = "0x7eab90e2985f7b78"

/// PURPOSE:
///    Set the magnet to only affect the given entity.
/// PARAMS:
NATIVE PROC SET_CARGOBOB_PICKUP_MAGNET_SET_TARGETED_MODE(VEHICLE_INDEX cargobobIndex, ENTITY_INDEX targetEntity) = "0xefd6209466add5a7"

/// PURPOSE:
///    Set the magnet to affect all objects and/or vehicles.
/// PARAMS:
NATIVE PROC SET_CARGOBOB_PICKUP_MAGNET_SET_AMBIENT_MODE(VEHICLE_INDEX cargobobIndex, BOOL affectsVehicles, BOOL affectsObjects) = "0x817b28edf0a1fc78"

/// PURPOSE:
///    Set whether an entity that is picked up by the magnet will always blend to an upright position after getting attached.
/// PARAMS:
NATIVE PROC SET_CARGOBOB_PICKUP_MAGNET_ENSURE_PICKUP_ENTITY_UPRIGHT(VEHICLE_INDEX cargobobIndex, BOOL ensureEntityUpright) = "0xfb5f118c8166d363"

/// PURPOSE:
///    Set the size of the sphere that defines the area of effect for the magnet.
/// PARAMS:
NATIVE PROC SET_CARGOBOB_PICKUP_MAGNET_EFFECT_RADIUS(VEHICLE_INDEX cargobobIndex, FLOAT radius) = "0x05d6ee9c7eb75e5b"

/// PURPOSE:
///    Check if a vehicle has weapons
/// PARAMS:
NATIVE FUNC BOOL DOES_VEHICLE_HAVE_WEAPONS(VEHICLE_INDEX vehicleIndex) = "0x35cef967158ab23d"

/// PURPOSE:
///    Enable/Disable vehicle weapon, if PED_INDEX isn't null then the next vehicle weapon will be equipt. 
/// PARAMS:
NATIVE PROC DISABLE_VEHICLE_WEAPON(BOOL disable, WEAPON_TYPE TypeOfWeapon, VEHICLE_INDEX vehicleIndex, PED_INDEX PedIndex) = "0x314a88deaa6f4ac8"

/// PURPOSE:
///    Returns whether a given weapon hash has been disabled on a vehicle by the DISABLE_VEHICLE_WEAPON native.
/// PARAMS:
NATIVE FUNC BOOL IS_VEHICLE_WEAPON_DISABLED(WEAPON_TYPE TypeOfWeapon, VEHICLE_INDEX vehicleIndex, PED_INDEX PedIndex) = "0xca3044631d47dc92"

//INFO: 
//PARAM NOTES:
//PURPOSE: Mark the vehicle as used for pilot school
NATIVE PROC SET_VEHICLE_USED_FOR_PILOT_SCHOOL(VEHICLE_INDEX vehicle, BOOL isUsedForPilotSchool) = "0xdf38220db6f7f01b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Mark the vehicle being active for the ped navigation
NATIVE PROC SET_VEHICLE_ACTIVE_FOR_PED_NAVIGATION(VEHICLE_INDEX vehicle, BOOL isActive) = "0x9b63dbe83030b207"

/// PURPOSE:
///    Returns the class of the specified vehicle
/// PARAMS:
NATIVE FUNC VEHICLE_CLASS GET_VEHICLE_CLASS(VEHICLE_INDEX vehicleIndex) = "0xac23c79ca02f144e"

/// PURPOSE:
///    Returns the class of the specified vehicle
/// PARAMS:
NATIVE FUNC VEHICLE_CLASS GET_VEHICLE_CLASS_FROM_NAME(MODEL_NAMES ModelHashKey) = "0x3dec1c3f21ae4d70"

/// PURPOSE:
///    Registers the players vehicle as interesting
/// PARAMS:
NATIVE PROC SET_PLAYERS_LAST_VEHICLE(VEHICLE_INDEX vehicleIndex) = "0x583aa2db1278b578"

//INFO: 
//PARAM NOTES:
//PURPOSE: Allows the vehicle to be used by fleeing peds
NATIVE PROC SET_VEHICLE_CAN_BE_USED_BY_FLEEING_PEDS(VEHICLE_INDEX vehicle, BOOL canBeUsed) = "0x34d9c57cc5ce87ea"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the pilot skill noise scalar for given aircraft
NATIVE PROC SET_AIRCRAFT_PILOT_SKILL_NOISE_SCALAR(VEHICLE_INDEX vehicle, FLOAT scalar) = "0x52ef8b7f3d0a9ea8"

//PURPOSE: Flags the vehicle to drop cash pickups when blown up. Security vans do this by default.
NATIVE PROC SET_VEHICLE_DROPS_MONEY_WHEN_BLOWN_UP(VEHICLE_INDEX vehicle, BOOL dropsMoney) = "0xa2b9ae794c45034b"

//PURPOSE: Flags the vehicle to keep the engine on after being abandoned
NATIVE PROC SET_VEHICLE_KEEP_ENGINE_ON_WHEN_ABANDONED(VEHICLE_INDEX vehicle, BOOL keepEngineOn) = "0x63fb8fb0b9df030f"

//PURPOSE: Overrides the amount of time a vehicle will wait before thinking it's stuck on something.
//PARAM NOTES: Pass in -1 to reset to the default value (vehicle-dependent)
NATIVE PROC SET_VEHICLE_IMPATIENCE_TIMER(VEHICLE_INDEX vehicle, INT HandlingOverrideMs) = "0x84c04424d477a997"

ENUM HANDLING_INFOS
	HANDLING_SPORTS_CAR=-1532864817,
	HANDLING_AVERAGE=-1103972294,
	HANDLING_CRAP=-2056575896,
	HANDLING_TRUCK=1115750597
ENDENUM

//PURPOSE: Overrides the handling info for a given vehicle, so it will drive more aggressively
//			or conservatively than normal vehicles of that type
//PARAM NOTES: HandlingOverrideHash takes a member of the enum HANDLING_INFOS, defined above
NATIVE PROC SET_VEHICLE_HANDLING_OVERRIDE(VEHICLE_INDEX vehicle, HANDLING_INFOS HandlingOverrideHash) = "0xab92ea451f06cf1b"

//PURPOSE: Sets the extended removal range for the given vehicle, so that it wont be removed inside that range
//PARAM NOTES: removalRange is cast to a s16
NATIVE PROC SET_VEHICLE_EXTENDED_REMOVAL_RANGE(VEHICLE_INDEX vehicle, INT removalRange) = "0x22553d3793725f7b"

//PURPOSE: Set the steering bias scalar which can be used to change the steering bias amount when wheel gets shot
//PARAM NOTES:
NATIVE PROC SET_VEHICLE_STEERING_BIAS_SCALAR(VEHICLE_INDEX vehicle, FLOAT scalar) = "0xa0727ea79f309246"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the heli control lagging scalar; the control lags more with smaller value
NATIVE PROC SET_HELI_CONTROL_LAGGING_RATE_SCALAR(VEHICLE_INDEX vehicle, FLOAT scalar) = "0x316a18d1ac7b9ef4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Override the chassis collision friction, -1.0f to use normal contact friction. Resets every frame.
NATIVE PROC SET_VEHICLE_FRICTION_OVERRIDE(VEHICLE_INDEX vehicle, FLOAT frictionOverride) = "0xe1ae83af2dcc6161"

//INFO: 
//PARAM NOTES:
//PURPOSE: Allow wheels breaking off when car blows up
NATIVE PROC SET_VEHICLE_WHEELS_CAN_BREAK_OFF_WHEN_BLOW_UP(VEHICLE_INDEX vehicle, BOOL bCanWheelsBreakoff) = "0x1a63025eb01d5de9"

/// PURPOSE:
///		Query if plane's control panels are intact
/// PARAMS:
///		vehicleIndex - Index of the vehicle.
NATIVE FUNC BOOL ARE_PLANE_CONTROL_PANELS_INTACT(VEHICLE_INDEX vehicleIndex, BOOL bCheckForZeroHealth = false) = "0x77a329ae2223ddbc"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set ceiling height for given vihicle. Note, the height will be reset to default every frame
NATIVE PROC SET_VEHICLE_CEILING_HEIGHT(VEHICLE_INDEX vehicle, FLOAT fCeilingHeight) = "0x04bf67760881def1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Don't allow vehicle to take explosion damage from explosions generated by owner.
NATIVE PROC SET_VEHICLE_NO_EXPLOSION_DAMAGE_FROM_DRIVER(VEHICLE_INDEX vehicle, BOOL bNoDamage) = "0xddadb1f8557015d7"

//INFIO:
//PARAM NOTES:
//PURPOSE: Clear's a vehicle's route history
NATIVE PROC CLEAR_VEHICLE_ROUTE_HISTORY(VEHICLE_INDEX vehicle) = "0x603c50e35615a4c7"

//INFO: Returns whether a vehicle exists with the specified decorator
//PARAM NOTES: decorator label to check
//PURPOSE: Used to check for the existance of a vehicle with the specified decorator
NATIVE FUNC VEHICLE_INDEX DOES_VEHICLE_EXIST_WITH_DECORATOR(STRING DecoratorLabel) = "0x5c12ab3d0be16d1a"

//INFIO:
//PARAM NOTES:
//PURPOSE: Allow AI to use seats locked to players
NATIVE PROC SET_VEHICLE_AI_CAN_USE_EXCLUSIVE_SEATS(VEHICLE_INDEX vehicle, bool canUse) = "0xc7050f5ac2f8481e"

//INFIO:
//PARAM NOTES:
//PURPOSE: Lock a vehicle to a specific driver.
NATIVE PROC SET_VEHICLE_EXCLUSIVE_DRIVER(VEHICLE_INDEX vehicle, PED_INDEX PedIndex, INT driverIndex = 0) = "0x948c8d759cb6bcfe"

//INFO:
//PARAM NOTES:
//PURPOSE: See if this ped is the exclusive driver of the vehicle and also return which driver index the ped has been set as
NATIVE FUNC BOOL IS_PED_EXCLUSIVE_DRIVER_OF_VEHICLE(VEHICLE_INDEX vehicle, PED_INDEX PedIndex, INT& driverIndex) = "0x7525e83a62ae29dd"

//INFIO:
//PARAM NOTES:
//PURPOSE: Disable a specific propeller of the given plane
NATIVE PROC DISABLE_INDIVIDUAL_PLANE_PROPELLER(VEHICLE_INDEX vehicle, INT propellerIndex) = "0x54c298c51182b8ac"

//INFIO:
//PARAM NOTES:
//PURPOSE: Forces the jet afterburner to be on
NATIVE PROC SET_VEHICLE_FORCE_AFTERBURNER(VEHICLE_INDEX vehicle, BOOL bAfterburnerOn ) = "0xbf5b39c84ee2aea5"

//INFO:
//PARAM NOTES:
//PURPOSE: Stops vehicle glass from being processed - should enable this for vehicles with window protectors (see url:bugstar:3491749)
NATIVE PROC SET_DONT_PROCESS_VEHICLE_GLASS(VEHICLE_INDEX vehicle, BOOL val ) = "0x077fdc1a202b9273"

//INFO:
//PARAM NOTES:
//PURPOSE: Allows peds to drive through wanted cones without a response triggering
NATIVE PROC SET_DISABLE_WANTED_CONES_RESPONSE(VEHICLE_INDEX vehicle, BOOL val ) = "0xdf14057b445c4cb0"

//INFO:
//PARAM NOTES:
//PURPOSE: Makes helicopters use full desired cruise speed in Z axis to help land more accurately
NATIVE PROC SET_USE_DESIRED_Z_CRUISE_SPEED_FOR_LANDING(VEHICLE_INDEX vehicle, BOOL val ) = "0x9e172f1a73aacd6e"

//INFO:
//PARAM NOTES:
//PURPOSE: Allows to override distance at which the vehicle will stop (relative to target) when attacking it via Vehicle Persuit task (attack state)
NATIVE PROC SET_ARRIVE_DISTANCE_OVERRIDE_FOR_VEHICLE_PERSUIT_ATTACK(VEHICLE_INDEX vehicle, FLOAT fDist = -1.0 ) = "0x059021d4ac5801f4"

//INFO:
//PARAM NOTES:
//PURPOSE: Set the vehicle cleanup flag for the vehicle with the given index
NATIVE PROC SET_VEHICLE_READY_FOR_CLEANUP(VEHICLE_INDEX vehicle) = "0x2261db27aa9058b4"

//INFO:
//PARAM NOTES:
//PURPOSE: Turns distant cars on/off
NATIVE PROC SET_DISTANT_CARS_ENABLED(BOOL enable) = "0x21e9cc24def14473"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the colour of a car's neons
NATIVE PROC SET_VEHICLE_NEON_COLOUR(VEHICLE_INDEX VehicleIndex, INT Red, INT Green, INT Blue) = "0x74fcade93b81fd35"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the colour of a car's neons with vehicle colour index
NATIVE PROC SET_VEHICLE_NEON_INDEX_COLOUR(VEHICLE_INDEX VehicleIndex, INT ColorIdx) = "0xa8b24796d7f2734c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the colour of a car's neons.
NATIVE PROC GET_VEHICLE_NEON_COLOUR(VEHICLE_INDEX VehicleIndex, INT& Red, INT& Green, INT& Blue) = "0xedb21c30f1baf83a"

// Enum for each of the car's potenital neon lights
ENUM NEON_ID
    NEON_LEFT = 0,
    NEON_RIGHT,
    NEON_FRONT,
    NEON_BACK
ENDENUM

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether a car's particular neon is enabled
NATIVE PROC SET_VEHICLE_NEON_ENABLED(VEHICLE_INDEX VehicleIndex, NEON_ID eNeon, BOOL Enabled) = "0xbe69e921963a86b7"

//INFO: 
//PARAM NOTES:
//PURPOSE: gets whether a car's particular neon is enabled
NATIVE FUNC BOOL GET_VEHICLE_NEON_ENABLED(VEHICLE_INDEX VehicleIndex, NEON_ID eNeon) = "0x6ca60a8ee52231d2"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SUPPRESS_NEONS_ON_VEHICLE(VEHICLE_INDEX VehicleIndex, BOOL Suppressed) = "0x5f5a7d81d3817e5e"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL ARE_NEONS_ON_VEHICLE_SUPPRESSED(VEHICLE_INDEX VehicleIndex) = "0x56a5051d46b63553"

//PURPOSE: Disable the SuperDummy LOD mode for the given vehicle.
NATIVE PROC SET_DISABLE_SUPERDUMMY(VEHICLE_INDEX vehicle, BOOL disabled) = "0x085065fb04601e74"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether ambient cars can spawn with neon lights enabled
NATIVE PROC SET_AMBIENT_VEHICLE_NEON_ENABLED(BOOL Enabled) = "0xab92ed80a05c5258"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets whether ambient cars can spawn with neon lights enabled
NATIVE FUNC BOOL GET_AMBIENT_VEHICLE_NEON_ENABLED() = "0xa7be15040bd6b772"

//INFO: 
//PARAM NOTES:
//PURPOSE: requests a vehicle's dials for the current frame
NATIVE PROC REQUEST_VEHICLE_DIAL(VEHICLE_INDEX vehicle) = "0xa5b263a8703e8d01"

//INFO: 1000.0 = full,  0.0 = damaged
//          When body health drops to 0, the vehicle is very vulnerable to damage
//PARAM NOTES:
//PURPOSE: Get body health for a vehicle.
NATIVE FUNC FLOAT GET_VEHICLE_BODY_HEALTH(VEHICLE_INDEX VehicleIndex) = "0x29bc8ced19e45cc0"

//INFO: 1000.0 = full,  0.0 = damaged
//          When body health drops to 0, the vehicle is very vulnerable to damage
//PARAM NOTES:
//PURPOSE: Set body health for a vehicle.
NATIVE PROC SET_VEHICLE_BODY_HEALTH(VEHICLE_INDEX VehicleIndex, FLOAT health) = "0x8789481e090bf20c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the amount the suspension has been lowered by mods
NATIVE FUNC FLOAT GET_FAKE_SUSPENSION_LOWERING_AMOUNT(VEHICLE_INDEX VehicleIndex) = "0x382b07f45aacd5bc"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set high speed bump movement multiplier, 1.0 = full, 0.0 = disabled
NATIVE PROC SET_CAR_HIGH_SPEED_BUMP_SEVERITY_MULTIPLIER(FLOAT multiplier) = "0x1f7f46e954008f0c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Calculates the vehicle health as a percentage taking into account body health, engine health and petrol tank health and ensures the health is 0% when the vehicle is undriveable.
NATIVE FUNC FLOAT GET_VEHICLE_HEALTH_PERCENTAGE(VEHICLE_INDEX VehicleIndex, FLOAT maxEngineHealth = 1000.0, FLOAT maxPetrolTankHealth = 1000.0, FLOAT maxHealth = 1000.0, FLOAT maxMainRotorHealth = 1000.0, FLOAT maxRearRotorHealth = 1000.0, FLOAT maxTailBoomHealth = 1000.0) = "0xf3778f4a893d38e2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns whether this vehicle has been spawned as a mercenary
NATIVE FUNC BOOL GET_VEHICLE_IS_MERCENARY(VEHICLE_INDEX VehicleIndex) = "0xec74d8986996234a"

//PURPOSE: Get the number of doors of the given vehicle
NATIVE FUNC INT GET_NUMBER_OF_VEHICLE_DOORS(VEHICLE_INDEX VehicleIndex) = "0x6c3517e064234913"

//INFO: 
//PARAM NOTES: bRaise, true - raise all the suspension, false - lower all the suspension
//PURPOSE: Control the hydralics suspension states
NATIVE PROC SET_HYDRAULICS_CONTROL(VEHICLE_INDEX VehicleIndex, bool bRaise) = "0x8c00b426d81e26ba"

//INFIO:
//PARAM NOTES:
//PURPOSE: Forces the jet afterburner to be on
NATIVE PROC SET_VEHICLE_BROKEN_PARTS_DONT_AFFECT_AI_HANDLING(VEHICLE_INDEX vehicle, BOOL bIgnoreBrokenParts ) = "0x3c5b5e6395329033"

//INFIO:
//PARAM NOTES:
//PURPOSE: Sets whether or not the vehicle can use KERS
NATIVE PROC SET_VEHICLE_KERS_ALLOWED(VEHICLE_INDEX vehicle, BOOL bKERSAllowed ) = "0x14544d8fd0820f1f"

//INFIO:
//PARAM NOTES:
//PURPOSE: Returns whether this vehicle has a KERS system
NATIVE FUNC BOOL GET_VEHICLE_HAS_KERS(VEHICLE_INDEX vehicle) = "0xa70b4ea2ad8d6806"

//INFO:
//PARAM NOTES:
//PURPOSE: See if this vehicle is asleep
NATIVE FUNC BOOL IS_VEHICLE_ASLEEP(VEHICLE_INDEX vehicle) = "0x81552018d55d9f95"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set whether the vehicle will adjust its ground clearance as it moves at speed. This is always done for the player vehicle.
NATIVE PROC SET_CAN_ADJUST_GROUND_CLEARANCE(VEHICLE_INDEX VehicleIndex, bool bCanAdjust) = "0xdfb0bf9106595870"

//INFO:
//PARAM NOTES:
//PURPOSE: (MP Only) Plane can survive from 2 or more explosions when set
NATIVE PROC SET_PLANE_RESIST_TO_EXPLOSION(VEHICLE_INDEX vehicle, BOOL bResistToExplosion ) = "0x2e1d24379c889b21"

//INFO:
//PARAM NOTES:
//PURPOSE: (MP Only) Heli might survive from 2 or more explosions when set
NATIVE PROC SET_HELI_RESIST_TO_EXPLOSION(VEHICLE_INDEX vehicle, BOOL bResistToExplosion ) = "0x8074cc1886802912"

//INFO:
//PARAM NOTES:
//PURPOSE: Disables the extra forces applied to bicycles to allow them to do tricks
NATIVE PROC SET_DISABLE_BMX_EXTRA_TRICK_FORCES( BOOL bDisableExtraTrickForces ) = "0xb2ffdfebf8f94f36"

//INFO:
//PARAM NOTES:
//PURPOSE: Get the size of the given vehicle taking into account mod kits.
NATIVE PROC GET_VEHICLE_SIZE(VEHICLE_INDEX VehicleIndex, VECTOR &outSizeBoundsMin, VECTOR &outSizeBoundsMax) = "0x9225ae5215730c05"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the hydraulic suspension raise factor for one wheel
NATIVE PROC SET_HYDRAULIC_SUSPENSION_RAISE_FACTOR( VEHICLE_INDEX VehicleIndex, SC_WHEEL_LIST WheelNumber, FLOAT raiseFactor ) = "0x6587552e6995c1a3"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the hydraulic suspension raise factor for one wheel
NATIVE FUNC FLOAT GET_HYDRAULIC_SUSPENSION_RAISE_FACTOR( VEHICLE_INDEX VehicleIndex, SC_WHEEL_LIST WheelNumber ) = "0x4d64f9676fc057fb"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets whether the hydraulic suspension can be used or not
NATIVE PROC SET_CAN_USE_HYDRAULICS( VEHICLE_INDEX VehicleIndex, BOOL canUse ) = "0xe538576974378cb9"

ENUM WHEEL_HYDRAULIC_SCRIPT_STATE 
	HS_WHEEL_FREE = 0,
	HS_WHEEL_LOCKED,
	HS_WHEEL_BOUNCE,

	HS_ALL_FREE,
	HS_ALL_LOCK_UP,
	HS_ALL_LOCK_DOWN,
	HS_ALL_BOUNCE
ENDENUM

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the state of all the vehicle wheels
NATIVE PROC SET_HYDRAULIC_VEHICLE_STATE( VEHICLE_INDEX VehicleIndex, WHEEL_HYDRAULIC_SCRIPT_STATE state) = "0xac5c50178f2a2aea"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets whether the hydraulic state of one of the wheels
NATIVE PROC SET_HYDRAULIC_WHEEL_STATE( VEHICLE_INDEX VehicleIndex, SC_WHEEL_LIST WheelNumber, WHEEL_HYDRAULIC_SCRIPT_STATE state, FLOAT raiseAmount, FLOAT raiseSpeed ) = "0x76e092faf2ed7475"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns TRUE if entity with id 'entityIndex' has set vehicle on fire.
NATIVE FUNC BOOL HAS_VEHICLE_PETROLTANK_SET_ON_FIRE_BY_ENTITY( VEHICLE_INDEX VehicleIndex, ENTITY_INDEX entityIndex ) = "0xb0f79929922e2b71"

//INFO:
//PARAM NOTES:
//PURPOSE: Clear current vehicle petrol tank fire culprit (damager).
NATIVE PROC CLEAR_VEHICLE_PETROLTANK_FIRE_CULPRIT( VEHICLE_INDEX VehicleIndex ) = "0xc99d918a7123b872"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the velocity of the bobble head in the player's vehicle
NATIVE PROC SET_VEHICLE_BOBBLEHEAD_VELOCITY( VECTOR vecVelocity ) = "0xed180afe4c1d3f53"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if the vehicle is either in dummy or super dummy mode
NATIVE FUNC BOOL GET_VEHICLE_IS_DUMMY( VEHICLE_INDEX VehicleIndex ) = "0x3eb9c70ed5b40f55"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if the vehicle can be placed at this position without having to remove any existing vehicles
NATIVE FUNC BOOL TEST_VEHICLE_COORDS( VEHICLE_INDEX VehicleIndex, VECTOR VecNewCoors, BOOL bCheckBuildings = FALSE, BOOL bCheckVehicles = TRUE, BOOL bCheckPeds = TRUE, BOOL bCheckObjects = FALSE, BOOL bCheckDummies = FALSE, BOOL bUseBoundingBox = FALSE ) = "0xa239619e6d3e7fc3"

//INFO:
//PARAM NOTES:
//PURPOSE: Scales the amount of damage applied to the vehicle
NATIVE FUNC BOOL SET_VEHICLE_DAMAGE_SCALE( VEHICLE_INDEX VehicleIndex, float DamageScale ) = "0x083d28d7fa474397"

//INFO:
//PARAM NOTES:
//PURPOSE: Scales the amount of weapon damage applied to the vehicle
NATIVE FUNC BOOL SET_VEHICLE_WEAPON_DAMAGE_SCALE( VEHICLE_INDEX VehicleIndex, float DamageScale ) = "0x727aa8128642805a"

//INFO:
//PARAM NOTES:
//PURPOSE: disables collision damage between this vehicle and one it has picked up
NATIVE FUNC BOOL SET_DISABLE_DAMAGE_WITH_PICKED_UP_ENTITY( VEHICLE_INDEX VehicleIndex, bool DisableDamage ) = "0x2dc5c2b3129a25fd"

//INFO:
//PARAM NOTES:
//PURPOSE: Enable or disable the damage reduction multiplier (x0.5) we apply in MP when attacking a vehicle containing a player
NATIVE PROC SET_VEHICLE_USES_MP_PLAYER_DAMAGE_MULTIPLIER( VEHICLE_INDEX VehicleIndex, bool UseMultiplier ) = "0x252c1729e923ecd6"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets whether peds will stay on bikes after heavy landings.
NATIVE PROC SET_BIKE_EASY_TO_LAND( VEHICLE_INDEX VehicleIndex, bool EasyToLand ) = "0xcca20449c6ef3927"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets whether the vehicle is a beast vehicle
NATIVE PROC SET_BEAST_VEHICLE( VEHICLE_INDEX VehicleIndex, bool BeastVehicle ) = "0x9e1755d045373ace"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets whether to invert the vehicle controls
NATIVE PROC SET_INVERT_VEHICLE_CONTROLS( VEHICLE_INDEX VehicleIndex, bool InvertControls ) = "0xa556cfd86100d12a"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets whether to disabled the speed boost screen effect
NATIVE PROC SET_SPEED_BOOST_EFFECT_DISABLED( bool InvertControls ) = "0x2f58745217388192"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets whether to disabled the slow down screen effect
NATIVE PROC SET_SLOW_DOWN_EFFECT_DISABLED( bool InvertControls ) = "0xe3c83ff4290fbcd4"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the formation leader along with the position offset and radius
NATIVE PROC SET_FORMATION_LEADER( VEHICLE_INDEX VehicleIndex, VECTOR VecOffset, FLOAT radius ) = "0x14ef323c3c234bfa"

//INFO:
//PARAM NOTES:
//PURPOSE: Resets the formation leader
NATIVE PROC RESET_FORMATION_LEADER() = "0x76bd01f3fb33767b"

//INFO:
//PARAM NOTES:
//PURPOSE: returns true if the boat is capsized
NATIVE FUNC BOOL GET_IS_BOAT_CAPSIZED( VEHICLE_INDEX VehicleIndex ) = "0xee0ec71c8a5c5b6a"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets whether the special ramming scoop or ramp car code is applied to collisions with this vehicle
NATIVE PROC SET_ALLOW_RAMMING_SOOP_OR_RAMP( VEHICLE_INDEX VehicleIndex, bool allowed ) = "0xd045d56d95a3d704"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets how much to scale the impulse applied to vehicles hit by the ramp car
NATIVE PROC SET_SCRIPT_RAMP_IMPULSE_SCALE( VEHICLE_INDEX VehicleIndex, FLOAT impulseScale ) = "0x33d2ad0783fd0d43"

//INFO:
//PARAM NOTES:
//PURPOSE: returns true if the door is valid
NATIVE FUNC BOOL GET_IS_DOOR_VALID( VEHICLE_INDEX VehicleIndex, SC_DOOR_LIST DoorNumber ) = "0xf9b6a519028cd38c"

//INFO:
//PARAM NOTES:
//PURPOSE: sets the time it takes to recharge the rocket boost
NATIVE PROC SET_SCRIPT_ROCKET_BOOST_RECHARGE_TIME( VEHICLE_INDEX VehicleIndex, FLOAT rechargeTime ) = "0xddecedbe203e1057"

//INFO:
//PARAM NOTES:
//PURPOSE: returns true if a vehicle has a rocket boost
NATIVE FUNC BOOL GET_HAS_ROCKET_BOOST( VEHICLE_INDEX VehicleIndex ) = "0x4545af649bd80692"

//INFO:
//PARAM NOTES:
//PURPOSE: returns true if a vehicle is rocket boosting
NATIVE FUNC BOOL IS_ROCKET_BOOST_ACTIVE( VEHICLE_INDEX VehicleIndex ) = "0xd377cbcd474fdcfa"

//INFO:
//PARAM NOTES:
//		- BOOL ShouldBeActive - set to true if it should be activated, false if it should be deactivated
//PURPOSE: sets the time it takes to recharge the rocket boost
NATIVE PROC SET_ROCKET_BOOST_ACTIVE( VEHICLE_INDEX VehicleIndex, BOOL ShouldBeActive ) = "0x416220c999f84215"

//INFO:
//PARAM NOTES:
//PURPOSE: returns true if a vehicle has retractable wheels
NATIVE FUNC BOOL GET_HAS_RETRACTABLE_WHEELS( VEHICLE_INDEX VehicleIndex ) = "0xd4d74c1f667f85bf"

//Info:
//PARAM NOTES:
//PURPOSE: returns true if vehicle with retractable wheels has its wheels retracted
NATIVE FUNC BOOL GET_IS_WHEELS_RETRACTED( VEHICLE_INDEX VehicleIndex ) = "0xc3e9d5f4a9806ea3"

//Info:
//PARAM NOTES:
//PURPOSE sets the wheels to be extended instantly
NATIVE PROC SET_WHEELS_EXTENDED_INSTANTLY( VEHICLE_INDEX VehicleIndex ) = "0x077cc59992f9f853"

//Info:
//PARAM NOTES:
//PURPOSE sets the wheels to be retracted instantly
NATIVE PROC SET_WHEELS_RETRACTED_INSTANTLY( VEHICLE_INDEX VehicleIndex ) = "0xed10425ca9977820"

//Info:
//PARAM NOTES:
//PURPOSE returns true if a vehicle has jumping functionality
NATIVE FUNC BOOL GET_CAR_HAS_JUMP( VEHICLE_INDEX VehicleIndex ) = "0xe14cac0fa19d3f5d"

//Info:
//PARAM NOTES:
//PURPOSE sets the jumping car to use a higher jump
NATIVE PROC SET_USE_HIGHER_CAR_JUMP( VEHICLE_INDEX VehicleIndex, BOOL useHigherJump ) = "0xfc787cf19ed487e6"

//Info:
//PARAM NOTES:
//PURPOSE sets whether the vehicle freeze waiting on collision flag should be cleared when the player enters the vehicle
NATIVE PROC SET_CLEAR_FREEZE_WAITING_ON_COLLISION_ONCE_PLAYER_ENTERS( VEHICLE_INDEX VehicleIndex, BOOL ClearWaitingOnCollision ) = "0x41ec6688527c1c31"

//Info:
//PARAM NOTES: 
//		VehicleWeaponIndex - Between 0 and 3, corresponds to each weapon slot in the vehicle's handling.meta.
//		AmmoCount - When set positive, will count down with every fire and prevent firing at 0. Set -1 to disable restricted ammo.
//PURPOSE: Sets a limited number of ammo for a particular vehicle weapon index on a script vehicle.
NATIVE PROC SET_VEHICLE_WEAPON_RESTRICTED_AMMO( VEHICLE_INDEX VehicleIndex, INT VehicleWeaponIndex, INT AmmoCount ) = "0x97181d540a6bce59"

//Info:
//PARAM NOTES: 
//		VehicleWeaponIndex - Between 0 and 3, corresponds to each weapon slot in the vehicle's handling.meta.
//PURPOSE: Gets the current restricted ammo count for a particular vehicle weapon index on a script vehicle.
NATIVE FUNC INT GET_VEHICLE_WEAPON_RESTRICTED_AMMO( VEHICLE_INDEX VehicleIndex, INT VehicleWeaponIndex ) = "0x684bcc70f361bdc0"

//Info:
//PARAM NOTES:
//PURPOSE returns true if a vehicle has a parachute
NATIVE FUNC BOOL GET_VEHICLE_HAS_PARACHUTE( VEHICLE_INDEX VehicleIndex ) = "0x26ecb449f872b70c"

//Info:
//PARAM NOTES:
//PURPOSE returns true if it is possible to deploy a parachute
NATIVE FUNC BOOL GET_VEHICLE_CAN_DEPLOY_PARACHUTE( VEHICLE_INDEX VehicleIndex ) = "0x20a739ee22e77125"

//Info:
//PARAM NOTES:
//		AllowPlayerCancelParachute - if set to false, the player can not cancel parachuting by pressing the parachute button until they land. This gets reset when the player lands on the ground.
//PURPOSE Deploys the vehicle parachute.
NATIVE PROC VEHICLE_START_PARACHUTING( VEHICLE_INDEX VehicleIndex, BOOL AllowPlayerCancelParachuting = TRUE ) = "0xbcea7dc770ce00a9"

//Info:
//PARAM NOTES:
//PURPOSE returns true if a vehicle currently has a parachute deployed
NATIVE FUNC BOOL IS_VEHICLE_PARACHUTE_DEPLOYED( VEHICLE_INDEX VehicleIndex ) = "0xc47b53107bd90e9f"

//Info:
//PARAM NOTES:
//		TakeDamage - if set to false, the ramming and ramp cars will not take damage when used
//PURPOSE 
NATIVE PROC VEHICLE_SET_RAMP_AND_RAMMING_CARS_TAKE_DAMAGE( VEHICLE_INDEX VehicleIndex, BOOL TakeDamage ) = "0xcd98c8cea8a43820"

//Info:
//PARAM NOTES:
//		ApplySideImpulses - if set to true, vehicles going over the ramp will also be pushed to the side
//PURPOSE 
NATIVE PROC VEHICLE_SET_ENABLE_RAMP_CAR_SIDE_IMPULSE( VEHICLE_INDEX VehicleIndex, BOOL TakeDamage ) = "0xf5e968755c418569"

//Info:
//PARAM NOTES:
//		ApplySideImpulses - if set to true, vehicles going over the ramp will also be pushed to the side
//PURPOSE 
NATIVE PROC VEHICLE_SET_ENABLE_NORMALISE_RAMP_CAR_VERTICAL_VELOCTIY( VEHICLE_INDEX VehicleIndex, BOOL Normalise ) = "0x82262ff616167463"


//Info:
//PARAM NOTES:
//		Enable - if set to false then jet wash from the rocket car will no longer apply forces to other entities
//PURPOSE 
NATIVE PROC VEHICLE_SET_JET_WASH_FORCE_ENABLED( BOOL Enable ) = "0x1435be4ef74af35f"

//Info:
//PARAM NOTES:
//PURPOSE:	Allows homing vehicle weapons to target objects flagged by script with SET_OBJECT_TARGETTABLE
NATIVE PROC SET_VEHICLE_WEAPON_CAN_TARGET_OBJECTS( VEHICLE_INDEX VehicleIndex, BOOL CanTargetObjects ) = "0xbfead8b9e5c655f1"

//Info:
//PARAM NOTES:
//PURPOSE:	Sets whether the boost button (L3 on PS4) is used to retract the wheels
NATIVE PROC SET_VEHICLE_USE_BOOST_BUTTON_FOR_WHEEL_RETRACT( BOOL UseBoostButton ) = "0x0b1375f23b0d70ee"


//Info:
//PARAM NOTES:
//PURPOSE:	how much the slippery box will move relative to it's limits. 0 would be no movement 1 would be full
NATIVE PROC VEHICLE_UPDATE_SLIPPERY_BOX_LIMITS( VEHICLE_INDEX VehicleIndex, FLOAT LimitModifier ) = "0x0cc3480a05e78d19"

//Info:
//PARAM NOTES:
//PURPOSE:	breaks off the slippery box
NATIVE PROC VEHICLE_BREAK_OFF_SLIPPERY_BOX( VEHICLE_INDEX VehicleIndex ) = "0x10c32cb4ba5d57ac"


//Info:
//PARAM NOTES:
//PURPOSE:	sets the parachute model to use
NATIVE PROC VEHICLE_SET_PARACHUTE_MODEL_OVERRIDE( VEHICLE_INDEX VehicleIndex,  INT ModelNameHash ) = "0x37b31991b0b879d6"

//Info:
//PARAM NOTES:
//PURPOSE:	sets tint index of the vehicle parachute model
NATIVE PROC VEHICLE_SET_PARACHUTE_MODEL_TINT_INDEX( VEHICLE_INDEX VehicleIndex,  INT TintIndex ) = "0x56f9d6840204745e"

//Info:
//PARAM NOTES:
//PURPOSE:	gets maximum tint index of the vehicle parachute model (0 if parachute model not streamed in)
NATIVE FUNC INT VEHICLE_GET_PARACHUTE_MODEL_TINT_INDEX( VEHICLE_INDEX VehicleIndex ) = "0xfc299f794576b6f7"

//Info:
//PARAM NOTES:
//PURPOSE:	gets whether script is overrides the way the extenable sides extend
NATIVE FUNC INT VEHICLE_SET_OVERRIDE_EXTENABLE_SIDE_RATIO( VEHICLE_INDEX VehicleIndex, BOOL OverrideRatio ) = "0x64cf64209aff3ddc"

//Info:
//PARAM NOTES:
//PURPOSE:	sets the target ratio for the extendable sides
NATIVE FUNC INT VEHICLE_SET_EXTENABLE_SIDE_TARGET_RATIO( VEHICLE_INDEX VehicleIndex, float TargetRatio ) = "0x858ee2d5cfb29775"

//Info:
//PARAM NOTES:
//PURPOSE:	sets the extendable sides instantly, make sure there is room before calling this
NATIVE FUNC INT VEHICLE_SET_OVERRIDE_SIDE_RATIO( VEHICLE_INDEX VehicleIndex, float TargetRatio ) = "0xb6ab27964aadb068"

//INFO:
//PARAM NOTES: 
//				array - Array to place vehicles indices in
//PURPOSE: Get all vehicles in the local vehicle pool
//RETURN: Number of vehicles added to the list
NATIVE FUNC INT GET_ALL_VEHICLES(VEHICLE_INDEX &array[]) = "0xa0547b659f4e7b59"



//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Sets an amount the cargobob pickup range is increased by. This makes it easier to pick up vehicles
NATIVE PROC SET_CARGOBOB_EXTA_PICKUP_RANGE( VEHICLE_INDEX VehicleIndex,  FLOAT RangeIncrease ) =  "0x72beccf4b829522e"


//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Sets whether the door should use increased torque to drive it to position. If this is set the door will open faster and be harder to move.
NATIVE PROC SET_OVERRIDE_VEHICLE_DOOR_TORQUE( VEHICLE_INDEX VehicleIndex, SC_DOOR_LIST DoorNumber, BOOL OverrideTorque ) =  "0x66e3aaface2d1eb8"

//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Prevents a helicopter from exploding when taking fairly minor body damage
NATIVE PROC SET_DISABLE_HELI_EXPLODE_FROM_BODY_DAMAGE( VEHICLE_INDEX VehicleIndex, BOOL DisableExplode ) =  "0xedbc8405b3895cc9"

//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Prevents a vehicle from exploding when body damage from physical collisions
NATIVE PROC SET_DISABLE_EXPLODE_FROM_BODY_DAMAGE_ON_COLLISION( VEHICLE_INDEX VehicleIndex, BOOL DisableExplode ) =  "0x26e13d440e7f6064"

//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Sets whether the vehicle is allowed to wheelie or not. Only applies to vehicles that support wheelies
NATIVE PROC SET_WHEELIE_ENABLED( VEHICLE_INDEX VehicleIndex, BOOL isEnabled ) =  "0x1312ddd8385aee4e"

//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Sets whether the a trailer can attach to vehicles or not
NATIVE PROC SET_TRAILER_ATTACHMENT_ENABLED( VEHICLE_INDEX VehicleIndex, BOOL bEnabled ) =  "0x2fa2494b47fdd009"

//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Sets how much of the rocket boost bar is filled, where 0.0f is empty and 1.0f is full
NATIVE PROC SET_ROCKET_BOOST_FILL( VEHICLE_INDEX VehicleIndex, FLOAT fillAmount ) =  "0xfeb2dded3509562e"

//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Sets the vehicle to start gliding when passed true, and to stop gliding when passed false
NATIVE PROC SET_GLIDER_ACTIVE( VEHICLE_INDEX VehicleIndex, BOOL bActive ) =  "0x544996c0081abdeb"

//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Sets whether the trailer can attach to the local player.
NATIVE PROC SET_TRAILER_CAN_ATTACH_TO_LOCAL_PLAYER( VEHICLE_INDEX VehicleIndex, BOOL bCanAttach ) =  "0xd9c768ab47122dbd"

//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Sets if we should reset the turret heading towards front of the vehicle while driver is in scripted cameras (default is "true")
NATIVE PROC SET_SHOULD_RESET_TURRET_IN_SCRIPTED_CAMERAS( VEHICLE_INDEX VehicleIndex, BOOL shouldReset ) =  "0x78ceee41f49f421f"

//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Sets the vehicle to have its collision disabled upon creation on remote machines for one frame. This is to be used for vehicles in the MOC
NATIVE PROC SET_VEHICLE_DISABLE_COLLISION_UPON_CREATION( VEHICLE_INDEX VehicleIndex, BOOL disableCollision ) =  "0xaf60e6a2936f982a"


//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Sets whether flying close to the ground will reduce drag
NATIVE PROC SET_GROUND_EFFECT_REDUCES_DRAG( BOOL reduceDrag ) =  "0x430a7631a84c9be7"


//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Disables map collision on the vehicle
NATIVE PROC SET_DISABLE_MAP_COLLISION( VEHICLE_INDEX VehicleIndex ) =  "0x75627043c6aa90ad"

//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Disables map collision on the vehicle
NATIVE PROC SET_DISABLE_PED_STAND_ON_TOP( VEHICLE_INDEX VehicleIndex, BOOL DisableStandOn ) =  "0x8235f1bead557629"

//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Sets the amount damage to each of the vehicle areas is scaled by
NATIVE PROC SET_VEHICLE_DAMAGE_SCALES( VEHICLE_INDEX VehicleIndex, FLOAT bodyScale, FLOAT petrolTankScale, FLOAT engineScale, FLOAT collisionWithMapScale = 1.0 ) =  "0x9640e30a7f395e4b"

//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Sets the amount damage to each of the extra heli areas is scaled by
NATIVE PROC SET_HELI_DAMAGE_SCALES( VEHICLE_INDEX VehicleIndex, FLOAT mainRotorScale, FLOAT rearRotorScale, FLOAT tailBoomScale ) =  "0xbd1aa4ad082b71ad"

//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Sets the amount damage is scaled by on the given plane section
NATIVE PROC SET_PLANE_SECTION_DAMAGE_SCALE( VEHICLE_INDEX VehicleIndex, PLANE_DAMAGE_SECTION section, FLOAT damageScale ) =  "0x0bbb9a7a8ffe931b"

//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Sets the amount damage is scaled by on the given landing gear section
NATIVE PROC SET_PLANE_LANDING_GEAR_SECTION_DAMAGE_SCALE( VEHICLE_INDEX VehicleIndex, LANDING_GEAR_DAMAGE_SECTION section, FLOAT damageScale ) =  "0x46472312b16b12b9"

//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Sets whether plane control parts break off instantly from explosions
NATIVE PROC SET_PLANE_CONTROL_SECTIONS_SHOULD_BREAK_OFF_FROM_EXPLOSIONS( VEHICLE_INDEX VehicleIndex, BOOL BreakOff ) =  "0xdd8a2d3337f04196"

//INFO:
//PARAM NOTES: 
//				
//PURPOSE: Entities can now be flagged to prevent them being picked up by the cargobob, setting this flag to true will still allow this cargobob to pick them up
NATIVE PROC SET_HELI_CAN_PICKUP_ENTITY_THAT_HAS_PICK_UP_DISABLED( VEHICLE_INDEX VehicleIndex, BOOL canPickUp ) =  "0x94a68da412c4007d"

//Info:
//PARAM NOTES: 
//		AmmoCount - Must be positive (0 or greater).
//PURPOSE: Sets the current bomb ammo count for a script vehicle. 
//  Unlike restricted vehicle ammo (which is code fired), this is script-fired and manually decremented, and only stored in vehicle code for network sync purposes.
NATIVE PROC SET_VEHICLE_BOMB_AMMO( VEHICLE_INDEX VehicleIndex, INT AmmoCount ) = "0xfcdc8bee4424aa2a"

//Info:
//PARAM NOTES: 
//	
//PURPOSE: Gets the current bomb ammo count for a script vehicle. 
//  Unlike restricted vehicle ammo (which is code fired), this is script-fired and manually decremented, and only stored in vehicle code for network sync purposes.
NATIVE FUNC INT GET_VEHICLE_BOMB_AMMO( VEHICLE_INDEX VehicleIndex ) = "0x10dc0a99c89a6570"

//Info:
//PARAM NOTES: 
//		AmmoCount - Must be positive (0 or greater).
//PURPOSE: Sets the current countermeasure ammo count for a script vehicle. 
//   Unlike restricted vehicle ammo (which is code fired), this is script-fired and manually decremented, and only stored in vehicle code for network sync purposes.
NATIVE PROC SET_VEHICLE_COUNTERMEASURE_AMMO( VEHICLE_INDEX VehicleIndex, INT AmmoCount ) = "0xc5f03cf322cb836d"

//Info:
//PARAM NOTES: 
//	
//PURPOSE: Gets the current countermeasure ammo count for a script vehicle. 
//  Unlike restricted vehicle ammo (which is code fired), this is script-fired and manually decremented, and only stored in vehicle code for network sync purposes.
NATIVE FUNC INT GET_VEHICLE_COUNTERMEASURE_AMMO( VEHICLE_INDEX VehicleIndex ) = "0x0771bf1c8feeba14"

//Info:
//PARAM NOTES: 
//	
//PURPOSE: Gets whether the vehicle can be placed at the given location. This uses the low lod chassis bound, if the vehicle doesn't have one it uses the bounding box
NATIVE FUNC BOOL GET_CAN_VEHICLE_BE_PLACED_HERE( VEHICLE_INDEX VehicleIndex, VECTOR VehiclePos, VECTOR eulerAngles, EULER_ROT_ORDER RotOrder = EULER_YXZ, INT LOSFlags = 1 ) = "0x0235225edaf1a078"

//Info:
//PARAM NOTES: 
//	
//PURPOSE: Will prevent heli or plane from automatically starting a crash task if it loses a wing or engine is dead or is below certain height
NATIVE PROC SET_DISABLE_AUTOMATIC_CRASH_TASK( VEHICLE_INDEX VehicleIndex, BOOL bDisable ) = "0x2e8969970014be4c"

//Info:
//PARAM NOTES: 
//	
//PURPOSE: Set a specific offset for helis chasing target in combat
NATIVE PROC SET_HELI_COMBAT_OFFSET( VEHICLE_INDEX VehicleIndex, VECTOR VehiclePos ) = "0x3520bcbc9e81f010"

//Info:
//PARAM NOTES: 
//	
//PURPOSE: Sets the current ratio for the special flight mode
NATIVE PROC SET_SPECIAL_FLIGHT_MODE_RATIO( VEHICLE_INDEX VehicleIndex, FLOAT ratio ) = "0x13ed1d6bcdec5ab5"

//Info:
//PARAM NOTES: 
//	
//PURPOSE: Sets the target ratio for the special flight mode
NATIVE PROC SET_SPECIAL_FLIGHT_MODE_TARGET_RATIO( VEHICLE_INDEX VehicleIndex, FLOAT ratio ) = "0x16c2c89df3a1e544"

//Info:
//PARAM NOTES: 
//	
//PURPOSE: Sets whether the special flight mode is allowed
NATIVE PROC SET_SPECIAL_FLIGHT_MODE_ALLOWED( VEHICLE_INDEX VehicleIndex, BOOL specialFlightAllowed ) = "0xe133aec3b69a735e"

//Info:
//PARAM NOTES: 
//	
//PURPOSE: Sets whether the hover car can fly
NATIVE PROC SET_DISABLE_HOVER_MODE_FLIGHT( VEHICLE_INDEX VehicleIndex, BOOL specialFlightAllowed ) = "0x702dc2f046dfec2b"


//Info:
//PARAM NOTES: 
//	
//PURPOSE: Gets whether the special flight mode is allowed
NATIVE FUNC BOOL GET_DISABLE_HOVER_MODE_FLIGHT( VEHICLE_INDEX VehicleIndex ) = "0x6d204c41ddabfeb1"


//Info:
//PARAM NOTES: 
//	
//PURPOSE: Sets whether the outriggers are being deployed or not.
NATIVE PROC SET_DEPLOY_OUTRIGGERS( VEHICLE_INDEX VehicleIndex, BOOL Deploy ) = "0x6fb6f7a63cba0c1e"

//Info:
//PARAM NOTES: 
//	
//PURPOSE: Gets whether the outriggers are deployed or not.
NATIVE FUNC BOOL GET_OUTRIGGERS_DEPLOYED( VEHICLE_INDEX VehicleIndex ) = "0xf4a878e80ee5f492"


//INFO:
//PARAM NOTES:
//PURPOSE: Returns posible spawn position for a heli based on a target ped. Could still be visible by some players, if all found positions (max 5 tries) were on screen for some players, it will return it anyway.
NATIVE FUNC VECTOR FIND_SPAWN_COORDINATES_FOR_HELI( PED_INDEX TargetPedIndex ) = "0x22d47eddb803bb38"


//INFO:
//PARAM NOTES:
//PURPOSE: deploys the folding wings on a vehicle
NATIVE PROC SET_DEPLOY_FOLDING_WINGS( VEHICLE_INDEX VehicleIndex, BOOL Deploy, BOOL Instant ) = "0x3bc0b31eec98d938"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns if the folding wings are deployed
NATIVE FUNC BOOL ARE_FOLDING_WINGS_DEPLOYED( VEHICLE_INDEX VehicleIndex ) = "0x70578c38f82a5d0d"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets whether the plane will apply random roll and yaw when running the crash task
NATIVE FUNC BOOL SET_CAN_ROLL_AND_YAW_WHEN_CRASHING( VEHICLE_INDEX VehicleIndex, BOOL allowRollAndYaw ) = "0x5f8633735bff16d4"

//INFO:
//PARAM NOTES:
//PURPOSE: Will make plane dip straight down in the crash task, rather than spinning out of controll randomly
NATIVE PROC SET_DIP_STRAIGHT_DOWN_WHEN_CRASHING_PLANE( VEHICLE_INDEX VehicleIndex, BOOL dipDownOnCrash ) = "0x7c82a3bd8b91d269"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the hidden status of a turret
NATIVE PROC SET_TURRET_HIDDEN( VEHICLE_INDEX VehicleIndex, INT TurretIndex, BOOL HideTurret ) = "0x57a6afe7707c81b0"


//INFO:
//PARAM NOTES:
//PURPOSE: Sets wing ratio on vehicles with a hover mode
NATIVE PROC SET_HOVER_MODE_WING_RATIO( VEHICLE_INDEX VehicleIndex, FLOAT WingRatio ) = "0xf216ab299663b813"

//INFO:
//PARAM NOTES:
//PURPOSE: Disables the prerender update on the turret. The physics might still move but you wont see it
NATIVE PROC SET_DISABLE_TURRET_MOVEMENT( VEHICLE_INDEX VehicleIndex, INT TurretIndex ) = "0x133203029bc9528b"

//INFO:
//PARAM NOTES:
//PURPOSE: Forces an update of all the links in the vehicle. This is to fix an issue where vehicles that have never been active have the wrong initial bone rotations
NATIVE PROC SET_FORCE_FIX_LINK_MATRICES( VEHICLE_INDEX VehicleIndex ) = "0xb4ac87d9bcb5dcf7"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the transform speed rate for the submarine car animation
NATIVE PROC SET_TRANSFORM_RATE_FOR_ANIMATION( VEHICLE_INDEX VehicleIndex, FLOAT TransformRate ) = "0xb03c1c7ae70e10c1"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the submarine car to use X/A to trigger the transform animation
NATIVE PROC SET_TRANSFORM_TO_SUBMARINE_USES_ALTERNATE_INPUT( VEHICLE_INDEX VehicleIndex, BOOL UseAlternateInput ) = "0x24ca47b99c8a71ba"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the mass of the vehicle
NATIVE FUNC FLOAT GET_VEHICLE_MASS( VEHICLE_INDEX VehicleIndex ) = "0xc5b159460bc9432f"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the weapon damage multiplier for the vehicle
NATIVE FUNC FLOAT GET_VEHICLE_WEAPON_DAMAGE_MULT( VEHICLE_INDEX VehicleIndex ) = "0x58fd505c1846e7b9"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the collision damage multiplier for the vehicle
NATIVE FUNC FLOAT GET_VEHICLE_COLLISION_DAMAGE_MULT( VEHICLE_INDEX VehicleIndex ) = "0x640e1fe2aeba3dd8"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets whether the vehicle takes reduced damage from sticky bombs
NATIVE FUNC BOOL GET_VEHICLE_HAS_RECDUCED_STICKY_BOMB_DAMAGE( VEHICLE_INDEX VehicleIndex ) = "0x73a4c751d3f57ecb"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets whether explosive damage done to the vehicle is capped
NATIVE FUNC BOOL GET_VEHICLE_HAS_CAPPED_EXPLOSION_DAMAGE( VEHICLE_INDEX VehicleIndex ) = "0xf8b27c5f710dc472"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets whether the vehicle has bullet proof glass
NATIVE FUNC BOOL GET_VEHICLE_HAS_BULLET_PROOF_GLASS( VEHICLE_INDEX VehicleIndex ) = "0x439355586b075ffc"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets whether the vehicle has bullet resistant glass
NATIVE FUNC BOOL GET_VEHICLE_HAS_BULLET_RESISTANT_GLASS( VEHICLE_INDEX VehicleIndex ) = "0xfcc9c35259cacb4c"

//INFO:
//PARAM NOTES:
//PURPOSE: Enables/disables vehicle combat mode
NATIVE PROC SET_VEHICLE_COMBAT_MODE( bool InVehicleCombatMode ) = "0x49ff67ce965a9ca0"

//INFO:
//PARAM NOTES:
//PURPOSE: Enables/disables vehicle detonation mode
NATIVE PROC SET_VEHICLE_DETONATION_MODE( bool InVehicleCombatMode ) = "0xa9dc91773c63c079"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets vehicle shunt to be on the left stick, this also enables forwards shunting
NATIVE PROC SET_VEHICLE_SHUNT_ON_STICK( bool ShuntOnStick ) = "0x74dd43b047cfb3d6"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if the vehicle is currently doing a side shunt. This gets set to false as soon as the vehicle shunts something
NATIVE FUNC BOOL GET_IS_VEHICLE_SHUNTING( VEHICLE_INDEX VehicleIndex ) = "0x43c1cd8b0eeee9a6"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true the frame a vehicle has been hit by a side shunt
NATIVE FUNC BOOL GET_HAS_VEHICLE_BEEN_HIT_BY_SHUNT( VEHICLE_INDEX VehicleIndex ) = "0xd75da3b776068a54"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns last vehicle that either shunted or was shunted by this vehicle
NATIVE FUNC VEHICLE_INDEX GET_LAST_SHUNT_VEHICLE( VEHICLE_INDEX VehicleIndex ) = "0xf8226abcdca5135e"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true for one frame if the vehicle has been hit by a weapon blade
NATIVE FUNC BOOL GET_HAS_VEHICLE_BEEN_HIT_BY_WEAPON_BLADE( VEHICLE_INDEX VehicleIndex ) = "0x51fc9159dd5406b4"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets whether explosions caused by vehicles exploding cause damage
NATIVE PROC SET_DISABLE_VEHICLE_EXPLOSIONS_DAMAGE( bool DisableDamage ) = "0x623e6f86f7ea1f6f"

//INFO: 
//PARAM NOTES: 	durationMod is applied as a multiplier to the default nitrous duration (which is 3 seconds)
//				powerMod is applied as a multiplier to the default nitrous power multiplier (which is 3)
// 				rechargeMod is applied as a multiplier to the default recharge rate
//PURPOSE: Provide a set of parameters to override the vehcile's nitrous system
// These are applied to CVehicle::m_scriptOverridesNitrous
NATIVE PROC SET_OVERRIDE_NITROUS_LEVEL( VEHICLE_INDEX VehicleIndex, BOOL override, FLOAT durationMod = 0.0, FLOAT powerMod = 0.0, FLOAT rechargeMod = 0.0 , BOOL disableDefaultSound = false ) = "0xb5a0c4e6b09e2d4b"

//INFO:
//PARAM NOTES:
//PURPOSE: Set the duration of the vehicle's nitrous charge to maximum (requires a duration mod to be specified from SET_OVERRIDE_NITROUS_LEVEL)
NATIVE PROC FULLY_CHARGE_NITROUS( VEHICLE_INDEX VehicleIndex) = "0x6ddbf5429c7f5c5e"

//INFO:
//PARAM NOTES:
//PURPOSE: Clears the vehicle's nitrous charge
NATIVE PROC CLEAR_NITROUS( VEHICLE_INDEX VehicleIndex ) = "0x2e45008db64c5ec6"

//INFO:
//PARAM NOTES:
//PURPOSE: Activate or deactivate the vehicle's nitrous system
NATIVE PROC SET_NITROUS_IS_ACTIVE( VEHICLE_INDEX VehicleIndex, BOOL isActive ) = "0x595e3eac7749eb53"

//INFO:
//PARAM NOTES:
//PURPOSE: Wheel impacts will cause additional damage to vehicles
NATIVE PROC SET_INCREASE_WHEEL_CRUSH_DAMAGE( VEHICLE_INDEX VehicleIndex, BOOL IncreaseDamage ) = "0x9d34acb83840c018"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true when the "MF_IS_RC" model handling flag is set on the vehicle. Used to detect whether the ped is invisible while inside the vehicle.
NATIVE FUNC BOOL GET_IS_VEHICLE_REMOTE_CONTROL_CAR( VEHICLE_INDEX VehicleIndex ) = "0x29bd828f1d9818fb"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets whether explosions caused by vehicles exploding cause damage
NATIVE PROC SET_DISABLE_WEAPON_BLADE_FORCES( bool DisableBladeForce ) = "0x034d9fe280c12eab"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets whether car jump is triggered with a double click of the button
NATIVE PROC SET_USE_DOUBLE_CLICK_FOR_CAR_JUMP( bool UseDoubleClick ) = "0xcc8d70b64262a044"

//INFO:
//PARAM NOTES:
//PURPOSE: returns true if the vehicle has a tombstone and it hasn't broken off.
NATIVE FUNC BOOL GET_DOES_VEHICLE_HAVE_TOMBSTONE( VEHICLE_INDEX VehicleIndex ) = "0x45fc89e52779f5f9"

//INFO:
//PARAM NOTES:
//PURPOSE: Hides or restores the tombstone. It should only be used to restore the tombstone if it has been hidden by this function, not if it has been broken off or used.
NATIVE PROC HIDE_TOMBSTONE( VEHICLE_INDEX VehicleIndex, BOOL HideTombstone ) = "0x688b84e91c8e1689"

//INFO:
//PARAM NOTES:
//PURPOSE: Calls "apply EMP explosion" on the vehicle with index VehicleIndex
NATIVE PROC APPLY_EMP_EFFECT(VEHICLE_INDEX VehicleIndex) = "0x2f5af73c0a0f592d"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if the vehicle has been hit by an EMP explosion and is currently disabled. Will become false once the EMP timer wears off.
NATIVE FUNC BOOL GET_IS_VEHICLE_DISABLED_BY_EMP( VEHICLE_INDEX VehicleIndex ) = "0x0e532a4d2c420fec"

//INFO:
//PARAM NOTES:
//PURPOSE: Calls "apply Slick Explosion" on the vehicle with index VehicleIndex
NATIVE PROC APPLY_SLICK_EFFECT(VEHICLE_INDEX VehicleIndex) = "0x356c5c43098434cc"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if the vehicle is currently being affected by a Slick-type explosion. Will become false once the effect wears off.
NATIVE FUNC BOOL GET_IS_VEHICLE_AFFECTED_BY_SLICK(VEHICLE_INDEX VehicleIndex) = "0x0eede983da60f96c"

//INFO:
//PARAM NOTES: SteeringBias = the steering bias modifier, Lifetime = the duration it will be applied
//PURPOSE: Calls "apply Steering Bias" on the vehicle with index VehicleIndex (automobiles only)
NATIVE PROC APPLY_STEERING_BIAS(VEHICLE_INDEX VehicleIndex, float SteeringBias, float Liftetime) = "0xdc84574923a2878d"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets whether the retracting of the weapon blades based on rpm should be disabled
NATIVE PROC SET_DISABLE_RETRACTING_WEAPON_BLADES( bool DisableRetracting ) = "0xdd10f223864dc3b5"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the current tyre health
NATIVE FUNC FLOAT GET_TYRE_HEALTH( VEHICLE_INDEX VehicleIndex, SC_WHEEL_LIST WheelNumber ) = "0xba19dc35cdba15c8"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the tyre health
NATIVE PROC SET_TYRE_HEALTH( VEHICLE_INDEX VehicleIndex, SC_WHEEL_LIST WheelNumber, FLOAT Health ) = "0x3173e2e58afffeab"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the current tyre wear rate
NATIVE FUNC FLOAT GET_TYRE_WEAR_RATE( VEHICLE_INDEX VehicleIndex, SC_WHEEL_LIST WheelNumber ) = "0x53c70b6e9a5beae7"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the tyre wear rate
NATIVE PROC SET_TYRE_WEAR_RATE( VEHICLE_INDEX VehicleIndex, SC_WHEEL_LIST WheelNumber, FLOAT WearRate ) = "0xf9370de1f7aff056"


//INFO:
//PARAM NOTES:
//PURPOSE: Sets the amount tyre rate is scaled by
NATIVE PROC SET_TYRE_WEAR_RATE_SCALE( VEHICLE_INDEX VehicleIndex, SC_WHEEL_LIST WheelNumber, FLOAT WearRateScale ) = "0xb4710f96caa92500"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the difference in tyre grip between a wear rate of 1 and 0
NATIVE PROC SET_TYRE_MAXIMUM_GRIP_DIFFERENCE_DUE_TO_WEAR_RATE( VEHICLE_INDEX VehicleIndex, SC_WHEEL_LIST WheelNumber, FLOAT WearRateGripDiff ) = "0xe7a2de5ed8c510f0"

//INFO:
//PARAM NOTES:
//PURPOSE: Resets the cars downforce scales to their default values
NATIVE PROC RESET_DOWNFORCE( VEHICLE_INDEX VehicleIndex ) = "0x4344baa92193eb7e"

//INFO:
//PARAM NOTES:
//PURPOSE: Modifies the front and rear downforce on a vehicle. Use negative values to reduce downforce. Maximum downforce change is +-1 from default
NATIVE PROC MODIFY_DOWNFORCE( VEHICLE_INDEX VehicleIndex, FLOAT FrontChange, FLOAT RearChange ) = "0x35c884f7a1651cf2"

//INFO:
//PARAM NOTES:
//PURPOSE: Makes the vehicle jump in the air
NATIVE PROC TRIGGER_PUMPED_UP_JUMP( VEHICLE_INDEX VehicleIndex, FLOAT HeightScale = 1.0 ) = "0x982a8921c2ea2874"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the aircraft to ignore an optimistation that checks the height map before doing wheel probes
NATIVE PROC SET_AIRCRAFT_IGNORE_HIGHTMAP_OPTIMISATION( VEHICLE_INDEX VehicleIndex, BOOL IgnoreHeightMap ) = "0x6399d7d66fe1c361"

//INFO:
//PARAM NOTES:
//PURPOSE: Set reduced suspension force, so users can "stance" cars
NATIVE PROC SET_REDUCED_SUSPENSION_FORCE( VEHICLE_INDEX VehicleIndex, bool ReduceSuspensionForce ) = "0x321dc7de46bf01c3"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets whether the suspension force has been reduced on any wheels
NATIVE FUNC BOOL GET_IS_REDUCED_SUSPENSION_FORCE_SET( VEHICLE_INDEX VehicleIndex ) = "0x4d3afacf60081506"


//INFO:
//PARAM NOTES: Set DriftTyresFlag to true to enable reduced grip tyres which hopefully allow the car to drift more
//PURPOSE: Set the tyres on this vehicles to have lower grip so cars are hopefully easier to drift
NATIVE PROC SET_DRIFT_TYRES( VEHICLE_INDEX VehicleIndex, bool DriftTyresFlag ) = "0x8c5dd298059d8bf8"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets whether the tyres on this vehicle have lower grip so they are easier to drift
NATIVE FUNC BOOL GET_DRIFT_TYRES_SET( VEHICLE_INDEX VehicleIndex ) = "0xbb34ca7bce1af9a1"

//INFO:
//PARAM NOTES:
//PURPOSE: Override a specified vehicle group to ensure it has a higher chance of spawning in the current population schedule
NATIVE PROC SET_OVERRIDE_VEH_GROUP( STRING VehGroupOverride, INT overridePercentage) = "0x8b0c0b9e68564483"

//INFO:
//PARAM NOTES:
//PURPOSE: Set whether we should perform a shape test when choosing the entry point in a vehicle to ensure there's enough room for the ped
NATIVE PROC SET_CHECK_FOR_ENOUGH_ROOM_FOR_PED( VEHICLE_INDEX VehicleIndex, bool ShouldCheckForEnoughRoomToFitPed) = "0xef9d388f8d377f44"
