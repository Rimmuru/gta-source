

// ENUM : GET_SAFE_COORD_FLAGS
// Flags to be passed in to GET_SAFE_COORD_FOR_PED to govern which navmesh polygons it considers

ENUM GET_SAFE_COORD_FLAGS
	// Default
	GSC_FLAG_DEFAULT						= 0,
	// Only navmesh polygons marked as pavement
	GSC_FLAG_ONLY_PAVEMENT					= 1,
	// Only navmesh polygons not marked as "isolated"
	GSC_FLAG_NOT_ISOLATED					= 2,
	// No navmesh polygons created from interiors
	GSC_FLAG_NOT_INTERIOR					= 4,
	// No navmesh polygons marked as water
	GSC_FLAG_NOT_WATER						= 8,
	// Only navmesh polygons marked as "network spawn candidate"
	GSC_FLAG_ONLY_NETWORK_SPAWN				= 16,
	// Specify whether to use a flood-fill from the starting position, as opposed to scanning all polygons within the search volume
	GSC_FLAG_USE_FLOOD_FILL					= 32
ENDENUM

ENUM GPS_SLOT_TYPE
	GPS_SLOT_WAYPOINT = 0,
	GPS_SLOT_RADAR_BLIP = 1,
	GPS_SLOT_DISCRETE = 2
ENDENUM

// INFO: This enum is the available set of directions returned by GENERATE_DIRECTIONS_TO_COORD
// Keep this in sync with the GpsDirections enum in CPathFind (pathfind.cpp)

ENUM VEHICLE_PATH_DIRECTIONS
	// Unable to decide
	DIRECTIONS_UNKNOWN						= 0,
	// The wrong way wrt the path
	DIRECTIONS_WRONG_WAY					= 1,
	// Keep going
	DIRECTIONS_KEEP_DRIVING					= 2,
	// We have found a junction, and must turn left at it
	DIRECTIONS_LEFT_AT_JUNCTION				= 3,
	// We have found a junction, and must turn right at it
	DIRECTIONS_RIGHT_AT_JUNCTION			= 4,
	// We have found a junction, and must go straight through it
	DIRECTIONS_STRAIGHT_THROUGH_JUNCTION	= 5,
	// Paths splits ahead, keep left
	DIRECTIONS_KEEP_LEFT					= 6,
	// Path splits ahead, keep right
	DIRECTIONS_KEEP_RIGHT					= 7,
	// 
	DIRECTIONS_UTURN						= 8
ENDENUM

//~>						Vehicle commands

// INFO: This enum primarily filters the return results of GetNode functions.
// Keep it in sync with GetClosestNodeFlags in commands_path.cpp
ENUM NODE_FLAGS
    NF_NONE						  = 0,					// No flags                   
    NF_INCLUDE_SWITCHED_OFF_NODES = 1,                  // Include switched off nodes in any search
    NF_INCLUDE_BOAT_NODES		  = 2,					// Include boat nodes
    NF_IGNORE_SLIPLANES				= 4,				// Ignore sliplanes
    NF_IGNORE_SWITCHED_OFF_DEADENDS = 8					// Ignore dead-ends, only if they're switched off. If NF_INCLUDE_SWITCHED_OFF_NODES is false this won't find anything to ignore
ENDENUM

// INFO : The enum defins vehicle node properties as returned by GET_VEHICLE_NODE_PROPERTIES
ENUM VEHICLE_NODE_PROPERTIES
	VNP_OFF_ROAD				= 1,					// node has been flagged as 'off road', suitable only for 4x4 vehicles, etc
	VNP_ON_PLAYERS_ROAD			= 2,					// node has been dynamically marked as somewhere ahead, possibly on (or near to) the player's current road
	VNP_NO_BIG_VEHICLES			= 4,					// node has been marked as not suitable for big vehicles
	VNP_SWITCHED_OFF			= 8,					// node is switched off for ambient population
	VNP_TUNNEL_OR_INTERIOR		= 16,					// node is in a tunnel or an interior
	VNP_LEADS_TO_DEAD_END		= 32,					// node is, or leads to, a dead end
	VNP_HIGHWAY					= 64,					// node is marked as highway
	VNP_JUNCTION				= 128,					// node qualifies as junction
	VNP_TRAFFIC_LIGHT			= 256,					// node's special function is traffic-light
	VNP_GIVE_WAY				= 512,					// node's special function is give-way	
	VNP_WATER					= 1024					// node is water/boat
ENDENUM

ENUM VEHICLE_DENSITY
	MIN_VEHICLE_DENSITY			= 0,					// no chance of vehicles being created on this node
	MAX_VEHICLE_DENSITY			= 15					// maximum chance of vehicles being created on this node
ENDENUM

ENUM PED_DENSITY
	MIN_PED_DENSITY				= 0,					// no chance of peds being created on this navmesh polygon
	MAX_PED_DENSITY				= 7						// maximum chance of peds being created on this navmesh polygon
ENDENUM

ENUM BLOCKING_OBJECT_FLAGS
	BLOCKING_OBJECT_DEFAULT						= 0,
	BLOCKING_OBJECT_WANDERPATH					= 1,	// Blocking object will block wander paths
	BLOCKING_OBJECT_SHORTESTPATH				= 2,	// Blocking object will block (regular) shortest-paths
	BLOCKING_OBJECT_FLEEPATH					= 4,		// Blocking object will block flee paths
	
	BLOCKING_OBJECT_ALLPATHS					= 7
ENDENUM

//INFO: This means that cars will drive on to these roads and new cars will be generated on them. 
//When a road is switched off, no cars should be created on it and cars that already exist will try to avoid driving on to it.
//	To undo a SWITCH_ROADS_ON or a SWITCH_ROADS_OFF, use SWITCH_ROADS_BACK_TO_ORIGINAL. 
//PARAM NOTES: All roads are switched on by default
//PURPOSE:  Sets the road node active state in the given area. More info..
NATIVE PROC SET_ROADS_IN_AREA(VECTOR VecMinCoors, VECTOR VecMaxCoors, BOOL bActive, BOOL bNetwork = TRUE) = "0x286addbe501ff4c2"

//INFO:
//PARAM NOTES:bHighlightArea does nothing
//PURPOSE: Set roads in angled area.  See comments for SWITCH_ROADS_IN_AREA
NATIVE PROC SET_ROADS_IN_ANGLED_AREA(VECTOR vVec1, VECTOR vVec2, FLOAT fAreaWidth, BOOL bHighlightArea, BOOL bActive, BOOL bNetwork = TRUE) = "0x208b14ca225dc5a0"

//INFO: The commands will return FALSE if no node could be found (probably due to the nodes not being streamed in). 
//PARAM NOTES: zMeasureMult: how strongly should the difference in Z direction be weighted? 
//				0.0 = ignored completely, 1.0 = the same as 2d distance. Default is 3.0 since we tend to care about
//				height differences more than 2d distance.
//				zTolerance: how far apart to the Z coords have to be before zMeasureMult kicks in?
//PURPOSE:WIill return if can the closest vehicle node to a coord. More info..
NATIVE FUNC BOOL GET_CLOSEST_VEHICLE_NODE(VECTOR VecCoors , VECTOR &VecReturnNearestNodeCoors, NODE_FLAGS nodeFlags = NF_INCLUDE_SWITCHED_OFF_NODES, FLOAT zMeasureMult = 3.0, FLOAT zTolerance = 0.0 ) = "0xdfcbbd9528dc1828"

//INFO: This is needed for the prostitute script to find a quiet area to park the car. 
//PARAM NOTES: zMeasureMult: how strongly should the difference in Z direction be weighted? 
//				0.0 = ignored completely, 1.0 = the same as 2d distance. Default is 3.0 since we tend to care about
//				height differences more than 2d distance.
//				zTolerance: how far apart to the Z coords have to be before zMeasureMult kicks in?
//PURPOSE: WIill return if can the closest vehicle node even if switched off, to a coord. More info..
NATIVE FUNC BOOL GET_CLOSEST_MAJOR_VEHICLE_NODE(VECTOR VecCoors , VECTOR &VecReturnNearestNodeCoors, FLOAT zMeasureMult = 3.0, FLOAT zTolerance = 0.0) = "0x5fcf1af649a7db39"

//INFO: Can be used to set a car facing in a reasonable direction when it is placed on the car node. The command will return FALSE if no node could be found (probably due to the nodes not being streamed in). 
//PARAM NOTES: zMeasureMult: how strongly should the difference in Z direction be weighted? 
//				0.0 = ignored completely, 1.0 = the same as 2d distance. Default is 3.0 since we tend to care about
//				height differences more than 2d distance.
//				zTolerance: how far apart to the Z coords have to be before zMeasureMult kicks in?
//PURPOSE: WIill return if can the closest vehicle node with a heading, to a coord. More info..
NATIVE FUNC BOOL GET_CLOSEST_VEHICLE_NODE_WITH_HEADING(VECTOR VecCoors, VECTOR &VecReturnNearestNodeCoors, FLOAT &ReturnHeading, NODE_FLAGS nodeFlags = NF_INCLUDE_SWITCHED_OFF_NODES, FLOAT zMeasureMult = 3.0, FLOAT zTolerance = 0.0) = "0x0fbea22dbe03ac23"

//INFO: VecCoors.Z will be calculated automatically if you give it a value of –100.0 or below. If NodeNumber is 1 then the closest node will be returned (as with the two commands above).
//	If NodeNumber is 2 then the second closest node will be returned and so on. The command will return FALSE if no node could be found (probably due to the nodes not being streamed in). 
//PARAM NOTES: zMeasureMult: how strongly should the difference in Z direction be weighted? 
//				0.0 = ignored completely, 1.0 = the same as 2d distance. Default is 3.0 since we tend to care about
//				height differences more than 2d distance.
//				zTolerance: how far apart to the Z coords have to be before zMeasureMult kicks in?
//PURPOSE:  WIill return if can the nth ( n = 1 being closest) closest vehicle node, to a coord.  More info..
NATIVE FUNC BOOL GET_NTH_CLOSEST_VEHICLE_NODE(VECTOR VecCoors, INT NodeNumber, VECTOR &VecReturnNearestNodeCoors, NODE_FLAGS nodeFlags = NF_INCLUDE_SWITCHED_OFF_NODES, FLOAT zMeasureMult = 3.0, FLOAT zTolerance = 0.0 ) = "0x29579bc5971ca4b6"

//INFO: As GET_NTH_CLOSEST_VEHICLE_NODE... but returns a node index. This node index MUST be used within this frame as it's validity is not guaranteed outside.
//PARAM NOTES: zMeasureMult: how strongly should the difference in Z direction be weighted? 
//				0.0 = ignored completely, 1.0 = the same as 2d distance. Default is 3.0 since we tend to care about
//				height differences more than 2d distance.
//				zTolerance: how far apart to the Z coords have to be before zMeasureMult kicks in?
//PURPOSE:  Will return if can the nth ( n = 1 being closest) closest vehicle node (by index), to a coord.  More info..
NATIVE FUNC VEHICLE_NODE_ID GET_NTH_CLOSEST_VEHICLE_NODE_ID(VECTOR VecCoors, INT NodeNumber, NODE_FLAGS nodeFlags = NF_INCLUDE_SWITCHED_OFF_NODES, FLOAT zMeasureMult = 3.0, float zTolerance = 0.0 ) = "0xea3e64155da5f4d9"

//INFO: As GET_NTH_CLOSEST_VEHICLE_NODE... but returns a node index. This node index MUST be used within this frame as it's validity is not guaranteed outside.
//PARAM NOTES:
//PURPOSE: Checks the validity of a return
NATIVE FUNC BOOL IS_VEHICLE_NODE_ID_VALID(VEHICLE_NODE_ID NodeId) = "0x958ac759881d0b58"

//INFO: As GET_NTH_CLOSEST_VEHICLE_NODE... but returns a node index. This node index MUST be used within this frame as it's validity is not guaranteed outside.
//PARAM NOTES:
//PURPOSE: Resolves a node id to a position
NATIVE PROC GET_VEHICLE_NODE_POSITION( VEHICLE_NODE_ID nodeId, VECTOR &VecNodePosition ) = "0x1b54427560dfe3c3"

//INFO: Returns whether the given node has GPS allowed (to be used with a node index obtained by the above function(s) and within the same frame!)
//PARAM NOTES:
//PURPOSE: Gets the GPS status of a node id
NATIVE FUNC BOOL GET_VEHICLE_NODE_IS_GPS_ALLOWED( VEHICLE_NODE_ID nodeId ) = "0xa202f3522092063d"

//INFO: Returns whether the given node is switched off (to be used with a node index obtained by the above function(s) and within the same frame!)
//PARAM NOTES:
//PURPOSE: Gets whether a given node id is switched off
NATIVE FUNC BOOL GET_VEHICLE_NODE_IS_SWITCHED_OFF( VEHICLE_NODE_ID nodeId ) = "0x535e2ca2f0da34d4"

//INFO: Returns a heading which can be used to set a car facing in a reasonable direction when it is placed on the car node. 
//			The command will return FALSE if no node could be found (probably due to the nodes not being streamed in). 
//PARAM NOTES: ReturnNumLanes is the total number of lanes of the link (both directions added together) 
//			zMeasureMult: how strongly should the difference in Z direction be weighted? 
//				0.0 = ignored completely, 1.0 = the same as 2d distance. Default is 3.0 since we tend to care about
//				height differences more than 2d distance.
//				zTolerance: how far apart to the Z coords have to be before zMeasureMult kicks in?
//PURPOSE: WIill return if can the nth ( n = 1 being closest) closest vehicle node with a heading, to a coord.  More info..
NATIVE FUNC BOOL GET_NTH_CLOSEST_VEHICLE_NODE_WITH_HEADING(VECTOR VecCoors, INT NodeNumber, VECTOR &VecReturnNearestNodeCoors, FLOAT &ReturnHeading, INT &ReturnNumLanes, NODE_FLAGS nodeFlags = NF_INCLUDE_SWITCHED_OFF_NODES, FLOAT zMeasureMult = 3.0, FLOAT zTolerance = 0.0 ) = "0x15cedab46d800682"

//INFO: Like NTH_CLOSEST_VEHICLE_NODE_WITH_HEADING but returning an ID instead.  
//			Returns a heading which can be used to set a car facing in a reasonable direction when it is placed on the car node. 
//			The command will return FALSE if no node could be found (probably due to the nodes not being streamed in). 
//PARAM NOTES: ReturnNumLanes is the total number of lanes of the link (both directions added together) 
//			zMeasureMult: how strongly should the difference in Z direction be weighted? 
//				0.0 = ignored completely, 1.0 = the same as 2d distance. Default is 3.0 since we tend to care about
//				height differences more than 2d distance.
//				zTolerance: how far apart to the Z coords have to be before zMeasureMult kicks in?
//PURPOSE: WIill return if can the nth ( n = 1 being closest) closest vehicle node with a heading, to a coord.  More info..
NATIVE FUNC VEHICLE_NODE_ID GET_NTH_CLOSEST_VEHICLE_NODE_ID_WITH_HEADING(VECTOR VecCoors, INT NodeNumber, FLOAT &ReturnHeading, INT &ReturnNumLanes, NODE_FLAGS nodeFlags = NF_INCLUDE_SWITCHED_OFF_NODES, FLOAT zMeasureMult = 3.0, FLOAT zTolerance = 0.0 ) = "0x67a3682c37778785"


//INFO: 
//PARAM NOTES: NumLanes is the total number of lanes of the link (both directions added together) 
//				zMeasureMult: how strongly should the difference in Z direction be weighted? 
//				0.0 = ignored completely, 1.0 = the same as 2d distance. Default is 3.0 since we tend to care about
//				height differences more than 2d distance.
//				zTolerance: how far apart to the Z coords have to be before zMeasureMult kicks in?
//PURPOSE: WIill return if can the nth ( n = 1 being closest) closest vehicle node with a heading, to a coord on an island. More info..
NATIVE FUNC BOOL GET_NTH_CLOSEST_VEHICLE_NODE_WITH_HEADING_ON_ISLAND(VECTOR VecCoors, INT NodeNumber, INT Island, VECTOR &VecReturnNearestNodeCoors, FLOAT &ReturnHeading, INT &numLanes, FLOAT zMeasureMult = 3.0, FLOAT zTolerance = 0.0) = "0x597f081e6e24c8b9"

//INFO: 
//PARAM NOTES: zMeasureMult: how strongly should the difference in Z direction be weighted? 
//				0.0 = ignored completely, 1.0 = the same as 2d distance. Default is 3.0 since we tend to care about
//				height differences more than 2d distance.
//				zTolerance: how far apart to the Z coords have to be before zMeasureMult kicks in?
//PURPOSE: WIill return if can the next closest vehicle node with a heading, to a coord on an island. More info..
NATIVE FUNC BOOL GET_NEXT_CLOSEST_VEHICLE_NODE_WITH_HEADING_ON_ISLAND(VECTOR VecCoors, INT Island, VECTOR &VecReturnNearestNodeCoors, FLOAT &ReturnHeading, FLOAT zMeasureMult = 3.0, FLOAT zTolerance = 0.0 ) = "0xee1c4f8ee4c60c4d"

//INFO: It will always obey one-way streets. If you want your car to go against one-way streets, you have to check to see if it's facing the right direction and rotate the car 180 degrees. 
//PARAM NOTES:  zMeasureMult: how strongly should the difference in Z direction be weighted? 
//				0.0 = ignored completely, 1.0 = the same as 2d distance. Default is 3.0 since we tend to care about
//				height differences more than 2d distance.
//				zTolerance: how far apart to the Z coords have to be before zMeasureMult kicks in?
//PURPOSE:  WIill return if can the closest vehicle node,tries to return a heading which points the car in the right direction to reach FaceCoors. More info..
NATIVE FUNC BOOL GET_NTH_CLOSEST_VEHICLE_NODE_FAVOUR_DIRECTION(VECTOR VecCoors, VECTOR FaceCoors, INT NodeNumber, VECTOR &VecReturnNearestNodeCoors, FLOAT &ReturnHeading, NODE_FLAGS nodeFlags = NF_INCLUDE_SWITCHED_OFF_NODES, FLOAT zMeasureMult = 3.0, FLOAT zTolerance = 0.0 ) = "0x1b51bebb1f321733"


//INFO: This function returns some additional properties associated with the closest node
//PARAM NOTES:  vNodeCoords should ideally be a node in the world, which you will have obtained already
//              Out_iDensity returns the 'vehicle density', and ranges from MIN_VEHICLE_DENSITY to MAX_VEHICLE_DENSITY
//              Out_iPropertyFlags returns a bitset from the enumeration VEHICLE_NODE_PROPERTIES
//RETURNS:      FALSE if the node was not found, or it was not streamed in; TRUE otherwise
//PURPOSE: This function returns some additional properties associated with the node
NATIVE FUNC BOOL GET_VEHICLE_NODE_PROPERTIES(VECTOR vNodeCoords, INT & Out_iDensity, INT & Out_iPropertyFlags) = "0x4c1eef24cf4b2752"


//INFO: 
//PARAM NOTES:TestCoors: Coordinates near which the search for the road segment is executed.
//	MinLength: Minimum length that the road segment must have to be considered. 
//	MinLanes: Minimum number of lanes (Both directions added together) the road segment must have to be considered. 
//	SouthEndNode, NorthEndNode: Coordinates of the 2 nodes that define the road segment.
//		(For horizontal roads the command returns the West node in SouthEndNode and the East node in NorthEndNode.
//			LanesGoingSouth, LanesGoingNorth: Number of lanes that go either way. CentralReservationWidth: Width of the bit between the 2 directions (in meters)
//	The coordinates being passed back for both nodes are in the middle of the central reservation of there is one. (If not they are on the transition from the lanes going North and the ones going South) 
//PURPOSE: WIill return if can the closest road segment of a certein length with a certain number of lanes. More info..
NATIVE FUNC BOOL GET_CLOSEST_ROAD(VECTOR TestCoors, FLOAT MinLength, INT MinLanes, VECTOR &SouthEndNode, VECTOR &NorthEndNode, INT &LanesGoingSouth, INT &LanesGoingNorth, FLOAT &CentralReservationWidth, BOOL bIgnoreSwitchedOffNodes=TRUE) = "0x13fd00a258a58752"

//INFO: It is not cool to call a SET_ROADS_IN_AREA(true)  to undo a SET_ROADS_IN_AREA(false) because the nodes that were originally off would now be on. 
//PARAM NOTES:
//PURPOSE: Sets all vehicle nodes back to their original state. (as per the map data).  More info..
NATIVE PROC SET_ROADS_BACK_TO_ORIGINAL(VECTOR VecCoorsMin, VECTOR VecCoorsMax, BOOL bNetwork = TRUE) = "0x83e10da4845841b7"

//INFO: It is not cool to call a SET_ROADS_IN_AREA(true)  to undo a SET_ROADS_IN_AREA(false) because the nodes that were originally off would now be on. 
//PARAM NOTES:
//PURPOSE: Sets all vehicle nodes back to their original state. (as per the map data). This is to match turning them on in an angled area
NATIVE PROC SET_ROADS_BACK_TO_ORIGINAL_IN_ANGLED_AREA(VECTOR vVec1, VECTOR vVec2, FLOAT fAreaWidth, BOOL bNetwork = TRUE) = "0x13a2865660b9b033"


//~>										Navmesh commands

//INFO: Defined the scripted optional scripted region which will have navmesh loaded at all times
//PARAM NOTES: Keep 'radius' as small as possible, because all navmeshes intersecting this area will be loaded
//EXTRA NOTES: This can use up game memory very rapidly - use with caution!  Be sure to remove the area when no longer required.
//			   Only one region may be defined at a time, to avoid excessive memory usage
NATIVE PROC ADD_NAVMESH_REQUIRED_REGION( FLOAT x, FLOAT y, FLOAT radius ) = "0x862852388ae23818"

//INFO: Removes the navmesh required region
//PARAM NOTES: One a single region may be defined globally
NATIVE PROC REMOVE_NAVMESH_REQUIRED_REGIONS() = "0x0f02061f6faeb6c1"

//INFO: Returns whether a script is using the navmesh region (including the calling script)
NATIVE FUNC BOOL IS_NAVMESH_REQUIRED_REGION_IN_USE() = "0x221808c6caa5935e"

//INFO: When a navmesh area is disabled, no navigation will occur through this area - peds will walk around
//PARAM NOTES: All navmesh polygons are switched on by default
//			   This will disable/enable all polygons TOUCING the input area.  Since polygons are irregular in size,
//             it means that the area will likely extend somewhat further than the specified min/max extents
//             *When a mission script exits, all areas disabled by that script will be restored to an enabled state*
//
//EXTRA NOTES: ** Please only use this command if you want to completely disable a large area of navmesh **
//			   ** "ADD_NAVMESH_BLOCKING_OBJECT" should be used instead for small or precise blocking areas **
//
NATIVE PROC DISABLE_NAVMESH_IN_AREA( VECTOR VecMinCoors, VECTOR VecMaxCoors, BOOL bDisable ) = "0xb2c3d985489123f0"

//INFO: This applies to the navmeshes which are always loaded in around the player, as well as any additional navmesh load regions which may have been set up. 
//PARAM NOTES:This could be used at the start of a mission after the player ped has been teleported, as it may take a little time before the surrounding navmehes are streamed in.
//	After the player has been teleported in, this command could be called repeatedly until it returns true - at which point you know it is ok to start creating peds & giving them navmesh routes, combat tasks,
//PURPOSE: returns whether all the requested navmeshes have loaded. More info..
NATIVE FUNC BOOL ARE_ALL_NAVMESH_REGIONS_LOADED() = "0x6d56c86cdb6269ae"

//INFO: Returns whether all navmeshes in the area vMin to vMax are loaded in memory
NATIVE FUNC BOOL IS_NAVMESH_LOADED_IN_AREA(VECTOR vMin, VECTOR vMax) = "0x422c66e6b46d5aef"

//INFO: Returns the number of navmeshes which exist in the given area (irrespective of whether they are currently loaded or not)
NATIVE FUNC INT GET_NUM_NAVMESHES_EXISTING_IN_AREA(VECTOR vMin, VECTOR vMax) = "0xe64c2e86eac945dd"

//INFO: Returns the number of navmeshes which are loaded within the given area
NATIVE FUNC INT GET_NUM_NAVMESHES_LOADED_IN_AREA(VECTOR vMin, VECTOR vMax) = "0xf4ec7530e9772cd0"

//INFO: This function adds a blocking obstacle in the navmesh, which will prevent peds from pathfinding through it.
//PARAM NOTES:
//    vPosition		: the center of the box
//    vSizeXYZ		: the width, depth & height of the box
//    fHeading		: the rotation of the object in radians - use DEG_TO_RAD() to convert from degrees if necessary
//    bPermanent	: if the object will last outside the lifetime of the callig script (always set to FALSE except in very special cases!)
//    iFlags		: a set of flags from the BLOCKING_OBJECT_FLAGS enumation; can be used to block certain types of pathfinding only.
//
// TIP : To help setting up blocking objects in the game, use the RAG helper: ("Navigation\Blocking Bounds")
//
//RETURNS:
//	The return value is an integer which should be stored, and used when calling "REMOVE_NAVMESH_BLOCKING_OBJECT"
//	A return value of -1 indicates an error, and that the blocking object could not be added.
//NOTE:
//	This command will assert if two objects are added at the same XYZ position, this is order to catch duplicates.
NATIVE FUNC INT ADD_NAVMESH_BLOCKING_OBJECT( VECTOR vPosition, VECTOR vSizeXYZ, FLOAT fHeading, BOOL bPermanent=FALSE, BLOCKING_OBJECT_FLAGS iFlags=BLOCKING_OBJECT_ALLPATHS ) = "0x7afc31f33cb9b8d5"

//INFO: This command updates the position, size & orientation of a navmesh blocking object
//PARAM NOTES: The "iObjectId" must be a valid index as returned by "ADD_NAVMESH_BLOCKING_OBJECT"
NATIVE PROC UPDATE_NAVMESH_BLOCKING_OBJECT( INT iObjectId, VECTOR vPosition, VECTOR vSizeXYZ, FLOAT fHeading, BLOCKING_OBJECT_FLAGS iFlags=BLOCKING_OBJECT_ALLPATHS ) = "0x3ff379bef70564fc"

//INFO: This command removes a blocking object which was previously added via "ADD_NAVMESH_BLOCKING_OBJECT"
//PARAM NOTES: The "iObjectId" must be a valid index as returned by "ADD_NAVMESH_BLOCKING_OBJECT"
//NOTE: All blocking objects added with the default "bPermanent=FALSE" will be automatically removed when the
//		script which added them teminates - there is no need to manually remove these objects in this case.
NATIVE PROC REMOVE_NAVMESH_BLOCKING_OBJECT( INT iObjectId ) = "0xb251ddfa99084c56"

//INFO: Queries whether a navmesh blocking object with the specfied index exists
//      This may be useful during mission shutdown, or S/F skips, where the mission-cleanup code automatically
//      removes all the objects which the script adds - but where the script itself may try to manually remove them.
//      Wrapping REMOVE_NAVMESH_BLOCKING_OBJECT with a call to DOES_NAVMESH_BLOCKING_OBJECT_EXIST, will ensure
//      there are no warnings about the script trying to remove an object which doesn't exist.
NATIVE FUNC BOOL DOES_NAVMESH_BLOCKING_OBJECT_EXIST( INT iObjectId ) = "0x046b574e2cf3f2cc"



//~>										Ped commands

//INFO: When a path is switched off, no peds will be created on it and peds that already exist will not use this path to get to a destination. 
//PARAM NOTES: All paths are switched on by default
//	bForceAbortCurrentPath	- avoid possible stalls by forcing any active path request to be aborted
//							  use this if there are reports of this command causing brief hangs waiting for navmesh data to be accessible
//							  but be aware that if timing-critical pathfinding is occuring, that it can be interruped by this
//PURPOSE: Sets the ped paths active state in the given area. More info..
NATIVE PROC SET_PED_PATHS_IN_AREA(VECTOR VecMinCoors, VECTOR VecMaxCoors, BOOL bActive, BOOL bForceAbortCurrentPath=FALSE) = "0x780d33653803d9b0"

//INFO: Use this carefully since it can have a considerable performance hit, having to stall the game whilst it queries navmesh polygons
//PARAM NOTES: If unsuccessful, the command will return FALSE and the returned coordinates will be the same as those passed in. 
//PURPOSE: Checks to see if it can find a safe bit of ground to place a ped.
//		   This command has been extended to provide a set of bitflags to give more control over how it searches for positions.
//		   (The old bOnlyOnPavement parameter still works but you should start using the GSC_FLAG_ONLY_PAVEMENT instead as it will be removed eventually.)
NATIVE FUNC BOOL GET_SAFE_COORD_FOR_PED(VECTOR VecCoors, BOOL bOnlyOnPavement, VECTOR &VecReturnSafeCoors, GET_SAFE_COORD_FLAGS iFlags=GSC_FLAG_DEFAULT) = "0x1555f0fa7ba4fe0f"


//INFO:  It is not cool to call a SET_PED_PATHS_IN_AREA(true)  to undo a SET_PED_PATHS_IN_AREA(false) because the nodes that were originally off would now be on. 
//PARAM NOTES:
//	bForceAbortCurrentPath	- avoid possible stalls by forcing any active path request to be aborted
//							  use this if there are reports of this command causing brief hangs waiting for navmesh data to be accessible
//							  but be aware that if timing-critical pathfinding is occuring, that it can be interruped by this
//PURPOSE:  Sets all ped nodes back to their original state. (as per the map data)  More info..
NATIVE PROC SET_PED_PATHS_BACK_TO_ORIGINAL(VECTOR VecCoorsMin, VECTOR VecCoorsMax, BOOL bForceAbortCurrentPath=FALSE) = "0x7bfef556f237e70a"


//INFO:	Applies a multiplier to the distances used for spawning/removing ambient peds
//		Should be called every frame for the duration that it is required.
NATIVE PROC SET_AMBIENT_PED_RANGE_MULTIPLIER_THIS_FRAME(FLOAT fMultiplier) = "0xa8307d8c8abe6270"


//INFO:	Causes the "PED DENSITY" in the given axis-aligned box to be boosted/reduced by the provided amount.
//		This can be used to cause more or less peds to spawn in a given area, than is set in the navmesh.
//		It will not have any affect upon areas where the ped density is by deafult zero.
//		This command should be called every frame for as long as it is required.
//		Only one such region may be set per frame, an assert will fire if it is set more that once per frame.
//PARAM NOTES:
//		iAdjustment should be a non-zero value between -MAX_PED_DENSITY and +MAX_PED_DENSITY
NATIVE PROC ADJUST_AMBIENT_PED_SPAWN_DENSITIES_THIS_FRAME(INT iAdjustment, VECTOR vMin, VECTOR vMax) = "0x2e5c7227cf316022"

//~>							Streaming commands

//INFO: Returns true if path nodes are loaded for the region specified
//		Unlike LOAD_ALL_PATH_NODES(), we don't return a bool for the initial request,
//		so use this function to query if the nodes you want are loaded
NATIVE FUNC BOOL ARE_NODES_LOADED_FOR_AREA(FLOAT MinX, FLOAT MinY, FLOAT MaxX, FLOAT MaxY) = "0xf8805443c3db6256"

//INFO: When this command is called, the path nodes in the given region be requested by streaming that frame.
//      This does not guarantee that the nodes will be loaded this frame, you should keep calling this command
//		for as long as you wish nodes to be present in the given area, and you should call ARE_NODES_LOADED_FOR_AREA
//		to check for when they have streamed in.
//		If you stop calling this command, the nodes may be streamed out again at any time.
NATIVE FUNC BOOL REQUEST_PATH_NODES_IN_AREA_THIS_FRAME(FLOAT MinX, FLOAT MinY, FLOAT MaxX, FLOAT MaxY) = "0x2ee5fff3e1e3400d"

//INFO: The return value becomes true when this has actually happened.
//	If called with false the nodes are released. In this case the return value is irrelevant. 
//PARAM NOTES:
//PURPOSE: Loads/unloads all path nodes on the map. More info..
NATIVE FUNC BOOL LOAD_ALL_PATH_NODES(BOOL Set) = "0xd268dae911420879"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set to TRUE to allow prologue road nodes from being
//			loaded, FALSE to disable
NATIVE PROC SET_ALLOW_STREAM_PROLOGUE_NODES(BOOL Allow) = "0x3204a8f8ff77eeca"

//INFO: 
//PARAM NOTES: Setting to true disables main level and prologue nodes from streaming, so need to set back to false
//PURPOSE: Set to TRUE to allow heist island road nodes from being
//			loaded, FALSE to disable
NATIVE PROC SET_ALLOW_STREAM_HEIST_ISLAND_NODES(BOOL Allow) = "0x744c775b133c9131"

//~>						Unique commands 

//INFO:The nearest one returns the string in hashName1. The second one only gets returned if it is within 40 meters of the searchCoords. So hashName2 may be empty(0). 
//PARAM NOTES:
//PURPOSE: Finds the two nearest nodes that have a road name set up for them. More info..
NATIVE PROC GET_STREET_NAME_AT_COORD(VECTOR searchCoords, INT &hashName1, INT &hashName2) = "0x05e7aefd2137bb91"

//INFO: Based on the players position and orientation and the destination that is passed in the function will return:
//PARAM NOTES:
//	 0: No direction
//	 1: Turn right
//	 2: Turn left
//	 3: Straight on
//PURPOSE: Generate directions for the next junction. More info..
NATIVE PROC CREATE_DIRECTIONS_TO_COORD(VECTOR destination, INT &direction, INT &streetNameHash) = "0x029c059238a17c06"


// INFO: Performs a path search, and attempts to identify the next direction which needs to be taken to follow the route to the target
// PARAM NOTES: iFlags is currently unused, and should be set to zero
// iDirections is returned by parameter, and will be a value from the VEHICLE_PATH_DIRECTIONS enumeration
// In the case of a junction being identified, fApproxDistance will be non-zero
// RETURN : Position if next junction we relate to if any, otherwise 0,0,0
NATIVE FUNC VECTOR GENERATE_DIRECTIONS_TO_COORD_OUTPOS(VECTOR vDestination, INT iFlags, VEHICLE_PATH_DIRECTIONS & iDirections, INT & iStreetNameHash, FLOAT & fApproxDistance) = "0x343d9e70c8b4f39e"


// INFO: Performs a path search, and attempts to identify the next direction which needs to be taken to follow the route to the target
// PARAM NOTES: iFlags is currently unused, and should be set to zero
// iDirections is returned by parameter, and will be a value from the VEHICLE_PATH_DIRECTIONS enumeration
// In the case of a junction being identified, fApproxDistance will be non-zero
// RETURN : the return value is not currently used, but left for future expansion
NATIVE FUNC INT GENERATE_DIRECTIONS_TO_COORD(VECTOR vDestination, INT iFlags, VEHICLE_PATH_DIRECTIONS & iDirections, INT & iStreetNameHash, FLOAT & fApproxDistance) = "0x34caae581d7e2318"


//INFO:
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_IGNORE_NO_GPS_FLAG(BOOL bIgnore) = "0xac60fc9ab1b2cc70"


//INFO:
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_IGNORE_NO_GPS_FLAG_UNTIL_FIRST_NORMAL_NODE(BOOL bIgnore) = "0x517f19588645defb"

//INFO: Defines a rectangular zone which the GPS will not pathfind through.
//PARAM NOTES: To re-enable the GPS, call the function again with a zero-area zone (eg. <0,0,0> to <0,0,0>).
//             It will also be restored automatically upon script termination.
//			   Can also be restored by calling CLEAR_GPS_DISABLED_ZONE_AT_INDEX(0)
//             The Z coordinate is ignored - this command only operates in XY, and doesn't take height into account.
//PURPOSE: Can be used to stop GPS functioning in a certain area, or from revealing the route to a certain area.
NATIVE PROC SET_GPS_DISABLED_ZONE(VECTOR vMin, VECTOR vMax) = "0x27ac9e8977e369dd"

//INFO: Defines a rectangular zone which the GPS will not pathfind through and inserts it at index provided
//PARAM NOTES: Currently only 4 slots are available for use
//			   To re-enable the GPS, call the function again with a zero-area zone (eg. <0,0,0> to <0,0,0>).
//			   Or call CLEAR_GPS_DISABLED_ZONE_AT_INDEX with the same index
//             It will also be restored automatically upon script termination.
//             The Z coordinate is ignored - this command only operates in XY, and doesn't take height into account.
//PURPOSE: Can be used to stop GPS functioning in a certain area, or from revealing the route to a certain area.
NATIVE PROC SET_GPS_DISABLED_ZONE_AT_INDEX(VECTOR vMin, VECTOR vMax, INT index) = "0x344973f34eb71696"

//INFO: Returns an int which is the next available slot for defining a gps disabled zone
//PARAM NOTES: Currently only 4 slots are available for use. Will return index 0 -> 3 or -1 if all slots are full
//PURPOSE: Used to return an index to a free slot for defining a gps disabled zone
NATIVE FUNC INT GET_NEXT_GPS_DISABLED_ZONE_INDEX() = "0x708a07ba6f801ce6"

//INFO: Clears the gps disabled zone at the provided index
//PARAM NOTES:
//PURPOSE: Clears the gps disabled zone at the provided index
NATIVE PROC CLEAR_GPS_DISABLED_ZONE_AT_INDEX(INT index) = "0xef3f1764ed2dee8a"

//INFO: Function to get the gps route length, will return 0 if no route is currently being used.
//PARAM NOTES:
//PURPOSE: gets the length of the current sat nav route
NATIVE FUNC INT GET_GPS_BLIP_ROUTE_LENGTH() = "0x8748276d7c932108"

//INFO: Function to get the gps route end, will return false if no waypoint route is active with any route left
//PARAM NOTES:
//PURPOSE: gets the length of the current sat nav route
NATIVE FUNC BOOL GET_GPS_WAYPOINT_ROUTE_END(VECTOR &VecReturnPos) = "0xcc72e9ac0b3a99b6"

//INFO: Function to get a position along current player GPS route.
//PARAM NOTES: 
// bStartAtPlayerPos should we project distance from player position or from next node.
// fDistanceAlongRoute - distance we want to get position along route.
//PURPOSE: Position along GPS_SLOT_WAYPOINT gps route
NATIVE FUNC BOOL GET_POS_ALONG_GPS_ROUTE(VECTOR &VecReturnPos, BOOL bStartAtPlayerPos, FLOAT fDistanceAlongRoute) = "0xe2d65a98f8322e88"

//INFO: Function to get a position along current player GPS route using supplied slot
//PARAM NOTES: 
// bStartAtPlayerPos should we project distance from player position or from next node.
// fDistanceAlongRoute - distance we want to get position along route.
// slotType - type of gps route to check against
//PURPOSE: 
NATIVE FUNC BOOL GET_POS_ALONG_GPS_TYPE_ROUTE(VECTOR &VecReturnPos, BOOL bStartAtPlayerPos, FLOAT fDistanceAlongRoute, GPS_SLOT_TYPE slotType) = "0xc97d1ceb93adebbc"

//INFO: Function to get the discrete gps route length, will return 0 if no route is currently being used.
//PARAM NOTES:
//PURPOSE: gets the length of the current sat nav route
NATIVE FUNC INT GET_GPS_DISCRETE_ROUTE_LENGTH(VECTOR vDestination) = "0x8746ddfee6b3b3a8"

//INFO: Find whether the gps blip route has been found and is displaying on the gps
//PARAM NOTES:
//PURPOSE: get whether the gps blip route is found and being diaplyed on gps
NATIVE FUNC BOOL GET_GPS_BLIP_ROUTE_FOUND() = "0x718f1e0d4400c7a0"

//INFO: . Every time this command is called 64 nodes are batched (so you won't get the same node twice in the first 64 calls)
//	Once the node has been returned and perhaps sent to a client the coordinates to spawn a car can be found using GET_SPAWN_COORDINATES_FOR_CAR_NODE 
//PARAM NOTES:
//PURPOSE: Will return a random node to satisfy the specified conditions. More info..
NATIVE FUNC BOOL GET_RANDOM_VEHICLE_NODE( VECTOR centrePoint, FLOAT radius, INT MinLanes, BOOL bAvoidDeadEnds, BOOL bAvoidHighways, VECTOR &vecReturn, INT &NodeAddress) = "0x5b0e3f68e96beb2f"

// PURPOSE: Returns a random water node within the given radius of the centre point
// PARAMS:
//  VECTOR centrePoint		centre of the circle to be considered
//  FLOAT radius			radius of the circle to be considered
//  INT MinLanes			not sure if this will have any effect for water nodes
//  BOOL bAvoidDeadEnds		not sure if this will have any effect for water nodes
//  BOOL bAvoidHighways		not sure if this will have any effect for water nodes
//  VECTOR &vecReturn		if the command returns TRUE then this will be filled in with the coords of the node found
//  INT &NodeAddress		if the command returns TRUE then this will contain a value that can be used in GET_SPAWN_COORDS_FOR_VEHICLE_NODE
// RETURNS:
// 	TRUE:					if the command finds a water node within the defined circle
//	FALSE:					if the command fails to find a water node
NATIVE FUNC BOOL GET_RANDOM_WATER_NODE(VECTOR centrePoint, FLOAT radius, INT MinLanes, BOOL bAvoidDeadEnds, BOOL bAvoidHighways, VECTOR &vecReturn, INT &NodeAddress) = "0x2653d2e73d846b21"

//INFO: It prefers lanes that travel in the direction of towardsPos. 
//PARAM NOTES:
//PURPOSE: Will find the spawn coordinates for a car given a node. More info..
NATIVE PROC GET_SPAWN_COORDS_FOR_VEHICLE_NODE( INT NodeAddress, VECTOR towardsCoors, VECTOR &centrePoint, FLOAT &heading) = "0x90facaa3ecb5be0a"

//INFO: Retuns the point on the road edge from the nearest node to vInputNodePosition in the direction most orientated with fHeading
//PARAM NOTES:	vInputNodePosition	- should be the position of a road node, 
//				iDirection			- should be a heading (0 - 360)
//				vOutPositionByRoad	- the roadside position is passed back in this vector
//RETURNS: A boolean to indicate whether a position was found or not.
NATIVE FUNC BOOL GET_ROAD_BOUNDARY_USING_HEADING( VECTOR vInputNodePosition, FLOAT fHeading, VECTOR & vOutPositionByRoad ) = "0x3748f54b0aec5219"

//INFO: Retuns the position at the side of the road from the nearest node to vInputNodePosition in the direction most orientated with fHeading
//PARAM NOTES:	vInputNodePosition	- should be the position of a road node, 
//				iDirection			- should be a heading (0 - 360)
//				vOutPositionByRoad	- the roadside position is passed back in this vector
//RETURNS: A boolean to indicate whether a position was found or not.
NATIVE FUNC BOOL GET_POSITION_BY_SIDE_OF_ROAD_USING_HEADING( VECTOR vInputNodePosition, FLOAT fHeading, VECTOR & vOutPositionByRoad ) = "0xe11e1d153a55b04b"

//INFO: If the input node position is unsuitable, it will search 30m for a valid node.
//PARAM NOTES:	vInputNodePosition	- should be the position of a road node, 
//				iDirection			- should be a direction (0=forwards, 1=back, -1=doesn't matter)
//				vOutPositionByRoad	- the roadside position is passed back in this vector
//RETURNS: A boolean to indicate whether a position was found or not.

NATIVE FUNC BOOL GET_POSITION_BY_SIDE_OF_ROAD( VECTOR vInputNodePosition, INT iDirection, VECTOR & vOutPositionByRoad ) = "0xe245e7da125485ec"

//INFO: Returns true if the position is within any road extremes, false otherwise
//Don't use too often, this is moderately expensive
//PARAM NOTES: VehicleIndex is only used for Debug Drawing
NATIVE FUNC BOOL IS_POINT_ON_ROAD(VECTOR vPos, VEHICLE_INDEX VehicleIndex) = "0x9598a4bd9a1f848f"

//~>						Junction commands 

//INFO: Returns -1 if unsuccessful
//PARAM NOTES: vJunctionPosition should be within 50m of the desired junction.
//PURPOSE: Returns the number of light phases which the given junction posesses

NATIVE FUNC INT JUNCTIONS_GET_PHASE_COUNT(VECTOR vJunctionPosition) = "0x7a21ed424da0e6ca"


//INFO: Returns TRUE if successful
//PARAM NOTES: vJunctionPosition should be within 50m of the desired junction
//PURPOSE: Activates the given lights phase for the junction

NATIVE FUNC BOOL JUNCTIONS_ACTIVATE_PHASE(VECTOR vJunctionPosition, INT iPhase) = "0xb37eae203a0c60bf"


//INFO: Returns -1 if unsuccessful
//PARAM NOTES: vJunctionPosition should be within 50m of the desired junction
//PURPOSE: Get the nuber of entrances for the given junction

NATIVE FUNC INT JUNCTIONS_GET_ENTRANCE_COUNT(VECTOR vJunctionPosition) = "0x74c72db3d1bd5cec"


//INFO: Returns TRUE if successful
//PARAM NOTES: vJunctionPosition should be within 50m of the desired junction
//	vEntrancePosition_OUT   = the position of the road node which defines this entrance
//  fEntranceHeading_OUT    = the orientation of the heading in degrees (0..360)
//  iEntranceLightPhase_OUT = the lights phase of the main traffic flow associated with this entrance
//  iFilterLeftPhase_OUT    = if this entrance can also filter left from the left lane, this is the lights phase upon which that occurs
//  bFiltersLeftOnly_OUT    = specifies whether this entrance *only* features a filter left lane.
//                            (if so, then its phase will be in 'iEntranceLightPhase_OUT' as it constitutes the main flow.)
//  bFiltersRightAlso_OUT   = specifies whether vehicles can filter right freely from this entrance.
//	bFiltersRightOnly_OUT	= specifies whether vehicles MUST filter right from the right lane of this entrance

//PURPOSE: Get detailed information about the given junction entrance

NATIVE FUNC BOOL JUNCTIONS_GET_ENTRANCE_INFO(VECTOR vJunctionPosition, INT iEntrance, VECTOR & vEntrancePosition_OUT, FLOAT & fEntranceHeading_OUT, INT & iEntranceLightPhase_OUT, INT & iFilterLeftPhase_OUT, BOOL & bFiltersLeftOnly_OUT, BOOL & bFiltersRightAlso_OUT, BOOL & bFiltersRightOnly_OUT) = "0xa5d4826b23edd623"



//INFO: Returns TRUE if successful
//PARAM NOTES: vJunctionPosition should be within 50m of the desired junction
//PURPOSE: Restores the given junction to normal operation.  Its light phase will not immediately change, but it will go back to default timings.

NATIVE FUNC BOOL JUNCTIONS_RESTORE(VECTOR vJunctionPosition, INT iPhase) = "0x38de0601e64f7688"


//INFO: Returns TRUE if successful
//PARAM NOTES: vJunctionPosition should be within 50m of the desired junction
//PURPOSE: Causes the specified junction to malfunction : light timings will be ranomized.
//         (we might also hook the car AI into this to cause cars to crash more readily)

NATIVE FUNC BOOL JUNCTIONS_MALFUNCTION(VECTOR vJunctionPosition) = "0xd78e13bcef173f7a"

//INFO: Returns TRUE if successful
//PARAM NOTES: vJunctionPosition should be within 50m of the desired junction
//PURPOSE: Normally junctions will only exist within a certain distance of the player AND only when there are vehicles in their vicinity
//		   This function forces a templated junction at the specified coords into existance, and will maintain it until the script exits.
//		   This ONLY works for templated junctions - ie. those which have been set up manually via the in-game JunctionEditor.

NATIVE FUNC BOOL JUNCTIONS_CREATE_TEMPLATED_JUNCTION_FOR_SCRIPT(VECTOR vJunctionPosition) = "0x6a4305d4c1697307"

//INFO: Returns approximate height at the position in meters.
//PARAM NOTES: X and Y coordinates of the position, where the height will be sampled. 
//PURPOSE: Returns an approximate height at the 2d coordinate. This is based on a coarse grid compiled from collision data.

NATIVE FUNC FLOAT GET_APPROX_HEIGHT_FOR_POINT(FLOAT x, FLOAT y) = "0xe11e41ec1840ab62"

//INFO: Returns approximate height for the area in meters.
//PARAM NOTES: X and Y coordinates of the area minimum and maximum extents where the height will be sampled. 
//PURPOSE: Returns an approximate height for the area, which is the maximum height in that area. This is based on a coarse grid compiled from collision data.

NATIVE FUNC FLOAT GET_APPROX_HEIGHT_FOR_AREA(FLOAT x0, FLOAT y0, FLOAT x1, FLOAT y1) = "0x23555349ef1f5ebe"


//INFO: Returns approximate floor at the position in meters.
//PARAM NOTES: X and Y coordinates of the position, where the height will be sampled. 
//PURPOSE: Returns an approximate floor at the 2d coordinate. This is based on a coarse grid compiled from collision data.

NATIVE FUNC FLOAT GET_APPROX_FLOOR_FOR_POINT(FLOAT x, FLOAT y) = "0x1ada868ded581c1d"

//INFO: Returns approximate floor for the area in meters.
//PARAM NOTES: X and Y coordinates of the area minimum and maximum extents where the height will be sampled. 
//PURPOSE: Returns an approximate floor for the area, which is the floor height in that area. This is based on a coarse grid compiled from collision data.

NATIVE FUNC FLOAT GET_APPROX_FLOOR_FOR_AREA(FLOAT x0, FLOAT y0, FLOAT x1, FLOAT y1) = "0xc0f26bf4fdb0b07c"



NATIVE FUNC FLOAT CALCULATE_TRAVEL_DISTANCE_BETWEEN_POINTS(VECTOR vNode1Pos, VECTOR vNode2Pos) = "0x0035bf2ca9a27b39"

