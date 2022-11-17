USING "types.sch"

//~>                        Interior    commands  (from commands_misc.sch)

STRUCT sInteriorFile
	INT		nameHash
	INT		numberOfRoomNodes
ENDSTRUCT

STRUCT sInteriorRoom
	INT 	nameHash
	INT		numberOfLayoutNodes
ENDSTRUCT

STRUCT sInteriorLayoutNode
	INT 	nameHash
	VECTOR	translation
	VECTOR	rotation
	BOOL	purchasable
	INT		numberOfGroupNodes
ENDSTRUCT

STRUCT sInteriorGroupNode
	INT numberOfRsRefNodes
ENDSTRUCT

STRUCT sInteriorRsRefNode
	INT		nameHash
	VECTOR	translation
	VECTOR	rotation
	INT		numberOfLayoutNodes
ENDSTRUCT

STRUCT sRsRefShopData
	INT name
	INT price
	INT description
ENDSTRUCT

// loading unloading of the layout file
NATIVE FUNC INT		LAYOUT_LOAD_INTERIOR_INFO(STRING fileName) = "0xe61ef85fdce3fd95"
NATIVE PROC 		LAYOUT_UNLOAD_INTERIOR_INFO() = "0xc9195ffe0c69c64e"

// functions for navigating around the layout data structure
NATIVE FUNC INT		GET_ROOM_HANDLE_FROM_INTERIOR(INT interiorHandle, INT roomIndex) = "0xc03e564395653366"
NATIVE FUNC INT		GET_LAYOUT_HANDLE_FROM_ROOM(INT roomHandle, INT layoutIndex) = "0xbd5de9fff59992cc"
NATIVE FUNC INT		GET_GROUP_HANDLE_FROM_LAYOUT(INT layoutHandle, INT groupIndex) = "0x61b049e16b26a42f"
NATIVE FUNC INT		GET_RSREF_HANDLE_FROM_GROUP(INT groupHandle, INT rsRefIndex) = "0xa1bd9a2db65affc9"
NATIVE FUNC INT		GET_LAYOUT_HANDLE_FROM_RSREF(INT rsRefHandle, INT layoutIndex) = "0x818176db352c7bf7"

// functions to get the data out of the layout data structure
NATIVE FUNC BOOL	LAYOUT_GET_INTERIOR_INFO(INT	interiorHandle, sInteriorFile& interiorInfo) = "0x9c6405b81de92961"
NATIVE FUNC BOOL	LAYOUT_GET_ROOM_INFO	(INT	roomHandle,		sInteriorRoom& roomInfo) = "0xb46862002175d6cf"
NATIVE FUNC BOOL	LAYOUT_GET_LAYOUT_INFO	(INT	layoutHandle,	sInteriorLayoutNode& layoutInfo) = "0xaec06141ff66d2bf"
NATIVE FUNC BOOL	LAYOUT_GET_GROUP_INFO	(INT	groupHandle,	sInteriorGroupNode& groupInfo) = "0x86764d41e90443d8"
NATIVE FUNC BOOL	LAYOUT_GET_RSREF_INFO	(INT	rsRefHandle,	sInteriorRsRefNode& rsRefInfo, sRsRefShopData& shopInfo) = "0x1af10e1287826db5"

// functions to activate groups inside the layout & trigger population of the interior
NATIVE PROC			TOGGLE_GROUP_IN_LAYOUT		(INT groupHandle) = "0x93d1793cedaf3ecc"
NATIVE FUNC BOOL	IS_GROUP_ACTIVE_IN_LAYOUT	(INT groupHandle) = "0x4b817cc5848dd8e3"
NATIVE PROC			POPULATE_LAYOUT				( INTERIOR_INSTANCE_INDEX intenteriorInstanceIndex) = "0x748fd8e1c75c2f0b"
NATIVE PROC			DEPOPULATE_LAYOUT() = "0x4ece4c828595026c"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC VECTOR GET_OFFSET_FROM_INTERIOR_IN_WORLD_COORDS ( INTERIOR_INSTANCE_INDEX InteriorInstanceIndex, VECTOR vecOffset) = "0x56a14d0fd5a4e290"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the offest point returned in world coords.
NATIVE FUNC FLOAT GET_INTERIOR_HEADING ( INTERIOR_INSTANCE_INDEX InteriorInstanceIndex ) = "0xa88bc56dfd999b0a"

//INFO: 
//PARAM NOTES:
//PURPOSE: return the location in world coords and namehash of the given interior
NATIVE PROC GET_INTERIOR_LOCATION_AND_NAMEHASH ( INTERIOR_INSTANCE_INDEX InteriorInstanceIndex, VECTOR& position, INT& nameHash ) = "0xd0434c3b2d654157"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the group ID that this interior is registered in
NATIVE FUNC INT GET_INTERIOR_GROUP_ID ( INTERIOR_INSTANCE_INDEX InteriorInstanceIndex ) = "0xa57f6a48f0eb95a0"

//INFO: Can be used to stop certain cheats activating. 
//PARAM NOTES:
//PURPOSE: Chscks if the game is in an interior. More info..
NATIVE FUNC BOOL IS_INTERIOR_SCENE() = "0x479bccf712b8168e"

//INFO:
//PARAM NOTES:
//PURPOSE: Checks if the given interior instance index is valid.
NATIVE FUNC BOOL IS_VALID_INTERIOR ( INTERIOR_INSTANCE_INDEX InteriorInstanceIndex ) = "0xbcc73b466e2b2350"

//~>				camera related					 <~

//INFO:
//PARAM NOTES:
//PURPOSE: Associates the game viewport with the specified interior room to ensure that it renders correctly after a camera cut or warp.
NATIVE PROC SET_ROOM_FOR_GAME_VIEWPORT_BY_NAME(STRING RoomName) = "0x8d3da8896d24c6ea"

//INFO:
//PARAM NOTES:
//PURPOSE: Associates the game viewport with the specified interior room to ensure that it renders correctly after a camera cut or warp.
NATIVE PROC SET_ROOM_FOR_GAME_VIEWPORT_BY_KEY(INT RoomKey) = "0xf5b6e4d9edf2ad50"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the key of the interior room currently associated with the game viewport.
NATIVE FUNC INT GET_ROOM_KEY_FOR_GAME_VIEWPORT() = "0x7bad097af659c6b3"

//INFO:
//PARAM NOTES:
//PURPOSE: Clears any interior room that is associated with the game viewport.
NATIVE PROC CLEAR_ROOM_FOR_GAME_VIEWPORT() = "0x994f51a40d714799"

//INFO:
//PARAM NOTES:
//PURPOSE: Get the interior associated with the primary viewport (current main game camera)
NATIVE FUNC INT GET_INTERIOR_FROM_PRIMARY_VIEW() = "0xb04e49b85e6d01af"

//~>				from commands_objects.sch

//INFO: 
//PARAM NOTES:
//PURPOSE: gets the interior index from coords
NATIVE FUNC INTERIOR_INSTANCE_INDEX GET_INTERIOR_AT_COORDS (VECTOR VecInCoors) = "0xa0f62c1038208492"

//~>                            Entity Interior Commands                                   <~

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC CLEAR_ROOM_FOR_ENTITY ( ENTITY_INDEX EntityIndex ) = "0x3c46be5cff0f7003"

//INFO:
//PARAM NOTES:
//PURPOSE: Force the entity to be registered in the specified interior and room.
NATIVE PROC FORCE_ROOM_FOR_ENTITY(ENTITY_INDEX EntityIndex, INTERIOR_INSTANCE_INDEX InteriorInstanceIndex, INT RoomKey) = "0x9ee5df347f5d97ca"

//INFO:
//PARAM NOTES:
//PURPOSE: Force the game viewport to be registered in the specified interior and room.
NATIVE PROC FORCE_ROOM_FOR_GAME_VIEWPORT(INTERIOR_INSTANCE_INDEX InteriorInstanceIndex, INT RoomKey) = "0xd05075dd5280976b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets a room key from an object in that room.
NATIVE FUNC INT GET_ROOM_KEY_FROM_ENTITY(ENTITY_INDEX EntityIndex) = "0x782b98242b6bbb25"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC INT GET_KEY_FOR_ENTITY_IN_ROOM(ENTITY_INDEX EntityIndex) = "0xfa8d15b7448eeca0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the interior from the entity.
NATIVE FUNC INTERIOR_INSTANCE_INDEX  GET_INTERIOR_FROM_ENTITY(ENTITY_INDEX EntityIndex) = "0x6d7ee245ad1e10b0"

//INFO:   Entities owned by scripts and in interiors are automatically placed onto the retain list when the interior is unloaded.
//PARAM NOTES:
//PURPOSE: Add the given entity to the retain list for the given interior.
//			 When the interior is loaded, the retain list will be automatically inserted into it.
NATIVE PROC RETAIN_ENTITY_IN_INTERIOR( ENTITY_INDEX EntityIndex, INTERIOR_INSTANCE_INDEX InteriorInstanceIndex ) = "0xee4b783969c74ba1"

//INFO:  If an entity is in the retained state, then force it out of that state and into a clean, in-exterior-world state instead
//PARAM NOTES:
//PURPOSE: Force entity to outside world
NATIVE PROC CLEAR_INTERIOR_STATE_OF_ENTITY( ENTITY_INDEX EntityIndex ) = "0x63d8eb71d32dde73"

//INFO:   Force the portal tracker for this entity to test as activating for the purposes of interior activation
//PARAM NOTES:
//PURPOSE: Set the activating flag in the portal tracker for the given entity
NATIVE PROC FORCE_ACTIVATING_TRACKING_ON_ENTITY( ENTITY_INDEX EntityIndex, BOOL bValue) = "0xd7e367cfe1819ec5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Addsa pickup to the named interior
NATIVE PROC ADD_PICKUP_TO_INTERIOR_ROOM_BY_NAME(PICKUP_INDEX PickupID, STRING Name) = "0x28692df126dac03e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets room jkey from the pickup
NATIVE FUNC INT GET_ROOM_KEY_FROM_PICKUP(PICKUP_INDEX PickupID) = "0xb4fe57b6f5564d99"


//~> ---- commands to modify  / interrogate new interior state

//INFO: 
//PARAM NOTES:
//PURPOSE: Inform interior code that interior is required to be in memory now.
NATIVE PROC PIN_INTERIOR_IN_MEMORY ( INTERIOR_INSTANCE_INDEX InteriorInstanceIndex ) = "0x62eb051f5ed6dd41"

//INFO: 
//PARAM NOTES:
//PURPOSE: Inform interior code that script no longer will require this interior
NATIVE PROC UNPIN_INTERIOR ( INTERIOR_INSTANCE_INDEX InteriorInstanceIndex ) = "0xaed5221f05dae55e"

//INFO:  
//PARAM NOTES:
//PURPOSE: Is pinned interior in a state ready for further script commands?
NATIVE FUNC BOOL IS_INTERIOR_READY( INTERIOR_INSTANCE_INDEX InteriorInstanceIndex ) = "0xea02b859de237081"

//INFO:  
//PARAM NOTES:
//PURPOSE: Marks an interior as in use and forces it to flush the retained list
NATIVE FUNC BOOL SET_INTERIOR_IN_USE( INTERIOR_INSTANCE_INDEX InteriorInstanceIndex ) = "0x65f295aa405549a0"

//INFO:  
//PARAM NOTES:
//PURPOSE: Get interior of required type closest to given co-ordinates
NATIVE FUNC INTERIOR_INSTANCE_INDEX GET_INTERIOR_AT_COORDS_WITH_TYPE( VECTOR VecInCoors, STRING Name ) = "0x63ac7efb770fcb6f"

//INFO:  
//PARAM NOTES:
//PURPOSE: Get interior of required type closest to given co-ordinates
NATIVE FUNC INTERIOR_INSTANCE_INDEX GET_INTERIOR_AT_COORDS_WITH_TYPEHASH( VECTOR VecInCoors, INT NameHash ) = "0x1d94209cb3495367"

//INFO:  
//PARAM NOTES:
//PURPOSE: Get interior of required type closest to given co-ordinates
NATIVE PROC ACTIVATE_INTERIOR_GROUPS_USING_CAMERA( ) = "0x8f010262eb7d058c"


// --- probing world for interior data
//INFO:  
//PARAM NOTES:
//PURPOSE: test the collisions from the given point to 2m below it - return true if collisions are reported as outside
NATIVE FUNC BOOL IS_COLLISION_MARKED_OUTSIDE( VECTOR VecInCoors) = "0x15616e8442d3d1e8"

//INFO:  
//PARAM NOTES:
//PURPOSE: test the collisions from the given point to 2m below it - return the interior ID if reported as interior
NATIVE FUNC INTERIOR_INSTANCE_INDEX GET_INTERIOR_FROM_COLLISION( VECTOR VecInCoors) = "0x6f7d2ff0780e66be"

//INFO:  
//PARAM NOTES:
//PURPOSE: turn on the special stadium length probing in the portal tracking code, at the stadium interior location
NATIVE PROC ENABLE_STADIUM_PROBES_THIS_FRAME(bool bEnable) = "0xebdc7112e01946e8"

// --- entity set control
//INFO: 
//PARAM NOTES:
//PURPOSE: mark the entity set with the given name in this interior as being active
NATIVE PROC ACTIVATE_INTERIOR_ENTITY_SET ( INTERIOR_INSTANCE_INDEX InteriorInstanceIndex, STRING entitySetName) = "0x9f9fadbc78e66b6a"

//INFO: 
//PARAM NOTES:
//PURPOSE: mark the entity set with the given name in this interior as being inactive
NATIVE PROC DEACTIVATE_INTERIOR_ENTITY_SET ( INTERIOR_INSTANCE_INDEX InteriorInstanceIndex, STRING entitySetName) = "0xd9b6dbdde360d161"

//INFO:  
//PARAM NOTES:
//PURPOSE: return true if the entity set with the given name in this interior is marked as active
NATIVE FUNC BOOL IS_INTERIOR_ENTITY_SET_ACTIVE( INTERIOR_INSTANCE_INDEX InteriorInstanceIndex, STRING entitySetName) = "0x9b28deec684da500"

//INFO:  
//PARAM NOTES:
//PURPOSE: sets tint index for given entity set, returns false if operation unsuccessful
NATIVE PROC SET_INTERIOR_ENTITY_SET_TINT_INDEX( INTERIOR_INSTANCE_INDEX InteriorInstanceIndex, STRING entitySetName, INT tintIndex) = "0x915522919b63782f"

//INFO: 
//PARAM NOTES:
//PURPOSE: cause the interior to depopulate and regenerate its contents
NATIVE PROC REFRESH_INTERIOR ( INTERIOR_INSTANCE_INDEX InteriorInstanceIndex ) = "0xd665fc4f45f67b23"

//INFO: culls exterior objects from rendering (gbuf only) within the specified sphere. call each frame
//PARAM NOTES: position and radius of sphere
//PURPOSE: for use in multiplayer apartments which need to cull exterior shell of building etc
NATIVE PROC ENABLE_EXTERIOR_CULL_SPHERE_THIS_FRAME( VECTOR vPos, FLOAT fRadius ) = "0x9a8714e076868699"

//INFO: culls exterior objects from rendering (gbuf only) by model name
//PARAM NOTES: hash of model name
//PURPOSE: for use in multiplayer apartments which need to cull exterior shell of building etc
NATIVE PROC ENABLE_EXTERIOR_CULL_MODEL_THIS_FRAME( MODEL_NAMES modelNameHash ) = "0xca2d19dba96cd177"

//INFO: culls exterior objects from rendering (cascade shadows only) by model name
//PARAM NOTES: hash of model name
//PURPOSE: for use in multiplayer apartments which need to cull exterior shell of building etc
NATIVE PROC ENABLE_SHADOW_CULL_MODEL_THIS_FRAME( MODEL_NAMES modelNameHash ) = "0xa1b02d03fd7abfdf"

//INFO: completely disable the interior in the game
//PARAM NOTES:
//PURPOSE:  to turn off an interior & remove all cost associated with it
NATIVE PROC DISABLE_INTERIOR( INTERIOR_INSTANCE_INDEX InteriorInstanceIndex,  bool bDisable) = "0x219e451df8882834"

//INFO:  
//PARAM NOTES:
//PURPOSE: return true if the given interior is disabled
NATIVE FUNC BOOL IS_INTERIOR_DISABLED( INTERIOR_INSTANCE_INDEX InteriorInstanceIndex) = "0xb45cdd8a96e17099"

//INFO: caps the interior to only the shell objects ( usually walls + floor + doors + windows), prevents collisions from loading.
//PARAM NOTES:
//PURPOSE: to reduce the cost of the interior without removing it all together
NATIVE PROC CAP_INTERIOR( INTERIOR_INSTANCE_INDEX InteriorInstanceIndex, bool bCap ) = "0x1bca778ece172164"

//INFO:  
//PARAM NOTES:
//PURPOSE: return true if the interior has been capped
NATIVE FUNC BOOL IS_INTERIOR_CAPPED( INTERIOR_INSTANCE_INDEX InteriorInstanceIndex) = "0xa7e703fa558cb0a2"

//INFO: completely disable the metro system in the game
//PARAM NOTES:
//PURPOSE:  to turn off all metro system & remove all cost associated with it
NATIVE PROC DISABLE_METRO_SYSTEM( bool bDisable) = "0x011ea64bbd3a849c"

//INFO:  
//PARAM NOTES:
//PURPOSE: Sets given texture on interior's entity
NATIVE FUNC BOOL SET_DLC_INTERIOR_TEXTURE(INTERIOR_INSTANCE_INDEX InteriorInstanceIndex, STRING pTextureDictionaryName, STRING pTextureName) = "0xef5dd455eb445169"

//INFO:
//PARAM NOTES:
//PURPOSE: set flag on object to indicate it should never go into an interior
NATIVE PROC SET_IS_EXTERIOR_ONLY(ENTITY_INDEX EntityID, bool bIsExteriorOnly) = "0x1a6aa12fc82e9a8f"
