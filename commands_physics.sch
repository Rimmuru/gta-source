
USING "types.sch"


//~>								 Rope Types									<~

ENUM PHYSICS_ROPE_TYPE

	PHYSICS_ROPE_INVALID		= -1,
    PHYSICS_ROPE_THIN			= 0,
    PHYSICS_ROPE_DEFAULT		= 1,
    PHYSICS_ROPE_DEFAULT_32		= 2,
	PHYSICS_ROPE_DEFAULT_WIRE	= 3,
	PHYSICS_ROPE_THIN_WIRE_32	= 4,
	PHYSICS_ROPE_REINS			= 5,
	PHYSICS_ROPE_THIN4			= 6
	
ENDENUM


//~>								 Damping Types								<~

ENUM PHYSICS_DAMPING_TYPE

	PHYSICS_DAMPING_LINEAR_C	= 0, 
	PHYSICS_DAMPING_LINEAR_V	= 1, 
	PHYSICS_DAMPING_LINEAR_V2	= 2, 
	PHYSICS_DAMPING_ANGULAR_C	= 3, 
	PHYSICS_DAMPING_ANGULAR_V	= 4, 
	PHYSICS_DAMPING_ANGULAR_V2	= 5
	
ENDENUM



//~>								 Rope Commands								<~

//~>								 Functions									<~


//INFO:
//PARAM NOTES:
//PURPOSE: Return the coordinates of first rope vertex. If rope wind/unwind first vertex may not be the first physical one.
NATIVE FUNC VECTOR GET_ROPE_FIRST_VERTEX_COORD( ROPE_INDEX ropeID ) = "0x9b8eb32a3bbfa5a1"


//INFO:
//PARAM NOTES:
//PURPOSE: Return the coordinates of last rope vertex. If rope wind/unwind last vertex may not be the last physical one.
NATIVE FUNC VECTOR GET_ROPE_LAST_VERTEX_COORD( ROPE_INDEX ropeID ) = "0x16bdd6f2bcc79411"


//INFO:
//PARAM NOTES:
//PURPOSE: Return the coordinates of specific rope vertex.
NATIVE FUNC VECTOR GET_ROPE_VERTEX_COORD( ROPE_INDEX ropeID, INT vtxIndex ) = "0x7859eabd657d708d"


//INFO:
//PARAM NOTES:
//PURPOSE: Creat rope and return rope's unique ID.
NATIVE FUNC ROPE_INDEX ADD_ROPE( VECTOR pos, VECTOR rot, FLOAT len, PHYSICS_ROPE_TYPE ropeType, FLOAT initialLen = -1.0, FLOAT minLen = 0.5, FLOAT lengthChangeRate = 0.5, BOOL ppuOnly = FALSE, BOOL collisionOn = FALSE, BOOL lockFromFront = TRUE, FLOAT timeMultiplier = 1.0, BOOL breakable = FALSE, STRING materialName = NULL ) = "0xf7c04299e67b897b"


//INFO:
//PARAM NOTES:
//PURPOSE: Return rope's vertex count.
NATIVE FUNC INT GET_ROPE_VERTEX_COUNT( ROPE_INDEX ropeID ) = "0xcd804af23829b282"


//INFO:
//PARAM NOTES:
//PURPOSE: Check if the script the call is made from owns the rope
NATIVE FUNC BOOL DOES_SCRIPT_OWN_ROPE( ROPE_INDEX ropeID ) = "0x1cc33b026a2c4382"


//INFO:
//PARAM NOTES:
//PURPOSE: Check if rope exists
NATIVE FUNC BOOL DOES_ROPE_EXIST( ROPE_INDEX &ropeID ) = "0x20c4e97f4b681ef0"


//INFO:
//PARAM NOTES:
//PURPOSE: Check if rope is attached at both ends. Func return false if rope doesn't exist 
NATIVE FUNC BOOL IS_ROPE_ATTACHED_AT_BOTH_ENDS( ROPE_INDEX &ropeID ) = "0x16336eba6ff583c3"


//INFO:
//PARAM NOTES:
//PURPOSE: Get mass inv scale A on the rope constraint
NATIVE FUNC FLOAT ROPE_GET_CONSTRAINT_MASSINVSCALE_A( ROPE_INDEX &ropeID ) = "0x88178b3412236794"


//INFO:
//PARAM NOTES:
//PURPOSE: Get mass inv scale B on the rope constraint
NATIVE FUNC FLOAT ROPE_GET_CONSTRAINT_MASSINVSCALE_B( ROPE_INDEX &ropeID ) = "0xdcbdf617511e3a4d"


//INFO:
//PARAM NOTES:
//PURPOSE: Return rope distance between start and end of the rope
NATIVE FUNC FLOAT ROPE_GET_DISTANCE_BETWEEN_ENDS( ROPE_INDEX ropeID ) = "0x229d1e7f61d9525f"


//INFO:
//PARAM NOTES:
//PURPOSE: get center of gravity offset
NATIVE FUNC VECTOR GET_CGOFFSET( ENTITY_INDEX entityId ) = "0xed14d2dfe4e6457b"


//~>								 Procedures									<~


//INFO:
//PARAM NOTES:
//PURPOSE: Reset rope length
NATIVE PROC ROPE_RESET_LENGTH( ROPE_INDEX ropeID, BOOL isResetLength ) = "0xf32942ea2762aa8a"


//INFO:
//PARAM NOTES:
//PURPOSE: Force rope length
NATIVE PROC ROPE_FORCE_LENGTH( ROPE_INDEX ropeID, FLOAT len ) = "0x3a5caa1de72a99d8"


//INFO:
//PARAM NOTES:
//PURPOSE: Set mass inv scale A on the rope constraint
NATIVE PROC ROPE_SET_CONSTRAINT_MASSINVSCALE_A( ROPE_INDEX &ropeID, FLOAT massInvScale ) = "0xbde16458dec50519"


//INFO:
//PARAM NOTES:
//PURPOSE: Set mass inv scale B on the rope constraint
NATIVE PROC ROPE_SET_CONSTRAINT_MASSINVSCALE_B( ROPE_INDEX &ropeID, FLOAT massInvScale ) = "0xd674e2c06bbf1858"


//INFO:
//PARAM NOTES:
//PURPOSE: Set smoothreelin on a rope
NATIVE PROC ROPE_SET_SMOOTH_REELIN( ROPE_INDEX ropeID, BOOL bSmoothReelIn ) = "0x77a37eaf6485534f"


//INFO:
//PARAM NOTES: 	ROPE_UPDATE_EARLY	= 0, ROPE_UPDATE_LATE	= 1,	ROPE_UPDATE_WITHSIM	= 2,
//PURPOSE: Set update order of a rope ( i.e. when in the frame the physics update is called )
NATIVE PROC ROPE_SET_UPDATE_ORDER( ROPE_INDEX ropeID, int iUpdateOrder ) = "0x666e1c85e933f6f4"


//INFO:
//PARAM NOTES:
//PURPOSE: Activate entity physics
NATIVE PROC ACTIVATE_PHYSICS( ENTITY_INDEX entityID ) = "0xaa8c46c452582702"


//INFO:
//PARAM NOTES:
//PURPOSE: Set entity damping
NATIVE PROC SET_DAMPING( ENTITY_INDEX entityID, PHYSICS_DAMPING_TYPE dampingType, FLOAT dampingValue ) = "0xe18e3777851d0c80"

//INFO:
//PARAM NOTES:
//PURPOSE: Get entity damping
NATIVE FUNC VECTOR GET_DAMPING( ENTITY_INDEX entityID, PHYSICS_DAMPING_TYPE dampingType ) = "0xfa61c96d55efca2b"


//INFO:
//PARAM NOTES:
//PURPOSE: Enable/disable rope drawing
NATIVE PROC ROPE_DRAW_ENABLED( ROPE_INDEX &ropeID, BOOL isDrawEnabled ) = "0x3b076a2089069f6c"


//INFO:
//PARAM NOTES:
//PURPOSE: Enable/disable rope shadow drawing
NATIVE PROC ROPE_DRAW_SHADOW_ENABLED( ROPE_INDEX &ropeID, BOOL isDrawEnabled ) = "0x789cc2fd07551ca2"


//INFO:
//PARAM NOTES:
//PURPOSE: Delete rope
NATIVE PROC DELETE_ROPE( ROPE_INDEX &ropeID ) = "0x5d6cd3fbca6b7301"


//INFO:
//PARAM NOTES:
//PURPOSE: Delete child rope
NATIVE PROC DELETE_CHILD_ROPE( ROPE_INDEX ropeID ) = "0x880e5061bc41cb4a"


//INFO:
//PARAM NOTES:
//PURPOSE: Break rope into two new ropes and delete/remove the rope if creation of ropeA and ropeB is successful.
NATIVE PROC BREAK_ROPE( ROPE_INDEX &ropeID, ROPE_INDEX &ropeA_ID, ROPE_INDEX &ropeB_ID, FLOAT lenA, FLOAT lenB, FLOAT minLen = 0.5, INT numSections = -1 ) = "0x5411565ea30afd30"


//INFO:
//PARAM NOTES:
//PURPOSE: Load rope verlet data from file
NATIVE PROC LOAD_ROPE_DATA( ROPE_INDEX ropeID, STRING fileName ) = "0xb1ab9201aeca88b6"


//INFO:
//PARAM NOTES:
//PURPOSE: Pin specific vertex from the rope
NATIVE PROC PIN_ROPE_VERTEX( ROPE_INDEX ropeID, INT vtxIndex, VECTOR pos  ) = "0x6a36fc7bd95f1f71"


//INFO:
//PARAM NOTES:
//PURPOSE:
NATIVE PROC INCREASE_ROPE_CONSTRAINT_DISTANCE( ROPE_INDEX ropeID, FLOAT distanceChange ) = "0xad8dc3bf23f1b5bd"


//INFO:
//PARAM NOTES:
//PURPOSE: Start rope winding
NATIVE PROC START_ROPE_WINDING( ROPE_INDEX ropeID ) = "0x870e2d116133e4f9"

//INFO:
//PARAM NOTES:
//PURPOSE: Stop rope winding
NATIVE PROC STOP_ROPE_WINDING( ROPE_INDEX ropeID ) = "0xc4f13fc93388d0df"


//INFO:
//PARAM NOTES:
//PURPOSE: Start rope unwinding from front
NATIVE PROC START_ROPE_UNWINDING_FRONT( ROPE_INDEX ropeID ) = "0x133a8e2f66b92d11"


//INFO:
//PARAM NOTES:
//PURPOSE: Stop rope unwinding from front
NATIVE PROC STOP_ROPE_UNWINDING_FRONT( ROPE_INDEX ropeID ) = "0xf773fb3cb7e958db"


//INFO:
//PARAM NOTES:
//PURPOSE: Start rope unwinding from back
NATIVE PROC START_ROPE_UNWINDING_BACK( ROPE_INDEX ropeID ) = "0x1cd7759a01ed8c49"


//INFO:
//PARAM NOTES:
//PURPOSE: Stop rope unwinding from back
NATIVE PROC STOP_ROPE_UNWINDING_BACK( ROPE_INDEX ropeID ) = "0xabb5da254529a113"


//INFO:
//PARAM NOTES:
//PURPOSE: UnPin specific vertex from the rope
NATIVE PROC UNPIN_ROPE_VERTEX( ROPE_INDEX ropeID, INT vtxIndex ) = "0x09cfbcadf0f31fac"


//INFO:
//PARAM NOTES:
//PURPOSE: Attach virtual geometry bound to the rope
NATIVE PROC ROPE_ATTACH_VIRTUAL_BOUND_GEOM( ROPE_INDEX ropeID, INT boundIdx, VECTOR pt0, VECTOR pt1, VECTOR pt2, VECTOR pt3 ) = "0x062587da74a0aa1c"


//INFO:
//PARAM NOTES:
//PURPOSE: Create virtual capsule bound for the rope
NATIVE PROC ROPE_CREATE_VIRTUAL_BOUND( ROPE_INDEX ropeID, ENTITY_INDEX iEntityID, INT numBounds ) = "0x2abfada14586e29c"


//INFO:
//PARAM NOTES:
//PURPOSE: Attach virtual capsule bound to the rope
NATIVE PROC ROPE_ATTACH_VIRTUAL_BOUND_CAPSULE( ROPE_INDEX ropeID, FLOAT capsuleRadius, FLOAT capsuleLen, INT boundIdx, VECTOR positionOffset ) = "0xd64c3d935024985b"


//INFO:
//PARAM NOTES:
//PURPOSE: Attach virtual geometry bound to the rope
NATIVE PROC ROPE_DETACH_VIRTUAL_BOUND( ROPE_INDEX ropeID ) = "0xeac0f572acb6f83f"


//INFO:
//PARAM NOTES:
//PURPOSE: Pause cloth simulation
NATIVE PROC PAUSE_CLOTH_SIMULATION() = "0xa9f784207b4327fc"


//INFO:
//PARAM NOTES:
//PURPOSE: Unpause cloth simulation
NATIVE PROC UNPAUSE_CLOTH_SIMULATION() = "0x50616112e94822b1"


//INFO:
//PARAM NOTES: Pass 0 to componentPartA and componentPartB if no parts exist or want to attach the rope to the main object/part
//PURPOSE: Attach two entities to a rope. Entities need to be physical.
NATIVE PROC ATTACH_ENTITIES_TO_ROPE( ROPE_INDEX ropeID, ENTITY_INDEX iEntityAID, ENTITY_INDEX iEntityBID, VECTOR worldPositionA, VECTOR worldPositionB, FLOAT ropeLength, INT componentPartA, INT componentPartB, STRING boneNamePartA = NULL, STRING boneNamePartB = NULL ) = "0x3869f781e0645e49"


//INFO:
//PARAM NOTES: Pass 0 to componentPart if no parts exist or want to attach the rope to the main object/part
//PURPOSE: Attach rope to an entity. Entity needs to be physical.
NATIVE PROC ATTACH_ROPE_TO_ENTITY( ROPE_INDEX ropeID, ENTITY_INDEX iEntityID, VECTOR worldPosition, INT componentPart ) = "0x02f4a045919dd893"


//INFO:
//PARAM NOTES:
//PURPOSE: Detach rope from an entity. Rope should have been attached to this entity( not mandatory ).
NATIVE PROC DETACH_ROPE_FROM_ENTITY( ROPE_INDEX ropeID, ENTITY_INDEX iEntityID ) = "0x7efa568576f9adfb"


//INFO:
//PARAM NOTES:
//PURPOSE: set center of gravity offset
NATIVE PROC SET_CGOFFSET( ENTITY_INDEX entityId, VECTOR cgOffset ) = "0x9b28494a72472300"


//INFO:
//PARAM NOTES:
//PURPOSE: set center of gravity at bound center
NATIVE PROC SET_CG_AT_BOUNDCENTER( ENTITY_INDEX entityId ) = "0x4463d0391b1f4e67"


//INFO:
//PARAM NOTES: Use silent to avoid VFX, falling shards and audio
//PURPOSE: on an entity with breakable glass, Breaks any glass panes at impactPosition, in a radius of impactRadius with impulse, damage amount, and using the passed crackType.
NATIVE PROC BREAK_ENTITY_GLASS( ENTITY_INDEX entityId, VECTOR impactPosition, float impactRadius, VECTOR impulse, FLOAT damage, INT crackType, BOOL silent = false ) = "0xbd8adbb181ac4e4f"


// Keep in sync with commands_physics.cpp
CONST_INT CLEAR_MANIFOLDS_EVERY_FRAME		1  // Set physics engine to an interior mode where we clear contacts every frame in order to improve small rolling physics (f.ex. for billiards)
//INFO:
//PARAM NOTES: Bit mask containing bits from the above list
//PURPOSE: Enables special physics modes. Each call starts a short countdown before the mode is disabled again; scripts must call continuously to keep modes enabled.
NATIVE PROC FORCE_EXTRA_PHYSICS( INT extraPhysicsMask ) = "0x13c076fbd4384659"

//INFO: 
//PARAM NOTES:
// entityId - id of prop entity.
//PURPOSE: Returns true if the entity is a frag, you will also need to check that the entity has a current instance is you wish to use SET_DISABLE_BREAKING
NATIVE FUNC BOOL GET_IS_ENTITY_A_FRAG(ENTITY_INDEX entityId) = "0x9e3b5869358b3477"

//INFO:
//PARAM NOTES:
// entityId - id of prop entity. This functionality could be used on vehicles but isn't intended for that and will assert and fail at the moment. 
// disableBreaking - if true, the given entity won't be allowed to break ever. If false, it will override the flag that prevents all fragments of this type from breaking. 
//PURPOSE: Prevent a specific prop from breaking, or, allow a specific prop to break when all other of its type cannot. 
NATIVE PROC SET_DISABLE_BREAKING(ENTITY_INDEX entityId, BOOL disableBreaking) = "0x9b08a23707ebc5ab"

//INFO: 
//PARAM NOTES:
//PURPOSE: Reset the entity's fragment instance breakable status to the default as defined by the tuning data.
NATIVE PROC	RESET_DISABLE_BREAKING (ENTITY_INDEX entityId) = "0x5485f49bbef65cfb"

//INFO:
//PARAM NOTES:
// entityId - id of prop entity. This functionality could be used on vehicles but isn't intended for that and will assert and fail at the moment. 
// disableDamage - if true, the given entity won't be allowed to damage ever. If false, it will override the flag that prevents all fragments of this type from damaging. 
//PURPOSE: Prevent a specific prop from damaging, or, allow a specific prop to break when all other of its type cannot. 
NATIVE PROC SET_DISABLE_FRAG_DAMAGE(ENTITY_INDEX entityId, BOOL disableDamage) = "0x4133f882b7793ee5"

//INFO:
//PARAM NOTES:
// entityId - id of prop entity. 
// useKinematic - if true, the given entity will be treated as having infinite mass when in collisions
//PURPOSE: Prevent an entity from being pushed.
NATIVE PROC SET_USE_KINEMATIC_PHYSICS(ENTITY_INDEX entityId, BOOL useKinematic) = "0xab901be3f45f3b33"

//INFO:
//PARAM NOTES:
//PURPOSE: Starts a physics profile capture.
NATIVE PROC START_PHYSICS_PROFILE_CAPTURE() = "0x11c4e81c5f3b2709"


//INFO:
//PARAM NOTES:
//PURPOSE: 0 - don't set ref frame velocity , 1 - set ref frame velocity A to B, 2 - ref frame velocity B to A
NATIVE PROC ROPE_SET_REFFRAMEVELOCITY_COLLIDERORDER( ROPE_INDEX ropeID, INT colliderOrder) = "0x434e46d8c7756749"


//INFO:
//PARAM NOTES:
//PURPOSE: switch rope script threads ownership
NATIVE PROC ROPE_CHANGE_SCRIPT_OWNER( ROPE_INDEX ropeID, BOOL bScriptHostObject, BOOL bGrabFromOtherScript) = "0x5be8b68dc44472ef"


//INFO:
//PARAM NOTES:
//PURPOSE: convert all ropes attached to this entity to simple ones, detach those from the entity and attach only to static world pos ( the last attach pos to the entity )
NATIVE PROC ROPE_CONVERT_TO_SIMPLE( ENTITY_INDEX entityId ) = "0x8a043068ec9a5a88"

//INFO:
//PARAM NOTES:
//PURPOSE:
NATIVE PROC ROPE_LOAD_TEXTURES() = "0x44395b87a17466e1"

//INFO:
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC BOOL ROPE_ARE_TEXTURES_LOADED() = "0x7cae494c630022d5"

//INFO:
//PARAM NOTES:
//PURPOSE:
NATIVE PROC ROPE_UNLOAD_TEXTURES() = "0xf45e94c02fe9ab19"

//INFO:
//PARAM NOTES:
//PURPOSE: force update rope's pin verts
NATIVE PROC ROPE_SET_UPDATE_PINVERTS( ROPE_INDEX ropeID ) = "0xbc187c1214ec35a1"

//INFO:
//PARAM NOTES:
//PURPOSE:
NATIVE PROC APPLY_IMPULSE_TO_CLOTH( VECTOR posOld, VECTOR posNew, FLOAT impulse ) = "0x7d219e5a58c633cd"

//INFO:
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_IN_STUNT_MODE( BOOL inStuntMod ) = "0xe72a5b55545dd8d4"

//INFO:
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_IN_ARENA_MODE( BOOL inArenaMode ) = "0x57b8667937fda8bc"
