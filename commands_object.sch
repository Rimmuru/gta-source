USING "model_enums.sch"
USING "types.sch"
USING "generic.sch"
USING "ped_bonetags.sch"
USING "weapon_enums.sch"
USING "pickup_enums.sch"
USING "eulers.sch"

					
ENUM RAY_FIRE_MAP_OBJECT_STATE
	RFMO_STATE_INVALID			=	-1,
	RFMO_STATE_INIT				=	0,
	RFMO_STATE_SYNC_STARTING	=	1,
	RFMO_STATE_STARTING			=	2,
	RFMO_STATE_START			=	3,
	RFMO_STATE_PRIMING			=	4,
	RFMO_STATE_PRIMED			=	5,
	RFMO_STATE_START_ANIM		=	6,
	RFMO_STATE_ANIMATING		=	7,
	RFMO_STATE_SYNC_ENDING		=	8,
	RFMO_STATE_ENDING			=	9,
	RFMO_STATE_END				=	10,
	RFMO_STATE_RESET			=	11,
	RFMO_STATE_PAUSE			=	12,
	RFMO_STATE_RESUME			=	13,
	RFMO_STATE_PRIMING_PRELUDE	=	14,
	RFMO_STATE_ABANDON			=	15
ENDENUM

ENUM PLACEMENT_FLAG
	PLACEMENT_FLAG_MAP = 0,					// only used in MP. This is used for pickups that are created locally on each machine and only networked when collected.
	PLACEMENT_FLAG_FIXED = 1,				// sets the pickup as fixed so it cannot move
	PLACEMENT_FLAG_REGENERATES = 2,			// sets the pickup as regenerating
	PLACEMENT_FLAG_SNAP_TO_GROUND = 3,		// places the pickup on the ground 
	PLACEMENT_FLAG_ORIENT_TO_GROUND = 4,	// orientates the pickup correctly on the ground
	PLACEMENT_FLAG_LOCAL_ONLY = 5,			// creates the pickup non-networked
	PLACEMENT_FLAG_BLIPPED_SIMPLE = 6,		// gives the pickup a simple blip
	PLACEMENT_FLAG_BLIPPED_COMPLEX = 7,		// gives the pickup a complex blip
	PLACEMENT_FLAG_UPRIGHT = 8,				// Some pickups need to be orientated differently to lie on the ground properly. Use this flag if your pickup is not lying correctly.
	PLACEMENT_FLAG_ROTATE = 9,				// Pickup will rotate 
	PLACEMENT_FLAG_FACEPLAYER = 10,			// Pickup will always face the player
	PLACEMENT_FLAG_HIDE_IN_PHOTOS = 11,		// Pickup will be hidden when the player is using the phone camera
	PLACEMENT_FLAG_PLAYER_GIFT = 12,		// The pickup is being dropped as a gift to another player
	PLACEMENT_FLAG_ON_OBJECT = 13,			// The pickup is lying on an object and probes for that when snapping or orientating to ground
	PLACEMENT_FLAG_GLOW_IN_TEAM = 14,		// Set pickups to glow even if pickup can't be picked up because of team checks
	PLACEMENT_CREATION_FLAG_AUTO_EQUIP = 15,// if set on a weapon pickup, it will auto equip the picked up weapon. It will ignore autoswap logic
	PLACEMENT_CREATION_FLAG_COLLECTABLE_IN_VEHICLE = 16, // if set the pickup can be collected by a ped in a vehicle
	PLACEMENT_CREATION_FLAG_DISABLE_WEAPON_HD_MODEL = 17,// if set the weapon pickup will render SD model only (HD<->SD model switch will be disabled)
	PLACEMENT_CREATION_FLAG_FORCE_DEFERRED_MODEL = 18    // if set the pickup will render as deferred model (no transparency/alpha blending in this render mode)
ENDENUM

ENUM PICKUP_REWARD_TYPE
	PICKUP_REWARD_TYPE_NONE = 0,
	PICKUP_REWARD_TYPE_AMMO = 1,				// 1<<0
	PICKUP_REWARD_TYPE_BULLET_MP = 2,			// 1<<1
	PICKUP_REWARD_TYPE_MISSILE_MP = 4,			// 1<<2
	PICKUP_REWARD_TYPE_GRENADE_LAUNCHER_MP = 8,  // 1<<3
	PICKUP_REWARD_TYPE_ARMOUR = 16,				// 1<<4
	PICKUP_REWARD_TYPE_HEALTH = 32, 			// 1<<5
	PICKUP_REWARD_TYPE_MONEY = 64,				// 1<<6
	PICKUP_REWARD_TYPE_WEAPON = 128,			// 1<<7
	PICKUP_REWARD_TYPE_STAT = 256,				// 1<<8
	PICKUP_REWARD_TYPE_VEHICLE_FIX = 512,		// 1<<9
	PICKUP_REWARD_TYPE_FIREWORK_MP = 1024,		// 1<<10
	
	PICKUP_REWARD_TYPE_ALL = 2047				// 1<<11 - 1
ENDENUM

ENUM ANIMATED_BUILDING_RATE_FLAGS
	AB_RATE_RANDOM = 1		// 1 << 0
ENDENUM

ENUM ANIMATED_BUILDING_PHASE_FLAGS
	AB_PHASE_RANDOM = 1	// 1 << 0
ENDENUM

ENUM DOOR_STATE_ENUM
	DOORSTATE_INVALID = -1,
	DOORSTATE_UNLOCKED,
	DOORSTATE_LOCKED,
	DOORSTATE_FORCE_LOCKED_UNTIL_OUT_OF_AREA,
	DOORSTATE_FORCE_UNLOCKED_THIS_FRAME,
	DOORSTATE_FORCE_LOCKED_THIS_FRAME,
	DOORSTATE_FORCE_OPEN_THIS_FRAME,
	DOORSTATE_FORCE_CLOSED_THIS_FRAME
ENDENUM

//~> 						Create and delere object commands

//INFO: 
//PARAM NOTES: RegisterAsNetworkObject:		The new object will be created and synced on other machines if a network game is running
//	       ScriptHostObject:		If true, this object has been created by the host portion of a network script and is vital to that script - it must always exist regardless of who is hosting the script.
//						If false, the object has been created by the client portion of a network script and can be removed when the client who created it leaves the script session.
//			ForceToBeObject:	    If true, the object will always be forced to be an object type. This applies when creating an object that uses a door model. If this is false the object will be created as a door door type.
//PURPOSE: Create an object  with an offset (from the root the base) at the given coord. 
NATIVE FUNC OBJECT_INDEX CREATE_OBJECT (MODEL_NAMES ModelIndex, VECTOR VecNewCoors, BOOL RegisterAsNetworkObject = TRUE, BOOL ScriptHostObject = TRUE, BOOL ForceToBeObject = FALSE) = "0x0e536d72ab30f4c8"

//INFO: 
//PARAM NOTES: RegisterAsNetworkObject:		The new object will be created and synced on other machines if a network game is running
//	       ScriptHostObject:		If true, this object has been created by the host portion of a network script and is vital to that script - it must always exist regardless of who is hosting the script.
//						If false, the object has been created by the client portion of a network script and can be removed when the client who created it leaves the script session.
//			ForceToBeObject:	    If true, the object will always be forced to be an object type. This applies when creating an object that uses a door model. If this is false the object will be created as a door door type.
//PURPOSE: Create an object with no offset at the given coord.
NATIVE FUNC OBJECT_INDEX CREATE_OBJECT_NO_OFFSET (MODEL_NAMES ModelIndex, VECTOR VecNewCoors, BOOL RegisterAsNetworkObject = TRUE, BOOL ScriptHostObject = TRUE, BOOL ForceToBeObject = FALSE) = "0x0a7322c6d0e1a985"

//~>					Position commands

//INFO: 
//PARAM NOTES: 
//PURPOSE: Used to orient an object to match the terrain. Works best if the object has a flat bottom and isn't too large with respect to the
//		   local curvature.
NATIVE FUNC BOOL PLACE_OBJECT_ON_GROUND_PROPERLY(OBJECT_INDEX ObjectIndex) = "0x82af23f360c69cae"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Basically the same as the above function but will also test objects as well as the ground
NATIVE FUNC BOOL PLACE_OBJECT_ON_GROUND_OR_OBJECT_PROPERLY(OBJECT_INDEX ObjectIndex) = "0xe6a4c4b2e8de36d3"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL GET_COORDS_AND_ROTATION_OF_CLOSEST_OBJECT_OF_TYPE(VECTOR VecSphereCentre, FLOAT fSphereRadius, MODEL_NAMES ModelIndex, VECTOR& VecReturnCoords, VECTOR& VecReturnRotation, EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0x5fe5dad7c292ebe5"

//INFO:
//PARAM NOTES: VecCoors1 and VecCoors2 define the midpoints of two parallel sides and DisatanceP1toP4 is the width of these sides.
//PURPOSE: Checks if a given point is in the non axis aligned area
NATIVE FUNC BOOL IS_POINT_IN_ANGLED_AREA ( VECTOR VecPoint, VECTOR VecCoors1, VECTOR VecCoors2, FLOAT DistanceP1toP4, BOOL HighlightArea = FALSE,  BOOL bCheck3D = TRUE) = "0x5f8653e60ed2288e"

//INFO: 
//PARAM NOTES: fHeading should be in degrees, code with automatically convert to rads
//PURPOSE:Similar to GET_OFFSET_FROM_OBJECT_IN_WORLD_COORDS, returns the world coords of the offset relative to the heading passed in 
NATIVE FUNC VECTOR GET_OFFSET_FROM_COORD_AND_HEADING_IN_WORLD_COORDS ( VECTOR vPos, FLOAT fHeading, VECTOR vOffset ) = "0x6db7fbd602c51670"

//INFO: The object will always rotate in the direction that requires the least amount of movement. 
//			This command returns TRUE when the object is at the correct rotation. If StopForCollisionFlag is TRUE then the command will also return TRUE if the object has collided with a ped or vehicle. 
//PARAM NOTES: TargetRotation and RotationStep are both measured in degrees and should be between 0 and 360.
//PURPOSE: Rotates the object by RotationStep degrees each frame until it is at the TargetRotation
NATIVE FUNC BOOL ROTATE_OBJECT ( OBJECT_INDEX ObjectID,  FLOAT TargetRotation, FLOAT RotationStep, BOOL StopForCollision ) = "0x3f35e3308bda6748"

//INFO: This command returns TRUE when the object is in the required position.
//		You will need to work out the exact increment.  An easier way is to use SLIDE_OBJECT_TO_COORD from SCRIPT_OBJECT.sch
//PARAM NOTES: If StopForCollisionFlag is TRUE then the command will also return TRUE if the object has collided with a ped or vehicle (this functionality is currently disabled). 
//PURPOSE:Moves the object by the step values each frame until it is at the correct position
NATIVE FUNC BOOL SLIDE_OBJECT ( OBJECT_INDEX ObjectID, VECTOR VecDestCoorst,VECTOR VecIncrement, BOOL StopOnCollision ) = "0x4a84ec87916ef892"

//~>					Pickup commands

//INFO: 
//PARAM NOTES: 
//			Type: 			PICKUP_TYPE is in pickup_enums.sch
//			VecNewCoors:		World Coordinates of the pickup
//			Flags:			Refer to PLACEMENT_FLAG (see above)
//			Amount			A variable amount that can be specified for some pickups (eg money)
//	       	ScriptHostObject:	If true, this object has been created by the host portion of a network script and is vital to that script - it must always exist regardless of who is hosting the script.
//								If false, the object has been created by the client portion of a network script and can be removed when the client who created it leaves the script session.
//			CustomModel		If set this model will be used for the pickup instead of the default one  
//PURPOSE: Creates a pickup spawner which can be referenced by the script and will spawn a pickup whenever the player gets near. This spawner can also
//         regenerate the pickup after it is collected. The spawner is removed when the script terminates.
NATIVE FUNC PICKUP_INDEX CREATE_PICKUP ( PICKUP_TYPE Type, VECTOR VecNewCoors, INT PlacementFlags = 0, INT Amount = -1, BOOL ScriptHostObject = TRUE, MODEL_NAMES CustomModel = 0 ) = "0x1cd347d2bd906560"

//INFO: 
//PARAM NOTES: 
//			Type: 		PICKUP_TYPE is in pickup_enums.sch
//	       	Orientation: 	specifies the pickups orientation in the same way it is done in SET_ENTITY_ROTATION.
//			Flags:			Refer to PLACEMENT_FLAG (see above)
//			Amount		A variable amount that can be specified for some pickups (eg money)
//	       	ScriptHostObject:	If true, this object has been created by the host portion of a network script and is vital to that script - it must always exist regardless of who is hosting the script.
//								If false, the object has been created by the client portion of a network script and can be removed when the client who created it leaves the script session.
//			CustomModel		If set this model will be used for the pickup instead of the default one  
//PURPOSE: Creates a pickup spawner which can be referenced by the script and will spawn a pickup whenever the player gets near. This spawner can also
//         regenerate the pickup after it is collected. The spawner is removed when the script terminates.
NATIVE FUNC PICKUP_INDEX  CREATE_PICKUP_ROTATE ( PICKUP_TYPE Type, VECTOR Coors, VECTOR Orientation, INT PlacementFlags = 0, INT Amount = -1, EULER_ROT_ORDER RotOrder = EULER_YXZ,  BOOL ScriptHostObject = TRUE, MODEL_NAMES CustomModel = 0 ) = "0x1ee09f99fef19daf"

//INFO: 
//PARAM NOTES: 
//			eWeaponType = weapon hash to set
//			pickupPlacementIndex = pickup placement id
//PURPOSE: Sets the weaponhash to be used for pickup. Has to be called right after pickup creation
NATIVE PROC SET_CUSTOM_PICKUP_WEAPON_HASH (WEAPON_TYPE eWeaponType, PICKUP_INDEX pickupPlacementIndex ) = "0x764344c3b3372eda"

//INFO: 
//PARAM NOTES: 
//			PickupID = id of pickup
//			forceItUp = true if pickup should face upward
//PURPOSE: Forces a pickup to face upward
NATIVE PROC FORCE_PICKUP_ROTATE_FACE_UP() = "0x520df2d45632ce77"

//INFO: 
//PARAM NOTES: 
//			Type: 					PICKUP_TYPE is in pickup_enums.sch
//			VecNewCoors:			World Coordinates of the pickup
//			Flags:					Refer to PLACEMENT_FLAG (see above)
//			Amount					A variable amount that can be specified for some pickups (eg money)
//			CustomModel				If set this model will be used for the pickup instead of the default one  
//			bCreateAsScriptObject	If true, the pickup will be treated as a script object and persist until the script terminates, or it is marked as no longer needed.
//	       	ScriptHostObject:		Only used if bCreateAsScriptObject is set to true.
//									If true, this object has been created by the host portion of a network script and is vital to that script - it must always exist regardless of who is hosting the script.
//									If false, the object has been created by the client portion of a network script and can be removed when the client who created it leaves the script session.
//          bNetwork				If true, the pickup will be synced across the network. If false, it won't appear on other machines
//PURPOSE: Creates a pickup similar to those dropped by dead peds. These types of pickups are part of the ambient population and will get removed
//	    if the player moves too far away from them. They cannot be referenced by the script and will remain if the script terminates. *** UNLESS bCreateAsScriptObject is set! ***
NATIVE FUNC OBJECT_INDEX CREATE_AMBIENT_PICKUP ( PICKUP_TYPE Type, VECTOR VecNewCoors, INT PlacementFlags = 0, INT Amount = -1, MODEL_NAMES CustomModel = 0, BOOL bCreateAsScriptObject = FALSE, BOOL ScriptHostObject = TRUE ) = "0xb765858a7a410073"

NATIVE FUNC OBJECT_INDEX CREATE_NON_NETWORKED_AMBIENT_PICKUP ( PICKUP_TYPE Type, VECTOR VecNewCoors, INT PlacementFlags = 0, INT Amount = -1, MODEL_NAMES CustomModel = 0, BOOL bCreateAsScriptObject = FALSE, BOOL ScriptHostObject = TRUE ) = "0xc9b8424fe1c703cf"

//INFO: 
//PARAM NOTES: 
//			pickupIndex: 			index returned by CREATE_PICKUP
//			playerFlags:			bitfield of players who will create pickup
//PURPOSE: Sets blocked players on existing pickup. Is used pickup will only appear for those who's player index is added
NATIVE PROC BLOCK_PLAYERS_FOR_PICKUP( PICKUP_INDEX pickupIndex, INT playerFlags ) = "0x895af49b57426c0f"

//INFO: 
//PARAM NOTES: 
//			pickupIndex: 			index returned by CREATE_AMBIENT_PICKUP
//			playerFlags:			bitfield of players who will create pickup
//PURPOSE: Sets blocked players on existing pickup. Is used pickup will only appear for those who's player index is added
NATIVE PROC BLOCK_PLAYERS_FOR_AMBIENT_PICKUP( OBJECT_INDEX pickupIndex, INT playerFlags ) = "0x03f97d082c4210a5"


//INFO: 
//PARAM NOTES: 
//			Type: 			PICKUP_TYPE is in pickup_enums.sch
//			VecNewCoors:		World Coordinates of the pickup
//			SnapToGround:	When created the pickup will be placed on the ground correctly
//			CustomModel		If set this model will be used for the pickup instead of the default one  
//          bNetwork				If true, the pickup will be synced across the network. If false, it won't appear on other machines
//PURPOSE: This creates a pickup object that persists and is carried when collected and can be attached to peds, etc. You can only call this for pickups that 
// are set up to be portable in the pickups.meta data file. The OBJECT_INDEX that is returned can be used like any other object.
NATIVE FUNC OBJECT_INDEX CREATE_PORTABLE_PICKUP ( PICKUP_TYPE Type, VECTOR VecNewCoors, BOOL SnapToGround = TRUE, MODEL_NAMES CustomModel = 0 ) = "0x9431d28bfc30340b"

NATIVE FUNC OBJECT_INDEX CREATE_NON_NETWORKED_PORTABLE_PICKUP ( PICKUP_TYPE Type, VECTOR VecNewCoors, BOOL SnapToGround = TRUE, MODEL_NAMES CustomModel = 0 ) = "0xa22803867109bfb0"

//INFO: 
//PURPOSE: Manually attaches a portable pickup to a ped using the attachment settings set up for that pickup
NATIVE PROC ATTACH_PORTABLE_PICKUP_TO_PED( OBJECT_INDEX PickupID, PED_INDEX PedID) = "0xa4dc05dfb08a8957"

//INFO: 
//PURPOSE: Manually detaches a portable pickup from a ped 
NATIVE PROC DETACH_PORTABLE_PICKUP_FROM_PED( OBJECT_INDEX PickupID ) = "0x1c9488ec3f23b199"

//INFO: 
//PURPOSE: Forces a portable pickup's last accessible position to be what its current position is in this frame
NATIVE PROC FORCE_PORTABLE_PICKUP_LAST_ACCESSIBLE_POSITION_SETTING(OBJECT_INDEX PickupID) = "0x5CE2E45A5CE2E45A"

//INFO: 
//PURPOSE: Sets the pickup to remain hidden when detaching from a dead ped. Calling this with false will make a detached pickup visible again
NATIVE PROC HIDE_PORTABLE_PICKUP_WHEN_DETACHED( OBJECT_INDEX PickupID, BOOL Hide ) = "0xd649c4fd90f64861"

//INFO: 
//PURPOSE: Allows or blocks the local player from collecting any portable pickup
NATIVE PROC SET_LOCAL_PLAYER_CAN_COLLECT_PORTABLE_PICKUPS( BOOL CanCollect ) = "0x91fbfe715b78280c"

//INFO: 
//PURPOSE: Sets the maximum number of portable pickups that the local player can carry.
// If the local player is carrying some pickups when you call this, he will drop some if he has too many. 
// If modelName is 0, MaxPickups is the total number of portable pickups allowed to be carried of any type
NATIVE PROC SET_MAX_NUM_PORTABLE_PICKUPS_CARRIED_BY_PLAYER( MODEL_NAMES modelName, INT MaxPickups ) = "0x9af1d0c5f270c910"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the coords of the pickup
NATIVE FUNC VECTOR GET_PICKUP_COORDS ( PICKUP_INDEX PickupID ) = "0x70453f7df40780a5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the coords of the pickup
NATIVE PROC SUPPRESS_PICKUP_SOUND_FOR_PICKUP ( OBJECT_INDEX PickupID, BOOL Suppress ) = "0xb409e96217e8aa92"

//INFO: 
//PARAM NOTES: minDist (=1.2) the minimum distance away we can be, maxDist (=1.5) the maximum distance away we can be.  We will always aim for the minimum distance but will expand out
// in 0.05m increments if we continue to fail to find positions.  If we ever reach maxDist we start at minDist again as we continue
//PURPOSE:Gets a safe coord at which to create a pickup close to the input co-ordinates
NATIVE FUNC VECTOR GET_SAFE_PICKUP_COORDS (VECTOR VecInCoors, FLOAT minDist = 1.2, FLOAT maxDist = 1.5) = "0x7f65c587e17def5d"

//INFO: 
//PURPOSE: Adds an area of the map where the portable pickups will use extended probe when dropped
NATIVE PROC ADD_EXTENDED_PICKUP_PROBE_AREA(VECTOR position, FLOAT radius) = "0x28ee006afec511d9"

//INFO: 
//PURPOSE: Removes all added areas
NATIVE PROC CLEAR_EXTENDED_PICKUP_PROBE_AREAS() = "0x7a888ab940b876e8"

//INFO: 
//PARAM NOTES:  PICKUP_TYPE isin commands_object.sch
//PURPOSE: Remove objects of certain pickup type.
NATIVE PROC REMOVE_ALL_PICKUPS_OF_TYPE(PICKUP_TYPE Type) = "0xf5341a080595c3f3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the number of pickups of type
NATIVE FUNC INT GET_NUMBER_OF_PICKUPS_OF_TYPE(PICKUP_TYPE Type) = "0xb54b23d6eafb5fcf"

//INFO: 
//PARAM NOTES:
//PURPOSE: Removes a pickup from the map.
NATIVE PROC REMOVE_PICKUP (PICKUP_INDEX PickupID ) = "0x451f33099166532a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if a pickup has beeen collected
NATIVE FUNC BOOL HAS_PICKUP_BEEN_COLLECTED (PICKUP_INDEX PickupID ) = "0x803592456ae579b3"

//INFO: 
//PARAM NOTES:
//PURPOSE:Checks if a pickup exists.
NATIVE FUNC BOOL DOES_PICKUP_EXIST ( PICKUP_INDEX PickupID ) = "0x2791155fb0769fe5"

//INFO: 
//PARAM NOTES:
//PURPOSE:Checks if a pickup has spawned its object (weapon, etc)
NATIVE FUNC BOOL DOES_PICKUP_OBJECT_EXIST ( PICKUP_INDEX PickupID ) = "0x5f0e7de3bfa7690c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the object spawned by the pickup (-1 if the pickup has no object)
NATIVE FUNC OBJECT_INDEX GET_PICKUP_OBJECT ( PICKUP_INDEX PickupID ) = "0x7af1def5f183c1a6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns whether an object is a pickup object
NATIVE FUNC BOOL IS_OBJECT_A_PICKUP ( OBJECT_INDEX ObjectID ) = "0xccebb0c0198fecdb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns whether an object is a portable pickup 
NATIVE FUNC BOOL IS_OBJECT_A_PORTABLE_PICKUP ( OBJECT_INDEX ObjectID ) = "0x9f781807386ac867"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if a pickup of the given type exist within the given radius from the given coords
NATIVE FUNC BOOL DOES_PICKUP_OF_TYPE_EXIST_IN_AREA ( PICKUP_TYPE PickupType, VECTOR VecCoords, FLOAT Radius ) = "0xe4e0f69f436c8ff8"

//INFO: 
//PARAM NOTES:VecNewCoors - the coordinates the money pickups will be generated round. Must be on or above the ground.
//	      Amount - the total amount of money dropped	
//	      MaxNumPickups - the maximum number of money pickups created (no greater than 8)	
//		  CustomModel - If set this model will be used for the pickup instead of the default one  
//PURPOSE: Creates a bunch of money pickups around the given coordinates, of the given amount
NATIVE PROC CREATE_MONEY_PICKUPS(VECTOR VecNewCoors, INT Amount, INT MaxNumPickups, MODEL_NAMES CustomModel = 0 ) = "0xae315b17ac08c2a9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the regeneration time for a particular pickup, overriding the default value set in the pickup data
NATIVE PROC SET_PICKUP_REGENERATION_TIME ( PICKUP_INDEX PickupID, INT RegenTime ) = "0x69df462e3146f76e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets flag on CRegenerationInfo to force regenerate pickup even if time left on timer
NATIVE PROC FORCE_PICKUP_REGENERATE(PICKUP_INDEX PickupID) = "0x482dcf58b0c559a4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prohibits/allows a player to collect the specified pickup type
NATIVE PROC SET_PLAYER_PERMITTED_TO_COLLECT_PICKUPS_OF_TYPE ( PLAYER_INDEX PlayerIndex, PICKUP_TYPE Type, BOOL Allow ) = "0xcbd9f5754fd640bf"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prohibits/allows the local player to collect the specified pickup custom model
NATIVE PROC SET_LOCAL_PLAYER_PERMITTED_TO_COLLECT_PICKUPS_WITH_MODEL(MODEL_NAMES CustomModel, BOOL Allow ) = "0xd985cd4e4d28a723"

//INFO: 
//PARAM NOTES:
//PURPOSE: Allows all players to collect the specified pickup type
NATIVE PROC ALLOW_ALL_PLAYERS_TO_COLLECT_PICKUPS_OF_TYPE( PICKUP_TYPE Type ) = "0xc4f1303f19df6af2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a pickup collectable by the given team
NATIVE PROC SET_TEAM_PICKUP( PICKUP_INDEX PickupID, INT Team) = "0x0c480c11c7e0c37a"

//INFO: 
//PARAM NOTES:
//			bSet - if true then the given team is permitted to collect the object, if false the team is not allowed. You only need to call this with
//					false if you have previously called it with true.
//PURPOSE: Sets an ambient or portable pickup object collectable by the given team. Call this multiple times for all teams you want to permit.
NATIVE PROC SET_TEAM_PICKUP_OBJECT( OBJECT_INDEX PickupID, INT Team, BOOL bSet = TRUE) = "0x0548bdefcaa1caa7"

//INFO: 
//PURPOSE: Sets a portable pickup to be uncollectable 
//PARAM NOTES:
//			bLocalOnly - if true then the local player is prohibited from collecting the pickup. This is not synced and is used to prevent collection locally
NATIVE PROC PREVENT_COLLECTION_OF_PORTABLE_PICKUP( OBJECT_INDEX PickupID, BOOL bPrevent, BOOL bLocalOnly = FALSE) = "0x8175b06ed630a82a"

//INFO: 
//PURPOSE: Returns true when the portable pickup's custom collider used for collection has been created.
//		   Once this returns true, the pickup can be placed into interiors using FORCE_ROOM_FOR_ENTITY
//PARAM NOTES:
NATIVE FUNC BOOL IS_PORTABLE_PICKUP_CUSTOM_COLLIDER_READY(OBJECT_INDEX PickupID) = "0x0a303c7e33325097"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a pickup to glow when it is not collectable
NATIVE PROC SET_PICKUP_OBJECT_GLOW_WHEN_UNCOLLECTABLE( OBJECT_INDEX PickupID, BOOL bSet = TRUE ) = "0x0e1b3b43a16940eb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a pickup glow offset (for floating pickups, usually ground height, 0.0f for something on the ground)
NATIVE PROC SET_PICKUP_GLOW_OFFSET( PICKUP_INDEX PickupID, FLOAT Offset ) = "0x6f57da45338c5293"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets an ambient or portable pickup object glow offset (usually ground height, 0.0f for something on the ground)
NATIVE PROC SET_PICKUP_OBJECT_GLOW_OFFSET(OBJECT_INDEX PickupID, FLOAT Offset, BOOL bSet = TRUE) = "0x1092ed0cc7e5a2f5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a pickup placement to glow if the player is in the team that should be able to collect it when in the same team
NATIVE PROC SET_PICKUP_GLOW_IN_SAME_TEAM( PICKUP_INDEX PickupID ) = "0x269098405297dfe9"


//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a pickup to glow if the player is in the team that should be able to collect it when in the same team
NATIVE PROC SET_PICKUP_OBJECT_GLOW_IN_SAME_TEAM( OBJECT_INDEX PickupID ) = "0x1cedd008a678bd02"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a pickup to glow from an object id even if the player is in the team that should be able to collect it when in the same team
NATIVE PROC SET_OBJECT_GLOW_IN_SAME_TEAM( OBJECT_INDEX ObjectIndex ) = "0xc10f6115159d2b04"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_PICKUP_OBJECT_ARROW_MARKER(OBJECT_INDEX PickupID, BOOL bSet = TRUE) = "0xfd3eb69ea4ce479b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Allows the arrow marker to be displayed when the pickup is uncollectable
NATIVE PROC ALLOW_PICKUP_ARROW_MARKER_WHEN_UNCOLLECTABLE(OBJECT_INDEX PickupID, BOOL bSet = TRUE) = "0xd9b42564a7d9daa8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the standard ammo you receive when collecting a weapon of the given type
NATIVE FUNC INT GET_DEFAULT_AMMO_FOR_WEAPON_PICKUP(PICKUP_TYPE WeaponPickupType) = "0x675e742c60ddd638"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether the vehicle weapon pickups in GTA races will be shared amongsth the passengers in the vehicle
NATIVE PROC SET_VEHICLE_WEAPON_PICKUPS_SHARED_BY_PASSENGERS(BOOL bSet) = "0x41923cbe924491d9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a modifier on the range wihtin which enemy pickups can drop
NATIVE PROC SET_PICKUP_GENERATION_RANGE_MULTIPLIER(FLOAT multiplier) = "0x296fb914127b2d58"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the multiplier set on the enemy pickup drop range
NATIVE FUNC FLOAT GET_PICKUP_GENERATION_RANGE_MULTIPLIER() = "0xea9410ebed10ae7c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Only allows ammo collection when the local player is low on ammo (< 20%)
NATIVE PROC SET_ONLY_ALLOW_AMMO_COLLECTION_WHEN_LOW(BOOL bSet) = "0x79c07e0ee199af10"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a pickup as locally uncollectable
NATIVE PROC SET_PICKUP_UNCOLLECTABLE(PICKUP_INDEX PickupID, BOOL bSet) = "0xac74e3ca074d8dbd"

//INFO: 
//PARAM NOTES:
//PURPOSE: Partly alpha's out the pickup object if the pickup is marked uncollectable for the local player by script (or if it is uncollectable due to being a team pickup)
NATIVE PROC SET_PICKUP_TRANSPARENT_WHEN_UNCOLLECTABLE(PICKUP_INDEX PickupID, BOOL bSet) = "0xdd5baaae5696f80d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Prevents pickup objects spawning if the pickup is marked uncollectable for the local player by script (or if it is uncollectable due to being a team pickup)
NATIVE PROC SET_PICKUP_HIDDEN_WHEN_UNCOLLECTABLE(PICKUP_INDEX PickupID, BOOL bSet) = "0xa46cb4ea8156117b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Partly alpha's out pickups that are marked uncollectable for the local player by script
NATIVE PROC SET_PICKUP_OBJECT_TRANSPARENT_WHEN_UNCOLLECTABLE(OBJECT_INDEX PickupID, BOOL bSet) = "0x678cc86c4633cc3f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the alpha that pickups will be displayed at when uncollectable and SET_PICKUP_OBJECT_TRANSPARENT_WHEN_UNCOLLECTABLE has been called on them
NATIVE PROC SET_PICKUP_OBJECT_ALPHA_WHEN_TRANSPARENT(INT PickupAlpha) = "0x6155572d912b46d6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a portable pickup to persist after converting to ambient
NATIVE PROC SET_PORTABLE_PICKUP_PERSIST(OBJECT_INDEX PickupID, BOOL bSet) = "0x43da905252ee4ca1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a portable pickup to persist after converting to ambient
NATIVE PROC ALLOW_PORTABLE_PICKUP_TO_MIGRATE_TO_NON_PARTICIPANTS(OBJECT_INDEX PickupID, BOOL bAllow) = "0x41db71dce7894fab"

//INFO: 
//PARAM NOTES: USE FORCE_ACTIVATE_PHYSICS_ON_DROPPED_PICKUP_NEAR_SUBMARINE instead!
//PURPOSE: HACK FIX FOR SMUGGLER PACK Sets a flag on portable pickup to force it to not fix when dropped. It will force pickup not to snap to ground but gets dropped instead
NATIVE PROC FORCE_ACTIVATE_PHYSICS_ON_UNFIXED_PICKUP(OBJECT_INDEX PickupID, BOOL force) = "0x189ab741d56f49b9"

//INFO:
//PARAM NOTES:
//PURPOSE: Forces physics to be used on dropped pickups when near a submarine. This helps avoid the issue of pickups being dropped inside the submarine.
NATIVE PROC FORCE_ACTIVATE_PHYSICS_ON_DROPPED_PICKUP_NEAR_SUBMARINE(OBJECT_INDEX PickupID, BOOL force) = "0xf46083d431705b1c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Allows pickup to be collected by non script participant
NATIVE PROC ALLOW_PICKUP_BY_NONE_PARTICIPANT(OBJECT_INDEX PickupID, BOOL allow) = "0xc6e2d6b7217f48ac"

/// PURPOSE: 
///    Accessor to determine if a designated suppression pickup flag is set
/// PARAMS:
///    pickupFlag - Flags to query (refer to enum PICKUP_REWARD_TYPE )
/// RETURNS:
///    BOOL - Whether or not the flag is set
NATIVE FUNC BOOL IS_PICKUP_REWARD_TYPE_SUPPRESSED( PICKUP_REWARD_TYPE pickupFlag ) = "0xba9733cfcaafa2dc"

/// PURPOSE:
///    Means of turning on suppression pickup flags individually
/// PARAMS:
///    pickupFlag - Flag you would like to set (refer to enum PICKUP_REWARD_TYPE )
///    bClearPreviousFlags - Whether or not you want all previously set flags to be cleared 
///    						 before setting the new flag.
NATIVE PROC SUPPRESS_PICKUP_REWARD_TYPE( PICKUP_REWARD_TYPE pickupFlag, BOOL bClearPreviousFlags = FALSE ) = "0xdef665962974b74c"

/// PURPOSE:
///    Clears all suppression pickup flags
NATIVE PROC CLEAR_ALL_PICKUP_REWARD_TYPE_SUPPRESSION() = "0x402458806232a271"

/// PURPOSE:
///    Clears a designated suppression pickup flag
/// PARAMS:
///    pickupFlag - Flag you would like to clear (refer to enum PICKUP_REWARD_TYPE )
NATIVE PROC CLEAR_PICKUP_REWARD_TYPE_SUPPRESSION( PICKUP_REWARD_TYPE pickupFlag ) = "0x261c0495ce1149be"

/// PURPOSE:
///    Request visibility tracking for an object
/// PARAMS:
///    ObjectID - Index of the object to be tracked.
NATIVE PROC TRACK_OBJECT_VISIBILITY( OBJECT_INDEX ObjectID ) = "0x6e740265db1f6ea1"

/// PURPOSE:
///    Request results of visibility tracking for an object
///    return TRUE if visibile, FALSE if not.
/// PARAMS:
///    PickupID - Index of the object to be tracked.
NATIVE FUNC BOOL IS_OBJECT_VISIBLE( OBJECT_INDEX ObjectID ) = "0x3e04de565f9095b8"

/// PURPOSE:
///    Render a pickup looking glow, with no need for an actual pickup
/// PARAMS:
///    position - glow position
///    glowType - glow type, from scriptedglow.xml
NATIVE PROC RENDER_FAKE_PICKUP_GLOW( VECTOR position, INT glowType) = "0x8c6bd716fdd7dfb2"

/// PURPOSE:
///    A temporary command to convert old pickup types to the new hash types
NATIVE FUNC PICKUP_TYPE CONVERT_OLD_PICKUP_TYPE_TO_NEW( PICKUP_TYPE OldPickupType ) = "0x9b788b7cb1c92c62"

//~>						Network commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a pickup fixes a vehicle usally used in a network game.
NATIVE PROC SET_PICKUPS_FIX_VEHICLES(BOOL bValue) = "0x773f3c214f597ce1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the time before a weapon respawns in a network games
NATIVE PROC SET_WEAPON_PICKUP_NETWORK_REGEN_TIME(WEAPON_TYPE WeaponType, INT RegenTime) = "0xab873406b67fa8a0"

//INFO: 
//PARAM NOTES:
//PURPOSE:Sets the time before a health pickup respawns in a network games
NATIVE PROC SET_HEALTH_PICKUP_NETWORK_REGEN_TIME(INT RegenTime) = "0xddbf1a023e4f2b18"

//INFO: 
//PARAM NOTES:
//PURPOSE:Sets the time before a armour pickup respawns in a network games
NATIVE PROC SET_ARMOUR_PICKUP_NETWORK_REGEN_TIME(INT RegenTime) = "0xc14ebb516978b18f"



//INFO: 
//PARAM NOTES:
//PURPOSE: Allows a pickup to be collectable if the player is in a vehicle. This only works for on foot pickups
NATIVE PROC SET_PICKUP_OBJECT_COLLECTABLE_IN_VEHICLE(OBJECT_INDEX PickupID) = "0x07106eb9ee13466d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Forces the pickup to fully sync up with all players before it gets destroyed so all players will trigger their damage event correctly
// NOTE: Unset it before trying to delete the pickup via the DELETE_ENTITY function
NATIVE PROC SET_PICKUP_TRACK_DAMAGE_EVENTS(OBJECT_INDEX PickupID, BOOL set = TRUE) = "0xfd2d2d41983bb472"
//~>						Weapon commands

//INFO:  Ordinarily it is only displayed a number of times and then the game stops mentioning it.
//PARAM NOTES:
//PURPOSE: Displays the message to tell the player to press LB to pickup a weapon in the same slot.  More info.. 
NATIVE PROC SET_ALWAYS_DISPLAY_WEAPON_PICKUP_MESSAGE(BOOL bValue) = "0x75daba808ea57cc3"

//~>						Physics commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Freezes the object of type.
NATIVE PROC FREEZE_POSITION_OF_CLOSEST_OBJECT_OF_TYPE (  VECTOR VecCoors, FLOAT Radius, MODEL_NAMES ModelIndex, BOOL bFreezeFlag ) = "0xbc22d08e20303367"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if an object has be removed from its root.
NATIVE FUNC BOOL HAS_OBJECT_BEEN_UPROOTED ( OBJECT_INDEX ObjectID ) = "0x65bc987a38ca0272"

//INFO: 
//PARAM NOTES:
//PURPOSE: By default, script created objects don't use low LOD buoyancy mode. This allows this behaviour to be overridden.
NATIVE PROC SET_OBJECT_ALLOW_LOW_LOD_BUOYANCY(OBJECT_INDEX ObjectID, BOOL AllowFlag) = "0x225f199ba06b3d82"

//INFO: Any param set to -1.0 will be ignored, and will remain as defaults. 
//		Specifying mass = -1.0 will reset the mass back to the object's default value
//PARAM NOTES: fMass: object mass (rotational inertia is calculated from new mass and volume) 
//							fGravityFactor the gravity affecting this object can be modified (default is 1.0) 
//							TranslationalDamping:  
//								x = x = constant friction (doesn't depend on speed)
//								 y = y*V = speed dependent friction (multiplied by speed)
//								 z = z*V^2 = aerodynamic drag (multiplied by speed squared) 
//							RotationalDamping
//    							 x = x = constant friction (doesn't depend on speed)
//    							y = y*V = speed dependent friction (multiplied by speed)
//   							z = z*V^2 = aerodynamic drag (multiplied by speed squared) 
//							fCollisionMargin
//								 Set to thinnist part of object. Default is 10cm 
//							fMaxAngularSpeed
//								Increase for objects which are likely to spin fast, e.g. small spheres. Default is 2*PI 
//							fBuoyancyFactor
//								Allow scaling of an object's buoyancy in water.
//PURPOSE: Set physics parameters on this instance of an object. More info..
NATIVE PROC SET_OBJECT_PHYSICS_PARAMS(OBJECT_INDEX ObjectIndex, float fMass, float fGravityFactor, VECTOR TranslationalDamping, VECTOR RotationalDamping, float fCollisionMargin = -1.0, FLOAT fMaxAngularSpeed = -1.0, FLOAT fBuoyancyFactor = -1.0) = "0xcc2383c749571bd1"

//PURPOSE: Marks object as 'golf ball' - which causes it to run some alternate 
//			or extra physics to deal with the small scale (Particularly for rolling)
// NOTES: Currently pretty hacky and directly targeted at golf balls interacting at putting level velocities
//			Ask code about this before using it (Robert Percival)
NATIVE PROC SET_OBJECT_IS_SPECIAL_GOLFBALL(OBJECT_INDEX ObjectIndex, bool IsGolfBall = TRUE) = "0x04a0ccec1611db8a"

//PURPOSE: Marks object to take damage from colliding with buildings.
//			
// NOTES: 
//			
NATIVE PROC SET_OBJECT_TAKES_DAMAGE_FROM_COLLIDING_WITH_BUILDINGS(OBJECT_INDEX ObjectIndex, bool bTakesDamage = TRUE) = "0x2c08bd44740dbbfe"

//PURPOSE: When set, non networked objects will trigger damage events also
//			
// NOTES: 
//	
NATIVE PROC ALLOW_DAMAGE_EVENTS_FOR_NON_NETWORKED_OBJECTS(BOOL allow) = "0xd9b751e2b8db8914"

//PURPOSE: Forces on the flashlight of a weapon object for this frame during cutscenes.
// NOTES: Will only force it on if the weapon is not owned by a ped (i.e. It belongs to a cutscene).
NATIVE PROC SET_CUTSCENES_WEAPON_FLASHLIGHT_ON_THIS_FRAME(OBJECT_INDEX ObjectIndex, bool bForceOn = TRUE) = "0x0e4a297378aba0e1"


//INFO: 
//PARAM NOTES: result = (current unbroken groups / original groups)
//															or
//							result = (current mass / undamaged mass)
//PURPOSE: Get the damage health of a fragment heap.  More info..
NATIVE FUNC FLOAT GET_OBJECT_FRAGMENT_DAMAGE_HEALTH(OBJECT_INDEX ObjectIndex, bool HealthPercentageByMass) = "0x13ac33b32a4f4e11"


//INFO: his could be useful if you have created the object on a slope and you need it to lie properly on the slope rather than hover horizontally above the ground. 
//PARAM NOTES:
//PURPOSE:Turns on the object's physics as soon as the collision is loaded around it. More info..
NATIVE PROC SET_ACTIVATE_OBJECT_PHYSICS_AS_SOON_AS_IT_IS_UNFROZEN(OBJECT_INDEX ObjectIndex, BOOL bActivatePhysicsWhenUnfrozen) = "0xe987efb3b3fab187"


//~>						Player commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a player can drop a weapon when driving usally used in a network game.
NATIVE PROC SET_PLAYER_CAN_DROP_WEAPONS_IN_VEHICLE(BOOL bValue) = "0xb9e2037d77c9eb08"


//~>							 Attribute commands 

//INFO: Only four objects can be targettable at any time. 
//PARAM NOTES:
//PURPOSE: The player can auto target the object.  More info..
NATIVE PROC SET_OBJECT_TARGETTABLE ( OBJECT_INDEX ObjectID, BOOL Targettable ) = "0x6486d097e5c691f3"

//INFO:
//PARAM NOTES:
//PURPOSE: Set to TRUE to force vehicles to ignore the height check and avoid this
//	object regardless of how tall it is
NATIVE PROC SET_OBJECT_FORCE_VEHICLES_TO_AVOID( OBJECT_INDEX ObjectID, BOOL ForceAvoid ) = "0x0321bbb2a2b3b1ed"

//INFO: Set offset (in object space) for targeting lock on purposes.
//PARAM NOTES:
//PURPOSE: Helps to position lock on position better for gameplay purposes.
NATIVE PROC SET_OBJECT_TARGETING_OFFSET ( OBJECT_INDEX ObjectID, VECTOR vOffset ) = "0x1d31ec763521813b"

//PURPOSE: Grabs the closest object (or dummy object) with the specified model.
//	The object is set as a mission object. You can't delete this object. You can set it as no longer needed.
//	If no object is found in the range then NULL is returned.
//	A dummy object will first be converted to a real object.
//PARAM NOTES:
//  RegisterAsScriptObject:   The new object will be registered with the script
//  RegisterAsNetworkObject:  The new object will be created and synced on other machines if a network game is running
//	ScriptHostObject:		If true, this object has been created by the host portion of a network script and is vital to that script - it must always exist regardless of who is hosting the script.
//                          RegisterAsNetworkObject must be set to true in this case.
//						    If false, the object has been created by the client portion of a network script and can be removed when the client who created it leaves the script session.

NATIVE FUNC OBJECT_INDEX GET_CLOSEST_OBJECT_OF_TYPE(VECTOR scrVecCentreCoors, FLOAT Radius, MODEL_NAMES ObjectModelHashKey, BOOL RegisterAsScriptObject = TRUE, BOOL ScriptHostObject = FALSE, BOOL RegisterAsNetworkObject = TRUE) = "0x87a467676bdf8c35"

//INFO: 
//PARAM NOTES:
//PURPOSE: returns TRUE if the closest object within Radius is a proper object - not a dummy or building
NATIVE FUNC BOOL DOES_OBJECT_OF_TYPE_EXIST_AT_COORDS ( VECTOR VecCoors, FLOAT Radius, MODEL_NAMES ModelIndex, BOOL checkPhysicsExists = FALSE) = "0x574e2a23f0f76e35"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets an object to be stealable.
NATIVE PROC SET_OBJECT_AS_STEALABLE ( OBJECT_INDEX ObjectID, BOOL Stealable ) = "0xcd45c0d75d9bf726"

//INFO: This is used primarliy in cutscenes
//PARAM NOTES:
//PURPOSE: Requests a higher detail version of this model. More info... 
NATIVE PROC  REQUEST_OBJECT_HIGH_DETAIL_MODEL (OBJECT_INDEX ObjectIndex) = "0x3b03a53d753d3bf9"

//INFO: This is used primarliy in cutscenes
//PARAM NOTES:
//PURPOSE: Removes a high detail. More info... 
NATIVE PROC  REMOVE_OBJECT_HIGH_DETAIL_MODEL (OBJECT_INDEX ObjectIndex) = "0x5f012c14ed0c0c36"

//INFO: Remove one of the parts of an fragment based object.
//PARAM NOTES: Disappear will make the group pop out of existence, otherwise the group will break off.
//PURPOSE: Specifying the component removed the entire group that the component is part of. 
NATIVE PROC	BREAK_OBJECT_FRAGMENT_CHILD (OBJECT_INDEX ObjectIndex, INT Component, BOOL Disappear) = "0xb35d04a52bd51f16"

//INFO: Damage one of the parts of a fragment based object.
//PURPOSE: Either switch a part of an object to its damaged version, or destroy it if it's tuned to "disappear when dead".
NATIVE PROC	DAMAGE_OBJECT_FRAGMENT_CHILD (OBJECT_INDEX ObjectIndex, INT Component, FLOAT NewHealth = 0.0 ) = "0xae6555cd897a035d"

//INFO: Resets an object (has to be a fragment)
//PARAM NOTES:
//PURPOSE: Resets and brings back all the children. That will leave broken off parts in the world. 
NATIVE PROC FIX_OBJECT_FRAGMENT(OBJECT_INDEX ObjectIndex) = "0xf4da4bbc6876e774"

//~>								Door commands

//INFO: To open and shut a door smoothly call every frame with bLockState=false as you increase/decrease the open/shut ratio
//		In your script tidyup you should reset the door to bLockState = false, fOpenRatio = 0.0 to release the door. Unless you specifically want the door to remain locked for ever more. 
//		Get door position using helper widget: Rag Widgets -> Objects -> Show Door Info  
//PARAM NOTES: 
//						Open ratio: 0.0 = shut, 1.0 = open (anti clockwise for swinging doors)  -1.0 = open (clockwise for swinging doors, does nothing for sliding/garage doors) 
//						bLockState = true will force the door to snap to the desired ratio. 
//						bRemoveSpring = true will stop door from trying to spring back to the last set open ratio.  If lockState is set then this flag is ignored
//PURPOSE: Sest the state of the closest door of type. More info..
NATIVE PROC SET_STATE_OF_CLOSEST_DOOR_OF_TYPE (MODEL_NAMES ObjectModelHashKey, VECTOR vecPos, BOOL bLockState, FLOAT fOpenRatio, BOOL bRemoveSpring = FALSE) = "0x798e4bba7a3c56ae"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the state of the closest door type.
NATIVE PROC GET_STATE_OF_CLOSEST_DOOR_OF_TYPE (MODEL_NAMES ObjectModelHashKey, VECTOR vecPos, BOOL &bReturnLockState, FLOAT &fReturnOpenRatio) = "0xd25fb7e1030e5e2d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Will attempt to lock or unlock the door of the type at the position if existing as streamed in, 
//if not will otherwise set an appropriate element in the global mapped locked gLockedObjects accordingly.
//bLockState = true 	- door locked
//bLockState = false 	- door unlocked
//fAutomaticRate;		- The rate at which the door's open ratio gets adjusted when opening automatically, i.e. the inverse of the time it takes to open. If this is value is 0.0 the normal default value for the door type is used. Current allowed max is 5 for networked games.
//fAutomaticDist		- The distance threshold at which the (sliding/garage/barrier) door should open at, in meters. If the value is 0.0, the default value is used. Current allowed max is 100 m for networked games.
//fOpenRatio			- Opening ratio to lock the door at (i.e. 1.0 to lock open).
//
//Note for both the fAutomaticRate and fAutomaticDist parameter, if you want to use values other than default, you will need to ensure that when you initially Lock the door you use the same required value that
// is desired for the opening condition. So that when you later Unlock the door, the same value is passed in. This is in order to ensure that the door state is transmitted to remote machines.
//
//e.g. To make the door unlock at the full fastest rate you wold need to do the following:
//
//Lock:
//SET_LOCKED_UNSTREAMED_IN_DOOR_OF_TYPE (PROP_GATE_PRISON_01, <<1845, 2612, 45>>, TRUE, 1.0)
//
//Unlock:
//SET_LOCKED_UNSTREAMED_IN_DOOR_OF_TYPE (PROP_GATE_PRISON_01, <<1845, 2612, 45>>, FALSE,1.0)
//
//Or, if you wanted to make the door unlock at a distance of 50 m but leave the rate at the default value, you would need to do the following:
//
//Lock:
//SET_LOCKED_UNSTREAMED_IN_DOOR_OF_TYPE (PROP_GATE_PRISON_01, <<1845, 2612, 45>>, TRUE, 0.0, 50.0)
//
//Unlock:
//SET_LOCKED_UNSTREAMED_IN_DOOR_OF_TYPE (PROP_GATE_PRISON_01, <<1845, 2612, 45>>, FALSE,0.0, 50.0)

NATIVE PROC SET_LOCKED_UNSTREAMED_IN_DOOR_OF_TYPE (MODEL_NAMES ObjectModelHashKey, VECTOR vecPos, BOOL bLockState, FLOAT fAutomaticRate = 0.0, FLOAT fAutomaticDist = 0.0, FLOAT fOpenRatio = 0.0) = "0x82ef7f252a48dc41"

//INFO: 
//PARAM NOTES:
//PURPOSE: Play the auto start animation associated with the object.
NATIVE PROC PLAY_OBJECT_AUTO_START_ANIM (OBJECT_INDEX ObjectIndex) = "0xc225c3d9cc954480"

//INFO: 
//PARAM NOTES:
// permanent - if this is set, the door will not be hooked up with the script and cleaned up when the script terminates. This should only be set to true in special 
//             circumstances, it is generally used when entering MP to lock a load of doors permanently during MP. The door system is flushed going back to SP so the doors
//             will be cleaned up then.
//PURPOSE: Add script defined door to native door system
NATIVE PROC ADD_DOOR_TO_SYSTEM(int doorEnumHash, MODEL_NAMES ObjectModelHashKey, VECTOR vecPos, BOOL useOldOverrides = TRUE, BOOL network = TRUE, BOOL permanent = FALSE) = "0x5dd86ac785d8e188"

//INFO: 
//PARAM NOTES:
// bLock - Leaves the door in a locked state
//PURPOSE: Remove a script defined door from the door system
NATIVE PROC REMOVE_DOOR_FROM_SYSTEM(int doorEnumHash, BOOL bLock = FALSE) = "0xa5bd780899e2d5f0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the state of a door managed by the door system
NATIVE PROC DOOR_SYSTEM_SET_DOOR_STATE(int doorEnumHash, DOOR_STATE_ENUM state, BOOL network = TRUE, BOOL flushState = FALSE) = "0x7e15597aa5f53f9a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the state of a door managed by the door system
NATIVE FUNC DOOR_STATE_ENUM DOOR_SYSTEM_GET_DOOR_STATE(int doorEnumHash) = "0xa570d693c4a2b421"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the pending state of a door managed by the door system
NATIVE FUNC DOOR_STATE_ENUM DOOR_SYSTEM_GET_DOOR_PENDING_STATE(int doorEnumHash) = "0xdc62e683fb337ec3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the rate at which the door's open ratio gets adjusted when opening automatically, i.e. the inverse of the time it takes to open. 
NATIVE PROC DOOR_SYSTEM_SET_AUTOMATIC_RATE(int doorEnumHash, FLOAT fAutomaticRate, BOOL network = TRUE, BOOL flushState = FALSE) = "0x1f0b6d1966e55ddb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the distance threshold at which the (sliding/garage/barrier) door should open at, in meters.
NATIVE PROC DOOR_SYSTEM_SET_AUTOMATIC_DISTANCE(int doorEnumHash, FLOAT fAutomaticDistance, BOOL network = TRUE, BOOL flushState = FALSE) = "0x32dbceb580393767"


//INFO: 
//PARAM NOTES:
//PURPOSE: Get opening ratio to lock the door at (i.e. 1.0 to lock open)
NATIVE PROC DOOR_SYSTEM_SET_OPEN_RATIO(int doorEnumHash, FLOAT fOpenRatio, BOOL network = TRUE, BOOL flushState = FALSE) = "0x1b3e1454bd86fce6"

//PARAM NOTES:
//PURPOSE: Set the door to hold open
NATIVE PROC DOOR_SYSTEM_SET_HOLD_OPEN(int doorEnumHash, BOOL holdOpen) = "0x240efbc99404843a"

//PARAM NOTES:
//PURPOSE: Set the door to be open for races
NATIVE PROC DOOR_SYSTEM_SET_DOOR_OPEN_FOR_RACES(int doorEnumHash, BOOL open) = "0xeeff17c042a8cb2c"

//PARAM NOTES:
//PURPOSE: Make this door object easily push vehicles out of the way as it swings
NATIVE PROC SET_DOOR_OBJECT_ALWAYS_PUSH_VEHICLES(OBJECT_INDEX ObjectID, BOOL pushVehicles) = "0xac05f02664b3fb07"


//INFO: 
//PARAM NOTES:
//PURPOSE: Get the rate at which the door's open ratio gets adjusted when opening automatically, i.e. the inverse of the time it takes to open. 
NATIVE FUNC FLOAT DOOR_SYSTEM_GET_AUTOMATIC_RATE(int doorEnumHash) = "0xb3eef85759c0825d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the distance threshold at which the (sliding/garage/barrier) door should open at, in meters.
NATIVE FUNC FLOAT DOOR_SYSTEM_GET_AUTOMATIC_DISTANCE(int doorEnumHash) = "0x478b4c9fd32a6ef9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get opening ratio to lock the door at (i.e. 1.0 to lock open)
NATIVE FUNC FLOAT DOOR_SYSTEM_GET_OPEN_RATIO(int doorEnumHash) = "0xc4336736b30c9df5"

//PARAM NOTES:
//PURPOSE: true will stop door from trying to spring back to the last set open ratio. (Only effective will door unlocked)
NATIVE FUNC BOOL DOOR_SYSTEM_GET_IS_SPRING_REMOVED(int doorEnumHash) = "0xc1a5bd435907950f"

//PARAM NOTES:
//PURPOSE: Get has the spring been removed
NATIVE PROC DOOR_SYSTEM_SET_SPRING_REMOVED(int doorEnumHash, BOOL removeSpring, BOOL network = TRUE, BOOL flushState = FALSE) = "0xf9d6c7efa350cf1d"

//PARAM NOTES:
//PURPOSE: Get has the door been set to hold open
NATIVE FUNC FLOAT DOOR_SYSTEM_GET_IS_HOLDING_OPEN(int doorEnumHash) = "0x0b3c3f3cb7039f8f"

//PARAM NOTES:
//PURPOSE: Get is the door open for races
NATIVE FUNC BOOL DOOR_SYSTEM_GET_DOOR_OPEN_FOR_RACES(int doorEnumHash) = "0xc00251d702757ea3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the door is closed
NATIVE FUNC BOOL IS_DOOR_CLOSED(int doorEnumHash) = "0xbe1365fc512b1f58"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the door has been added to the door system
NATIVE FUNC BOOL IS_DOOR_REGISTERED_WITH_SYSTEM(int doorEnumHash) = "0xec32121f2e3875c8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the door is fully open
NATIVE FUNC BOOL IS_DOOR_FULLY_OPEN(int doorEnumHash) = "0xdc06ae18038d670f"

//INFO: 
//PARAM NOTES:
//	BOOL snapOpen - The doors will snap open if this is set to true
//PURPOSE: Opens all barrier type doors and doors mark to be open for races in the door system 
//		   (Barrier types include BARRIER_ARM, RAIL_CROSSING_BARRIER, BARRIER_ARM_SC and RAIL_CROSSING_BARRIER_SC)
NATIVE PROC OPEN_ALL_BARRIERS_FOR_RACE(BOOL snapOpen = FALSE) = "0x25dc8c12248c3966"

//INFO: 
//PARAM NOTES:
//PURPOSE: Closes all barrier type doors and doors mark to be open for races in the door system 
//		   (Barrier types include BARRIER_ARM, RAIL_CROSSING_BARRIER, BARRIER_ARM_SC and RAIL_CROSSING_BARRIER_SC)
NATIVE PROC CLOSE_ALL_BARRIERS_FOR_RACE() = "0x711d6d89f98ade64"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the physics for the door is loaded.
NATIVE FUNC BOOL DOOR_SYSTEM_GET_IS_PHYSICS_LOADED(int doorEnumHash) = "0x163a0b16532bf618"


//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether the door should always push everything it hits
NATIVE PROC DOOR_SET_ALWAYS_PUSH( int doorEnumHash, BOOL alwaysPush ) = "0x480500aa9e8b631f"


//INFO: 
//PARAM NOTES:
//PURPOSE: If a door is found the function returns true and doorEnumHash is assigned the hash for the found door. 
//         Otherwise the functin returns false.
NATIVE FUNC BOOL DOOR_SYSTEM_FIND_EXISTING_DOOR(VECTOR position, MODEL_NAMES model, INT &doorEnumHash) = "0x733969cd24ac2dd3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Find the nearest building to a point within a radius and set it's anim rate
NATIVE PROC SET_NEAREST_BUILDING_ANIM_RATE(VECTOR VecCentreCoors, FLOAT RADIUS, MODEL_NAMES model, FLOAT Rate, INT Flags) = "0xe5f39e67f337bf33"

//INFO: 
//PARAM NOTES:
//PURPOSE: Find the nearest building to a point within a radius and get it's anim rate
NATIVE PROC GET_NEAREST_BUILDING_ANIM_RATE(VECTOR VecCentreCoors, FLOAT RADIUS, MODEL_NAMES model, INT &ReturnRate) = "0xdd6b1ab4b4acae7e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Find the nearest building to a point within a radius and set it's anim phase
NATIVE PROC SET_NEAREST_BUILDING_ANIM_PHASE(VECTOR VecCentreCoors, FLOAT RADIUS, MODEL_NAMES model, FLOAT Phase, INT Flags) = "0x17818d14b29dc55a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Find the nearest building to a point within a radius and get it's anim phase
NATIVE PROC GET_NEAREST_BUILDING_ANIM_PHASE(VECTOR VecCentreCoors, FLOAT RADIUS, MODEL_NAMES model, INT &ReturnPhase) = "0x371743df03ed7aee"


//~>						Damage commands

//INFO: 
//PARAM NOTES: use networked = TRUE if you wanna get the networked value of this flag. Use only if you know what it does!  
//PURPOSE: Returns true if the object has been broken (ie. fragmented)
NATIVE FUNC BOOL HAS_OBJECT_BEEN_BROKEN ( OBJECT_INDEX ObjectID, BOOL networked = FALSE ) = "0xadebc1d44fe55f78"


ENUM SEARCH_LOCATION_FLAGS
	SEARCH_LOCATION_EXTERIORS = 1,			// 1<<0
	SEARCH_LOCATION_INTERIORS = 2			// 1<<1
ENDENUM

//PARAM NOTES: You can speed things up a bit by only specifying one SEARCH_LOCATION_FLAGS if you know that the object is definitely outside
//	or definitely in an interior. If you don't know then pass SEARCH_LOCATION_EXTERIORS|SEARCH_LOCATION_INTERIORS for the SearchFlags
//PURPOSE: Does a world search and returns TRUE if a broken object with the specified model is found
NATIVE FUNC BOOL HAS_CLOSEST_OBJECT_OF_TYPE_BEEN_BROKEN(VECTOR scrVecCoors, FLOAT Radius, MODEL_NAMES model, SEARCH_LOCATION_FLAGS SearchFlags) = "0x438657bc68985918"

//PARAM NOTES: You can speed things up a bit by only specifying one SEARCH_LOCATION_FLAGS if you know that the object is definitely outside
//	or definitely in an interior. If you don't know then pass SEARCH_LOCATION_EXTERIORS|SEARCH_LOCATION_INTERIORS for the SearchFlags
//PURPOSE: Does a world search and returns TRUE if the closest fraggable object with the specified model has had all breakable bits
//		   broken off.
NATIVE FUNC BOOL HAS_CLOSEST_OBJECT_OF_TYPE_BEEN_COMPLETELY_DESTROYED(VECTOR scrVecCoors, FLOAT Radius, MODEL_NAMES model, SEARCH_LOCATION_FLAGS SearchFlags) = "0xfa14247da5d930c6"

//PARAM NOTES: 
//PURPOSE: Returns true if the object cannot be further broken
NATIVE FUNC BOOL GET_HAS_OBJECT_BEEN_COMPLETELY_DESTROYED(OBJECT_INDEX ObjectID) = "0x1bf1f6d9dc221b91"


//~>                        Area commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if any object's pivot point lies within the sphere with the given radius at the given point
NATIVE FUNC BOOL IS_ANY_OBJECT_NEAR_POINT ( VECTOR point, FLOAT radius, BOOL bConsiderScriptCreatedObjectsOnly = FALSE) = "0x2d3cddf3fe35fca6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if any objects with the name passed have their pivot point within the sphere with the given radius at the given point
NATIVE FUNC BOOL IS_OBJECT_NEAR_POINT ( MODEL_NAMES model, VECTOR point, FLOAT radius ) = "0x6870f49b9937b9d1"


//~>					Map RayFire

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the map ray fire object at given coord in the given radius. 
NATIVE FUNC RAYFIRE_INDEX GET_RAYFIRE_MAP_OBJECT(VECTOR Pos, float fRadius, STRING RayfireName ) = "0x6b3ee0ca145e8488"


//INFO: To set a ray fire object up for the map. If you find the named ray fire object 
//Set its state to RFMO_STATE_PRIMING
//Check that its primed.
//When primed Set its state to CE_STATE_START_ANIM
// Note: script can only set the following rayfire states:
// RFMO_STATE_STARTING
// RFMO_STATE_PRIMING
// RFMO_STATE_START_ANIM   
// RFMO_STATE_ENDING
// RFMO_STATE_RESET
// RFMO_STATE_PAUSED		
// RFMO_STATE_RESUME	 
//PARAM NOTES:
//PURPOSE: Set the state of the map object if found. More info..
NATIVE PROC SET_STATE_OF_RAYFIRE_MAP_OBJECT(RAYFIRE_INDEX RayFireObject, RAY_FIRE_MAP_OBJECT_STATE state ) = "0x288f018bfd3d51ed"
  
//INFO: 
//PARAM NOTES:
//PURPOSE: Get the state of the rayfire map object.
NATIVE FUNC RAY_FIRE_MAP_OBJECT_STATE GET_STATE_OF_RAYFIRE_MAP_OBJECT(RAYFIRE_INDEX RayFireObject ) = "0xd17b3afa40998041"
  
//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that the quiered rayfire object exists. 
NATIVE FUNC BOOL DOES_RAYFIRE_MAP_OBJECT_EXIST (RAYFIRE_INDEX RayFireObject ) = "0xf0254dadd9d91fb8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that the quiered rayfire object exists. 
NATIVE FUNC FLOAT GET_RAYFIRE_MAP_OBJECT_ANIM_PHASE (RAYFIRE_INDEX RayFireObject ) = "0xb0431da36e2aa134"

//PURPOSE: The target rayfire will pause when the animation hits the given phase value
NATIVE PROC PAUSE_RAYFIRE_MAP_OBJECT_AT_PHASE(RAYFIRE_INDEX RayFireObject, FLOAT phase) = "0x29874e719d2e59e7"

//~>						Entity flags

//INFO: 
//PARAM NOTES:
//PURPOSE:  Sets the SUPPRESS_SHADOW flag in the entity, if true then the entity won't cast a shadow
NATIVE PROC SET_ENTITY_FLAG_SUPPRESS_SHADOW(ENTITY_INDEX iEntityID, BOOL bFlag) = "0xb43a82419553a1e8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the RENDER_SMALL_SHADOW flag in the entity, if true then the entity's shadow won't be culled based on screen size
NATIVE PROC SET_ENTITY_FLAG_RENDER_SMALL_SHADOW(ENTITY_INDEX iEntityID, BOOL bFlag) = "0x01a9c9579974823f"

//INFO: 
//PARAM NOTES: OnAllMachines - if set then this will return true only if the garage is empty on all machines in multiplayer
//PURPOSE: Returns TRUE if the Garage has any objects inside or partially inside
NATIVE FUNC BOOL IS_GARAGE_EMPTY(INT GarageHash, BOOL OnAllMachines = TRUE, INT boxIndex = -1) = "0x627ec3ebc804e164"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the player is entirely inside the garage.  If the player is in a vehicle it uses the vehciles bound volume.
NATIVE FUNC BOOL IS_PLAYER_ENTIRELY_INSIDE_GARAGE(INT GarageHash, PLAYER_INDEX playerIndex, FLOAT margin = 0.0, INT boxIndex = -1) = "0x3bbe1aefbffe5646"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the player is entirely outside the garage.  If the player is in a vehicle it uses the vehciles bound volume.
NATIVE FUNC BOOL IS_PLAYER_ENTIRELY_OUTSIDE_GARAGE(INT GarageHash, PLAYER_INDEX playerIndex, FLOAT margin = 0.0, INT boxIndex = -1) = "0xa5e25f9b71a87908"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the player is partially inside the garage.  If the player is in a vehicle it uses the vehciles bound volume.
NATIVE FUNC BOOL IS_PLAYER_PARTIALLY_INSIDE_GARAGE(INT GarageHash, PLAYER_INDEX playerIndex, INT boxIndex = -1) = "0xf2706324c8ce4795"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the entity is entirely inside the garage.
NATIVE FUNC BOOL IS_OBJECT_ENTIRELY_INSIDE_GARAGE(INT GarageHash, ENTITY_INDEX entityIndex, FLOAT margin = 0.0, INT boxIndex = -1) = "0x26b6fbd29e6b5df6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the entity is entirely outside the garage.
NATIVE FUNC BOOL IS_OBJECT_ENTIRELY_OUTSIDE_GARAGE(INT GarageHash, ENTITY_INDEX entityIndex, FLOAT margin = 0.0, INT boxIndex = -1) = "0xd8b483e51cad8cfc"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the entity is partially inside the garage.
NATIVE FUNC BOOL IS_OBJECT_PARTIALLY_INSIDE_GARAGE(INT GarageHash, ENTITY_INDEX entityIndex, INT boxIndex = -1) = "0xe251d6fac6328abf"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if all entities of the specified type are entirely within the garge
NATIVE FUNC BOOL ARE_ENTITIES_ENTIRELY_INSIDE_GARAGE(INT GarageHash, BOOL peds, BOOL vehs, BOOL objs, INT boxIndex = -1) = "0x8f65a904fbec6771"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if any entity of the specified type are entirely within the garge
NATIVE FUNC BOOL IS_ANY_ENTITY_ENTIRELY_INSIDE_GARAGE(INT GarageHash, BOOL peds, BOOL vehs, BOOL objs, INT boxIndex = -1) = "0x57550d67d90afdd6"

//INFO: 
//PARAM NOTES: Broadcast: if set an event is sent over the network in MP to clear the garage on all other machines. Please avoid using this if you can.
//PURPOSE: Clear everything within the garage.
NATIVE PROC CLEAR_GARAGE(INT garageHash, BOOL Broadcast = FALSE) = "0xd3fd4677db79e1d1"

//INFO: 
//PARAM NOTES: Broadcast: if set an event is sent over the network in MP to clear the garage on all other machines. Please avoid using this if you can.
//PURPOSE: Clear objects within the garage.
NATIVE PROC CLEAR_OBJECTS_INSIDE_GARAGE(INT garageHash, BOOL vehicles, BOOL peds, BOOL objects, BOOL Broadcast = FALSE) = "0x22676f5a35047ca3"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns true if saving in the garage is enabled
NATIVE PROC IS_SAVING_ENABLED_FOR_GARAGE(INT garageHash) = "0xeb21b94a7160cc61"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Enables/Disables saving in the garage
NATIVE PROC ENABLE_SAVING_IN_GARAGE(INT garageHash, BOOL enable) = "0x334505b911993b1e"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns true if tidying up in the garage is disabled
NATIVE FUNC BOOL IS_TIDYING_UP_DISABLED_FOR_GARAGE(INT garageHash) = "0xeb1f9fd79915129b"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Enables/Disables tidying up (removing vehicle wrecks) in the garage
NATIVE PROC DISABLE_TIDYING_UP_IN_GARAGE(INT garageHash, BOOL disable) = "0xeaec749a161c79e4"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Closes all the safe house garages. This will store all the vehilces in safe houses.
NATIVE PROC CLOSE_SAFEHOUSE_GARAGES() = "0xb2443d8f4dba9077"


//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns the weapon type from a pickup type. 
NATIVE FUNC WEAPON_TYPE GET_WEAPON_TYPE_FROM_PICKUP_TYPE(PICKUP_TYPE ePickupType) = "0xc6b776ed315b2193"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns the pickup type from a weapon type. 
NATIVE FUNC PICKUP_TYPE GET_PICKUP_TYPE_FROM_WEAPON_HASH(WEAPON_TYPE eWeaponType) = "0xfc53f42ae5bd9601"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns true if the weapon object of the pickup is valid. 
NATIVE FUNC BOOL IS_PICKUP_WEAPON_OBJECT_VALID(OBJECT_INDEX PickupID) = "0xa64dbd522133c8f1"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Sets the tint index on an object
NATIVE PROC SET_OBJECT_TINT_INDEX(OBJECT_INDEX ObjectIndex, INT TintIndex) = "0x71b42d724f2db164"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns the tint index on an object
NATIVE FUNC INT GET_OBJECT_TINT_INDEX(OBJECT_INDEX ObjectIndex) = "0x873082e7f40db44c"


//PURPOSE: Grabs the closest building with the specified model and sets tint index on it.
//	If no object is found in the range or other error, then returns FALSE
NATIVE FUNC BOOL SET_TINT_INDEX_CLOSEST_BUILDING_OF_TYPE(VECTOR scrVecCentreCoors, FLOAT Radius, MODEL_NAMES ObjectModelHashKey, INT tintIndex) = "0xa56ad7cec1ae4c83"

//PURPOSE: Grabs the closest building with the specified model and returns tint index from it.
//	If no object is found in the range or other error, then returns -1
NATIVE FUNC INT GET_TINT_INDEX_CLOSEST_BUILDING_OF_TYPE(VECTOR scrVecCentreCoors, FLOAT Radius, MODEL_NAMES ObjectModelHashKey) = "0x860f1ceecefadac0"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Sets the tint index on an prop object (e.g. parachute)
NATIVE PROC SET_PROP_TINT_INDEX(OBJECT_INDEX ObjectIndex, INT TintIndex) = "0x5352da2e8f114fa9"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns the tint index on prop object (e.g. parachute)
NATIVE FUNC INT GET_PROP_TINT_INDEX(OBJECT_INDEX ObjectIndex) = "0xd2647cb2bf6f11c0"




//INFO: 
//PARAM NOTES: 
//PURPOSE: If enable=TRUE, then overrides light color with (red,green,blue);
//         If enable=FALSE, then disables color override (so light's original color is used)
//         returns TRUE on success (light(s) attached to object were found and set to a new color), otherwise FALSE
NATIVE FUNC BOOL SET_PROP_LIGHT_COLOR(OBJECT_INDEX ObjectIndex, BOOL enable, INT red, INT green, INT blue) = "0x0aeba112bfb0eeb0"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns status of light color override for given object (only for 1st child light)
NATIVE FUNC BOOL IS_PROP_LIGHT_OVERRIDEN(OBJECT_INDEX ObjectIndex) = "0x384da7361ab033f6"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns red component of overriden light color (only for 1st child light), -1 if error
NATIVE FUNC INT GET_PROP_LIGHT_COLOR_RED(OBJECT_INDEX ObjectIndex) = "0x0cf5873c6c5099f2"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns green component of overriden light color (only for 1st child light), -1 if error
NATIVE FUNC INT GET_PROP_LIGHT_COLOR_GREEN(OBJECT_INDEX ObjectIndex) = "0x11311794f44f4271"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns blue component of overriden light color (only for 1st child light), -1 if error
NATIVE FUNC INT GET_PROP_LIGHT_COLOR_BLUE(OBJECT_INDEX ObjectIndex) = "0x7543963afdb844f4"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns red component of original light color (only for 1st child light), -1 if error
NATIVE FUNC INT GET_PROP_LIGHT_ORIG_COLOR_RED(OBJECT_INDEX ObjectIndex) = "0x54a58e7404dec833"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns green component of original light color (only for 1st child light), -1 if error
NATIVE FUNC INT GET_PROP_LIGHT_ORIG_COLOR_GREEN(OBJECT_INDEX ObjectIndex) = "0x7ab3d3e47cf58566"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns blue component of original light color (only for 1st child light), -1 if error
NATIVE FUNC INT GET_PROP_LIGHT_ORIG_COLOR_BLUE(OBJECT_INDEX ObjectIndex) = "0xb4f12b45661b34b6"



//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns the tint index on prop object (e.g. parachute)
NATIVE PROC SET_OBJECT_IS_VISIBLE_IN_MIRRORS(OBJECT_INDEX ObjectIndex, BOOL enable) = "0x9bceec68518a0848"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Sets the speed boost amount on the object
NATIVE PROC SET_OBJECT_SPEED_BOOST_AMOUNT(OBJECT_INDEX ObjectIndex, INT BoostAmount) = "0xe67d071d390bd9d9"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Sets the speed boost amount on the object
NATIVE PROC SET_OBJECT_SPEED_BOOST_DURATION(OBJECT_INDEX ObjectIndex, FLOAT BoostDuration) = "0x9b7ee172fae35099"



//INFO: forces any dummy objects in the specified volume to become real dynamic objects
//PARAM NOTES: centre of sphere, radius of sphere
//PURPOSE: call each frame to (a) prevent intersecting dynamic objects from reverting to dummy
//  state and (b) promote intersecting dummy objects to real dynamic object state even if it is out of range
NATIVE PROC SET_FORCE_OBJECT_THIS_FRAME(VECTOR pos, FLOAT radius) = "0x8e21c2b8d76bd2c7"

//INFO: when script a releases an object, it gets cleaned up automatically when a timer expires and it goes off-screen.
// This command makes it only get cleaned up when it is far away from the player too.
//PARAM NOTES: object index
//PURPOSE: after releasing an object, only clean it up when it is out of drawing range
NATIVE PROC ONLY_CLEAN_UP_OBJECT_WHEN_OUT_OF_RANGE(OBJECT_INDEX ObjectIndex) = "0x13a78fce42e3b132"

//INFO: Returns whether an object exists with the specified decorator
//PARAM NOTES: decorator label to check
//PURPOSE: Used to check for the existance of an object with the specified decorator
NATIVE FUNC OBJECT_INDEX DOES_OBJECT_EXIST_WITH_DECORATOR(STRING DecoratorLabel) = "0xc637d97e669fafac"

//INFO: Disables collisions between all vehicles and all vehicle parachutes
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_DISABLE_COLLISIONS_BETWEEN_CARS_AND_CAR_PARACHUTE(BOOL DisableCollisions) = "0xe4998dcce92adeb9"

//INFO: Makes projectiles, such as grenades, automatically explode when this hit this object
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_PROJECTILES_SHOULD_EXPLODE_ON_CONTACT(OBJECT_INDEX ObjectIndex, BOOL Explode) = "0x73c56b3110244a3b"

//INFO: Sets articulated objects to drive their joint open or closed
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_DRIVE_ARTICULATED_JOINT(OBJECT_INDEX ObjectIndex, BOOL driveOpen, INT JointIndex = 0) = "0xfe483aa70caa8182"

//INFO: Same as the above function but allows the setting of an inflcitor for damage events
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_DRIVE_ARTICULATED_JOINT_WITH_INFLICTOR(OBJECT_INDEX ObjectIndex, BOOL driveOpen, INT JointIndex, ENTITY_INDEX InflictorIndex ) = "0xcb795d4409baec14"
 

//INFO: Sets whether an articulated object behaves as a pressure plate
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_OBJECT_IS_A_PRESSURE_PLATE(OBJECT_INDEX ObjectIndex, BOOL IsPressurePlate) = "0xe04446da0adbbeab"

//INFO: Returns true if the object is a pressure plate and is pressed
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL GET_IS_PRESSURE_PLATE_PRESSED(OBJECT_INDEX ObjectIndex) = "0x5b2c00195589b9f9"


//INFO: Sets whether weapon impacts apply a greater force to this object
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_WEAPON_IMPACTS_APPLY_GREATER_FORCE(OBJECT_INDEX ObjectIndex, BOOL ApplyGreaterForce) = "0xd278f4541b205f55"

//INFO: Returns true if the joint in the object is at its minimum angle
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL GET_IS_ARTICULATED_JOINT_AT_MIN_ANGLE(OBJECT_INDEX ObjectIndex, INT JointIndex = 0) = "0xe90697e735a0e9fe"

//INFO: Returns true if the joint in the object is at its maximum angle
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL GET_IS_ARTICULATED_JOINT_AT_MAX_ANGLE(OBJECT_INDEX ObjectIndex, INT JointIndex = 0) = "0xec2ec59776098a83"

//INFO: Sets whether an object is going to be used as an ariculated prop
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_IS_OBJECT_ARTICULATED(OBJECT_INDEX ObjectIndex, BOOL IsArticulated) = "0x447fadeab88b0db1"
 
//INFO: Sets whether an object is going to be used as a ball
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_IS_OBJECT_BALL(OBJECT_INDEX ObjectIndex, BOOL IsBall) = "0x70c27579df64816f"

//INFO: Sets whether an object will pop vehicle tyres
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_OBJECT_POPS_TYRES(OBJECT_INDEX ObjectIndex, BOOL PopsTyres) = "0x46ed143d558e9590"

//INFO: Sets albedo alpha flag on the object
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_OBJECT_ALBEDO_FLAG(OBJECT_INDEX ObjectIndex, BOOL enable) = "0x0d7c43a3a5850b32"

//INFO: Gets albedo alpha flag from the object
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL GET_OBJECT_ALBEDO_FLAG(OBJECT_INDEX ObjectIndex) = "0xcfc676c358a840ff"

//INFO: Enables/disables global support for rendering of albedo objects
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC ENABLE_GLOBAL_ALBEDO_OBJECTS_SUPPORT(BOOL enable) = "0xe8c6a8e6a6e0bd3b"

