USING "model_enums.sch"
USING "types.sch"

//~>				Model commands

//INFO: 
//PARAM NOTES:
//PURPOSE: Request streaming to load a model
NATIVE PROC REQUEST_MODEL(MODEL_NAMES ModelIndex) = "0xd69a0c3662175e68"

//INFO: 
//PARAM NOTES:
//PURPOSE: Request streaming to load a model, this is intended for the Pause menu Peds.
NATIVE PROC REQUEST_MENU_PED_MODEL(MODEL_NAMES ModelIndex) = "0x24f2c68f9513392f"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Return if a model is in memory
NATIVE FUNC BOOL HAS_MODEL_LOADED(MODEL_NAMES ModelIndex) = "0x0152aa00fa3130f1"

//INFO: 
//PARAM NOTES:
//PURPOSE:	Requests the room and all the models within it
NATIVE PROC REQUEST_INTERIOR_MODELS ( MODEL_NAMES ModelIndex, STRING RoomName ) = "0x620e68adda3d0a93"

//INFO: 
//PARAM NOTES:
//PURPOSE:	For this pinned interior, request the current set of models in the given room
NATIVE PROC REQUEST_MODELS_IN_ROOM (  INTERIOR_INSTANCE_INDEX InteriorInstanceIndex, STRING RoomName ) = "0x0f1bef3db99b3f66"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Tell streaming that this script no longer needs this model
NATIVE PROC SET_MODEL_AS_NO_LONGER_NEEDED(MODEL_NAMES ModelIndex) = "0xf1a23b343dfedfd0"

//INFO: 
//PARAM NOTES:
//PURPOSE:	Return if model is available in one of the streaming image files
NATIVE FUNC BOOL IS_MODEL_IN_CDIMAGE(MODEL_NAMES ModelIndex) = "0x51046eee00e2bbda"

//PURPOSE: Returns TRUE if a model with this hash exists and is not a streamed archetype. (The hash of a streamed archetype might only be valid at certain locations on the map.)
NATIVE FUNC BOOL IS_MODEL_VALID(MODEL_NAMES modelHash) = "0x61adf697df551da6"

#IF IS_DEBUG_BUILD
//INFO: John Whyte said that this command should be debug-only because it can be slow. Also, we usually try to use
//		model hash keys rather than indices for safety.
//PARAM NOTES:  starting with iPedModelIndex = 0,  until the function returns FALSE
//PURPOSE: Can be used to cycle through all the ped models. More info..
NATIVE FUNC BOOL GET_PED_MODEL_FROM_INDEX (int iPedModelIndex, MODEL_NAMES &ReturnPedModelHashKey) = "0x25a52190ae4733a7"

//INFO: John Whyte said that this command should be debug-only because it can be slow. Also, we usually try to use
//		model hash keys rather than indices for safety.
//PARAM NOTES:, starting with iVehicleModelIndex = 0,  until the function returns FALSE
//PURPOSE: Can be used to cycle through all the vehicle models. More info..
NATIVE FUNC BOOL GET_VEHICLE_MODEL_FROM_INDEX (int iVehicleModelIndex, MODEL_NAMES &ReturnVehicleModelHashKey) = "0x0c5271cf0ccaf6e4"
#ENDIF	//	IS_DEBUG_BUILD

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if this model is a ped
NATIVE FUNC BOOL IS_MODEL_A_PED (MODEL_NAMES ModelHashKey) = "0x5a01a43be2689db0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns TRUE if this model is a vehicle
NATIVE FUNC BOOL IS_MODEL_A_VEHICLE (MODEL_NAMES ModelHashKey) = "0x2886b1bfe0896a9a"

//INFO: The police models don't need to be loaded. 
//PARAM NOTES:
//PURPOSE: For certain network game where the players will never get a wanted level (races).  More info..
NATIVE PROC SET_DITCH_POLICE_MODELS(BOOL bDitch) = "0x2613fa815056d2d9"

//~> 							Collision commands

//INFO: 
//PARAM NOTES:
//PURPOSE:  Tell streaming to request collision about point.
NATIVE PROC REQUEST_COLLISION_AT_COORD(VECTOR VecCoors) = "0xe49a23f069c82c93"

//INFO:  If you need the collision for that object
// immediately you will need to call LOAD_ALL_OBJECTS_NOW and create the object in the same frame, otherwise the 
// collision management code will delete the collision you requested
//PARAM NOTES:
//PURPOSE:  Tell streaming to request collision for a specific model. More info..
NATIVE PROC REQUEST_COLLISION_FOR_MODEL(MODEL_NAMES ModelIndex) = "0xb557c195bbd7d051"

//INFO: 
//PARAM NOTES:
//PURPOSE:	Returns TRUE if the collision for this model is in memory
NATIVE FUNC BOOL HAS_COLLISION_FOR_MODEL_LOADED(MODEL_NAMES ModelIndex) = "0x30229254f181806b"

//~> 						Anim commands 

//INFO:
//PARAM NOTES:
//PURPOSE:  Return if an animation dictionary exists...
NATIVE FUNC BOOL DOES_ANIM_DICT_EXIST(STRING animSetName) = "0xa430c2581c66a9ad"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Request streaming to load an animation dictionary
NATIVE PROC REQUEST_ANIM_DICT(STRING animDictionaryName) = "0x8fb472886552d737"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Return if an animation dictionary is in memory
NATIVE FUNC BOOL HAS_ANIM_DICT_LOADED(STRING animDictionaryName) = "0x6f940c2636c076ad"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Tell streaming that this script no longer needs this dictionary
NATIVE PROC REMOVE_ANIM_DICT(STRING animDictionaryName) = "0xafc1fbf3f6ae7b9a"

//INFO: An animation set represents a defined group of animations that exist in one or more dictionaries
//		Requesting an anim set will automatically request all of the anim dictionaries the set references.
//PARAM NOTES:
//PURPOSE:  Request streaming to load an animation set More info...
NATIVE PROC REQUEST_ANIM_SET(STRING animSetName) = "0x3aca4f727ac4606e"

//INFO: See the notes for REQUEST_ANIM_SET above
//PARAM NOTES:
//PURPOSE:  Return if an animation set is in memory. More info...
NATIVE FUNC BOOL HAS_ANIM_SET_LOADED(STRING animSetName) = "0xbb103a5dec572725"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Tell streaming that this script no longer needs this anim set streamed in
NATIVE PROC REMOVE_ANIM_SET(STRING animSetName) = "0x5f75840181672fad"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Tell streaming that this script no longer needs this clip set streamed in
NATIVE PROC REMOVE_CLIP_SET(STRING animSetName) = "0x840dce5f5f53d8e0"

//INFO: An animation set represents a defined group of animations that exist in one or more dictionaries
//		Requesting an anim set will automatically request all of the anim dictionaries the set references.
//PARAM NOTES:
//PURPOSE:  Request streaming to load an clip set More info...
NATIVE PROC REQUEST_CLIP_SET(STRING animSetName) = "0x511a0af0e8b0bf9a"

//INFO: See the notes for REQUEST_CLIP_SET above
//PARAM NOTES:
//PURPOSE:  Return if an clip set is in memory. More info...
NATIVE FUNC BOOL HAS_CLIP_SET_LOADED(STRING animSetName) = "0xa7a5d14f877c9047"


//INFO: 
//PARAM NOTES:
//PURPOSE:  Load all the objects on the streaming request list
NATIVE PROC LOAD_ALL_OBJECTS_NOW() = "0x0f3dc7925afebdfc"


//~>						Network commands

//INFO: This is used in the network game so a server script can update while doing a load scene
//PARAM NOTES:
//PURPOSE:  Start a non blocking Load scene at position.  More info..
NATIVE PROC NETWORK_START_LOAD_SCENE(VECTOR VecCoors) = "0xba65ca1a62ca5efa"

//INFO:
//PARAM NOTES:
//PURPOSE: Abandons a network load scene, if one is in progress
NATIVE PROC NETWORK_STOP_LOAD_SCENE() = "0x61c0d41714aac740"

//INFO: 
//PARAM NOTES:	If the load scene has finished
//PURPOSE:  Continue a load scene that was started with START_LOAD_SCENE. More info..
NATIVE FUNC BOOL NETWORK_UPDATE_LOAD_SCENE() = "0x5ee9da6c0c12274b"

NATIVE FUNC BOOL IS_NETWORK_LOADING_SCENE() = "0x340c8b9022477b2f"

//~> 					Scene commands

//INFO: Can get the interior id from GET_INTERIOR_AT_COORDS and room key from GET_HASH_KEY(roomName)
//PARAM NOTES:
//PURPOSE:  Load scene as if in an interior. More info..
NATIVE PROC LOAD_SCENE_FOR_ROOM_BY_KEY(INTERIOR_INSTANCE_INDEX interiorId, INT roomKey) = "0x77266ff77886d086"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Load scene at position
NATIVE PROC LOAD_SCENE(VECTOR VecCoors) = "0x42c4310e76ad635a"

//INFO: 
//PARAM NOTES:
//PURPOSE:	Switch streaming of the scene on or off
NATIVE PROC SET_SCENE_STREAMING(BOOL onOff) = "0xafa0231603f22be9"

//~>						Interior commands

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_INTERIOR_ACTIVE (INTERIOR_INSTANCE_INDEX interiorId, BOOL bActivate) = "0x28a0a1eb9d59910d"

//~> 					IPL commands 


//INFO: 
//PARAM NOTES:
// PURPOSE: Request streaming to load an IPL file
NATIVE PROC REQUEST_IPL(STRING IplName) = "0x13a763a67ba2a95b"

//INFO: 
//PARAM NOTES:
// PURPOSE: Remove a streamable IPL
NATIVE PROC REMOVE_IPL(STRING IplName) = "0x9d2accf306f3a0c5"

//INFO: 
//PARAM NOTES:
// PURPOSE: return if IPL is active (will stream when in range)
NATIVE FUNC BOOL IS_IPL_ACTIVE(STRING IplName) = "0x8dd54478cfa35f08"


//INFO: 
//PARAM NOTES:
// PURPOSE: loads selected water file: 0=main V map, 1=Island Heist DLC
NATIVE PROC LOAD_GLOBAL_WATER_FILE(INT WATER_ID) = "0x11f9af5e230d40d6"

//INFO: 
//PARAM NOTES:
// PURPOSE: returns currently active water file: 0=main V map, 1=Island Heist DLC
NATIVE FUNC INT GET_GLOBAL_WATER_FILE() = "0xcb446f8296efd9bb"


//~> 						Particle commands 

//INFO: 
//PARAM NOTES:
//PURPOSE:  Request streaming to load the particle asset associated with this script
NATIVE PROC REQUEST_PTFX_ASSET() = "0x9e63031c188793e1"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Query if the particle asset associated with this script has loaded
NATIVE FUNC BOOL HAS_PTFX_ASSET_LOADED() = "0x51b6c2ef8dbe2e1a"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Tell streaming that this script no longer needs its particle asset
NATIVE PROC REMOVE_PTFX_ASSET() = "0xe6239ccb98b8ab66"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Request streaming to load a particle asset by name (only use if not loading the one associated with this script)
NATIVE PROC REQUEST_NAMED_PTFX_ASSET(STRING ptFxAssetName) = "0xd86c99569d4749b0"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Query if the named particle asset has loaded (only use if not loading the one associated with this script)
NATIVE FUNC BOOL HAS_NAMED_PTFX_ASSET_LOADED(STRING ptFxAssetName) = "0x6264b811e8d92198"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Tell streaming that this script no longer needs the named particle asset (only use if not loading the one associated with this script)
NATIVE PROC REMOVE_NAMED_PTFX_ASSET(STRING ptFxAssetName) = "0x416ba6ce9f7e648b"


//~>				Streaming commands

//INFO: 
//PARAM NOTES:
//PURPOSE:  Switch streaming on and off
NATIVE PROC SET_STREAMING(BOOL onOff) = "0x8e4329fd81081a2a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return if the streaming system is prioritising certain objects because it needs them in now. 
NATIVE FUNC BOOL IS_STREAMING_PRIORITY_REQUESTS() = "0x443cd194a3b45769"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return how many objects are on the streaming request list.
NATIVE FUNC INT GET_NUMBER_OF_STREAMING_REQUESTS() = "0xee21e8a6031cea47"

//INFO: 
//PARAM NOTES:
//PURPOSE:  have game stream extra collision and IPL files around this coordinate. This function needs called every frame the 
//			additional data is needed
NATIVE PROC REQUEST_ADDITIONAL_COLLISION_AT_COORD(VECTOR Vec) = "0x616bf5910d72dca9"

//INFO: The credits will call it with FALSE at the start and 
//	TRUE at the end. This is to stop the scrolling of the credits from pausing when the player warps from 
//	one area of the city to another during the screen fades.
//PARAM NOTES:
//PURPOSE:	This should only be called by the end credits script. More info..
NATIVE PROC SET_GAME_PAUSES_FOR_STREAMING(BOOL bAllowPause) = "0x47c032cd609587ee"

//INFO:  If we are playing back then this loads the list and does
// a load scene for the initial set of objects. If we are recording this initialises the record
//PARAM NOTES:
//PURPOSE: Set the start point for a streaming request list. More info..
NATIVE PROC SET_REDUCE_PED_MODEL_BUDGET(BOOL bReduce) = "0x718886bcae2bd894"

//INFO: For certain multiplayer missions, is good for deathmatches and such. 
//PARAM NOTES:
//PURPOSE: can be called to reduce the number of vehicle models streamed.  More info.. 
NATIVE PROC SET_REDUCE_VEHICLE_MODEL_BUDGET(BOOL bReduce) = "0x9a78aa1fbfc8a2ac"

//INFO:  Set the memory budget level for vehicle population [0, 3] where  0 = lowest (no cars) and 3 = full budget
//PARAM NOTES:
//PURPOSE:  Set vehicle population budget level: 0 = lowest (no cars) and 3 = full budget
NATIVE PROC SET_VEHICLE_POPULATION_BUDGET(int budgetLevel) = "0xa121d58142738a8d"

//INFO:  Set the memory budget level for ped population [0, 3] where  0 = lowest (no peds) and 3 = full budget
//PARAM NOTES:
//PURPOSE:  Set ped population budget level: 0 = lowest (no peds) and 3 = full budget
NATIVE PROC SET_PED_POPULATION_BUDGET(int budgetLevel) = "0x8c5e1b04c94ff212"

//INFO:	Clears the overridden game focus and sets it to the player ped again (default)
//PARAM NOTES:
//PURPOSE:	The game focus is used for loading map data, collisions, object population etc.
//			If this has been overridden by script, it is important to clear it afterwards
NATIVE PROC CLEAR_FOCUS() = "0x5639e771f6085bf6"

//INFO:	Overrides the game focus and sets it to specified position and velocity
//PARAM NOTES: pos (position in world, vel(velocity to use for ped & vehicle population)
//PURPOSE:	The game focus is used for loading map data, collisions, object population etc.
//			This command overrides it for the specified position and velocity
NATIVE PROC SET_FOCUS_POS_AND_VEL(VECTOR pos, VECTOR vel) = "0x7d5c42a7cdb11db6"

//INFO:	Sets the specified entity as the focus for streaming
//PARAM NOTES: entity index
//PURPOSE:	The game focus is used for loading map data, collisions, object population etc.
//			This command overrides it for the specified entity.
NATIVE PROC SET_FOCUS_ENTITY(ENTITY_INDEX entityIndex) = "0x34582635da718e5a"

//INFO: returns true if the specified entity is the current focus.
NATIVE FUNC BOOL IS_ENTITY_FOCUS(ENTITY_INDEX entityIndex) = "0xf184bef0dbd3ad20"

//INFO:	Special case - on player switch termination script may want to restore
//  focus to a specific ped rather than the default current player ped
//PARAM NOTES: entity index
//PURPOSE:	The game focus is used for loading map data, collisions, object population etc.
//			This command overrides it for the specified entity.
NATIVE PROC SET_RESTORE_FOCUS_ENTITY(ENTITY_INDEX entityIndex) = "0xe35fcef2127afccf"

//INFO:	Sets a named IPL cull box to be enabled or not
//PARAM NOTES:
//PURPOSE:	Artists place cull boxes into the map to help eliminate map sections when the player
//			is within the box - this command is used to enable or disable them, referred to by name.
//			This could in turn be used to do things like hide or show the entire map etc.
NATIVE PROC SET_MAPDATACULLBOX_ENABLED(STRING boxName, BOOL bEnabled) = "0xa624331352defdcd"

//INFO: Sets all of the map data to be culled (or not)
//PARAM NOTES: bCulled - true to cull all map data, false to undo
//PURPOSE: it may be useful for script to cull all of the map data (e.g. during UI screens for multiplayer etc)
NATIVE PROC SET_ALL_MAPDATA_CULLED(BOOL bCulled) = "0x4c6cbcfdd1730e10"

//INFO: Sets all of the horizon objects to be culled
//PARAM NOTES: bCulled - true to cull all horizon objects, false to undo
//PURPOSE:
NATIVE PROC SET_HORIZON_OBJECTS_CULLED(BOOL bCulled) = "0x0243893e8540fa67"

// flags to specify what assets are required for a new stream volume
ENUM STREAMVOL_ASSET_TYPES
    FLAG_COLLISIONS_MOVER			= 1,
    FLAG_COLLISIONS_WEAPON			= 2,
    FLAG_MAPDATA					= 12
ENDENUM

ENUM STREAMVOL_LOD_FLAGS
	STREAMVOL_LOD_FLAG_HIGH			= 33,		// 0b00100001
	STREAMVOL_LOD_FLAG_LOW			= 94,		// 0b01011110
	STREAMVOL_LOD_FLAG_ALL			= 127		// 0b01111111
ENDENUM

//INFO:	Creates a new spherical streaming volume for the specified asset types.
//		Returns index of volume if successful, or -1 otherwise
//PARAM NOTES: assetFlags specifies what type of assets you want the volume to request and hold in memory. 
//				The majority of cases will only require map data
//				and mover collision, specified as FLAG_COLLISIONS_MOVER | FLAG_MAPDATA
//PURPOSE: a streaming volume is a volume of the map which issues streaming requests for the specified assets,
//				as a method for pre-streaming collisions or map data. this is an extremely expensive thing to do, so it is important
//				to destroy the volume when no longer needed
NATIVE FUNC STREAMVOL_ID STREAMVOL_CREATE_SPHERE(VECTOR pos, float radius, STREAMVOL_ASSET_TYPES assetFlags, STREAMVOL_LOD_FLAGS lodFlags = STREAMVOL_LOD_FLAG_ALL) = "0xd6d670d39e5eb332"

//INFO:	Creates a new frustum streaming volume for the specified asset types.
//		Returns index of volume if successful, or -1 otherwise
//PARAM NOTES: assetFlags specifies what type of assets you want the volume to request and hold in memory. 
//				The majority of cases will only require map data
//				and mover collision, specified as FLAG_COLLISIONS_MOVER | FLAG_MAPDATA
//PURPOSE: a streaming volume is a volume of the map which issues streaming requests for the specified assets,
//				as a method for pre-streaming collisions or map data. this is an extremely expensive thing to do, so it is important
//				to destroy the volume when no longer needed
NATIVE FUNC STREAMVOL_ID STREAMVOL_CREATE_FRUSTUM(VECTOR pos, VECTOR dir, float farClip, STREAMVOL_ASSET_TYPES assetFlags, STREAMVOL_LOD_FLAGS lodFlags = STREAMVOL_LOD_FLAG_ALL) = "0xedf40cc24ee4ff61"

//INFO:	Creates a new line-segment streaming volume for the specified asset types.
//		Returns index of volume if successful, or -1 otherwise
//PARAM NOTES: currently the only asset supported is FLAG_COLLISIONS_MOVER
//PURPOSE: a streaming volume is a volume of the map which issues streaming requests for the specified assets,
//				as a method for pre-streaming collisions or map data. this is an extremely expensive thing to do, so it is important
//				to destroy the volume when no longer needed
NATIVE FUNC STREAMVOL_ID STREAMVOL_CREATE_LINE(VECTOR pos1, VECTOR pos2, STREAMVOL_ASSET_TYPES assetFlags) = "0x83a445abf2242661"

//INFO: Destroys an existing stream volume which is no longer required.
//PARAM NOTES: volumeIndex - the index returned from a previous call to STREAMVOL_CREATE
//PURPOSE: it is critical to remove a stream volume once it is no longer needed, as they have extremely high memory costs attached.
NATIVE PROC STREAMVOL_DELETE(STREAMVOL_ID volumeIndex) = "0x7de67eeefec38205"

//INFO:	Returns true if the stream volume at the specified index has been fulled satisfied, false otherwise.
//PARAM NOTES: volumeIndex - the index returned from a previous call to STREAMVOL_CREATE
//PURPOSE: stream volumes attempt to fully satisfy requirements, but there are no guarantees in terms of memory availability etc.
NATIVE FUNC BOOL STREAMVOL_HAS_LOADED(STREAMVOL_ID volumeIndex) = "0x247b9cd82fd64f32"

//INFO:	Returns true if the stream volume at the specified index is valid and active, false otherwise
//PARAM NOTES:	volumeIndex - the index returned from a previous call to STREAMVOL_CREATE
//PURPOSE:
NATIVE FUNC BOOL STREAMVOL_IS_VALID(STREAMVOL_ID volumeIndex) = "0x52d132f41e04cb67"

//INFO: Returns true if there is some currently active streaming volume
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC BOOL IS_STREAMVOL_ACTIVE() = "0xff4a0a9572c2f565"

ENUM NEWLOADSCENE_FLAGS
	NEWLOADSCENE_FLAG_REQUIRE_COLLISION			= 1,
	NEWLOADSCENE_FLAG_LONGSWITCH_CUTSCENE		= 2,
	NEWLOADSCENE_FLAG_INTERIOR_AND_EXTERIOR		= 4
ENDENUM

//INFO:	starts a new frustum load scene, which is interior-aware and uses a streaming volume
//PARAM NOTES: position, direction of camera, range (e.g. 20m)
//PURPOSE: asynchronously load a location (could be inside an interior, or not). returns true if load scene has started successfully, false otherwise.
NATIVE FUNC BOOL NEW_LOAD_SCENE_START(VECTOR pos, VECTOR dir, float farClip, NEWLOADSCENE_FLAGS controlFlags = 0) = "0xb37c5672ee23d04f"

//INFO:	starts a new spherical load scene, which is interior-aware and uses a streaming volume. this cannot be used during a player switch.
//PARAM NOTES: position, direction of camera, range (e.g. 20m)
//PURPOSE: asynchronously load a location (could be inside an interior, or not). returns true if load scene has started successfully, false otherwise.
NATIVE FUNC BOOL NEW_LOAD_SCENE_START_SPHERE(VECTOR pos, float radius, NEWLOADSCENE_FLAGS controlFlags = 0) = "0xca60df1d01dbd440"

//INFO:	stops the new load scene, if it is active
//PARAM NOTES:
//PURPOSE:
NATIVE PROC NEW_LOAD_SCENE_STOP() = "0xee3a19a84a10f8b9"

//INFO:	check if a new load scene is currently running
//PARAM NOTES:
//PURPOSE: returns true if a new load scene is active, false otherwise
NATIVE FUNC BOOL IS_NEW_LOAD_SCENE_ACTIVE() = "0x2981c54770e1d19c"

//INFO: check if a new load scene is fully loaded. this it never guaranteed to eventually return true
//PARAM NOTES:
//PURPOSE: returns true if the new load scene is active and fully loaded. may never return true if memory is under heavy load
NATIVE FUNC BOOL IS_NEW_LOAD_SCENE_LOADED() = "0x8a6ab093d1ee5368"

//INFO:	sets collision streamer to only request collision for movement, and ignore collision for weapon tests.
//PARAM NOTES:
//PURPOSE: should be called each frame. when it isn't called, game automatically reverts to normal collision streaming behaviour
NATIVE PROC REQUEST_MOVER_COLLISION_ONLY() = "0xfeab902a1748345f"

// control flags for player switching
ENUM SWITCH_FLAGS
	SWITCH_FLAG_SKIP_INTRO				= 1,
	SWITCH_FLAG_SKIP_OUTRO				= 2,
	SWITCH_FLAG_PAUSE_BEFORE_PAN		= 4,
	SWITCH_FLAG_PAUSE_BEFORE_OUTRO		= 8,
	SWITCH_FLAG_SKIP_PAN				= 16,
	SWITCH_FLAG_UNKNOWN_DEST			= 32,
	SWITCH_FLAG_DESCENT_ONLY			= 64,
	SWITCH_FLAG_START_FROM_CAMPOS		= 128,
	SWITCH_FLAG_PAUSE_BEFORE_ASCENT		= 256,
	SWITCH_FLAG_PAUSE_BEFORE_DESCENT	= 512,
	SWITCH_FLAG_ALLOW_SNIPER_AIM_INTRO	= 1024,
	SWITCH_FLAG_ALLOW_SNIPER_AIM_OUTRO	= 2048,
	SWITCH_FLAG_SKIP_TOP_DESCENT		= 4096,
	SWITCH_FLAG_SUPPRESS_OUTRO_FX		= 8192,
	SWITCH_FLAG_SUPPRESS_INTRO_FX		= 16384,
	SWITCH_FLAG_DELAY_ASCENT_FX			= 32768
ENDENUM

// List of states the player switch manager can be in. Must match up
// with eState in CPlayerSwitchMgrLong
// TODO: Remove SWITCH_STATE_OUTRO once the script reference has been changed to (>=) SWITCH_STATE_OUTRO_HOLD
ENUM SWITCH_STATE
	SWITCH_STATE_INTRO			= 0,
	SWITCH_STATE_PREP_DESCENT,
	SWITCH_STATE_PREP_FOR_CUT,
	SWITCH_STATE_JUMPCUT_ASCENT,
	SWITCH_STATE_WAITFORINPUT_INTRO,
	SWITCH_STATE_WAITFORINPUT,
	SWITCH_STATE_WAITFORINPUT_OUTRO,
	SWITCH_STATE_PAN,
	SWITCH_STATE_JUMPCUT_DESCENT,
	SWITCH_STATE_OUTRO_HOLD,
	SWITCH_STATE_OUTRO_SWOOP,
	SWITCH_STATE_ESTABLISHING_SHOT,
	SWITCH_STATE_FINISHED,
	SWITCH_STATE_OUTRO = SWITCH_STATE_OUTRO_HOLD
ENDENUM

// List of states the short-range player switch manager can be in. Must match up
// with eState in CPlayerSwitchMgrShort
ENUM SHORT_SWITCH_STATE
	SHORT_SWITCH_STATE_INTRO	= 0,
	SHORT_SWITCH_STATE_OUTRO
ENDENUM

// List of styles the short-range player switch manager can use.
// Must match up with eStyle in CPlayerSwitchMgrShort
ENUM SHORT_SWITCH_STYLE
	SHORT_SWITCH_STYLE_ROTATION = 0,
	SHORT_SWITCH_STYLE_TRANSLATION,
	SHORT_SWITCH_STYLE_ZOOM_TO_HEAD,
	SHORT_SWITCH_STYLE_ZOOM_IN_OUT
ENDENUM

// List of switch types currently supported. The default (auto) just automatically
// selects the most appropriate switch type based on the distance between two peds.
ENUM SWITCH_TYPE
	SWITCH_TYPE_AUTO			= 0,
	SWITCH_TYPE_LONG,
	SWITCH_TYPE_MEDIUM,
	SWITCH_TYPE_SHORT
ENDENUM

//INFO: 
//PARAM NOTES:
//PURPOSE: Sees if it's OK to start a player switch (not in the middle of death or arrest currently)
NATIVE FUNC BOOL IS_SAFE_TO_START_PLAYER_SWITCH() = "0x3510bf4043201732"

//INFO: starts player switch
//PARAM NOTES: flags specifies a number of control options as per enum SWITCH_FLAGS
//PURPOSE: starts a player switching sequence
NATIVE PROC START_PLAYER_SWITCH(PED_INDEX oldPedIndex, PED_INDEX newPedindex, SWITCH_FLAGS flags, SWITCH_TYPE type = SWITCH_TYPE_AUTO) = "0xccd7aa32a884016d"

//INFO:	abandons currently running player switch
//PARAM NOTES:
//PURPOSE: ends the currently active player switch. camera and focus will revert to whatever the current player ped is.
NATIVE PROC STOP_PLAYER_SWITCH() = "0x310f3c51704851d4"

//INFO:
//PARAM NOTES:
//PURPOSE: returns true if switch is in progress, false otherwise
NATIVE FUNC BOOL IS_PLAYER_SWITCH_IN_PROGRESS() = "0x04458b4e5d9e466a"

//INFO:	returns the type of currently active player switch
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC SWITCH_TYPE GET_PLAYER_SWITCH_TYPE() = "0xb6bdac890771ed04"

//INFO: returns  the ideal type of player switch based on the distance from start to end positions.
//PARAM NOTES:
//PURPOSE: this follows the same logic as used by the player switch system when auto-selecting switch type
NATIVE FUNC SWITCH_TYPE GET_IDEAL_PLAYER_SWITCH_TYPE(VECTOR vStartPos, VECTOR vEndPos) = "0x22c67338735160aa"

//INFO:
//PARAM NOTES:
//PURPOSE: returns current state of player switch, as per enum SWITCH_STATE
NATIVE FUNC SWITCH_STATE GET_PLAYER_SWITCH_STATE() = "0xeefb36b938654045"

//INFO:
//PARAM NOTES:
//PURPOSE: returns current state of a short player switch, as per enum SHORT_SWITCH_STATE
NATIVE FUNC SHORT_SWITCH_STATE GET_PLAYER_SHORT_SWITCH_STATE() = "0xaa8fd727e9cd9929"

//INFO:
//PARAM NOTES:
//PURPOSE: must be called AFTER START_PLAYER_SWITCH, overrides the style the short range player switch will use
NATIVE PROC SET_PLAYER_SHORT_SWITCH_STYLE(SHORT_SWITCH_STYLE style) = "0xe48e4b99dba9eaa1"

//INFO:
//PARAM NOTES:
//PURPOSE: returns the index of the current jump cut of a player switch, 0 being the lowest altitude cut
NATIVE FUNC INT GET_PLAYER_SWITCH_JUMP_CUT_INDEX() = "0x39c67356e2acaf22"

//INFO: overrides the end scene for the player switch
//PARAM NOTES:
//PURPOSE: use this immediately after starting a player switch if the first frame of the outro
// camera (e.g. motion builder cam etc) isn't the same as the ped position. this allows streaming
// to request that scene (instead of a sphere around the new ped pos).
NATIVE PROC SET_PLAYER_SWITCH_OUTRO(VECTOR vCamPos, VECTOR vCamRot, FLOAT fCamFov, FLOAT fCamFarClip, EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0xd6466d9b50e967e5"

//INFO: sets an establishing shot to be used for player switch, occurs before outro
//PARAM NOTES:
//PURPOSE: use this immediately after starting a player switch
NATIVE PROC SET_PLAYER_SWITCH_ESTABLISHING_SHOT(STRING establishingShotName) = "0x6c31ccf5981b2c06"

//INFO: allows currently active switch to perform pan (if it was waiting)
//PARAM NOTES:
//PURPOSE: script can request a player switch which pauses before the pan, for example if waiting for script requested assets
// to load etc. This command signals to the player switch system that it is clear to proceed with the pan
NATIVE PROC ALLOW_PLAYER_SWITCH_PAN() = "0x4e554357e32f827c"

//INFO: allows currently active switch to perform outro (if it was waiting)
//PARAM NOTES:
//PURPOSE: script can request a player switch which pauses before the outro, for example if waiting for script requested assets
// to load etc. This command signals to the player switch system that it is clear to proceed with the outro
NATIVE PROC ALLOW_PLAYER_SWITCH_OUTRO() = "0x92fe9bfdb58c08b1"

//INFO: allows currently active switch to perform ascent (once loaded)
//PARAM NOTES:
//PURPOSE: script can request a player switch which pauses before the ascent, for example if waiting for script camera
// to finish etc. This command signals to the player switch system that it is clear to proceed with the ascent
NATIVE PROC ALLOW_PLAYER_SWITCH_ASCENT() = "0x01aa29ae1a82b574"

//INFO: allows currently active switch to perform descent (once loaded)
//PARAM NOTES:
//PURPOSE: script can request a player switch which pauses before the descent, for example if waiting for streaming
// to finish etc. This command signals to the player switch system that it is clear to proceed with the ascent
NATIVE PROC ALLOW_PLAYER_SWITCH_DESCENT() = "0x2192f61b6fb23e19"

//INFO: returns true if active switch is paused before ascent but clear to proceed
//PARAM NOTES:
//PURPOSE: used in conjunction with SWITCH_FLAG_PAUSE_BEFORE_ASCENT and ALLOW_PLAYER_SWITCH_ASCENT
NATIVE FUNC BOOL IS_SWITCH_READY_FOR_ASCENT() = "0xa7589c3c447ac818"

//INFO: returns true if active switch is paused before descent but clear to proceed
//PARAM NOTES:
//PURPOSE: used in conjunction with SWITCH_FLAG_PAUSE_BEFORE_DESCENT and ALLOW_PLAYER_SWITCH_DESCENT
NATIVE FUNC BOOL IS_SWITCH_READY_FOR_DESCENT() = "0xf7fa5e5f48d7ef30"

//INFO: sets the "pause before descent flag" - only permitted when waiting for input destination
//PARAM NOTES:
//PURPOSE:
NATIVE PROC ENABLE_SWITCH_PAUSE_BEFORE_DESCENT() = "0xe28d19155d6799a8"

//INFO: Sets the "supress outro FX" flag on an ongoing switch
//PARAM NOTES:
//PURPOSE:
NATIVE PROC DISABLE_SWITCH_OUTRO_FX() = "0x3e99c894fa419af2"

//INFO: returns true if active switch will skip the descent entirely
NATIVE FUNC BOOL IS_SWITCH_SKIPPING_DESCENT() = "0x9fd60deda01f20a5"

//INFO: starts the ascent and hold part of the player switch (when going from SP to MP)
//PARAM NOTES: only use LONG switch here unless you've already checked the distance using GET_IDEAL_SWITCH_TYPE
//PURPOSE: 
NATIVE PROC SWITCH_TO_MULTI_FIRSTPART(PED_INDEX oldPed, SWITCH_FLAGS flags, SWITCH_TYPE type = SWITCH_TYPE_LONG) = "0xa1bc090595ba935f"

//INFO: pan and descend to the destination ped during player switch (when going from SP to MP)
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SWITCH_TO_MULTI_SECONDPART(PED_INDEX newPed) = "0xbaac2fbaae6257db"

//INFO: returns true if ascent has finished (so it is OK to display multiplayer menu etc)
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL IS_SWITCH_TO_MULTI_FIRSTPART_FINISHED() = "0x5e9ec8eea03bcec7"

//INFO: returns the duration of any interpolation out of an establishing shot, in milliseconds, or 0 if invalid
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC INT GET_PLAYER_SWITCH_INTERP_OUT_DURATION() = "0x78fd52dd96d53522"

//INFO: returns the current interpolation time out of an establishing shot, in milliseconds. -1 will be returned if interpolation is not in progress
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC INT GET_PLAYER_SWITCH_INTERP_OUT_CURRENT_TIME() = "0x5ad9f5341c05bc7d"

//INFO: forces the spherical scene streamer to track with camera position rather than focus position, this frame only.
//PARAM NOTES:
//PURPOSE: special case fix. needs to be called every frame.
NATIVE PROC SET_SCENE_STREAMING_TRACKS_CAM_POS_THIS_FRAME() = "0xa63f1768421c7a80"

//INFO: override the global LOD scale this frame
//PARAM NOTES: 1.0 is normal, less than 1.0 means more lods, greater than 1.0 means more detail
//PURPOSE: script calls this every frame to override the global LOD scale. when the script stops calling it, the value automatically blends back to default
NATIVE PROC OVERRIDE_LODSCALE_THIS_FRAME(FLOAT fLodScale) = "0x9b8b94a1196f345f"

//INFO: overrides the LOD scale. for example if you have specific camera FOV behaviour that result
// in a LOD scale between fOldMin and fOldMax, we take the camera-fov-desired LOD scale and instead calculate
// a new LOD scale in the range fNewMin to fNewMax.
//PARAM NOTES: old range min / max, new range min/max
//PURPOSE: allows us to remap LOD scale range (e.g. from 1.0-9.0 to 0.8-3.2 or whatever)
NATIVE PROC REMAP_LODSCALE_RANGE_THIS_FRAME(FLOAT fOldMin, FLOAT fOldMax, FLOAT fNewMin, FLOAT fNewMax) = "0x34666baa70bf66df"

//INFO: returns current global LOD scale
NATIVE FUNC FLOAT GET_LODSCALE() = "0xb32301583643b6b3"

//INFO: stops the game from requesting new high detail imap files (e.g. to help streaming performance when flying fast etc)
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SUPPRESS_HD_MAP_STREAMING_THIS_FRAME() = "0xb1a39942d4e31aa5"

//INFO: force-enable time-based LOD fading this frame. This is a very special-case command intended for car-steal eye in the sky mission etc.
NATIVE PROC FORCE_ALLOW_TIME_BASED_FADING_THIS_FRAME() = "0x7426ead34c015246"

//INFO: Set the game to only render HD models (or not) and strip out all LODs from the scene.
//PARAM NOTES: hdOnly, true if enabled, false otherwise
//PURPOSE: in very specific circumstances it may be desirable to pre-stream a tiny HD scene and cut to it,
// and stop the game from trying to draw nearby LODs etc.
NATIVE PROC SET_RENDER_HD_ONLY(BOOL hdOnly) = "0xd2726749ba8dac02"

//INFO: starts pre-streaming for a seamless swap from first IPL group to second
//PARAM NOTES: iplGroupBefore is the currently enabled IPL group, and iplGroupAfter is the desired end state IPL group
//PURPOSE: allows user to pre-stream the end state IPL group. once it is ready the swap can be performed. Once a swap
// has been started, it must either be cancelled or finished to release the streaming resources.
NATIVE PROC IPL_GROUP_SWAP_START(STRING iplGroupBefore, STRING iplGroupAfter) = "0x25cf3b0410cd653c"

//INFO: complete an active IPL group swap that is ready
//PARAM NOTES:
//PURPOSE: returns true if the currently active script-owned IPL group swap is ready to perform the swap
//ie the end state IPL group has all its assets in memory. This disables the start state and enables the end state.
NATIVE PROC IPL_GROUP_SWAP_FINISH() = "0x015da57f7a0fa1a6"

//INFO: abandon a currently active IPL group swap
//PARAM NOTES:
//PURPOSE: in certain cases (time out, z-skip, script termination etc) it may be desirable to simply abandon the active
// IPL group swap and release its streaming resources.
NATIVE PROC IPL_GROUP_SWAP_CANCEL() = "0x8de9b7e224bcb723"

//INFO: indicates that the end state IPL group assets are all in memory and the swap is ready to be finished
//PARAM NOTES:
//PURPOSE: returns true if the swap is ready to finish, false otherwise
NATIVE FUNC BOOL IPL_GROUP_SWAP_IS_READY() = "0x329d6926716ee57f"

//INFO: indicates that there is a scripted IPL group swap active
//PARAM NOTES:
//PURPOSE:: returns true if a swap is active
NATIVE FUNC BOOL IPL_GROUP_SWAP_IS_ACTIVE() = "0x29978d4627985414"

//INFO: bank only (for trailer2)
//PARAM NOTES: position and radius for sphere streaming extra distant lights
//PURPOSE: enable streaming a spherical volume of extra distant lights
NATIVE PROC ENABLE_EXTRA_DISTANTLIGHTS(VECTOR pos, FLOAT radius) = "0x0ea9823cbd5fc533"

//INFO: bank only (for trailer2)
//PARAM NOTES:
//PURPOSE: disable streaming a spherical volume of extra distant lights
NATIVE PROC DISABLE_EXTRA_DISTANTLIGHTS() = "0x04ea50ecc60d4da3"

//PURPOSE: Tells the system to load a streaming request list and load all the assets needed for the first frame of
//         its cutscene.
//         Call this function several seconds before the cutscene is meant to be played, and wait until HAS_SRL_LOADED
//         before beginning the cutscene and calling BEGIN_SRL.
// PARAM NOTES: cutsceneName is any arbitrary cutscene name. The system will automatically append "_srl" to it when saving it to the assets folder.
NATIVE PROC PREFETCH_SRL(STRING cutsceneName) = "0x0728c4d61e5ace06"

//PURPOSE: Check to see whether or not the SRL prefetched with PREFETCH_SRL has finished loading all assets for the
//         the cutscene. You should wait with playing back the scripted cutscene until this returns true, or else there
//         might be assets popping in and out.
NATIVE FUNC BOOL IS_SRL_LOADED() = "0xd66fb6b74ee3da66"

//PURPOSE: Marks the beginning of a streaming request list. This can be called before playing back a scripted cutscene.
//         If recording is enabled in RAG, the system will record all visible assets and save them to a file once the
//         SRL is done (after the call to END_SRL).
//         If recording is disabled (which is normally the case), the recorded assets from the SRL will be requested
//         as the scripted cutscene plays.
//         You must call PREFETCH_SRL before calling this function!
NATIVE PROC BEGIN_SRL() = "0x670baa84466115ca"

//PURPOSE: Indicate that the current scripted cutscene has finished playing. This will end SRL playback. If RAG had been
//         set to record the SRL, this function will save the SRL to the assets folder.
NATIVE PROC END_SRL() = "0x7e8f5ae44588d398"

//PURPOSE: This function should be called ideally once a frame during playback of a script-driven cutscene that has an SRL.
//         It provides the streaming request list guidance of where in the cutscene we currently are - the parameter should be 0.0
//         when the cutscene first starts, and then be the number of MILLIseconds since the beginning of the cutscene,
//         i.e. the number of seconds times 1000.
//         Note that this shouldn't necessarily be the number of milliseconds in real time - just the number of milliseconds you would expect
//         if the cutscene were to play back fluently at full framerate. The key is that this needs to be identical in each run, meaning
//         if there is a camera cut at 4000.0, it needs to always happen at 4000.0.
NATIVE PROC SET_SRL_TIME(FLOAT time) = "0x7e887f52de52d931"

// PURPOSE: Call this at any time before or during a cutscene (but ideally at least 5 seconds before it ends) to indicate where
//          the camera will be after the cutscene is over. The streaming system will make sure that scene is in memory before the
//          cutscene switches back to normal gameplay.
// PARAM NOTES: camPos indicates the camera position, camDir is the direction it is looking at.
NATIVE PROC SET_SRL_POST_CUTSCENE_CAMERA(VECTOR camPos, VECTOR camDir) = "0xf5d67a1497505f00"

// PURPOSE: Determine how far in advance an SRL streams. By default, it's 3 seconds.
//          Call this right after calling PREFETCH_SRL().
// PARAM NOTES: There are four arguments. Two each for "while prestreaming" vs "while playing back the cutscene", and two each for "loading assets"
//              vs "loading maps". "Assets" are the actual drawables, those can be big, expensive textures and models. "Maps" contain information about
//              what buildings and props there are. -1 for any of those values will use the default.
NATIVE PROC SET_SRL_READAHEAD_TIMES(INT prestreamMap, INT prestreamAssets, INT playbackMap, INT playbackAssets) = "0x125f5e3a0150ab0d"

// PURPOSE: Enable or disable Long Jump Mode for cutscenes. This should be enabled if the cutscene involves camera cuts across long distances.
//          Call this right after calling PREFETCH_SRL().
NATIVE PROC SET_SRL_LONG_JUMP_MODE(BOOL enableLongJumpMode) = "0xa694a53a397fc676"

ENUM SRL_PRESTREAM_MODE
	SRL_PRESTREAM_DEFAULT = 0,
	SRL_PRESTREAM_FORCE_ON,		// 1
	SRL_PRESTREAM_FORCE_OFF,		// 2
	SRL_PRESTREAM_FORCE_COMPLETELY_OFF		// 3
ENDENUM


// PURPOSE: Enable or disable forced prestreaming for cutscenes. If enabled, the SRL will always preload map data for the first
//          frame of a cutscene, even if it is far away. BE CAREFUL when using this function. Only use it when you are CERTAIN
//          that the current camera position and the first frame of the cutscene can't get too far away, and when you're certain
//          that the two scenes are not particularly rich in entities. Otherwise, you will crash with a pool overflow.
NATIVE PROC SET_SRL_FORCE_PRESTREAM(SRL_PRESTREAM_MODE forcePrestream) = "0xa8b7321f953cff17"

// PURPOSE: Sets a sphere where all assets will have their HD assets triggered
NATIVE PROC SET_HD_AREA(VECTOR position, FLOAT radius) = "0x74f17c1a1b5f2f56"

// PURPOSE: Clears the HD area
NATIVE PROC CLEAR_HD_AREA() = "0x41bb0bac020b994f"

NATIVE PROC INIT_CREATOR_BUDGET() = "0x3e2d4acdeb176503"

NATIVE PROC SHUTDOWN_CREATOR_BUDGET() = "0xdd631a688bd16327"

NATIVE FUNC BOOL HAS_ROOM_FOR_MODEL_IN_CREATOR_BUDGET(MODEL_NAMES modelHash) = "0x9fa7ce1e863f69fb"

NATIVE FUNC BOOL ADD_MODEL_TO_CREATOR_BUDGET(MODEL_NAMES modelHash) = "0x66eb6fa2c84f8e14"

NATIVE PROC REMOVE_MODEL_FROM_CREATOR_BUDGET(MODEL_NAMES modelHash) = "0xac51edc6ac06cfee"

NATIVE FUNC FLOAT GET_USED_CREATOR_BUDGET() = "0x67b39fa5cb56f775"

NATIVE PROC SET_ISLAND_ENABLED ( STRING islandName, BOOL enabled ) = "0x17d70b6d85547996"

NATIVE FUNC BOOL ARE_ISLAND_IPLS_ACTIVE() = "0x24bed3d8303d66b6"

NATIVE FUNC BOOL IS_GAME_INSTALLED() = "0xa6fa11b890aaa882"

