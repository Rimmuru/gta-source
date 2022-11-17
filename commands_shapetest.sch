USING "types.sch"
USING "eulers.sch"

ENUM SHAPETEST_STATUS
	SHAPETEST_STATUS_NONEXISTENT = 0,	// Shapetest requests are discarded if they are ignored for a frame or as soon as the results are returned
 	SHAPETEST_STATUS_RESULTS_NOTREADY,	// Not ready yet; try again next frame
	SHAPETEST_STATUS_RESULTS_READY		// The result is ready and the results have been returned to you. The shapetest request has also just been destroyed
ENDENUM

//A list of the types of shape test available to script
ENUM SHAPETEST_TYPE
	SHAPETEST_INVALID = 0,
	SHAPETEST_LOSPROBE,
	//SHAPETEST_SPHERE, // Since nobody was using async sphere tests we disabled them
	SHAPETEST_BOUND,
	SHAPETEST_BOUNDINGBOX,
	SHAPETEST_BOX,
	SHAPETEST_CAPSULE
ENDENUM

// Make sure this is in sync with commands_shapetest.h enum.
CONST_INT		SCRIPT_INCLUDE_MOVER		1
CONST_INT		SCRIPT_INCLUDE_VEHICLE		2
CONST_INT		SCRIPT_INCLUDE_PED			4
CONST_INT		SCRIPT_INCLUDE_RAGDOLL		8
CONST_INT		SCRIPT_INCLUDE_OBJECT		16
CONST_INT		SCRIPT_INCLUDE_PICKUP		32
CONST_INT		SCRIPT_INCLUDE_GLASS		64
CONST_INT		SCRIPT_INCLUDE_RIVER		128
CONST_INT		SCRIPT_INCLUDE_FOLIAGE		256
CONST_INT		SCRIPT_INCLUDE_ALL			511

// Make sure this is in sync with commands_shapetest.h enum.
CONST_INT SCRIPT_SHAPETEST_OPTION_IGNORE_GLASS			1
CONST_INT SCRIPT_SHAPETEST_OPTION_IGNORE_SEE_THROUGH	2
CONST_INT SCRIPT_SHAPETEST_OPTION_IGNORE_NO_COLLISION	4
CONST_INT SCRIPT_SHAPETEST_OPTION_DEFAULT				SCRIPT_SHAPETEST_OPTION_IGNORE_GLASS | SCRIPT_SHAPETEST_OPTION_IGNORE_SEE_THROUGH | SCRIPT_SHAPETEST_OPTION_IGNORE_NO_COLLISION


//~>					Shapetest Commands						 <~

//INFO: Returns SHAPETEST_INDEX of 0 if it fails to create the shapetest request (there is a limit to the number that can be in the system)
//PARAM NOTES: 
//PURPOSE: 
//NOTES: 
NATIVE FUNC SHAPETEST_INDEX START_SHAPE_TEST_LOS_PROBE(VECTOR VecStartPos, VECTOR VecEndPos, INT LOSFlags = SCRIPT_INCLUDE_MOVER, ENTITY_INDEX ExcludeEntityIndex = NULL, INT Options=SCRIPT_SHAPETEST_OPTION_DEFAULT) = "0x1e4c19dc2ad86a18"

//INFO: Returns SHAPETEST_INDEX of 0 if it fails to create the shapetest request (there is a limit to the number that can be in the system)
//PARAM NOTES: 
//PURPOSE: 
//NOTES: !!!!! WARNING !!!!! THIS COMMAND IS MUCH MORE EXPENSIVE THAN USING THE ASYNCHRONOUS VERSION (START_SHAPE_TEST_LOS_PROBE). PLEASE TRY THAT FIRST!
NATIVE FUNC SHAPETEST_INDEX START_EXPENSIVE_SYNCHRONOUS_SHAPE_TEST_LOS_PROBE(VECTOR VecStartPos, VECTOR VecEndPos, INT LOSFlags = SCRIPT_INCLUDE_MOVER, ENTITY_INDEX ExcludeEntityIndex = NULL, INT Options=SCRIPT_SHAPETEST_OPTION_DEFAULT) = "0x53dfe85fc69724bd"

// Since nobody was using async sphere tests we disabled them
//INFO: Returns SHAPETEST_INDEX of 0 if it fails to create the shapetest request (there is a limit to the number that can be in the system)
//PARAM NOTES: 
//PURPOSE: 
//NOTES: 
//NATIVE FUNC SHAPETEST_INDEX START_SHAPE_TEST_SPHERE(VECTOR scrVecPos, float fRadius, INT LOSFlags = SCRIPT_INCLUDE_MOVER, ENTITY_INDEX ExcludeEntityIndex = NULL, INT Options=SCRIPT_SHAPETEST_OPTION_IGNORE_NO_COLLISION)

//INFO: Returns SHAPETEST_INDEX of 0 if it fails to create the shapetest request (there is a limit to the number that can be in the system)
//PARAM NOTES: 
//PURPOSE: 
//NOTES: 
CONST_INT LOS_FLAGS_BOUNDING_BOX  (SCRIPT_INCLUDE_VEHICLE | SCRIPT_INCLUDE_PED | SCRIPT_INCLUDE_RAGDOLL | SCRIPT_INCLUDE_OBJECT | SCRIPT_INCLUDE_PICKUP | SCRIPT_INCLUDE_GLASS)
NATIVE FUNC SHAPETEST_INDEX START_SHAPE_TEST_BOUNDING_BOX(ENTITY_INDEX EntityIndex, INT LOSFlags = LOS_FLAGS_BOUNDING_BOX, INT Options=SCRIPT_SHAPETEST_OPTION_IGNORE_NO_COLLISION) = "0x1031cba8ec6122a0"

//INFO: Returns SHAPETEST_INDEX of 0 if it fails to create the shapetest request (there is a limit to the number that can be in the system)
//PARAM NOTES: 
//PURPOSE: 
//NOTES: 
NATIVE FUNC SHAPETEST_INDEX START_SHAPE_TEST_BOX(VECTOR scrVecPos, VECTOR scrVecDims, VECTOR eulerAngles, EULER_ROT_ORDER RotOrder = EULER_YXZ, INT LOSFlags = SCRIPT_INCLUDE_MOVER, ENTITY_INDEX ExcludeEntityIndex = NULL, INT Options=SCRIPT_SHAPETEST_OPTION_IGNORE_NO_COLLISION) = "0x3e6477b1f848780e"

//INFO: Returns SHAPETEST_INDEX of 0 if it fails to create the shapetest request (there is a limit to the number that can be in the system)
//PARAM NOTES: 
//PURPOSE: 
//NOTES: 
NATIVE FUNC SHAPETEST_INDEX START_SHAPE_TEST_BOUND(ENTITY_INDEX EntityIndex, INT LOSFlags = SCRIPT_INCLUDE_MOVER, INT Options=SCRIPT_SHAPETEST_OPTION_IGNORE_NO_COLLISION) = "0x4d2318768f84c92c"

//INFO: Returns SHAPETEST_INDEX of 0 if it fails to create the shapetest request (there is a limit to the number that can be in the system)
//PARAM NOTES: 
//PURPOSE: 
//NOTES: 
NATIVE FUNC SHAPETEST_INDEX START_SHAPE_TEST_CAPSULE(VECTOR scrVecPos, VECTOR scrVecEndPos, float fRadius, INT LOSFlags = SCRIPT_INCLUDE_MOVER, ENTITY_INDEX ExcludeEntityIndex = NULL, INT Options=SCRIPT_SHAPETEST_OPTION_IGNORE_NO_COLLISION) = "0x9d2c476a7d8d9385"

//INFO: Returns SHAPETEST_INDEX of 0 if it fails to create the shapetest request (there is a limit to the number that can be in the system)
//PARAM NOTES: 
//PURPOSE: 
//NOTES: 
NATIVE FUNC SHAPETEST_INDEX START_SHAPE_TEST_SWEPT_SPHERE(VECTOR scrVecPos, VECTOR scrVecEndPos, float fRadius, INT LOSFlags = SCRIPT_INCLUDE_MOVER, ENTITY_INDEX ExcludeEntityIndex = NULL, INT Options=SCRIPT_SHAPETEST_OPTION_IGNORE_NO_COLLISION) = "0x418f12b9602cb2c7"

//INFO: Returns SHAPETEST_INDEX of 0 if it fails to create the shapetest request (there is a limit to the number that can be in the system)
//PARAM NOTES: 
//PURPOSE: 
//NOTES: Works just like START_SHAPE_TEST_LOS_PROBE only the start and end points of the probe are calculated based on the mouse cursor position projected into the world.
// vProbeStartPosOut and vProbeEndPosOut will be filled with the start and end points of the probe in world space.
NATIVE FUNC SHAPETEST_INDEX START_SHAPE_TEST_MOUSE_CURSOR_LOS_PROBE(VECTOR& vProbeStartPosOut, VECTOR& vProbeEndPosOut, INT LOSFlags = SCRIPT_INCLUDE_MOVER, ENTITY_INDEX ExcludeEntityIndex = NULL, INT Options=SCRIPT_SHAPETEST_OPTION_DEFAULT) = "0x34686dbb08c1704f"

//INFO:
//PARAM NOTES: Using INT as BOOL for out param
//PURPOSE: If status returned is SHAPETEST_STATUS_RESULTS_READY, then returns whether something was hit, and if so nearest hit pos and normal
//NOTES: The shapetest request is destroyed by this call if SHAPETEST_STATUS_RESULTS_READY is returned.
//		 If this is not called every frame then the request will be destroyed
NATIVE FUNC SHAPETEST_STATUS GET_SHAPE_TEST_RESULT(SHAPETEST_INDEX shapeTestGuid, INT& bHitSomething, VECTOR& vPos, VECTOR& vNormal, ENTITY_INDEX& EntityIndex) = "0xb2d581bd7446bbe9"

//INFO:
//PARAM NOTES: Using INT as BOOL for out param.
//PURPOSE:	If status returned is SHAPETEST_STATUS_RESULTS_READY, then returns whether something was hit, and if so nearest hit pos, normal and
//			a hash of the material name which can be tested against the enums defined in material_enums.sch.
//NOTES: The shapetest request is destroyed by this call if SHAPETEST_STATUS_RESULTS_READY is returned.
//		 If this is not called every frame then the request will be destroyed.
NATIVE FUNC SHAPETEST_STATUS GET_SHAPE_TEST_RESULT_INCLUDING_MATERIAL(SHAPETEST_INDEX shapeTestGuid, INT& bHitSomething, VECTOR& vPs, VECTOR& vNormal, MATERIAL_NAMES& material, ENTITY_INDEX& EntityIndex) = "0xc2c6d9d32d339eea"


//PURPOSE:	GET_SHAPE_TEST_RESULT and GET_SHAPE_TEST_RESULT_INCLUDING_MATERIAL create a temporary script GUID for the EntityIndex that they return.
//				Call this to free that script GUID.
//				This command won't do anything if it's called on a script-created entity so you shouldn't need to check that yourself before calling this command.
NATIVE PROC RELEASE_SCRIPT_GUID_FROM_ENTITY(ENTITY_INDEX EntityIndex) = "0x67be6880a27eb293"

