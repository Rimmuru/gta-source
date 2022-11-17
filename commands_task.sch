USING "types.sch"
USING "event_enums.sch"
USING "commands_ped.sch"
USING "commands_vehicle.sch"
USING "ped_bonetags.sch"
USING "generic.sch"
USING "eulers.sch"

CONST_INT INFINITE_TASK_TIME            -1

CONST_FLOAT PEDMOVEBLENDRATIO_STILL     0.0
CONST_FLOAT PEDMOVEBLENDRATIO_WALK      1.0
CONST_FLOAT PEDMOVEBLENDRATIO_RUN       2.0
CONST_FLOAT PEDMOVEBLENDRATIO_SPRINT    3.0

CONST_FLOAT PEDMOVE_STILL     PEDMOVEBLENDRATIO_STILL
CONST_FLOAT PEDMOVE_WALK      PEDMOVEBLENDRATIO_WALK
CONST_FLOAT PEDMOVE_RUN       PEDMOVEBLENDRATIO_RUN
CONST_FLOAT PEDMOVE_SPRINT    PEDMOVEBLENDRATIO_SPRINT

ENUM VEHICLEMOUNTEDWEAPONTASKMODE
	TASK_PLAYER = 0,
	TASK_IDLE,
	TASK_AIM,
	TASK_FIRE,
	TASK_CAMERA,
	TASK_SEARCH
ENDENUM

ENUM ARRESTTYPE
    ARREST_FALLBACK = -1,
    ARREST_CUFFING = 0,
    ARREST_UNCUFFING,
    ARREST_COUNT
ENDENUM

ENUM REPEATMODE
    REPEAT_NOT=0,
    REPEAT_FOREVER
ENDENUM

ENUM FOLLOWPOINTROUTEMODE
    TICKET_SINGLE=0,    //Stop at the end of the route 
    TICKET_RETURN,      //Go once then return back once following the route backwards 
    TICKET_SEASON,      //As above but for forever 
    TICKET_LOOP           //Treat the points as a loop, i.e follow it to the end then directly back to the first position, forever. 
ENDENUM

ENUM NAVMESH_ROUTE_RESULT
    NAVMESHROUTE_TASK_NOT_FOUND,            // on navmesh task was found on the ped
    NAVMESHROUTE_ROUTE_NOT_YET_TRIED,       // the task has not yet looked for a route
    NAVMESHROUTE_ROUTE_NOT_FOUND,           // the task has tried & failed to find a route (will keep trying)
    NAVMESHROUTE_ROUTE_FOUND                // the task has successfully found a route
ENDENUM

ENUM SYNCED_SCENE_PLAYBACK_FLAGS
	SYNCED_SCENE_NONE = 0,
	SYNCED_SCENE_USE_PHYSICS = 1,									// When this flag is set, the task will run in kinematic physics mode (other entities will collide, and be pushed out of the way)
	SYNCED_SCENE_TAG_SYNC_OUT = 2,									// when this flag is set, the task will do a tag synchronized blend out with the movement behaviour of the ped.
	SYNCED_SCENE_DONT_INTERRUPT = 4,								// When this flag is set, the scene will not be interrupted by ai events like falling, entering water / etc. Also blocks all weapon reactions / etc
	SYNCED_SCENE_ON_ABORT_STOP_SCENE = 8,							// When this flag is set, the scene will be stopped if this task is aborted
	SYNCED_SCENE_ABORT_ON_WEAPON_DAMAGE = 16,						// When this flag is set, the task will end if the ped takes weapon damage
	SYNCED_SCENE_BLOCK_MOVER_UPDATE = 32,							// When this flag is set, the task will not update the mover
	SYNCED_SCENE_LOOP_WITHIN_SCENE = 64,							// When this flag is set, the tasks with anims shorter than the scene will loop while the scene is playing
	SYNCED_SCENE_PRESERVE_VELOCITY = 128,							// When this flag is set, the task will preserve it's velocity on clean up (must be using physics)
	SYNCED_SCENE_EXPAND_PED_CAPSULE_FROM_SKELETON = 256,			// When this flag is set, the task will apply the CPED_RESET_FLAG_ExpandPedCapsuleFromSkeleton flag to the ped
	SYNCED_SCENE_ACTIVATE_RAGDOLL_ON_COLLISION = 512,				// When this flag is set, the ped will switch to ragdoll and fall down on making contact with a physical object (other than flat ground)
	SYNCED_SCENE_HIDE_WEAPON = 1024,								// When this flag is set, the ped's weapon will be hidden while the scene is playing
	SYNCED_SCENE_ABORT_ON_DEATH = 2048,								// When this flag is set, task will end if the ped dies, even if the SYNCED_SCENE_DONT_INTERRUPT flag is set.
	SYNCED_SCENE_VEHICLE_ABORT_ON_LARGE_IMPACT = 4096,				// When running the scene on a vehicle, allow the scene to abort if the vehicle takes a heavy collision from another vehicle
	SYNCED_SCENE_VEHICLE_ALLOW_PLAYER_ENTRY = 8192,					// When running the scene on a vehicle, allow player peds to enter the vehicle
	SYNCED_SCENE_PROCESS_ATTACHMENTS_ON_START = 16384,				// When this flag is set, process the attachments at the start of the scene
	SYNCED_SCENE_NET_ON_EARLY_NON_PED_STOP_RETURN_TO_START = 32768, // When this flag is set, a non-ped entity will be returned to their starting position if the scene finishes early
	SYNCED_SCENE_SET_PED_OUT_OF_VEHICLE_AT_START = 65536,			// When this flag is set, The ped will be set out of his vehicle when the task starts.
	SYNCED_SCENE_NET_DISREGARD_ATTACHMENT_CHECKS = 131072			// When this flag is set, the attachment checks done in CNetworkSynchronisedScenes::Update when pending start will be disregarded
ENDENUM

ENUM TASK_RAPPEL_DOWN_WALL_STATE
	RAPPEL_STATE_INVALID = -1,			// The ped isn't currently running this task
	RAPPEL_STATE_CLIMBING_WALL = 1,		// Playing the initial climb intro animation
	RAPPEL_STATE_IDLE = 3,				// Not moving or jumping, just hanging idle
	RAPPEL_STATE_IDLE_AT_DESTINATION_Z = 4,	// At the lowest point allowed and waiting to smash the window
	RAPPEL_STATE_DESCENDING = 5,		// Moving down
	RAPPEL_STATE_JUMPING = 6,			// Jumping outwards (can also be moving down based on player stick input)
	RAPPEL_STATE_SMASHINGWINDOW = 7		// Playing the window smash animation
ENDENUM

//Note: These should be kept in sync with CTaskVehicleChase::BehaviorFlags in code.
ENUM TASK_VEHICLE_CHASE_BEHAVIOR_FLAGS
	VEHICLE_CHASE_CANT_BLOCK						= 1,
	VEHICLE_CHASE_CANT_BLOCK_FROM_PURSUE			= 2,
	VEHICLE_CHASE_CANT_PURSUE						= 4,
	VEHICLE_CHASE_CANT_RAM							= 8,
	VEHICLE_CHASE_CANT_SPIN_OUT						= 16,
	VEHICLE_CHASE_CANT_MAKE_AGGRESSIVE_MOVE			= 32,
	VEHICLE_CHASE_CANT_CRUISE_IN_FRONT_DURING_BLOCK	= 64,
	VEHICLE_CHASE_USE_CONTINUOUS_RAM				= 128,
	VEHICLE_CHASE_CANT_PULL_ALONGSIDE				= 256,
	VEHICLE_CHASE_CANT_PULL_ALONGSIDE_INFRONT		= 512
ENDENUM

ENUM TASK_GO_TO_COORD_ANY_MEANS_FLAGS
	TGCAM_DEFAULT									= 0,
	// Ignore the health of the vehicle (default behaviour is to not use any vehicle with less than 600 health)
	TGCAM_IGNORE_VEHICLE_HEALTH						= 1,
	// Considers all nearby vehicles for suitability (default behaviour is to consider only the vehicle closest to the ped)
	TGCAM_CONSIDER_ALL_NEARBY_VEHICLES				= 2,
	// Performs the same tests as is done in IS_VEHICLE_DRIVEABLE (default behaviour is to just check the vehicle's health)
	TGCAM_PROPER_IS_DRIVEABLE_CHECK					= 4,
	// Instructs the ped to remain in the vehicle at the end, so that multiple tasks can be chained together (see url:bugstar:1778387)
	TGCAM_REMAIN_IN_VEHICLE_AT_DESTINATION			= 8,
	// Ped will never abandon the vehicle it is in (see url:bugstar:2196034)
	TGCAM_NEVER_ABANDON_VEHICLE						= 16,
	// Ped will never abandon the vehicle it is in if vehicle is moving (see url:bugstar:2225456)
	TGCAM_NEVER_ABANDON_VEHICLE_IF_MOVING			= 32,
	// Peds will use the targeting system for threats and register any threats they can attack (rather than just using the closest targetable ped)
	TGCAM_USE_AI_TARGETING_FOR_THREATS				= 64
ENDENUM

ENUM TASK_HANDS_UP_FLAGS
	HANDS_UP_NOTHING						= 0,
	HANDS_UP_STRAIGHT_TO_LOOP				= 1
ENDENUM

ENUM TASK_COMBAT_PED_FLAGS
	COMBAT_PED_NONE							= 0,
	COMBAT_PED_PREVENT_CHANGING_TARGET		= 67108864,
	COMBAT_PED_DISABLE_AIM_INTRO			= 134217728
ENDENUM

ENUM TASK_THREAT_RESPONSE_FLAGS
	TASK_THREAT_RESPONSE_NONE									= 0,
	TASK_THREAT_RESPONSE_CAN_FIGHT_ARMED_PEDS_WHEN_NOT_ARMED	= 16
ENDENUM

ENUM TASK_GO_TO_AIM_FLAGS
	GO_TO_AIM_NONE									= 0,
	GO_TO_AIM_AT_GOTO_COORD_IF_TARGET_LOS_BLOCKED	= 1	 // If our target is a ped and our LOS is blocked, we'll try aiming at the go to coord
ENDENUM

// Ped Config flags, used to control ped behaviour/setup
// match these with the enum in PedFlags.h
STRICT_ENUM CODE_TASK
	CODE_TASK_HANDS_UP = 0,	// CTaskTypes::TASK_HANDS_UP
	CODE_TASK_CLIMB_LADDER = 1,
	CODE_TASK_EXIT_VEHICLE = 2,
	CODE_TASK_COMBAT_ROLL = 3,
	CODE_TASK_AIM_GUN_ON_FOOT = 4
ENDENUM

// High fall task entry behaviour. Affects how the ped will behave when first starting the nm high fall task.
// Note: this only affects the starting behaviour of the fall. ONgoing behaviour will be determined by height from the ground / collisions / etc.
ENUM HIGH_FALL_ENTRY_TYPE
	HIGHFALL_IN_AIR = 0,			// Standard behaviour. Pitches forward in the direction of movement (standard behaviour when a ped is warped into the air and dropped)
	HIGHFALL_VAULT = 1,				// not for use by script
	HIGHFALL_FROM_CAR_HIT = 2,		// Normally used when then ped has been hit by a car and falls off.
	HIGHFALL_SLOPE_SLIDE = 3,		// Used when the ped activates from an animated slide down a slope.
	HIGHFALL_TEETER_EDGE = 4,		// Will make the ped teeter in the direction of movement (as if at an edge). Best used for knocking peds off of the edge of buildings from standing / etc.
	HIGHFALL_SPRINT_EXHAUSTED = 5,	// Equivalent to fainting from running out of energy
	HIGHFALL_STUNT_JUMP = 6			// Equivalent to the in air stunt jump activation (i.e. pressing circle / B whilst jumping)
ENDENUM

//******************************************************************************************************************
// ENAV_SCRIPT_FLAGS
// This enumeration defines the set of bitflags which may be passed in to TASK_FOLLOW_NAV_MESH_TO_COORD_ADVANCED.
// If multiple flags are specified they must either be combined using a bitwise OR, or their values summed.
// TASK_FOLLOW_NAV_MESH_TO_COORD_ADVANCED also takes a NAVDATA structure, which in some cases must contain values
// required for the extra functionality - where this is the case it is described below.

ENUM ENAV_SCRIPT_FLAGS

    ENAV_DEFAULT                                                = 0,


    //*******************************************************************
    // ENAV_NO_STOPPING
    // Will ensure the ped continues to move whilst waiting for the path
    // to be found, and will not slow down at the end of their route.
        
    ENAV_NO_STOPPING                                        = 1,

    //**********************************************************************
    // ENAV_SLIDE_TO_COORD_AND_ACHIEVE_HEADING_AT_END
    // Performs a slide-to-coord at the and of the task. This requires that
    // the accompanying NAVDATA structure has the 'm_fSlideToCoordHeading'
    // member set correctly.
    
    ENAV_ADV_SLIDE_TO_COORD_AND_ACHIEVE_HEADING_AT_END          = 2,
    
    //***********************************************************************
    // ENAV_GO_FAR_AS_POSSIBLE_IF_TARGET_NAVMESH_NOT_LOADED
    // If the navmesh is not loaded in under the target position, then this
    // will cause the ped to get as close as is possible on whatever navmesh
    // is loaded.  The navmesh must still be loaded at the path start.
    
    ENAV_GO_FAR_AS_POSSIBLE_IF_TARGET_NAVMESH_NOT_LOADED    = 4,
    
    //********************************************************************
    // ENAV_ALLOW_SWIMMING_UNDERWATER
    // Will allow navigation underwater - by default this is not allowed
    
    ENAV_ALLOW_SWIMMING_UNDERWATER                          = 8,
    
    //************************************************************************
    // ENAV_KEEP_TO_PAVEMENTS
    // Will only allow navigation on pavements.  If the path starts or ends
    // off the pavement, the command will fail.  Likewise if no pavement-only
    // route can be found even although the start and end are on pavement.
    
    ENAV_KEEP_TO_PAVEMENTS                                  = 16,
    
    //******************************************************
    // ENAV_NEVER_ENTER_WATER
    // Prevents the path from entering water at all
    
    ENAV_NEVER_ENTER_WATER                                  = 32,
    
    //***************************************************************************
    // ENAV_DONT_AVOID_OBJECTS
    // Disables object-avoidance for this path.  The ped may still make minor
    // steering adjustments to avoid objects, but will not pathfind around them.
    
    ENAV_DONT_AVOID_OBJECTS                                 = 64,
        
    //***************************************************************************
    // ENAV_ADVANCED_USE_MAX_SLOPE_NAVIGABLE
    // Specifies that the navmesh route will only be able to traverse up slopes
    // which are under the angle specified in the m_fMaxSlopeNavigable member of
    // the accompanying NAVDATA structure.
    
    ENAV_ADVANCED_USE_MAX_SLOPE_NAVIGABLE					= 128,
    
    //***************************************************************************
    // ENAV_STOP_EXACTLY [ DEPRACATED ]
    // DERPACATED : Peds will always attempt to stop exactly, unless the new
    // flag ENAV_SUPPRESS_EXACT_STOP is specified..
    // ENAV_STOP_EXACTLY will do nothing, and at some point will be removed.

    ENAV_STOP_EXACTLY										= 512,
    
    //***************************************************************************
    // ENAV_ACCURATE_WALKRUN_START
    // The entity will look ahead in its path for a longer distance to make the
    // walk/run start go more in the right direction
    // Especially useful when ped start from inside an object boundaries
    // But has to be used carefully, the ped might be more prone to walk into
    // things during the walk/runstart with this flag set
    
    ENAV_ACCURATE_WALKRUN_START								= 1024,
    
    //***************************************************************************
    // ENAV_DONT_AVOID_PEDS
    // Disables ped-avoidance for this path while we move.
    
    ENAV_DONT_AVOID_PEDS	                                = 2048,
    
	//**********************************************************************************************
	// ENAV_DONT_ADJUST_TARGET_POSITION
	// If target pos is inside the boundingbox of an object it will otherwise be pushed out
	// TO BE USED WITH EXTREME CAUTION!!! Only if asked specificly to use this
	
    ENAV_DONT_ADJUST_TARGET_POSITION						= 4096,
    
    //**************************************************************************************
    // ENAV_SUPPRESS_EXACT_STOP
    // Turns off the default behaviour, which is to stop exactly at the target position.
    // Occasionally this can cause footsliding/skating problems.

    ENAV_SUPPRESS_EXACT_STOP								= 8192,
    
    //******************************************************************************************
    // ENAV_ADVANCED_USE_CLAMP_MAX_SEARCH_DISTANCE
    // Prevents the path-search from finding paths outside of this search distance.
    // This can be used to prevent peds from finding long undesired routes.
    // The value 'm_fClampMaxSearchDistance' must be set in the accompanying NAVDATA structure,
    // and this value must be between 1 and 255 (corresponds to game units).
    // The seach area is limited to an axis aligned box containing a sphere of the given radius.

    ENAV_ADVANCED_USE_CLAMP_MAX_SEARCH_DISTANCE				= 16384,
    
    //**************************************************************************************
    // ENAV_PULL_FROM_EDGE_EXTRA
    // Pulls out the paths from edges at corners for a longer distance, to prevent peds walking
    // into stuff. This could in rare cases generate bigger quirks in the paths so use only
    // when it is necessary
    
	ENAV_PULL_FROM_EDGE_EXTRA								= 32768
    
    
ENDENUM


//*********************************************************************************************
//  STRUCT NAVDATA
//  Additional data which is passed into the TASK_FOLLOW_NAV_MESH_TO_COORD_ADVANCED command.

STRUCT NAVDATA

	// Heading in degrees
    FLOAT m_fSlideToCoordHeading
    
    // Max slope which this ped can move over (0 = can only move on flat, 45 means cannot move on anything above 1:1 slope, 90 means can move on any slope)
    FLOAT m_fMaxSlopeNavigable
    
    // Clamp the search distance to this value, path-search will not search further than this distance (value must be between 1 and 255 inclusive)
    FLOAT m_fClampMaxSearchDistance
    
ENDSTRUCT



//**********************************************************************************************
// EWDR_SCRIPT_FLAGS
// This enumeration defines the set of bitflags which may be passed in to TASK_WANDER_STANDARD

ENUM EWDR_SCRIPT_FLAGS

    EWDR_DEFAULT                                                = 0,

    //*******************************************************************
    // EWDR_KEEP_MOVING_WHILST_WAITING_FOR_FIRST_PATH
    // Forces the ped to keep moving whilst waiting for the first path
        
    EWDR_KEEP_MOVING_WHILST_WAITING_FOR_FIRST_PATH              = 1

ENDENUM

//******************************************************************************************
// ESEEK_ENTITY_OFFSET_FLAGS
// Bit flags which can be passed into TASK_GOTO_ENTITY_OFFSET & TASK_GOTO_ENTITY_OFFSET_XY

ENUM ESEEK_ENTITY_OFFSET_FLAGS

	ESEEK_DEFAULT											= 0,

	//*********************************************************************
	// ESEEK_OFFSET_ORIENTATES_WITH_ENTITY
	// Specifies that the XY offset orientates with the entity.
	// Only valid with TASK_GOTO_ENTITY_OFFSET_XY
	
	ESEEK_OFFSET_ORIENTATES_WITH_ENTITY						= 1,
	
	//*********************************************************************
	// ESEEK_KEEP_TO_PAVEMENTS
	// The ped will attempt to keep to pavements whilst seeking the targe entity
	
	ESEEK_KEEP_TO_PAVEMENTS									= 2

ENDENUM

//******************************************************************************************
// EGOTO_ENTITY_FLAGS
// Bit flags which can be passed into TASK_GOTO_ENTITY

ENUM EGOTO_ENTITY_FLAGS

	EGOTO_ENTITY_DEFAULT											= 0,

	//*********************************************************************
	// EGOTO_ENTITY_NEVER_SLOW_FOR_PATH_LENGTH
	// When following an entity, this ped will never slow down because of
	// a short path.
	// Only valid with TASK_GOTO_ENTITY
	
	EGOTO_ENTITY_NEVER_SLOW_FOR_PATH_LENGTH							= 1

ENDENUM

//***********************************************************************************
// EWAYPOINT_FOLLOW_FLAGS
// A combination of these flags can be passed into TASK_FOLLOW_WAYPOINT_RECORDING

ENUM EWAYPOINT_FOLLOW_FLAGS

    EWAYPOINT_DEFAULT                   = 0,

    //****************************************************************************
    // EWAYPOINT_TURN_TO_FACE_WAYPOINT_HEADING_AT_END
    // Turns the ped to face the heading of the final waypoint when the task ends
    
    EWAYPOINT_TURN_TO_FACE_WAYPOINT_HEADING_AT_END              = 1,
    
    //***************************************************************
    // EWAYPOINT_NAVMESH_TO_INITIAL_WAYPOINT
    // If necessary, uses the navmesh to get to the initial waypoint
    
    EWAYPOINT_NAVMESH_TO_INITIAL_WAYPOINT                       = 2,
    
    //********************************************************************************
    // EWAYPOINT_NAVMESH_BACK_TO_WAYPOINT_IF_LEFT_ROUTE
    // If the ped has left the route, will use the navmesh to return to last position
    
    EWAYPOINT_NAVMESH_BACK_TO_WAYPOINT_IF_LEFT_ROUTE            = 4,
    
    //*************************************************************************************************
    // EWAYPOINT_START_FROM_CLOSEST_POINT
    // Will start (or resume if interrupted) the waypoint playback from the closest segment to the ped
    
    EWAYPOINT_START_FROM_CLOSEST_POINT							= 8,
    
    //*********************************************************************************
    // EWAYPOINT_VEHICLES_USE_AI_SLOWDOWN
    // Vehicle AI will calculate speeds for turns instead of using the recorded values
    
    EWAYPOINT_VEHICLES_USE_AI_SLOWDOWN							= 16,
    
    //*********************************************************************************
    // EWAYPOINT_DO_NOT_RESPOND_TO_COLLISION_EVENTS
    // Ignore all collisions with other peds, players, objects and vehicles
    
	EWAYPOINT_DO_NOT_RESPOND_TO_COLLISION_EVENTS				= 32,
	
    //*********************************************************************************
    // EWAYPOINT_DO_NOT_SLOW_FOR_CORNERS
    // Ped will not slow for corners
    	
	EWAYPOINT_DO_NOT_SLOW_FOR_CORNERS							= 64,
	
    //*********************************************************************************
    // EWAYPOINT_START_TASK_INITIALLY_AIMING
    // Ped starts the task aiming at a position directly ahead of him
    // (avoids the ped lowering weapon briefly when first given this task)
    	
	EWAYPOINT_START_TASK_INITIALLY_AIMING						= 128,
	
    //*********************************************************************************
    // EWAYPOINT_START_TASK_EXACTSTOP
    // Ped will to an exact stop at the end of the route
    	
	EWAYPOINT_START_TASK_EXACTSTOP								= 256,		
		
	//*********************************************************************************
	// EWAYPOINT_USE_TIGHTER_TURN_SETTINGS
	// Ped will be able to turn faster than normal, to help negotiate awkward spaces
	
	EWAYPOINT_USE_TIGHTER_TURN_SETTINGS							= 512,
	
	//*********************************************************************************
	// EWAYPOINT_ALLOW_STEERING_AROUND_PEDS
	// Ped will perform ped/ped avoidance (unless playback is set as non-interruptible)
	
	EWAYPOINT_ALLOW_STEERING_AROUND_PEDS						= 1024,
	
	//*********************************************************************************
	// EWAYPOINT_SUPPRESS_EXACTSTOP
	// Suppress exact stops
	
	EWAYPOINT_SUPPRESS_EXACTSTOP								= 2048,
	
	//*******************************************************************************************************************
	// EWAYPOINT_SLOW_MORE_FOR_CORNERS
	// Dials up the amount which peds can slow to take corners - helps fix issues with peds running into doorframes, etc
	
	EWAYPOINT_SLOW_MORE_FOR_CORNERS								= 4096
		
ENDENUM


//*****************************************************************************************
// EASSISTED_ROUTE_FLAGS
// A combination of these flags can be passed into ASSISTED_MOVEMENT_SET_ROUTE_PROPERTIES

ENUM EASSISTED_ROUTE_FLAGS

    EASSISTED_DEFAULT                   						= 0,

    //****************************************************************
    // EASSISTED_ROUTE_ACTIVE_WHEN_STRAFING
    // Means that this route is active whilst the player is strafing
    
    EASSISTED_ROUTE_ACTIVE_WHEN_STRAFING           				= 2,
    
    //**********************************************************************************************
    // EASSISTED_ROUTE_DISABLE_IN_FORWARDS_DIRECTION
    // This route will not work in the forwards direction (the direction in which it was authored)
    
    EASSISTED_ROUTE_DISABLE_IN_FORWARDS_DIRECTION				= 4,
    
    //********************************************************************************************************
    // EASSISTED_ROUTE_DISABLE_IN_REVERSE_DIRECTION
    // This route will not work in the reverse direction (opposite to the direction in which it was authored)
        
    EASSISTED_ROUTE_DISABLE_IN_REVERSE_DIRECTION				= 8
    
ENDENUM
    
// NOTE: These are now mapped (as closely as possible) to firing patterns defined in commands_ped.sch
ENUM FIRING_TYPE
	FIRING_TYPE_DEFAULT = 0,								// Some of these don't translate to firing patterns so we'll just not use those ones
    FIRING_TYPE_1_BURST = FIRING_TYPE_DEFAULT,     			// Uses FIRING_TYPE_DEFAULT as it's no longer a valid type
    FIRING_TYPE_1_THEN_AIM = FIRING_PATTERN_SINGLE_SHOT,    // Fire 1 bullet then aim for the duration
    FIRING_TYPE_RANDOM_BURSTS = FIRING_PATTERN_BURST_FIRE,  // Fire random bursts for the time, can change the frequency using SET_PED_SHOOT_RATE
    FIRING_TYPE_CLIP = FIRING_TYPE_DEFAULT,        			// Uses FIRING_TYPE_DEFAULT as it's no longer a valid type
    FIRING_TYPE_CONTINUOUS = FIRING_PATTERN_FULL_AUTO       // Fires at the maximum rate for the duration, reloading if the clips empty
ENDENUM

// Only Pos/Neg Y will work correctly, since pitch is limited and we cannot control roll directly
// Should be safe to use for perpendicular directions though
ENUM MOVEMENT_AXIS
    MOVE_POSX = 0,
    MOVE_NEGX = 1,
    MOVE_POSY = 2,
    MOVE_NEGY = 3,
    MOVE_POSZ = 4,
    MOVE_NEGZ = 5
ENDENUM

// Cover exit types
STRICT_ENUM COVER_EXIT_TYPE
	IDLE_COVER_EXIT = 1,
	AIMING_COVER_EXIT = 2,
	CORNER_COVER_EXIT = 3
ENDENUM

//  This enum has to match the enum in script_tasks.h
HASH_ENUM SCRIPT_TASK_NAME
	SCRIPT_TASK_ANY,
	SCRIPT_TASK_INVALID,
	SCRIPT_TASK_PAUSE,
	SCRIPT_TASK_STAND_STILL,
	DEPRECATED_SCRIPT_TASK_FALL_AND_GET_UP,
	SCRIPT_TASK_JUMP,
	SCRIPT_TASK_COWER,
	SCRIPT_TASK_HANDS_UP,
	SCRIPT_TASK_DUCK,
	DEPRECATED_SCRIPT_TASK_SCRATCH_HEAD,
	DEPRECATED_SCRIPT_TASK_LOOK_ABOUT,
	SCRIPT_TASK_ENTER_VEHICLE,
	SCRIPT_TASK_LEAVE_VEHICLE,
	SCRIPT_TASK_VEHICLE_DRIVE_TO_COORD,
	SCRIPT_TASK_VEHICLE_DRIVE_TO_COORD_LONGRANGE,
	SCRIPT_TASK_VEHICLE_DRIVE_WANDER,
	SCRIPT_TASK_GO_STRAIGHT_TO_COORD,
	SCRIPT_TASK_GO_STRAIGHT_TO_COORD_RELATIVE_TO_ENTITY,
	DEPRECATED_SCRIPT_TASK_GO_STRAIGHT_TO_COORD_RELATIVE_TO_VEHICLE,
	SCRIPT_TASK_ACHIEVE_HEADING,
	SCRIPT_TASK_FOLLOW_POINT_ROUTE,
	SCRIPT_TASK_GO_TO_ENTITY,
	DEPRECATED_SCRIPT_TASK_GO_TO_PED,
	DEPRECATED_SCRIPT_TASK_FLEE_POINT,
	DEPRECATED_SCRIPT_TASK_FLEE_PED,
	SCRIPT_TASK_SMART_FLEE_POINT,
	SCRIPT_TASK_SMART_FLEE_PED,
	SCRIPT_TASK_WANDER_STANDARD,
	SCRIPT_TASK_FOLLOW_NAV_MESH_TO_COORD,
	SCRIPT_TASK_GO_TO_COORD_ANY_MEANS,
	SCRIPT_TASK_PERFORM_SEQUENCE,
	SCRIPT_TASK_LEAVE_ANY_VEHICLE,
	SCRIPT_TASK_AIM_GUN_SCRIPTED,
	SCRIPT_TASK_AIM_GUN_AT_ENTITY,
	SCRIPT_TASK_GO_TO_COORD_WHILE_SHOOTING,
	SCRIPT_TASK_TURN_PED_TO_FACE_ENTITY,
	DEPRECATED_SCRIPT_TASK_TURN_PED_TO_FACE_PED,
	SCRIPT_TASK_AIM_GUN_AT_COORD,
	SCRIPT_TASK_SHOOT_AT_COORD,
	DEPRECATED_SCRIPT_TASK_DESTROY_VEHICLE,
	DEPRECATED_SCRIPT_TASK_DIVE_AND_GET_UP,
	SCRIPT_TASK_SHUFFLE_TO_NEXT_VEHICLE_SEAT,
	SCRIPT_TASK_EVERYONE_LEAVE_VEHICLE,
	DEPRECATED_SCRIPT_TASK_DIVE_FROM_ATTACHMENT_AND_GET_UP,
	SCRIPT_TASK_GOTO_ENTITY_OFFSET,
	DEPRECATED_SCRIPT_TASK_GOTO_PED_OFFSET,
	DEPRECATED_SCRIPT_TASK_SIT_DOWN,
	SCRIPT_TASK_TURN_PED_TO_FACE_COORD,
	SCRIPT_TASK_DRIVE_POINT_ROUTE,
	DEPRECATED_SCRIPT_TASK_GO_TO_COORD_WHILE_AIMING,
	SCRIPT_TASK_VEHICLE_TEMP_ACTION,
	SCRIPT_TASK_BRING_VEHICLE_TO_HALT,
	SCRIPT_TASK_VEHICLE_MISSION,
	DEPRECATED_SCRIPT_TASK_GO_TO_OBJECT,
	DEPRECATED_SCRIPT_TASK_WEAPON_ROLL,
	DEPRECATED_SCRIPT_TASK_SIDEWAYS_DIVE,
	SCRIPT_TASK_DRIVE_BY,
	SCRIPT_TASK_USE_MOBILE_PHONE,
	SCRIPT_TASK_WARP_PED_INTO_VEHICLE,
	DEPRECATED_SCRIPT_TASK_USE_ATTRACTOR,
	SCRIPT_TASK_SHOOT_AT_ENTITY,
	DEPRECATED_SCRIPT_TASK_SHOOT_AT_PED,
	DEPRECATED_SCRIPT_TASK_FLEE_PED_ANY_MEANS,
	DEPRECATED_SCRIPT_TASK_DEAD,
	DEPRECATED_SCRIPT_TASK_GOTO_VEHICLE,
	SCRIPT_TASK_CLIMB,
	SCRIPT_TASK_PERFORM_SEQUENCE_FROM_PROGRESS,
	SCRIPT_TASK_GOTO_ENTITY_AIMING,
	DEPRECATED_SCRIPT_TASK_GOTO_PED_AIMING,
	DEPRECATED_SCRIPT_TASK_JETPACK,
	SCRIPT_TASK_SET_PED_DECISION_MAKER,
	SCRIPT_TASK_SET_PED_DEFENSIVE_AREA,
	DEPRECATED_SCRIPT_TASK_HOLD_OBJECT,
	DEPRECATED_SCRIPT_TASK_COMPLEX_PICKUP_OBJECT,
	SCRIPT_TASK_PED_SLIDE_TO_COORD,
	DEPRECATED_SCRIPT_TASK_SWIM_TO_COORD,
	SCRIPT_TASK_DRIVE_POINT_ROUTE_ADVANCED,
	SCRIPT_TASK_PED_SLIDE_TO_COORD_AND_PLAY_ANIM,
	DEPRECATED_SCRIPT_TASK_FOLLOW_PATROL_ROUTE,
	DEPRECATED_SCRIPT_TASK_GREET_PARTNER,
	DEPRECATED_SCRIPT_TASK_DIE_NAMED_ANIM,
	DEPRECATED_SCRIPT_TASK_FOLLOW_FOOTSTEPS,
	DEPRECATED_SCRIPT_TASK_WALK_ALONGSIDE_PED,
	DEPRECATED_SCRIPT_TASK_USE_CLOSEST_MAP_ATTRACTOR,
	DEPRECATED_SCRIPT_TASK_SET_IGNORE_WEAPON_RANGE_FLAG,
	DEPRECATED_SCRIPT_TASK_HAND_GESTURE,
	SCRIPT_TASK_PLAY_ANIM,
	DEPRECATED_SCRIPT_TASK_PLAY_ANIM_ADVANCED,	//	CommandTaskPlayAnimAdvanced uses SCRIPT_TASK_PLAY_ANIM rather than SCRIPT_TASK_PLAY_ANIM_ADVANCED
	DEPRECATED_SCRIPT_SET_TASK_PLAY_ANIM_PLAYBACK_COORDS,
	DEPRECATED_SCRIPT_TASK_PED_ARREST_PED,		//	gta_ny
	SCRIPT_TASK_ARREST_PED,
	SCRIPT_TASK_COMBAT,
	SCRIPT_TASK_COMBAT_TIMED,
	SCRIPT_TASK_SEEK_COVER_FROM_POS,
	SCRIPT_TASK_SEEK_COVER_FROM_PED,
	SCRIPT_TASK_SEEK_COVER_TO_COVER_POINT,
	DEPRECATED_SCRIPT_TASK_SET_COMBAT_DECISION_MAKER,
	SCRIPT_TASK_TOGGLE_DUCK,
	DEPRECATED_SCRIPT_TASK_USE_SKIS,
	SCRIPT_TASK_GUARD_DEFENSIVE_AREA,
	DEPRECATED_SCRIPT_TASK_PICKUP_AND_CARRY_OBJECT,
	DEPRECATED_SCRIPT_TASK_SEEK_COVER_TO_OBJECT,
	SCRIPT_TASK_SEEK_COVER_TO_COORDS,
	DEPRECATED_SCRIPT_TASK_SIT_DOWN_PLAY_ANIM,
	SCRIPT_TASK_GUARD_ANGLED_DEFENSIVE_AREA,
	SCRIPT_TASK_STAND_GUARD,
	SCRIPT_TASK_CLIMB_LADDER,
	DEPRECATED_SCRIPT_TASK_SIT_DOWN_ON_OBJECT,
	SCRIPT_TASK_GUARD_SPHERE_DEFENSIVE_AREA,
	SCRIPT_TASK_START_SCENARIO_IN_PLACE,
	SCRIPT_TASK_START_SCENARIO_AT_POSITION,
	SCRIPT_TASK_START_VEHICLE_SCENARIO,
	SCRIPT_TASK_PUT_PED_DIRECTLY_INTO_COVER,
	SCRIPT_TASK_PUT_PED_DIRECTLY_INTO_COVER_FROM_TARGET,
	SCRIPT_TASK_PUT_PED_DIRECTLY_INTO_MELEE,
	SCRIPT_TASK_GUARD_CURRENT_POSITION,
	SCRIPT_TASK_USE_NEAREST_SCENARIO_TO_POS,
	SCRIPT_TASK_USE_NEAREST_SCENARIO_CHAIN_TO_POS,
	DEPRECATED_SCRIPT_TASK_LEAVE_GROUP,
	SCRIPT_TASK_PERFORM_SEQUENCE_LOCALLY,
	SCRIPT_TASK_COMBAT_HATED_TARGETS_IN_AREA,
	SCRIPT_TASK_COMBAT_HATED_TARGETS_AROUND_PED,
	DEPRECATED_SCRIPT_TASK_HOLSTERING_WEAPON,
	DEPRECATED_SCRIPT_TASK_COMBAT_ROLL,
	DEPRECATED_SCRIPT_TASK_MOBILE_CONVERSATION,
	SCRIPT_TASK_SWAP_WEAPON,
	SCRIPT_TASK_RELOAD_WEAPON,
	DEPRECATED_SCRIPT_TASK_DROP_OBJECT,
	SCRIPT_TASK_COMBAT_HATED_TARGETS_AROUND_PED_TIMED,
	SCRIPT_TASK_GET_OFF_BOAT,
	SCRIPT_TASK_FOLLOW_NAVMESH_TO_COORD_ADVANCED,
	SCRIPT_TASK_PATROL,
	SCRIPT_TASK_STAY_IN_COVER,
	SCRIPT_TASK_HANG_GLIDER,
	SCRIPT_TASK_FOLLOW_TO_OFFSET_OF_ENTITY,
	SCRIPT_TASK_FOLLOW_TO_OFFSET_OF_PICKUP,
	SCRIPT_TASK_GO_TO_COORD_WHILE_AIMING_AT_COORD,
	SCRIPT_TASK_GO_TO_COORD_WHILE_AIMING_AT_ENTITY,
	DEPRECATED_SCRIPT_TASK_GO_TO_COORD_WHILE_AIMING_AT_PED,
	DEPRECATED_SCRIPT_TASK_GO_TO_COORD_WHILE_AIMING_AT_VEHICLE,
	DEPRECATED_SCRIPT_TASK_GO_TO_COORD_WHILE_AIMING_AT_OBJECT,
	SCRIPT_TASK_GO_TO_ENTITY_WHILE_AIMING_AT_COORD,
	DEPRECATED_SCRIPT_TASK_GO_TO_PED_WHILE_AIMING_AT_COORD,
	SCRIPT_TASK_GO_TO_ENTITY_WHILE_AIMING_AT_ENTITY,
	DEPRECATED_SCRIPT_TASK_GO_TO_PED_WHILE_AIMING_AT_PED,
	DEPRECATED_SCRIPT_TASK_GO_TO_PED_WHILE_AIMING_AT_VEHICLE,
	DEPRECATED_SCRIPT_TASK_GO_TO_PED_WHILE_AIMING_AT_OBJECT,
	SCRIPT_TASK_USE_WALKIE_TALKIE,
	SCRIPT_TASK_CHAT_TO_PED,
	DEPRECATED_SCRIPT_TASK_WARP_PED_ONTO_VEHICLE,
	SCRIPT_TASK_FIRE_FLARE,
	SCRIPT_TASK_BIND_POSE,
	SCRIPT_TASK_NM_ELECTROCUTE,
	SCRIPT_TASK_NM_HIGH_FALL,
	SCRIPT_TASK_NM_DANGLE,
	SCRIPT_TASK_NM_SLUNG_OVER_SHOULDER,
	SCRIPT_TASK_NM_STUMBLE,
	SCRIPT_TASK_SKY_DIVE,
	SCRIPT_TASK_PARACHUTE,
	SCRIPT_TASK_PARACHUTE_TO_TARGET,
	SCRIPT_SET_PARACHUTE_TASK_TARGET,
	SCRIPT_TASK_FOLLOW_WAYPOINT_ROUTE,
	DEPRECATED_SCRIPT_TASK_GET_ON_SKI_LIFT,
	SCRIPT_TASK_NM_ATTACH_TO_VEHICLE,
	SCRIPT_TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS,
	SCRIPT_TASK_MOVE_NETWORK,
	SCRIPT_TASK_SYNCHRONIZED_SCENE,
	SCRIPT_TASK_VEHICLE_SHOOT_AT_COORD,
	SCRIPT_TASK_VEHICLE_SHOOT_AT_ENTITY,
	SCRIPT_TASK_VEHICLE_PARK,
	SCRIPT_TASK_MOUNT_ANIMAL,
	SCRIPT_TASK_DISMOUNT_ANIMAL,
	SCRIPT_TASK_THROW_PROJECTILE,
	SCRIPT_TASK_VEHICLE_AIM_AT_COORD,
	SCRIPT_TASK_VEHICLE_AIM_AT_ENTITY,
	SCRIPT_TASK_VEHICLE_AIM_USING_CAMERA,
	SCRIPT_TASK_ADVANCE_TO_TARGET_IN_LINE,
	SCRIPT_TASK_RAPPEL_FROM_HELI,
	SCRIPT_TASK_GENERAL_SWEEP,
	SCRIPT_TASK_DRAG_PED_TO_COORD,
	SCRIPT_TASK_VEHICLE_FOLLOW_WAYPOINT_RECORDING,
	SCRIPT_TASK_RAPPEL_DOWN_WALL,
	SCRIPT_TASK_GO_TO_COORD_AND_AIM_AT_HATED_ENTITIES_NEAR_COORD,
	SCRIPT_TASK_WANDER_IN_AREA,
	SCRIPT_TASK_VEHICLE_GOTO_NAVMESH,
	SCRIPT_TASK_IN_CUSTODY,
	SCRIPT_TASK_LOOK_AT_ENTITY,
	SCRIPT_TASK_LOOK_AT_COORD,
	SCRIPT_TASK_VEHICLE_CHASE,
	SCRIPT_TASK_STEALTH_KILL,
	SCRIPT_TASK_HELI_CHASE,
	SCRIPT_TASK_PLANE_CHASE,
	SCRIPT_TASK_PLANE_LAND,
	SCRIPT_TASK_SHOCKING_EVENT_BACK_AWAY,
    SCRIPT_TASK_SHOCKING_EVENT_HURRY_AWAY,
    SCRIPT_TASK_SHOCKING_EVENT_REACT,
    SCRIPT_TASK_WRITHE,
    SCRIPT_TASK_EXIT_COVER,
    SCRIPT_TASK_PLANT_BOMB,
    SCRIPT_TASK_INVESTIGATE_COORDS,
    SCRIPT_TASK_WANDER_SPECIFIC,
    SCRIPT_TASK_SHARK_CIRCLE_COORD,
    SCRIPT_TASK_SHARK_CIRCLE_PED,
    SCRIPT_TASK_REACT_AND_FLEE_COORD,
    SCRIPT_TASK_REACT_AND_FLEE_PED,
    SCRIPT_TASK_GO_TO_COORD_ANY_MEANS_EXTRA_PARAMS,
    SCRIPT_TASK_USE_NEAREST_TRAIN_SCENARIO_TO_POS,
    SCRIPT_TASK_JETPACK,
    SCRIPT_TASK_GO_TO_COORD_ANY_MEANS_EXTRA_PARAMS_WITH_CRUISE_SPEED,
	SCRIPT_TASK_AGITATED_ACTION
ENDENUM


ENUM SCRIPTTASKSTATUS
    WAITING_TO_START_TASK = 0,
    PERFORMING_TASK,
    DORMANT_TASK,
    VACANT_STAGE,
    GROUP_TASK_STAGE,
    ATTRACTOR_SCRIPT_TASK_STAGE,
    SECONDARY_TASK_STAGE,
    FINISHED_TASK
ENDENUM

ENUM COVERPOINT_USAGE
    COVUSE_WALLTOLEFT,           // Fires round to the right 
    COVUSE_WALLTORIGHT,         // Fires round to the left 
    COVUSE_WALLTOBOTH,          // Must fire over the top, used for low or high cover points 
    COVUSE_WALLTONEITHER      // Fires either left or right 
ENDENUM

ENUM COVERPOINT_HEIGHT
    COVHEIGHT_LOW = 0,              // < 1.4m Will crouch behind and fire over the top 
    COVHEIGHT_HIGH,                    // <Unused
    COVHEIGHT_TOOHIGH              // >= 2.0m Must spin left or right to fire depending on WALL_TO_LEFT or WALL_TO_RIGHT COVERPOINT_USAGE
ENDENUM

ENUM COVERPOINT_ARC
    COVARC_180 = 0,
    COVARC_120,
    COVARC_90,
    COVARC_0TO60,
    COVARC_300TO0,
    COVARC_0TO45,
    COVARC_315TO0
ENDENUM

ENUM COVERPOINT_STATUS
    COVSTATUS_Invalid = 1,				// not been checked yet
    COVSTATUS_Clear = 2,				// cover point is clear
    COVSTATUS_PositionBlocked = 4		// cover point is blocked by something
ENDENUM

ENUM DUCK_TOGGLE
    TOGGLE_DUCK_AUTO = -1,
    TOGGLE_DUCK_OFF,
    TOGGLE_DUCK_ON
ENDENUM

ENUM MOBILE_PHONE_SUB_TASK
    MOBILE_SUB_TASK_PHONE_IN,
    MOBILE_SUB_TASK_PHONE_TALK,
    MOBILE_SUB_TASK_PHONE_OUT,
    MOBILE_SUB_TASK_PHONE_OTHER
ENDENUM

ENUM SEATED_FLAGS
    SF_NONE = 0,
    SF_DOINSTANTLY  = 1,
    SF_LOOPANIM = 2
ENDENUM

ENUM CLIMB_STATE
    CS_NOT_CLIMBING = 0,
    CS_CLIMBING,                    //CS_CLIMBING means the ped is climbing, or valuting 
    CS_HANGING,                     //CS_HANGING means that the ped is hanging from an edge and is ready to use a shimmy task. 
    CS_SHIMMYING_LEFT,
    CS_SHIMMYING_RIGHT
ENDENUM

ENUM ROLL_DIR
    RD_LEFT = 0,
    RD_RIGHT,
    RD_FWD,
    RD_BWD
ENDENUM

ENUM FLARE_TYPE
    FT_WARNING = 0,             // Ped will fire a flare high above the target
    FT_LIGHT_TARGET,            // Ped will try to shed some light on the target
    FT_ATTACK_TARGET            // Ped will fire directly at the target
ENDENUM

ENUM CHAT_FLAGS
    CF_IS_INITIATOR         = 1,
    CF_DO_QUICK_CHAT        = 2,
    CF_GO_TO_SPECIFIC_POS   = 4,
    CF_USE_CUSTOM_HEADING   = 8,
    CF_AUTO_CHAT            = 16,
    CF_PLAY_GREETING_GESTURES = 32, // Will say a generic greeting to the ped they are talking to initially, this will force the other ped into a response
    CF_PLAY_GOODBYE_GESTURES = 64   // Similar to the above but on leaving (Note, you should only set this and the above flag on one of the peds as response is automatically handled)
ENDENUM

// Keep in sync with eScriptAnimFlags in commands_task.cpp 

ENUM ANIMATION_FLAGS
    AF_DEFAULT = 0,                                     //                  
    AF_LOOPING = 1,                                     // Repeat the animation 
    AF_HOLD_LAST_FRAME = 2,                             // Hold on the last frame of the animation 
    AF_REPOSITION_WHEN_FINISHED = 4,                    // When the animation finishes pop the peds physical reprsentation position to match the visual representations position Note that the animator must not unwind the animation and must have an independent mover node 
    AF_NOT_INTERRUPTABLE = 8,                           // Can the task not be interupted by extenal events 
    AF_UPPERBODY = 16,                                  // Only plays the upper body part of the animation. Dampens any motion caused by the lower body animation.Note that the animation should include the root node 
    AF_SECONDARY = 32,                                  // The task will run in the secondary task slot. This means it can be used aswell as a movement task (for instance) 
    AF_REORIENT_WHEN_FINISHED = 64,                     // When the animation finishes pop the peds physical reprsentation direction to match the visual representations direction. Note that the animator must not unwind the animation and must have an independent mover node 
    AF_ABORT_ON_PED_MOVEMENT = 128,                     // Ends the animation early if the ped attemps to move e.g. if the player tries to move using the controller. Can also be used to blend out automatically when an ai ped starts moving by combining it with the AF_SECONDARY flag.
    AF_ADDITIVE = 256,                                  // Play back the animation additively. Note, this will only produce sensible results on specifically authored additive animations!
    AF_TURN_OFF_COLLISION = 512,                        // Do not react to collision detection whilst this anim is playing
    AF_OVERRIDE_PHYSICS = 1024,                         // Do not apply any physics forces whilst the anim is playing. Automatically turns off collision, extracts any initial offset provided in the clip and uses per frame mover extraction.
    AF_IGNORE_GRAVITY = 2048,                           // Do not apply gravity while the anim is playing
    AF_EXTRACT_INITIAL_OFFSET = 4096,                   // Extract an initial offset from the playback position authored by the animator
                                                        // Use this flag when playing back anims on different peds which have been authored
                                                        // to sync with each other
    AF_EXIT_AFTER_INTERRUPTED = 8192,                   // Exit the animation task if it is interrupted by another task (ie Natural Motion).  Without this flag bing set looped animations will restart ofter the NM task
    
    // Tag synchronizer flags - sync the anim against ped movement (walking / running / etc)
    AF_TAG_SYNC_IN = 16384,                             // Sync the anim whilst blending in (use for seamless transitions from walk / run into a full body anim)
    AF_TAG_SYNC_OUT = 32768,                            // Sync the anim whilst blending out (use for seamless transitions from a full body anim into walking / running behaviour)
    AF_TAG_SYNC_CONTINUOUS = 65536,                     // Sync all the time (Only usefull to synchronize a partial anim e.g. an upper body)
    
    AF_FORCE_START = 131072,                            // Force the anim task to start even if the ped is falling / ragdolling / etc. Can fix issues with peds not playing their anims immediately after a warp / etc
    AF_USE_KINEMATIC_PHYSICS = 262144,                  // Use the kinematic physics mode on the entity for the duration of the anim (it should push other entities out of the way, and not be pushed around by players / etc
    AF_USE_MOVER_EXTRACTION = 524288,                   // Updates the peds capsule position every frame based on the animation. Use in conjunction with AF_USE_KINEMATIC_PHYSICS to create characters that cannot be pushed off course by other entities / geometry / etc whilst playing the anim.

    AF_HIDE_WEAPON = 1048576,                           // Indicates that the ped's weapon should be hidden while this animation is playing.

    AF_ENDS_IN_DEAD_POSE = 2097152,                     // When the anim ends, kill the ped and use the currently playing anim as the dead pose
    AF_ACTIVATE_RAGDOLL_ON_COLLISION = 4194304,         // If the peds ragdoll bounds make contact with something physical (that isn't flat ground) activate the ragdoll and fall over.
    AF_DONT_EXIT_ON_DEATH = 8388608,					// Currently used only on secondary anim tasks. Secondary anim tasks will end automatically when the ped dies. Setting this flag stops that from happening."
    AF_ABORT_ON_WEAPON_DAMAGE = 16777216,				// Allow aborting from damage events (including non-ragdoll damage events) even when blocking other ai events using AF_NOT_INTERRUPTABLE.
    AF_DISABLE_FORCED_PHYSICS_UPDATE = 	33554432,		// Prevent adjusting the capsule on the enter state (useful if script is doing a sequence of scripted anims and they are known to more or less stand still) 
	AF_PROCESS_ATTACHMENTS_ON_START = 67108864,			// Force the attachments to be processed at the start of the clip
	AF_EXPAND_PED_CAPSULE_FROM_SKELETON = 134217728,	// Expands the capsule to the extents of the skeleton
	AF_USE_ALTERNATIVE_FP_ANIM = 268435456,				// Plays an alternative first person version of the clip on the player when in first person mode (the first person clip must be in the same dictionary, and be named the same as the anim you're playing, but with _FP appended on the end)
	AF_BLENDOUT_WRT_LAST_FRAME = 536870912,				// Start blending out the anim early, so that the blend out duration completes at the end of the animation.
	AF_USE_FULL_BLENDING = 1073741824                 	// Use full blending for this anim and override the heading/position adjustment in CTaskScriptedAnimation::CheckIfClonePlayerNeedsHeadingPositionAdjust(), so that we don't correct errors (special case such as scrip-side implemented AI tasks, i.e. diving)
ENDENUM

ENUM ANIM_PRIORITY_FLAGS
    AF_PRIORITY_LOW = 0,                                // Use the lowest TASK_SCRIPTED_ANIMATION slot
    AF_PRIORITY_MEDIUM = 1,                             // Use the medium TASK_SCRIPTED_ANIMATION slot
    AF_PRIORITY_HIGH = 2                                // Use the high TASK_SCRIPTED_ANIMATION slot
ENDENUM

ENUM IK_CONTROL_FLAGS
	AIK_NONE						= 0,					// No Ik control during the task
    AIK_DISABLE_LEG_IK				= 1,					// Disable leg ik during the task
	AIK_DISABLE_ARM_IK				= 2,					// Disable arm ik during the task
    AIK_DISABLE_HEAD_IK				= 4,					// Disable head ik during the task
    AIK_DISABLE_TORSO_IK			= 8,					// Disable torso ik during the task
    AIK_DISABLE_TORSO_REACT_IK		= 16,					// Disable torso react ik during the task
    AIK_USE_LEG_ALLOW_TAGS			= 32,					// Use anim leg allow tags to determine when leg ik is enabled
    AIK_USE_LEG_BLOCK_TAGS			= 64,					// Use anim leg block tags to determine when leg ik is disabled
    AIK_USE_ARM_ALLOW_TAGS			= 128,					// Use anim arm allow tags to determine when ik is enabled
    AIK_USE_ARM_BLOCK_TAGS			= 256,					// Use anim arm block tags to determine when ik is disabled
    AIK_PROCESS_WEAPON_HAND_GRIP	= 512,					// Process the left hand weapon grip ik during the task
    AIK_USE_FP_ARM_LEFT				= 1024,					// Use first person ik setup for left arm (cannot be used with AIK_DISABLE_ARM_IK)
    AIK_USE_FP_ARM_RIGHT			= 2048,					// Use first person ik setup for right arm (cannot be used with AIK_DISABLE_ARM_IK)
    AIK_DISABLE_TORSO_VEHICLE_IK	= 4096,					// Disable torso vehicle ik during the task
    AIK_LINKED_FACIAL				= 8192					// Searches the dictionary of the clip being played for another clip with the _facial suffix to be played as a facial animation.
ENDENUM

ENUM MOVE_NETWORK_FLAGS
	MOVE_DEFAULT = 0,
    MOVE_USE_KINEMATIC_PHYSICS = 4,
	MOVE_SECONDARY = 8,
	MOVE_USE_FIRST_PERSON_ARM_IK_LEFT = 16,
	MOVE_USE_FIRST_PERSON_ARM_IK_RIGHT = 32
ENDENUM

// New blend duration defines - for use with TASK_SCRIPTED_ANIMATION
CONST_FLOAT SLOW_BLEND_DURATION		0.25
CONST_FLOAT NORMAL_BLEND_DURATION	0.125
CONST_FLOAT FAST_BLEND_DURATION		0.0625
CONST_FLOAT INSTANT_BLEND_DURATION	0.0

// Keep in sync with CTaskScriptedAnimation::ePlayBackState (TaskScriptedAnimation.h)
ENUM ANIMATION_PLAYBACK_TYPE
	APT_EMPTY = 0,						// No anim will play at this priority 
	APT_SINGLE_ANIM = 1,				// A single anim will play at this priority
	APT_3_WAY_BLEND = 2					// A blend of three anims will be played at this priority. Weights can be controlled independently.
ENDENUM

// Keep in sync with CTaskScriptedAnimation::InitSlotData (TaskScriptedAnimation.h)
STRUCT ANIM_DATA

	ANIMATION_PLAYBACK_TYPE type = APT_EMPTY	
	
	STRING	dictionary0 = NULL			// The dictionary name containing the first anim (used in single clip and three way blend)
	STRING	anim0		= NULL			// The first anim name
	FLOAT	phase0		= 0.0			// The starting phase
	FLOAT	rate0		= 1.0			// The rate (speed) to play back the anim at. 1.0 is standard rate
	FLOAT	weight0		= 1.0			// How blended in the anim will be. When using multiple anims this can be used to affect
										// how much of the anim is visible relative to other anims.
										
	STRING	dictionary1 = NULL			// The dictionary name containing the second anim (only used in three way blend)
	STRING	anim1		= NULL			// The second anim name
	FLOAT	phase1		= 0.0			// The starting phase
	FLOAT	rate1		= 1.0			// The rate (speed) to play back the anim at. 1.0 is standard rate
	FLOAT	weight1		= 1.0			// How blended in the anim will be. When using multiple anims this can be used to affect
										// how much of the anim is visible relative to other anims.
										
	STRING	dictionary2 = NULL			// The dictionary name containing the third anim (only used in 3 way blend)
	STRING	anim2		= NULL			// The third anim name
	FLOAT	phase2		= 0.0			// The starting phase
	FLOAT	rate2		= 1.0			// The rate (speed) to play back the anim at. 1.0 is standard rate
	FLOAT	weight2		= 1.0			// How blended in the anim will be. When using multiple anims this can be used to affect
										// how much of the anim is visible relative to other anims.
										
	INT 	filter			= 0						// The hash of the name of the filter to apply at this priority level
	FLOAT 	blendInDelta 	= NORMAL_BLEND_DURATION // How fast should this priority level be blended in
	FLOAT 	blendOutDelta	= NORMAL_BLEND_DURATION	// How fast should this priority level be blended out at the end
	INT 	timeToPlay		= -1					// Time (in milliseconds) to play this priority level for
	ANIMATION_FLAGS flags	= AF_DEFAULT			// Animation flags for this level
	IK_CONTROL_FLAGS ikFlags= AIK_NONE				// Ik control flags for this level
		
ENDSTRUCT

// Keep in sync with CTaskMoVEScripted::ScriptInitialParameters (TaskMoveScripted.h)
STRUCT MOVE_INITIAL_PARAMETERS

	INT		clipSetHash0			= 0			// Hash of the first initial clipset
	INT		clipSetVariableHash0	= 0			// Hash of the firstinitial variable clipset
	INT		clipSetHash1			= 0			// Hash of the second initial clipset
	INT		clipSetVariableHash1	= 0			// Hash of the second initial variable clipset

	STRING	floatParamName0			= NULL		// Name of the first float MoVE parameter
	FLOAT	floatParamValue0		= 0.0		// Value of the first float MoVE parameter
	FLOAT	floatParamLerpValue0	= -1.0		// Lerp value of the first float MoVE parameter
	STRING	floatParamName1			= NULL		// Name of the second float MoVE parameter
	FLOAT	floatParamValue1		= 0.0		// Value of the second float MoVE parameter
	FLOAT	floatParamLerpValue1	= -1.0		// Lerp value of the second float MoVE parameter

	STRING	boolParamName0			= NULL		// Name of the first bool MoVE parameter
	BOOL	boolParamValue0			= false		// Value of the first bool MoVE parameter
	STRING	boolParamName1			= NULL		// Name of the secon bool MoVE parameter
	BOOL	boolParamValue1			= false		// Value of the second bool MoVE parameter
		
ENDSTRUCT

ENUM SCRIPT_LOOK_FLAG
   	SLF_DEFAULT 				= 0 ,   
	SLF_SLOW_TURN_RATE			= 1,   // turn the head toward the target slowly
	SLF_FAST_TURN_RATE			= 2,   // turn the head toward the target quickly
	SLF_EXTEND_YAW_LIMIT		= 4,   // wide yaw head limits
	SLF_EXTEND_PITCH_LIMIT		= 8,   // wide pitch head limit
	SLF_WIDEST_YAW_LIMIT		= 16,  // widest yaw head limit
	SLF_WIDEST_PITCH_LIMIT		= 32,  // widest pitch head limit
	SLF_NARROW_YAW_LIMIT		= 64,  // narrow yaw head limits
	SLF_NARROW_PITCH_LIMIT		= 128, // narrow pitch head limit
	SLF_NARROWEST_YAW_LIMIT		= 256, // narrowest yaw head limit
	SLF_NARROWEST_PITCH_LIMIT	= 512, // narrowest pitch head limit
	SLF_USE_TORSO				= 1024, // use the torso aswell as the neck and head (currently disabled)
	SLF_WHILE_NOT_IN_FOV		= 2048,// keep tracking the target even if they are not in the hard coded FOV
	SLF_USE_CAMERA_FOCUS		= 4096,// use the camera as the target
	SLF_USE_EYES_ONLY			= 8192,// only track the target with the eyes   
	SLF_USE_LOOK_DIR			= 16384,// use information in look dir DOF
	SLF_FROM_SCRIPT				= 32768, // internal use only
	SLF_USE_REF_DIR_ABSOLUTE	= 65536  // use absolute reference direction mode for solver
ENDENUM

// Keep in sync with eLookAtPriority in IKManager.h
ENUM SCRIPT_LOOK_PRIORITY
	SLF_LOOKAT_VERY_LOW = 0,
	SLF_LOOKAT_LOW,
	SLF_LOOKAT_MEDIUM,
	SLF_LOOKAT_HIGH,
	SLF_LOOKAT_VERY_HIGH
ENDENUM


ENUM SCRIPT_INVESTIGATE_FLAG
  SIF_DEFAULT = 0,
	SIF_DONT_RETURN_TO_ORIGINAL_POSITION = 1 // Don't return to the position you started in when the investigation is finished
ENDENUM

ENUM PATROL_ALERT_STATE
    PAS_CASUAL = 0,
    PAS_ALERT
ENDENUM

//*********************************************************************************************************
// ENTER_EXIT_VEHICLE_FLAGS
// Set of flags to define the behaviour of the enter and exit vehicle tasks
ENUM ENTER_EXIT_VEHICLE_FLAGS
    // If the task is interupted (bumped, shot), dont resume.
    ECF_RESUME_IF_INTERRUPTED = 1,
	// Warps ped to entry point ready to open the door/enter seat
    ECF_WARP_ENTRY_POINT = 2,
    // Jack the ped occupying the vehicle, regardless of relationship status
    ECF_JACK_ANYONE = 8,
	// Warp the ped onto the vehicle
	ECF_WARP_PED = 16,
    // Dont wait for the vehicle to stop before exiting
    ECF_DONT_WAIT_FOR_VEHICLE_TO_STOP = 64,
    // Dont close the vehicle door
    ECF_DONT_CLOSE_DOOR = 256,
	// Allow ped to warp to the seat if entry is blocked
    ECF_WARP_IF_DOOR_IS_BLOCKED = 512,
    // Jump out of the vehicle
    ECF_JUMP_OUT = 4096,
    // TASK_LEAVE_ANY_VEHICLE auto defaults the ECF_WARP_IF_DOOR_IS_BLOCKED, set this flag to not set that
    ECF_DONT_DEFAULT_WARP_IF_DOOR_BLOCKED = 65536,
    // Use entry/exit point on the left hand side
    ECF_USE_LEFT_ENTRY = 131072,
    // Use entry/exit point on the right hand side
    ECF_USE_RIGHT_ENTRY = 262144,
     // When jacking just pull the ped out, but don't get in
    ECF_JUST_PULL_PED_OUT = 524288,
    // Disable shuffling - forces ped to use direct door only
    ECF_BLOCK_SEAT_SHUFFLING = 1048576,
    //  Allow ped to warp if the shuffle link to that seat is blocked by someone
    ECF_WARP_IF_SHUFFLE_LINK_IS_BLOCKED = 4194304,
    // Never jack anyone when entering/exiting
    ECF_DONT_JACK_ANYONE = 8388608,
    // Wait for our entry point to be clear of peds before exiting
    ECF_WAIT_FOR_ENTRY_POINT_TO_BE_CLEAR = 16777216
ENDENUM

//Specifies what components are attached at the end of a playing a attach anim
ENUM NM_ATTACH_COMPONENTS
    NAC_LEFT_HAND        = 1,
    NAC_RIGHT_HAND      = 2,
    NAC_LEFT_FOOT        = 4,
    NAC_RIGHT_FOOT      = 8,

    NAC_LEFT_FOREARM    = 16,
    NAC_RIGHT_FOREARM   = 32,
    NAC_LEFT_SHIN       = 64,
    NAC_RIGHT_SHIN      = 128,

    NAC_LEFT_THIGH      = 256,
    NAC_RIGHT_THIGH     = 512
ENDENUM



// Specifies the list of available move networks
ENUM MOVE_NETWORK
    MOVE_NETWORK_MINIGAME_BENCHPRESS    = 1,
    MOVE_NETWORK_MINIGAME_SQUATS
ENDENUM

// Scripted Gun Tasks
ENUM SCRIPTED_GUN_TASK
	SCRIPTED_GUN_TASK_ON_CRATE			  = HASH("SCRIPTED_GUN_TASK_ON_CRATE"),
	SCRIPTED_GUN_TASK_HANGING_UPSIDE_DOWN = HASH("SCRIPTED_GUN_TASK_HANGING_UPSIDE_DOWN"),
	SCRIPTED_GUN_TASK_ON_ROPE			  = HASH("SCRIPTED_GUN_TASK_ON_ROPE"),
	SCRIPTED_GUN_TASK_DINGY_RPG			  = HASH("SCRIPTED_GUN_TASK_DINGY_RPG"),
	SCRIPTED_GUN_TASK_CRATE_RPG			  = HASH("SCRIPTED_GUN_TASK_CRATE_RPG"),
	SCRIPTED_GUN_TASK_CRATE_BUDDY		  = HASH("SCRIPTED_GUN_TASK_CRATE_BUDDY"),
	SCRIPTED_GUN_TASK_PLANE_WING		  = HASH("SCRIPTED_GUN_TASK_PLANE_WING"),
	SCRIPTED_GUN_TASK_BIKE				  = HASH("SCRIPTED_GUN_TASK_BIKE")
ENDENUM

ENUM ADVANCE_TO_TARGET_FLAGS
	ATTF_DISABLE_AUTO_CROUCHING = 1,
	ATTF_DISABLE_HAND_SIGNALS 	= 2,
	ATTF_DEFAULT 				= 0
ENDENUM

ENUM STARTING_HURT_MODE
	SHM_ONGROUND = 0
ENDENUM

// Mobile Phone modes. Ensure this remains in sync with the "PhoneMode" enum in TaskMobilePhone.h.
ENUM PHONE_MODE
		Mode_None = 0,
		Mode_ToCall,
		Mode_ToText,
		Mode_ToCamera,
		Mode_Max
ENDENUM

CONST_FLOAT WALK_BLEND_IN          1.5			// 20frms
CONST_FLOAT WALK_BLEND_OUT        -1.5			// 20frms
CONST_FLOAT REALLY_SLOW_BLEND_IN   2.0			// 15frms
CONST_FLOAT REALLY_SLOW_BLEND_OUT -2.0			// 15frms
CONST_FLOAT SLOW_BLEND_IN          4.0			// 8frms
CONST_FLOAT SLOW_BLEND_OUT        -4.0			// 8frms
CONST_FLOAT NORMAL_BLEND_IN        8.0			// 4frms
CONST_FLOAT NORMAL_BLEND_OUT      -8.0			// 4frms
CONST_FLOAT FAST_BLEND_IN          16.0			// 2frms
CONST_FLOAT FAST_BLEND_OUT        -16.0			// 2frms
CONST_FLOAT INSTANT_BLEND_IN       1000.0		// 0frms
CONST_FLOAT INSTANT_BLEND_OUT     -1000.0		// 0frms

CONST_INT DEFAULT_TIME_BEFORE_WARP                  20000
CONST_INT DEFAULT_TIME_NEVER_WARP                   -1

CONST_FLOAT DEFAULT_SEEK_RADIUS                     0.5
CONST_FLOAT DEFAULT_NAVMESH_RADIUS                  0.25
CONST_FLOAT DEFAULT_NAVMESH_FINAL_HEADING           40000.0

// Used by TASK_VEHICLE_ESCORT
CONST_FLOAT	DEFAULT_ESCORT_FORWARD_DIST				5.0
CONST_FLOAT DEFAULT_ESCORT_SIDE_DIST				2.0
CONST_FLOAT DEFAULT_ESCORT_SIDE_DIST_BIKE			1.4
CONST_FLOAT DEFAULT_ESCORT_SIDE_DIST_HELI			15.0

//~>                        Movement commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Gives the task to set a ped duck state.
NATIVE PROC TASK_TOGGLE_DUCK(PED_INDEX PedIndex, DUCK_TOGGLE toggle ) = "0xa5af895dd224fdc0"

//INFO: 
//PARAM NOTES: Set time to -1 to perform the task forever.
//PURPOSE: Gives the ped a ducking task. 
NATIVE PROC TASK_DUCK(PED_INDEX PedIndex, INT Time) = "0x54b5addaf8a132f7"

//INFO: 
//PARAM NOTES: Set time to -1 to perform the task forever.
//PURPOSE: 
NATIVE PROC TASK_PAUSE(PED_INDEX PedIndex, INT Time) = "0x19c58ba8a663b64b"

//INFO: 
//PARAM NOTES: If StandStillTime is -1 then the character will stand forever. 
//PURPOSE: Gives the stand still task to a ped. More info..
NATIVE PROC TASK_STAND_STILL(PED_INDEX PedIndex, INT Time) = "0x83f5bcfffba26699"

//INFO: 
//PARAM NOTES:If UsePlayerLaunchForce is TRUE then the ped will use the same launch force as the player.
//  If UsePlayerLaunchForce is FALSE and the ped isn’t the player then the ped will jump using a smaller launch force. 
//PURPOSE: Force a char to jump. More info..
NATIVE PROC TASK_JUMP(PED_INDEX PedIndex, BOOL UsePlayerLaunch, BOOL DoSuperJump = false, BOOL UseFullSuperJumpForce = FALSE) = "0x012983f49702416c"

//INFO: Not approved for use in network scripts
//PARAM NOTES:
//PURPOSE: Gives the ped a cower task. More info..
NATIVE PROC TASK_COWER(PED_INDEX PedIndex, INT Time = -1) = "0x402a537158a551bd"

//INFO: 
//PARAM NOTES: Set time to -1 to perform the task forever.
//PURPOSE: Gives the ped a put hands up task.
NATIVE PROC TASK_HANDS_UP(PED_INDEX PedIndex, INT Time, PED_INDEX PedToFaceIndex = NULL, INT TimeToFacePed = -1, TASK_HANDS_UP_FLAGS Flags = HANDS_UP_NOTHING) = "0x3598f95a00026dd8"

//INFO: 
//PARAM NOTES: Set time to -1 to perform the task forever.
//PURPOSE: Make sure the hands up task is running, override the current duration. 
NATIVE PROC UPDATE_TASK_HANDS_UP_DURATION(PED_INDEX PedIndex, INT Time) = "0x46a203feec0ecef4"


//INFO: Works for the following commands TASK_ENTER_CAR_AS_DRIVER
//          TASK_ENTER_CAR_AS_PASSENGER
//          TASK_OPEN_DRIVER_DOOR
//          TASK_OPEN_PASSENGER_DOOR
//          TASK_GOTO_CHAR_OFFSET   
//PARAM NOTES: 
//PURPOSE: Sets the movement state on the next movment task. More info..
NATIVE PROC SET_NEXT_DESIRED_MOVE_STATE( FLOAT MoveBlendRatio ) = "0x8ff5f2b541a0e471"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets peds current move blend ratio.
NATIVE PROC SET_PED_DESIRED_MOVE_BLEND_RATIO( PED_INDEX PedIndex, FLOAT MoveBlendRatio ) = "0x98f7e0916b6b5a0b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets peds current move blend ratio.
NATIVE FUNC FLOAT GET_PED_DESIRED_MOVE_BLEND_RATIO( PED_INDEX PedIndex ) = "0x5e9b3bbf63a5e2f6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if a ped is getting up.
NATIVE FUNC BOOL IS_PED_GETTING_UP(PED_INDEX PedIndex) = "0x03454821a9ecf4aa"

//INFO: 
//PARAM NOTES: MinFireLoops is atleast how many times the ped will be going in the shoot from ground
// bForceShootOnGround - Makes the ped go into the shooting from ground state, and prevents him from randomly dying in the loops
// nShootFromGroundTimer - Time in milliseconds that defines how long ped keeps shooting in each cycle (before playing writhe anims again)
//PURPOSE: Puts the ped into the hurt state, a target needs to be provided
NATIVE PROC TASK_WRITHE(PED_INDEX PedIndex, PED_INDEX TargetPedIndex, INT nMinFireLoops, STARTING_HURT_MODE StartState = SHM_ONGROUND, BOOL bForceShootOnGround = FALSE, INT nShootFromGroundTimer = -1) = "0x99e9c3c2d6af9a52"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Checks if a ped is in writhe task
NATIVE FUNC BOOL IS_PED_IN_WRITHE(PED_INDEX PedIndex) = "0x645f244ecddef6cf"

//INFO: 
//PARAM NOTES:
//PURPOSE: Makes a ped go into sky diving mode (should be at a height when doing this)
NATIVE PROC TASK_SKY_DIVE(PED_INDEX PedIndex, BOOL Instant = FALSE) = "0x622c61505349f582"

//PURPOSE:: Forces a Ped into the Parachuting Task
//PARAM NOTES: Since performing this operation requires the Ped to have a Parachute Item, there is an option to give one in the parameters.
NATIVE PROC TASK_PARACHUTE(PED_INDEX PedIndex, BOOL GiveParachuteItem, BOOL Instant = FALSE) = "0xb7121915a3797c65"

//PURPOSE:: Navigates a Parachuting Ped to a Target location
//PARAM NOTES:
NATIVE PROC TASK_PARACHUTE_TO_TARGET(PED_INDEX PedIndex, VECTOR TargetLocation) = "0xf323d744a727a4a2"

//PURPOSE:: Modifies the current target for a Parachuting Ped being navigated by AI assistance
//PARAM NOTES:
NATIVE PROC SET_PARACHUTE_TASK_TARGET(PED_INDEX PedIndex, VECTOR TargetLocation) = "0x878fd7e3c8110527"

//PURPOSE:: Modifies the current thrust for a Parachuting Ped
//PARAM NOTES:
NATIVE PROC SET_PARACHUTE_TASK_THRUST(PED_INDEX PedIndex, FLOAT thrust_param) = "0x3ca038370f6e3223"

//PURPOSE:: Modifies the target entity for a Parachuting Ped
//PARAM NOTES:
NATIVE PROC SET_PARACHUTE_TASK_TARGET_ENTITY(PED_INDEX PedIndex, ENTITY_INDEX TargetIndex, VECTOR VecOffset) = "0x63b1ba4dbcd822ac"

//PURPOSE:: Forces a Ped into the jetpack Task
//PARAM NOTES: Auto gives ped a jetpack.
NATIVE PROC TASK_JETPACK(PED_INDEX PedIndex) = "0x23c36cbde291e36c"

//PURPOSE:: Forces a ped to go to the specified position
//PARAM NOTES: Must be running the jetpack task!
// fMinHeightFromGround - the minimum height the ped will try to remain above the terrain/heightmap
// bDisableThrustAtDestination - If false, ped will hover at destination else the ped will slowly descend
NATIVE PROC TASK_JETPACK_GO_TO_COORD(PED_INDEX PedIndex, VECTOR VecTarget, FLOAT fMinHeightFromGround = 20.0, BOOL bDisableThrustAtDestination = FALSE) = "0x586dae563b9e50c6"

//PURPOSE:: Forces a ped to go to the specified position
//PARAM NOTES: Must be running the jetpack task!
// TargetIndex - target entity to go to
// VecTargetOffset - desired offset to go to from target entity
// fMinHeightFromGround - the minimum height the ped will try to remain above the terrain/heightmap
// bDisableThrustAtDestination - If false, ped will hover at destination else the ped will slowly descend
// bUseRandomTimerWhenClose - If true: if ped is within 20m of target, it will use a random timer between 4 and 10 seconds before updating the target position. This helps to make the movement feel less tethered to the target entity. False by default.
NATIVE PROC TASK_JETPACK_GO_TO_ENTITY(PED_INDEX PedIndex, ENTITY_INDEX TargetIndex, VECTOR VecTargetOffset, FLOAT fMinHeightFromGround = 20.0, BOOL bDisableThrustAtDestination = FALSE, BOOL bUseRandomTimerWhenClose = FALSE) = "0x67794f749799bd7d"

//PURPOSE:: Forces a ped to shoot at the specified position
//PARAM NOTES: Must be running the jetpack task!
//  AbortRangeFloat is the distance in metres from the target at which the task will be aborted.
//  FireFrequencyPercentage should be between 0 (never shoot) and 100 (fire as fast as possible). 
//  FiringPatternHash allows you to set the firing pattern from a list: FIRING_PATTERN_HASH 
NATIVE PROC TASK_JETPACK_SHOOT_AT_COORD(PED_INDEX PedIndex, VECTOR VecTarget, FLOAT fAbortRange, INT iFrequencyPerfentage, INT iFiringPatternHash) = "0x6ebd50cacaab197e"

//PURPOSE:: Forces a ped to shoot at the specified position
//PARAM NOTES: Must be running the jetpack task!
//	TargetIndex is the desired target to shoot at
//  VecTargetOffset is the desired offset from the target entity
//  AbortRangeFloat is the distance in metres from the target at which the task will be aborted.
//  FireFrequencyPercentage should be between 0 (never shoot) and 100 (fire as fast as possible). 
//  FiringPatternHash allows you to set the firing pattern from a list: FIRING_PATTERN_HASH 
NATIVE PROC TASK_JETPACK_SHOOT_AT_ENTITY(PED_INDEX PedIndex, ENTITY_INDEX TargetIndex, VECTOR VecTargetOffset, FLOAT fAbortRange, INT iFrequencyPerfentage, INT iFiringPatternHash) = "0xa767f2d717d074f9"

//PURPOSE:: Terminates the drive-by task if it's currently running
//PARAM NOTES: Must be running the jetpack task!
NATIVE PROC TASK_JETPACK_STOP_SHOOTING(PED_INDEX PedIndex) = "0xafd3096512ccc6cd"

//INFO: 
//PARAM NOTES:
//PURPOSE: Makes a ped drag another ped to the specified destination.
NATIVE PROC TASK_DRAG_PED_TO_COORD(PED_INDEX DraggerIndex, PED_INDEX DraggedIndex, VECTOR VecCoors, FLOAT MoveBlendRatioForApproach = PEDMOVEBLENDRATIO_RUN) = "0xb269aa2c4e7f407c"

//~>                            Navigation commands

//INFO: 
//PARAM NOTES: If you want the ped to use a specific vehicle to get to the point then use VEHICLE_INDEX VehicleID. Otherwise, set VehicleID to NULL. 
//	UseLongRangeVehiclePathing: Setting to TRUE tells the vehicle to use TASK_VEHICLE_GOTO_COORDS_LONGRANGE--see its notes for more info
//PURPOSE: Tells a ped to go to a coord by any means. More info..
NATIVE PROC TASK_GO_TO_COORD_ANY_MEANS( PED_INDEX PedIndex, VECTOR VecCoors, FLOAT MoveBlendRatio, VEHICLE_INDEX VehicleIndex, BOOL UseLongRangeVehiclePathing = FALSE, DRIVINGMODE DrivingFlags = DRIVINGMODE_STOPFORCARS, FLOAT MaxRangeToShootTargets = -1.0) = "0x9603c0ec536c6425"

//INFO: 
//PARAM NOTES: As above but has an extra param to increase the distance required from vehicle to the target, a separate command because we cannot change existing script function signatures for patching
//	fDriveStraightLineDistance - allow script to define the distance at which vehicles switch to straight-line pathfinding; default to same value as in code (20m)
//  iExtraFlags - bitset of values from the TASK_GO_TO_COORD_ANY_MEANS_FLAGS enumeration
//	fWarpTimeMS - Warps ped to target position if ped gets stuck for this amount of time (in milliseconds) (only if fWarpTimeMS != -1.0). Only works for peds on foot or in a car/bike (not aircraft/boats). Ped will be removed from vehicle on warp.
//PURPOSE: Tells a ped to go to a coord by any means. More info..
NATIVE PROC TASK_GO_TO_COORD_ANY_MEANS_EXTRA_PARAMS( PED_INDEX PedIndex, VECTOR VecCoors, FLOAT MoveBlendRatio, VEHICLE_INDEX VehicleIndex, BOOL UseLongRangeVehiclePathing = FALSE, DRIVINGMODE DrivingFlags = DRIVINGMODE_STOPFORCARS, FLOAT MaxRangeToShootTargets = -1.0, FLOAT fExtraVehToTargetDistToPreferVeh = 0.0, FLOAT fDriveStraightLineDistance = 20.0, TASK_GO_TO_COORD_ANY_MEANS_FLAGS iExtraFlags = TGCAM_DEFAULT, FLOAT fWarpTimerMS = -1.0) = "0x110dedd855267ad4"

//INFO: 
//PARAM NOTES: As above but has an extra param to set initial cruise speed of vehicle.
//	fCruise
//  fTargetArriveDist - Distance to target at which vehicle task will quit. Defaulted to 4m.
//PURPOSE: Tells a ped to go to a coord by any means. More info..
NATIVE PROC TASK_GO_TO_COORD_ANY_MEANS_EXTRA_PARAMS_WITH_CRUISE_SPEED( PED_INDEX PedIndex, VECTOR VecCoors, FLOAT MoveBlendRatio, VEHICLE_INDEX VehicleIndex, BOOL UseLongRangeVehiclePathing = FALSE, DRIVINGMODE DrivingFlags = DRIVINGMODE_STOPFORCARS, FLOAT MaxRangeToShootTargets = -1.0, FLOAT fExtraVehToTargetDistToPreferVeh = 0.0, FLOAT fDriveStraightLineDistance = 20.0, TASK_GO_TO_COORD_ANY_MEANS_FLAGS iExtraFlags = TGCAM_DEFAULT, FLOAT fCruiseSpeed = -1.0, FLOAT fTargetArriveDist = 4.0) = "0xfaaa6a6a67097054"


//INFO: 
//PARAM NOTES: Time == -1 indicates continuous follow behaviour.
//PURPOSE: Tells the ped to go to the position of an entity offset by a certain vector
NATIVE PROC TASK_FOLLOW_TO_OFFSET_OF_ENTITY(PED_INDEX PedIndex, ENTITY_INDEX EntityIndex, VECTOR VecOffset, FLOAT MoveBlendRatio, INT Time = -1, FLOAT Radius = 0.1, BOOL RelativeOffset = TRUE) = "0x6fce069e4940878c"

//PARAM NOTES: Time == -1 indicates continuous follow behaviour.
//PURPOSE: Tells the ped to go to the position of a pickup offset by a certain vector. (Identical to TASK_FOLLOW_TO_OFFSET_OF_ENTITY but works on pickups instead of entities)
NATIVE PROC TASK_FOLLOW_TO_OFFSET_OF_PICKUP(PED_INDEX PedIndex, PICKUP_INDEX PickupIndex, VECTOR VecOffset, FLOAT MoveBlendRatio, INT Time = -1, FLOAT Radius = 0.1, BOOL RelativeOffset = TRUE) = "0x6f91735acae34873"

//INFO: 
//PARAM NOTES: if TimeBeforeTeleport is chosen to be -1 the ped will never warp. 
//PURPOSE: Tells the ped to go to a coord, without using the navemesh. More info..
NATIVE PROC TASK_GO_STRAIGHT_TO_COORD(PED_INDEX PedIndex, VECTOR VecCoors,  FLOAT MoveBlendRatio, INT Time = DEFAULT_TIME_BEFORE_WARP, FLOAT FinalHeading = DEFAULT_NAVMESH_FINAL_HEADING, FLOAT TargetRadius = 0.5) = "0x13c3030981ea7c3b"

//INFO: 
//PARAM NOTES:  if Time is chosen to be -1 the ped will never warp. 
//PURPOSE: Tells the ped to go to an offset coord from an entity, without using the navmesh. 
NATIVE PROC TASK_GO_STRAIGHT_TO_COORD_RELATIVE_TO_ENTITY(PED_INDEX PedIndex, ENTITY_INDEX EntityIndex, VECTOR VecOffset, FLOAT MoveBlendRatio, INT Time = DEFAULT_TIME_BEFORE_WARP) = "0xc98e8d7f0d9d4795"

//INFO: 
//PARAM NOTES:  if Time is chosen to be -1 the ped will never warp. 
//PURPOSE: Tells a ped to go to another entity.
NATIVE PROC TASK_GO_TO_ENTITY(PED_INDEX PedIndex, ENTITY_INDEX EntityIndex, INT Time = DEFAULT_TIME_BEFORE_WARP, FLOAT SeekRadius = DEFAULT_SEEK_RADIUS, FLOAT MoveBlendRatio = PEDMOVEBLENDRATIO_RUN, FLOAT SlowDownDistance = 2.0, EGOTO_ENTITY_FLAGS GotoFlags = EGOTO_ENTITY_DEFAULT) = "0xc149e50fbb27dd70"

//INFO:   if Time is chosen to be -1 the ped will never warp. 
//PARAM NOTES:The destination point is SeekRadiusFloat metres from the other entity’s position.
//  The exact destination position is calculated using the other entity’s heading offset by SeekAngleFloat degree
//PURPOSE: Tells the ped to go to an offset from the target entity. A combination of flags from the ESEEK_ENTITY_OFFSET_FLAGS enum may be passed in.
NATIVE PROC TASK_GOTO_ENTITY_OFFSET( PED_INDEX PedIndex, ENTITY_INDEX EntityIndex, INT Time = DEFAULT_TIME_BEFORE_WARP, FLOAT SeekRadius = DEFAULT_SEEK_RADIUS, FLOAT SeekAngle = 0.0, FLOAT MoveBlendRatio = PEDMOVEBLENDRATIO_RUN, ESEEK_ENTITY_OFFSET_FLAGS OffsetFlags = ESEEK_DEFAULT ) = "0x6624b56c8f9a7bbf"

//INFO:   if Time is chosen to be -1 the ped will never warp. 
//PARAM NOTES:The destination point is (fXOffset,fYOffset) from the other entity’s position.
//  Query for this task using 'SCRIPT_TASK_GOTO_ENTITY_OFFSET' as for TASK_GO_TO_ENTITY
//PURPOSE: Tells the ped to go to an offset from the target entity. A combination of flags from the ESEEK_ENTITY_OFFSET_FLAGS enum may be passed in.
NATIVE PROC TASK_GOTO_ENTITY_OFFSET_XY( PED_INDEX PedIndex, ENTITY_INDEX EntityIndex, INT Time = DEFAULT_TIME_BEFORE_WARP, FLOAT fTargetRadius = DEFAULT_SEEK_RADIUS, FLOAT fXOffset = 0.0, FLOAT fYOffset = 0.0, FLOAT MoveBlendRatio = PEDMOVEBLENDRATIO_RUN, ESEEK_ENTITY_OFFSET_FLAGS OffsetFlags = ESEEK_DEFAULT ) = "0xb17a6034b9f1bcc2"

//INFO: Task a ped to investigate at a given coordinate.
//PARAM NOTES: timeToSpendAtSearchPointInMS is in milleseconds, -1 meaning infinite.
//PURPOSE: Tells a ped to investigate a position. Instead of calling this, consider turning on a ped's 
//  CPED_CONFIG_FLAG_ListensToSoundEvents and BF_CanInvestigate combat flag, and peds will investigate sounds on their own.
NATIVE PROC TASK_INVESTIGATE_COORDS( PED_INDEX PedIndex, VECTOR vecCoords, INT timeToSpendAtSearchPointInMS = 4000, SCRIPT_INVESTIGATE_FLAG Flags = SIF_DEFAULT ) = "0xb834945c258dac7b"

//INFO: IMPORTANT NOTE : Sometimes a path may not be able to be found. This could happen because there simply isn't any way to get there, or maybe a bunch of dynamic objects have blocked the way, 
//  or maybe the destination is too far away. In this case the ped will simply stand still.
//  To identify when this has happened, you can use GET_NAVMESH_ROUTE_RESULT. This will help you find situations where peds cannot get to their target. 
//PARAM NOTES:Time is an INT value specifying milliseconds. If the ped has not achieved the target within the allotted time then the ped will be teleported to the target. 
// if Time is chosen to be -1 the ped will never warp. 
//PURPOSE: Tells a ped to follow the navmesh to the given coord. More info..  
NATIVE PROC TASK_FOLLOW_NAV_MESH_TO_COORD(PED_INDEX PedIndex,VECTOR VecCoors, FLOAT MoveBlendRatio, INT Time = DEFAULT_TIME_BEFORE_WARP, FLOAT Radius = DEFAULT_NAVMESH_RADIUS, ENAV_SCRIPT_FLAGS NavFlags = ENAV_DEFAULT, FLOAT FinalHeading = DEFAULT_NAVMESH_FINAL_HEADING ) = "0x7d1424753688ee7a"

//INFO:
//PARAM NOTES: iNavFlags is taken from the ENAV_SCRIPT_FLAGS enumeration.  NAVDATA struct is required, containing additional data.
//             When using a member of the NAVDATA structure, you must also specify the appropriate ENAV_SCRIPT_FLAG to enable it!
//PURPOSE: Same as TASK_FOLLOW_NAVMESH_TO_COORD, but allows greater control over the pathfinding.
NATIVE PROC TASK_FOLLOW_NAV_MESH_TO_COORD_ADVANCED(PED_INDEX PedIndex, VECTOR VecCoors, FLOAT MoveBlendRatio, INT Time , FLOAT Radius, ENAV_SCRIPT_FLAGS iNavFlags, NAVDATA navDataStruct, FLOAT FinalHeading = DEFAULT_NAVMESH_FINAL_HEADING ) = "0x72f317bc03266125"

//INFO: Peds navigate long distances using a series of smaller sub-routes.  Only one sub-route is ever stored in the navmesh task.
//      This script function queries that subroute to determine how much distance is left on it.  Therefore:
//		**You can only really trust the results of this function if "bThisIsLastRouteSection" returns as TRUE**
//      **Otherwise there may be any number of further sub-route sections remaining, but not yet calcualted..  Be careful!! **
//PARAM NOTES: Returns a member of the NAVMESH_ROUTE_RESULT enumeration, to indicate whether a nav task was found on the ped.
//             Passes back the distance and subroute information by parameter.
//PURPOSE: Query how much distance is remaining on a ped's navmesh route.
NATIVE FUNC NAVMESH_ROUTE_RESULT GET_NAVMESH_ROUTE_DISTANCE_REMAINING(PED_INDEX PedIndex, FLOAT & fOut_DistanceRemaining, INT & bOut_ThisIsLastRouteSection) = "0x9fa616df1ef7172a"

//INFO:  Returns true if the vehicle controlled by the ped is currently unable to find a valid route to go back to road
//PARAM NOTES:
//RETURNS:
//  true - Ped has a TASK_CONTROL_VEHICLE and the controlled vehicle is currently unable to find a valid route to go back to road
NATIVE FUNC BOOL IS_CONTROLLED_VEHICLE_UNABLE_TO_GET_TO_ROAD(PED_INDEX PedIndex) = "0xa8a55d2ba7497f6f"

// INFO: Retruns the state of any active TASK_FOLLOW_NAVMESH_TO_COORD task running on the ped
// RETURNS:
//	NAVMESHROUTE_TASK_NOT_FOUND - no navmesh task was found on this ped
//	NAVMESHROUTE_ROUTE_NOT_YET_TRIED - the task has not yet reached a state where it can determine whether it was successful or not
//	NAVMESHROUTE_ROUTE_NOT_FOUND - the task is unable to find a route to the target
//	NAVMESHROUTE_ROUTE_FOUND - the task is successful, and the ped is following the route
NATIVE FUNC NAVMESH_ROUTE_RESULT GET_NAVMESH_ROUTE_RESULT(PED_INDEX PedIndex) = "0xb02b2cd950b6ba04"

//INFO: 
//PARAM NOTES:
//PURPOSE:Gives a pd to try and acheive the given heading.
NATIVE PROC TASK_ACHIEVE_HEADING(PED_INDEX PedIndex, FLOAT heading, INT Time = 0) = "0x30e00b59448ab97e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Clears a point route.
NATIVE PROC TASK_FLUSH_ROUTE() = "0x83a64e1fe4669225"

//INFO: Use TASK_FLUSH_ROUTE to make the route empty.
//PARAM NOTES:
//PURPOSE: Adds a point to a route. More info..
NATIVE PROC TASK_EXTEND_ROUTE(VECTOR VecCoors) = "0x9d38259cb54342be"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tells a ped to follow a point route.
NATIVE PROC TASK_FOLLOW_POINT_ROUTE(PED_INDEX PedIndex, FLOAT MoveBlendRatio, FOLLOWPOINTROUTEMODE Mode) = "0x790dea4e63d61baa"

//INFO: 
//PARAM NOTES:FleeTime is an INT (-1 indicates flee forever) 
//PURPOSE: Tells a ped to flee the given coord. More info..
NATIVE PROC TASK_SMART_FLEE_COORD (PED_INDEX PedIndex, VECTOR VecCoors, FLOAT SafeDistance, INT FleeTime, BOOL bPreferPavements = FALSE, BOOL bQuitIfOutOfRange = FALSE) = "0x84918839a90c954c"

//INFO: 
//PARAM NOTES: FleeTime is an INT (-1 indicates flee forever) 
//PURPOSE: Tells a ped to flee the given ped. More info..
NATIVE PROC TASK_SMART_FLEE_PED(PED_INDEX PedIndex, PED_INDEX OtherPedIndex, FLOAT SafeDistance, INT FleeTime, BOOL bPreferPavements = FALSE, BOOL bUpdateTargetToNearestHatedPed = FALSE) = "0x7734082b0edb0be0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tells a ped to react and flee the given coord.
NATIVE PROC TASK_REACT_AND_FLEE_COORD(PED_INDEX PedIndex, VECTOR VecCoors) = "0x596713d55325f5c9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tells a ped to react and flee the given ped.
NATIVE PROC TASK_REACT_AND_FLEE_PED(PED_INDEX PedIndex, PED_INDEX OtherPedIndex) = "0x7a9da0518e81ec15"

//INFO:
//PARAM NOTES:  shockingEventId is the value returned from a previously created script shocking event.
//PURPOSE:  Tell the ped to back away from the target event.
NATIVE PROC TASK_SHOCKING_EVENT_BACK_AWAY(PED_INDEX PedIndex, INT shockingEventId) = "0xa19ac1e1c0d01b42"

//INFO:
//PARAM NOTES:  shockingEventId is the value returned from a previously created script shocking event.
//PURPOSE:  Tell the ped to hurry away from the target event.
NATIVE PROC TASK_SHOCKING_EVENT_HURRY_AWAY(PED_INDEX PedIndex, INT shockingEventId) = "0x4e742aa861140b96"

//INFO:
//PARAM NOTES:  shockingEventId is the value returned from a previously created script shocking event.
//PURPOSE:  Tell the ped to play an in-place sequence of reaction animations to the target event.
NATIVE PROC TASK_SHOCKING_EVENT_REACT(PED_INDEX PedIndex, INT shockingEventId) = "0xb5bc9e2b43334cef"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tells a ped to wander within a certain radius from the given position.
NATIVE PROC TASK_WANDER_IN_AREA(PED_INDEX PedIndex, VECTOR VecCenter, FLOAT Radius, FLOAT MinWaitTime = 3.0, FLOAT MaxWaitTime = 6.0) = "0x5315f7ac22dc95f1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tells a ped to wander. If you dont pass in a heading it will be randomized when tasks starts
NATIVE PROC TASK_WANDER_STANDARD(PED_INDEX PedIndex, FLOAT Heading = DEFAULT_NAVMESH_FINAL_HEADING, EWDR_SCRIPT_FLAGS WanderFlags = EWDR_DEFAULT) = "0xd86a0bc9cc0a625a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tells a ped to wander with a specific animation.
NATIVE PROC TASK_WANDER_SPECIFIC(PED_INDEX PedIndex, STRING ConditionalAnimGroup, STRING ConditionalAnim, FLOAT Heading = DEFAULT_NAVMESH_FINAL_HEADING) = "0x26f1da9738c260f2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if a peds path finding can use climbovers.
NATIVE PROC SET_PED_PATH_CAN_USE_CLIMBOVERS(PED_INDEX PedIndex, BOOL bUseClimbovers) = "0xcacf57ad414acc75"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if a peds path finding can use ladders.
NATIVE PROC SET_PED_PATH_CAN_USE_LADDERS(PED_INDEX PedIndex, BOOL bUseLadders) = "0x32bb80e6e576379a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if a peds path finding can drop from ladders.
NATIVE PROC SET_PED_PATH_CAN_DROP_FROM_HEIGHT(PED_INDEX PedIndex, BOOL bDrop) = "0x91d9c55e11392690"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a multiplier to the cost function which decides whether a ped should climb whilst navigating
//		   Default value is 1.0 which means the ped behaves as normal
//		   The lower the value, the more likely a ped is to use a climb.
//	       At 0.5 the ped will be twice as likely to climb as usual
//	 	   At 0.0 the ped will climb just as likely as walk, even for the smallest movements (so don't use a value this low!)
//		   At 2.0 the ped will be half as likely to use a climb
//		   Etc, etc..
//		   Be sure to set this back to 1.0 after use, or peds will behave strangely even after the mission ends.
NATIVE PROC SET_PED_PATH_CLIMB_COST_MODIFIER(PED_INDEX PedIndex, FLOAT fClimbModifier) = "0xd0b0e285f00a8b61"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if a peds path finding can enter water or not
NATIVE PROC SET_PED_PATH_MAY_ENTER_WATER(PED_INDEX PedIndex, BOOL bMayEnter) = "0xbe74e997fb714956"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if a peds path finding prefers to avoid entering and moving in water
NATIVE PROC SET_PED_PATH_PREFER_TO_AVOID_WATER(PED_INDEX PedIndex, BOOL bPreferToAvoid) = "0x8bb90eda0a7b150e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if a peds path finding avoid fires
NATIVE PROC SET_PED_PATH_AVOID_FIRE(PED_INDEX PedIndex, BOOL bAvoid) = "0x9ef69bf12b6fbcb3"

//INFO: 
//PARAM NOTES: fHeight = min Z height in meters that birds will be allowed to fly at.
//PURPOSE: Call this every frame to keep birds flying at a height >= the given value.
NATIVE PROC SET_GLOBAL_MIN_BIRD_FLIGHT_HEIGHT(FLOAT fHeight) = "0xb133bc406357c5a5"

//INFO: 
//PARAM NOTES: speed in ms/s will be clamped between 0.1 - 1.0, reccomended value is the default
//                          headingDegrees: Heading that the ped will achieve.
//PURPOSE: Slides a ped to the given coord. More info..
NATIVE PROC TASK_PED_SLIDE_TO_COORD(PED_INDEX PedIndex, VECTOR VecCoors, FLOAT headingDegrees, FLOAT speed = 0.75) = "0xed2842d9cc50eb6e"

//INFO: 
//PARAM NOTES: headingDegrees: Heading the ped will achieve at the point.
//                          blendDelta: How quickly the anim is blended. The larger number the quicker its blended slow 4.0, 8.0, 16.0, 1000.0 instant.
//                          IsLooped: true to loop the anim. 
//                          extracted velocities are required if the ped does not end up in the same place where the anim started. They move the capsule of the ped.
//                          ExtractBackwardsVelocity: update the y component of the ped
//                          ExtractSidewaysVelocity: update the x component of the ped
//                          HoldLastFrame: Holds the last frame of the anim. Note if set true HAS_PED_ANIM_FINISHED will always retur false 
//PURPOSE: Slides a ped to a specific coord and plays an anim. More info..
NATIVE PROC TASK_PED_SLIDE_TO_COORD_AND_PLAY_ANIM(PED_INDEX PedIndex, VECTOR VecCoors, FLOAT headingDegrees, FLOAT speed, STRING AnimName, STRING AnimDictName, FLOAT blendDelta, BOOL IsLooped, BOOL ExtractForwardVelocity, BOOL ExtractSidewaysVelocity, BOOL HoldLastFrame, INT TIME ) = "0x93a741ed3ed7f56f"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Slide a ped to a coord and set the heading change rate.
NATIVE PROC TASK_PED_SLIDE_TO_COORD_HDG_RATE(PED_INDEX PedIndex, VECTOR VecCoors, FLOAT headingDegrees, FLOAT speed, FLOAT headingChangeRate ) = "0xd6711eee6b632dae"

//INFO: The ped needs to be positioned and oriented so that a jump will locate an edge for the ped to grab.
//  If an edge can’t be found, the ped will just do a normal jump and land. If an edge can be found then the ped will climb and then stand on top of the found edge.
//  Don't place the ped too far from the object you want him to climb, even if the player can make it and you set UsePlayerLaunchForce to TRUE, it won't guarantee that the ped will make it.
//PARAM NOTES: If UsePlayerLaunchForce is TRUE then the ped will use the same launch force as the player. 
//                          If UsePlayerLaunchForce is FALSE and the ped isn’t the player then the ped will jump using a smaller launch force. 
//PURPOSE: Tells a ped to perform the climb task. More info..
NATIVE PROC TASK_CLIMB( PED_INDEX PedIndex, BOOL UsePlayerLaunchForce ) = "0x893ddd76cc7c67b1"

//INFO: This command handles everything needed to make a ped get on a ladder at the top or bottom, climb/descend it, 
//  and get off at the other end. The task decides whether the ped is supposed to climb or descend by examining which end of the ladder is nearest.
//  The ped needs to be positioned right next to the ladder they are supposed to use, and should also be facing it.
//  There are two possibilities for mounting the ladder - at the base of the ladder facing towards the front of it, and at the top of the ladder facing the reverse of the ladder. See the image below.
//  If successful, the ped will get on the ladder, climb, and then get off. 
//PARAM NOTES:
//PURPOSE: Tells a ped to perform a climb ladder task. More info..
NATIVE PROC TASK_CLIMB_LADDER( PED_INDEX PedIndex, BOOL bFast ) = "0x12425bd281be5f3c"

//INFO: This command handles rappelling down the side of a building given a specific rope and a desired height
//		The specified ped will need to be in position prior to calling this task, otherwise he/she will be warped
//PARAM NOTES: VecStartPos is the position that the ped should be in before playing the initial "climb over" animation
//			   ropeID is the ID of the rope that is being used for this rappel and the task fails without a valid ropeID
//			   fDestinationHeight is the Z position that is desired which the ped will not be allowed to go lower than
//			   VecRopeAnchorPos is the position that the rope is created/anchored at (the position that is likely passed into ADD_ROPE)
//PURPOSE: To get AI or a player to rappel down the side of a wall or building
NATIVE PROC TASK_RAPPEL_DOWN_WALL (PED_INDEX PedIndex, VECTOR VecStartPos, VECTOR VecRopeAnchorPos, FLOAT fDestinationHeight, ROPE_INDEX ropeID) = "0x42ee24d502e263b3"

//INFO: This command handles rappelling down the side of a building given a specific rope and a desired height
//		The specified ped will need to be in position prior to calling this task, otherwise he/she will be warped
//PARAM NOTES: VecStartPos is the position that the ped should be in before playing the initial "climb over" animation
//			   ropeID is the ID of the rope that is being used for this rappel and the task fails without a valid ropeID
//			   fDestinationHeight is the Z position that is desired which the ped will not be allowed to go lower than
//			   VecRopeAnchorPos is the position that the rope is created/anchored at (the position that is likely passed into ADD_ROPE)
//			   OverridenClipSet is the clipset that will be used to override the rappel animations
//PURPOSE: To get AI or a player to rappel down the side of a wall or building, using the provided clipset
NATIVE PROC TASK_RAPPEL_DOWN_WALL_USING_CLIPSET_OVERRIDE (PED_INDEX PedIndex, VECTOR VecStartPos, VECTOR VecRopeAnchorPos, FLOAT fDestinationHeight, ROPE_INDEX ropeID, STRING OverridenClipSet = NULL, BOOL SkipClimbOverWall = FALSE) = "0x80f9b0598b0c9c85"

//PURPOSE: Will return the current state (as an int) of the rappel down wall task, -1 if the ped is invalid or ped isn't running the task
NATIVE FUNC INT GET_TASK_RAPPEL_DOWN_WALL_STATE (PED_INDEX PedIndex) = "0xa0584425edd6ec9d"

//~>                        Anim commands

//INFO: Plays an anim on the specified ped
//PARAM NOTES: Flags:The flags parameter is made by combining any of the following flags using the or key which looks like this |
//  Including a flag is like setting it to true
//  Omitting a flag is like setting it to false
//  See the definition of ENUM ANIMATION_FLAGS (above) for more information on the anim flags
//
//	bAllowOverrideCloneUpdate is used in MP and has this effect: 
//	* On a locally controlled ped it will have the effect that the ped will not send a sync of the animation and will only run the animation locally.
//	* If bAllowOverrideCloneUpdate is used on a clone ped, the ped will only run the animation locally and wont send a request
//	to the owner to run the animation.	
//	Therefore bAllowOverrideCloneUpdate allows independent animating on peds, local or clones, and it will require that the script ensures
//	that no other networked animation is concurrently used or expected on the ped during any period of its use.
// 
// fBlendInDelta - the rate at which the task will blend in 
// The blend in duration is 1.0 / fBlendInDelta e.g. 1.0 / NORMAL_BLEND_IN -> 1.0 / 8.0 = 0.125 seconds 
// BlendOutDelta - the rate at which the task will blend out 
// The blend out duration is -1.0 / fBlendOutDelta e.g. -1.0 / NORMAL_BLEND_OUT -> -1.0 / -8.0 = 0.125 seconds
//
//PURPOSE: Plays a anim task on a ped. More info..
NATIVE PROC TASK_PLAY_ANIM(PED_INDEX PedIndex, STRING pAnimDictName,  STRING pAnimName, FLOAT fBlendInDelta = NORMAL_BLEND_IN, FLOAT fBlendOutDelta = NORMAL_BLEND_OUT, INT nTimeToPlay =-1, ANIMATION_FLAGS AnimFlags = AF_DEFAULT, FLOAT startPhase = 0.0, BOOL phaseControlled = FALSE, IK_CONTROL_FLAGS ikFlags = AIK_NONE, BOOL bAllowOverrideCloneUpdate = FALSE) = "0x49d97b076e3590ac"

//INFO: As for task_play_anim, but provides the function to specify an inital position and rotation to playback the anim from
//PARAM NOTES:  Pos - The initial position in World Coordinates to start the anim at
//              Rot - The initial rotation (in degrees, format << pitch, roll, heading >>) to playback the anim from 
//              Specifying the task flags AF_EXTRACT_INITIAL_OFFSET | AF_OVERRIDE_PHYSICS will instruct the task to play the anim
//              using an initial offset specified by the animator (if one exists). Use this flag to playback
//              synced anims on multiple peds (i.e. give all peds the same Pos and Rot values and the animation flag 
//              AF_EXTRACT_INITIAL_OFFSET | AF_OVERRIDE_PHYSICS)
//
// fBlendInDelta - the rate at which the task will blend in
// The blend in duration is 1.0 / fBlendInDelta e.g. 1.0 / NORMAL_BLEND_IN -> 1.0 / 8.0 = 0.125 seconds 
// fBlendOutDelta - the rate at which the task will blend out 
// The blend out duration is -1.0 / fBlendOutDelta e.g. -1.0 / NORMAL_BLEND_OUT -> -1.0 / -8.0 = 0.125 seconds
//
//PURPOSE: Plays an anim task on a ped with a reposition and reorientation at the beginning.
NATIVE PROC TASK_PLAY_ANIM_ADVANCED(PED_INDEX PedIndex, STRING pAnimDictName,  STRING pAnimName, VECTOR pos, VECTOR rot, FLOAT fBlendInDelta = NORMAL_BLEND_IN, FLOAT fBlendOutDelta = NORMAL_BLEND_OUT, INT nTimeToPlay =-1, ANIMATION_FLAGS AnimFlags = AF_DEFAULT, FLOAT startPhase = 0.0, EULER_ROT_ORDER RotOrder = EULER_YXZ, IK_CONTROL_FLAGS ikFlags = AIK_NONE) = "0x246c656f8e525dc7"

//INFO: Plays one or more anims on the specified ped
//PARAM NOTES: 
//	priorityLow, priorityMid and priorityHigh: Structures detailing the anim (or combination of anims) to play back on the low, medium and high priority slots
//	within the anim task. Anims on different slots can be blended in and out independently of each other, and can use different filters and flags to affect
// 	thier behaviour (see the definitions of ANIM_DATA and ANIMATION_FLAGS for more information). It is also possible to play a blend of up to 3 anims at a
//	time at each priority, with control over the anims phases, rates, and weight relative to one another.
//	fTaskBlendInDuration - the time over which the task will blend in (in seconds)
//	fTaskBlendOutDuration - the time over which the task will blend out (in seconds)
//PURPOSE: Starts a task that will play back on or more anims. More info..
NATIVE PROC TASK_SCRIPTED_ANIMATION(PED_INDEX PedIndex, ANIM_DATA& priorityLow, ANIM_DATA& priorityMid, ANIM_DATA& priorityHigh, FLOAT fTaskBlendInDuration = NORMAL_BLEND_DURATION, FLOAT fTaskBlendOutDuration = NORMAL_BLEND_DURATION) = "0x86577f7f045f84c7"

//INFO: Plays one or more anims on the specified entity
NATIVE PROC PLAY_ENTITY_SCRIPTED_ANIM(ENTITY_INDEX EntityIndex, ANIM_DATA& priorityLow, ANIM_DATA& priorityMid, ANIM_DATA& priorityHigh, FLOAT fTaskBlendInDuration = NORMAL_BLEND_DURATION, FLOAT fTaskBlendOutDuration = NORMAL_BLEND_DURATION) = "0xc51d165944c64ca6"

// INFO: Plays a gesture animation whilst using phone
// PARAM NOTES: 
//	bIsLooping: 		Specifies whether to loop animation or not
//  bHoldLastFrame:		If true, holds final position of animation, else returns to starting position. Call TASK_STOP_PHONE_GESTURE_ANIMATION to return to original position if true. 
//	fTaskBlendInDuration - the time over which the task will blend in (in seconds)
//	fTaskBlendOutDuration - the time over which the task will blend out (in seconds)
// PURPOSE: 
NATIVE PROC TASK_PLAY_PHONE_GESTURE_ANIMATION(PED_INDEX PedIndex, STRING pAnimDictName, STRING pAnimName, STRING pFilterName, FLOAT fTaskBlendInDuration = NORMAL_BLEND_DURATION, FLOAT fTaskBlendOutDuration = NORMAL_BLEND_DURATION, BOOL bIsLooping = FALSE, BOOL bHoldLastFrame = FALSE) = "0xb8ea44dc2c77645c"

// INFO: Stops a player phone animation
// PARAM NOTES: 
//	fBlendOutOverride: Overrides the blend out time set in TASK_PLAY_PHONE_GESTURE_ANIMATION. Will use the originally set blend out time if left at -1.0.
// PURPOSE: 
NATIVE PROC TASK_STOP_PHONE_GESTURE_ANIMATION(PED_INDEX PedIndex, FLOAT fBlendOutOverride = -1.0) = "0xfcd42d914e921580"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the ped is playing a phone gesture anim
NATIVE FUNC BOOL IS_PLAYING_PHONE_GESTURE_ANIM( PED_INDEX PedIndex ) = "0x7ce0cfe0533867b0"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns current phase of the phone gesture anim currently playing. Will return -1.0f if no anim is playing
NATIVE FUNC FLOAT GET_PHONE_GESTURE_ANIM_CURRENT_TIME( PED_INDEX PedIndex ) = "0x198866ca14785166"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns current total duration of the phone gesture anim currently playing. Will return -1.0f if no anim is playing
NATIVE FUNC FLOAT GET_PHONE_GESTURE_ANIM_TOTAL_TIME( PED_INDEX PedIndex ) = "0xc20701b83e0998c5"

// INFO: Starts playback of animation on a single priority level on an existing TASK_SCRIPTED_ANIMATION
// PARAM NOTES:
//	data: 		The new animation state to apply to the required priority level
//	priority: 	The priority level to use. specify either AF_PRIORITY_HIGH, AF_PRIORITY_MEDIUM or AF_PRIORITY_LOW.
//				Any animation already playing at this priority level will be cross blended out.
// PURPOSE: Blends in new animation on an existing TASK_SCRIPTED_ANIMATION. More info...
NATIVE PROC START_ANIM_PLAYBACK(ENTITY_INDEX EntityIndex, ANIM_DATA& data, ANIM_PRIORITY_FLAGS priority = AF_PRIORITY_LOW) = "0x8fc2aa42fd9fa172"

// INFO: Stops playback of animation on the given priority level of an existing TASK_SCRIPTED_ANIMATION
// PARAM NOTES:
//	priority: 	The priority level to stop. specify either AF_PRIORITY_HIGH, AF_PRIORITY_MEDIUM or AF_PRIORITY_LOW.
//				Any animation playing at this priority level will blend out with its specified blend out duration.
// PURPOSE: Stops animation on an existing TASK_SCRIPTED_ANIMATION. More info...
NATIVE PROC STOP_ANIM_PLAYBACK(ENTITY_INDEX EntityIndex, ANIM_PRIORITY_FLAGS priority = AF_PRIORITY_LOW, BOOL secondary = FALSE) = "0xe3258b995b832e6a"

//INFO: Set the clip currently playing on a scripted anim task.
//PARAM NOTES:	priority:	You can specify either AF_PRIORITY_LOW, AF_PRIORITY_MEDIUM or AF_PRIORITY_HIGH.
//				index:		The index of the clip to set on the given priority.
//PURPOSE: Set a clip to play on a scripted anim task. More info.
NATIVE PROC SET_ANIM_CLIP (ENTITY_INDEX EntityIndex, STRING pAnimDictName, STRING pAnimName, ANIM_PRIORITY_FLAGS priority = AF_PRIORITY_LOW, INT index = 0, BOOL secondary = FALSE) = "0xf962040546b0d2d7"

//INFO: Sets the blend weight of a clip playing on the scripted anim task, 
//PARAM NOTES:	priority:	The priority level the clip is playing on. AF_PRIORITY_LOW, AF_PRIORITY_MEDIUM or AF_PRIORITY_HIGH.
//				index:		The index of the clip to set on the given priority (used when the priority level is playing a blend
//							of clips, when playing a single clip this can be left blank).
//PURPOSE: Sets the blend weight of a clip playing on a scripted anim task. More info.
NATIVE PROC SET_ANIM_WEIGHT (ENTITY_INDEX EntityIndex, FLOAT blendWeight, ANIM_PRIORITY_FLAGS priority = AF_PRIORITY_LOW, INT index = 0, BOOL secondary = FALSE) = "0xecd4da16b454528f"

//INFO: Sets the filter currently being used on a priority level on the scripted anim task, 
//PARAM NOTES:	pFilterName:The name of the filter to use (see build/dev/common/data/anim/filters.xml) 
//				priority:	The priority level to apply the filter to. AF_PRIORITY_LOW, AF_PRIORITY_MEDIUM or AF_PRIORITY_HIGH.
//PURPOSE: Sets a filter on a scripted anim task. More info.
NATIVE PROC SET_ANIM_FILTER(ENTITY_INDEX EntityIndex, STRING pFilterName, ANIM_PRIORITY_FLAGS priority = AF_PRIORITY_LOW, BOOL secondary = FALSE) = "0x979aba5e5d177c74"

//INFO: Sets the current phase of the clips on a priority level on the scripted anim task, 
//PARAM NOTES:	phase:		The new phase of the clip(s)
//				priority:	The priority level to apply the filter to. AF_PRIORITY_LOW, AF_PRIORITY_MEDIUM or AF_PRIORITY_HIGH.
//PURPOSE: Sets the phase of a clip on a scripted anim task. More info.
NATIVE PROC SET_ANIM_PHASE(ENTITY_INDEX EntityIndex, FLOAT phase, ANIM_PRIORITY_FLAGS priority = AF_PRIORITY_LOW, BOOL secondary = FALSE) = "0x60f9850ce23ed209"

//INFO: Sets the current rate of the clips on a priority level on the scripted anim task, 
//PARAM NOTES:	phase:		The new phase of the clip(s)
//				priority:	The priority level to apply the filter to. AF_PRIORITY_LOW, AF_PRIORITY_MEDIUM or AF_PRIORITY_HIGH.
//PURPOSE: Sets the rate of a clip on a scripted anim task. More info.
NATIVE PROC SET_ANIM_RATE (ENTITY_INDEX EntityIndex, FLOAT rate, ANIM_PRIORITY_FLAGS priority = AF_PRIORITY_LOW, BOOL secondary = FALSE) = "0x1cbf84e41b1bfe92"

//INFO: Sets wether the clips on a priority level on the scripted anim task should loop, 
//PARAM NOTES:	phase:		The new phase of the clip(s)
//				priority:	The priority level to apply the filter to. AF_PRIORITY_LOW, AF_PRIORITY_MEDIUM or AF_PRIORITY_HIGH.
//PURPOSE: Sets whether clips on a scripted anim task should loop. More info.
NATIVE PROC SET_ANIM_LOOPED (ENTITY_INDEX EntityIndex, BOOL looped, ANIM_PRIORITY_FLAGS priority = AF_PRIORITY_LOW, BOOL secondary = FALSE) = "0x8bf7b8753e6fadd0"

//INFO: Attempts to stop a play anim task initiated by TASK_PLAY_ANIM or TASK_PLAY_ANIM_ADVANCED
//PARAM NOTES: 
//PURPOSE: Stops an anim task on a ped. More info..
NATIVE PROC STOP_ANIM_TASK(ENTITY_INDEX EntityIndex, STRING pAnimDictName,  STRING pAnimName, FLOAT fBlendOutDelta = NORMAL_BLEND_OUT) = "0x227b2dd85a708e68"

//INFO: Plays an anim on the specified vehicle
//PARAM NOTES: 
//PURPOSE: Plays a anim task on a vehicle. More info..
NATIVE PROC TASK_VEHICLE_PLAY_ANIM(VEHICLE_INDEX VehicleIndex, STRING pAnimDictName, STRING pAnimName) = "0x8da8932b29e225ed"

//~>                            Look at commands

//INFO: 
//PARAM NOTES: If LookTime is -1 the ped will perform the task forever.
//  The optional flags parameter is made by combining any of the following flags from commands_task.sch.
//PURPOSE: Gives the ped a look at coord task.More info..
NATIVE PROC TASK_LOOK_AT_COORD (PED_INDEX PedIndex, VECTOR VecCoors,  INT time, SCRIPT_LOOK_FLAG LookFlags = SLF_DEFAULT, SCRIPT_LOOK_PRIORITY priority = SLF_LOOKAT_MEDIUM) = "0xe1e1af00ca06a2b7"

//INFO: 
//PARAM NOTES: If LookTime is -1 the ped will perform the task forever.
//  The optional flags parameter is made by combining any of the following flags from commands_task.sch.
//PURPOSE: Tells a ped to look at an entity. More info..
NATIVE PROC TASK_LOOK_AT_ENTITY (PED_INDEX PedIndex, ENTITY_INDEX EntityIndex, INT time,  SCRIPT_LOOK_FLAG LookFlags = SLF_DEFAULT, SCRIPT_LOOK_PRIORITY priority = SLF_LOOKAT_MEDIUM) = "0xf30f15f203736de4"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Stops a ped looking at a ped.
NATIVE PROC TASK_CLEAR_LOOK_AT (PED_INDEX PedIndex) = "0xc89ea639a6f338a6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tells a ped to turn face a coord.
NATIVE PROC TASK_TURN_PED_TO_FACE_COORD( PED_INDEX PedIndex, VECTOR VecCoors, INT Time = 0 ) = "0x1a96b8b416bc07d0"

//~>                        Sequence commands

//INFO: Allows a ped to perform a sequnce of tasks. Any tasks added to a sequence must take in a Null ped_index.
//PARAM NOTES:
//PURPOSE: Opens a sequence task. More info..
NATIVE PROC OPEN_SEQUENCE_TASK(SEQUENCE_INDEX &Sequence) = "0xa888f8cc04f25cc8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Closes an opened sequnce task. More info..
NATIVE PROC CLOSE_SEQUENCE_TASK(SEQUENCE_INDEX Sequence) = "0xc963a45b50851768"

//INFO: Requires OPEN_SEQUENCE_TASK ... CLOSE_SEQUENCE_TASK 
//PARAM NOTES:
//PURPOSE: Tells a ped to perform a given sequence. More info..
NATIVE PROC TASK_PERFORM_SEQUENCE(PED_INDEX PedIndex, SEQUENCE_INDEX Sequence) = "0x8acada903fcaa42f"

//INFO: 
//PARAM NOTES:
//PURPOSE:Tells a ped to perform a given sequence which is not synced over the network.  
NATIVE PROC TASK_PERFORM_SEQUENCE_LOCALLY(PED_INDEX PedIndex, SEQUENCE_INDEX Sequence) = "0x7bcccccdabd49a93"

//INFO: 
//PARAM NOTES:
//PURPOSE: Flushes all tasks in the specified sequence, allowing the sequence to be rewritten.
NATIVE PROC CLEAR_SEQUENCE_TASK(SEQUENCE_INDEX &Sequence) = "0x7461d7c5ba953bc7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a sequence to repeat.
NATIVE PROC SET_SEQUENCE_TO_REPEAT(SEQUENCE_INDEX Sequence, REPEATMODE DoRepeat) = "0x3f2b528df27c8a9f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a sequence to stop migrating to non-participants of the script that created it.
NATIVE PROC SET_SEQUENCE_PREVENT_MIGRATION(SEQUENCE_INDEX Sequence) = "0x6a177d7d156481ae"

//INFO: Peds start the sequence at the Progress1’th element. If the Progress1’th element of the sequence is also a sequence it will start at the Progress2’th element. 
//PARAM NOTES:
//PURPOSE: Performs a sequence except that the ped will skip the elements of the sequence in the range (0 to Progress1 ). More info..
NATIVE PROC TASK_PERFORM_SEQUENCE_FROM_PROGRESS( PED_INDEX PedIndex, SEQUENCE_INDEX TaskIndex, INT Progress1, INT Progress2 ) = "0x23378ce912d5b544"

//INFO: TaskID should be an enum from CODE_TASK from the header file: Commands_task.sch
//PARAM NOTES:
//PURPOSE: Checks if a code task is running on a ped
NATIVE FUNC BOOL GET_IS_TASK_ACTIVE( PED_INDEX PedIndex, CODE_TASK TaskID ) = "0x7f528e84564c4d10"

//INFO: TaskName should be the name of the task command, taken from the header file: Commands_task.sch
//  If TaskName is chosen to be NULL the command will search for any scripted task that is being processed, rather than a specific task.
//  ReturnStatusOut should be declared as a SCRIPTTASKSTATUS. ReturnStatusOut will be one of the entries in the header file:
//  X:\GTA\gta_rage_scripts\include\commands_task.sch
//  If you're trying to get the status of a task that is performed as part of a sequence then it will never return as True because the character in question is told to TASK_PERFORM_SEQUENCE. 
//  So, check for GET_SCRIPT_TASK_STATUS ( CharID, SCRIPT_TASK_PERFORM_SEQUENCE, ReturnStatus) instead.
//  Alternatively, you can check to see if a character is performing a sequence then use GET_SEQUENCE_PROGRESS to find out which specific task within the sequence your character is performing. 
//PARAM NOTES:
//PURPOSE: Gets the current status of a scrioted task. More info..
NATIVE FUNC SCRIPTTASKSTATUS  GET_SCRIPT_TASK_STATUS( PED_INDEX PedIndex, SCRIPT_TASK_NAME TaskName ) = "0x174ced88b97c78d9"

//INFO: Returns the VEHICLE_MISSION enum of the vehicle mission currently being executed by vehIndex.
// If not a vehicle, or not currently running any mission, returns MISSION_NONE.
//NOTES: All vehicle mission escort types currently return MISSION_ESCORT_REAR
NATIVE FUNC VEHICLE_MISSION  GET_ACTIVE_VEHICLE_MISSION_TYPE(VEHICLE_INDEX vehIndex) = "0xf9eec73ae0b9c439"

//INFO: Before calling this command, you should call GET_SCRIPT_TASK_STATUS to make sure that SCRIPT_TASK_PERFORM_SEQUENCE is running. 
//PARAM NOTES: ReturnProgress is an INT and will be -1 before the sequence task begins. 
//  Once the sequence has begun, ReturnProgress will be given a value reflecting which task in the sequence is being performed (0 = the first task). 
//PURPOSE: Gets the progress of a sequence of tasks. More info..
NATIVE FUNC INT  GET_SEQUENCE_PROGRESS( PED_INDEX PedIndex ) = "0x0829092f169950ab"

//~>                            Vehicle commands 

//INFO: 
//PARAM NOTES:The character can fire at a vehicle, coordinates or another character. At least one of TargetCharID and TargetVehicleID must be NULL. If there is a target character or vehicle then the target coordinates are used as an offset.
//  If TargetCharID and TargetVehicleID are both NULL then the character will fire at the target coordinates.
//  CharID and TargetCharID are both of type PED_INDEX
//  TargetVehicleID is of type VEHICLE_INDEX
//  AbortRangeFloat is the distance in metres from the target at which the task will be aborted.
//  FireFrequencyPercentage should be between 0 (never shoot) and 100 (fire as fast as possible). 
//  bPushUnderneathDrivingTaskIfDriving If this is set it will allow the ped to continue driving whilst shooting.
//  instead of interupting the driving task it will sit along side it. CLEAR_DRIVEBY_TASK_UNDERNEATH_DRIVING_TASK can be used to remove it
//  FiringPatternHash allows you to set the firing pattern from a list: FIRING_PATTERN_HASH 
//PURPOSE: Tells a ped to driveby a coord, ped or vehicle. More info..
NATIVE PROC TASK_DRIVE_BY( PED_INDEX PedIndex, PED_INDEX OtherPedIndex, VEHICLE_INDEX TargetVehicleIndex, VECTOR VecCoors, FLOAT AbortRange, INT FrequencyPercentage, BOOL bPushUnderneathDrivingTaskIfDriving = FALSE, FIRING_PATTERN_HASH FiringPatternHash = FIRING_PATTERN_BURST_FIRE_DRIVEBY) = "0x0e6c3a4efa9d9d35"

//INFO: Used to update a drive by task target (instead of constantly clearing and creating a new task)
//PARAM NOTES:
NATIVE PROC SET_DRIVEBY_TASK_TARGET( PED_INDEX PedIndex, PED_INDEX OtherPedIndex, VEHICLE_INDEX TargetVehicleIndex, VECTOR VecCoors ) = "0x8217f7dfe30383b0"

//INFO: Used to clear driveby tasks given by TASK_DRIVE_BY with bPushUnderneathDrivingTaskIfDriving set on peds driving
//PARAM NOTES:
NATIVE PROC CLEAR_DRIVEBY_TASK_UNDERNEATH_DRIVING_TASK( PED_INDEX PedIndex ) = "0xd639b91d6baf25c6"

//INFO: Used to query driveby tasks given by TASK_DRIVE_BY with bPushUnderneathDrivingTaskIfDriving set on peds driving
//PARAM NOTES:
NATIVE FUNC BOOL IS_DRIVEBY_TASK_UNDERNEATH_DRIVING_TASK( PED_INDEX PedIndex ) = "0x99d3be8c39ba34ff"


//INFO: Use to control the direction of a mounted vehicle weapon and still maintain the ability to control the vehicle.
//PARAM NOTS: 
//PURPOSE: Tells the driver of a vehicle to control the mounted vehicle and target a coord, ped or vehicle.
NATIVE FUNC BOOL CONTROL_MOUNTED_WEAPON( PED_INDEX PedIndex) = "0xb604014eee3ca5f8"

//INFO: Used to update a mounted weapon task (instead of constantly clearing and creating a new task) and to update the position
//PARAM NOTES:
NATIVE PROC SET_MOUNTED_WEAPON_TARGET( PED_INDEX PedIndex, PED_INDEX OtherPedIndex, VEHICLE_INDEX TargetVehicleIndex, VECTOR VecCoors, VEHICLEMOUNTEDWEAPONTASKMODE VehicleTaskMode = TASK_AIM, BOOL IgnoreTargetVehDeadCheck = FALSE) = "0x748e7aee8deb2a3a"

//INFO: Used to clear the mounted weapon control tasks given by CONTROL_MOUNTED_WEAPON set on driving ped
//PARAM NOTES:
NATIVE PROC CLEAR_MOUNTED_WEAPON_TASK_UNDERNEATH_DRIVING_TASK( PED_INDEX PedIndex ) = "0xf4dedafc0c550318"

//INFO: Used to query if the mounted weapon control task given by CONTROL_MOUNTED_WEAPON is set on driving ped 
//PARAM NOTES:
NATIVE FUNC BOOL IS_MOUNTED_WEAPON_TASK_UNDERNEATH_DRIVING_TASK( PED_INDEX PedIndex ) = "0xcb8e14dc7871f52c"


//INFO: 
//PARAM NOTES: DRIVINGMODE is commands_vehicle.sch
//PURPOSE: Tells a ped to wander about in a car. More info..
NATIVE PROC TASK_VEHICLE_DRIVE_WANDER( PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, FLOAT CruiseSpeed, DRIVINGMODE Mode ) = "0xad6cdbcda713560a"

//INFO: 
//PARAM NOTES: VehicleIndex: if you want the ped to use a specific vehicle then specify the VehicleIndex. Otherwise set VehicleIndex to NULL.
//  
//  CarModel : if the ped can't find the specified vehicle or any other vehicle, a vehicle (with model CarModel) will be automatically created if the ped is off-screen. No vehicle will be created if CarModel is set to DUMMY_MODEL_FOR_SCRIPT. (In San Andreas, passing a CarModel of 1 would use the default car model which was always in memory. This has not been implemented in the Rage code yet.)
//  
//  DRIVINGSTYLE can be found in the DRIVINGSTYLE ENUM in "commands_vehicle.sch" in X:\GTA\gta_rage_scripts\include\
//  DRIVINGMODE can be found in the DRIVINGMODE ENUM in "commands_vehicle.sch" in X:\GTA\gta_rage_scripts\include\

//      * If a vehicle is specified and the ped is in the vehicle the ped will just drive to the point.
//      * If a vehicle is specified and the ped isn't in the vehicle then the ped will attempt to get in the vehicle and drive to the point.
//      * If a vehicle is specified and the ped is in another vehicle then ped will get out the car and attempt to get in the correct car and then drive to the point. 
//  
//      * If no vehicle is specified then the ped will attempt to get in any nearby vehicle and drive to the point.
//      * If no vehicle is specified and the ped is already in a car then the ped will drive the car to the point. 
//  
//  If a ped tries and fails to get in a car then:
//  
//  1. if CarModel = DUMMY_MODEL_FOR_SCRIPT the ped will run to the target and get in any car it can along the route.
//  2. otherwise, when the ped is off-screen the ped will create a car (with the correct model), warp in, and drive to the point. If the ped is on-screen then the ped will run to the target and get in any car it can along the route (if the ped is near the target it will just run to the target). 
//  
//  Range is how close the car will get to the destination before stopping. Default should be 4.0
//  FLOAT StraightLineDist (the distance at which the ai switches to heading for the target directly instead of following the nodes) (just like in sa). To pick default (recommended) pass in -1.
//  
//  TASK_CAR_DRIVE_TO_COORD_NOT_AGAINST_TRAFFIC does exactly the same with the only difference being cars will not consider routes that go against the flow of traffic. 
//PURPOSE: Gives a task to drive a vehicle to a coord. More info..
NATIVE PROC TASK_VEHICLE_DRIVE_TO_COORD( PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, VECTOR VecCoors, FLOAT Speed, DRIVINGSTYLE Style, MODEL_NAMES CarModel, DRIVINGMODE Mode, FLOAT TargetRadius, FLOAT StraightLineDist ) = "0x3b8f94419979a0b1"

//Like TASK_VEHICLE_DRIVE_TO_COORD, but automatically loads nodes in the background
//Only use this if the choice of target is up to the player or otherwise unknown at script-time.
//Examples: the taxi script going to player blips
NATIVE PROC TASK_VEHICLE_DRIVE_TO_COORD_LONGRANGE(PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, VECTOR VecCoors, FLOAT Speed, DRIVINGMODE Mode, FLOAT TargetRadius) = "0x70d024128ce0c114"

//INFO: 
//PARAM NOTES: If Time = -1 the ped will never warp into the vehicle.
//  VEHICLE_SEAT is in generic.sch
//PURPOSE: Tells a ped to enter a vehicle. More info..
NATIVE PROC TASK_ENTER_VEHICLE( PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, INT Time =  DEFAULT_TIME_BEFORE_WARP, VEHICLE_SEAT seat = VS_DRIVER, FLOAT MoveBlendRatio = PEDMOVEBLENDRATIO_RUN, ENTER_EXIT_VEHICLE_FLAGS iFlags = ECF_RESUME_IF_INTERRUPTED, STRING OverridenClipSet = NULL ) = "0xb486640392ec50bb"

//INFO: 
//PARAM NOTES: If Time = -1 the ped will never warp to the vehicle. 
//PURPOSE: Tells a ped to open a vehicle door. More info..
NATIVE PROC TASK_OPEN_VEHICLE_DOOR( PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, INT Time = DEFAULT_TIME_BEFORE_WARP, VEHICLE_SEAT seat = VS_DRIVER, FLOAT MoveBlendRatio = PEDMOVEBLENDRATIO_RUN) = "0xf9d446af83e7a624"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tells a ped to leave a vehicle
NATIVE PROC TASK_LEAVE_VEHICLE( PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, ENTER_EXIT_VEHICLE_FLAGS iFlags = 0 ) = "0x02f1caac7cb77e47"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tells the ped to leave any vehicle.
NATIVE PROC TASK_LEAVE_ANY_VEHICLE( PED_INDEX PedIndex, INT DelayTime = 0, ENTER_EXIT_VEHICLE_FLAGS iFlags = 0 ) = "0xab7639d658bbccee"

//INFO: Task doesn’t work as part of a sequence. 
//PARAM NOTES:
//PURPOSE:  Tells the driver (if there is one) and any passengers to leave the car. More info..
NATIVE PROC TASK_EVERYONE_LEAVE_VEHICLE( VEHICLE_INDEX VehicleIndex ) = "0x417047b1f659225c"

//INFO: 
//PARAM NOTES: If Time = -1 the ped will never warp onto the mount.
//  VEHICLE_SEAT is in generic.sch
//PURPOSE: Tells a ped to mount another ped, usually a horse.
NATIVE PROC TASK_MOUNT_ANIMAL( PED_INDEX PedIndex, PED_INDEX MountIndex, INT Time =  DEFAULT_TIME_BEFORE_WARP, VEHICLE_SEAT seat = VS_DRIVER, FLOAT MoveBlendRatio = PEDMOVEBLENDRATIO_RUN, ENTER_EXIT_VEHICLE_FLAGS iFlags = ECF_RESUME_IF_INTERRUPTED ) = "0x3f0ad0f6b2f34df6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tells the ped to dismount if it has a mount.
NATIVE PROC TASK_DISMOUNT_ANIMAL( PED_INDEX PedIndex,  ENTER_EXIT_VEHICLE_FLAGS iFlags = 0 ) = "0xfe2e56c600a68fce"

//INFO: 
//PARAM NOTES: DRIVINGSTYLE &  DRIVINGMODE are in commands_vehicle.sch 
//                          MODEL_NAMES is in model_enums
//PURPOSE: Tells a ped to drive a point route. More info..
NATIVE PROC TASK_DRIVE_POINT_ROUTE_ADVANCED(PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, FLOAT CruiseSpeed, DRIVINGSTYLE style, MODEL_NAMES CarModel, DRIVINGMODE mode ) = "0x730dad3cf7f02fa7"

//INFO: 
//PARAM NOTES:INT TargetReached: (the distance at which the ai thinks the target has been reached and the car stops)
//  INT StraightLineDist: (the distance at which the ai switches to heading for the target directly instead of following the nodes) (just like in sa)
//  Use TASK_VEHICLE_MISSION_PED_TARGET to target another ped instead of a vehicle. The task status is the same as that for TASK_VEHICLE_MISSION, i.e. use
//  GET_SCRIPT_TASK_STATUS(a_ped, SCRIPT_TASK_CAR_MISSION, my_status) to check for both commands.
//  To pick default values (recommended) both parameters can be passed in as -1. 
//	DriveAgainstTraffic being true allows the car to drive on the opposite side of the road into incoming traffic
//PURPOSE: Tells a ped to perform a task when in a vehicle against another vehicle. More info..
NATIVE PROC TASK_VEHICLE_MISSION( PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, VEHICLE_INDEX TargetVehicleIndex, VEHICLE_MISSION Mission, FLOAT CruiseSpeed, DRIVINGMODE mode, FLOAT TargetReachedDist, FLOAT StraightLineDist, BOOL DriveAgainstTraffic = true) = "0xfe5a02cf2178b6a8"

//INFO: 
//PARAM NOTES:INT TargetReached (the distance at which the ai thinks the target has been reached and the car stops)
//  FLOAT StraightLineDist (the distance at which the ai switches to heading for the target directly instead of following the nodes) (just like in sa)
//  To pick default values (recommended) both parameters can be passed in as -1.
//  Use TASK_CAR_MISSION_PED_TARGET to target another ped instead of a vehicle. The task status is the same as that for TASK_CAR_MISSION, i.e. use
//  GET_SCRIPT_TASK_STATUS(a_ped, SCRIPT_TASK_CAR_MISSION, my_status)   to check for both commands.
//  TASK_CAR_MISSION_NOT_AGAINST_TRAFFIC does exaclt the same apart from the fact it won't allow cars to drive against the flow of traffic. TASK_CAR_MISSION does allow cars to drive agains the flow of traffic. 
//	DriveAgainstTraffic being true allows the car to drive on the opposite side of the road into incoming traffic
//PURPOSE: Tells a ped in a vehicle to target another ped in a vehicle. More info..
NATIVE PROC TASK_VEHICLE_MISSION_PED_TARGET( PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, PED_INDEX TargetPedIndex, VEHICLE_MISSION Mission, FLOAT CruiseSpeed, DRIVINGMODE mode, FLOAT TargetReachedDist, FLOAT StraightLineDist, BOOL DriveAgainstTraffic = true) = "0xb69d13e19147910f"

//INFO: 
//PARAM NOTES::INT TargetReached (the distance at which the ai thinks the target has been reached and the car stops)
//  FLOAT StraightLineDist (the distance at which the ai switches to heading for the target directly instead of following the nodes) (just like in sa)
//  To pick default values (recommended) both parameters can be passed in as -1.
//  Use TASK_CAR_MISSION_PED_TARGET to target another ped instead of a vehicle. The task status is the same as that for TASK_CAR_MISSION, i.e. use
//  GET_SCRIPT_TASK_STATUS(a_ped, SCRIPT_TASK_CAR_MISSION, my_status)   to check for both commands.
//  TASK_CAR_MISSION_NOT_AGAINST_TRAFFIC does exaclt the same apart from the fact it won't allow cars to drive against the flow of traffic. TASK_CAR_MISSION does allow cars to drive agains the flow of traffic. 
//	DriveAgainstTraffic being true allows the car to drive on the opposite side of the road into incoming traffic
//PURPOSE:  Tells a ped in a vehicle to target a coord. More info..
NATIVE PROC TASK_VEHICLE_MISSION_COORS_TARGET( PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, VECTOR VecCoors, VEHICLE_MISSION Mission, FLOAT CruiseSpeed, DRIVINGMODE mode, FLOAT TargetReachedDist, FLOAT StraightLineDist, BOOL DriveAgainstTraffic = true) = "0xfdb121077308e944"

//INFO: 
//PARAM NOTES: VEHICLE_INDEX VehicleIndex (The actual heli that will be flown)  
//  VEHICLE_INDEX TargetVehicleIndex (If a target vehicle needs to be specified it is done here)
//  PED_INDEX TargetPedIndex (If a target ped needs to be specified it is done here)
//  FLOAT TargetX, TargetY, TargetZ (specify targetcoordinates here in needed.)
//  VEHICLE_MISSION Mission (Mission to be exectuted. ie MISSION_GOTO, MISSION_ATTACK, MISSION_FOLLOW) in commands_vehicle.sch
//  X:\GTA\gta_rage_scripts\include\commands_vehicle.sch
//  FLOAT CruiseSpeed (in m/s)
//  FLOAT TargetReachedDist (distance (in meters) at which heli thinks it's arrived.)
//							ALSO used as the hover distance for MISSION_ATTACK and MISSION_CIRCLE
//  FLOAT HeliOrientation (orientation heli tries to be in. (0-360) Use -1 if not bothered. -1 Should be used in 99% of the times) 
//  INT FlightHeight (z coordinate the heli tries to maintain. ie 30 == 30 meters above sea level)
//  INT MinHeightAboveTerrain (height in meters that the heli will try to stay above terrain. ie 20 == always tries to stay at least 20 meters above ground.) 
// FLOAT fSlowDownDistance.  setting to -1 means use default tuning(100).  in general get more control with big number and more dynamic with smaller #
//PURPOSE: Gives the heli a mission. More info..
NATIVE PROC TASK_HELI_MISSION( PED_INDEX PedIndex, VEHICLE_INDEX HeliIndex, VEHICLE_INDEX TargetVehicleIndex, PED_INDEX TargetPedIndex, VECTOR VecCoors, VEHICLE_MISSION Mission, FLOAT CruiseSpeed, FLOAT TargetReachedDist, FLOAT HeliOrientation, INT FlightHeight, INT MinHeightAboveTerrain, FLOAT fSlowDownDistance = -1.0, HELIMODE HeliFlags = HF_NONE) = "0x545c59578966d5b8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gives the heli a mission to escort another vehicle at an offset position
NATIVE PROC TASK_HELI_ESCORT_HELI( PED_INDEX PedIndex, VEHICLE_INDEX HeliIndex, VEHICLE_INDEX TargetVehicleIndex, VECTOR VecOffset) = "0x53a1d75e294fdb30"

//INFO: 
//PARAM NOTES: VEHICLE_INDEX VehicleIndex (The actual plane that will be flown)  
//  VEHICLE_INDEX TargetVehicleIndex (If a target vehicle needs to be specified it is done here)
//  PED_INDEX TargetPedIndex (If a target ped needs to be specified it is done here)
//  FLOAT TargetX, TargetY, TargetZ (specify targetcoordinates here in needed.)
//  VEHICLE_MISSION Mission (Mission to be exectuted. ie MISSION_GOTO, MISSION_ATTACK, MISSION_FOLLOW) in commands_vehicle.sch
//  X:\GTA\gta_rage_scripts\include\commands_vehicle.sch
//  FLOAT CruiseSpeed (in m/s)
//  FLOAT TargetReachedDist (distance (in meters) at which plane thinks it's arrived.)
//							ALSO used as the hover distance for MISSION_ATTACK and MISSION_CIRCLE
//  FLOAT Orientation (orientation plane tries to be in. (0-360) Use -1 if not bothered. -1 Should be used in 99% of the times) 
//  INT FlightHeight (z coordinate the plane tries to maintain. ie 30 == 30 meters above sea level)
//  INT MinHeightAboveTerrain (height in meters that the plane will try to stay above terrain. ie 20 == always tries to stay at least 20 meters above ground.) 
//PURPOSE: Gives the plane a mission. More info..
NATIVE PROC TASK_PLANE_MISSION( PED_INDEX PedIndex, VEHICLE_INDEX PlaneIndex, VEHICLE_INDEX TargetVehicleIndex, PED_INDEX TargetPedIndex, VECTOR VecCoors, VEHICLE_MISSION Mission, FLOAT CruiseSpeed, FLOAT TargetReachedDist, FLOAT PlaneOrientation, INT FlightHeight, INT MinHeightAboveTerrain, bool bPrecise = TRUE) = "0xcdaacb23d43f080d"

//INFO: 
//PARAM NOTES: VEHICLE_INDEX VehicleIndex (The actual plane that will be flown)  
//  FLOAT CruiseSpeed (in m/s)
//  FLOAT TargetReachedDist (distance (in meters) at which plane thinks it's arrived.)
//PURPOSE: Gives plane a task to drive/taxi along the runway on the ground
NATIVE PROC TASK_PLANE_TAXI( PED_INDEX PedIndex, VEHICLE_INDEX PlaneIndex, VECTOR VecCoors, FLOAT CruiseSpeed, FLOAT TargetReachedDist) = "0x908b77e6d8aa83d8"

//INFO: 
//PARAM NOTES: VEHICLE_INDEX VehicleIndex (The actual plane that will be flown)  
//  VEHICLE_INDEX TargetVehicleIndex (If a target vehicle needs to be specified it is done here)
//  PED_INDEX TargetPedIndex (If a target ped needs to be specified it is done here)
//  FLOAT TargetX, TargetY, TargetZ (specify targetcoordinates here in needed.)
//  VEHICLE_MISSION Mission (Mission to be exectuted. ie MISSION_GOTO, MISSION_ATTACK, MISSION_FOLLOW) in commands_vehicle.sch
//  X:\GTA\gta_rage_scripts\include\commands_vehicle.sch
//  FLOAT CruiseSpeed (in m/s)
//  FLOAT TargetReachedDist (distance (in meters) at which plane thinks it's arrived.)
//							ALSO used as the hover distance for MISSION_ATTACK and MISSION_CIRCLE
//  INT BoatFlags
//PURPOSE: Gives the boat a mission. More info..
NATIVE PROC TASK_BOAT_MISSION( PED_INDEX PedIndex, VEHICLE_INDEX BoatIndex, VEHICLE_INDEX TargetVehicleIndex, PED_INDEX TargetPedIndex, VECTOR VecCoors, VEHICLE_MISSION Mission, FLOAT CruiseSpeed, DRIVINGMODE mode, FLOAT TargetReachedDist, BOATMODE BoatFlags) = "0xc5a824d6ee9c9cd3"

ENUM PARK_TYPE
	PARK_TYPE_PARALLEL,
	PARK_TYPE_PERPENDICULAR_NOSE_IN,
	PARK_TYPE_PERPENDICULAR_BACK_IN,
	PARK_TYPE_PULL_OVER,
	PARK_TYPE_LEAVE_PARALLEL_SPACE,
	PARK_TYPE_BACK_OUT_PERPENDICULAR_SPACE,
	PARK_TYPE_PASSENGER_EXIT,
	PARK_TYPE_PULL_OVER_IMMEDIATE
ENDENUM

/// PURPOSE:
///    Gives the vehicle a task to park in the specified manner
/// PARAMS:
///    PedIndex - Driving Ped
///    VehicleIndex - Driven Vehicle
///    ParkingSpaceCoords - The center of the space.  
///    DirectionDegrees - Heading of the parking space.  Can be either positive or negative direction--how the car enters the space is determined by the PARK_TYPE
///    ParkType - Style of parking.
///    ToleranceDegrees - If the vehicle's heading isn't within this amount of the Direction param, the vehicle will back up and try to straighten itself out
///    KeepLightsOn - If true, keep the lights on after parking
NATIVE PROC TASK_VEHICLE_PARK(PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, VECTOR ParkingSpaceCoords, FLOAT DirectionDegrees, PARK_TYPE ParkType, FLOAT ToleranceDegrees = 10.0, BOOL KeepLightsOn = FALSE) = "0x5b7af57d366861f2"

ENUM STEALTH_KILL_TASK_FLAGS
	SKTF_DEFAULT = 0,
	SKTF_FORCE_STEALTH_MODE = 1		// This will force the ped into stealth mode (not necessary for animal types)	
ENDENUM

/// PURPOSE:
///    Gives designated ped a stealth task which will navigate to a defined target ped and perform a stealth kill
/// PARAMS:
///    PedIndex - Stealth Ped
///    TargetPedIndex - Ped that you would like the Stealth Ped to kill
///    StealthKillActionResultId - Hash of the CActionResult defined in action_table.meta
NATIVE PROC TASK_STEALTH_KILL(PED_INDEX PedIndex, PED_INDEX TargetPedIndex, INT StealthKillActionResultId, FLOAT fDesiredMoveBlendRatio = PEDMOVEBLENDRATIO_WALK, STEALTH_KILL_TASK_FLAGS iFlags = SKTF_DEFAULT) = "0xe2c1d6fa4e5ea991"

/// PURPOSE:
///    Gives designated ped the task to plant a bomb at a given position and heading
/// PARAMS:
///    PedIndex - Ped which you would like to plant the bomb
///    vTargetPosition - World coord position you would like to navigate him to
///    fTargetHeading - Heading you would like to orient to (in Radians)
NATIVE PROC TASK_PLANT_BOMB(PED_INDEX PedIndex, VECTOR vTargetPosition, FLOAT fTargetHeading) = "0xd9ab2b08ce49a043"

/// PURPOSE:
///    Gives designated ped the task to circle a coordinate like a shark.
/// PARAMS:
///    PedIndex - The circling ped.
///    vTargetCoord - Where in the world you would like the ped to circle.
///    fMBR - Move blend ratio of the circling.
///    fRadius - Radius for the circling.
NATIVE PROC TASK_SHARK_CIRCLE_COORD(PED_INDEX PedIndex, VECTOR vTargetCoord, FLOAT fMBR, FLOAT fRadius) = "0xfff1232e7a485388"

/// PURPOSE:
///    Gives designated ped the task to circle another ped like a shark.
/// PARAMS:
///    PedIndex - The circling ped.
///    OtherPedIndex - Which other ped you would like the shark to circle.
///    fMBR - Move blend ratio of the circling.
///    fRadius - Radius for the circling.
NATIVE PROC TASK_SHARK_CIRCLE_PED(PED_INDEX PedIndex, PED_INDEX OtherPedIndex, FLOAT fMBR, FLOAT fRadius) = "0xfd4e7488138e4f25"

//Keep this in sync with VehicleEscortType in TaskVehicleEscort.h!
ENUM VEHICLE_ESCORT_TYPE
		VEHICLE_ESCORT_REAR = -1,
		VEHICLE_ESCORT_FRONT = 0,
		VEHICLE_ESCORT_LEFT,
		VEHICLE_ESCORT_RIGHT
ENDENUM

//INFO: Tells a vehicle to escort another entity.
//PARAM NOTES: Set CustomOffset to a negative value to use the default
//PURPOSE: Identical to TASK_VEHICLE_MISSION with one of the MISSION_ESCORT types, but allows setting a custom offset
NATIVE PROC TASK_VEHICLE_ESCORT(PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, ENTITY_INDEX EscortEntityIndex, VEHICLE_ESCORT_TYPE EscortType, FLOAT CruiseSpeed, DRIVINGMODE mode, FLOAT CustomOffset = -1.0, INT MinHeightAboveTerrain = 20, FLOAT StraightLineDistance = 20.0) = "0xdbee353c7ca6e88e"

//INFO: Tells a vehicle to follow another entity
//PARAM NOTES: FollowDistance is how far behind the entity to follow
//PURPOSE: This task sits sort of in between TASK_VEHICLE_ESCORT and TASK_VEHICLE_CHASE.
//	Not as fine-controlled as ESCORT but not as aggressive as CHASE.
//	This task is preferable to ESCORT when the following vehicle might start off in front
//	of the thing it's supposed to follow
NATIVE PROC TASK_VEHICLE_FOLLOW(PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, ENTITY_INDEX FollowEntityIndex, FLOAT CruiseSpeed, DRIVINGMODE mode, INT FollowDistance = 20) = "0xbb97101b3b2dbef5"

//INFO: Tells a helicopter to protect another entity.
//PURPOSE: Identical to TASK_VEHICLE_MISSION with MISSION_PROTECT mission,
NATIVE PROC TASK_VEHICLE_HELI_PROTECT(PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, ENTITY_INDEX ProtectEntityIndex, FLOAT CruiseSpeed, DRIVINGMODE mode, FLOAT CustomOffset = -1.0, INT MinHeightAboveTerrain = 20, HELIMODE HeliFlags = HF_NONE) = "0x69ac7dd318a3e1ba"

//INFO: Tells a ped to chase another ped.  Both peds must be in vehicles, or the task will abort.
//PARAM NOTES:
//PURPOSE: The ped will chase the target ped's vehicle with their own vehicle.
NATIVE PROC TASK_VEHICLE_CHASE(PED_INDEX iPedIndex, PED_INDEX iTargetIndex) = "0x9286a110a3fd81f1"

//INFO: Sets a behavior flag when chasing a vehicle. The ped must be running TASK_VEHICLE_CHASE.
//PARAM NOTES:
//PURPOSE: Sets a behavior flag when chasing a vehicle.
NATIVE PROC SET_TASK_VEHICLE_CHASE_BEHAVIOR_FLAG(PED_INDEX iPedIndex, TASK_VEHICLE_CHASE_BEHAVIOR_FLAGS nFlag, BOOL bValue) = "0xc8d0b0d2cfd76bb5"

//INFO: Sets the ideal pursuit distance when chasing a vehicle. The ped must be running TASK_VEHICLE_CHASE.
//PARAM NOTES:
//PURPOSE: Sets the ideal pursuit distance when chasing a vehicle.
NATIVE PROC SET_TASK_VEHICLE_CHASE_IDEAL_PURSUIT_DISTANCE(PED_INDEX iPedIndex, FLOAT fIdealPursuitDistance) = "0xdfad0df477fd9eb3"

//INFO: Tells a ped in a heli to chase an entity.  The ped must be in a heli.
//PARAM NOTES:
//PURPOSE: The ped will chase the target with their heli.
NATIVE PROC TASK_HELI_CHASE(PED_INDEX iPedIndex, ENTITY_INDEX iTargetIndex, VECTOR vTargetOffset) = "0x42935fa7528ffce8"

//INFO: Sets the target offset when chasing an entity in a heli. The ped must be running TASK_HELI_CHASE.
//PARAM NOTES:
//PURPOSE: Sets the target offset when chasing an entity in a heli.
NATIVE PROC SET_TASK_HELI_CHASE_TARGET_OFFSET(PED_INDEX iPedIndex, VECTOR vTargetOffset) = "0x4caff843df59d524"

//INFO: Sets the target offset to be in world space
//PARAM NOTES:
//PURPOSE: Sets the target offset to be world space when chasing an entity in a heli.
NATIVE PROC SET_TASK_HELI_CHASE_TARGET_OFFSET_WORLD_SPACE(PED_INDEX iPedIndex, bool bTargetOffsetWorldSpace) = "0x8d6ba126f7ac98e4"

ENUM HELI_CHASE_ORIENTATIONMODE
	OrientationMode_None,
	OrientationMode_OrientOnArrival,
	OrientationMode_OrientAllTheTime
ENDENUM

ENUM HELI_CHASE_OrientationRelative
	OrientationRelative_World,
	OrientationRelative_HeliToTarget,
	OrientationRelative_TargetForward
ENDENUM

//INFO: Sets the target orientation and what it's relative to
//PARAM NOTES:
//PURPOSE: Sets the target orientation mode and relative
NATIVE PROC SET_TASK_HELI_CHASE_ORIENTATION(PED_INDEX iPedIndex, HELI_CHASE_ORIENTATIONMODE mode, HELI_CHASE_OrientationRelative relative, float orientation) = "0xe97d050a690da21c"

//INFO: Tells a ped in a heli to chase an entity.  The ped must be in a heli.
//PARAM NOTES:
//PURPOSE: The ped will chase the target with their heli.
NATIVE PROC TASK_PLANE_CHASE(PED_INDEX iPedIndex, ENTITY_INDEX iTargetIndex, VECTOR vTargetOffset) = "0xe8f8c382b0eb7478"

//INFO: Tells a ped in a plane to land
//PARAM NOTES:
//PURPOSE: The ped will try to land in between the start and end coords
NATIVE PROC TASK_PLANE_LAND(PED_INDEX iPedIndex, VEHICLE_INDEX VehicleIndex, VECTOR vRunWayStart, VECTOR vRunWayEnd) = "0x214f418bf9481244"

//INFO: Tells a plane with VTOL (like the Vulkan) to move precisely throughout the world.  Will fail for other vehicles
//PARAM NOTES:
//		bAutoPilot will apply the plane goto task directly to the vehicle, and apply some flags to allow this task to run with no driver
//PURPOSE: Exposes more params than TASK_VEHICLE_MISSION allows, allows for greater control of VTOL planes.
NATIVE PROC TASK_PLANE_GOTO_PRECISE_VTOL(PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, VECTOR TargetCoords, INT FlightHeight=30, INT MinHeightAboveTerrain=20, BOOL UseDesiredOrientation=FALSE, FLOAT DesiredOrientation=0.0, BOOL bAutoPilot = FALSE) = "0xce661a3c8cf58b44"

//INFO: Tells a submarine to goto and stop at the position given
//PARAM NOTES:
//		bAutoPilot will apply the task directly to the vehicle, and apply some flags to allow this task to run with no driver
//PURPOSE: To get submarines to stop at a position when the player gets out
NATIVE PROC TASK_SUBMARINE_GOTO_AND_STOP(PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, VECTOR TargetCoords, BOOL bAutoPilot = FALSE) = "0x835cbdb247b09c67"

//INFO:
//PARAM NOTES:
//PURPOSE: Restarts the default primary task for this ped
NATIVE PROC CLEAR_DEFAULT_PRIMARY_TASK(PED_INDEX PedIndex) = "0xeb6fbc20375e72c2"

//INFO:
//PARAM NOTES:
//PURPOSE: Removes primary task for this vehicle
NATIVE PROC CLEAR_PRIMARY_VEHICLE_TASK(VEHICLE_INDEX VehicleIndex) = "0xe4a094de05c0210c"

//INFO:
//PARAM NOTES:
//PURPOSE: Removes crash task for this vehicle in the primary task tree slot
NATIVE PROC CLEAR_VEHICLE_CRASH_TASK(VEHICLE_INDEX VehicleIndex) = "0x273bc6472375634c"

//INFO: These should only be used for short actions
//PARAM NOTES:TEMPACTION is is commands_vehicle.sch
//PURPOSE: Gives the vehicle a temporary action. More info..
NATIVE PROC TASK_VEHICLE_TEMP_ACTION( PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, TEMPACTION Action, INT Time ) = "0xcd41d6f721cb9c3a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tells the ped vehicle to drive a point route
NATIVE PROC TASK_DRIVE_POINT_ROUTE( PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, FLOAT CruiseSpeed ) = "0x8c4f2dd2f4b46da9"


//INFO: 
//PARAM NOTES: UseAlternateShuffle will lookup and use 'ShuffleLink2' defined in the vehicle layout, rather than the default shuffle link
//PURPOSE: Tells the ped to move across to the next seat in the vehicle. 
NATIVE PROC TASK_SHUFFLE_TO_NEXT_VEHICLE_SEAT( PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, BOOL UseAlternateShuffle = FALSE) = "0x8625186d3a8ddd7a"

//INFO: There is no need to specify a boat, as the task itself will figure out which boat is underneath the ped. 
//  This task does a number of linetests and is thus pretty expensive, so use with care (ie. not repeatedly!) 
//  NOTE: This task is automatically given to group peds, if they are on a boat but their leader is not. 
//PARAM NOTES: iTime can be set to -1 for no time-limit, or to a positive integer to indicate a time in milliseconds after which the ped will warp out of the boat to the nearest clear position they can find nearby. 
//PURPOSE: Tells a ped to get off a boat. More info..
NATIVE PROC TASK_GET_OFF_BOAT( PED_INDEX PedIndex, INT iTimer = DEFAULT_TIME_BEFORE_WARP ) = "0x9aef335a2f73e00a"

//PURPOSE:	Tells a ped to rappel our of a helicopter. This will verify that they are in fact in a helicopter passenger seat before
//			giving the ped the task
NATIVE PROC TASK_RAPPEL_FROM_HELI( PED_INDEX PedIndex, FLOAT fMinRappelHeight = 10.0 ) = "0x01ddcf3e0afad31b"

//~>                            Decision maker commands

//INFO: 
//PARAM NOTES:
//PURPOSE:  Sets the ped to have their  decision maker set as part of a sequence. 
NATIVE PROC TASK_SET_DECISION_MAKER(PED_INDEX PedIndex, DECISION_MAKER_TYPE DecisionMakerId) = "0xd029ba670c8df65b"


//~>							 defensive area tasks

//PURPOSE:	Sets the peds sphere defensive area through a task so it can be used in a sequence
NATIVE PROC TASK_SET_SPHERE_DEFENSIVE_AREA(PED_INDEX PedIndex, VECTOR vCentre, FLOAT fRadius) = "0x223133feb94059cd"

//PURPOSE:	Clears out the peds defensive area
NATIVE PROC TASK_CLEAR_DEFENSIVE_AREA(PED_INDEX PedIndex) = "0x4b16afbb0c12b630"


//INFO: This should only be used when CLEAR_PED_TASKS does not work
//PARAM NOTES:
//PURPOSE:  Clears a peds task immediately. More info..
NATIVE PROC CLEAR_PED_TASKS_IMMEDIATELY( PED_INDEX PedIndex ) = "0x51bb443b279e4104"

//INFO: If -1 is passed to Time the ped will never give up on the task. 
//PARAM NOTES:
//PURPOSE: Gives a shoot at entity task.
NATIVE PROC TASK_SHOOT_AT_ENTITY( PED_INDEX PedIndex, ENTITY_INDEX EntityIndex, INT Time, FIRING_TYPE FiringType ) = "0x913e191f1f726271"

//INFO: 
//PARAM NOTES:
//PURPOSE: Can warp a ped into a vehicle using a task sequence.
NATIVE PROC TASK_WARP_PED_INTO_VEHICLE (PED_INDEX Ped,  VEHICLE_INDEX VehicleIndex, VEHICLE_SEAT seat = VS_DRIVER ) = "0x73a521eac1ef5c1b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Can warp a ped onto attach points on a vehicle and constrain them there while in NM.
NATIVE PROC TASK_WARP_PED_ONTO_VEHICLE (PED_INDEX Ped,  VEHICLE_INDEX VehicleIndex , INT InstancePartIndex) = "0xd8526722f5afebac"

//INFO: 
//PARAM NOTES:
//PURPOSE: Can warp a ped onto attach points on a vehicle and constrain them there while in NM.
NATIVE PROC TASK_NM_ATTACH_PED_TO_ENTITY(PED_INDEX Ped,  ENTITY_INDEX EntityIndex, INT ParentAttachBone,  VECTOR vOffSet, VECTOR vRotation, NM_ATTACH_COMPONENTS AttachComponents, string sAnimDict, string sAnimApproachName, string sAnimIdleName, EULER_ROT_ORDER RotOrder = EULER_YXZ ) = "0x7ed90e7321ac4a87"

//~>                        Phone commands

//INFO: when called with FALSE, this command cannot be used in a sequence. 
//  If you want to use this as part of an AI sequence, consider using TASK_USE_MOBILE_PHONE_TIMED. 
//PARAM NOTES: PHONE_MODE: Specify which phone mode to put the phone into. Defaulted to Mode_ToCall.
//PURPOSE: Tells the ped to use a mobile phone. More info..
NATIVE PROC TASK_USE_MOBILE_PHONE( PED_INDEX PedIndex, BOOL UsePhone, PHONE_MODE PhoneMode = Mode_ToCall ) = "0x57caa5fbf134d4ae"

//INFO: If -1 is passed to Time the ped will never give up on the task. 
//PARAM NOTES:
//PURPOSE:  Tells the ped to use a mobile phone for a time period.
NATIVE PROC TASK_USE_MOBILE_PHONE_TIMED( PED_INDEX PedIndex, INT Time ) = "0x9bd5d84c8c3f0b2c"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Tells the ped to use the walkie talkie to report something (see wiki)
NATIVE PROC TASK_USE_WALKIE_TALKIE( PED_INDEX PedIndex, STRING Context) = "0x46f7b490eb75e92c"

//INFO: 
//PARAM NOTES: vOptionalGoToPosition, fOptionalHeading and fIdleTime are only used if CF_GO_TO_SPECIFIC_POS and CF_USE_CUSTOM_HEADING are set
//             fIdleTime specifies an extra wait period after an anim has finished, calls to IS_CHATTING_PED_PLAYING_ANIM will return false during this period
//PURPOSE:  Tells the ped to chat to a ped (see wiki)
NATIVE PROC TASK_CHAT_TO_PED( PED_INDEX PedIndex, PED_INDEX PedToChatToIndex, CHAT_FLAGS ChatFlags, VECTOR vOptionalGoToPosition, FLOAT fOptionalHeading, FLOAT fIdleTime) = "0x2966111306fa6611"

//INFO: 
//PARAM NOTES: 
//PURPOSE:  Queries the CHAT_TO_PED task if the ped is at the specified position
NATIVE FUNC BOOL IS_CHATTING_PED_IN_POSITION(PED_INDEX PedIndex) = "0xd701a91d13919148"

//INFO: 
//PARAM NOTES: 
//PURPOSE:  Queries the CHAT_TO_PED task if the ped is playing an anim
NATIVE FUNC BOOL IS_CHATTING_PED_PLAYING_ANIM(PED_INDEX PedIndex) = "0xae8fabcda3959d22"

//INFO: 
//PARAM NOTES: 
//PURPOSE:  - DEPRECATED. This command no longer works, and should be removed
NATIVE PROC MAKE_CHATTING_PED_PLAY_ANIM(PED_INDEX PedIndex, STRING pAnimDictName,  STRING pAnimName, FLOAT fBlendInDelta = NORMAL_BLEND_IN, INT nTimeToPlay =-1, ANIMATION_FLAGS AnimFlags = AF_DEFAULT) = "0x3f4bfc1622d674be"

//INFO: 
//PARAM NOTES: 
//PURPOSE:  Makes the CHAT_TO_PED exit, playing good bye gestures if specified
NATIVE PROC MAKE_CHATTING_PED_LEAVE(PED_INDEX PedIndex, BOOL bPlayGoodByeGesture) = "0x9dfbb232fdaa2244"

//INFO:  Can't be used in a sequence. 
//PARAM NOTES:
//PURPOSE: Adds a follow navmesh route to a currently running phone task at specified pace. More info.. 
NATIVE PROC ADD_FOLLOW_NAVMESH_TO_PHONE_TASK( PED_INDEX PedIndex, VECTOR vecTarget, FLOAT fMoveBlendRatio=PEDMOVEBLENDRATIO_WALK ) = "0xe12df85ba18a27f8"

//INFO: If the ped is performing the Use Mobile Phone task then this command will return the subtask for that task. 
//  The MOBILE_PHONE_SUB_TASK ENUM is also declared in commands_task.sch. 
//  If the ped isn't performing the task then this command will assert and return FALSE. If the ped is performing the Use Mobile Phone task then this command will return TRUE. 
//PARAM NOTES:
//PURPOSE: Gets the current mobile phone subtask. More info..
NATIVE FUNC BOOL GET_MOBILE_PHONE_TASK_SUB_TASK (PED_INDEX PedIndex, MOBILE_PHONE_SUB_TASK &ReturnSubTask) = "0xeb6576b40ae232f5"

//INFO: 
//PARAM NOTES: if WANDER is true the ped will wander, otherwise stand still for the length of the conversation 
//PURPOSE: Tells the ped to have a mobile conversation. More info..
NATIVE PROC TASK_MOBILE_CONVERSATION( PED_INDEX PedIndex, BOOL bWANDER ) = "0x25b0bd76aba76488"

//~>                    Investigation commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the investigation position of a ped
NATIVE PROC SET_INVESTIGATION_POSITION(PED_INDEX PedIndex, VECTOR NewInvestigationPosition) = "0x00f6e31f2f0528cc"

//INFO:
//PARAM NOTES:
//PURPOSE: Checks if a ped is running an investigation task due to a whistling event
NATIVE FUNC BOOL IS_PED_INVESTIGATING_WHISTLING_EVENT(PED_INDEX PedIndex) = "0x7fd44d022e2a2e07"

//~>                    Clear task commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Clears all tasks that are being performed by the ped. 
NATIVE PROC CLEAR_PED_TASKS( PED_INDEX PedIndex ) = "0x03a927199a2dfe46"

//INFO: 
//PARAM NOTES:
//PURPOSE: Clears any scripted task on the ped if they are running a non temporary (higher priority) threat response task above.
//		   This is useful if you never want to resume the underlying scripted task once a ped goes into combat
//		   E.g if a ped is tasked to drive somewhere, and along the way sees a hated ped and goes into combat with them.
//		   said ped can end up getting out of the vehicle, and if they are in a group, will not follow the group leader because 
//		   code 'think' they are running a scripted task and so don't bother giving the ped a defensive area around the leader so they stay together
//		   Added for [GTAV] B*1605087, Do not use unless you understand this or have spoken to CHI-WAI CHIU or PHIL HOOKER directly. 
NATIVE PROC CLEAR_PED_SCRIPT_TASK_IF_RUNNING_THREAT_RESPONSE_NON_TEMP_TASK( PED_INDEX PedIndex ) = "0xf3642376bf6ac7a8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Clears any secondary anims playing on the ped.
NATIVE PROC CLEAR_PED_SECONDARY_TASK( PED_INDEX PedIndex ) = "0xca2872f050840231"

//~>                    Interaction commands 

//INFO: 
//PARAM NOTES:
//PURPOSE: Tells a ped to face an entity.
NATIVE PROC TASK_TURN_PED_TO_FACE_ENTITY( PED_INDEX PedIndex, ENTITY_INDEX EntityIndex, INT Time = 0 ) = "0x529d306014d3c29a"

//~>                    Gun commands

//INFO: 
//PARAM NOTES: FIRING_TYPE is in commands_task.sch
//PURPOSE:  Tells the ped to shoot at given coord. More info..
NATIVE PROC TASK_SHOOT_AT_COORD( PED_INDEX PedIndex,VECTOR VecTargetCoors, INT Duration, FIRING_TYPE FiringType ) = "0xa99ad9dee4794c48"

//INFO: 
//PARAM NOTES: InstantBlendToAim will skip the idle transition and instantly blend to the aim pose
//PURPOSE: Tells the ped to aim a gun at the coord
NATIVE PROC TASK_AIM_GUN_AT_COORD( PED_INDEX PedIndex, VECTOR VecTargetCoors, INT Duration, BOOL InstantBlendToAim = FALSE, BOOL PlayAimIntro = FALSE) = "0x2ea72cdbfacd9e92"

//INFO:  The first ped must have a gun and it must be his current weapon to use this command. 
//PARAM NOTES:Duration is measured in milliseconds. InstantBlendToAim will skip the idle transition and instantly blend to the aim pose
//PURPOSE: Tells a ped to aim a gun a an entity. More info..
NATIVE PROC TASK_AIM_GUN_AT_ENTITY( PED_INDEX PedIndex, ENTITY_INDEX EntityIndex, INT Duration, BOOL InstantBlendToAim = FALSE ) = "0x636b3584208a6d73"

//INFO: 
//PARAM NOTES:SeekRadius: How close a ped gets before the task is complete.     
//PURPOSE: Sends a ped to an entity aiming a gun. More info..
NATIVE PROC TASK_GOTO_ENTITY_AIMING(PED_INDEX PedIndex, ENTITY_INDEX EntityIndex, FLOAT SeekRadius, FLOAT AimRadius ) = "0x27c6152f3e5f2933"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gives player scripted gun task
NATIVE PROC TASK_AIM_GUN_SCRIPTED( PED_INDEX PedIndex, SCRIPTED_GUN_TASK AimGunTaskType = SCRIPTED_GUN_TASK_ON_CRATE, BOOL DisableGunBlocking = TRUE, BOOL InstantBlendToAim = FALSE ) = "0xccf862b807fe3901"

//PARAM NOTES: the target or the vector can be null/zero, but one of them needs to valid. if both are valid the vector is used as an offset
//PURPOSE: Gives a ped a scripted gun task with a target
NATIVE PROC TASK_AIM_GUN_SCRIPTED_WITH_TARGET( PED_INDEX PedIndex, PED_INDEX TargetIndex, VECTOR vTargetPosition, SCRIPTED_GUN_TASK AimGunTaskType = SCRIPTED_GUN_TASK_ON_CRATE, BOOL DisableGunBlocking = TRUE, BOOL bForceAim = FALSE ) = "0x30cd3d58df974a16"

//PARAM NOTES: the target or the vector can be null/zero, but one of them needs to valid. if both are valid the vector is used as an offset
//PURPOSE: Updates a current scripted gun task with a target
NATIVE PROC UPDATE_TASK_AIM_GUN_SCRIPTED_TARGET( PED_INDEX PedIndex, PED_INDEX TargetIndex, VECTOR vTargetPosition, BOOL DisableGunBlocking = TRUE ) = "0x20a2aeaf04674323"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the name of the clip set required for the specified scripted gun task. Should be streamed in using REQUEST_CLIP_SET.
NATIVE FUNC STRING GET_CLIP_SET_FOR_SCRIPTED_GUN_TASK( SCRIPTED_GUN_TASK AimGunTaskType = SCRIPTED_GUN_TASK_ON_CRATE) = "0x3943988de42ef74a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Use this to set the entity which a ped dangling from a rope will track for its orientation. Usually just set to the object at the top of the rope.
NATIVE PROC SET_ROPE_TRACK_ENTITY_FOR_SCRIPTED_GUN_TASK( PED_INDEX PedIndex, ENTITY_INDEX EntityIndex ) = "0x87ac327b490ecccc"


//~>                    Cover commands

//INFO: NOTE: To take the coordinates of a cover point you'd like to create, do the following:
//    Stand behind the object you'd like to take cover behind.
//    Face towards the object you're standing behind.
//
//  If you do it this way then the following is true:
//   The heading that is output to your temp_debug.txt is the 'FLOAT direction'
//  Another thing to bear in mind is:
//     When setting COVERPOINT_USAGE, COVUSE_WALLTOLEFT will flip the ped out to his right hand side, and so COVUSE_WALLTORIGHT will flip the ped out to his left. 
//PARAM NOTES: COVERPOINT_USAGE: How the ped uses the cover
//                          COVERPOINT_ARC: How much cover the ped thinks the cover provides. 120 should be enough. 
//								COVARC_180 = 0, // 180 degrees to the front of the player - middle of a long low wall
//								COVARC_120,		// 120 degrees, box providing limited cover
//								COVARC_90,		// 90 degrees, Barrel or something small providing cover only from the front
//								COVARC_0TO60,	// High wall with firing only available round a corner with a wall to the left
//								COVARC_300TO0,  // High wall with firing only available round a corner with a wall to the right
//								COVARC_0TO45,   // High wall, very close to the corner with firing only available with a wall to the left
//								COVARC_315TO0   // High wall, very close to the corner with firing only available with a wall to the right
//                          COVERPOINT_HEIGHT: The height of the cover point only LOW and TO_HIGH are valid
// By default use this:
//	Corner of a high wall (wall to the left)
//		COVUSE_WALLTOLEFT, COVHEIGHT_TOOHIGH, COVARC_0TO60
//	Corner of a high wall (wall to the right)
//		COVUSE_WALLTORIGHT, COVHEIGHT_TOOHIGH, COVARC_300TO0
//	Low cover point, lots of side cover
//		COVUSE_WALLTORIGHT, COVHEIGHT_LOW, COVARC_180
//	Low cover point, limited of side cover
//		COVUSE_WALLTORIGHT, COVHEIGHT_LOW, COVARC_120
//  BOOL isPriorityToPlayer -> The player will prefer this cover point over other nearby ones
//PURPOSE: Adds a cover point in the given position to cover from direction ( in degrees ). More info..
NATIVE FUNC COVERPOINT_INDEX  ADD_COVER_POINT( VECTOR VecCoors, FLOAT direction, COVERPOINT_USAGE usage, COVERPOINT_HEIGHT height, COVERPOINT_ARC arc, BOOL isPriorityToPlayer = FALSE ) = "0x41ba9dba367c9c12"

//INFO: 
//PARAM NOTES:
//PURPOSE: Removes a script added cover point.
NATIVE PROC REMOVE_COVER_POINT( COVERPOINT_INDEX index ) = "0x5990dad3727a1b45"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if a scripted cover point already exists at the coords passed in
NATIVE FUNC BOOL DOES_SCRIPTED_COVER_POINT_EXIST_AT_COORDS( VECTOR VecCoors ) = "0x7fd113b09d96c678"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the coords of the scripted cover point id passed in
NATIVE FUNC VECTOR GET_SCRIPTED_COVER_POINT_COORDS( COVERPOINT_INDEX index ) = "0x137fb6fc6e40a0a8"

//INFO: Must be called every frame
//PARAM NOTES: VecCoors cannot be more than 200m away from the player to avoid streaming issues
//PURPOSE: Adds a cover area at a specified location and with the specific radius which will be added to the streaming cover area array
NATIVE PROC ADD_SCRIPTED_COVER_AREA( VECTOR VecCoors, FLOAT radius ) = "0x28b7b9bfdaf274aa"


//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the scripted cover points status
//NATIVE FUNC COVERPOINT_STATUS GET_SCRIPTED_COVER_POINT_STATUS( COVERPOINT_INDEX index )

//~>                        Combat commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Tells a ped to combat another ped.
NATIVE PROC TASK_COMBAT_PED( PED_INDEX PedIndex, PED_INDEX OtherPedIndex, TASK_COMBAT_PED_FLAGS CombatFlags = COMBAT_PED_NONE, TASK_THREAT_RESPONSE_FLAGS TaskThreatResponseFlags = TASK_THREAT_RESPONSE_CAN_FIGHT_ARMED_PEDS_WHEN_NOT_ARMED) = "0xc1a74225341aa9fb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tells a ped to combat another ped for a timed period.
NATIVE PROC TASK_COMBAT_PED_TIMED( PED_INDEX PedIndex, PED_INDEX OtherPedIndex, INT Time, TASK_COMBAT_PED_FLAGS Flags = COMBAT_PED_NONE ) = "0x5fc4a511155d6f9a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tells the ped to combat all hated targets in the area.
NATIVE PROC TASK_COMBAT_HATED_TARGETS_IN_AREA( PED_INDEX PedIndex, VECTOR vPosition, FLOAT fRange, TASK_COMBAT_PED_FLAGS Flags = COMBAT_PED_NONE ) = "0xe45039a194d735de"

//INFO: 
//PARAM NOTES:
//PURPOSE: Tells the ped to combat all hated targets in the radius about the ped.
NATIVE PROC TASK_COMBAT_HATED_TARGETS_AROUND_PED( PED_INDEX PedIndex, FLOAT fRange, TASK_COMBAT_PED_FLAGS Flags = COMBAT_PED_NONE ) = "0x766d377a16f499e3"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Tells the ped to combat all hated targets in the radius about the ped for a time period.
NATIVE PROC TASK_COMBAT_HATED_TARGETS_AROUND_PED_TIMED( PED_INDEX PedIndex, FLOAT fRange, int iTime, TASK_COMBAT_PED_FLAGS Flags = COMBAT_PED_NONE ) = "0x34ad04c1e7cb67d8"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Tells the ped to swap their weapon.
NATIVE PROC TASK_SWAP_WEAPON( PED_INDEX PedIndex, BOOL bDrawWeapon ) = "0xd4834169f570e6d2"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Tells the ped to reload their weapon.
NATIVE PROC TASK_RELOAD_WEAPON( PED_INDEX PedIndex, BOOL bDrawWeapon ) = "0x62f1ebed7a072b40"

//INFO: 
//PARAM NOTES: ROLL_DIR is in commands_task.sch
//PURPOSE: Makes the ped peform a combat roll in the direction specified. More info..
NATIVE PROC TASK_COMBAT_ROLL( PED_INDEX PedIndex, ROLL_DIR rollDir ) = "0x8eddf98bab0a7bc9"

//INFO:
//PARAM NOTES:
//PURPOSE: The ped will move to the GoToCoord while aiming at the AimAtCoord
NATIVE PROC TASK_GO_TO_COORD_WHILE_AIMING_AT_COORD(PED_INDEX PedIndex, VECTOR GoToCoord, VECTOR AimAtCoord, FLOAT MoveBlendRatio, BOOL Shoot, FLOAT TargetDistance = 0.5, FLOAT SlowDistance = 4.0, BOOL UseNavMesh = TRUE, ENAV_SCRIPT_FLAGS iNavFlags=ENAV_DEFAULT, BOOL InstantBlendToAim = FALSE, FIRING_TYPE FiringPatternHash = FIRING_PATTERN_FULL_AUTO) = "0x642c58f4ca259448"

//INFO:
//PARAM NOTES:
//PURPOSE: The ped will move to the GoToCoord while aiming at the AimAtEntity
NATIVE PROC TASK_GO_TO_COORD_WHILE_AIMING_AT_ENTITY(PED_INDEX PedIndex, VECTOR GoToCoord, ENTITY_INDEX AimAtEntityIndex, FLOAT MoveBlendRatio, BOOL Shoot, FLOAT TargetDistance = 0.5, FLOAT SlowDistance = 4.0, BOOL UseNavMesh = TRUE, ENAV_SCRIPT_FLAGS iNavFlags=ENAV_DEFAULT, BOOL InstantBlendToAim = FALSE, FIRING_TYPE FiringPatternHash = FIRING_PATTERN_FULL_AUTO, INT iTimer = DEFAULT_TIME_BEFORE_WARP) = "0x98db2abd53b8d70b"

//INFO:
//PARAM NOTES:
//PURPOSE: The ped will move to the GoToEntityIndex while aiming at the AimAtCoord
NATIVE PROC TASK_GO_TO_ENTITY_WHILE_AIMING_AT_COORD(PED_INDEX PedIndex, ENTITY_INDEX GoToEntityIndex, VECTOR AimAtCoord, FLOAT MoveBlendRatio, BOOL Shoot, FLOAT TargetDistance = 0.5, FLOAT SlowDistance = 4.0, BOOL UseNavMesh = TRUE, BOOL InstantBlendToAim = FALSE, FIRING_TYPE FiringPatternHash = FIRING_PATTERN_FULL_AUTO) = "0x60fad147bb45a92a"

//INFO:
//PARAM NOTES:
//PURPOSE: The ped will move to the GoToEntityIndex while aiming at the AimAtEntityIndex
NATIVE PROC TASK_GO_TO_ENTITY_WHILE_AIMING_AT_ENTITY(PED_INDEX PedIndex, ENTITY_INDEX GoToEntityIndex, ENTITY_INDEX AimAtEntityIndex, FLOAT MoveBlendRatio, BOOL Shoot, FLOAT TargetDistance = 0.5, FLOAT SlowDistance = 4.0, BOOL UseNavMesh = TRUE, BOOL InstantBlendToAim = FALSE, FIRING_TYPE FiringPatternHash = FIRING_PATTERN_FULL_AUTO) = "0x0b47872e9d74882c"

//PURPOSE: Will go to the specified coord and aim at hated entites near the given coord
NATIVE PROC TASK_GO_TO_COORD_AND_AIM_AT_HATED_ENTITIES_NEAR_COORD(PED_INDEX PedIndex, VECTOR GoToCoord, VECTOR AimNearCoord, FLOAT MoveBlendRatio, BOOL Shoot, FLOAT TargetDistance = 0.5, FLOAT SlowDistance = 4.0, BOOL UseNavMesh = TRUE, ENAV_SCRIPT_FLAGS iNavFlags=ENAV_DEFAULT, TASK_GO_TO_AIM_FLAGS iTaskFlags=GO_TO_AIM_NONE, FIRING_TYPE FiringPatternHash = FIRING_PATTERN_FULL_AUTO) = "0x2a83cd9941ec44d0"

//INFO:
//PARAM NOTES:
//PURPOSE: The ped will move to the GoToPedIndex while aiming at the AimAtObject
NATIVE PROC TASK_CAPTURE_PED(PED_INDEX PedIndex, PED_INDEX CapturedPedIndex, FLOAT fSurrenderTime, FLOAT fQuestionTime) = "0xca6373c1a46d9774"

//PURPOSE: This triggers the throw projectile task one time
NATIVE PROC TASK_THROW_PROJECTILE(PED_INDEX PedIndex, VECTOR ThrowAtCoord, ENTITY_INDEX IgnoreCollisionEntityIndex = NULL, BOOL CreateInvincibleProjectile = FALSE) = "0xa43ab969c8956eb8"

//PURPOSE:: This will have a leader or follower of a group move in line formation to the target (leader does the navigation while followers...follow) 
//PARAM NOTES: Must have either a valid ped index or a valid target location. If both are supplied the target location is used as an offset
//			   Pass in NULL for the TargetPedIndex if you plan on using a location and <<0.0, 0.0, 0.0>> for the location if you are using a ped
//			   By default the task will hold at the end forever, unless told to do otherwise specify 0 for not holding at all otherwise a valid positive number for a timed hold
NATIVE PROC TASK_ADVANCE_TO_TARGET_IN_LINE(PED_INDEX PedIndex, PED_INDEX TargetPedIndex, VECTOR TargetLocation, FLOAT fDesiredDist = 0.75, FLOAT fTimeToHoldAtEnd = -1.0, ADVANCE_TO_TARGET_FLAGS iFlags = ATTF_DEFAULT) = "0xd9c691ad25d0d5eb"

/// PURPOSE:
///    Set the charge target behavior enabled or disabled globally
/// PARAMS:
///    bEnabled - Whether charge target behavior is enabled
NATIVE PROC  SET_CHARGE_TARGET_ENABLED(BOOL bEnabled) = "0x9dea9d830bfc9937"
	   
/// PURPOSE:
///    Sets the number of peds allowed to charge the same target within a short time
/// PARAMS:
///    MAX_NUM_ACTIVE_CHARGERS - The desired number chargers limit
NATIVE PROC SET_MAX_NUM_ACTIVE_CHARGERS(INT MAX_NUM_ACTIVE_CHARGERS) = "0xa2d85c968ea44e3d"

/// PURPOSE:
///    Sets the minimum time between any charges at the same target
/// PARAMS:
///    MIN_TIME_SECONDS - The desired minimum wait time in seconds
NATIVE PROC SET_MIN_TIME_BETWEEN_CHARGES_AT_SAME_TARGET(FLOAT MIN_TIME_SECONDS) = "0xfbb868ae331debcd"

//~>                        Guard commands

//INFO: 
//PARAM NOTES: Will stay within fPositionProximity metres to the given position, unless attacked; then ped will react according to its set decision makers until combat is ended, then will return to given position.
//  Heading given by fHeading, measured in degrees, and only used when the Ped is at the main vDefendPosition.
//  Context is used to stream in ambient animations or playing specific scenarios whilst the guard is guarding, defaults to a stationary scenario with stand guard ambient anims
//PURPOSE: Tells the ped to defend the given position.  More info..
NATIVE PROC TASK_STAND_GUARD( PED_INDEX PedIndex, VECTOR vDefendPosition, FLOAT fHeading, STRING context) = "0x4b551665e9b2e8f6"

//INFO: 
//PARAM NOTES:bSetDefensiveArea is set the peds defensive area will be set to the position and radius of fGuardAreaRadius.
//  The behaviour will be the same as TASK_STAND_GUARD, but will only patrol inside the defensive area and inside fMaxPatrolProximity, if the ped shouldn't patrol the area, set fMaxPatrolProximity to 0.0 
//PURPOSE: Tells the ped to guard their current position with the area passed. More info..
NATIVE PROC TASK_GUARD_CURRENT_POSITION( PED_INDEX PedIndex, FLOAT fMaxPatrolProximity, FLOAT GuardAreaRadius, BOOL bSetDefensiveArea ) = "0x274a180d57a0d9a6"

//INFO: The behaviour will be the same as TASK_STAND_GUARD, if the ped shouldn't patrol the area, set fMaxPatrolProximity to 0.0 
//PARAM NOTES:
//PURPOSE: Tells the ped to guard its assigned area, will assert if no defensive area is assigned. More info..
NATIVE PROC TASK_GUARD_ASSIGNED_DEFENSIVE_AREA( PED_INDEX PedIndex, VECTOR vDefendPosition, FLOAT fHeading, FLOAT fMaxPatrolProximity, INT nTimer ) = "0x4182d960e26d40bb"

//INFO: 
//PARAM NOTES: The behaviour will be the same as TASK_STAND_GUARD, but will only patrol inside the defensive area and inside fMaxPatrolProximity, if the ped shouldn't patrol the area, set fMaxPatrolProximity to 0.0
//  nTimer is used if the task is to be for a timed duration, measured in milliseconds. If not required, set to -1. 
//PURPOSE: Sets the defensive area of the ped and tells the ped to guard the area passed. More info..
NATIVE PROC TASK_GUARD_ANGLED_DEFENSIVE_AREA(PED_INDEX PedIndex, VECTOR vDefendPosition, FLOAT fHeading, FLOAT fMaxPatrolProximity, INT nTimer, VECTOR vAreaStart, VECTOR vAreaEnd, FLOAT fAreaWidth) = "0xf035a69189e11b7a"

//INFO: The behaviour will be the same as TASK_STAND_GUARD, but will only patrol inside the defensive area and inside fMaxPatrolProximity, if the ped shouldn't patrol the area, set fMaxPatrolProximity to 0.0 
//  The area is specified using vAreaCentre and fAreaRadius the same format as SET_PED_SPHERE_DEFENSIVE_AREA. 
//PARAM NOTES:
//PURPOSE: Sets the defensive area of the ped and tells the ped to guard the area passed.  More info..
NATIVE PROC TASK_GUARD_SPHERE_DEFENSIVE_AREA(PED_INDEX PedIndex, VECTOR vDefendPosition, FLOAT fHeading, FLOAT fMaxPatrolProximity, INT nTimer, VECTOR vAreaStart, FLOAT fAreaRadius) = "0x061a42ebc9ceb366"

//INFO: 
//PARAM NOTES: Check the drive task running on the ped is active before calling. 
//PURPOSE: Sets the drive tasks cruise speed. More info..
NATIVE PROC SET_DRIVE_TASK_CRUISE_SPEED( PED_INDEX PedIndex, FLOAT CruiseSpeed ) = "0xbb3480bb855cdb33"

//INFO: 
//PARAM NOTES: Check the drive task running on the ped is active before calling. 
//PURPOSE: Sets the drive tasks maximum cruise speed. If MaxCruiseSpeed is set to 0 then it is ignored.
NATIVE PROC SET_DRIVE_TASK_MAX_CRUISE_SPEED( PED_INDEX PedIndex, FLOAT MaxCruiseSpeed ) = "0x3d2ebac0a745e60c"

//INFO: 
//PARAM NOTES: Check the drive task running on the ped is active before calling. 
//PURPOSE: Sets the drive tasks driving style. More info..
NATIVE PROC SET_DRIVE_TASK_DRIVING_STYLE( PED_INDEX PedIndex, INT DriveStyle ) = "0x27be5555cdf6f983"

//INFO: 
//PARAM NOTES: Check the pursue task running on the ped is active before calling. 
//PURPOSE: Sets the ideal distance at which the pursue task should follow
NATIVE PROC SET_PURSUE_TASK_IDEAL_DISTANCE( PED_INDEX PedIndex, FLOAT IdealDistance ) = "0x971919670679e003"

//~>                            Patrol Commands                     <~
//INFO: This should be called once when added a patrol route.
//PARAM NOTES: RouteName: This must be prefixed with miss_ to be valid. eg "miss_Desert1" 
//PURPOSE:Opens up a empty route so that nodes and links can be added. More info..
NATIVE PROC OPEN_PATROL_ROUTE( STRING RouteName ) = "0x9d3e7062e40f2049"

//INFO: This can only be called once OPEN_PATROL_ROUTE has been called.
//  There cane be a maximum of 16 nodes per route.
//PARAM NOTES: NodeId: This must be unique for each patrol route.
//  NodeType: Taken from the following list.
//  "WORLD_HUMAN_GUARD_STAND",
//  "WORLD_HUMAN_SMOKING" 
//  vNodePosition: Position of the node
//  NodeLookAtPos: This is the position in world coords where the ped will look at. Set this to zero to make the ped look at nothing.
//  Duration: The time the ped will spend at the node.
//PURPOSE:Adds a patrol route node. Moreinfo..
NATIVE PROC ADD_PATROL_ROUTE_NODE( INT NodeId, STRING NodeType, VECTOR vNodePosition, VECTOR NodeLookAtPos, INT Duration = 0 ) = "0xad84831de60c1442"

//INFO: A Node can have a maximum of 4 links. The direction of the link is the order passed in. e.g NodeA, NodeB passed in that order will will go to from A to B
//PARAM NOTES: 
//PURPOSE: Links two patrol nodes together. More info.. 
NATIVE PROC ADD_PATROL_ROUTE_LINK ( INT NodeId1, INT NodeId2 ) = "0x23c767cf5993cf13"

//INFO:Tells the code that all the nodes and links have been added.
//PARAM NOTES: 
//PURPOSE: Call this once finished adding links and nodes. More info..
NATIVE PROC CLOSE_PATROL_ROUTE () = "0xc65dee4d8f9f02eb"

//INFO: This can only be called once a valid a ptrol route has been added.
//PARAM NOTES: 
//PURPOSE: Adds the completed patrol route. 
NATIVE PROC CREATE_PATROL_ROUTE () = "0x274f700901c096dd"

//INFO:
//PARAM NOTES: 
//PURPOSE: Removes the named route inlcuding nodes and links.
NATIVE PROC DELETE_PATROL_ROUTE (STRING RouteName) = "0x6bd70dca1fdc1c56"

//INFO: This can only be called once a valid a ptrol route has been added.
//PARAM NOTES: 
//PURPOSE: Adds the completed patrol route. 
NATIVE PROC TASK_PATROL (PED_INDEX Ped, STRING RouteName, PATROL_ALERT_STATE PedAlertState, BOOL CanChatToPeds = FALSE, BOOL CanUseHeadLookAtAlongRoute = TRUE) = "0xac81ed4a4f2fec9c"

//INFO: The values it returns should be only checked if the function returns true. The function returns TRUE when the ped has the patrol task as his active task.
// If the ped is patrolling, the function returns true. If the ped then engages in combat the function will return false until he resumes his patrol task
//PARAM NOTES: TimeLeftAtNode: returns how long the ped has to remain at that node if standing there. e.g. if the node has a duration of 5000ms 
//and he has been standing there for 2000ms this param returns 3000ms. If the ped is between nodes or the node has 0 time then the parameter will return 0. 
//  NodeId: Returns the ID of the node that the ped is standing at or heading to. 
//  This the ID of node assigned by the script. If the patrol task can’t find a valid node then the function will return -1. 
//PURPOSE: Will get info from peds patrol task about the route. More info
NATIVE FUNC BOOL GET_PATROL_TASK_INFO (PED_INDEX Ped, INT &TimeLeftAtNode, INT &NodeId) = "0x52f734cebe20dfba"



//~>                             Cover Commands                         <~      

//INFO: If after a search no cover point can be found the task will finish. 
//  Once cover is reached the ped will hide behind it for Time milliseconds then the task will end, if Time is zero the ped will hide behind it indefinitely and the task will never end. 
//PARAM NOTES:
//PURPOSE: The ped will seek cover from the given coordinates. More info..
NATIVE PROC TASK_SEEK_COVER_FROM_POS( PED_INDEX PedIndex, VECTOR VecFromCoors, INT Time, BOOL CanPeekAndAim = FALSE ) = "0x3f58924930345d8d"

//INFO: 
//PARAM NOTES:Once cover is reached the ped will hide behind it for Time milliseconds then the task will end,
//  if Time is zero the ped will hide behind it indefinitely and the task will never end. 
//PURPOSE: The ped will seek cover from the given peds location. More info..
NATIVE PROC TASK_SEEK_COVER_FROM_PED( PED_INDEX PedIndex, PED_INDEX OtherPedIndex, INT Time, BOOL CanPeekAndAim = FALSE ) = "0xb67d1d267c666dc4"

//INFO:Seeks cover in such a way as to avoid fire from position fromX, fromY, fromZ. Once cover is reached the ped will hide behind it for Time milliseconds then the task will end, 
//  if Time is zero the ped will hide behind it indefinitely and the task will never end. 
//PARAM NOTES:
//PURPOSE: Task making the ped seek cover at the scripted cover point specified in CoverIndex. More info..
NATIVE PROC TASK_SEEK_COVER_TO_COVER_POINT( PED_INDEX PedIndex, COVERPOINT_INDEX CoverIndex, VECTOR VecFromCoors, INT Time, BOOL CanPeekAndAim = FALSE ) = "0x419e449559bf60b4"

//INFO: The ped will find the nearest cover point to the coords given.
//  Once cover is reached the ped will hide behind it for Time milliseconds then the task will end, if Time is zero the ped will hide behind it indefinitely and the task will never end. 
//PARAM NOTES:
//PURPOSE: Tells a ped to seek cover to given coords VecCooverCoors in such a way as to hide from VecFromCoors. More info..
NATIVE PROC TASK_SEEK_COVER_TO_COORDS( PED_INDEX PedIndex, VECTOR VecCooverCoors, VECTOR VecFromCoors, INT Time, BOOL CanPeekAndAim = FALSE ) = "0x264cd1b504831626"

//INFO: This can only be called on a ped which has a valid defensive area.
//PARAM NOTES: 
//PURPOSE: This task will cause the ped to continuously look for cover within their defensive area, the defensive area can be moved
//         and the ped will move to within the new area.  
//         If the defensive area has a direction the ped will always seek cover from that direction.
NATIVE PROC TASK_STAY_IN_COVER (PED_INDEX Ped) = "0xf21f1b3825b46822"

//INFO: 
//PARAM NOTES:
//PURPOSE: Puts the ped directly into cover at the nearest point to the position specified.  More info..
NATIVE PROC TASK_PUT_PED_DIRECTLY_INTO_COVER( PED_INDEX PedIndex, VECTOR vCoverPos, INT Time, BOOL CanPeekAndAim = FALSE, FLOAT BlendInDuration = 0.0, bool ForceInitialFacingDirection = FALSE, bool bForceFaceLeft = FALSE, COVERPOINT_INDEX CoverIndex = NULL, BOOL bDoEntryAnim = FALSE) = "0x809dfa39515d5981"

//INFO: 
//PARAM NOTES:The character can target at a vehicle, coordinates or another character. At least one of TargetCharID and TargetVehicleID must be NULL. If there is a target character or vehicle then the target coordinates are used as an offset.
//  If TargetCharID and TargetVehicleID are both NULL then the character will fire at the target coordinates.
//  CharID and TargetCharID are both of type PED_INDEX
//  TargetVehicleID is of type VEHICLE_INDEX
//PURPOSE: Puts the ped directly into cover at the nearest point to the position specified.  More info..
NATIVE PROC TASK_PUT_PED_DIRECTLY_INTO_COVER_FROM_TARGET( PED_INDEX PedIndex, PED_INDEX OtherPedIndex, VEHICLE_INDEX TargetVehicleIndex, VECTOR TargetCoors, VECTOR vCoverPos, INT Time, BOOL CanPeekAndAim = FALSE, FLOAT BlendInDuration = 0.0, bool ForceInitialFacingDirection = FALSE, bool bForceFaceLeft = FALSE, COVERPOINT_INDEX CoverIndex = NULL, BOOL bDoEntryAnim = FALSE) = "0x9f8e54193d416a78"

//INFO: 
//PARAM NOTES:
//PURPOSE: Warps the ped directly into cover at the nearest point to the position specified.  More info..
NATIVE PROC TASK_WARP_PED_DIRECTLY_INTO_COVER(PED_INDEX PedIndex, INT iTime, BOOL bCanPeekAndAim = FALSE, BOOL bForceInitialFacingDirection = FALSE, BOOL bForceFaceLeft = FALSE, COVERPOINT_INDEX CoverIndex = NULL) = "0x6e01e9e8d89f8276"

//INFO: Used to update a cover task target (instead of constantly clearing and creating a new task)
//PARAM NOTES:
NATIVE PROC SET_COVER_TASK_TARGET( PED_INDEX PedIndex, PED_INDEX OtherPedIndex, VEHICLE_INDEX TargetVehicleIndex, VECTOR VecCoors ) = "0x778c4e702f2a65e5"

//INFO: 
//PARAM NOTES: TargetCoors refers to the aim at target when using ExitType = AIMING_COVER_EXIT
//PURPOSE: Makes a ped in cover exit cleanly
NATIVE PROC TASK_EXIT_COVER( PED_INDEX PedIndex, COVER_EXIT_TYPE ExitType, VECTOR TargetCoors ) = "0x412ed6ee0b28c20d"

//INFO: 
//PARAM NOTES: AiCombatFlags - only applies when the ped being given the task is an AI ped
//PURPOSE: Puts the ped directly into melee
NATIVE PROC TASK_PUT_PED_DIRECTLY_INTO_MELEE( PED_INDEX PedIndex, PED_INDEX PedTargetIndex, FLOAT BlendInDuration, FLOAT nTimeInTask, FLOAT StrafePhaseSync, TASK_COMBAT_PED_FLAGS AiCombatFlags = COMBAT_PED_NONE ) = "0x957211dc68d2869f"

//INFO: if you want them to use scripted points added instead. You must call REMOVE_ALL_COVER_BLOCKING_AREAS at the end of the mission to remove them, 
//  this command can only be used during mission scripts
// MAX allowed areas is 16. Let code know if that needs increasing
//PARAM NOTES:
//PURPOSE: Adds an axis aligned area that will block coverpoints from being automatically created. More info..
NATIVE PROC ADD_COVER_BLOCKING_AREA( VECTOR vStart, VECTOR vEnd, BOOL bBlockObjects, BOOL bBlockVehicles, BOOL bBlockMap, BOOL bBlockPlayer = false ) = "0x5af3192f3c3d45ec"

//INFO: 
//PARAM NOTES:
//PURPOSE: Removes all cover areas added by ADD_COVER_BLOCKING_AREA
NATIVE PROC REMOVE_ALL_COVER_BLOCKING_AREAS() = "0x71fcd88fc7f98621"

//INFO: 
//PARAM NOTES:
//PURPOSE: Removes the specified cover area(s) added by ADD_COVER_BLOCKING_AREA. Will remove ALL blocking areas that intersect this point.
NATIVE PROC REMOVE_COVER_BLOCKING_AREAS_AT_POSITION( VECTOR vPosition ) = "0xac7ab29fe3c36266"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Removes the specified cover area(s) added by ADD_COVER_BLOCKING_AREA. Will remove ALL blocking areas which match these parameters.
NATIVE PROC REMOVE_SPECIFIC_COVER_BLOCKING_AREAS(VECTOR vStart, VECTOR vEnd, BOOL bBlockObjects, BOOL bBlockVehicles, BOOL bBlockMap, BOOL bBlockPlayer = false ) = "0xaa443863046f380a"

//~>                        Scenarios commands

//INFO: 
//PARAM NOTES: scenario is chosen fromhttp://10.11.23.14/wiki/index.php?title=SCENARIO_STRINGS
//PURPOSE: Puts the ped into the given scenario immediately. More info..
NATIVE PROC TASK_START_SCENARIO_IN_PLACE( PED_INDEX PedIndex, STRING ScenarioName, int TimeToLeave = 0, BOOL bPlayIntroClip = false ) = "0xc9fefb406c44f60b"

//INFO: 
//PARAM NOTES:	scenario is chosen fromhttp://10.11.23.14/wiki/index.php?title=SCENARIO_STRINGS
//				The z coord of vPosition should be the ground position plus the ped's ground to root offset.
//PURPOSE: The ped will move or warp to the position and heading given, then start the scenario passed. More info..
NATIVE PROC TASK_START_SCENARIO_AT_POSITION( PED_INDEX PedIndex, STRING ScenarioName, VECTOR vPosition, FLOAT fHeading, INT iTimeToLeave = 0, BOOL bPlayIntroClip = false, BOOL bWarp = true) = "0xdb4f67aafbf32aa5"

//INFO: 
//PARAM NOTES:scenario is chosen fromhttp://10.11.23.14/wiki/index.php?title=SCENARIO_STRINGS
//PURPOSE: You should create the ped and vehicle yourself before using this command. The ped will start the vehicle scenario, warping positions the ped instantly to the scenario location. More info..
NATIVE PROC TASK_START_VEHICLE_SCENARIO( PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, STRING ScenarioName, BOOL WarpToPosition ) = "0xbfb160b082e439fa"

//INFO: Make sure the scenario point or objects its attached to is loaded at the time. 
//PARAM NOTES:
//PURPOSE: Puts the ped into the cloeset scenario to the coord. More info..
NATIVE PROC TASK_USE_NEAREST_SCENARIO_TO_COORD( PED_INDEX PedIndex, VECTOR vPosition, FLOAT fRange, INT iTimeToLeaveMS = 0 ) = "0x1d698ecdff42ac58"

//PURPOSE: Returns TRUE if the ped has the USE_SCENARIO task. More info..
//NOTE: Use IS_PED_ACTIVE_IN_SCENARIO to check if the ped is not doing intro/exit
NATIVE FUNC BOOL PED_HAS_USE_SCENARIO_TASK(PED_INDEX PedIndex) = "0x23bf8abbc9594609"

//PURPOSE: Lets you override the base animation used when using a scenario point
//NOTE: a typical use of this would be paired with checks for PED_HAS_USE_SCENARIO_TASK after giving the ped
//			the scenario task
NATIVE PROC OVERRIDE_TASKED_SCENARIO_BASE_ANIM(PED_INDEX PedIndex, STRING clipSet, STRING clip) = "0xdd7e39f6a9fa3ce0"

//PURPOSE: Triggers the passed in clip to play as an animation for the current ped used scenario
//PARAM NOTES:  clipSet is a clipset not a clip dictionary! This means the string must refer to something in clip_sets.pso.meta.  If you do not know how to specify a clipset in data, ask Default AI.
NATIVE PROC PLAY_ANIM_ON_RUNNING_SCENARIO(PED_INDEX PedIndex, STRING clipSet, STRING clip) = "0x8b90895f7d0bee59"

//INFO: Make sure the scenario point or objects its attached to is loaded at the time.
//PARAM NOTES:
//PURPOSE: Warps the ped into the cloeset scenario to the pos. More info..
NATIVE PROC TASK_USE_NEAREST_SCENARIO_TO_COORD_WARP( PED_INDEX PedIndex, VECTOR vPosition, FLOAT fRange, INT iTimeToLeaveMS = 0 ) = "0x8ceb5d8b56025aa2"

//INFO:
//PARAM NOTES:
//PURPOSE:  Warps the ped into the nearest train scenario to the pos.  The scenario task will be wrapped in the ride train task (allowing the peds to exit normally).
NATIVE PROC TASK_USE_NEAREST_TRAIN_SCENARIO_TO_COORD_WARP( PED_INDEX PedIndex, Vector vPosition, FLOAT fRange) = "0x97deba5039a7f6c7"

//INFO: Make sure the scenario point or objects its attached to is loaded at the time. 
//PARAM NOTES:
//PURPOSE: Puts the ped into the cloeset scenario to the coord, with support for chaining to linked points (wraps CTaskUseScenario in CTaskUnalerted).
NATIVE PROC TASK_USE_NEAREST_SCENARIO_CHAIN_TO_COORD( PED_INDEX PedIndex, VECTOR vPosition, FLOAT fRange, INT iTimeToLeaveMS = 0 ) = "0xaf0492886bc6c105"

//INFO: Make sure the scenario point or objects its attached to is loaded at the time.
//PARAM NOTES:
//PURPOSE: Warps the ped into the cloeset scenario to the pos, with support for chaining to linked points (wraps CTaskUseScenario in CTaskUnalerted).
NATIVE PROC TASK_USE_NEAREST_SCENARIO_CHAIN_TO_COORD_WARP( PED_INDEX PedIndex, VECTOR vPosition, FLOAT fRange, INT iTimeToLeaveMS = 0 ) = "0x6d44636281842060"

//INFO: 
//PARAM NOTES: bMustBeFree is true it will only return true if the point is not in use. 
//PURPOSE: Returns true if there is a scenario in the area given More info..
NATIVE FUNC BOOL DOES_SCENARIO_EXIST_IN_AREA( VECTOR vPosition, FLOAT fRange, BOOL bMustBeFree ) = "0x5b138084858689ac"

//INFO: 
//PARAM NOTES: bMustBeFree is true it will only return true if the point is not in use. 
//PURPOSE: Returns true if there is a scenario of the specific type in the area given 
NATIVE FUNC BOOL DOES_SCENARIO_OF_TYPE_EXIST_IN_AREA( VECTOR vPosition, STRING scenarioType, FLOAT fRange, BOOL bMustBeFree ) = "0x48d8c2729764de01"


//INFO: Returns FALSE if no scenario was even found in this location (use DOES_SCENARIO_EXIST_IN_AREA to check, if needed)
//PARAM NOTES:	vPosition:	position to check
//				fRange:		max distance from position to look for scenario
//				bOnlyUsersActuallyAtScenario: If true, only consider users that have actually arrived, not users that are on their way to the scenario
//PURPOSE: Check if the closest scenario to a given point is occupied by some user.
NATIVE FUNC BOOL IS_SCENARIO_OCCUPIED( VECTOR vPosition, FLOAT fRange, BOOL bOnlyUsersActuallyAtScenario ) = "0xc85b76c87214bd87"

//INFO:
//PARAM NOTES:	scenarioGroupname:  The name of the group to change the priority value for this mission.
//				bIsHighPriority:  True to force all points in this group to high priority, False to force all points in this group to low priority.
//PURPOSE: Force all points in the given group to be high priority or low priority.
NATIVE PROC FORCE_SCENARIO_GROUP_PRIORITY( STRING scenarioGroupName, BOOL bIsHighPriority ) = "0xb2a385f314986d7d"

//INFO:
//PARAM NOTES:
//PURPOSE:  Restore the scenario group priority values to their default values.
NATIVE PROC RESET_SCENARIO_GROUPS_PRIORITY() = "0xf842c44cfffb8884"

//INFO: Returns TRUE if the group exists.
//PARAM NOTES: scenarioGroupName is the name of a scenario group, which may or may not exist.
//PURPOSE: Check if a named scenario group exists.
NATIVE FUNC BOOL DOES_SCENARIO_GROUP_EXIST(STRING scenarioGroupName) = "0x1e63be2394148da0"

//INFO: Returns TRUE if the group is enabled.
//PARAM NOTES: scenarioGroupName is the name of a scenario group, which must exist.
//PURPOSE: Check if the named scenario group is currently enabled.
NATIVE FUNC BOOL IS_SCENARIO_GROUP_ENABLED(STRING scenarioGroupName) = "0x96a05000ccd43584"

//INFO: 
//PARAM NOTES: scenarioGroupName is the name of a scenario group, which must exist.
//PURPOSE: Specify if the named scenario group should be enabled or not.
NATIVE PROC SET_SCENARIO_GROUP_ENABLED(STRING scenarioGroupName, BOOL enabled) = "0xa3d2c191df3cb742"

//INFO: 
//PARAM NOTES:
//PURPOSE:	Resets all scenario groups to their default enabled/disabled state (as specified in metadata).
//			This also does what RESET_EXCLUSIVE_SCENARIO_GROUP() does, undoing the effects of SET_EXCLUSIVE_SCENARIO_GROUP.
NATIVE PROC RESET_SCENARIO_GROUPS_ENABLED() = "0xb750df5029a6790a"

//INFO:
//PARAM NOTES:
//PURPOSE:	Specify a particular group that should be the only scenario group that should be enabled
//			(scenarios that are not in any group will also be considered disabled). There can only be one
//			of these, using the command again will replace any previously set exclusive group. Note that
//			this command does not change the regular enabled/disabled state of the group, so you may
//			also need to enable your group with SET_SCENARIO_GROUP_ENABLED in order for it to work.
//			NOTE: This now works like a reset flag and must be continually set every frame the scenario group ought 
//			to be exlusive!
NATIVE PROC SET_EXCLUSIVE_SCENARIO_GROUP(STRING scenarioGroupName) = "0xedf1af96b1a92325"

//INFO:
//PARAM NOTES:
//PURPOSE:	Undo the effects of any previous use of SET_EXCLUSIVE_SCENARIO_GROUP. The enabled/disabled
//			state of individual groups is unaffected.
NATIVE PROC RESET_EXCLUSIVE_SCENARIO_GROUP() = "0xa7fee431b0d22e80"

//INFO: Returns TRUE if the scenario type hasn't been disabled.
//PARAM NOTES: scenarioTypeName is the name of the scenario type, such as "WORLD_HUMAN_LEANING".
//PURPOSE: Check if a particular scenario type is enabled (hasn't been disabled by SET_SCENARIO_TYPE_ENABLED).
NATIVE FUNC BOOL IS_SCENARIO_TYPE_ENABLED(STRING scenarioTypeName) = "0xaec3fb024079cf27"

//INFO: 
//PARAM NOTES: scenarioTypeName is the name of the scenario type, such as "WORLD_HUMAN_LEANING".
//PURPOSE: Disable a particular scenario type.
NATIVE PROC SET_SCENARIO_TYPE_ENABLED(STRING scenarioTypeName, BOOL enabled) = "0x247f21b1803f0ec4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Reset all scenario types affected by SET_SCENARIO_TYPE_ENABLED,
// to the default state (typically enabled).
NATIVE PROC RESET_SCENARIO_TYPES_ENABLED() = "0xa9fc42dea687033d"

//INFO:
//PARAM NOTES:  PedIndex - The ped who is being tested
//PURPOSE:  Check if the ped is fully in a scenario, that is, playing the associated ambient animations and not doing intro/exit.
NATIVE FUNC BOOL IS_PED_ACTIVE_IN_SCENARIO(PED_INDEX PedIndex) = "0x67360b9474054c5e"

//PURPOSE: Returns TRUE if the ped has the USE_SCENARIO task and playing their base animation.
//NOTE: This is a slightly stronger check than IS_PED_ACTIVE_IN_SCENARIO.  The given ped will not be t-posing or in their low lod base.
NATIVE FUNC BOOL IS_PED_PLAYING_BASE_CLIP_IN_SCENARIO(PED_INDEX PedIndex) = "0x2dc1bc483b6a3316"

//INFO:
//PURPOSE: Blocks/Removes ambient idles from playing on a ped. Must be running TASK_AMBIENT_CLIPS. Must be called every frame to keep blocking/removing (flags get reset every frame to ensure this doesn't get left on accidently).
//NOTE: bBlockIdleClips: if true, blocks future idle clips from playing. bRemoveIdleClipIfPlaying: if true, will remove any current clip playing (will also block).
NATIVE PROC SET_PED_CAN_PLAY_AMBIENT_IDLES(PED_INDEX PedIndex, BOOL bBlockIdleClips = FALSE, BOOL bRemoveIdleClipIfPlaying = FALSE) = "0xe72d9eb9db4b874d"

//INFO:
//PARAM NOTES:
//PURPOSE:  Force all peds using scenarios to not exit their points next frame due to usage time or condition checks.  They will still leave in panic situations.
NATIVE PROC SUPPRESS_NORMAL_SCENARIO_EXITS_NEXT_FRAME() = "0x462559c9bfdb51d1"

//INFO:
//PARAM NOTES:
//PURPOSE: Disable peds from being attracted to scenario points next frame.  Peds will still spawn at scenario points.
NATIVE PROC SUPPRESS_SCENARIO_ATTRACTION_NEXT_FRAME() = "0xf50d4dd468864fca"

//INFO:
//PARAM NOTES:
//PURPOSE: Disable this ped from exiting a Hangout scenario next frame.
NATIVE PROC SUPPRESS_BREAKOUT_SCENARIO_EXITS_NEXT_FRAME() = "0x743ef6f4b8c462a8"

//~>                Under water commands

//INFO: 
//PARAM NOTES: Use a OBJECT_INDEX of -1 to have a DPV created
//PURPOSE: Gives ped a DPV (Diver Propulsion Vehicle) task. More info..
NATIVE PROC TASK_USE_DPV(PED_INDEX PedIndex, OBJECT_INDEX ObjectIndex) = "0x1900989eb108ed5d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Direct a ped using a DPV to drive to a coordinate
NATIVE PROC TASK_GO_TO_COORD_DPV(PED_INDEX PedIndex, VECTOR vPosition) = "0x8c4d99ed9d5fe6a7"


//INFO: Used as follows:
// 
// TASK_VEHICLE_MISSION(Ped, params...)
// ADD_VEHICLE_SUBTASK_ATTACK_PED(Ped, OtherPed) - will update the above task to include this subtask
// 
// OR
//
//  OPEN_SEQUENCE_TASK (SEQ)
//      TASK_FLUSH_ROUTE()
//      TASK_EXTEND_ROUTE(<< -17.30, -6.60, 1.19>> )
//      TASK_EXTEND_ROUTE(<<-16.69, 12.23, 1.19 >> ) 
//      TASK_EXTEND_ROUTE(<<12.18, 12.76, 1.19 >> )
//      TASK_EXTEND_ROUTE(<<13.37, -14.18, 1.19 >> )
//      TASK_DRIVE_POINT_ROUTE (NULL, veh, 1.0  )
//      ADD_VEHICLE_SUBTASK_ATTACK_PED(NULL, OtherPed)
//      
//      SET_SEQUENCE_TO_REPEAT(seq, REPEAT_FOREVER)
//  CLOSE_SEQUENCE_TASK(SEQ)
//
//
//PARAM NOTES:
//PURPOSE: Will append an attacking subtask to a previously given driving task.
//          This can be used directly with a ped or in a sequence in the following commands:
// TASK_HELI_MISSION
// TASK_VEHICLE_DRIVE_TO_COORD
// TASK_VEHICLE_MISSION
// TASK_VEHICLE_MISSION_PED_TARGET
// TASK_VEHICLE_MISSION_COORS_TARGET
//
// SEE ALSO ADD_VEHICLE_SUBTASK_ATTACK_PED
NATIVE PROC ADD_VEHICLE_SUBTASK_ATTACK_PED(PED_INDEX PedIndex, PED_INDEX OtherPed ) = "0x80e8bfe6e62212c1"

//INFO: Used as follows:
// 
// TASK_VEHICLE_MISSION(Ped, params...)
// ADD_VEHICLE_SUBTASK_ATTACK_COORD(Ped, OtherPed) - will update the above task to include this subtask
// 
// OR
//
//  OPEN_SEQUENCE_TASK (SEQ)
//      TASK_FLUSH_ROUTE()
//      TASK_EXTEND_ROUTE(<< -17.30, -6.60, 1.19>> )
//      TASK_EXTEND_ROUTE(<<-16.69, 12.23, 1.19 >> ) 
//      TASK_EXTEND_ROUTE(<<12.18, 12.76, 1.19 >> )
//      TASK_EXTEND_ROUTE(<<13.37, -14.18, 1.19 >> )
//      TASK_DRIVE_POINT_ROUTE (NULL, veh, 1.0  )
//      ADD_VEHICLE_SUBTASK_ATTACK_PED(NULL, OtherPed)
//      
//      SET_SEQUENCE_TO_REPEAT(seq, REPEAT_FOREVER)
//  CLOSE_SEQUENCE_TASK(SEQ)
//
//
//PARAM NOTES:
//PURPOSE: Will append an attacking subtask to a previously given driving task.
//          This can be used directly with a ped or in a sequence in the following commands:
// TASK_HELI_MISSION
// TASK_VEHICLE_DRIVE_TO_COORD
// TASK_VEHICLE_MISSION
// TASK_VEHICLE_MISSION_PED_TARGET
// TASK_VEHICLE_MISSION_COORS_TARGET
//
// SEE ALSO ADD_VEHICLE_SUBTASK_ATTACK_PED
NATIVE PROC ADD_VEHICLE_SUBTASK_ATTACK_COORD(PED_INDEX PedIndex, VECTOR vPosition) = "0xf2e8f4bd20869ab2"


//INFO: 
//PARAM NOTES:
//PURPOSE: The ped will shoot from a vehicle the other ped passed.
//          Using:
//              Driveby weapons
//              Vehicle mounted weapons
//              Grenades
//          Depending on what is currently selected in their inventory.
// SEE ALSO TASK_VEHICLE_SHOOT_AT_COORD
NATIVE PROC TASK_VEHICLE_SHOOT_AT_PED(PED_INDEX PedIndex, PED_INDEX OtherPed, FLOAT FireTolerance = 20.0) = "0xbba695ad5315cdd8"

//INFO: 
//PARAM NOTES:
//PURPOSE: The ped will aim from a vehicle the other ped passed.
//          Using:
//              Driveby weapons
//              Vehicle mounted weapons
//          Depending on what is currently selected in their inventory.
// SEE ALSO TASK_VEHICLE_AIM_AT_COORD
NATIVE PROC TASK_VEHICLE_AIM_AT_PED(PED_INDEX PedIndex, PED_INDEX OtherPed) = "0xc514d16960a4fa43"

//INFO: 
//PARAM NOTES:
//PURPOSE: The ped will shoot from a vehicle at the coord passed.
//          Using:
//              Driveby weapons
//              Vehicle mounted weapons
//              Grenades
//          Depending on what is currently selected in their inventory.
// SEE ALSO TASK_VEHICLE_SHOOT_AT_PED
NATIVE PROC TASK_VEHICLE_SHOOT_AT_COORD(PED_INDEX PedIndex, VECTOR vPosition, FLOAT FireTolerance = 20.0) = "0xe5d96c43ab0b0dc6"

//INFO: 
//PARAM NOTES:
//PURPOSE: The ped will aim from a vehicle at the coord passed.
//          Using:
//              Driveby weapons
//              Vehicle mounted weapons
//          Depending on what is currently selected in their inventory.
// SEE ALSO TASK_VEHICLE_AIM_AT_PED
NATIVE PROC TASK_VEHICLE_AIM_AT_COORD(PED_INDEX PedIndex, VECTOR vPosition) = "0x7d49955a299139e9"

//INFO: 
//PARAM NOTES:
//PURPOSE: The ped will aim from a vehicle using the camera direction
//          Using:
//              Driveby weapons
//              Vehicle mounted weapons
//          Depending on what is currently selected in their inventory.
// SEE ALSO TASK_VEHICLE_AIM_AT_PED, TASK_VEHICLE_AIM_AT_COORD
NATIVE PROC TASK_VEHICLE_AIM_USING_CAMERA(PED_INDEX PedIndex) = "0x6614a146419eb189"

//INFO:
//PARAM NOTES:
//PURPOSE:  Give the ped a hang glider task. This causes the ped to go to the specified object,
//          pick it up and then take off in the direction which it is facing.
//          Script must specify a valid object because hang gliders are created in script.
NATIVE PROC TASK_HANG_GLIDER(PED_INDEX PedIndex, OBJECT_INDEX ObjectIndex) = "0xbdbadc2ff688e5b2"

//INFO:
//PARAM NOTES:
//PURPOSE:  Temporary script command allows air speed to be set for hang glider task.
//          User should check that hang glider task is running on ped first using GET_SCRIPT_TASK_STATUS
NATIVE PROC SET_HANG_GLIDER_AIR_SPEED(PED_INDEX PedIndex, VECTOR vAirSpeed) = "0x23b2c655efd82c53"

//INFO: Only meant for debugging NM usage. Shouldn't be used in-game!!
//PARAM NOTES: nPedIndex: the ped to give the task to; bDoBlendFromNM: whether to blend back to animation or not.
//PURPOSE: Used for debugging the transition between bind pose in NM and pure animation.
NATIVE PROC TASK_BIND_POSE(PED_INDEX nPedIndex, BOOL bDoBlendFromNM) = "0xac5fea0754bcc7cf"


//INFO:
//PARAM NOTES: nPedIndex: the ped to give the task to; nMinTime, nMaxTime: minimum and maximum time to run the task for.
//PURPOSE: Give the ped an NM electrocution task.
NATIVE PROC ELECTROCUTE_PED(PED_INDEX nPedIndex, INT nMinTime, INT nMaxTime) = "0x9eebf0c360e75bef"

//INFO:
//PARAM NOTES: nPedIndex: the ped to give the task to; nMinTime, nMaxTime: minimum and maximum time to run the task for.
//PURPOSE: Give the ped an NM HighFall task.  This is good for falling anf rolling after hitting the ground if it's a slope
NATIVE PROC SET_HIGH_FALL_TASK(PED_INDEX nPedIndex, INT nMinTime, INT nMaxTime, HIGH_FALL_ENTRY_TYPE type = HIGHFALL_IN_AIR) = "0xdb1174c6546afc65"

//INFO:
//PARAM NOTES: nPedIndex: the ped to give the task to; 
// 	bStart - true only when starting the behavior - fales when just updating grab and hook position parameters
//	nPedIndex - the Ped
// 	nHookIndex - the hook
//	vTopOfHookPosition - desired potition of the top of the hook
//	bDoGrab - whether to grab or not while dangling
//	fGrabFrequency - grab frequency
//	fixRotation = fixes rotation
//	ranges on the rotation relative to current pose
//PURPOSE: Dangle from a meathook
NATIVE PROC DANGLE_FROM_MEATHOOK(BOOL bStart, PED_INDEX nPedIndex, ENTITY_INDEX nHookIndex, VECTOR vTopOfHookPosition, BOOL bDoGrab, FLOAT fGrabFrequency, INT nMinTime, INT nMaxTime, BOOL fixRotation, FLOAT fRotMinX = 0.0, FLOAT fRotMinY = 0.0, FLOAT fRotMinZ = 0.0, FLOAT fRotMaxX = 0.0, FLOAT fRotMaxY = 0.0, FLOAT fRotMaxZ = 0.0) = "0xd9c1a873ff69a447"

//INFO:
//PARAM NOTES: nPedIndex: the ped to give the task to; nMinTime, nMaxTime: minimum and maximum time to run the task for.
//PURPOSE: be slung over a shoulder
NATIVE PROC SLUNG_OVER_SHOULDER(PED_INDEX nPedIndexOfPedOverShoulder, PED_INDEX nPedIndexOfCarrier, INT nMinTime, INT nMaxTime) = "0xcbdd75b6dfb92714"

//INFO:
//PARAM NOTES: nPedIndex: the ped to give the task to; nMinTime, nMaxTime: minimum and maximum time to run the task for.
//PURPOSE: Give the ped an NM electrocution task.
NATIVE PROC MAKE_PED_STUMBLE(PED_INDEX nPedIndex, INT nMinTime, INT nMaxTime) = "0x6b0ebf2507baba30"


//INFO:
//PARAM NOTES:
//PURPOSE:  Task to set blocking of non-temporary events so it can be sequenced
NATIVE PROC TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(PED_INDEX PedIndex, BOOL bSet) = "0xf7b73727a8f72f54"

//INFO:
//PARAM NOTES: see commands_ped.sch for the list of motion states that can be forced
//PURPOSE:  Task to the peds motion state so it can be sequenced
NATIVE PROC TASK_FORCE_MOTION_STATE(PED_INDEX PedIndex, INT motionState, BOOL bForceRestart = FALSE) = "0x57374b880e0a67bd"


//INFO:
//PARAM NOTES:
//PURPOSE: Requests the named recording from the streaming system
NATIVE PROC REQUEST_WAYPOINT_RECORDING(STRING RecordingName) = "0x70f260358d1a42c4"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns whether the named recording has been loaded yet
NATIVE FUNC BOOL GET_IS_WAYPOINT_RECORDING_LOADED(STRING RecordingName) = "0xbd3cea9cd36e271e"

//INFO:
//PARAM NOTES:
//PURPOSE: Removes the named recording
NATIVE PROC REMOVE_WAYPOINT_RECORDING(STRING RecordingName) = "0x10f7bfe3a88cb99b"

//INFO:
//PARAM NOTES:
//PURPOSE: Retrieves the number of points in the specified recording.  The recording must be loaded.  Vaule returned by parameter.
NATIVE FUNC BOOL WAYPOINT_RECORDING_GET_NUM_POINTS(STRING RecordingName, INT & iOutNumPoints) = "0x042959494b85e155"

//INFO:
//PARAM NOTES:
//PURPOSE: Retrieves the specified waypoint's position.  The recording must be loaded.  Vaule returned by parameter.
NATIVE FUNC BOOL WAYPOINT_RECORDING_GET_COORD(STRING RecordingName, INT iWaypoint, VECTOR & vOutCoord) = "0x76263b6f2b150aff"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the speed at a given point in the waypoint recording.
//If a vehicle waypoint recording, returns speed in m/s. If for peds, returns an MBR
NATIVE FUNC FLOAT WAYPOINT_RECORDING_GET_SPEED_AT_POINT(STRING RecordingName, INT iWaypoint) = "0xaa4b93a8c0d05be3"

//INFO:
//PARAM NOTES:
//PURPOSE: Retrieves the the closest waypoint to the given position.  The recording must be loaded.  Vaule returned by parameter.
//         Waypoint playback doesn't need to be active.
NATIVE FUNC BOOL WAYPOINT_RECORDING_GET_CLOSEST_WAYPOINT(STRING RecordingName, VECTOR vPos, INT & iOutWaypoint) = "0xe49fae8c75dfe3b0"

//INFO:
//PARAM NOTES:
//PURPOSE: Instructs the ped to follow the named recording, starting at the given waypoint & optionally terminating at a specified waypoint
NATIVE PROC TASK_FOLLOW_WAYPOINT_RECORDING(PED_INDEX iPed, STRING RecordingName, INT iStartingProgress=0, EWAYPOINT_FOLLOW_FLAGS iFlags = EWAYPOINT_DEFAULT, INT iTargetProgress=-1) = "0x4218764824f31173"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns whether the given ped is running a script-given waypoint-recording task.
//     This returns true regardless of whether the recording is paused, or an event has taken precedence.
//     You should always use GET_SCRIPT_TASK_STATUS if you need to differentiate between active/dormant tasks.
NATIVE FUNC BOOL IS_WAYPOINT_PLAYBACK_GOING_ON_FOR_PED(PED_INDEX iPed) = "0xb4ae2a423a4176ce"

//INFO:
//PARAM NOTES:
//PURPOSE: Retrieves the current progress of the given ped, who must be following the route at the time
NATIVE FUNC INT GET_PED_WAYPOINT_PROGRESS(PED_INDEX iPed) = "0x0b331f8dc5c61933"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the current progress of the given ped, who must be following the route at the time
NATIVE PROC SET_PED_WAYPOINT_PROGRESS(PED_INDEX iPed, INT iProgress) = "0xadc4c24903027450"

//INFO:
//PARAM NOTES:
//PURPOSE: Retrieves the current distance along the route in meters for the given ped, who must be following the route at the time
NATIVE FUNC FLOAT GET_PED_WAYPOINT_DISTANCE(PED_INDEX iPed) = "0xb80b2f3bfb68df1a"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets a worldpsace offset on the ped's current TASK_FOLLOW_WAYPOINT_RECORDING, which is applied to all the route points for this ped only
NATIVE FUNC BOOL SET_PED_WAYPOINT_ROUTE_OFFSET(PED_INDEX iPed, VECTOR vOffset) = "0x455e0249f399ef4c"

//INFO:
//PARAM NOTES:
//PURPOSE: Retrieves the distance along the route in meters of the specified waypoint
NATIVE FUNC FLOAT GET_WAYPOINT_DISTANCE_ALONG_ROUTE(STRING RecordingName, INT iWaypoint) = "0xd2fe51a38e9a1946"

//INFO:
//PARAM NOTES:
//PURPOSE: Retrieves the pause status
NATIVE FUNC BOOL WAYPOINT_PLAYBACK_GET_IS_PAUSED(PED_INDEX iPed) = "0x656f70678f75d966"

//INFO:
//PARAM NOTES:
//PURPOSE: Pauses the playback of a waypoint-recording on the specified ped, and optionally instructs them to face the player
//		   bStopBeforeOrientating = causes the ped to halt before turning, so they do not leave their route
NATIVE PROC WAYPOINT_PLAYBACK_PAUSE(PED_INDEX iPed, BOOL bFacePlayer, BOOL bStopBeforeOrientating=FALSE) = "0x499c4b0d70f4097c"

//INFO:
//PARAM NOTES:
//PURPOSE: Resumes the playback of a waypoint-recording on the specified ped.
//	bAchieveHeadingFirst : Optionally allows the ped to turn towards their next waypoint before starting to move
//								(can help avoid navigation problems in tight spaces)
//	iProgressToContinueFrom : Optionally allows you to specify which route point to continue from
//								(use -1 to continue from current position)
//	iTimeBeforeResumingMs : Optionally specifies a delay in millisecs, before the ped resumes their route following	

NATIVE PROC WAYPOINT_PLAYBACK_RESUME(PED_INDEX iPed, BOOL bAchieveHeadingFirst=FALSE, INT iProgressToContinueFrom=-1, INT iTimeBeforeResumingMs=0) = "0x4ffeb98e621afb27"

//INFO:
//PARAM NOTES: fMoveBlendRatio (0.0 = still, 1.0 = walk, 2.0 = run, 3.0 = sprint)
//PURPOSE: Overrides the speed at which the ped moves, ignoring the speeds recorded in the route
// bDontAllowSlowingForCorners - allows the ped to slow for corners; without this peds may have trouble keeping to their routes.
NATIVE PROC WAYPOINT_PLAYBACK_OVERRIDE_SPEED(PED_INDEX iPed, FLOAT fMoveBlendRatio, BOOL bDontAllowSlowingForCorners=FALSE) = "0x369b082b04a4f619"

//INFO:
//PARAM NOTES:
//PURPOSE: Resets the playback to the default speeds, as recorded in the route
NATIVE PROC WAYPOINT_PLAYBACK_USE_DEFAULT_SPEED(PED_INDEX iPed) = "0x5039c5050b42f1e0"

//INFO:
//PARAM NOTES:
//PURPOSE: Starts the ped aiming at the specified ped or coordinates whilst already following a waypoint-recording
//     bRunAndGun - specifies whether to use "run & gun" to shoot over shoulder whilst running (ie. ped doesn't strafe)
NATIVE PROC WAYPOINT_PLAYBACK_START_AIMING_AT_PED(PED_INDEX iPed, PED_INDEX iTargetPed, BOOL bRunAndGun) = "0x9b4dd143cd0c78fe"
NATIVE PROC WAYPOINT_PLAYBACK_START_AIMING_AT_ENTITY(PED_INDEX iPed, ENTITY_INDEX iTargetEntity, BOOL bRunAndGun) = "0x47e2d6d68a34062a"
NATIVE PROC WAYPOINT_PLAYBACK_START_AIMING_AT_COORD(PED_INDEX iPed, VECTOR vTargetCoords, BOOL bRunAndGun) = "0xa142fd669ff80016"

//INFO:
//PARAM NOTES:
//PURPOSE: Starts the ped shooting at the specified ped or coordinates whilst already following a waypoint-recording
//     bRunAndGun - specifies whether to use "run & gun" to shoot over shoulder whilst running (ie. ped doesn't strafe)
NATIVE PROC WAYPOINT_PLAYBACK_START_SHOOTING_AT_PED(PED_INDEX iPed, PED_INDEX iTargetPed, BOOL bRunAndGun, FIRING_TYPE FiringPatternHash = 0 ) = "0xa9b13da1d075a160"
NATIVE PROC WAYPOINT_PLAYBACK_START_SHOOTING_AT_ENTITY(PED_INDEX iPed, ENTITY_INDEX iTargetEntity, BOOL bRunAndGun, FIRING_TYPE FiringPatternHash = 0) = "0x4f6e75c1ca97a1ef"
NATIVE PROC WAYPOINT_PLAYBACK_START_SHOOTING_AT_COORD(PED_INDEX iPed, VECTOR vTargetCoords, BOOL bRunAndGun, FIRING_TYPE FiringPatternHash = 0) = "0x4f826adf9bdb6bd8"

//INFO:
//PARAM NOTES:
//PURPOSE: Turns off aiming or shooting
NATIVE PROC WAYPOINT_PLAYBACK_STOP_AIMING_OR_SHOOTING(PED_INDEX iPed) = "0x282cae6fb0e3b2fc"

//INFO:
//PARAM NOTES:
//PURPOSE: Makes the specified recording act as an assisted-movement route for the player
//         The recording can contine to be used for waypoint-following playback as well.
//         Be absolutely sure to turn this back off when no longer required, as it could be costly.
NATIVE PROC USE_WAYPOINT_RECORDING_AS_ASSISTED_MOVEMENT_ROUTE(STRING RecordingName, BOOL bUseAsAssistedMovementRoute, FLOAT fPathWidth=1.0, FLOAT fTension=0.5) = "0xbb6589e0d27bd54e"

//INFO:
//PARAM NOTES:
//PURPOSE: Requests the specified assisted-movement route to be active

NATIVE PROC ASSISTED_MOVEMENT_REQUEST_ROUTE(STRING RouteName) = "0xb5549ea4fcf75870"

//INFO:
//PARAM NOTES:
//PURPOSE: Requests the specified assisted-movement route to be inactive

NATIVE PROC ASSISTED_MOVEMENT_REMOVE_ROUTE(STRING RouteName) = "0xed4af6b9266b55c9"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns whether an assisted movement route is loaded

NATIVE FUNC BOOL ASSISTED_MOVEMENT_IS_ROUTE_LOADED(STRING RouteName) = "0x632b7d3b9b85016a"

//INFO:
//PARAM NOTES:
//PURPOSE: 	Sets flags (EASSISTED_ROUTE_FLAGS) on a named assisted movement route (which must be already loaded)

NATIVE PROC ASSISTED_MOVEMENT_SET_ROUTE_PROPERTIES(STRING RouteName, EASSISTED_ROUTE_FLAGS iFlags) = "0x50569e4320bc8e92"

//INFO:
//PARAM NOTES:
//PURPOSE: 	Gets user flags (EASSISTED_ROUTE_FLAGS) on a named assisted movement route (which must be already loaded)

NATIVE FUNC INT ASSISTED_MOVEMENT_GET_ROUTE_PROPERTIES(STRING RouteName) = "0xec6dfa1a86cf270a"

//INFO:
//PARAM NOTES:	fDistance - the streaming distance (DEFAULT VALUE IS 50.0)
//PURPOSE: 	Sets the distance per-frame at which assisted-movement routes are streamed in around the player

NATIVE PROC ASSISTED_MOVEMENT_OVERRIDE_LOAD_DISTANCE_THIS_FRAME(FLOAT fDistance) = "0xd7e4e11cc0659bb6"

//INFO
//PARAM NOTES: A max speed of -1.0 means no speed limit.
//PURPOSE: Tells the specified vehicle to follow the specified waypoint route
NATIVE PROC TASK_VEHICLE_FOLLOW_WAYPOINT_RECORDING(PED_INDEX iPed, VEHICLE_INDEX VehicleIndex, STRING RecordingName, DRIVINGMODE Mode, INT iStartingProgress=0, EWAYPOINT_FOLLOW_FLAGS iFlags = EWAYPOINT_DEFAULT, INT iTargetProgress=-1, FLOAT MaxSpeed = -1.0, BOOL DriveInLoop = FALSE, FLOAT fTargetArriveDistance = 2.0) = "0xa24707688ba83cea"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns whether the given vehicle is running a script-given waypoint-recording task.
//     This returns true regardless of whether the recording is paused, or an event has taken precedence.
//     You should always use GET_SCRIPT_TASK_STATUS if you need to differentiate between active/dormant tasks.
NATIVE FUNC BOOL IS_WAYPOINT_PLAYBACK_GOING_ON_FOR_VEHICLE(VEHICLE_INDEX iVeh) = "0x22ff01f89d3006c0"

//INFO:
//PARAM NOTES:
//PURPOSE: Retrieves the current progress of the given vehicle, who must be following the route at the time
NATIVE FUNC INT GET_VEHICLE_WAYPOINT_PROGRESS(VEHICLE_INDEX iVeh) = "0x46ea6598acefacc1"

//INFO:
//PARAM NOTES:
//PURPOSE: Retrieves the current target point of the given vehicle, who must be following the route at the time
NATIVE FUNC INT GET_VEHICLE_WAYPOINT_TARGET_POINT(VEHICLE_INDEX iVeh) = "0x0e9d3608e0ae9ee3"

//INFO:
//PARAM NOTES:
//PURPOSE: Pauses the playback of a waypoint-recording on the specified vehicle
NATIVE PROC VEHICLE_WAYPOINT_PLAYBACK_PAUSE(VEHICLE_INDEX iVeh) = "0xe3948de25c763434"

//INFO:
//PARAM NOTES:
//PURPOSE: Retrieves the pause status
NATIVE FUNC BOOL VEHICLE_WAYPOINT_PLAYBACK_GET_IS_PAUSED(VEHICLE_INDEX iVeh) = "0xa84a1cf14183e169"

//INFO:
//PARAM NOTES:
//PURPOSE: Resumes the playback of a waypoint-recording on the specified vehicle.
NATIVE PROC VEHICLE_WAYPOINT_PLAYBACK_RESUME(VEHICLE_INDEX iVeh) = "0x211bb80656beac0f"

//INFO:
//PARAM NOTES:
//PURPOSE: Resets the playback to the default speeds, as recorded in the route or calculated by AI
NATIVE PROC VEHICLE_WAYPOINT_PLAYBACK_USE_DEFAULT_SPEED(VEHICLE_INDEX iVeh) = "0x502f9fce448f5724"

//INFO:
//PARAM NOTES: fSpeed is speed in m/s
//PURPOSE: Overrides the speed at which the vehicle moves, ignoring the speeds recorded in the route
NATIVE PROC VEHICLE_WAYPOINT_PLAYBACK_OVERRIDE_SPEED(VEHICLE_INDEX iVeh, FLOAT fSpeed) = "0xf248aeaab65d17cd"

//INFO
//PARAM NOTES: Same as the params in TASK_VEHICLE_MISSION
//PURPOSE; Tells the specified vehicle to navigate somewhere using the navmesh, as opposed to the road network
NATIVE PROC TASK_VEHICLE_GOTO_NAVMESH(PED_INDEX iPed, VEHICLE_INDEX VehicleIndex, VECTOR VecCoors, FLOAT CruiseSpeed, DRIVINGMODE Mode, FLOAT TargetReachedDist) = "0xdf44785f7bc09dd2"

// MOVE NETWORK INTERFACE ---------------------------------

//INFO:
//PARAM NOTES: "animDictionary"  In network games you may need to inform the move task of the required dictionary so it can be 
//			 synced and remote players can manage clones and know when the dictionary is ready e.g. arm wrestling
//
//PURPOSE:  Task to start a move network of the type passed
//			When bAllowOverrideCloneUpdate is used in MP the remotely cloned ped will not update in sync with commands sent locally
//			and it is expected that the remote machine will override the update of the clones task signals.
NATIVE PROC TASK_MOVE_NETWORK_BY_NAME(PED_INDEX PedIndex, STRING network, FLOAT blendDuration = 0.0, BOOL bAllowOverrideCloneUpdate=FALSE, STRING animDictionary = NULL, MOVE_NETWORK_FLAGS flags = MOVE_DEFAULT ) = "0x84a70ae1a2393914"

//INFO:
//PARAM NOTES: "animDictionary"  In network games you may need to inform the move task of the required dictionary so it can be 
//			 synced and remote players can manage clones and know when the dictionary is ready e.g. arm wrestling
//
//PURPOSE:  Task to start a move network of the type passed
//			When bAllowOverrideCloneUpdate is used in MP the remotely cloned ped will not update in sync with commands sent locally
//			and it is expected that the remote machine will override the update of the clones task signals.
//
//			This version allows the network to be setup with initial parameters (clipsets, floats and bools).
NATIVE PROC TASK_MOVE_NETWORK_BY_NAME_WITH_INIT_PARAMS(PED_INDEX PedIndex, STRING network,  MOVE_INITIAL_PARAMETERS& initParams, FLOAT blendDuration = 0.0, BOOL bAllowOverrideCloneUpdate=FALSE, STRING animDictionary = NULL, MOVE_NETWORK_FLAGS flags = MOVE_DEFAULT ) = "0x4601817fd87b48e3"

//INFO:
//PARAM NOTES: "animDictionary"  In network games you may need to inform the move task of the required dictionary so it can be 
//			 synced and remote players can manage clones and know when the dictionary is ready e.g. arm wrestling
//
//PURPOSE:  Task to start a move network of the type passed with custom start pos and orientation
//			When bAllowOverrideCloneUpdate is used in MP the remotely cloned ped will not update in sync with commands sent locally
//			and it is expected that the remote machine will override the update of the clones task signals.
NATIVE PROC TASK_MOVE_NETWORK_ADVANCED_BY_NAME(PED_INDEX PedIndex, STRING network, VECTOR vStartPos, VECTOR vStartRot, EULER_ROT_ORDER RotOrder = EULER_YXZ, FLOAT blendDuration = 0.0, BOOL bAllowOverrideCloneUpdate=FALSE, STRING animDictionary = NULL, MOVE_NETWORK_FLAGS flags = MOVE_DEFAULT ) = "0xad3d17c7e426d09d"

//INFO:
//PARAM NOTES: "animDictionary"  In network games you may need to inform the move task of the required dictionary so it can be 
//			 synced and remote players can manage clones and know when the dictionary is ready e.g. arm wrestling
//
//PURPOSE:  Task to start a move network of the type passed with custom start pos and orientation
//			When bAllowOverrideCloneUpdate is used in MP the remotely cloned ped will not update in sync with commands sent locally
//			and it is expected that the remote machine will override the update of the clones task signals.
//
//			This version allows the network to be setup with initial parameters (clipsets, floats and bools).
NATIVE PROC TASK_MOVE_NETWORK_ADVANCED_BY_NAME_WITH_INIT_PARAMS(PED_INDEX PedIndex, STRING network, MOVE_INITIAL_PARAMETERS& initParams, VECTOR vStartPos, VECTOR vStartRot, EULER_ROT_ORDER RotOrder = EULER_YXZ, FLOAT blendDuration = 0.0, BOOL bAllowOverrideCloneUpdate=FALSE, STRING animDictionary = NULL, MOVE_NETWORK_FLAGS flags = MOVE_DEFAULT ) = "0xca9cbdbc10f9d281"


//INFO:
//PARAM NOTES:
//PURPOSE:  Returns true if a move network is active
NATIVE FUNC BOOL IS_TASK_MOVE_NETWORK_ACTIVE(PED_INDEX PedIndex) = "0xfcd53f51d587f4c6"

//INFO:
//PARAM NOTES:
//PURPOSE:  Returns true if a move network is ready for a state transition
NATIVE FUNC BOOL IS_TASK_MOVE_NETWORK_READY_FOR_TRANSITION(PED_INDEX PedIndex) = "0x0422aefd9002867b"

//INFO:
//PARAM NOTES:
//PURPOSE:  Requests a transition to a new MoVE states
NATIVE FUNC BOOL REQUEST_TASK_MOVE_NETWORK_STATE_TRANSITION(PED_INDEX PedIndex, STRING StateName) = "0xdcd29be535921736"

//INFO:
//PARAM NOTES:
//PURPOSE:  To be used for particular move networks after REQUEST_TASK_MOVE_NETWORK_STATE_TRANSITION when the request will expect to cause the Move Network to
// automatically eventually progress to the queued MoVE state. Setting this syncs to remote machine and alerts the remote clone to scan for this state
NATIVE FUNC BOOL SET_EXPECTED_CLONE_NEXT_TASK_MOVE_NETWORK_STATE(PED_INDEX PedIndex, STRING StateName) = "0x2029bef342249fb1"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the current state
NATIVE FUNC STRING GET_TASK_MOVE_NETWORK_STATE(PED_INDEX PedIndex) = "0x111890991356db66"

//INFO: The anim set hash is a hash of the name of the actual anim set to use
//		The animSetVariableHash is the has of the name of the variable anim set you are setting, and should start with a $ symbol
//PARAM NOTES:	The anim set hash is a hash of the name of the actual anim set to use
//
//				e.g.	SET_TASK_MOVE_NETWORK_ANIM_SET (playerPed, playerAnimSet)
//						SET_TASK_MOVE_NETWORK_ANIM_SET (otherPed, otherAnimSet)
//				will allow you to play the same move network with two different sets of anims on two different peds.
//
//				The animSetVariableHash is the hash of the name of the variable anim set you are setting, and should start with a $ symbol
//				e.g. a basic minigame network might have two seperate anim sets to fill in called $initial and $streamed
//				To set them both use:
//				SET_TASK_MOVE_NETWORK_ANIM_SET ( playerPed, playerInitialSet, $initial)
//				SET_TASK_MOVE_NETWORK_ANIM_SET ( playerPed, playerStreamedAnimSet, $streamed)
//			
//				The author of the MoVE network should be able to tell you how many anim set variables there are to fill in.
//PURPOSE: Sets an anim set for this move network to use
NATIVE PROC SET_TASK_MOVE_NETWORK_ANIM_SET( PED_INDEX PedIndex, INT animSetHash, INT animSetVariableHash = 0) = "0x2d9f06756211492a"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the MoVE signal to the passed value
NATIVE PROC SET_TASK_MOVE_NETWORK_SIGNAL_FLOAT(PED_INDEX PedIndex, STRING signalName, FLOAT fSignal ) = "0x8e11f085404a3100"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the MoVE signal to the passed value without sending it to clones
NATIVE PROC SET_TASK_MOVE_NETWORK_SIGNAL_LOCAL_FLOAT(PED_INDEX PedIndex, STRING signalName, FLOAT fSignal ) = "0x357c016ef8883bad"

//INFO:
//PARAM NOTES:
//PURPOSE:  Sets the lerp rate to the passed value - 
//			Lerp rate controls rate at which the corresponding MoVE float signal will lerp over frame updates on the clone from the current value to the target value. 
//			It is assumed that the corresponding MoVE float signal has already been created using SET_TASK_MOVE_NETWORK_SIGNAL_FLOAT command.
//			Currently the lerp rate defaults to a value of 0.5f. The lerp value has to be above 0.0f and below 1.0f. 
//			If a lerp rate of 1.0f is applied then no lerping is used and the exact float value will be synced and applied immediately on the clone.
NATIVE PROC SET_TASK_MOVE_NETWORK_SIGNAL_FLOAT_LERP_RATE(PED_INDEX PedIndex, STRING signalName, FLOAT fLerpRate ) = "0x6e3f82dd454ea5b1"

//INFO:
//PARAM NOTES: 
//PURPOSE: Sets the MoVE signal to the passed value
NATIVE PROC SET_TASK_MOVE_NETWORK_SIGNAL_BOOL(PED_INDEX PedIndex, STRING signalName, BOOL bSignal ) = "0xdde2a56a49baf5b0"

//INFO:
//PARAM NOTES: 
//PURPOSE: Sets the MoVE signal to the passed value.  This value is set for the local ped only and not synced across the network.
NATIVE PROC SET_TASK_MOVE_NETWORK_SIGNAL_LOCAL_BOOL(PED_INDEX PedIndex, STRING signalName, BOOL bSignal ) = "0xbe46dff5c216a2b0"

//INFO:
//PARAM NOTES: If the network is not currently sending an output parameter of that name, the command will return 0.0
//PURPOSE: Gets the value of a float type output parameter from the peds scripted MoVE network. More Info...
NATIVE FUNC FLOAT GET_TASK_MOVE_NETWORK_SIGNAL_FLOAT( PED_INDEX PedIndex, STRING signalName ) = "0x103bce39f925945e"

//INFO:
//PARAM NOTES: If the network is not currently sending an output parameter of that name, the command will return FALSE
//PURPOSE: Gets the value of a boolean type output parameter from the peds scripted MoVE network. More Info...
NATIVE FUNC BOOL GET_TASK_MOVE_NETWORK_SIGNAL_BOOL( PED_INDEX PedIndex, STRING signalName ) = "0x501632a36a6512aa"

//INFO: Allows script to recieve named events from a running MoVE network
//PARAM NOTES:
//PURPOSE: Returns true if an event with the given name has just fired on the ped's script owned MoVE network
//         Can be used to trigger creation of objects in script, etc
NATIVE FUNC BOOL GET_TASK_MOVE_NETWORK_EVENT(PED_INDEX PedIndex, STRING eventName) = "0xce3f029a4833b5e1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enables collision on network clones when local player ped is fixed.
NATIVE FUNC BOOL SET_TASK_MOVE_NETWORK_ENABLE_COLLISION_ON_NETWORK_CLONE_WHEN_FIXED(PED_INDEX PedIndex, BOOL bEnableCollisionOnNetworkCloneWhenFixed) = "0x4a5f1661be58e97e"

// END MOVE NETWORK INTERFACE -----------------------------

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if the passed in move blend ratio is in the appropriate range
NATIVE FUNC BOOL IS_MOVE_BLEND_RATIO_STILL(FLOAT MoveBlendRatio) = "0x98daeb6e7093895e"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if the passed in move blend ratio is in the appropriate range
NATIVE FUNC BOOL IS_MOVE_BLEND_RATIO_WALKING(FLOAT MoveBlendRatio) = "0x6b46f0285c770b5b"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if the passed in move blend ratio is in the appropriate range
NATIVE FUNC BOOL IS_MOVE_BLEND_RATIO_RUNNING(FLOAT MoveBlendRatio) = "0x833a52f892a42353"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if the passed in move blend ratio is in the appropriate range
NATIVE FUNC BOOL IS_MOVE_BLEND_RATIO_SPRINTING(FLOAT MoveBlendRatio) = "0x3861da7f20602340"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if the ped is still
NATIVE FUNC BOOL IS_PED_STILL(PED_INDEX PedIndex) = "0x443c6afb940b3c83"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if the ped is walking
NATIVE FUNC BOOL IS_PED_WALKING(PED_INDEX PedIndex) = "0x834c649d79d5128d"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if the ped is running
NATIVE FUNC BOOL IS_PED_RUNNING(PED_INDEX PedIndex) = "0x81bbcaf9fe3b469d"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if the ped is sprinting
NATIVE FUNC BOOL IS_PED_SPRINTING(PED_INDEX PedIndex) = "0xe02d8bdf4b18d48d"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if the ped is sprinting
NATIVE FUNC BOOL IS_PED_STRAFING(PED_INDEX PedIndex) = "0xfe3baaf47e48d31f"

//INFO:
//PARAM NOTES:  sceneID - the scene index to start on
//				blendInDelta - the rate at which the task will blend in
//				The blend in duration is 1.0 / blendInDelta e.g. 1.0 / NORMAL_BLEND_IN -> 1.0 / 8.0 = 0.125 seconds 
//				blendOutDelta - the rate at which the task will blend out 
//				The blend out duration is -1.0 / blendOutDelta e.g. -1.0 / NORMAL_BLEND_OUT -> -1.0 / -8.0 = 0.125 seconds
//              should create / remove the task without a frame's delay
//				flags: A set of flags allowing for different playback options (SYNCED_SCENE_PLAYBACK_FLAGS for a description)
//				ragdollFlags: Determines which ragdoll reactions to disable while the scene is running.
//				moverBlendIn: Use to interpolate the peds position into the synchronized scene (helps to remove pops, and to allow blending into scenes from a walk, etc)
//PURPOSE:  Starts a synchronized scene on the specified ped
NATIVE PROC TASK_SYNCHRONIZED_SCENE(PED_INDEX PedIndex, INT sceneID, STRING animDictionary, STRING anim, FLOAT blendInDelta, FLOAT blendOutDelta, SYNCED_SCENE_PLAYBACK_FLAGS flags = SYNCED_SCENE_NONE, RAGDOLL_BLOCKING_FLAGS ragdollFlags = RBF_NONE, FLOAT moverBlendInDelta = INSTANT_BLEND_IN, IK_CONTROL_FLAGS ikFlags = AIK_NONE) = "0x950b26f4c891073f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the desired ped to point (anims dependant) at the desired entity. Turn rate is default to PI * 0.5f, increasing will turn faster. 
NATIVE PROC TASK_SWEEP_AIM_ENTITY(PED_INDEX PedIndex, STRING pAnimDictName, STRING pLowAnimName, STRING pMedAnimName, STRING pHiAnimName, INT runTime, ENTITY_INDEX TargetEntityIndex, FLOAT turnRate = 1.57, FLOAT BlendInDuration = SLOW_BLEND_DURATION ) = "0x26d2934cf2d5b32c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Changes the entity currently being tracked to the new passed entity
NATIVE PROC UPDATE_TASK_SWEEP_AIM_ENTITY(PED_INDEX PedIndex, ENTITY_INDEX TargetEntityIndex ) = "0x878b7bb84cc31442"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the desired ped to point (anims dependant) at the desired position.  Turn rate is default to PI * 0.5f, increasing will turn faster. 
NATIVE PROC TASK_SWEEP_AIM_POSITION(PED_INDEX PedIndex, STRING pAnimDictName, STRING pLowAnimName, STRING pMedAnimName, STRING pHiAnimName, INT runTime, VECTOR scrVecCoors, FLOAT turnRate = 1.57, FLOAT BlendInDuration = SLOW_BLEND_DURATION) = "0x07c9c36e1a3234e9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Changes the position currently being tracked to the new passed position
NATIVE PROC UPDATE_TASK_SWEEP_AIM_POSITION(PED_INDEX PedIndex, VECTOR scrVecCoors ) = "0xc82e4267a5f18820"

//INFO: 
//PARAM NOTES:	ArresterPedIndex - The ped who is doing the arresting
//				ArresteePedIndex - The ped being arrested
//PURPOSE: Set one ped (ArresterPedIndex) to arrest another ped (ArresteePedIndex)
NATIVE PROC TASK_ARREST_PED(PED_INDEX ArresterPedIndex, PED_INDEX ArresteePedIndex ) = "0x463d4f9c4826a59b"

//INFO: 
//PARAM NOTES:	PedIndex - The ped who is being tested
//PURPOSE: Determines whether the specified ped is running the arrest task
NATIVE FUNC BOOL IS_PED_RUNNING_ARREST_TASK(PED_INDEX PedIndex) = "0x64152dd440e37f50"

//INFO: 
//PARAM NOTES:	ArresterPedIndex - The ped who is doing the arresting
//				ArresteePedIndex - The ped being arrested
//				ArrestType - Outputs the type of arrest to perform
//PURPOSE: Determines which arrest type is appropriate for the current positions of the peds
NATIVE FUNC BOOL IS_ARREST_TYPE_VALID(PED_INDEX ArresterPedIndex, PED_INDEX ArresteePedIndex, ARRESTTYPE at ) = "0x1c805a9f43140ae6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Determines whether the specified ped is currently being arrested
NATIVE FUNC BOOL IS_PED_BEING_ARRESTED(PED_INDEX PedIndex) = "0x1c7f03843c4541ad"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the ped currently arresting the given ped
NATIVE FUNC PED_INDEX GET_PED_ARRESTER(PED_INDEX PedIndex) = "0x1d081ef24f8c6203"

//INFO: 
//PARAM NOTES:
//PURPOSE: Determines whether the specified ped is currently handcuffed
NATIVE FUNC BOOL IS_PED_CUFFED(PED_INDEX PedIndex) = "0xea266e5f12328e62"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the custodian of the current ped
NATIVE FUNC PED_INDEX GET_PED_CUSTODIAN(PED_INDEX PedIndex) = "0x670b52c53b47a811"

//INFO: 
//PARAM NOTES:
//PURPOSE: Determines whether the specified ped is currently being uncuffed
NATIVE FUNC BOOL IS_PED_BEING_UNCUFFED(PED_INDEX PedIndex) = "0x522ef0aaa44cd03a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the ped currently uncuffing the given ped
NATIVE FUNC PED_INDEX GET_PED_UNCUFFER(PED_INDEX PedIndex) = "0x79a3054bf21c9039"

//INFO: 
//PARAM NOTES:
//PURPOSE: Determines whether the specified ped is currently arresting another ped
NATIVE FUNC BOOL IS_PED_ARRESTING(PED_INDEX PedIndex) = "0x2a706f5c5d386b6e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the ped the given ped is arresting
NATIVE FUNC PED_INDEX GET_PED_ARRESTING_TARGET(PED_INDEX PedIndex) = "0x9def9d10068f6f46"

//INFO: 
//PARAM NOTES:
//PURPOSE: Determines whether the specified ped is currently taking custody of another ped
NATIVE FUNC BOOL IS_PED_TAKING_CUSTODY(PED_INDEX PedIndex) = "0xb178acc0bca5b82c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the ped the given ped is taking custody of
NATIVE FUNC PED_INDEX GET_PED_TAKING_CUSTODY_TARGET(PED_INDEX PedIndex) = "0x2f6461d574428769"

//INFO: 
//PARAM NOTES:
//PURPOSE: Determines whether the specified ped is currently being taken into custody
NATIVE FUNC BOOL IS_PED_BEING_TAKEN_INTO_CUSTODY(PED_INDEX PedIndex) = "0xcaff880c04b723c0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Determines whether the specified ped is currently uncuffing another ped
NATIVE FUNC BOOL IS_PED_UNCUFFING(PED_INDEX PedIndex) = "0x1590a589bdbbf96c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the ped the given ped is uncuffing
NATIVE FUNC PED_INDEX GET_PED_UNCUFFING_TARGET(PED_INDEX PedIndex) = "0x08c5c742c9b17f90"

//INFO:
//PARAM NOTES: PedIndex - the ped to put in handcuffs
//PURPOSE: Puts the given ped in handcuffs and optionally puts them into custody
NATIVE PROC CUFF_PED(PED_INDEX PedIndex) = "0x7b9873a2f170f8b0"

//INFO:
//PARAM NOTES:
//PURPOSE: Forcibly uncuffs the given ped
NATIVE PROC UNCUFF_PED(PED_INDEX PedIndex) = "0x9a89b72b9931965c"

//INFO:
//PARAM NOTES:
//PURPOSE: Forcibly removes the given ped from custody.
NATIVE PROC REMOVE_PED_FROM_CUSTODY(PED_INDEX PedIndex) = "0x512b985df2d0e125"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the phase of the arrest animation (either sync scene or fallback)
NATIVE FUNC FLOAT GET_PED_ARREST_PHASE(PED_INDEX PedIndex) = "0x44559d9a1dd62526"

//INFO:
//PARAM NOTES: PedIndex - the ped to put try and take custody
//             CustodianPedIndex - the ped that will be in custody
//PURPOSE: Puts the given ped in handcuffs and optionally puts them into custody
NATIVE PROC TASK_TAKE_CUSTODY(PED_INDEX CustodianPedIndex, PED_INDEX PedIndex) = "0x53baad9817f5de01"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the ped the given ped is uncuffing
NATIVE FUNC PED_INDEX GET_PED_POTENTIAL_ARREST_TARGET(PED_INDEX PedIndex) = "0x1214edf270c95469"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the ped the given ped is uncuffing
NATIVE FUNC PED_INDEX GET_PED_POTENTIAL_UNCUFF_TARGET(PED_INDEX PedIndex) = "0x346aeaa1e63abaeb"

//INFO: Set override distance for in custody task
//PARAM NOTES: 
//PURPOSE:
NATIVE PROC SET_PED_CUSTODY_FOLLOW_DISTANCE( PED_INDEX PedIndex, FLOAT FollowDistance ) = "0x006f134efa946bd1"

//INFO: Set override distance for in custody task
//PARAM NOTES: 
//PURPOSE:
NATIVE PROC WARP_INTO_LEADERS_VEHICLE( PED_INDEX PedIndex ) = "0x196931342f1803a2"

//INFO: Give agitated action task to the target ped with confront subtask
//PARAM NOTES: 
//PURPOSE:
NATIVE PROC TASK_AGITATED_ACTION_CONFRONT_RESPONSE( PED_INDEX TargetPedIndex, PED_INDEX AgitatorPedIndex) = "0x3e7d91f4eece76b8"
