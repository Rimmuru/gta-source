
//INFO: This command takes the waves into account so the result may be different depending on the exact frame of calling. 
//PARAM NOTES:
//PURPOSE: Gets the height of the water below the position including the waves. More info..
NATIVE FUNC BOOL GET_WATER_HEIGHT(VECTOR Pos, FLOAT &Height) = "0x182029c7e52a1e4f"

//INFO: This command does not take the waves into account so the result will be the same between different frames
//PARAM NOTES:
//PURPOSE:Gets the height of the water below the position excluding the waves. More info..
NATIVE FUNC BOOL GET_WATER_HEIGHT_NO_WAVES(VECTOR Pos, FLOAT &Height) = "0x7f38b18228435c61"

// PARAM NOTES:
//  StartPos - the start of the probe
//  EndPos - the end of the probe
//  IntersectionPos - out paramter filled with the intersection position on the water. It will only  be valid if the function returns truex
// RETURN: True if the probe hits water before hitting land, false otherwise
// PURPOSE: Test a directed probe against the water
NATIVE FUNC BOOL TEST_PROBE_AGAINST_WATER(VECTOR StartPos, VECTOR EndPos, VECTOR &IntersectionPos) = "0x7cbf98360c4b22e4"

//Make sure this is insync with commands_water.h enum
ENUM SCRIPT_WATER_TEST_RESULT
	SCRIPT_WATER_TEST_RESULT_NONE = 0,
	SCRIPT_WATER_TEST_RESULT_WATER,
	SCRIPT_WATER_TEST_RESULT_BLOCKED
ENDENUM

// PARAM NOTES:
//  StartPos - the start of the probe
//  EndPos - the end of the probe
//  BlockingFlags - things that can block the probe from hitting water (see SCRIPT_INCLUDE flags in commands_shapetest.sch)
//  IntersectionPos - out paramter filled with the intersection position (as long as the result isn't SCRIPT_WATER_TEST_RESULT_NONE)
// RETURN: The result type (see SCRIPT_WATER_TEST_RESULT)
// PURPOSE: Test a directed probe against all water, including rivers
NATIVE FUNC SCRIPT_WATER_TEST_RESULT TEST_PROBE_AGAINST_ALL_WATER(VECTOR StartPos, VECTOR EndPos, INT BlockingFlags, VECTOR &IntersectionPos) = "0xd3c9aed49c894ccf"

// PARAM NOTES:
//  StartPos - the start of the probe (intersections above this Z-coordinate will not be counted)
//  BlockingFlags - things that can block the probe from hitting water (see SCRIPT_INCLUDE flags in commands_shapetest.sch)
//  Height - out parameter filled with the height of the probe intersection (as long as the result isn't SCRIPT_WATER_TEST_RESULT_NONE)
// RETURN: The result type (see SCRIPT_WATER_TEST_RESULT)
// PURPOSE: Find the height of land/water at a given xy coordinate.
NATIVE FUNC SCRIPT_WATER_TEST_RESULT TEST_VERTICAL_PROBE_AGAINST_ALL_WATER(VECTOR StartPos, INT BlockingFlags, FLOAT &Height) = "0xe77dda8d6639cb5e"

//INFO: This command will returns false must of the time and true during one frame every 4 seconds or so. 
//	This always happens at the same time in the cycle that the waves follow. 
//	Make sure to wait for this command to return true before starting to record a recording and before starting to play it back. 
//	This way the recording should be in synch with the waves when played back.
//	
//	You should probably also make sure the wheather is simular as this influences the choppyness of the waves. 
//PARAM NOTES:
//PURPOSE: Syncs the recording with the waves. 
NATIVE FUNC BOOL SYNCH_RECORDING_WITH_WATER() = "0x3ede3f11c4cd62a9"

//INFO: Allow interaction with water. This will create a disturbance in the water at coordinates (worldX,worldY).
//	newSpeed control the amplitude of movement to be applied to the water (between 0 and 5)
//	rate controls the blend between the current water speed at this point and newSpeed (0: no change, 1: newSpeed). 
//
//PARAM NOTES:
//PURPOSE: Modify water speed..
NATIVE PROC MODIFY_WATER(FLOAT worldX, FLOAT worldY, FLOAT newSpeed, FLOAT rate) = "0x93c91349de947dae"

//INFO: return the index of the quad, usefull if you need to remove just that one.
// MAX allowed quads is 8. Let code know if that needs increasing
//PARAM NOTES:
//PURPOSE: Add an extra calming quads, there's up to 8 in game, they're in world space, and axis aligned. dampening of 0.0f mean no water movements, 1.0f is full on.
NATIVE FUNC INT ADD_EXTRA_CALMING_QUAD(FLOAT minX, FLOAT minY, FLOAT maxX, FLOAT maxY, FLOAT dampening) = "0xcf4901abd5b28f62"

//INFO: 
//
//PARAM NOTES:
//PURPOSE: Remove a specific calming quad, using the index returned by ADD_EXTRA_CALMING_QUAD
NATIVE PROC REMOVE_EXTRA_CALMING_QUAD(INT Idx) = "0xf672e351681b36f7"

//INFO: 
//
//PARAM NOTES:
//PURPOSE: Remove all existing calming quads
NATIVE PROC REMOVE_ALL_EXTRA_CALMING_QUAD() = "0x0a0c7680ead49fa3"

//INFO: 
//
//PARAM NOTES:
//PURPOSE: Set the deep ocean scaler, 0.0 to 1.0, 0.0 will kill all big ocean waves.
NATIVE PROC SET_DEEP_OCEAN_SCALER(FLOAT scaler) = "0x3999d3aa01285aaf"

//INFO: 
//
//PARAM NOTES:
//PURPOSE: Get the deep ocean scaler.
NATIVE FUNC FLOAT GET_DEEP_OCEAN_SCALER() = "0x241ee5a1d050510d"

//INFO: 
//
//PARAM NOTES:
//PURPOSE: Sets the amount waves within calming quads are scaled by. This is only applied to the extra calming quads added by script
NATIVE PROC SET_CALMED_WAVE_HEIGHT_SCALER(FLOAT scaler) = "0xae0b891009dee273"

//INFO: 
//
//PARAM NOTES:
//PURPOSE: Reset the deep ocean scaler.
NATIVE PROC RESET_DEEP_OCEAN_SCALER() = "0x1a7781189253be0f"
