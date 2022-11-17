USING "generic.sch"
USING "material_enums.sch"
USING "model_enums.sch"
USING "types.sch"
USING "eulers.sch"
USING "commands_shapetest.sch"
USING "rel_groups.sch"

ENUM PED_TRANSPORT_MODE
        TM_ANY,                 // Any mode of transport bike, car plane, on foot etc
        TM_ON_FOOT,          	//The ped is on foot
        TM_IN_VEHICLE       	//The ped is in a vehicle not on foot
ENDENUM

ENUM TRAFFICLIGHT_OVERRIDE_MODE
		TLO_RED = 0,
		TLO_AMBER = 1,
		TLO_GREEN = 2,
		TLO_NONE = 3
ENDENUM

ENUM ENTITY_TYPE
		ET_NONE = 0,
		ET_PED = 1,
		ET_VEHICLE = 2,
		ET_OBJECT = 3
ENDENUM

ENUM ANIM_TYPE
	ANIM_SCRIPT = 1,		// Include scripted animations (TASK_PLAY_ANIM, TASK_ACRIPTED_ANIMATION and PLAY_ENTITY_ANIM)
	ANIM_SYNCED_SCENE = 2,	// Include synced scene animations (TASK_SYNCHRONIZED_SCENE and PLAY_SYNCHRONIZED_ENTITY_ANIM)
	ANIM_CODE = 4,			// Include animations being played by code (NOT CURRENTLY SUPPORTED! - see an anim programmer if you need this)
	ANIM_DEFAULT = 3		// Includes scripted and synchronized scene anims by default
ENDENUM

ENUM ENTITY_POPULATION_TYPE
		PT_UNKNOWN = 0,
		PT_RANDOM_PERMANENT = 1,
		PT_RANDOM_PARKED = 2,
		PT_RANDOM_PATROL = 3,
		PT_RANDOM_SCENARIO = 4,
		PT_RANDOM_AMBIENT = 5,
		PT_PERMANENT = 6,
		PT_MISSION = 7,
		PT_REPLAY = 8,
		PT_CACHE = 9,
		PT_TOOL = 10
ENDENUM

CONST_FLOAT INVALID_WORLD_Z -200.0


//~><   ENTITY COMMANDS QUERYING THE STATE OF AN ENTITY   ><~


//INFO: 
//PARAM NOTES:
//PURPOSE: Check that entity exists in the world.
NATIVE FUNC BOOL DOES_ENTITY_EXIST (ENTITY_INDEX EntityIndex) = "0xe5965cdf24f93a9f"

//PURPOSE: Returns TRUE if the entity is owned by the script thread that called this command. Returns FALSE if the entity is not a script 
//			entity or if it is a script entity owned by a different script
NATIVE FUNC BOOL DOES_ENTITY_BELONG_TO_THIS_SCRIPT(ENTITY_INDEX EntityIndex, bool bDeadCheck = TRUE) = "0x930e64cb0285caec"

//INFO: 
//PARAM NOTES:
//PURPOSE: PLAY_ENTITY_ANIM and PLAY_SYNCHRONIZED_ENTITY_ANIM require the entity to have a drawable. You can use this command
//			to check that the entity has a drawable before attempting to play the anim.
NATIVE FUNC BOOL DOES_ENTITY_HAVE_DRAWABLE (ENTITY_INDEX EntityIndex) = "0x8def8d80c66c34d4"

//INFO: Before calling physics commands e.g SET_ENTITY_VELOCITY you have to check that the entity has physics.
//			Physics are streamed in sperateley from the drawable object, though entity physics near the player are streamed
//			in automatically.
//PARAM NOTES:
//PURPOSE: CHecks that an object has physics. More info..
NATIVE FUNC BOOL DOES_ENTITY_HAVE_PHYSICS (ENTITY_INDEX EntityIndex) = "0xbda608a0a83c0961"

//INFO: 
//PARAM NOTES:
//PURPOSE: HAS_ANIM_EVENT_FIRED requires the entity to have a skeleton. You can use this command
//			to check that the entity has a skeleton before calling that command.
NATIVE FUNC BOOL DOES_ENTITY_HAVE_SKELETON (ENTITY_INDEX EntityIndex) = "0x764eb96874effdc1"

//INFO: 
//PARAM NOTES:
//PURPOSE: HAS_ANIM_EVENT_FIRED requires the entity to have an anim director. You can use this command
//			to check that the entity has an anim director before calling that command.
NATIVE FUNC BOOL DOES_ENTITY_HAVE_ANIM_DIRECTOR (ENTITY_INDEX EntityIndex) = "0x2158e81a6af65ea9"

//INFO: This command will only ever return true for anims that hold at the end (i.e. anims that loop or end automatically will always return false)
//PARAM NOTES:
//PURPOSE: Checks if the anim specified is being held on the last frame.  More info..
NATIVE FUNC BOOL HAS_ENTITY_ANIM_FINISHED (ENTITY_INDEX EntityIndex, STRING pAnimDictName, STRING pAnimName, ANIM_TYPE animType = ANIM_DEFAULT ) = "0x91243ffd31a90906"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the last thing to damage the entity was an object. 
NATIVE FUNC BOOL HAS_ENTITY_BEEN_DAMAGED_BY_ANY_OBJECT (ENTITY_INDEX EntityIndex) = "0x5d5890dba617acc7"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns TRUE if the last thing to damage the entity was a ped on foot (not in a car). 
NATIVE FUNC BOOL HAS_ENTITY_BEEN_DAMAGED_BY_ANY_PED (ENTITY_INDEX EntityIndex) = "0xe10b76698e5cf067"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the last thing to damage the entity was a vehicle. 
NATIVE FUNC BOOL HAS_ENTITY_BEEN_DAMAGED_BY_ANY_VEHICLE (ENTITY_INDEX EntityIndex) = "0x344bb7bdbab3823c"

//INFO: 
//PARAM NOTES: Returns TRUE if the last thing to damage the given entity was the given damager entity
//PURPOSE: Returns TRUE if the last thing to damage the given entity was the given damager entity.
//			Will also return true if the damager entity is in a vehicle that damages the 
//          first entity but only if CheckDamagerVehicle is left TRUE
NATIVE FUNC BOOL HAS_ENTITY_BEEN_DAMAGED_BY_ENTITY (ENTITY_INDEX EntityIndex, ENTITY_INDEX DamagerIndex, BOOL CheckDamagerVehicle = TRUE ) = "0x0747e45cff1f74aa"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the entity has a clear line of sight to another entity. If the 2 entities are peds then
// 		   the LOS check is done between the heads of the 2 peds.
CONST_INT LOS_FLAGS_LOS_TO_ENTITY ( SCRIPT_INCLUDE_MOVER | SCRIPT_INCLUDE_OBJECT )
NATIVE FUNC BOOL HAS_ENTITY_CLEAR_LOS_TO_ENTITY (ENTITY_INDEX FirstEntityIndex, ENTITY_INDEX SecondEntityIndex, INT LOSFlags = LOS_FLAGS_LOS_TO_ENTITY ) = "0xd936dbc1d824a1be"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the entity has a clear line of sight to another entity. If the 2 entities are peds then
// 		   the LOS check is done between the heads of the 2 peds.
NATIVE FUNC BOOL HAS_ENTITY_CLEAR_LOS_TO_ENTITY_ADJUST_FOR_COVER (ENTITY_INDEX FirstEntityIndex, ENTITY_INDEX SecondEntityIndex, INT LOSFlags = LOS_FLAGS_LOS_TO_ENTITY ) = "0xce18aacde7f0cda1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the entity has a clear line of sight to another entity, and the second entity is in a 180 sphere in 
// 			front of the first. If the 2 entities are peds then the LOS check is done between the heads of the 2 peds.
NATIVE FUNC BOOL HAS_ENTITY_CLEAR_LOS_TO_ENTITY_IN_FRONT (ENTITY_INDEX FirstEntityIndex, ENTITY_INDEX SecondEntityIndex) = "0xd32ee22119fff87d"

//INFO: 
//PARAM NOTES: This function is only valid for the current frame
//PURPOSE: Checks if the entity has collided with anything this frame. 
NATIVE FUNC BOOL HAS_ENTITY_COLLIDED_WITH_ANYTHING (ENTITY_INDEX EntityIndex) = "0x5c5b446ad691dea2"

//INFO: 
//PARAM NOTES:This function is only valid for the current frame
//PURPOSE: Returns the last material hit by an entity if any, this frame(INVALID_MATERIAL otherwise). Materials should
//         be identified using the enums in material_enums.sch.
NATIVE FUNC MATERIAL_NAMES GET_LAST_MATERIAL_HIT_BY_ENTITY(ENTITY_INDEX EntityIndex) = "0x79ee4cef9ca802b6"

//INFO: 
//PARAM NOTES: This function is only valid for the current frame
//PURPOSE: Returns the collision normal of the last surface hit by an entity if any this frame(zero length vector otherwise).
NATIVE FUNC VECTOR GET_COLLISION_NORMAL_OF_LAST_HIT_FOR_ENTITY(ENTITY_INDEX EntityIndex) = "0xdddea5199d1ba051"

//INFO: The phase of the anim is between 0.0 and 1.0 regardless of the anim length
//PARAM NOTES:
//PURPOSE: Gets the current phase of the anim. More info..
NATIVE FUNC FLOAT GET_ENTITY_ANIM_CURRENT_TIME (ENTITY_INDEX EntityIndex, STRING pAnimDictName, STRING pAnimName) = "0xd01fafce275c94f3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the total anim time in seconds.
NATIVE FUNC FLOAT GET_ENTITY_ANIM_TOTAL_TIME (ENTITY_INDEX EntityIndex, STRING pAnimDictName, STRING pAnimName) = "0xc11da47ac6b1d1e2"

//INFO: Unlike GET_ENTITY_ANIM_TOTAL_TIME above, the anim does not need to be playing on an entity. However, you 
//      must load the anim dictionary prior to calling this, or the command will assert.
//PARAM NOTES:
//PURPOSE: Gets the total length of the anim in seconds. More info...
NATIVE FUNC FLOAT GET_ANIM_DURATION (STRING pAnimDictName, STRING pAnimName) = "0x32ee014e220ced07"

//INFO: 
//PARAM NOTES:	
//PURPOSE: Returns the entity index of the entity this entity is attached to (-1 if is not attached)
NATIVE FUNC ENTITY_INDEX GET_ENTITY_ATTACHED_TO (ENTITY_INDEX EntityIndex) = "0x4f78f44087496a64"

//INFO: 
//PARAM NOTES:  DoDeadCheck - If false then the command will not assert if the entity has not been checked for being dead
//PURPOSE: Gets the co-ordinates of the entity. If a ped, this is at the root bone, and if the ped is
//			in a vehicle then it is the coordinates of the vehicle which are returned. 
NATIVE FUNC VECTOR GET_ENTITY_COORDS (ENTITY_INDEX EntityIndex, BOOL DoDeadCheck = TRUE) = "0x6b62510f212526dc"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC VECTOR GET_ENTITY_FORWARD_VECTOR(ENTITY_INDEX EntityIndex) = "0x63bea94ab58d4e6d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the entity's forward X component.
NATIVE FUNC FLOAT GET_ENTITY_FORWARD_X(ENTITY_INDEX EntityIndex) = "0x760b4486916d9b39"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the vehicles forward Y component 
NATIVE FUNC FLOAT GET_ENTITY_FORWARD_Y(ENTITY_INDEX EntityIndex) = "0x675804aaed494f8a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the entity's heading in degrees. If the entity is a ped in a vehicle, then the heading of the 
//  		vehicle is returned;
NATIVE FUNC FLOAT GET_ENTITY_HEADING (ENTITY_INDEX EntityIndex) = "0x82fe2343f8bdff0b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the entity's heading in degrees. If the entity is a ped in a vehicle, then the heading of the 
//  		vehicle is returned;
NATIVE FUNC FLOAT GET_ENTITY_HEADING_FROM_EULERS (ENTITY_INDEX EntityIndex) = "0xfffdd840fb251a01"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the entity's current health.
NATIVE FUNC INT GET_ENTITY_HEALTH (ENTITY_INDEX EntityIndex) = "0x0cf63873d754b965"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the entity's maximum amount of health.
NATIVE FUNC INT GET_ENTITY_MAX_HEALTH (ENTITY_INDEX EntityIndex) = "0x72649caa101b626c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the entity's maximum amount of health.
NATIVE PROC SET_ENTITY_MAX_HEALTH (ENTITY_INDEX EntityIndex, int Health) = "0x8fbb27c41710f120"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the height of the entity
NATIVE FUNC FLOAT GET_ENTITY_HEIGHT(ENTITY_INDEX EntityIndex, VECTOR Position, BOOL IsWorldPos, BOOL WantWorldResult) = "0x8a6fbb2c8f83ed39"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the entity's height above the ground.
NATIVE FUNC FLOAT GET_ENTITY_HEIGHT_ABOVE_GROUND(ENTITY_INDEX EntityIndex) = "0x07b3d89ed0c66854"

//INFO: 
//PARAM NOTES:	vFront - where to store the entity's front vector
//				vSide  - where to store the entity's side (right hand) vector
//				vUp	   - where to store the entity's up vector
//				vPos   - the entity's position
//PURPOSE: 	Fills out the given vectors with the components of the entity's world transformation matrix.
//			This effectively gives you the forwards, right hand and up unit direction vectors as well as the entity's position
NATIVE PROC GET_ENTITY_MATRIX (ENTITY_INDEX EntityIndex, VECTOR& vFront, VECTOR& vSide, VECTOR& vUp, VECTOR& vPos) = "0xf1282bfc5af4ac08"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the model name for the entity.
NATIVE FUNC MODEL_NAMES GET_ENTITY_MODEL (ENTITY_INDEX EntityIndex) = "0x15caa6d7b11f1a7c"

//INFO: 
//PARAM NOTES:
//PURPOSE:Gets a point described as an offset from that entity and returns the world coordinates of that point
NATIVE FUNC VECTOR GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(ENTITY_INDEX EntityIndex, VECTOR VecNewCoors) = "0xcacad935c0bee14f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets a point and converts its to the entity's local coordinate system
NATIVE FUNC VECTOR GET_OFFSET_FROM_ENTITY_GIVEN_WORLD_COORDS(ENTITY_INDEX EntityIndex, VECTOR VecWorldCoors) = "0x37b78bef7c4625d4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the the pitch of the entity in degrees.
NATIVE FUNC FLOAT GET_ENTITY_PITCH(ENTITY_INDEX EntityIndex) = "0xb8f48796849e41e3"

//INFO: 
//PARAM NOTES:
//PURPOSE:Gets the entity's quaternion
NATIVE PROC GET_ENTITY_QUATERNION (ENTITY_INDEX EntityIndex, FLOAT& ReturnX, FLOAT& ReturnY, FLOAT& ReturnZ, FLOAT& ReturnW) = "0x1d11e13ece77f8dd"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the entity's roll around the Y axis in degrees
NATIVE FUNC FLOAT GET_ENTITY_ROLL (ENTITY_INDEX EntityIndex) = "0x89d8ea6be9e3f747"

//INFO: The angles are between -180 and 180 not between 0 to 360
//PARAM NOTES: 
//PURPOSE: Gets the rotation of an entity. More info..
NATIVE FUNC VECTOR GET_ENTITY_ROTATION (ENTITY_INDEX EntityIndex, EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0x63a8bf5e6c2bf85c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the rotation velocity of an entity
NATIVE FUNC VECTOR GET_ENTITY_ROTATION_VELOCITY (ENTITY_INDEX EntityIndex) = "0x511e2827d5a26942"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the speed an entity is travelling in a forward direction (m/sec). If the entity is a ped in a vehicle, then the 
//			speed of the vehicle is returned; 
NATIVE FUNC FLOAT GET_ENTITY_SPEED (ENTITY_INDEX EntityIndex) = "0x207d53f9e0190691"

//INFO: 
//PARAM NOTES: If the script that created the entity has an instance id, this is returned in InstanceId
//PURPOSE: Gets the name of the script that created the entity.
NATIVE FUNC STRING GET_ENTITY_SCRIPT (ENTITY_INDEX EntityIndex, INT& InstanceId) = "0x24466a99e2719412"

//INFO: 
//PARAM NOTES: bLocalResult gives the result in local coordinates to the entity (x=right, y=forward, z=up)
//PURPOSE: Get velocity vector of an entity. More info 
NATIVE FUNC VECTOR GET_ENTITY_SPEED_VECTOR(ENTITY_INDEX EntityIndex, BOOL bLocalResult=false) = "0x880984103df05f6a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets an up right value  between 1.0 being upright and -1.0 being upside down
NATIVE FUNC FLOAT GET_ENTITY_UPRIGHT_VALUE(ENTITY_INDEX EntityIndex) = "0x90544f2e01a178cd"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the current velocity of the entity. If the entity is a ped in a vehicle, then the 
//			velocity of the vehicle is returned; 
NATIVE FUNC VECTOR GET_ENTITY_VELOCITY(ENTITY_INDEX EntityIndex) = "0xc35fbd95659582c4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Converts an entity index to an object index
NATIVE FUNC OBJECT_INDEX GET_OBJECT_INDEX_FROM_ENTITY_INDEX(ENTITY_INDEX EntityIndex) = "0x1aa24836ea881d77"

//INFO: 
//PARAM NOTES:
//PURPOSE: Converts an entity index to a ped index
NATIVE FUNC PED_INDEX GET_PED_INDEX_FROM_ENTITY_INDEX(ENTITY_INDEX EntityIndex) = "0x28aa31872a651bc7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Converts an entity index to a vehicle index
NATIVE FUNC VEHICLE_INDEX GET_VEHICLE_INDEX_FROM_ENTITY_INDEX(ENTITY_INDEX EntityIndex) = "0x31eb55faeee9c0f5"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the position of a particular bone in an entity in world coordinates.
NATIVE FUNC VECTOR GET_WORLD_POSITION_OF_ENTITY_BONE(ENTITY_INDEX EntityIndex, INT iBoneIdx) = "0x96eda732fd9dc0af"

//INFO: 
//PARAM NOTES:
//PURPOSE: Check if an item is an entity (can be converted to an ENTITY_INDEX).
NATIVE FUNC BOOL IS_AN_ENTITY(ITEM_INDEX obj) = "0x9a39b7e8a645ad2a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the type of the entity (ped, vehicle, or object) or ET_NONE if none of the above.
NATIVE FUNC ENTITY_TYPE GET_ENTITY_TYPE(ENTITY_INDEX EntityIndex) = "0x0fbf5ac4ba2f3447"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the population type of the entity
NATIVE FUNC ENTITY_POPULATION_TYPE GET_ENTITY_POPULATION_TYPE(ENTITY_INDEX EntityIndex) = "0x349120c74cb8b967"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the entity is a ped.
NATIVE FUNC BOOL IS_ENTITY_A_PED (ENTITY_INDEX EntityIndex) = "0x9044edb8a7bf67b4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the entity is a vehicle.
NATIVE FUNC BOOL IS_ENTITY_A_VEHICLE (ENTITY_INDEX EntityIndex) = "0x04d9f44466cbf3ca"

//INFO: Will return false if the entity has been set as no longer needed.
//PARAM NOTES:
//PURPOSE: Checks if the entity has been created by script. More info..
NATIVE FUNC BOOL IS_ENTITY_A_MISSION_ENTITY (ENTITY_INDEX EntityIndex) = "0xa6a089369417736e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the entity is an object.
NATIVE FUNC BOOL IS_ENTITY_AN_OBJECT (ENTITY_INDEX EntityIndex) = "0x0086095f1731de17"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the entity's root is located in the given area defined by a centre point and a locate size. 
//		   If the entity is a ped in a vehicle, then the coords of the vehicle are used in the check. 
NATIVE FUNC BOOL IS_ENTITY_AT_COORD (ENTITY_INDEX EntityIndex, VECTOR VecCoors, VECTOR VecLocDimensions, BOOL HighlightArea = FALSE, BOOL Do3dCheck = TRUE, PED_TRANSPORT_MODE TM_MODE = TM_ANY ) = "0x8f41785f110b0da0"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Checks if the entity is in the area around a vehicle. 
//		   If the entity is a ped in a vehicle, then the coords of the vehicle are used in the check. 
NATIVE FUNC BOOL IS_ENTITY_AT_ENTITY (ENTITY_INDEX EntityIndex, ENTITY_INDEX TargetEntityIndex, VECTOR VecLocDimensions, BOOL HighlightArea = FALSE, BOOL Do3dCheck = TRUE, PED_TRANSPORT_MODE TM_MODE = TM_ANY) = "0x77a43afa9aaec041"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the entity is attached to anything (another entity or the world)
NATIVE FUNC BOOL IS_ENTITY_ATTACHED (ENTITY_INDEX EntityIndex) = "0xe85f749f6d5c809e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the entity is attached to an object
NATIVE FUNC BOOL IS_ENTITY_ATTACHED_TO_ANY_OBJECT (ENTITY_INDEX EntityIndex) = "0xb6c8533a238c4b1e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the entity is attached to a ped
NATIVE FUNC BOOL IS_ENTITY_ATTACHED_TO_ANY_PED (ENTITY_INDEX EntityIndex) = "0x508cdc652f5361b5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the entity is attached to a vehicle
NATIVE FUNC BOOL IS_ENTITY_ATTACHED_TO_ANY_VEHICLE (ENTITY_INDEX EntityIndex) = "0xe2ed785e8db4d3ff"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the entity is attached to the other given entity
NATIVE FUNC BOOL IS_ENTITY_ATTACHED_TO_ENTITY (ENTITY_INDEX EntityIndex1, ENTITY_INDEX EntityIndex2) = "0x099cad293190f449"

//INFO: If the enitiy you are checking is a ped, do not use this check if you are going to give the ped a task.
//Unless you specifially need to know they are dead use IS_PED_INJURED instead. It will also return true if they are dead.
//PARAM NOTES:
//PURPOSE: Checks if the entity is dead. More Info.
NATIVE FUNC BOOL IS_ENTITY_DEAD (ENTITY_INDEX EntityIndex, BOOL bIgnoreVehicleDrowningIfInvincible = FALSE) = "0x55b23fe400fcea6b"

//INFO: 
//PARAM NOTES: This function is only valid for the current frame
//PURPOSE: Checks if the entity is in the air this frame (i.e. not touching the ground). 
NATIVE FUNC BOOL IS_ENTITY_IN_AIR (ENTITY_INDEX EntityIndex) = "0xce282187b0a6217e"

//INFO: 
//PARAM NOTES: VecCoors1 and VecCoors2 define the midpoints of two parallel sides and AreaWidth is the width of these sides.
//PURPOSE: Checks if a ped is in non axis aligned area, defined by coords of a face and distance between faces. More info..
//		   If the entity is a ped in a vehicle, then the coords of the vehicle are used in the check. 
NATIVE FUNC BOOL IS_ENTITY_IN_ANGLED_AREA (ENTITY_INDEX EntityIndex, VECTOR VecCoors1, VECTOR VecCoors2, FLOAT AreaWidth, BOOL HighlightArea = FALSE, BOOL Do3dCheck = TRUE, PED_TRANSPORT_MODE TM_MODE = TM_ANY) = "0xd132edda78ff4a51"

//INFO: 
//PARAM NOTES :
//PURPOSE: Checks if a ped is in the axis aligned area defined by the two coords. 
//		   If the entity is a ped in a vehicle, then the coords of the vehicle are used in the check. 
NATIVE FUNC BOOL IS_ENTITY_IN_AREA (ENTITY_INDEX EntityIndex, VECTOR VecCoors1, VECTOR VecCoors2, BOOL HighlightArea = FALSE, BOOL Do3dCheck = TRUE, PED_TRANSPORT_MODE TM_MODE = TM_ANY) = "0xb950b5d01e8a4868"

//INFO: 
//PARAM NOTES: Zone strings are in
//PURPOSE: Checks if the entity is a specific zone on the map.
//		   If the entity is a ped in a vehicle, then the coords of the vehicle are used in the check. 
NATIVE FUNC BOOL IS_ENTITY_IN_ZONE(ENTITY_INDEX EntityIndex, STRING pZoneLabel) = "0xa07e66961378a6b4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if the entity is in water
//		   If the entity is a ped in a vehicle, then the vehicle is also checked.
NATIVE FUNC BOOL IS_ENTITY_IN_WATER(ENTITY_INDEX EntityIndex) = "0xd8f9df94cd871327"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns a value between 0.0 and 1.0 which indicates the proportion of the entity which is sumberged in water.
NATIVE FUNC FLOAT GET_ENTITY_SUBMERGED_LEVEL(ENTITY_INDEX EntityIndex) = "0x1cc29feb3b8d48e8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set this to true for important entities in missions where you might travel quickly down rivers.
NATIVE PROC SET_ENTITY_REQUIRES_MORE_EXPENSIVE_RIVER_CHECK(ENTITY_INDEX EntityIndex, BOOL FlagValue) = "0x5337c7397bd43696"

//INFO:  THIS COMMAND DOESN'T TAKE GEOMETRY INTO CONSIDERATION! 
//PARAM NOTES:
//PURPOSE: Checks if an entity is on screen.  More info..
NATIVE FUNC BOOL IS_ENTITY_ON_SCREEN(ENTITY_INDEX EntityIndex) = "0xbc7d3edf3455bc35"
	
//INFO: 
//PARAM NOTES:
//PURPOSE:Checks if the entity is currently playing the animation.
NATIVE FUNC BOOL IS_ENTITY_PLAYING_ANIM( ENTITY_INDEX EntityIndex, STRING AnimDictName, STRING AnimName, ANIM_TYPE type = ANIM_DEFAULT) = "0xfcf559c8631abed7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if an entity has no active physics
NATIVE FUNC BOOL IS_ENTITY_STATIC ( ENTITY_INDEX EntityIndex ) = "0x23cb5c83d3766044"

//INFO: 
//PARAM NOTES: This command is only valid for the current frame
//PURPOSE: Checks that 2 entities are intersecting each other this frame. 
//		   If any of the entities are peds in a vehicle, then the vehicle is used in the check. 
NATIVE FUNC BOOL IS_ENTITY_TOUCHING_ENTITY(ENTITY_INDEX FirstEntityIndex, ENTITY_INDEX SecondEntityIndex) = "0x72f6ae51b7e34865"

//INFO: 
//PARAM NOTES: This command is only valid for the current frame
//PURPOSE: Checks that an entity is touching a model type. 
NATIVE FUNC BOOL IS_ENTITY_TOUCHING_MODEL(ENTITY_INDEX EntityIndex, MODEL_NAMES ModelHashKey) = "0x15198bc2115f8dc9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the entity is upright within a define angle limit.
NATIVE FUNC BOOL IS_ENTITY_UPRIGHT(ENTITY_INDEX EntityIndex, FLOAT fAngleToVerticalLimit = 90.0) = "0xefd1745e9d77e91c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the entity is upsidedown
NATIVE FUNC BOOL IS_ENTITY_UPSIDEDOWN(ENTITY_INDEX EntityIndex) = "0x68c47642183f091a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if an entity's IS_VISIBLE flag is set, i.e. whether it's being explicitly hidden (by code or script) or not.
//         Note that this function returns true for all entities that have their IS_VISIBLE flag set,
//         even those that aren't actually visible from the current camera (i.e. they are outside
//         the view frustum or behind occluders).
NATIVE FUNC BOOL IS_ENTITY_VISIBLE ( ENTITY_INDEX EntityIndex ) = "0x2b5f4fbaf644bec8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if an entity has been set invisible by script. An entity may still be invisible via other means (code, etc), but this command
//         only checks the script visibility state.
NATIVE FUNC BOOL IS_ENTITY_VISIBLE_TO_SCRIPT ( ENTITY_INDEX EntityIndex ) = "0x4a1ea713628c49d4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if an entity wouldn't be rendered with the current camera, i.e. it is outside the view frustum or it is behind an occluder
NATIVE FUNC BOOL IS_ENTITY_OCCLUDED ( ENTITY_INDEX EntityIndex ) = "0x4d21c9fb671ed18f"

//INFO: 
//PARAM NOTES:	bAssertIfModelIsntLoaded - If the model isn't loaded and bAssertIfModelIsntLoaded is TRUE then the game will assert and return FALSE.
//											If the model isn't loaded and bAssertIfModelIsntLoaded is FALSE then the game will return FALSE (without asserting).
//PURPOSE: Checks whether an entity created with the given model and position would be visible with the current camera
NATIVE FUNC BOOL WOULD_ENTITY_BE_OCCLUDED ( MODEL_NAMES ModelHashKey, VECTOR Coords, BOOL bAssertIfModelIsntLoaded = TRUE ) = "0x91194f9ab8ba4e66"

//INFO: 
//PARAM NOTES:
//PURPOSE: Cheks if the entity is waiting for world collision to stream in.
NATIVE FUNC BOOL IS_ENTITY_WAITING_FOR_WORLD_COLLISION(ENTITY_INDEX EntityIndex) = "0x301c07463034c65f"

//INFO:
//PARAM NOTES: VecCoors1 and VecCoors2 define the midpoints of two parallel sides and AreaWidth is the width of these sides.
//PURPOSE: Checks if a given point is in the non axis aligned area
//NATIVE FUNC BOOL IS_POINT_IN_ANGLED_AREA ( VECTOR VecPoint, VECTOR VecCoors1, VECTOR VecCoors2, FLOAT AreaWidth, BOOL HighlightArea = FALSE,  BOOL bCheck3D = TRUE)



//~><   ENTITY COMMANDS MODIFYING THE STATE OF AN ENTITY   ><~

//INFO: 
//PARAM NOTES:APPLY_FORCE_TYPE see enum, doesn't accept APPLY_TYPE_EXTERNAL_FORCE
//				Vector force to be applied 
//				Component: Component of the entity to apply the force too - only matters for breakable or articulated (ragdoll) physics. 
//								0 means the root or parent component. I'll add an enum list for the components of a ragdoll, but for other entities such as fragment objects 
//								you'll need to check with CJ or me to find out which component you want to apply a force to if you want to, for example, break off the leg of a chair.
//
//							***WARNING: if the command is being called on a ped, the component passed in is one returned from GET_PED_RAGDOLL_BONE_INDEX, not GET_PED_BONE_INDEX *** 
//
//				LocalForce: Specifies whether the force vector passed in is in local or world coordinates. Local coordinates (TRUE) means the force will get automatically 
//								transformed into world space before being applied. 
//				ScaleByMass: Specifies whether to scale the force by mass.
//								TRUE force will be multiplied by mass, ie Force passed in is in fact an acceleration rate in m/s*s (force) or velocity change in m/s(impulse)
//								FALSE force will be applied directly and it's effect will depend on the mass of the object, ie Force passed in is a proper force in Newtons (force) or a step change in momentum kg*m/s (impulse)
//								In other words, scaling by mass is probably easier in most situations - if the mass of the object changes it's behaviour shouldn't, and it's easier to picture the effect because an acceleration rate of 10.0
//								is approximately the same as gravity (9.81 to be more precise). 
//PURPOSE: Apply a force to an entity. More info..
NATIVE PROC APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(ENTITY_INDEX EntityIndex, APPLY_FORCE_TYPE ApplyType, VECTOR vForce, INT Component, BOOL LocalForce, BOOL ScaleByMass, BOOL applyToChildren = FALSE ) = "0x57ffaa29e06177f6"

//INFO: 
//PARAM NOTES:APPLY_FORCE_TYPE see enum
//				Vector force to be applied 
//				vOffset: Offset from centre of entity at which to apply force 
//				Component: Component of the entity to apply the force too - only matters for breakable or articulated (ragdoll) physics. 
//								0 means the root or parent component. I'll add an enum list for the components of a ragdoll, but for other entities such as fragment objects 
//								you'll need to check with CJ or me to find out which component you want to apply a force to if you want to, for example, break off the leg of a chair.
//
//							***WARNING: if the command is being called on a ped, the component passed in is one returned from GET_PED_RAGDOLL_BONE_INDEX, not GET_PED_BONE_INDEX *** 
//
//				LocalForce: Specifies whether the force vector passed in is in local or world coordinates. Local coordinates (TRUE) means the force will get automatically 
//								transformed into world space before being applied. 
//				LocalOffset: Specifies whether the offset passed in is in local or world coordinates. 
//				ScaleByMass: Specifies whether to scale the force by mass.
//								TRUE force will be multiplied by mass, ie Force passed in is in fact an acceleration rate in m/s*s (force) or velocity change in m/s(impulse)
//								FALSE force will be applied directly and it's effect will depend on the mass of the object, ie Force passed in is a proper force in Newtons (force) or a step change in momentum kg*m/s (impulse)
//								In other words, scaling by mass is probably easier in most situations - if the mass of the object changes it's behaviour shouldn't, and it's easier to picture the effect because an acceleration rate of 10.0
//				TriggerAudio: Specifies whether to play audio events related to the force being applied.
//								The audio will depend on the entity type. Currently vehicles are the only entity types supported, and will play a suspension squeal depending on the magnitude
//								of the force
//PURPOSE: Apply a force to an entity. More info..
NATIVE PROC APPLY_FORCE_TO_ENTITY(ENTITY_INDEX EntityIndex, APPLY_FORCE_TYPE ApplyType, VECTOR vForce, VECTOR vOffset, INT Component, BOOL LocalForce, BOOL LocalOffset, BOOL ScaleByMass, BOOL triggerAudio = FALSE, BOOL ScaleByTimeWarp = TRUE) = "0x3f6de6dba9a99fea"
	
//INFO:  None physical attachment - collision is turned off for entity. 
//PARAM NOTES: SecondEntityBoneIndex - use 0 for the skeleton root or -1 for entity matrix. Can attach to any bone on the parent - eg attach to ped's hand, attach to car's door 
//				vecOffset - is from the root of the bone you're attaching to (the entity's position if bone=0) 
//				vecRotation - is used to build a rotation matrix, relative to the bone you're attaching too (the entity itself if bone=0)
//				bDetachWhenDead - detaches the ped when he dies (this is only used by peds)
//				bDetachWhenRagdoll - detaches the ped when he ragdolls (this is only used by peds)
//				bActiveCollisions - leave the collisions activated on the attached object
//				bUseBasicAttachIfPed - This forces a path, even for peds, that will use all three rotation components
// EG: To Get A Bone Index from a bonetag: GET_PED_BONE_INDEX(PLAYER_PED_ID(), BONETAG_L_HAND)
//PURPOSE: Attaches an entity to another entity with a non physical attachement. More info..
NATIVE PROC ATTACH_ENTITY_TO_ENTITY ( ENTITY_INDEX FirstEntityIndex, ENTITY_INDEX SecondEntityIndex, INT SecondEntityBoneIndex, VECTOR vecOffset, VECTOR vecRotation, BOOL bDetachWhenDead = FALSE, BOOL bDetachWhenRagdoll = FALSE, BOOL bActiveCollisions = FALSE, BOOL bUseBasicAttachIfPed = FALSE, EULER_ROT_ORDER RotOrder = EULER_YXZ, BOOL bAttachOffsetIsRelative = TRUE, BOOL bMarkAsNoLongerNeededWhenDetached = FALSE ) = "0x9a97dc6dbc7b223d"

//INFO:  None physical attachment - collision is turned off for entity. 
//PARAM NOTES: FirstEntityBoneIndex - refers to the bone on the first entity which is being attached. 
//			   SecondEntityBoneIndex - refers to the bone on the second entity that you're attaching the first entity to. 
//				DoInitialWarp - ** NOT USED FOR PEDS** specifies whether to warp the object to the specified attach point. If not, then the initial seperation will be used as an allowed give in the attachment (e.g. a rope length)
//				CollideWithEntity - ** ONLY USED FOR PEDS** of set the two entities will collide with each other once attached
//PURPOSE: Attaches an entity to another entity using a none physical attachment.
NATIVE PROC ATTACH_ENTITY_BONE_TO_ENTITY_BONE( ENTITY_INDEX FirstEntityIndex, ENTITY_INDEX SecondEntityIndex, INT FirstEntityBoneIndex, INT SecondEntityBoneIndex, BOOL DoInitialWarp = TRUE, bool CollideWithEntity = FALSE) = "0x93c635be37089a75"

//INFO:  Same as the above function but assumes that the bone is facing along the y axis
//PARAM NOTES: FirstEntityBoneIndex - refers to the bone on the first entity which is being attached. 
//			   SecondEntityBoneIndex - refers to the bone on the second entity that you're attaching the first entity to. 
//				DoInitialWarp - ** NOT USED FOR PEDS** specifies whether to warp the object to the specified attach point. If not, then the initial seperation will be used as an allowed give in the attachment (e.g. a rope length)
//				CollideWithEntity - ** ONLY USED FOR PEDS** of set the two entities will collide with each other once attached
//PURPOSE: Attaches an entity to another entity using a none physical attachment.
NATIVE PROC ATTACH_ENTITY_BONE_TO_ENTITY_BONE_Y_FORWARD( ENTITY_INDEX FirstEntityIndex, ENTITY_INDEX SecondEntityIndex, INT FirstEntityBoneIndex, INT SecondEntityBoneIndex, BOOL DoInitialWarp = TRUE, bool CollideWithEntity = FALSE) = "0xc2e0445c5728de31"


//INFO: Physical attachment using rage constraints - entities are still physically active in the world. 
//PARAM NOTES: FirstEntityBoneIndex - refers to the bone on the first entity which is being attached. 
//			   SecondEntityBoneIndex - refers to the bone on the second entity that you're attaching the first entity to. 
//							This lets us attach for example, a ped's hand (ragdoll) to a car door. Some objects are fragment objects, and have a skeleton with multiple pieces that break apart, and this may be useful for them. 
//				Note: Is is not a mistake currently that the second offset comes before the first.
//				SecondEntityOffset - the offset from the root of the bone on the the first entity.
//				FirstEntityOffset - the offset from the root of the bone on the the second entity.
//								It gets a bit tricky to work out the offsets here, but you may want to have an object hanging from it's end rather than from it's centre point so you need the offset on the object. 
//				vecRotation - is used to build a rotation matrix, relative to the bone you're attaching too (the entity itself if bone=0)
//				ConstrainRotation - specifies whether you wish to constrain rotation as well as position. In most cases the answer will be Yes. Unless you want to have a hanging/swinging thing.
//				DoInitialWarp - ** NOT USED FOR PEDS** specifies whether to warp the object to the specified attach point. If not, then the initial seperation will be used as an allowed give in the attachment (e.g. a rope length)
//				CollideWithEntity - ** ONLY USED FOR PEDS** of set the two entities will collide with each other once attached
//PURPOSE: Attaches an entity to another entity using a physical attachment. More info..
NATIVE PROC ATTACH_ENTITY_TO_ENTITY_PHYSICALLY ( ENTITY_INDEX FirstEntityIndex, ENTITY_INDEX SecondEntityIndex, INT FirstEntityBoneIndex, INT SecondEntityBoneIndex, VECTOR SecondEntityOffset, VECTOR FirstEntityOffset, VECTOR vecRotation, FLOAT PhysicalStrength, BOOL ConstrainRotation, BOOL DoInitialWarp = TRUE, bool CollideWithEntity = FALSE, BOOL AddInitialSeperation = TRUE, EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0xd1dfcb46f41425eb"

NATIVE PROC ATTACH_ENTITY_TO_ENTITY_PHYSICALLY_OVERRIDE_INVERSE_MASS ( ENTITY_INDEX FirstEntityIndex, ENTITY_INDEX SecondEntityIndex, INT FirstEntityBoneIndex, INT SecondEntityBoneIndex, VECTOR SecondEntityOffset, VECTOR FirstEntityOffset, VECTOR vecRotation, FLOAT PhysicalStrength, BOOL ConstrainRotation, BOOL DoInitialWarp = TRUE, bool CollideWithEntity = FALSE, BOOL AddInitialSeperation = TRUE, EULER_ROT_ORDER RotOrder = EULER_YXZ, FLOAT invMassScaleA = 1.0, FLOAT invMassScaleB = 1.0 ) = "0x134d25a048863393"


//INFO: 
//PARAM NOTES: Strength: a medium strength value is 500
//PURPOSE: Attaches an entity to an object with a physical attachment. More info..
NATIVE PROC ATTACH_ENTITY_TO_WORLD_PHYSICALLY  (ENTITY_INDEX FirstEntityIndex, INT EntityBoneIndex, VECTOR vecWorldPosition, VECTOR vecOffsetFromBone, FLOAT fStrength, BOOL bFixRotation, FLOAT fRotMinX = 0.0, FLOAT fRotMinY = 0.0, FLOAT fRotMinZ = 0.0, FLOAT fRotMaxX = 0.0, FLOAT fRotMaxY = 0.0, FLOAT fRotMaxZ = 0.0) = "0xb5efa5253ad6dc74"

//INFO: Physical attachment using rage constraints
//PARAM NOTES:	EntityIndex - refers to the bone on the entity that owns the bones. 
//				FirstEntityBoneIndex - refers to the first bone on the entity which is being attached. 
//				SecondEntityBoneIndex - refers to the second bone on the entity that you're attaching the first bone to.
//				FirstEntityOffset - the offset from the root of the first bone on the the entity. 
//				SecondEntityOffset - the offset from the root of the second bone on the the entity.
//PURPOSE: Attach a bone on an entity to another bone on the entity with a physical constraint   
NATIVE PROC ATTACH_ENTITY_BONE_TO_BONE_PHYSICALLY(ENTITY_INDEX EntityIndex, INT FirstBoneIndex, INT SecondBoneIndex, VECTOR FirstBoneOffset, VECTOR SecondBoneOffset, FLOAT fMaxDistance = 0.1) = "0xf6d171db025f64f0"

//INFO: Update an entities attachments immediately
//PARAM NOTES:	EntityIndex - The entity to update attachments on.
//PURPOSE:	Updates the position of an attached entity (And all of its children) immediately, so that up to date entity and child entity positions can be grabbed. Also updates the position of the entity within a synchronized scene.
NATIVE PROC PROCESS_ENTITY_ATTACHMENTS(ENTITY_INDEX EntityIndex) = "0xed905e75bf9b3a2e"

//INFO: 
//PARAM NOTES: Returns the bone index if found, -1 otherwise. Therefore you should always check that the bone index is NOT equal to -1 before using it.
//PURPOSE: Use when you know the name of a bone and want the bone index for passing to one of the many attach commands.
NATIVE FUNC INT GET_ENTITY_BONE_INDEX_BY_NAME(ENTITY_INDEX EntityIndex, STRING BoneName) = "0x7f0054a115d66f44"

//INFO:  
//PARAM NOTES:
//PURPOSE: Clears the last damage that has been applied to an entity
NATIVE PROC CLEAR_ENTITY_LAST_DAMAGE_ENTITY(ENTITY_INDEX EntityIndex) = "0xe68645525d451a8b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Deletes an entity instantly from the world. 
NATIVE PROC DELETE_ENTITY(ENTITY_INDEX &EntityIndex) = "0x531055a66e7a812c"

NATIVE PROC DELETE_PED(PED_INDEX &PedIndex) = "0x05cb75c0837196f9"
NATIVE PROC DELETE_VEHICLE(VEHICLE_INDEX &VehicleIndex) = "0xd59cc8123fd1a789"
NATIVE PROC DELETE_OBJECT(OBJECT_INDEX &ObjectIndex) = "0x4bda5afd88c085eb"


//INFO: 
//PARAM NOTES:
//PURPOSE: Detaches an entity from being attached. ApplyVelocity is not used for peds. bNoCollisionUntilClear is only used for peds and objects.
//PARAM NOTES: 
//		bNoCollisionUntilClear - disables collision between this object and the parent until they are clear of one anotherNATIVE PROC DETACH_ENTITY(ENTITY_INDEX EntityIndex, bool 
NATIVE PROC DETACH_ENTITY(ENTITY_INDEX EntityIndex, bool ApplyVelocity=TRUE, bool bNoCollisionUntilClear=TRUE) = "0xe6451c2f193342c7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Freezes the entity position so that it wont be affected by the world physics.
NATIVE PROC FREEZE_ENTITY_POSITION(ENTITY_INDEX EntityIndex, BOOL FrozenByScriptFlag) = "0x5c65dddc219b3aa5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Controls whether an entity should be allowed to have its physics frozen if collision hasn't streamed in around its position.
NATIVE PROC SET_ENTITY_SHOULD_FREEZE_WAITING_ON_COLLISION(ENTITY_INDEX EntityIndex, BOOL ShouldFreeze) = "0x398c962f550cf3b4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns whether the allow freeze waiting on collision flag is set.
NATIVE FUNC BOOL GET_IS_ALLOW_FREEZE_WAITING_ON_COLLISION_SET(ENTITY_INDEX EntityIndex) = "0x6a1fddb971d4baa1"


//INFO: 
//PARAM NOTES:
//PURPOSE:	Forces the entities ai and animation to be processed again this frame. This command is expensive and must be used sparingly!
//			Its primary purpose is to update entity animations immediately on the first frame of a scripted cut scene (where a camera cut is being used).
NATIVE PROC FORCE_ENTITY_AI_AND_ANIMATION_UPDATE(ENTITY_INDEX EntityIndex) = "0xec5cb2a3f2052039"

//INFO: 
//PARAM NOTES:
//PURPOSE: Play an entity anim.
//PARAM NOTES: DriveToPose - enable drive-to-pose for the animation (object must be setup with articulation for this to work)
NATIVE FUNC BOOL PLAY_ENTITY_ANIM ( ENTITY_INDEX EntityIndex, STRING AnimName, STRING AnimDictName, FLOAT BlendDelta, BOOL Loop, BOOL HoldLastFrame, BOOL DriveToPose = FALSE, FLOAT StartPhase = 0.0, INT AnimFlags = 0 ) = "0xf07805ffbf204ed8"

//INFO: Use this to add an entity with a specifically authored anim to a synchronized scene created with CREATE_SYNCHRONIZED_SCENE 
//		Note: as part of this process the entity's collision will be deactivated. To turn it back on again, use SET_ENTITY_COLLISION or pass
//			  a true value to the ActivateCollision parameter of STOP_SYNCHRONISED_ENTITY_ANIM.
//PARAM NOTES:	EntityIndex - The entity to play the synced anim on.
//				SceneID - 	The scene to attach the entity to.
//				AnimName - 	The name of the paired anim to play.
//				AnimDictName The name of the anim dictionary the anim is in
//				BlendInDelta - the rate at which the task will blend in 
//				The blend in duration is 1.0 / BlendInDelta e.g. 1.0 / NORMAL_BLEND_IN -> 1.0 / 8.0 = 0.125 seconds 
//				BlendOutDelta - the rate at which the task will blend out
//				The blend out duration is -1.0 / BlendOutDelta e.g. -1.0 / NORMAL_BLEND_OUT -> -1.0 / -8.0 = 0.125 seconds
//				Flags - The synced scene flags to use (see commands_task.sch - SYNCED_SCENE_FLAGS)
//				MoverBlendInDelta - the rate at which the mover blends in to the scene. This can be usefull for seamless entry onto a synced scene. (e.g. NORMAL_BLEND_IN - see commands_task.sch)
//PURPOSE: Play a synchronized anim on the entity using the synchronized scene provided. more info...
NATIVE FUNC BOOL PLAY_SYNCHRONIZED_ENTITY_ANIM ( ENTITY_INDEX EntityIndex, INT SceneId, STRING AnimName, STRING AnimDictName, FLOAT BlendInDelta, FLOAT BlendOutDelta = 8.0, INT Flags=0, FLOAT MoverBlendInDelta = 1000.0 ) = "0xaa8557afe4a4a184"


//INFO: Use this to add an entity with a specifically authored anim to a synchronized scene created with CREATE_SYNCHRONIZED_SCENE 
//		Note: as part of this process the entity's collision will be deactivated. To turn it back on again, use SET_ENTITY_COLLISION or pass
//			  a true value to the ActivateCollision parameter of STOP_SYNCHRONISED_ENTITY_ANIM.
//PARAM NOTES:	EntityIndex - The entity to play the synced anim on.
//				SceneID - 	The scene to attach the entity to.
//				AnimName - 	The name of the paired anim to play.
//				AnimDictName The name of the anim dictionary the anim is in
//				BlendInDelta - the rate at which the task will blend in 
//				The blend in duration is 1.0 / BlendInDelta e.g. 1.0 / NORMAL_BLEND_IN -> 1.0 / 8.0 = 0.125 seconds 
//				BlendOutDelta - the rate at which the task will blend out 
//				The blend out duration is -1.0 / BlendOutDelta e.g. -1.0 / NORMAL_BLEND_OUT -> -1.0 / -8.0 = 0.125 seconds
//				Flags - The synced scene flags to use (see commands_task.sch - SYNCED_SCENE_FLAGS)
//				MoverBlendInDelta - the rate at which the mover blends in to the scene. This can be usefull for seamless entry onto a synced scene. (e.g. NORMAL_BLEND_IN - see commands_task.sch)
//PURPOSE: Play a synchronized anim on the map entity using the synchronized scene provided. more info...
NATIVE FUNC BOOL PLAY_SYNCHRONIZED_MAP_ENTITY_ANIM ( Vector Pos, FLOAT Radius, MODEL_NAMES  ModelHash, INT SceneId, STRING AnimName, STRING AnimDictName, FLOAT BlendDelta, FLOAT BlendOutDelta = -8.0, INT Flags=0, FLOAT MoverBlendInDelta = 1000.0 ) = "0xb7dda95ccbc190a3"


//INFO: 
//PARAM NOTES:
//PURPOSE: Stops an entity anim.
NATIVE FUNC BOOL STOP_ENTITY_ANIM ( ENTITY_INDEX EntityIndex, STRING AnimName, STRING AnimDictName, FLOAT BlendDelta ) = "0xa02157241423f32e"

//INFO: Use this to remove an entity from a synchronized scene
//PARAM NOTES:	EntityIndex - The entity to stop syncing an anim on.
//				BlendDelta - The speed at which the synchronized anim should blend out.
//				ActivateCollision - If true, the entity's collision will be activated
//PURPOSE: Stops playing a synchronized anim on the entity. more info...
NATIVE FUNC BOOL STOP_SYNCHRONIZED_ENTITY_ANIM ( ENTITY_INDEX EntityIndex, FLOAT BlendDelta, BOOL ActivateCollision ) = "0xa5d8ba53953077c8"

//INFO: Use this to remove an entity from a synchronized scene
//PARAM NOTES:	EntityIndex - The entity to stop syncing an anim on.
//				BlendDelta - The speed at which the synchronized anim should blend out.
//				ActivateCollision - If true, the entity's collision will be activated
//PURPOSE: Stops playing a synchronized anim on the entity. more info...
NATIVE FUNC BOOL STOP_SYNCHRONIZED_MAP_ENTITY_ANIM ( Vector Pos, FLOAT Radius, MODEL_NAMES  ModelHash, FLOAT BlendDelta ) = "0xbd673c6a813ec48e"

//INFO: Use this to check if a particyular event tag is present in an animation playing on the entity this frame
//		Some events are instantaneous (so this will only return true once). Others may have duration, which means that
//		this function may continuously return true for a range of values. The event must have been tagged with the VisibleToScript attribute
//		to make it detectable with this command. Events can include one or more attributes of different types that can be used 
//		to get data from the animation. To get the value of an attribute, use the GET_X_ATTRIBUTE_FROM_ANIM_EVENT commands below.
//PARAM NOTES:	EntityIndex - The entity search for anim events
//				EventHash - The hash of the event name to search for.
//PURPOSE: Searches the entity for an animation event. more info...
NATIVE FUNC BOOL HAS_ANIM_EVENT_FIRED ( ENTITY_INDEX EntityIndex, INT EventHash ) = "0xd9e56ec8ed04e45e"

//INFO: Use this to find an event tag in an animation and get it's start and end phase.
//PARAM NOTES:	pAnimDictName - The anim dictionary name
//				pAnimName - The anim name
//				pEventName - The event name
//				SearchStartPhase - Phase to start searching for the event tag
//				SearchEndPhase - Phase to stop searching for the event tag
//				ReturnStartPhase - If the event tag is found, it's start phase will be filled in here.
//				ReturnEndPhase - If the event tag is found, it's end phase will be filled in here.
//				Returns true if the event tag is found, otherwise false.
//PURPOSE: Searches an animation for the start and end phase of an event. more info...
NATIVE FUNC BOOL FIND_ANIM_EVENT_IN_PHASE_RANGE ( STRING pAnimDictName, STRING pAnimName, STRING pEventName, FLOAT SearchStartPhase, FLOAT SearchEndPhase, FLOAT& ReturnStartPhase, FLOAT& ReturnEndPhase ) = "0xc0e629b38e673c59"

//INFO: Use this to find an event tag in an animation and get it's start and end phase.
//PARAM NOTES:	pAnimDictName - The anim dictionary name
//				pAnimName - The anim name
//				pEventName - The event name
//				ReturnStartPhase - If the event tag is found, it's start phase will be filled in here.
//				ReturnEndPhase - If the event tag is found, it's end phase will be filled in here.
//				Returns true if the event tag is found, otherwise false.
//PURPOSE: Searches an animation for the start and end phase of an event. more info...
NATIVE FUNC BOOL FIND_ANIM_EVENT_PHASE ( STRING pAnimDictName, STRING pAnimName, STRING pEventName, FLOAT& ReturnStartPhase, FLOAT& ReturnEndPhase ) = "0x0af1dad2f59b2c3c"

//INFO:	The function will return true if an event with name EventName is firing in an anim on the entity,
//		 AND the event has a vector type attribute with name AttributeName. the value stored in the
//		attribute will be filled into the OutValue parameter.
//PARAM NOTES:	EntityIndex - The entity to search for anim events
//				EventName - The name of the event to search for.
//				AttributeName - the name of the vector type attribute to get the bool value from.
//				OutValue - If the event exists and has the correct type, its value will be filled in here.
//PURPOSE: Used to get a vector type attribute from an event IF it is currently firing on the entity. more info...
//NATIVE FUNC BOOL GET_VECTOR_ATTRIBUTE_FROM_ANIM_EVENT ( ENTITY_INDEX EntityIndex, STRING EventName, STRING AttributeName, VECTOR& OutValue)

//INFO:	The function will return true if an event with name EventName is firing in an anim on the entity,
//		 AND the event has a float type attribute with name AttributeName. the value stored in the
//		attribute will be filled into the OutValue parameter.
//PARAM NOTES:	EntityIndex - The entity to search for anim events
//				EventName - The name of the event to search for.
//				AttributeName - the name of the boolean type attribute to get the float value from.
//				OutValue - If the event exists and has the correct type, its value will be filled in here.
//PURPOSE: Used to get a float type attribute from an event IF it is currently firing on the entity. more info...
//NATIVE FUNC BOOL GET_FLOAT_ATTRIBUTE_FROM_ANIM_EVENT ( ENTITY_INDEX EntityIndex, STRING EventName, STRING AttributeName, FLOAT& OutValue)

//INFO:	The function will return true if an event with name EventName is firing in an anim on the entity,
//		 AND the event has a integer type attribute with name AttributeName. the value stored in the
//		attribute will be filled into the OutValue parameter.
//PARAM NOTES:	EntityIndex - The entity to search for anim events
//				EventName - The name of the event to search for.
//				AttributeName - the name of the integer type attribute to get the value from.
//				OutValue - If the event exists and has the correct type, its value will be filled in here.
//PURPOSE: Used to get a integer type attribute from an event IF it is currently firing on the entity. more info...
//NATIVE FUNC BOOL GET_INT_ATTRIBUTE_FROM_ANIM_EVENT ( ENTITY_INDEX EntityIndex, STRING EventName, STRING AttributeName, INT& OutValue)

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets all entity's anim speeds.
NATIVE PROC SET_ENTITY_ALL_ANIMS_SPEED (ENTITY_INDEX EntityIndex, FLOAT AnimSpeed) = "0x74c650ed23b897c8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the speed that the specified animation will blend out at when finished. 
NATIVE PROC SET_ENTITY_ANIM_BLEND_OUT_SPEED( ENTITY_INDEX EntityIndex, STRING AnimName, STRING AnimDictName, FLOAT newBlendOutSpeed) = "0xc610444fa4cc68f9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the phase of the anim between 0.0 and 1.0
NATIVE PROC SET_ENTITY_ANIM_CURRENT_TIME(ENTITY_INDEX EntityIndex, STRING pAnimDictName, STRING pAnimName, FLOAT NewAnimCurrentTime) = "0x12ffbbb6191db79f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets entity's current anim speed.
NATIVE PROC SET_ENTITY_ANIM_SPEED(ENTITY_INDEX EntityIndex, STRING pAnimDictName, STRING pAnimName, FLOAT AnimSpeed) = "0xb5cb6bc7ad4cdcce"

//INFO: 
//PARAM NOTES: 
//	       ScriptHostObject:		If true, this entity has been created by the host portion of a network script and is vital to that script - it must always exist regardless of who is hosting the script.
//						If false, the entity has been created by the client portion of a network script and can be removed when the client who created it leaves the script session.
//  	       GrabFromOtherScript:		If true, this entity will be grabbed off any script that currently owns it
//PURPOSE: Sets a random entity as a mission entity.
NATIVE PROC SET_ENTITY_AS_MISSION_ENTITY ( ENTITY_INDEX EntityIndex, BOOL ScriptHostObject=true, BOOL GrabFromOtherScript=false ) = "0x2d58a6131679d82c"

//INFO: The entity will added back into the world population and deleted when off screen.
//PARAM NOTES:
//PURPOSE: Sets the entity to be removed, cannot refer to entity from script. More info..
NATIVE PROC SET_ENTITY_AS_NO_LONGER_NEEDED(ENTITY_INDEX &EntityIndex) = "0xec548b5e95e61df6"

NATIVE PROC SET_PED_AS_NO_LONGER_NEEDED(PED_INDEX &PedIndex) = "0xb3822db3d538c8f3"
NATIVE PROC SET_VEHICLE_AS_NO_LONGER_NEEDED(VEHICLE_INDEX &VehicleIndex) = "0x3d81769bec61bff8"
NATIVE PROC SET_OBJECT_AS_NO_LONGER_NEEDED(OBJECT_INDEX &ObjectIndex) = "0x59e393b344098656"
		
//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if the entity can be damaged.
NATIVE PROC SET_ENTITY_CAN_BE_DAMAGED(ENTITY_INDEX EntityIndex, BOOL CanBeDamagedFlag) = "0xfef687af74eedcc2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets if the entity can be damaged.
NATIVE FUNC BOOL GET_ENTITY_CAN_BE_DAMAGED(ENTITY_INDEX EntityIndex) = "0xd8c646428b492be8"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Set the entity can be damaged by the peds in the given relationship group
NATIVE PROC SET_ENTITY_CAN_BE_DAMAGED_BY_RELATIONSHIP_GROUP(ENTITY_INDEX EntityIndex, BOOL AllowDamagedByRelGroup, REL_GROUP_HASH relGroup) = "0xe701941b064f05a2"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Sets that the entity can only be damaged by players running the script this entity belongs to
NATIVE PROC SET_ENTITY_CAN_ONLY_BE_DAMAGED_BY_SCRIPT_PARTICIPANTS(ENTITY_INDEX EntityIndex, BOOL bOnlyDamagedWhenRunningScript) = "0xd1c117aeb22f08e1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if an entity can be locked on without a los check.
NATIVE PROC SET_ENTITY_CAN_BE_TARGETED_WITHOUT_LOS(ENTITY_INDEX EntityIndex, BOOL TargettableWithNoLos) = "0xa93da249dfb26a26"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if an entity uses collision.
NATIVE PROC SET_ENTITY_COLLISION(ENTITY_INDEX EntityIndex, BOOL UsesCollisionsFlag, BOOL KeepDisabledSimulatingFlag = FALSE) = "0x959e1626cbc7d38a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get if an entity has collision disabled.
NATIVE FUNC BOOL GET_ENTITY_COLLISION_DISABLED(ENTITY_INDEX EntityIndex) = "0x1f723890b0fbffea"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets if an entity uses any collision at all, this disables exploision and weapon collision as well, added as a seperate command to save updating all scripts.
NATIVE PROC SET_ENTITY_COMPLETELY_DISABLE_COLLISION(ENTITY_INDEX EntityIndex, BOOL UsesCollisionsFlag, BOOL KeepDisabledSimulatingFlag = FALSE) = "0x3ff6dde9123aea35"

//INFO:  If you want to set the coords of a ped in a vehicle, use SET_PED_COORDS_KEEP_VEHICLE.
//	If you set the z component of VecNewCoors to INVALID_WORLD_Z  this command to automatically find the ground z for your entity if there is collision. 
//PARAM NOTES:  DoDeadCheck - If false then the command will not assert if the entity has not been checked for being dead
//				KeepTasks - only applied to peds. If true, the tasks on the ped are not removed when he is teleported.
//				KeepIK - only applied to peds. If true, the IK on the ped is not reset when he is teleported.
//			  DoWarp - Calling with the non-default value of FALSE implies that the object has continuous motion and should not clear contacts nor space for itself.
//PURPOSE:  Sets the entity's coords (peds add an -1m offset from the peds origin). More Info...
NATIVE PROC SET_ENTITY_COORDS(ENTITY_INDEX EntityIndex, VECTOR VecNewCoors, bool DoDeadCheck = TRUE, bool KeepTasks = FALSE, bool KeepIK = FALSE, bool DoWarp = TRUE) = "0xc64b6e13a6a7f517"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Works exactly like SET_ENTITY_COORDS() but doesn't reset procedural grass (useful for spectator camera views, etc.)
NATIVE PROC SET_ENTITY_COORDS_WITHOUT_PLANTS_RESET(ENTITY_INDEX EntityIndex, VECTOR VecNewCoors, bool DoDeadCheck = TRUE, bool KeepTasks = FALSE, bool KeepIK = FALSE, bool DoWarp = TRUE) = "0x3411b7feaefb2ff1"

//INFO: //	If you set the z component of VecNewCoors to INVALID_WORLD_Z  this command to automatically find the ground z for your entity if there is collision. 
//PARAM NOTES: KeepTasks - only applied to peds. If true, the tasks on the ped are not removed when he is teleported.
//			   KeepIK - only applied to peds. If true, the IK on the ped is not reset when he is teleported.
//			   DoWarp - Calling with the non-default value of FALSE implies that the object has continuous motion and should not clear contacts nor space for itself.
//PURPOSE:  Sets the entity's coords without adding the offset.
NATIVE PROC SET_ENTITY_COORDS_NO_OFFSET(ENTITY_INDEX EntityIndex, VECTOR VecNewCoors, bool KeepTasks = FALSE, bool KeepIK = FALSE, bool DoWarp = TRUE) = "0xa539ede8da5bbc22"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the entity to respond to the physics system.
NATIVE PROC SET_ENTITY_DYNAMIC ( ENTITY_INDEX EntityIndex, BOOL IsDynamic ) = "0x4536ae3dabde0c44"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the entity's heading in degrees.
NATIVE PROC SET_ENTITY_HEADING(ENTITY_INDEX EntityIndex, FLOAT NewHeading) = "0xbbf86885619695ce"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the entity's current health. 
NATIVE PROC SET_ENTITY_HEALTH(ENTITY_INDEX EntityIndex, INT NewHealth, ENTITY_INDEX InstigatorIndex = NULL) = "0xf160248d9083ed0c"

//INFO: 
//PARAM NOTES: Asserts if you pass in 0.0 to all vector components.
//PURPOSE: Sets the initial speed of an entity.
NATIVE PROC SET_ENTITY_INITIAL_VELOCITY ( ENTITY_INDEX EntityIndex, VECTOR VecVelocityComponent ) = "0x1dc52d7621b85540"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set entity invincible. 
NATIVE PROC SET_ENTITY_INVINCIBLE(ENTITY_INDEX EntityIndex, BOOL bInvincible) = "0x9210f85e9cd785f1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set entity to be a target priority
NATIVE PROC SET_ENTITY_IS_TARGET_PRIORITY(ENTITY_INDEX EntityIndex, BOOL bHighPriority, FLOAT fTargetableDistance = 0.0) = "0x06af73d7e3df7782"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets on all lights attached to the entity; bLightSwitch works in "inversed" logic manner: FALSE-to ENABLE entity lights, TRUE-to DISABLE entity lights; 
NATIVE PROC SET_ENTITY_LIGHTS(ENTITY_INDEX EntityIndex, BOOL bLightSwitch) = "0xce8331cb5040e4b2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the collision around the entity to load.
NATIVE PROC SET_ENTITY_LOAD_COLLISION_FLAG(ENTITY_INDEX EntityIndex, BOOL LoadCollisionFlag, bool DoDeadCheck = TRUE) = "0x006574e87e6f1942"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the static collision for movement is loaded around the specified entity
NATIVE FUNC BOOL HAS_COLLISION_LOADED_AROUND_ENTITY(ENTITY_INDEX EntityIndex) = "0xf1e076f6cc1695aa"

//INFO: 
//PARAM NOTES:
//PURPOSE:Sets the entity's maximum speed
NATIVE PROC SET_ENTITY_MAX_SPEED ( ENTITY_INDEX EntityIndex, FLOAT MaxSpeed) = "0x96ba5a8588a1f329"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the entity is only damaged by the main player
NATIVE PROC SET_ENTITY_ONLY_DAMAGED_BY_PLAYER ( ENTITY_INDEX EntityIndex, BOOL OnlyDamagedByPlayer ) = "0x0407cf7efee35240"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the entity can be only damaged by peds in the given relationship group
NATIVE PROC SET_ENTITY_ONLY_DAMAGED_BY_RELATIONSHIP_GROUP(ENTITY_INDEX EntityIndex, BOOL OnlyDamagedByRelGroup, REL_GROUP_HASH relGroup) = "0x8a8909baddfa93a6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the proofs on entity: Bullet, Flame, Explosion, Colision, Melee
NATIVE PROC SET_ENTITY_PROOFS(ENTITY_INDEX EntityIndex, BOOL BulletProofFlag, BOOL FlameProofFlag, BOOL ExplosionProofFlag, BOOL CollisionProofFlag, BOOL MeleeProofFlag, BOOL SteamProofFlag = false, BOOL DontResetDamageFlagsOnCleanupMissionState = FALSE, BOOL SmokeProofFlag = false) = "0xbed097bb6359f09c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the proofs on entity: Bullet, Flame, Explosion, Colision, Melee
NATIVE FUNC BOOL GET_ENTITY_PROOFS(ENTITY_INDEX EntityIndex, BOOL &BulletProofFlag, BOOL &FlameProofFlag, BOOL &ExplosionProofFlag, BOOL &CollisionProofFlag, BOOL &MeleeProofFlag, BOOL &SteamProofFlag, BOOL &DontResetDamageFlagsOnCleanupMissionState, BOOL &SmokeProofFlag) = "0x89d0663d5c95cd4b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the entity's rotation quaternion
NATIVE PROC SET_ENTITY_QUATERNION ( ENTITY_INDEX EntityIndex, FLOAT NewX, FLOAT NewY, FLOAT NewZ, FLOAT NewW) = "0x03f4139102ba4afc"

//INFO: 
//PARAM NOTES:
//PURPOSE: This command must be called with TRUE before you can use HAS_ENTITY_COLLIDED_WITH_ANYTHING. 
NATIVE PROC SET_ENTITY_RECORDS_COLLISIONS ( ENTITY_INDEX EntityIndex, BOOL RecordsCollision ) = "0x3aa7fa9ba4f7a9e7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the entity's rotation.
NATIVE PROC SET_ENTITY_ROTATION(ENTITY_INDEX EntityIndex, VECTOR VecNewRotation, EULER_ROT_ORDER RotOrder = EULER_YXZ, BOOL DoDeadCheck = true) = "0x8ce3d365f064f69e"

//INFO:
//PARAM NOTES:
//PURPOSE: Set if the ped is visible (i.e. rendered)
NATIVE PROC SET_ENTITY_VISIBLE(ENTITY_INDEX EntityIndex, BOOL VisibleFlag, BOOL ResetRenderPhaseVisibilityMask = FALSE) = "0x1c2ed929474dc6fe"

//INFO:
//PARAM NOTES:
//PURPOSE: Set the water reflection visibility flag
NATIVE PROC SET_ENTITY_WATER_REFLECTION_FLAG(ENTITY_INDEX EntityIndex, BOOL ReflectionFlag) = "0x0106728632d8bfe7"

//INFO:
//PARAM NOTES:
//PURPOSE: Set the mirror reflection visibility flag
NATIVE PROC SET_ENTITY_MIRROR_REFLECTION_FLAG(ENTITY_INDEX EntityIndex, BOOL ReflectionFlag) = "0x22fac08c55bb0816"

//INFO: The speeds are measured in metres per second. 
//PARAM NOTES: The velocity componets should be less than 500.
//PURPOSE:Sets the entity's current velocity.  More info..
NATIVE PROC SET_ENTITY_VELOCITY(ENTITY_INDEX EntityIndex, VECTOR VecVelocityComponentt) = "0xb96633932c330b51"

//INFO: The ang speeds are measured in degrees ( in radians ) per frame. 
//PARAM NOTES: The ang velocity componets should be less than 2.0f * PI 
//PURPOSE:Sets the entity's angular velocity.  More info..
NATIVE PROC SET_ENTITY_ANGULAR_VELOCITY(ENTITY_INDEX EntityIndex, VECTOR VecVelocityComponentt) = "0xa086b3ae27b69b2c"

//INFO:
//PARAM NOTES: false turns on the NO_GRAVITY inst flag
//PURPOSE: Sets whether this entity's physics inst is affected by gravity or not
NATIVE PROC SET_ENTITY_HAS_GRAVITY(ENTITY_INDEX EntityIndex, BOOL bHasGravity) = "0x823ac5a743053194"

/// PURPOSE:
///    This will return you an ENTITY_INDEX from any PED_INDEX or VEHICLE_INDEX you pass in.
///    Note that even though the In param is an ENTITY_INDEX, you can still pass in a PED or VEHICLE, and it works great.
/// RETURNS:
///    The ENTITY_INDEX of the item passed in.
FUNC ENTITY_INDEX GET_ENTITY_FROM_PED_OR_VEHICLE(ENTITY_INDEX PedOrVehicle)
	RETURN PedOrVehicle
ENDFUNC

/// PURPOSE:
///    Set the drawable lod thresholds for switching mesh LODs for the model for the selected entity
/// RETURNS:
///   
NATIVE PROC SET_ENTITY_DRAWABLE_LOD_THRESHOLDS(ENTITY_INDEX entityIndex, INT highLod, INT medLod, int lowLod, int vlowLod) = "0x8e77726f2294dd5b"


/// PURPOSE:
///    Set the fading distance for the entity identified by the given entity index
/// RETURNS:
///   
NATIVE PROC SET_ENTITY_LOD_DIST(ENTITY_INDEX entityIndex, INT lodDist) = "0x7a93dea53efc3cf2"

/// PURPOSE:
///    Get the fading distance for the entity identified by the given entity index
/// RETURNS:
///   The fading distance for the desired entity
NATIVE FUNC INT GET_ENTITY_LOD_DIST(ENTITY_INDEX entityIndex) = "0x8ac745b92a62ff20"

NATIVE PROC SET_ENTITY_ALWAYS_PRERENDER(ENTITY_INDEX entityIndex, BOOL bAlwaysPreRender) = "0x62a01b7866de3fb4"

//INFO: Setup an entity to be rendered with alpha, 
//PARAM NOTES: bUseSmoothAlpha is not supported on Peds and Vehicles.
//PURPOSE:
NATIVE PROC SET_ENTITY_ALPHA(ENTITY_INDEX entityIndex, INT alpha_param, BOOL bUseSmoothAlpha) = "0x8b9ad14c7d42cc13"

//INFO: Return the alpha of an entity
//PARAM NOTES: uses only on entities using SET_ENTITY_ALPHA, use with care as it can get rather expensive.
//PURPOSE:
NATIVE FUNC INT GET_ENTITY_ALPHA(ENTITY_INDEX entityIndex) = "0x84724f93d2180bcc"

//INFO: Revert entity alpha override.
//PURPOSE:
NATIVE PROC RESET_ENTITY_ALPHA(ENTITY_INDEX entityIndex) = "0xeafaf9ed80db448d"

//INFO: Revert entity alpha override and restart pickup glow.
//PURPOSE:
NATIVE PROC RESET_PICKUP_ENTITY_GLOW(ENTITY_INDEX entityIndex) = "0x4c9283de8fdb6a51"

//INFO: Sets whether a pickup will collide with projectiles.
//PURPOSE:
NATIVE PROC SET_PICKUP_COLLIDES_WITH_PROJECTILES(ENTITY_INDEX entityIndex, BOOL collideWithProjectiles) = "0x6da15de1822b4027"

//INFO: Set a bias to be applied to an entity's sort distance
//PURPOSE:
NATIVE PROC SET_ENTITY_SORT_BIAS(ENTITY_INDEX entityIndex, FLOAT bias) = "0xd398de5246e16a9e"

//INFO: Revert entity sort bias.
//PURPOSE:
NATIVE PROC RESET_ENTITY_SORT_BIAS(ENTITY_INDEX entityIndex) = "0x277b8c6dd1c05c07"

//INFO: Setup an entity to be rendered as scorched/burned down
//PARAM NOTES: Use only on peds or cars.
//PURPOSE:
NATIVE PROC SET_ENTITY_RENDER_SCORCHED(ENTITY_INDEX entityIndex, BOOL bRenderScorched) = "0x929457eb603e9f3a"


//INFO: Override the state of a traffic light to red, amber, green. or none.
//PARAM NOTES: Use only on traffic lights entitys
//PURPOSE:
NATIVE PROC SET_ENTITY_TRAFFICLIGHT_OVERRIDE(ENTITY_INDEX entityIndex, TRAFFICLIGHT_OVERRIDE_MODE overrideMode) = "0xf7bcac74d883d0d1"


//INFO: Indicate that an entity is inside an object, to avoid it being affect by puddles.
//PARAM NOTES: Not reversible, handle with care.
//PURPOSE:
NATIVE PROC SET_ENTITY_IS_IN_VEHICLE(ENTITY_INDEX entityIndex) = "0xff8a4252fbf3fbca"

//INFO: Creates an active model swap for a building or object
//PARAM NOTES: any building or object with the corresponding model name, which intersects with the specified sphere, will have its model
// swapped to the new model. Optionally this swap can automatically be applied as map data streams in and out, ensuring a persistent model
// swap at the position specified.
//PURPOSE: This is intended as a replacement for the old building swap system. Improvements include support for objects, and
// support for automatic persistence across dummy conversion, map data streaming etc.
NATIVE PROC CREATE_MODEL_SWAP(VECTOR pos, float radius, MODEL_NAMES oldModelHash, MODEL_NAMES newModelHash, BOOL bSurviveMapReload) = "0xb17fdb8078b01a51"

//INFO: Removes a previously created model swap, if one exists and matches exactly
//PARAM NOTES: if bLazy is true, the persistent swap is removed but not actually acted on immediately - the area would need to stream out and back in again to take effect
//PURPOSE:
NATIVE PROC REMOVE_MODEL_SWAP(VECTOR pos, float radius, MODEL_NAMES oldModelHash, MODEL_NAMES newModelHash, BOOL bLazy = FALSE) = "0x7da16d38ad07a674"

//INFO: Creates an active model hide for a building or object
//PARAM NOTES: any building or object with the corresponding model name, which intersects with the specified sphere, will have its model
// hidden and physics disabled. Optionally this swap can automatically be applied as map data streams in and out, ensuring a persistent model
// hide at the position specified.
//PURPOSE: This is intended as a replacement for the old commands for disabling visibility and collisions for an entity.
// Improvements include support for objects, and support for automatic persistence across dummy conversion, map data streaming etc.
NATIVE PROC CREATE_MODEL_HIDE(VECTOR pos, float radius, MODEL_NAMES modelHash, BOOL bSurviveMapReload) = "0xe87a5b1b96b0ec6f"

//PURPOSE: This commands does the same as CREATE_MODEL_HIDE except that it won't hide objects owned by script
NATIVE PROC CREATE_MODEL_HIDE_EXCLUDING_SCRIPT_OBJECTS(VECTOR pos, float radius, MODEL_NAMES modelHash, BOOL bSurviveMapReload) = "0xca2a868fd7906603"

//INFO: Removes a previously created model hide, if one exists and matches exactly
//PARAM NOTES: if bLazy is true, the persistent hide is removed but not actually acted on immediately - the area would need to stream out and back in again to take effect
//PURPOSE:
NATIVE PROC REMOVE_MODEL_HIDE(VECTOR pos, float radius, MODEL_NAMES modelHash, BOOL bLazy = FALSE) = "0xa1f6e5ef42acdb8c"

//INFO: Creates a persistent force-to-object effect on map
//PARAM NOTES: any dummy object with the corresponding model name, which intersects with the specified sphere, will be forced to
// become a real dynamic object (rather than a dummy object)
//PURPOSE: Sometimes (e.g. when following an NPC-driven vehicle ahead of you) it is necessary to force particular barriers to become real objects
// so the vehicle you are following smashes through them properly rather than passing through without collision.
NATIVE PROC CREATE_FORCED_OBJECT(VECTOR pos, float radius, MODEL_NAMES modelHash, BOOL bSurviveMapReload) = "0xea77adc78e693681"

//INFO: Removes a previously created persistent force-to-object effect on map, if one exists and matches exactly
//PARAM NOTES:
//PURPOSE:
NATIVE PROC REMOVE_FORCED_OBJECT(VECTOR pos, float radius, MODEL_NAMES modelHash) = "0x73bda6fe727ad754"

//INFO: Prevents the first entity from colliding with the second entity
//PARAM NOTES: the bReactivateWhenNoCollision param defines whether collision will reactivate automatically or stay off permanently
//				IF TRUE when there are no possible collisions between the objects it will reactivate so it can collide when no longer penetrating
//				IF FALSE the entities will never collide again
//PURPOSE:
NATIVE PROC SET_ENTITY_NO_COLLISION_ENTITY(ENTITY_INDEX entityIndex, ENTITY_INDEX secondEntityIndex, BOOL bReactivateWhenNoCollision) = "0x14ad86219fe1ac08"

//INFO: Toggles motion blur on an entity
//PARAM NOTES: 	Passing FALSE will keep the entity from being affected by the motion blur effect
//				The effect of this call is permanent, so it is up to the user to restore any previous state
//PURPOSE:
NATIVE PROC SET_ENTITY_MOTION_BLUR(ENTITY_INDEX entityIndex, BOOL bEnableMotionBlur) = "0xbf5acf94c9b79b3d"

//INFO: Prevent auto vaulting on a particular entity.
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_CAN_AUTO_VAULT_ON_ENTITY(ENTITY_INDEX entityIndex, BOOL bCanAutoVault) = "0x419302b4e1d43eed"

//INFO: Prevent climbing on a particular entity.
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_CAN_CLIMB_ON_ENTITY(ENTITY_INDEX entityIndex, BOOL bCanClimb) = "0x82b0e749922635bc"

//INFO: Set flag to indicate if generated as part of user content
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_WAIT_FOR_COLLISIONS_BEFORE_PROBE(ENTITY_INDEX entityIndex, BOOL bWait) = "0x5a3c417dfb231aa1"

//INFO: Get the closest player to an entity
//PARAM NOTES: Entity we want closest player to
//PURPOSE:
NATIVE FUNC  INT GET_NEAREST_PLAYER_TO_ENTITY(ENTITY_INDEX entityIndex) = "0xd632326024550b66"

//INFO: Get the closest player to an entity on a particular team
//PARAM NOTES: Entity we want closest player to
//PURPOSE:
NATIVE FUNC  INT GET_NEAREST_PLAYER_TO_ENTITY_ON_TEAM(ENTITY_INDEX entityIndex, INT team) = "0x9b7d7680cfd3f710"

//INFO: Get the closest player on a tutorial to an entity
//PARAM NOTES: Entity we want closest player to
//PURPOSE:
NATIVE FUNC  INT GET_NEAREST_PLAYER_ON_LOCAL_PLAYER_TUTORIAL_TO_ENTITY(ENTITY_INDEX entityIndex) = "0x61eee7cc2c8b7501"

//INFO: Get the closest participaant to an entity
//PARAM NOTES: Entity we want closest player to
//PURPOSE:
NATIVE FUNC  INT GET_NEAREST_PARTICIPANT_TO_ENTITY(ENTITY_INDEX entityIndex) = "0x936629dedc5fc52b"

//INFO: Setup an entity to not receive weapon decals
//PARAM NOTES: 
//PURPOSE:
NATIVE PROC SET_ENTITY_NOWEAPONDECALS(ENTITY_INDEX entityIndex, BOOL bNoWeaponDecals) = "0x4e02b93acfb7b3a5"

//INFO: Return weather or not an entity will receive weapon decals.
//PARAM NOTES: 
//PURPOSE:
NATIVE FUNC BOOL GET_ENTITY_NOWEAPONDECALS(ENTITY_INDEX entityIndex) = "0x8a3489f8359b5526"

//INFO: Set whether the entity should use the max distance check for being included in water reflections
//PARAM NOTES: 
//PURPOSE:
NATIVE PROC SET_ENTITY_USE_MAX_DISTANCE_FOR_WATER_REFLECTION(ENTITY_INDEX entityIndex, BOOL bUseMaxDistance) = "0xb28d5be976e5890c"

//INFO: Returns the rotation, in world space, of the bone within the entity
//PARAM NOTES: 
//PURPOSE:
NATIVE FUNC VECTOR GET_ENTITY_BONE_ROTATION(ENTITY_INDEX EntityIndex, INT BoneIndex) = "0x9c668c5b3efa1dec"

//INFO: Returns the position, in world space, of the bone within the entity
//PARAM NOTES: 
//PURPOSE:
NATIVE FUNC VECTOR GET_ENTITY_BONE_POSTION(ENTITY_INDEX EntityIndex, INT BoneIndex) = "0x851cfde0cbc150ec"

//INFO: Returns the rotation, in object space, of the bone within the entity
//PARAM NOTES: 
//PURPOSE:
NATIVE FUNC VECTOR GET_ENTITY_BONE_OBJECT_ROTATION(ENTITY_INDEX EntityIndex, INT BoneIndex) = "0x69feba414276c40e"

//INFO: Returns the position, in object space, of the bone within the entity
//PARAM NOTES: 
//PURPOSE:
NATIVE FUNC VECTOR GET_ENTITY_BONE_OBJECT_POSTION(ENTITY_INDEX EntityIndex, INT BoneIndex) = "0x7bf851d590d0eb6c"

//INFO: Returns the number of bones in the entity
//PARAM NOTES: 
//PURPOSE:
NATIVE FUNC INT GET_ENTITY_BONE_COUNT(ENTITY_INDEX EntityIndex) = "0x8f288b72a0b9e6ed"

//INFO: Just enables basic attachment collision flags on the entity
//PARAM NOTES: 
//PURPOSE:
NATIVE PROC ENABLE_ENTITY_BULLET_COLLISION(ENTITY_INDEX EntityIndex) = "0xe14c76331d5aa34c"


//INFO: Sets an entity to only be damaged by one other entity
//PARAM NOTES: first param is the entity to modify, the second is the only entity that can damage the first
//PURPOSE:
NATIVE PROC SET_ENTITY_CAN_ONLY_BE_DAMAGED_BY_ENTITY(ENTITY_INDEX EntityIndex, ENTITY_INDEX DamagingEntity) = "0x44ad5947dd467f0e"

//INFO: Resets the only entity that can damage an entity
//PARAM NOTES: 
//PURPOSE:
NATIVE PROC RESET_ENTITY_CAN_ONLY_BE_DAMAGED_BY_ENTITY(ENTITY_INDEX EntityIndex) = "0x77f4f312ada59c40"

//INFO: Sets an entity to not have collision damage from the other entity
//PARAM NOTES: first param is the entity to modify, the second is the only entity that can't damage the first
//PURPOSE:
NATIVE PROC SET_ENTITY_CANT_CAUSE_COLLISION_DAMAGED_ENTITY(ENTITY_INDEX EntityIndex, ENTITY_INDEX DamagingEntity) = "0xc3317b4bca8328b9"

//INFO: Resets the only entity that can't cause collision damage
//PARAM NOTES: 
//PURPOSE:
NATIVE PROC RESET_ENTITY_CANT_CAUSE_COLLISION_DAMAGED_ENTITY(ENTITY_INDEX EntityIndex) = "0xddfc82bd082d57f6"


//INFO: Set Ignore CanAcceptControl flag on physical entity
//PARAM NOTES: 
//PURPOSE:
NATIVE PROC SET_ALLOW_MIGRATE_TO_SPECTATOR(ENTITY_INDEX entityIndex, BOOL ignoreCanAccept) = "0x64ab3102e05d0d75"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Gets the entity index of any entity of the given model type that is attached to teh parent entity
NATIVE FUNC ENTITY_INDEX GET_ENTITY_OF_TYPE_ATTACHED_TO_ENTITY(ENTITY_INDEX EntityIndex, MODEL_NAMES ModelHashKey) = "0xe0ae41c323ad1f1b"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Sets whether an entity is prevented from being picked up by cargobobs
NATIVE PROC SET_PICK_UP_BY_CARGOBOB_DISABLED(ENTITY_INDEX EntityIndex, BOOL disablePickUp) = "0x60104a96124e0b12"
