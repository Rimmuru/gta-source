USING "types.sch"
USING "ped_bonetags.sch"
USING "eulers.sch"

ENUM CAMERA_GRAPH_TYPE			// These are graph which apply as a modifier to the default speed OR time of some motion.
	GRAPH_TYPE_LINEAR = 0,		// simple linear motion
	GRAPH_TYPE_SIN_ACCEL_DECEL,	// accelerates at start, decelerates at end
	GRAPH_TYPE_ACCEL,			// Just Acceleration
	GRAPH_TYPE_DECEL,			// Just Deceleration
	GRAPH_TYPE_SLOW_IN,			
	GRAPH_TYPE_SLOW_OUT,
	GRAPH_TYPE_SLOW_IN_OUT,
	GRAPH_TYPE_VERY_SLOW_IN,
	GRAPH_TYPE_VERY_SLOW_OUT,
	GRAPH_TYPE_VERY_SLOW_IN_SLOW_OUT,
	GRAPH_TYPE_SLOW_IN_VERY_SLOW_OUT,
	GRAPH_TYPE_VERY_SLOW_IN_VERY_SLOW_OUT,
	GRAPH_TYPE_EASE_IN,
	GRAPH_TYPE_EASE_OUT,
	GRAPH_TYPE_QUADRATIC_EASE_IN,
	GRAPH_TYPE_QUADRATIC_EASE_OUT,
	GRAPH_TYPE_QUADRATIC_EASE_IN_OUT,
	GRAPH_TYPE_CUBIC_EASE_IN,
	GRAPH_TYPE_CUBIC_EASE_OUT,
	GRAPH_TYPE_CUBIC_EASE_IN_OUT,
	GRAPH_TYPE_QUARTIC_EASE_IN,
	GRAPH_TYPE_QUARTIC_EASE_OUT,
	GRAPH_TYPE_QUARTIC_EASE_IN_OUT,
	GRAPH_TYPE_QUINTIC_EASE_IN,
	GRAPH_TYPE_QUINTIC_EASE_OUT,
	GRAPH_TYPE_QUINTIC_EASE_IN_OUT,  
	GRAPH_TYPE_CIRCULAR_EASE_IN,
	GRAPH_TYPE_CIRCULAR_EASE_OUT,
	GRAPH_TYPE_CIRCULAR_EASE_IN_OUT,
	GRAPH_TYPE_MAX				// The maximum number of graph types, do not use.
ENDENUM

// Defines the different gameplay contexts for which camera view modes may be configured. Must match camControlHelperMetadataViewMode::eViewModeContext in camera/system/CameraMetadata.h
ENUM CAM_VIEW_MODE_CONTEXT
	CAM_VIEW_MODE_CONTEXT_ON_FOOT = 0,
    CAM_VIEW_MODE_CONTEXT_IN_VEHICLE,
    CAM_VIEW_MODE_CONTEXT_ON_BIKE,
    CAM_VIEW_MODE_CONTEXT_IN_BOAT,
    CAM_VIEW_MODE_CONTEXT_IN_AIRCRAFT,
	CAM_VIEW_MODE_CONTEXT_IN_SUBMARINE,
	CAM_VIEW_MODE_CONTEXT_IN_HELI,
	CAM_VIEW_MODE_CONTEXT_IN_TURRET,
	NUM_CAM_VIEW_MODE_CONTEXTS
ENDENUM

// Defines the different view modes supported by gameplay cameras. Must match camControlHelperMetadataViewMode::eViewMode in camera/system/CameraMetadata.h
ENUM CAM_VIEW_MODE
	CAM_VIEW_MODE_THIRD_PERSON_NEAR = 0,
	CAM_VIEW_MODE_THIRD_PERSON_MEDIUM,
	CAM_VIEW_MODE_THIRD_PERSON_FAR,
	CAM_VIEW_MODE_CINEMATIC,
	CAM_VIEW_MODE_FIRST_PERSON,
	NUM_CAM_VIEW_MODES,
	CAM_VIEW_MODE_THIRD_PERSON = CAM_VIEW_MODE_THIRD_PERSON_MEDIUM
ENDENUM

// For use with setting the follow ped submode.
// NOTE: This enum is deprecated. Please use CAM_VIEW_MODE instead
ENUM PED_ZOOM_LEVEL
	PED_ZOOM_LEVEL_BAD = -1,
	PED_ZOOM_LEVEL_NEAR,
	PED_ZOOM_LEVEL_MEDIUM,
	PED_ZOOM_LEVEL_FAR,
	PED_ZOOM_LEVEL_CINEMATIC,
	PED_ZOOM_LEVEL_FIRST_PERSON,
	NUM_PED_ZOOM_LEVELS
ENDENUM

// For use with setting the follow vehicle submode.
// NOTE: This enum is deprecated. Please use CAM_VIEW_MODE instead
ENUM VEHICLE_ZOOM_LEVEL 
	VEHICLE_ZOOM_LEVEL_BAD = -1,
	VEHICLE_ZOOM_LEVEL_NEAR,
	VEHICLE_ZOOM_LEVEL_MEDIUM,
	VEHICLE_ZOOM_LEVEL_FAR,
	VEHICLE_ZOOM_LEVEL_CINEMATIC,
	VEHICLE_ZOOM_LEVEL_BONNET,
	NUM_VEHICLE_ZOOM_LEVELS
ENDENUM

// Allows for custom options to be specified for the node of a camera spline. Must match camSplineNode::eFlags in camera/helpers/SplineNode.h
ENUM CAM_SPLINE_NODE_FLAGS
	CAM_SPLINE_NODE_NO_FLAGS			= 0,
	CAM_SPLINE_NODE_SMOOTH_ROT			= 1,	// Additional smoothing is applied to the transition in orientation between the previous node and the specified node. This smoothing can reduce the appearance of discontinuities at the nodes, but may not be desirable where a linear transition is required.
	CAM_SPLINE_NODE_SMOOTH_LENS_PARAMS	= 2,	// Additional smoothing is applied to the transition in lens paramaters, such as FOV and motion blur strength, between the previous node and the specified node. This smoothing can reduce the appearance of discontinuities at the nodes, but may not be desirable where a linear transition is required.
	CAM_SPLINE_NODE_EASE_IN				= 4,	// Per-node ease in
	CAM_SPLINE_NODE_EASE_OUT			= 8,	// Per-node ease out
	CAM_SPLINE_NODE_EASE_INOUT			= 16	// Per-node ease in and out
ENDENUM

// Allows for custom options to be specified for the node of a camera spline. Must match camSplineNode::eFlags in camera/helpers/SplineNode.h
ENUM CAM_SPLINE_NODE_FORCE_FLAGS
	CAM_SPLINE_NODE_FORCE_NONE			= 0,
	CAM_SPLINE_NODE_FORCE_LINEAR		= 1,	// Do linear interpolation between this node and the next.
	CAM_SPLINE_NODE_FORCE_CUT			= 2,	// Do not interpolate to next node, cut to it.
	CAM_SPLINE_NODE_FORCE_PAUSE			= 4,	// Force camera to pause before starting this node.
	CAM_SPLINE_NODE_FORCE_LEVEL			= 8		// Force look at entity offset to be level with camera position.
ENDENUM

ENUM CAM_SPLINE_SMOOTHING_FLAGS
	CAM_SPLINE_NO_SMOOTH				= 0, 	// no smoothing just moves at a constant rate
	CAM_SPLINE_SLOW_IN_SMOOTH			= 1, 	// Decelerates when approaching a node
	CAM_SPLINE_SLOW_OUT_SMOOTH			= 2, 	// Accelerates slowly when leaving a node
	CAM_SPLINE_SLOW_IN_OUT_SMOOTH		= 3,	// Decelerates when approaching a node and accelerates slowly when leaving a node
	CAM_SPLINE_VERY_SLOW_IN				= 4, 
	CAM_SPLINE_VERY_SLOW_OUT			= 5, 
	CAM_SPLINE_VERY_SLOW_IN_SLOW_OUT	= 6, 
	CAM_SPLINE_SLOW_IN_VERY_SLOW_OUT	= 7, 
	CAM_SPLINE_VERY_SLOW_IN_VERY_SLOW_OUT=8,
	CAM_SPLINE_EASE_IN					= 9, 
	CAM_SPLINE_EASE_OUT					= 10, 
	CAM_SPLINE_QUADRATIC_EASE_IN		= 11, 
	CAM_SPLINE_QUADRATIC_EASE_OUT		= 12, 
	CAM_SPLINE_QUADRATIC_EASE_IN_OUT	= 13, 
	CAM_SPLINE_CUBIC_EASE_IN			= 14, 
	CAM_SPLINE_CUBIC_EASE_OUT			= 15, 
	CAM_SPLINE_CUBIC_EASE_IN_OUT		= 16, 
	CAM_SPLINE_QUARTIC_EASE_IN			= 17, 
	CAM_SPLINE_QUARTIC_EASE_OUT			= 18, 
	CAM_SPLINE_QUARTIC_EASE_IN_OUT		= 19, 
	CAM_SPLINE_QUINTIC_EASE_IN			= 20, 
	CAM_SPLINE_QUINTIC_EASE_OUT			= 21, 
	CAM_SPLINE_QUINTIC_EASE_IN_OUT		= 22, 
	CAM_SPLINE_CIRCULAR_EASE_IN			= 23, 
	CAM_SPLINE_CIRCULAR_EASE_OUT		= 24, 
	CAM_SPLINE_CIRCULAR_EASE_IN_OUT		= 25 
ENDENUM


ENUM RENDERING_OPTION_FLAGS
	RO_NO_OPTIONS = 0,
	RO_STOP_RENDERING_OPTION_WHEN_PLAYER_EXITS_INTO_COVER = 1
ENDENUM

CONST_INT	DEFAULT_CAM_SPLINE_NODE_FLAGS			CAM_SPLINE_NODE_SMOOTH_ROT + CAM_SPLINE_NODE_SMOOTH_LENS_PARAMS

CONST_INT	DEFAULT_INTERP_IN_TIME					2000
CONST_INT	DEFAULT_INTERP_OUT_TIME					2000
CONST_INT	DEFAULT_DWELL_TIME						2000
CONST_FLOAT	DEFAULT_HINT_RELATIVE_PITCH_SMOOTH_RATE	0.0125

CONST_INT	DEFAULT_INTERP_TO_FROM_GAME				3000

CONST_INT	DEFAULT_PED_CAM_INTERP_TIME				1000
CONST_INT	DEFAULT_VEHICLE_CAM_INTERP_TIME			1000

ENUM CAM_ANIMATION_FLAGS
	CAF_DEFAULT = 0,													//					
	CAF_LOOPING = 1										//Repeat the animation 
ENDENUM

//Type of hint to call to override the default hint behaviour
ENUM HINT_TYPE
	HINTTYPE_DEFAULT = 0,
	
	HINTTYPE_NO_FOV = HASH("NO_FOV_HINT_HELPER"), /// 1511508800
	HINTTYPE_VEHICLE_HIGH_ZOOM = HASH("VEHICLE_HIGH_ZOOM_HINT_HELPER"), // 1726668277
	HINTTYPE_ARM3_VEHICLE = HASH("ARM3_VEHICLE_HINT_HELPER"), // -244429742
	HINTTYPE_AGENCY_HEIST_3B_SKY_DIVING = HASH("AGENCY_HEIST_3B_SKY_DIVING_HINT_HELPER"),// 1213015174
	HINTTYPE_FAMILY3_HOUSE_VEHICLE = HASH("FAMILY3_HOUSE_VEHICLE_HINT_HELPER"), // -1123838900
	HINTTYPE_ARM2_MCS6_VEHICLE = HASH("ARM2_MCS6_VEHICLE_HINT_HELPER"), // 2010485655
	HINTTYPE_KILLER_CAM = HASH("KILLER_CAM_HINT_HELPER"), // 1844968929
HINTTYPE_FAMILY3_COACH_ON_BALCONY_VEHICLE_HINT_HELPER = HASH("FAMILY3_COACH_ON_BALCONY_VEHICLE_HINT_HELPER"), // -87780624
	HINTTYPE_CHOP_HINT_HELPER = HASH("CHOP_HINT_HELPER") // 193150208
ENDENUM

//Camera types
ENUM CAMERA_TYPE
	CAMTYPE_SCRIPTED = HASH("DEFAULT_SCRIPTED_CAMERA"), 
	CAMTYPE_SCRIPTED_FLY = HASH("DEFAULT_SCRIPTED_FLY_CAMERA"), //An in-game fly camera designed for use in the mission creator
	CAMTYPE_ANIMATED = HASH("DEFAULT_ANIMATED_CAMERA"), 
	CAMTYPE_TRANSITION = HASH("DEFAULT_TRANSITION_CAMERA"),
	CAMTYPE_SPLINE_DEFAULT = HASH("DEFAULT_SPLINE_CAMERA" ),	//smoothed and velocity constrained spline, not continous velocity
	CAMTYPE_SPLINE_TIMED = HASH("TIMED_SPLINE_CAMERA"),			//smoothed and velocity constrained spline, not continous velocity
	CAMTYPE_SPLINE_ROUNDED = HASH("ROUNDED_SPLINE_CAMERA"),		//rounded spline with continous velocity
	CAMTYPE_SPLINE_SMOOTHED = HASH("SMOOTHED_SPLINE_CAMERA"),	//smoothed spline with continous velocity
	CAMTYPE_SPLINE_TIMED_CUSTOM = HASH("CUSTOM_TIMED_SPLINE_CAMERA")	//smoothed and velocity constrained spline, not continous velocity, custom speeds can be set
ENDENUM

//Shot Type
ENUM SHOT_TYPE
	SHOTTYPE_CAMERA_MAN = HASH("CAMERA_MAN_SHOT"),
	SHOTTYPE_HELI_CHASE = HASH("HELI_CHASE_SHOT"),
	SHOTTYPE_VEHICLE_MOUNTED_CAMERA = HASH("SCRIPT_CAR_MOUNTED_SHOT")
ENDENUM

ENUM CAM_IN_VEHICLE_STATE
	CAM_ENTERING_VEHICLE				= 0, //Gameplay camera is interpolating to the follow vehicle camera.
	CAM_INSIDE_VEHICLE					= 1, //Gameplay camera is running the follow vehilce camera.	
	CAM_EXITING_VEHICLE					= 2, //Gameplay camera is interpolating to the follow ped camera.
	CAM_OUTSIDE_VEHICLE					= 3	 //Gameplay camera is running the follow ped camera.	
ENDENUM

// Must match camInterface::eDeathFailEffectState in camera/CamInterface.h
ENUM CAM_DEATH_FAIL_EFFECT_STATE
	CAM_DEATH_FAIL_EFFECT_INACTIVE		= 0,
	CAM_DEATH_FAIL_EFFECT_INTRO			= 1,
	CAM_DEATH_FAIL_EFFECT_OUTRO			= 2
ENDENUM

ENUM FPS_FLASH_TYPE			// These are graph which apply as a modifier to the default speed OR time of some motion.
	FLASH_TYPE_NEUTRAL = 0,		// neutral flash (default, for non character switch situations)
	FLASH_TYPE_MICHAEL,			// Michael's character colour
	FLASH_TYPE_FRANKLIN,		// Franklin's character colour
	FLASH_TYPE_TREVOR			// Trevor's character colour
ENDENUM

//~>					 Camera High Level						<~

//INFO: The script must have created a camera that can be rendered. Note that rendering is typically not stopped if another script thread still expects it to be active (see bShouldApplyAcrossAllThreads.)
//PARAM NOTES:DoGameCamInterp: If true, the rendering change is implemented as an interpolation.
//	Duration: Specifies the duration of any interpolation.
//  bShouldLockInterpolationSourceFrame: If false, the source frame is updated throughout the interpolation, allowing for fully dynamic interpolation that can reduce the appearance of 'lag' when the source frame is not static.
//	bShouldApplyAcrossAllThreads: If true, a request to stop rendering will be enforced irrespective of whether other script threads expect rendering to be active. Note that this can result in conflicts between concurrent script threads, so this must be used with caution.
//PURPOSE: Tells the game that the script wants to enable or disable rendering of scripted cameras. More Info.. 
NATIVE PROC RENDER_SCRIPT_CAMS(BOOL bSetActive, BOOL DoGameCamInterp, INT Duration = DEFAULT_INTERP_TO_FROM_GAME, BOOL bShouldLockInterpolationSourceFrame = TRUE, BOOL bShouldApplyAcrossAllThreads = FALSE, RENDERING_OPTION_FLAGS RenderingOptions = RO_NO_OPTIONS) = "0x850d4ef3d40fb068"

//INFO: The script must have created a camera that can be rendered. Note that rendering is typically not stopped if another script thread still expects it to be active (see bShouldApplyAcrossAllThreads.)
//PARAM NOTES: bShouldApplyAcrossAllThreads: If true, a request to stop rendering will be enforced irrespective of whether other script threads expect rendering to be active. Note that this can result in conflicts between concurrent script threads, so this must be used with caution.
//             DistanceToBlend: overrides the distance over which the catch up blend occurs, if zero is specified, default blend distance will be used.
//PURPOSE: Tells the game that the script wants to disable rendering of scripted cameras and force gameplay camera to blend from scripted camera to gameplay camera.
NATIVE PROC STOP_RENDERING_SCRIPT_CAMS_USING_CATCH_UP(BOOL bShouldApplyAcrossAllThreads = FALSE, FLOAT DistanceToBlend = 0.0, CAM_SPLINE_SMOOTHING_FLAGS BlendType = CAM_SPLINE_SLOW_IN_OUT_SMOOTH, RENDERING_OPTION_FLAGS RenderingOptions = RO_NO_OPTIONS) = "0xbaea2321313356d0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that an interpolation is occuring from a script cam to a gameplay cam. 
NATIVE FUNC BOOL IS_INTERPOLATING_FROM_SCRIPT_CAMS () = "0x4709488c1d867377"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks that an interpolation is occurring to a script controlled cam from a gameplay cam.
NATIVE FUNC BOOL IS_INTERPOLATING_TO_SCRIPT_CAMS () = "0xe19e89b5fb4d4646"

//~>					Camera Creation / Destruction						 <~

//INFO:
//PARAM NOTES: Valid camera names are as follows:
//	"DEFAULT_SCRIPTED_CAMERA"
//	"DEFAULT_SCRIPTED_FLY_CAMERA"	- An in-game fly camera designed for use in the mission creator
//	"DEFAULT_SPLINE_CAMERA"
//	"DEFAULT_ANIMATED_CAMERA"
//	"TIMED_SPLINE_CAMERA"
//	"ROUNDED_SPLINE_CAMERA"
//	"SMOOTHED_SPLINE_CAMERA"
//  "CUSTOM_TIMED_SPLINE_CAMERA"

//	StartActivated sets if the camera starts acive
//PURPOSE: Create a camera with its param of a given name. More info..
NATIVE FUNC CAMERA_INDEX CREATE_CAM_WITH_PARAMS  (STRING CameraName, Vector vecPos, VECTOR vecRot,  FLOAT FOV = 65.0, BOOL StartActivated = FALSE, EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0x6729fa3af971be2a"

//INFO:
//PARAM NOTES: Valid camera names are as follows:
//	"DEFAULT_SCRIPTED_CAMERA"
//	"DEFAULT_SCRIPTED_FLY_CAMERA"	- An in-game fly camera designed for use in the mission creator
//	"DEFAULT_SPLINE_CAMERA"
//	"DEFAULT_ANIMATED_CAMERA"
//	"DEFAULT_TRANSITION_CAMERA"
//	"TIMED_SPLINE_CAMERA"
//	"ROUNDED_SPLINE_CAMERA"
//	"SMOOTHED_SPLINE_CAMERA"
//  "CUSTOM_TIMED_SPLINE_CAMERA"
//	StartActivated sets if the camera starts acive
//PURPOSE: Create a camera of a given name. More info..
NATIVE FUNC CAMERA_INDEX CREATE_CAM(STRING CameraName, BOOL StartActivated = FALSE) = "0xb93a4265cb0f5b1f"

//INFO:
//PARAM NOTES: StartActivated sets if the camera starts acive
//PURPOSE: Create a camera of a given name. More info..
NATIVE FUNC CAMERA_INDEX CREATE_CAMERA_WITH_PARAMS(CAMERA_TYPE Camera, Vector vecPos, VECTOR vecRot,  FLOAT FOV = 65.0, BOOL StartActivated = FALSE, EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0x1bcec0b1056bd6ac"

//INFO:
//PARAM NOTES: StartActivated sets if the camera starts acive
//PURPOSE: Create a camera of a given name. More info..
NATIVE FUNC CAMERA_INDEX CREATE_CAMERA(CAMERA_TYPE Camera = CAMTYPE_SCRIPTED, BOOL StartActivated = FALSE) = "0xae96f9aff21228dc"

//INFO: 
//PARAM NOTES: bShouldApplyAcrossAllThreads: If true, the specified script-controlled camera is destroyed, no matter which script thread owns it. Note that this can result in conflicts between concurrent script threads, so this must be used with caution.
//PURPOSE: Destroy a single script-controlled camera.
NATIVE PROC DESTROY_CAM(CAMERA_INDEX CameraIndex, BOOL bShouldApplyAcrossAllThreads = FALSE) = "0x588ddcb644c6486a"

//INFO: 
//PARAM NOTES: bShouldApplyAcrossAllThreads: If true, ALL script-controlled cameras are destroyed, no matter which script thread owns them. Note that this can result in conflicts between concurrent script threads, so this must be used with caution.
//PURPOSE: Destroy ALL script-controlled cameras.
NATIVE PROC DESTROY_ALL_CAMS(BOOL bShouldApplyAcrossAllThreads = FALSE) = "0x4b248030f70a5d8b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Does this camera still exist.
NATIVE FUNC BOOL DOES_CAM_EXIST(CAMERA_INDEX CameraIndex) = "0x876b1078e90c91cb"

//~>					Camera Basic States Of Activity & Propagation						 <~

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a camera to be active and rendering, last cam set to active renders to the game.
NATIVE PROC SET_CAM_ACTIVE(CAMERA_INDEX CameraIndex, BOOL bActiveState) = "0xdd786b89b15aa63f"

//INFO: Note this mat reurn true but does not mean its rendering to the game screen
//PARAM NOTES:
//PURPOSE: Checks that a camera is active. More info..
NATIVE FUNC BOOL IS_CAM_ACTIVE(CAMERA_INDEX CameraIndex) = "0xa24fda4986456697"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if the current cam is rendering to the game
NATIVE FUNC BOOL IS_CAM_RENDERING (CAMERA_INDEX CamIndex) = "0x4b0b4e357722c507"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the index of the cam currently rendering to the game screen.
NATIVE FUNC CAMERA_INDEX GET_RENDERING_CAM () = "0x0065a2cb8ececaf1"


//~>					 Camera Frame Queries				<~

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the camera's position
NATIVE FUNC VECTOR GET_CAM_COORD(CAMERA_INDEX CameraIndex) = "0x97a9bb81c66772b5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the camera's rotation in Euler angles (in degrees.)
NATIVE FUNC VECTOR GET_CAM_ROT(CAMERA_INDEX CameraIndex, EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0xe42645792657f001"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the camera's field of view (in degrees.)
NATIVE FUNC FLOAT GET_CAM_FOV(CAMERA_INDEX CameraIndex) = "0x703cb0b4057dddf5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the camera's near clip distance (in m.)
NATIVE FUNC FLOAT GET_CAM_NEAR_CLIP(CAMERA_INDEX CameraIndex) = "0x998fe8dab2221f27"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the camera's far clip distance (in m.)
NATIVE FUNC FLOAT GET_CAM_FAR_CLIP(CAMERA_INDEX CameraIndex) = "0x9953cc74efa4f571"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the camera's near depth of field distance (in m.)
NATIVE FUNC FLOAT GET_CAM_NEAR_DOF(CAMERA_INDEX CameraIndex) = "0xc2612d223d915a1c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the camera's far depth of field distance (in m.)
NATIVE FUNC FLOAT GET_CAM_FAR_DOF(CAMERA_INDEX CameraIndex) = "0x1abe956c93973baa"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the 'strength' of the camera's depth of field effect (0.0 to 1.0)
NATIVE FUNC FLOAT GET_CAM_DOF_STRENGTH(CAMERA_INDEX CameraIndex) = "0x06d153c0b99b6128"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the distances of the four planes for the camera's depth of field effect (in m.)
NATIVE PROC GET_CAM_DOF_PLANES(CAMERA_INDEX CameraIndex, FLOAT& nearOutOfFocusPlane, FLOAT& nearInFocusPlane, FLOAT& farInFocusPlane, FLOAT& farOutOfFocusPlane) = "0xa914246d4f8a957c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get whether the camera should use the shallow DOF mode of the high-quality depth of field effect (when enabled using SET_USE_HI_DOF.)
NATIVE FUNC BOOL GET_CAM_USE_SHALLOW_DOF_MODE(CAMERA_INDEX CameraIndex) = "0xd119f6b1fb0b65b6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the camera's motion blur strength (0.0 to 1.0)
NATIVE FUNC FLOAT GET_CAM_MOTION_BLUR_STRENGTH(CAMERA_INDEX CameraIndex) = "0xf1ccbbc140a5d518"

//~>					 Camera Final Rendered Frame Queries				<~

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the postion of the final rendered cam.
NATIVE FUNC VECTOR GET_FINAL_RENDERED_CAM_COORD() = "0x524171c8263e7c3e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the rotation of the final rendered cam.
NATIVE FUNC VECTOR GET_FINAL_RENDERED_CAM_ROT(EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0x52bd0fa2342c7246"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the rotation of the final rendered cam for a remote player.
NATIVE FUNC VECTOR GET_FINAL_RENDERED_REMOTE_PLAYER_CAM_ROT(PLAYER_INDEX playerIndex, EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0x58e4c4eb027d47b6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the FOV of the final rendered cam.
NATIVE FUNC FLOAT GET_FINAL_RENDERED_CAM_FOV() = "0x07c8c8b0cbd44d3b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the FOV of the final rendered cam for a remote player.
NATIVE FUNC FLOAT GET_FINAL_RENDERED_REMOTE_PLAYER_CAM_FOV(PLAYER_INDEX playerIndex) = "0x00f2683a6a133040"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the near clip of the final rendered cam.
NATIVE FUNC FLOAT GET_FINAL_RENDERED_CAM_NEAR_CLIP() = "0xe51db7b55b7f9f44"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the far clip of the final rendered cam.
NATIVE FUNC FLOAT GET_FINAL_RENDERED_CAM_FAR_CLIP() = "0xdf083f70a83a7271"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the near Dof of the final rendered cam.
NATIVE FUNC FLOAT GET_FINAL_RENDERED_CAM_NEAR_DOF() = "0xa97deab4b3e49b73"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the far dof of the final rendered cam.
NATIVE FUNC FLOAT GET_FINAL_RENDERED_CAM_FAR_DOF() = "0x658584b384fb3c2a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the motion blur strength of the final rendered cam.
NATIVE FUNC FLOAT GET_FINAL_RENDERED_CAM_MOTION_BLUR_STRENGTH() = "0x26dab410cd0cec53"

//~>					Camera Frame Setup					<~

//INFO: 
//PARAM NOTES: If duration is set > 0 the camera will interp to the specified settings.
//PURPOSE: Sets the camera's position, rotation and field of view. More info
NATIVE PROC SET_CAM_PARAMS(CAMERA_INDEX CameraIndex, VECTOR vPos, VECTOR vRot, FLOAT FOV, INT Duration = 0, CAMERA_GRAPH_TYPE GraphTypePos = GRAPH_TYPE_SIN_ACCEL_DECEL, CAMERA_GRAPH_TYPE GraphTypeRot = GRAPH_TYPE_SIN_ACCEL_DECEL, EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0x15f5db94f871e803"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the camera's position.
NATIVE PROC SET_CAM_COORD(CAMERA_INDEX CameraIndex, VECTOR VecNewCoors) = "0xdee4f5f0b93be664"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the camera's rotation in Euler angles (in degrees.) 
NATIVE PROC SET_CAM_ROT(CAMERA_INDEX CameraIndex, VECTOR VecNewRot, EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0x93150d31ce38fe75"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the camera's field of view (in degrees.)
NATIVE PROC SET_CAM_FOV(CAMERA_INDEX CameraIndex, FLOAT FOV) = "0x0a18c027350d3c19"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the camera's near clip distance (in m.)
NATIVE PROC SET_CAM_NEAR_CLIP(CAMERA_INDEX CameraIndex, FLOAT NearClip) = "0x74789da66781db64"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the camera's far clip distance (in m.)
NATIVE PROC SET_CAM_FAR_CLIP(CAMERA_INDEX CameraIndex, FLOAT FarClip) = "0xac79343a28cea8e0"

//INFO: 
//PARAM NOTES:
//PURPOSE: force the camera's far clip distance (in m.) overriding the TimeCycle's imposed far clip
NATIVE PROC FORCE_CAM_FAR_CLIP(CAMERA_INDEX CameraIndex, FLOAT FarClip) = "0xd9b532b49a80dfe1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the camera's motion blur strength (0.0 to 1.0)
NATIVE PROC SET_CAM_MOTION_BLUR_STRENGTH(CAMERA_INDEX CameraIndex, FLOAT Strength) = "0x8e55b7fed2291f41"

//~>					 Depth Of Field						 <~

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the camera's near depth of field distance (in m.)
NATIVE PROC SET_CAM_NEAR_DOF(CAMERA_INDEX CameraIndex, FLOAT NearDof) = "0x1d809c24759a3fed"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the camera's far depth of field distance (in m.)
NATIVE PROC SET_CAM_FAR_DOF(CAMERA_INDEX CameraIndex, FLOAT FarDof) = "0xe13ce1cd336ffac9"

//INFO: Note that this command nulls the effect of any previous call to SET_CAM_DOF_PLANES, as the out-of-focus DOF planes will henceforth be derived based upon the DOF strength.
//PARAM NOTES:
//PURPOSE: Set the 'strength' of the camera's depth of field effect (0.0 to 1.0.) More info.
NATIVE PROC SET_CAM_DOF_STRENGTH(CAMERA_INDEX CameraIndex, FLOAT Strength) = "0xd6a650055b44902e"

//INFO: Note that this command nulls the effect of any previous call to SET_CAM_DOF_STRENGTH, as the four DOF planes are overwritten and the relationship between the out-of-focus planes and the DOF strength is broken.
//PARAM NOTES:
//PURPOSE: Set the distances of the four planes for the camera's depth of field effect (in m.) More info.
NATIVE PROC SET_CAM_DOF_PLANES(CAMERA_INDEX CameraIndex, FLOAT nearOutOfFocusPlane, FLOAT nearInFocusPlane, FLOAT farInFocusPlane, FLOAT farOutOfFocusPlane) = "0xe5744a8f282963ce"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set whether the camera should use the shallow DOF mode of the high-quality depth of field effect (when enabled using SET_USE_HI_DOF.)
NATIVE PROC SET_CAM_USE_SHALLOW_DOF_MODE(CAMERA_INDEX CameraIndex, BOOL bState) = "0xcaadf41aa439a01f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enables the high-quality depth of field effect on script cameras, which uses both near and far planes, for the current frame only.
NATIVE PROC SET_USE_HI_DOF() = "0x44908cda9d1050c9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enables the high-quality depth of field effect on the synced scene cameras, which uses both near and far planes, for the current frame only.
NATIVE PROC SET_USE_HI_DOF_ON_SYNCED_SCENE_THIS_UPDATE() = "0x731a880555da3647"

//INFO:
//PARAM NOTES: The valid range of 'distance' is 0.0 to 99999.0.
//PURPOSE: Specifies a custom focus distance (in metres) that should be used by the adaptive depth of field effect, overriding of any other focus behaviour. Note that this override is blended relative to the measured depth via SET_CAM_DOF_OVERRIDDEN_FOCUS_DISTANCE_BLEND_LEVEL.
NATIVE PROC SET_CAM_DOF_OVERRIDDEN_FOCUS_DISTANCE(CAMERA_INDEX CameraIndex, FLOAT distance) = "0x1bf7583954f8933d"

//INFO:
//PARAM NOTES: The valid range of 'blendLevel' is 0.0 to 1.0.
//PURPOSE: Controls the blend between the custom focus distance specified by SET_CAM_DOF_OVERRIDDEN_FOCUS_DISTANCE and the focus distance that is computed based upon the depth of the scene.
NATIVE PROC SET_CAM_DOF_OVERRIDDEN_FOCUS_DISTANCE_BLEND_LEVEL(CAMERA_INDEX CameraIndex, FLOAT blendLevel) = "0x718303d9313f7a97"

//INFO:
//PARAM NOTES: The valid range of both 'gridScalingX' and 'gridScalingY' is 0.0 to 1.0.
//PURPOSE: Specifies the size of the grid (via ratios of the horizontal/x and vertical/y screen size) used to assess the depth of the scene when computing the focus distance of the adpative depth of field effect.
NATIVE PROC SET_CAM_DOF_FOCUS_DISTANCE_GRID_SCALING(CAMERA_INDEX CameraIndex, FLOAT gridScalingX, FLOAT gridScalingY) = "0xe9ac8c191ff37e64"

//INFO:
//PARAM NOTES: The valid range of both 'powerFactorNear' and 'powerFactorFar' is 0.0 to 1.0.
//PURPOSE: Specifies the power factors that should be used to modify the subject magnification for the foreground (near) and background (far) depth of field blur. This allows for unnaturally shallow depth of field to be applied at greater focus distances.
NATIVE PROC SET_CAM_DOF_SUBJECT_MAGNIFICATION_POWER_FACTOR_NEAR_FAR(CAMERA_INDEX CameraIndex, FLOAT powerFactorNear, FLOAT powerFactorFar) = "0x432e7a511de8170c"

//INFO:
//PARAM NOTES: The valid range of 'depth' is 0.0 to 99999.0.
//PURPOSE: Specifies the maximum valid pixel depth (in metres) to be considered when computing the focus distance based upon the depth of the scene. The depth of each pixel will be limited to this distance.
NATIVE PROC SET_CAM_DOF_MAX_PIXEL_DEPTH(CAMERA_INDEX CameraIndex, FLOAT depth) = "0xe8cd4c1732381e72"

//INFO:
//PARAM NOTES: The valid range of 'powerFactor' is 0.0 to 1.0.
//PURPOSE: Specifies the power factor that should be used to modify the depth of each pixel when computing the focus distance based upon the depth of the scene.
NATIVE PROC SET_CAM_DOF_PIXEL_DEPTH_POWER_FACTOR(CAMERA_INDEX CameraIndex, FLOAT powerFactor) = "0xddbcf51529e88a3f"

//INFO:
//PARAM NOTES: The valid range of 'fNumber' is (f/)0.5 to (f/)256.0.
//PURPOSE: Specifies the aperture (as an f-number) to be used by the physical lens model in the adaptive depth of field effect. Reducing this value will result in shallower depth of field and stonger blur.
NATIVE PROC SET_CAM_DOF_FNUMBER_OF_LENS(CAMERA_INDEX CameraIndex, FLOAT fNumber) = "0x5ac409e1be1df384"

//INFO:
//PARAM NOTES: The valid range of 'multiplier' is 0.1 to 10.0.
//PURPOSE: Specifies the focal length multiplier to be used by the physical lens model in the adaptive depth of field effect. This is equivalent to crop factor. Increasing this value will result in shallower depth of field and stonger blur.
NATIVE PROC SET_CAM_DOF_FOCAL_LENGTH_MULTIPLIER(CAMERA_INDEX CameraIndex, FLOAT multiplier) = "0xd3a34fb28d95d754"

//INFO:
//PARAM NOTES: The valid range of 'distanceBias' is -100.0 to 100.0.
//PURPOSE: Specifies an offset to be applied to the focus distance (in metres.) This is especially useful for adjusting the focus point on a look-at or attach entity that is being focussed upon.
NATIVE PROC SET_CAM_DOF_FOCUS_DISTANCE_BIAS(CAMERA_INDEX CameraIndex, FLOAT distanceBias) = "0x6610a3e15c9aba9b"

//INFO:
//PARAM NOTES: The valid range of 'distance' is 0.0 to 99999.0.
//PURPOSE: Specifies how far the foreground blur is allowed to render ahead of the camera (in metres.) Note that this limit is blended in via SET_CAM_DOF_MAX_NEAR_IN_FOCUS_DISTANCE_BLEND_LEVEL.
NATIVE PROC SET_CAM_DOF_MAX_NEAR_IN_FOCUS_DISTANCE(CAMERA_INDEX CameraIndex, FLOAT distance) = "0xd4bc9962fda90b40"

//INFO:
//PARAM NOTES: The valid range of 'blendLevel' is 0.0 to 1.0.
//PURPOSE: Controls the extent to which the distance limit specified by SET_CAM_DOF_MAX_NEAR_IN_FOCUS_DISTANCE is applied.
NATIVE PROC SET_CAM_DOF_MAX_NEAR_IN_FOCUS_DISTANCE_BLEND_LEVEL(CAMERA_INDEX CameraIndex, FLOAT blendLevel) = "0x6344c0c82c899078"

//INFO:
//PARAM NOTES: The valid range of 'radius' is 0.0 to 30.0.
//PURPOSE: Specifies the maximum blur radius that should be applied at the distance limit specified by SET_CAM_DOF_MAX_NEAR_IN_FOCUS_DISTANCE. A radius of 1.0 means that DOF blur will cease being visible at that distance.
NATIVE PROC SET_CAM_DOF_MAX_BLUR_RADIUS_AT_NEAR_IN_FOCUS_LIMIT(CAMERA_INDEX CameraIndex, FLOAT radius) = "0xace748c80de5bf76"

//INFO:
//PARAM NOTES: The valid range of 'springConstant' is 0.0 to 1000.0. A value of 0.0 bypasses the damped spring entirely. Otherwise, a higher spring constant will result in a stiffer spring and a more responsive focus distance.
//PURPOSE: Specifies the spring constant that should be used when damping any increase in measured focus distance. Note that this spring has no effect when overriding the focus distance or focusing on a look-at or attach entity.
NATIVE PROC SET_CAM_DOF_FOCUS_DISTANCE_INCREASE_SPRING_CONSTANT(CAMERA_INDEX CameraIndex, FLOAT springConstant) = "0xa91ec7a1aa4dbc17"

//INFO:
//PARAM NOTES: The valid range of 'springConstant' is 0.0 to 1000.0. A value of 0.0 bypasses the damped spring entirely. Otherwise, a higher spring constant will result in a stiffer spring and a more responsive focus distance.
//PURPOSE: Specifies the spring constant that should be used when damping any decrease in measured focus distance. Note that this spring has no effect when overriding the focus distance or focusing on a look-at or attach entity.
NATIVE PROC SET_CAM_DOF_FOCUS_DISTANCE_DECREASE_SPRING_CONSTANT(CAMERA_INDEX CameraIndex, FLOAT springConstant) = "0x3ce8a2efc3febd6d"

//INFO:
//PARAM NOTES:
//PURPOSE: If 'state' is TRUE, the adaptive depth of field effect will focus upon any valid camera look-at entity, unless the focus distance has been overridden explicitly.
NATIVE PROC SET_CAM_DOF_SHOULD_FOCUS_ON_LOOK_AT_TARGET(CAMERA_INDEX CameraIndex, BOOL state) = "0xdc1142c71eefffd2"

//INFO:
//PARAM NOTES:
//PURPOSE: If 'state' is TRUE, the adaptive depth of field effect will focus upon any valid camera attach entity, unless the focus distance has been overridden explicitly.
NATIVE PROC SET_CAM_DOF_SHOULD_FOCUS_ON_ATTACH_PARENT(CAMERA_INDEX CameraIndex, BOOL state) = "0xf460dab6f0323c0a"

//INFO:
//PARAM NOTES:
//PURPOSE: If 'state' is TRUE, the adaptive depth of field effect will constrain the foreground DOF blur to keep any valid camera look-at entity in focus.
NATIVE PROC SET_CAM_DOF_SHOULD_KEEP_LOOK_AT_TARGET_IN_FOCUS(CAMERA_INDEX CameraIndex, BOOL state) = "0xfcc9acbd7bfa65a0"

//INFO:
//PARAM NOTES:
//PURPOSE: If 'state' is TRUE, the adaptive depth of field effect will constrain the foreground DOF blur to keep any valid camera attach entity in focus.
NATIVE PROC SET_CAM_DOF_SHOULD_KEEP_ATTACH_PARENT_IN_FOCUS(CAMERA_INDEX CameraIndex, BOOL state) = "0x813b285667a55baf"

//INFO:
//PARAM NOTES:
//PURPOSE: If 'state' is TRUE, the adaptive depth of field effect will consider the depth of alpha surfaces like glass when measuring the focus distance. Note that the effect of this may not be visible if when the focus distance is overridden or when focussing on a look-at or attach entity.
NATIVE PROC SET_CAM_DOF_SHOULD_MEASURE_POST_ALPHA_PIXEL_DEPTH(CAMERA_INDEX CameraIndex, BOOL state) = "0x0264fdab5f244cc5"


//~>					 Camera Attachment						 <~

//INFO: 
//PARAM NOTES: EntityIndex: The index of the entity to attach the camera to.
//	vecOffset: An additional offset to be applied from the attach position.
//	bOffsetIsRelative: If true, vecOffset is applied relative to the orientation of the attached entity, rather than in world-space.
//PURPOSE: Attaches a camera to an entity.
NATIVE PROC ATTACH_CAM_TO_ENTITY(CAMERA_INDEX CameraIndex, ENTITY_INDEX EntityIndex, VECTOR vecOffset, BOOL bOffsetIsRelative = TRUE) = "0x3fb84450a94cb528"

//INFO: 
//PARAM NOTES: PedIndex: The index of the ped to attach the camera to.
//	BoneTag: The tag of the ped bone to attach to. See the definition of PED_BONETAG for further information.
//	vecOffset: An additional offset to be applied from the attach position.
//	bOffsetIsRelative: If true, vecOffset is applied relative to the orientation of the attached ped (not the bone), rather than in world-space.
//PURPOSE: Attaches a camera to a ped's bone.
NATIVE PROC ATTACH_CAM_TO_PED_BONE(CAMERA_INDEX CameraIndex, PED_INDEX PedIndex, PED_BONETAG BoneTag, VECTOR vecOffset, BOOL bOffsetIsRelative = TRUE) = "0xb6b6ac43334c34a7"

//INFO: 
//PARAM NOTES: 
//  PedIndex: The index of the ped to attach the camera to.
//	BoneTag: The tag of the ped bone to attach to. See the definition of PED_BONETAG for further information.
//	vecRotationOffset: An additional rotational offset to be applied from the attach bone rotation (x=yaw, y=pitch, z=roll).
//	vecPositionOffset: An additional offset to be applied from the attach position.
//	bOffsetIsRelative: If true, vecOffset is applied relative to the orientation of the attached ped (not the bone), rather than in world-space.
//PURPOSE: Attaches a camera to a ped's bone full matrix.
NATIVE PROC HARD_ATTACH_CAM_TO_PED_BONE(CAMERA_INDEX CameraIndex, PED_INDEX PedIndex, PED_BONETAG BoneTag, VECTOR vecRotationOffset, VECTOR vecPositionOffset, BOOL bOffsetIsRelative = TRUE) = "0x1cc06cd0e210ff39"

//INFO: 
//PARAM NOTES: 
//  EntityIndex: The index of the entity to attach the camera to.
//	vecRotationOffset: An additional rotational offset to be applied from the attach entity rotation (x=yaw, y=pitch, z=roll).
//	vecPositionOffset: An additional offset to be applied from the attach position.
//	bOffsetIsRelative: If true, vecOffset is applied relative to the orientation of the attached entity, rather than in world-space.
//PURPOSE: Attaches a camera to an entity's full matrix.
NATIVE PROC HARD_ATTACH_CAM_TO_ENTITY(CAMERA_INDEX CameraIndex, ENTITY_INDEX EntityIndex, VECTOR vecRotationOffset, VECTOR vecPositionOffset, BOOL bOffsetIsRelative = TRUE) = "0x383a38da6b16db3a"

//INFO: 
//PARAM NOTES: 
//  vehicleIndex: The index of the vehicle to attach the camera to.
//	vehicleBoneIndex: The index of the vehicle bone to attach to.
//	hardAttachment: if set to true, will fully attach the camera to the bone transform, otherwise only the position of the bone will be retained.
//	vecRotationOffset: An additional rotational offset to be applied from the attach bone rotation (x=yaw, y=pitch, z=roll). This is only considered if hardAttachment is set to TRUE.
//	vecPositionOffset: An additional offset to be applied from the attach position.
//	bOffsetIsRelative: If true, the offsets are applied relative to the transform of the attached vehicle (not the bone), rather than in world-space.
//PURPOSE: Attaches a camera to a vehicle's bone.
NATIVE PROC ATTACH_CAM_TO_VEHICLE_BONE(CAMERA_INDEX CameraIndex, ENTITY_INDEX vehicleIndex, INT vehicleBoneIndex, BOOL hardAttachment, VECTOR vecRotationOffset, VECTOR vecPositionOffset, BOOL bOffsetIsRelative) = "0xbe3ecd06b6bdf192"

//INFO: 
//PARAM NOTES:
//PURPOSE: Detaches the camera from an entity.
NATIVE PROC DETACH_CAM(CAMERA_INDEX CameraIndex) = "0xdf900bcbc752c62a"


//~>					 Camera Roll Inheritence						 <~

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the camera roll to be relative to a target of type vehicle.
NATIVE PROC SET_CAM_INHERIT_ROLL_VEHICLE(CAMERA_INDEX CameraIndex, VEHICLE_INDEX VehicleIndex) = "0x8fd169d152a83209"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the camera roll to be relative to a target of type object.
NATIVE PROC SET_CAM_INHERIT_ROLL_OBJECT(CAMERA_INDEX CameraIndex, OBJECT_INDEX ObjectIndex) = "0x465a41a2097c11f0"

//~>					  Camera Pointing						 <~

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the look target position.
NATIVE PROC POINT_CAM_AT_COORD(CAMERA_INDEX CameraIndex, VECTOR VecCoors ) = "0x46045ff49485808b"

//INFO: Both cameras must be script controlled
//PARAM NOTES:
//PURPOSE: Points a camera at to look at another cam. More info..
NATIVE PROC POINT_CAM_AT_CAM(CAMERA_INDEX LookingCameraIndex, CAMERA_INDEX LookedAtCameraIndex  ) = "0x3482608561b83d01"

//INFO: 
//PARAM NOTES: EntityIndex: The index of the entity to point the camera at.
//	vecOffset: An additional offset to be applied from the look-at position.
//	bOffsetIsRelative: If true, vecOffset is applied relative to the orientation of the entity being pointed at, rather than in world-space.
//PURPOSE: Points the camera at an entity.
NATIVE PROC POINT_CAM_AT_ENTITY(CAMERA_INDEX CameraIndex, ENTITY_INDEX EntityIndex, VECTOR vecOffset, BOOL bOffsetIsRelative = TRUE) = "0x98a99a554b458431"

//INFO: 
//PARAM NOTES: PedIndex: The index of the ped to point the camera at.
//	BoneTag: The tag of the ped bone to point at. See the definition of PED_BONETAG for further information.
//	vecOffset: An additional offset to be applied from the look-at position.
//	bOffsetIsRelative: If true, vecOffset is applied relative to the orientation of the ped being pointed at (not the bone), rather than in world-space.
//PURPOSE: Points the camera at a ped's bone.
NATIVE PROC POINT_CAM_AT_PED_BONE(CAMERA_INDEX CameraIndex, PED_INDEX PedIndex, PED_BONETAG BoneTag, VECTOR vecOffset, BOOL bOffsetIsRelative = TRUE) = "0x4940b67d34c2f6c1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Stops the cameras pointing at an entity.
NATIVE PROC STOP_CAM_POINTING(CAMERA_INDEX CameraIndex) = "0x45e6cc1354100c1b"


//~>			Miscellaneous Camera-Specific Commands			<~

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether the frame of the specified script-controlled camera (when rendered) can influence aiming.
NATIVE PROC SET_CAM_AFFECTS_AIMING(CAMERA_INDEX CameraIndex, BOOL bState) = "0x156db56766eded12"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether the heading of the specified script-controlled camera (when rendered) can influence the orientation of the mini-map.
NATIVE PROC SET_CAM_CONTROLS_MINI_MAP_HEADING(CAMERA_INDEX CameraIndex, BOOL bState) = "0x8d32379ec749b177"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether the specified script-controlled camera (when rendered) will report that it is inside a vehicle, which can affect the rendering of vehicle glass.
NATIVE PROC SET_CAM_IS_INSIDE_VEHICLE(CAMERA_INDEX CameraIndex, BOOL bState) = "0x225b8233719be2b5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a custom max near clip on the specified script-controlled camera (when rendered), this remains persistent for the lifetime of the camera.
NATIVE PROC SET_CAM_CUSTOM_MAX_NEAR_CLIP(CAMERA_INDEX CameraIndex, FLOAT fMaxNearClip) = "0x1df22d878d47fb84"

//INFO: 
//PARAM NOTES:
//PURPOSE: Motion blur decay is on by default for all cameras.  This allows script to turn it on/off.
NATIVE PROC ALLOW_MOTION_BLUR_DECAY(CAMERA_INDEX CameraIndex, BOOL enable) = "0x7bd08352b65a3135"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set a debug name for specified scripted camera, will be displayed in debug text and camera table.
NATIVE PROC SET_CAM_DEBUG_NAME(CAMERA_INDEX CameraIndex, STRING debugName) = "0x3e93523104b9387c"

//~>					  Debug Camera						 <~

//INFO: 
//PARAM NOTES:
//PURPOSE: Will give you a reference to the debug free camera.
NATIVE FUNC CAMERA_INDEX GET_DEBUG_CAM() = "0xbc265d4ea63ebdd3"

//INFO: 
//PARAM NOTES: bActiveState: If true, the debug free camera is activated, otherwise the camera is deactivated.
//	bShouldIgnoreDebugPadCameraToggle: If true and bActiveState is also true, the debug pad input for toggling the free camera will be ignored, preventing the camera from being deactivated using the pad.
//PURPOSE: Activates and deactivates the debug free camera, with optional support for disabling the free camera toggle input of the debug pad.  More info..
NATIVE PROC SET_DEBUG_CAM_ACTIVE(BOOL bActiveState, BOOL bShouldIgnoreDebugPadCameraToggle = FALSE) = "0xd1614197be2ad548"

//~>					 Camera Splines						 <~

//INFO: 
//PARAM NOTES: vPos: The position of the node in world-space.
//	vRot: The rotation/orientation of the node in Euler angles (in degrees.)
//	iDuration: The time taken to transition from the previous node to this node, in milliseconds.
//	Flags: Defines custom options to be applied to this node. See definition of CAM_SPLINE_NODE_FLAGS for more info.
//PURPOSE: Appends a simple node on to a spline camera.  More info..
NATIVE PROC ADD_CAM_SPLINE_NODE(CAMERA_INDEX CameraIndex, VECTOR vPos, VECTOR vRot, INT iDuration, CAM_SPLINE_NODE_FLAGS Flags = DEFAULT_CAM_SPLINE_NODE_FLAGS, EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0x8be9d374da4bb99b"

//INFO: 
//PARAM NOTES: SourceCameraIndex: The source scripted camera from which the frame parameters will be cloned for use by this node.
//	iDuration: The time taken to transition from the previous node to this node, in milliseconds.
//	Flags: Defines custom options to be applied to this node. See definition of CAM_SPLINE_NODE_FLAGS for more info.
//PURPOSE: Appends a full node on to a spline camera. The frame parameters of this new node are cloned from an existing scripted camera. More info..
NATIVE PROC ADD_CAM_SPLINE_NODE_USING_CAMERA_FRAME(CAMERA_INDEX CameraIndex, CAMERA_INDEX SourceCameraIndex, INT iDuration, CAM_SPLINE_NODE_FLAGS Flags = DEFAULT_CAM_SPLINE_NODE_FLAGS) = "0x396c6b684ead1b8f"

//INFO: 
//PARAM NOTES: SourceCameraIndex: The source scripted camera which is used as the node of a spline to be played back by the spline cam.
//	iDuration: The time taken to transition from the previous node to this node, in milliseconds.
//	Flags: Defines custom options to be applied to this node. See definition of CAM_SPLINE_NODE_FLAGS for more info.
//PURPOSE: Appends a full node on to a spline camera. The frame parameters of this new node are cloned from an existing scripted camera.  More info..
NATIVE PROC ADD_CAM_SPLINE_NODE_USING_CAMERA(CAMERA_INDEX CameraIndex, CAMERA_INDEX SourceCameraIndex, INT iDuration, CAM_SPLINE_NODE_FLAGS Flags = DEFAULT_CAM_SPLINE_NODE_FLAGS) = "0x6c12d23212020231"

//INFO: 
//PARAM NOTES: iDuration: The time taken to transition from the previous node to this node, in milliseconds.
//	Flags: Defines custom options to be applied to this node. See definition of CAM_SPLINE_NODE_FLAGS for more info.
//PURPOSE: Appends a full node on to a spline camera. The frame parameters of this new node are cloned (live) from the active gameplay frame.  More info..
NATIVE PROC ADD_CAM_SPLINE_NODE_USING_GAMEPLAY_FRAME(CAMERA_INDEX CameraIndex, INT iDuration, CAM_SPLINE_NODE_FLAGS Flags = DEFAULT_CAM_SPLINE_NODE_FLAGS) = "0x5a43b6c214087091"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Sets the phase of spline cam progress. Phase should be between 0.0 and 1.0
NATIVE PROC SET_CAM_SPLINE_PHASE(CAMERA_INDEX CameraIndex, float phase) = "0x59489d17dc49b7b3"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Gets the phase of spline cam progress. Return phase will be between be 0.0 and 1.0
NATIVE FUNC FLOAT GET_CAM_SPLINE_PHASE(CAMERA_INDEX CameraIndex) = "0x3f65eb34e4c562f2"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Gets the phase of spline cam between the current node and its next one. Return phase will be between be 0.0 and 1.0
NATIVE FUNC FLOAT GET_CAM_SPLINE_NODE_PHASE(CAMERA_INDEX CameraIndex) = "0xa55408dfc92148e7"

//INFO: 	CAM_SPLINE_NO_SMOOTHING		= 0, 	No smoothing just moves at a constant rate
//	CAM_SPLINE_SLOW_IN					= 1, 				Decelerates when approaching a node
//	CAM_SPLINE_SLOW_OUT				=2, 				Accelerates slowly when leaving a node
//	CAM_SPLINE_SLOW_IN_OUT			=3					Decelerates when approaching a node and accelerates slowly when leaving a node
//PARAM NOTES: 
//PURPOSE: Sets the smoothing style of the spline camera at the spline nodes. More info..
NATIVE PROC SET_CAM_SPLINE_SMOOTHING_STYLE(CAMERA_INDEX CameraIndex, CAM_SPLINE_SMOOTHING_FLAGS SmoothingStyle) = "0xadb0920102000613"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Sets the total duration of the spline, use for rounded and smoothed splines. 
NATIVE PROC SET_CAM_SPLINE_DURATION(CAMERA_INDEX CameraIndex, INT Duration) = "0x4bcdeab65827c4e2"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns current index of specified spline camera.  Returns zero if camera is invalid.
NATIVE FUNC INT GET_CAM_SPLINE_NODE_INDEX(CAMERA_INDEX CameraIndex) = "0x0631106d8d29716a"

//INFO: Nodes must be setup first, then the linear flag can be modified.
//PARAM NOTES: 
//PURPOSE: Set per-node easing with a scaler to control how quickly the ease ramps up/down.
NATIVE PROC SET_CAM_SPLINE_NODE_EASE(CAMERA_INDEX CameraIndex, INT NodeIndex, CAM_SPLINE_NODE_FLAGS Flags, FLOAT Scale = 1.0) = "0x4617238b97beacf4"

//INFO: Nodes must be setup first, then the extra flags can be modified.
//PARAM NOTES: 	CAM_SPLINE_NODE_FORCE_LINEAR - Force two node to ignore spline path and do linear blend between them, if both are relative to an entity
//				CAM_SPLINE_NODE_FORCE_CUT    - Force one node to skip blend to the next one.
//				CAM_SPLINE_NODE_FORCE_PAUSE  - Force camera to pause just before reaching this node.
//				CAM_SPLINE_NODE_FORCE_LEVEL  - Force look at entity offset to be level with camera position.
//PURPOSE: Set/Clear additional spline node options.
NATIVE PROC SET_CAM_SPLINE_NODE_EXTRA_FLAGS(CAMERA_INDEX CameraIndex, INT NodeIndex, CAM_SPLINE_NODE_FORCE_FLAGS Flags) = "0xcc1998034eecce71"

//INFO: Nodes must be setup first before this is called.  Linearly interpolates between previous and next node's velocity.  Disabled if zero.
//PARAM NOTES:
//PURPOSE: By default, scale is zero, so disabled.  Set value between -1.0 and 1.0 to modify the velocity and change the shape of the spline.
NATIVE PROC SET_CAM_SPLINE_NODE_VELOCITY_SCALE(CAMERA_INDEX CameraIndex, INT NodeIndex, FLOAT Scale) = "0xa1d493603e8d15b4"

//INFO: Nodes must be setup first before this is called. (Note: have to override all nodes in the spline)
//PARAM NOTES:
//PURPOSE: Sets an entry with the speed of specified "time" and when (as a percentage) the spline should blend from that speed to the next node's speed.
NATIVE PROC OVERRIDE_CAM_SPLINE_VELOCITY(CAMERA_INDEX CameraIndex, INT Entry, FLOAT StartPoint, FLOAT Speed) = "0xa20e6cdd67dc817d"

//INFO: Nodes must be setup first before this is called. (Note: have to override all nodes in the spline)
//PARAM NOTES:
//PURPOSE: Sets an entry with the speed of specified "time" and when (as a percentage) the spline should blend from that speed to the next node's speed.
NATIVE PROC OVERRIDE_CAM_SPLINE_MOTION_BLUR(CAMERA_INDEX CameraIndex, INT Entry, FLOAT BlurStart, FLOAT MotionBlur) = "0x3437c3a2be385970"

//INFO:
//PARAM NOTES:
//PURPOSE: Test if spline camera is paused or not.
NATIVE FUNC BOOL IS_CAM_SPLINE_PAUSED(CAMERA_INDEX CameraIndex) = "0xfb493c3d9e4e7ec9"

//~>					  Camera Interpolations 						 <~
//INFO: 
//PARAM NOTES: DestinationCam: This cam that will be interpolated to.
//	OriginCam: This is the cam that will be interpolted from.
//	Duration: The time of the tinterp in milli seconds.
//PURPOSE:Sets a cam active which will interpolated too. More info..
NATIVE PROC SET_CAM_ACTIVE_WITH_INTERP (CAMERA_INDEX DestinationCam, CAMERA_INDEX OriginCam, INT Duration, CAMERA_GRAPH_TYPE GraphTypePos = GRAPH_TYPE_SIN_ACCEL_DECEL, CAMERA_GRAPH_TYPE GraphTypeRot = GRAPH_TYPE_SIN_ACCEL_DECEL) = "0x889b4f9d52e23dee"

//INFO: 
//PARAM NOTES:
//PURPOSE: Is the specified camera interpolating from another camera or from an old set of parameters?
NATIVE FUNC BOOL IS_CAM_INTERPOLATING(CAMERA_INDEX CameraIndex) = "0x52522e25010580a1"


//~>					  Camera Shaking Simulation 						 <~

//INFO:
//PARAM NOTES: Valid shake names are as follows:
//	"SMALL_EXPLOSION_SHAKE"
//	"MEDIUM_EXPLOSION_SHAKE"
//	"LARGE_EXPLOSION_SHAKE"
//	"HAND_SHAKE"
//	"JOLT_SHAKE"
//	"VIBRATE_SHAKE"
//	"WOBBLY_SHAKE"
//	"DRUNK_SHAKE"
//	fAmplitudeScalar: Can be used to increase or decrease the amplitude of the shake effect.
//PURPOSE: Apply a predefined shake to the camera.
NATIVE PROC SHAKE_CAM(CAMERA_INDEX CameraIndex, STRING ShakeName, FLOAT fAmplitudeScalar = 1.0) = "0x9bae3263d9b1fcb9"

//INFO:
//PARAM NOTES: 	AnimDictionary		- The name of the animation dictionary containing the animation to be rendered as a shake.
//				AnimClipName		- The name of the animation to be rendered as a shake.
//				ShakeName			- Controls how shake ramps up/down at start/end [OPTIONAL parameter]
//				fAmplitudeScalar	- Can be used to increase or decrease the amplitude of the shake effect.
//PURPOSE: Set a camera animation to play on scripted camera.
NATIVE PROC ANIMATED_SHAKE_CAM(CAMERA_INDEX CameraIndex, STRING AnimDictionary, STRING AnimClipName, STRING ShakeName, FLOAT fAmplitudeScalar = 1.0) = "0xbfd7467b93e06b26"

//INFO:
//PARAM NOTES:
//PURPOSE: Is the specified camera currently shaking?
NATIVE FUNC BOOL IS_CAM_SHAKING(CAMERA_INDEX CameraIndex) = "0x629b37af59212703"

//INFO:
//PARAM NOTES: fAmplitudeScalar: Can be used to increase or decrease the amplitude of the shake effect.
//PURPOSE: Sets the overall amplitude scaling for an active camera shake.
NATIVE PROC SET_CAM_SHAKE_AMPLITUDE(CAMERA_INDEX CameraIndex, FLOAT fAmplitudeScalar = 1.0) = "0x1342e9e0cde9b323"

//INFO:
//PARAM NOTES: bStopImmediately: If TRUE, the shake will stop immediately, otherwise it will enter its release phase and fade out.
//PURPOSE: Stop the camera shaking.
NATIVE PROC STOP_CAM_SHAKING(CAMERA_INDEX CameraIndex, BOOL bStopImmediately = FALSE) = "0x80b66ef081475250"

//INFO:
//PARAM NOTES: Valid shake names are as follows:
//	"SMALL_EXPLOSION_SHAKE"
//	"MEDIUM_EXPLOSION_SHAKE"
//	"LARGE_EXPLOSION_SHAKE"
//	"HAND_SHAKE"
//	"JOLT_SHAKE"
//	"VIBRATE_SHAKE"
//	"WOBBLY_SHAKE"
//	"DRUNK_SHAKE"
//	fAmplitudeScalar: Can be used to increase or decrease the amplitude of the shake effect.
//PURPOSE: Apply a predefined shake globally to the rendered result of all active scripted cameras.
NATIVE PROC SHAKE_SCRIPT_GLOBAL(STRING ShakeName, FLOAT fAmplitudeScalar = 1.0) = "0x7b6613dcaa2c2c29"

//PARAM NOTES: 	AnimDictionary		- The name of the animation dictionary containing the animation to be rendered as a shake.
//				AnimClipName		- The name of the animation to be rendered as a shake.
//				ShakeName			- Controls how shake ramps up/down at start/end [OPTIONAL parameter]
//				fAmplitudeScalar	- Can be used to increase or decrease the amplitude of the shake effect.
//PURPOSE: Apply an animated shake globally to the rendered result of all active scripted cameras.
NATIVE PROC ANIMATED_SHAKE_SCRIPT_GLOBAL(STRING AnimDictionary, STRING AnimClipName, STRING ShakeName, FLOAT fAmplitudeScalar = 1.0) = "0x0d38c39fb4abd855"

//INFO:
//PARAM NOTES:
//PURPOSE: Is a scripted camera global shake active?
NATIVE FUNC BOOL IS_SCRIPT_GLOBAL_SHAKING() = "0xe9331aea6c1820c9"

//INFO:
//PARAM NOTES: fAmplitudeScalar: Can be used to increase or decrease the amplitude of the shake effect.
//PURPOSE: Sets the overall amplitude scaling for an active scripted camera global shake.
NATIVE PROC SET_SCRIPT_GLOBAL_SHAKE_AMPLITUDE(FLOAT fAmplitudeScalar = 1.0) = "0x7885a971a16a5e27"

//INFO:
//PARAM NOTES: bStopImmediately: If TRUE, the shake will stop immediately, otherwise it will enter its release phase and fade out.
//PURPOSE: Stop the active scripted camera global shake.
NATIVE PROC STOP_SCRIPT_GLOBAL_SHAKING(BOOL bStopImmediately = FALSE) = "0x8564f0807a5c1cd6"

//INFO:
//PARAM NOTES:
//   vehicleIndex: the entity index of the vehicle that owns the broken part. Must be the player vehicle for the shake to trigger.
//   vehiclePart: the vehicle part ID (needs to match the eHierarchyId enum)
//   amplitude: the amplitude of the shake (1.0 is default, between 0.0 and 1.0 will scale down the shake strength, above 1.0 will increase it)
//PURPOSE: trigger a camera shake bespokely tuned to match the the specified vehicle part position relative to the camera.
NATIVE PROC TRIGGER_VEHICLE_PART_BROKEN_CAMERA_SHAKE(ENTITY_INDEX vehicleIndex, INT vehiclePart, FLOAT amplitude = 1.0) = "0x6ffb2bece4cf4ed7"

//~>				  Camera Animation Playback				<~

//INFO:
//PARAM NOTES: CameraIndex: The camera to be animated. Note that this camera must have been created using the name: "DEFAULT_ANIMATED_CAMERA".
//	AnimName: The name of the animation to be played on the camera.
//	AnimDictName: The name of the animation dictionary containing the animation to be played on the camera.
//	vOriginPosition - The position of the origin in world coordinates to playback the anim from. Any local scene origin/offset specified in the animation clip will be applied in addition to this.
//	vOriginRotation - The rotation of the origin in degrees (<< pitch, roll, heading >>) to playback the anim from. Any local scene origin/offset specified in the animation clip will be applied in addition to this.
//	AnimFlags - The animation flags to be used for playback.
//	RotOrder - The rotation order to be used when composing a matrix from the Euler angles specified in vOriginRotation. Defaults to YXZ order.
//PURPOSE: Play a camera animation on the specified camera. Note that the animation must already be loaded prior to calling this command. More info..
NATIVE FUNC BOOL PLAY_CAM_ANIM(CAMERA_INDEX CameraIndex, STRING AnimName, STRING AnimDictName, VECTOR vOriginPosition, VECTOR vOriginRotation, CAM_ANIMATION_FLAGS AnimFlags = CAF_DEFAULT, EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0x8b28384f571e6da9"

//INFO:
//PARAM NOTES: CameraIndex: The camera to be animated. Note that this camera must have been created using the name: "DEFAULT_ANIMATED_CAMERA".
//	SceneIndex: The Id of the synchronised scene to attach this camera to - see CREATE_SYNCHRONIZED_SCENE
//	AnimName: The name of the animation to be played on the camera.
//	AnimDictName: The name of the animation dictionary containing the animation to be played on the camera.
//PURPOSE: Play a camera animation on the specified camera, attached to the specified synchronized scene. Note that the animation must already be loaded prior to calling this command. More info..
NATIVE FUNC BOOL PLAY_SYNCHRONIZED_CAM_ANIM(CAMERA_INDEX CameraIndex, INT SceneId, STRING AnimName, STRING AnimDictName) = "0x7b8ce3a05613f41c"

//INFO:
//PARAM NOTES: CameraIndex: The camera to be queried. Note that this camera must have been created using the name: "DEFAULT_ANIMATED_CAMERA".
//	AnimName: The name of the animation to be queried on the camera.
//	AnimDictName: The name of the animation dictionary containing the animation to be queried on the camera.
//PURPOSE: Returns TRUE if the camera is currently playing the specified animation. More info..
NATIVE FUNC BOOL IS_CAM_PLAYING_ANIM(CAMERA_INDEX CameraIndex, STRING AnimName, STRING AnimDictName) = "0x4d85bfc31f7d8d41"

//INFO:
//PARAM NOTES: CameraIndex: The camera to be queried. Note that this camera must have been created using the name: "DEFAULT_ANIMATED_CAMERA".
//	fPhase: The phase to be assigned to the active animation on the specified camera.
//PURPOSE: Sets the phase of the animation that is currently playing on the specified camera. More info..
NATIVE PROC SET_CAM_ANIM_CURRENT_PHASE(CAMERA_INDEX CameraIndex, FLOAT fPhase) = "0xa35860e818eac5b7"

//INFO:
//PARAM NOTES: CameraIndex: The camera to be queried. Note that this camera must have been created using the name: "DEFAULT_ANIMATED_CAMERA".
//PURPOSE: Returns the phase of the animation that is currently playing on the specified camera. More info..
NATIVE FUNC FLOAT GET_CAM_ANIM_CURRENT_PHASE(CAMERA_INDEX CameraIndex) = "0x7fdd65163647de8e"


//~>					 Screen Fading						 <~ 

//INFO: 
//PARAM NOTES:
//PURPOSE: Fade in the main viewport with fade FROM black. More info..
NATIVE PROC DO_SCREEN_FADE_IN(INT time) = "0x5a7acd1cdf509b0d"

//INFO:
//PARAM NOTES:
//PURPOSE: Fade OUT the main viewport with fade TO black. More info
NATIVE PROC DO_SCREEN_FADE_OUT(INT time) = "0x859006db870314c5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Has the screen faded out
NATIVE FUNC BOOL IS_SCREEN_FADED_OUT() = "0xa829c9a2767ac8ef"

//INFO: 
//PARAM NOTES:
//PURPOSE: Has the screen faded in.
NATIVE FUNC BOOL IS_SCREEN_FADED_IN() = "0xe9e8955a780dda01"

//INFO: 
//PARAM NOTES:
//PURPOSE: Is the screen fading IN ( getting clearer )
NATIVE FUNC BOOL IS_SCREEN_FADING_IN() = "0xecd40fef3cf43bdb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Is the screen fading OUT ( getting darker )
NATIVE FUNC BOOL IS_SCREEN_FADING_OUT() = "0xcb1ef1e7b77adf4c"


//~>					 WideScreen 						 <~

//INFO:  Along with this hud scrolls off etc... to give a clean screen
//PARAM NOTES: Duration: The time taken for the borders to appear 0 is instant.
//PURPOSE: Requests to display borders that make the screen look widescreen OR wider in running on a widescreen telly. More info..
NATIVE PROC SET_WIDESCREEN_BORDERS(BOOL bSet, INT Duration ) = "0x43f21fa00a1ce779"

//INFO:  set via SET_WIDESCREEN_BORDERS
//PARAM NOTES:
//PURPOSE: Are the widescreen borders still visible on the screen. More info..
NATIVE FUNC BOOL ARE_WIDESCREEN_BORDERS_ACTIVE() = "0xd0bf3d2e961ae546"

//~>					  GAME Camera 						 <~

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the gameplay camera's heading relative to the target entity (ped or vehicle.)
NATIVE FUNC FLOAT GET_GAMEPLAY_CAM_RELATIVE_HEADING() = "0x02ac46bf770385c4"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the gameplay camera's heading relative to the target entity (ped or vehicle.)
NATIVE PROC SET_GAMEPLAY_CAM_RELATIVE_HEADING(FLOAT heading = 0.0) = "0x94953c3ff0664f66"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the gameplay camera's pitch relative to the target entity (ped or vehicle.)
NATIVE FUNC FLOAT GET_GAMEPLAY_CAM_RELATIVE_PITCH() = "0xd5b0bdc980eeb92f"

//INFO:
//PARAM NOTES: pitch: The relative pitch to set, in degrees.
// smoothRate: The rate at which the relative pitch should be attained. 1.0 is instant, 0.0 is infinite.
//PURPOSE: Sets the gameplay camera's pitch relative to the target entity (ped or vehicle.)
//NOTE: This won't work for vehicles POVs, if you need to change the camera pitch and want the change 
//on vehicle's POVs as well, please use FORCE_CAMERA_RELATIVE_HEADING_AND_PITCH.
NATIVE PROC SET_GAMEPLAY_CAM_RELATIVE_PITCH(FLOAT pitch = 0.0, FLOAT smoothRate = 1.0) = "0x080c97b891e2f3aa"

//INFO:
//PARAM NOTES:
//PURPOSE: Reset the timer used to block the blending of the full attach parent transform feature (used to keep the camera aligned to the attach parent entity in things like planes).
NATIVE PROC RESET_GAMEPLAY_CAM_FULL_ATTACH_PARENT_TRANSFORM_TIMER() = "0x7295c203dd659dfe"

//INFO:
//PARAM NOTES: 
//      heading: The relative heading to set, in degrees.
//      pitch: The relative pitch to set, in degrees.
//      smoothRate: The rate at which the relative pitch should be attained. 1.0 is instant, 0.0 is infinite.
//PURPOSE: Force the gameplay and cinematic mounted camera's heading and pitch relative to the target entity (ped or vehicle).
NATIVE PROC FORCE_CAMERA_RELATIVE_HEADING_AND_PITCH(FLOAT heading = 0.0, FLOAT pitch = 0.0, FLOAT pitchSmoothRate = 1.0) = "0x3f606b4abc46c107"

//INFO:
//PARAM NOTES: 
//      heading: The relative heading to set, in degrees.
//      pitch: The relative pitch to set, in degrees.
//PURPOSE: Force the cinematic mounted bonnet camera's heading and pitch relative to the target vehicle
NATIVE PROC FORCE_BONNET_CAMERA_RELATIVE_HEADING_AND_PITCH(FLOAT heading = 0.0, FLOAT pitch = 0.0) = "0x23fc9abda1de4638"

//INFO: If the first person shooter camera is active, does the same thing as SET_GAMEPLAY_CAM_RELATIVE_HEADING.  If not active, the heading will be set when the camera is created.
//PARAM NOTES: heading: The relative heading to set, in degrees.
//PURPOSE: Sets the first person shooter camera heading.  If the camera does not exist, this heading will be used when it is created.
NATIVE PROC SET_FIRST_PERSON_SHOOTER_CAMERA_HEADING(FLOAT heading = 0.0) = "0xe9aef8b7b1101b11"

//INFO: If the first person shooter camera is active, does the same thing as SET_GAMEPLAY_CAM_RELATIVE_PITCH.  If not active, the pitch will be set when the camera is created.
//PARAM NOTES: pitch: The relative pitch to set, in degrees.
//PURPOSE: Sets the first person shooter camera pitch.  If the camera does not exist, this pitch will be used when it is created.
NATIVE PROC SET_FIRST_PERSON_SHOOTER_CAMERA_PITCH(FLOAT pitch = 0.0) = "0x4419cdfe572ac96b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Is this sphere visible in this viewport.
NATIVE FUNC BOOL IS_SPHERE_VISIBLE(VECTOR VecCoors,FLOAT radius) = "0x0318e2ee6fb4563f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the game play cams pos.
NATIVE FUNC VECTOR GET_GAMEPLAY_CAM_COORD () = "0xcb284f809b594322"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the game play cams rotation.
NATIVE FUNC VECTOR GET_GAMEPLAY_CAM_ROT (EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0x9c0ed16b4f524508"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the game play cams field of view
NATIVE FUNC FLOAT GET_GAMEPLAY_CAM_FOV () = "0x372e271fe8a97311"

//INFO: 
//PARAM NOTES: scaling: The scaling factor to be applied to the current motion blur strength, with a value of 1.0 resulting in no change.
//PURPOSE: Sets the script-controlled motion blur scaling to be applied within the active gameplay camera this update (only.) Note that this command must be called every update that scaling is required, as this parameter automatically resets for safety.
NATIVE PROC SET_GAMEPLAY_CAM_MOTION_BLUR_SCALING_THIS_UPDATE(FLOAT scaling) = "0xe776d70a603c3c81"

//INFO: 
//PARAM NOTES: maxStrength: The maximum motion blur strength to be applied. This value is clamped to the valid range of 0.0 to 1.0 in code.
//PURPOSE: Sets the script-controlled maximum motion blur strength to be applied within the active gameplay camera this update (only.) Note that this command must be called every update that limiting is required, as this parameter automatically resets for safety.
NATIVE PROC SET_GAMEPLAY_CAM_MAX_MOTION_BLUR_STRENGTH_THIS_UPDATE(FLOAT maxStrength) = "0x97e56574a6aa6c7d"

//INFO:
//PARAM NOTES: isFirstPersonThisFrame: If TRUE, scripted cameras are considered first person this frame
//PURPOSE: Flag whether if the dominant camera is a scripted camera, it should be considered first person for this frame.
NATIVE PROC SET_SCRIPTED_CAMERA_IS_FIRST_PERSON_THIS_FRAME(BOOL isFirstPersonThisFrame = TRUE) = "0x4b6a8fc4666f4a3b"

//INFO:
//PARAM NOTES: Valid shake names are as follows:
//	"SMALL_EXPLOSION_SHAKE"
//	"MEDIUM_EXPLOSION_SHAKE"
//	"LARGE_EXPLOSION_SHAKE"
//	"HAND_SHAKE"
//	"JOLT_SHAKE"
//	"VIBRATE_SHAKE"
//	"WOBBLY_SHAKE"
//	"DRUNK_SHAKE"
//	fAmplitudeScalar: Can be used to increase or decrease the amplitude of the shake effect.
//PURPOSE: Apply a predefined shake to the gameplay camera.
NATIVE PROC SHAKE_GAMEPLAY_CAM(STRING ShakeName, FLOAT fAmplitudeScalar = 1.0) = "0x87ca6430083e790d"

//INFO:
//PARAM NOTES:
//PURPOSE: Is the gameplay camera currently shaking?
NATIVE FUNC BOOL IS_GAMEPLAY_CAM_SHAKING() = "0xf8f3d410542c80db"

//INFO:
//PARAM NOTES: fAmplitudeScalar: Can be used to increase or decrease the amplitude of the shake effect.
//PURPOSE: Sets the overall amplitude scaling for an active gameplay camera shake.
NATIVE PROC SET_GAMEPLAY_CAM_SHAKE_AMPLITUDE(FLOAT fAmplitudeScalar = 1.0) = "0x0ed8565383e33da1"

//INFO:
//PARAM NOTES: bStopImmediately: If TRUE, the shake will stop immediately, otherwise it will enter its release phase and fade out.
//PURPOSE: Stop the gameplay camera shaking.
NATIVE PROC STOP_GAMEPLAY_CAM_SHAKING(BOOL bStopImmediately = FALSE) = "0x84cf415aeab83b93"

//INFO: 
//PARAM NOTES: PedIndex: The index of the ped to be followed.
//PURPOSE: Sets a custom ped to be followed/attached-to by the active gameplay camera this update (only.) Note that this command must be called every update that a custom follow ped is required, as this parameter automatically resets for safety.
NATIVE PROC SET_GAMEPLAY_CAM_FOLLOW_PED_THIS_UPDATE(PED_INDEX PedIndex) = "0xb50594b7e6670f73"

//INFO: This command will return true if the gameplay director is the dominant rendering director. The gameplay director is responsible for the follow and aim cameras.
//PARAM NOTES:
//PURPOSE: Is the gameplay director currently rendering? More info.
NATIVE FUNC BOOL IS_GAMEPLAY_CAM_RENDERING() = "0x66def7450747437a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the ambient ped & vehicle population spawning origin to be based around the active scripted camera for this frame
//         This will prevent vehicles from being created close to the camera and/or on-screen
//         Call this repeatedly during scripted camera sequences where this behaviour is required.
//         
NATIVE PROC USE_SCRIPT_CAM_FOR_AMBIENT_POPULATION_ORIGIN_THIS_FRAME(BOOL bVehicles, BOOL bPeds) = "0xa26c67a816927cc7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Persistently controls whether or not the gameplay camera field of view will be scaled at high altitudes.
NATIVE PROC SET_GAMEPLAY_CAM_ALTITUDE_FOV_SCALING_STATE(BOOL State) = "0x3d1809e67cb9f79c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Disables the scaling of gameplay camera field of view at high altitudes this update (only.) This setting automatically resets for safety.
NATIVE PROC DISABLE_GAMEPLAY_CAM_ALTITUDE_FOV_SCALING_THIS_UPDATE() = "0x129dd42d09aac47e"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if the active gameplay camera is looking behind.
NATIVE FUNC BOOL IS_GAMEPLAY_CAM_LOOKING_BEHIND() = "0x594cc97203485127"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the gameplay camera to ignore collision for an entity this update.  
NATIVE PROC SET_GAMEPLAY_CAM_IGNORE_ENTITY_COLLISION_THIS_UPDATE(ENTITY_INDEX Index) = "0xa457f1126998c0ba"

//INFO: This will allow the camera to clip into the object.
//PARAM NOTES:
//PURPOSE: Permanently disables the camera collision for an object. 
NATIVE PROC DISABLE_CAM_COLLISION_FOR_OBJECT(OBJECT_INDEX object) = "0x31380d810d48740a"

//INFO: Disable the camera collision buoyancy test for one frame
NATIVE PROC BYPASS_CAMERA_COLLISION_BUOYANCY_TEST_THIS_UPDATE() = "0x84b840750bfb7a66"

//INFO:
//PARAM NOTES:
//PURPOSE: The gameplay camera will prevent the adaptive depth of field focus distance from going beyond the bounding sphere of this entity, so long as the camera (the centre of the frame) is pointing at it, on this update (only.) This setting automatically resets for safety.
NATIVE PROC SET_GAMEPLAY_CAM_ENTITY_TO_LIMIT_FOCUS_OVER_BOUNDING_SPHERE_THIS_UPDATE(ENTITY_INDEX Index) = "0x2d17c0f0a5e54afe"

//INFO:
//PARAM NOTES:
//PURPOSE: Disable the first person camera water clipping test for this update
NATIVE PROC DISABLE_FIRST_PERSON_CAMERA_WATER_CLIPPING_TEST_THIS_UPDATE() = "0xd15ac77625fb5d5a"

//~>					 FOLLOW Camera 							<~

//INFO: 
//PARAM NOTES:
//PURPOSE: Forces the active follow camera to ignore the movement of the attach parent when computing the follow orientation this update. (only) The follow camera will then rotate based upon control input only, similar to an aim camera. This setting automatically resets for safety.
NATIVE PROC SET_FOLLOW_CAM_IGNORE_ATTACH_PARENT_MOVEMENT_THIS_UPDATE() = "0x328ba0168a94602f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Forces the active third person camera using the specified heading limits for this update. (only)
NATIVE PROC SET_THIRD_PERSON_CAM_RELATIVE_HEADING_LIMITS_THIS_UPDATE(FLOAT minRelativeHeading, FLOAT maxRelativeHeading) = "0xab5ee05015513abe"

//INFO: 
//PARAM NOTES:
//PURPOSE: Forces the active third person camera using the specified pitch limits for this update. (only)
NATIVE PROC SET_THIRD_PERSON_CAM_RELATIVE_PITCH_LIMITS_THIS_UPDATE(FLOAT minRelativePitch, FLOAT maxRelativePitch) = "0x0e2d809fe9af80ae"

//INFO: 
//PARAM NOTES:
//PURPOSE: Forces the active third person camera using the specified distance limits for this update. (only)
NATIVE PROC SET_THIRD_PERSON_CAM_ORBIT_DISTANCE_LIMITS_THIS_UPDATE(FLOAT minDistance, FLOAT maxDistance) = "0x940fc4e949dd00d0"

//~>					 FOLLOW PED Camera 						 <~

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if a follow-ped camera is active.
NATIVE FUNC BOOL IS_FOLLOW_PED_CAM_ACTIVE() = "0x72b75b6d474267d5"

//INFO: Can be safely called at any time, but will only have a visible effect when a follow-ped gameplay camera is rendering.
//PARAM NOTES: CameraName: The name of the custom camera to be used. This command will assert and return FALSE if this name is not valid.
// InterpolationDuration: The duration of the interpolation in and out of the custom camera, so long as it is blending to/from a follow-ped camera. Standard interpolation behaviour applies for other camera transitions.
//PURPOSE: Overrides the follow-ped camera on this update only. Returns TRUE if successful. More info.
NATIVE FUNC BOOL SET_FOLLOW_PED_CAM_THIS_UPDATE(STRING CameraName, INT InterpolationDuration = DEFAULT_PED_CAM_INTERP_TIME) = "0x8753a341a596975f"

//INFO: Deprecated! Please now use GET_FOLLOW_PED_CAM_VIEW_MODE
//PARAM NOTES:
//PURPOSE: Gets the global zoom level used by all follow-ped cameras
NATIVE FUNC PED_ZOOM_LEVEL GET_FOLLOW_PED_CAM_ZOOM_LEVEL() = "0x64d620290bf268a3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the global view mode used by all follow-ped cameras.
NATIVE FUNC CAM_VIEW_MODE GET_FOLLOW_PED_CAM_VIEW_MODE() = "0x2b1d7439c26d5642"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the global view mode used by all follow-ped cameras. Please note that the first-person and cinematic view modes are presently not supported by the follow-ped cameras.
NATIVE PROC SET_FOLLOW_PED_CAM_VIEW_MODE(CAM_VIEW_MODE ViewMode) = "0xc9c7ccc4f117b115"

//INFO: 
//PARAM NOTES:
//PURPOSE: Forces follow ped camera to use ladder alignment code for next update.
//         Call this repeatedly during scripted sequences where this behaviour is required.
//         
NATIVE PROC SET_FOLLOW_PED_CAM_LADDER_ALIGN_THIS_UPDATE() = "0x5076c4358fbdaac7"


//~>					 FOLLOW VEHICLE Camera 						 <~

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if a follow-vehicle camera is active.
NATIVE FUNC BOOL IS_FOLLOW_VEHICLE_CAM_ACTIVE() = "0xfe62696f731c151b"

//INFO: Can be safely called at any time, but will only have a visible effect when a follow-vehicle gameplay camera is rendering.
//PARAM NOTES: CameraName: The name of the custom camera to be used. This command will assert and return FALSE if this name is not valid.
// InterpolationDuration: The duration of the interpolation in and out of the custom camera, so long as it is blending to/from a follow-vehicle camera. Standard interpolation behaviour applies for vehicle entry/exit and drive-by aiming.
//PURPOSE: Overrides the follow-vehicle camera on this update only. Returns TRUE if successful. More info.
NATIVE FUNC BOOL SET_FOLLOW_VEHICLE_CAM_THIS_UPDATE(STRING CameraName, INT InterpolationDuration = DEFAULT_VEHICLE_CAM_INTERP_TIME) = "0x79ee85ac07304324"

//INFO: 
//PARAM NOTES:
//PURPOSE: Overrides the state of the high-angle mode for the active follow vehicle camera for this update only.
NATIVE PROC SET_FOLLOW_VEHICLE_CAM_HIGH_ANGLE_MODE_THIS_UPDATE(BOOL State) = "0xd299feeb1b4dedc6"

//INFO: Set to false before the script terminates else this will be on permenantly. 
//PARAM NOTES: Mode: HighMode == True , LowMode == False. 
//PURPOSE: Overrides the state of the high-angle mode for the active follow vehicle camera for every update.
NATIVE PROC SET_FOLLOW_VEHICLE_CAM_HIGH_ANGLE_MODE_EVERY_UPDATE(BOOL ShouldOverride, BOOL Mode) = "0x43b6850b58d1022c"

ENUM TABLE_GAMES_CAMERA_TYPE
    TABLE_GAMES_CAMERA_TYPE_BLACK_JACK = HASH("CASINO_BLACKJACK_CAMERA"),
    TABLE_GAMES_CAMERA_TYPE_LUCKY_WHEEL = HASH("CASINO_LUCKY_WHEEL_CAMERA"),
    TABLE_GAMES_CAMERA_TYPE_SLOT_MACHINE = HASH("CASINO_SLOT_MACHINE_CAMERA"),
    TABLE_GAMES_CAMERA_TYPE_ROULETTE = HASH("CASINO_ROULETTE_CAMERA"),
    TABLE_GAMES_CAMERA_TYPE_POKER = HASH("CASINO_POKER_CAMERA"),
    TABLE_GAMES_CAMERA_TYPE_INSIDE_TRACK = HASH("CASINO_INSIDE_TRACK_CAMERA"),
    TABLE_GAMES_CAMERA_TYPE_LOVE_PROFESSOR_P1 = HASH("ARCADE_LOVE_PROFESSOR_P1_CAMERA"),
    TABLE_GAMES_CAMERA_TYPE_LOVE_PROFESSOR_P2 = HASH("ARCADE_LOVE_PROFESSOR_P2_CAMERA")
ENDENUM

//INFO:
//PARAM NOTES: cameraType: The of the custom table games camera to be used.
//PURPOSE: Overrides the third person camera to be a Table Games Camera on this update only. Returns TRUE if successful.
NATIVE FUNC BOOL SET_TABLE_GAMES_CAMERA_THIS_UPDATE(TABLE_GAMES_CAMERA_TYPE cameraType) = "0x01727103dd974710"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if a table games camera is active.
NATIVE FUNC BOOL IS_TABLE_GAMES_CAMERA_ACTIVE() = "0x23a755c9532e976a"

//INFO: Deprecated! Please now use GET_FOLLOW_VEHICLE_CAM_VIEW_MODE
//PARAM NOTES:
//PURPOSE: Gets the global zoom level used by all follow-vehicle and vehicle-aim cameras.
NATIVE FUNC VEHICLE_ZOOM_LEVEL GET_FOLLOW_VEHICLE_CAM_ZOOM_LEVEL() = "0x964cd83935ad0ed1"

//INFO: Deprecated! Please now use SET_FOLLOW_VEHICLE_CAM_VIEW_MODE
//PARAM NOTES:
//PURPOSE: Sets the global zoom level used by all follow-vehicle and vehicle-aim cameras.
NATIVE PROC  SET_FOLLOW_VEHICLE_CAM_ZOOM_LEVEL(VEHICLE_ZOOM_LEVEL ZoomLevel) = "0x842b2a274564caf5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the view mode used by the follow-vehicle and vehicle-aim cameras associated with classes of vehicles that are not handled specially, such as cars. Use GET_CAM_VIEW_MODE_FOR_CONTEXT to query the view mode applied for other classes of vehicle.
NATIVE FUNC CAM_VIEW_MODE GET_FOLLOW_VEHICLE_CAM_VIEW_MODE() = "0x5e29b0cf10cecb34"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the view mode used by the follow-vehicle and vehicle-aim cameras associated with classes of vehicles that are not handled specially, such as cars. Use SET_CAM_VIEW_MODE_FOR_CONTEXT to set the view mode applied for other classes of vehicle.
NATIVE PROC SET_FOLLOW_VEHICLE_CAM_VIEW_MODE(CAM_VIEW_MODE ViewMode) = "0xed74a3aa53be3520"

//INFO: 
//PARAM NOTES: Context: The view mode context to be queried. See CAM_VIEW_MODE_CONTEXT enumeration.
//PURPOSE: Gets the camera view mode for the specified context.
NATIVE FUNC CAM_VIEW_MODE GET_CAM_VIEW_MODE_FOR_CONTEXT(CAM_VIEW_MODE_CONTEXT Context) = "0x4de6a646afb7cf5c"

//INFO: 
//PARAM NOTES: Context: The view mode context to be configured. See CAM_VIEW_MODE_CONTEXT enumeration.
// ViewMode: The view mode to be applied. See CAM_VIEW_MODE enumeration.
//PURPOSE: Sets the camera view mode for the specified context.
NATIVE PROC SET_CAM_VIEW_MODE_FOR_CONTEXT(CAM_VIEW_MODE_CONTEXT Context, CAM_VIEW_MODE ViewMode) = "0x4b1c22133022d7d3"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Returns the view mode context for the active gameplay camera. This may then be used with commands such as GET_CAM_VIEW_MODE_FOR_CONTEXT and SET_CAM_VIEW_MODE_FOR_CONTEXT. See CAM_VIEW_MODE_CONTEXT enumeration.
NATIVE FUNC CAM_VIEW_MODE_CONTEXT GET_CAM_ACTIVE_VIEW_MODE_CONTEXT() = "0x47e529da87615548"

//INFO:
//PARAM NOTES:
//PURPOSE: Override a group of settings for the vehicle camera to avoid confusing cameras during certain stunts (inside pipes etc)
NATIVE PROC USE_VEHICLE_CAM_STUNT_SETTINGS_THIS_UPDATE() = "0x016cdcb99a127243"

//INFO:
//PARAM NOTES:
// stuntCamera: the camera name to use (normally you want to use FOLLOW_VEHICLE_STUNT_CAMERA)
//PURPOSE: Similar to USE_VEHICLE_CAM_STUNT_SETTINGS_THIS_UPDATE, but instead it uses a dedicated camera and not a group of settings. The system will still try to detect if the stunt camera is needed based by the vehicle orientation.
NATIVE PROC USE_DEDICATED_STUNT_CAMERA_THIS_UPDATE(STRING stuntCamera) = "0xa9fc4ab61148c611"

//INFO:
//PARAM NOTES:
//PURPOSE: Force a group of settings for the vehicle camera to avoid confusing cameras during certain stunts. Similar to the USE_VEHICLE_CAM_STUNT_SETTINGS_THIS_UPDATE() but is activating the stunt cameras always without trying to detect if a stunt is in place.
NATIVE PROC FORCE_VEHICLE_CAM_STUNT_SETTINGS_THIS_UPDATE() = "0x0394892bda1f1eda"

//INFO:
//PARAM NOTES:
//    seatIndex: the index of the seat to force
//PURPOSE: Override the gameplay camera seat detection for this update. Useful when we want to switch between a turret and non-turret vehicle camera. 
NATIVE PROC SET_FOLLOW_VEHICLE_CAM_SEAT_THIS_UPDATE(INT seatIndex) = "0x65498c8065adcc5d"

//~>					 AIM Camera 						<~

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if an aim camera is active.
NATIVE FUNC BOOL IS_AIM_CAM_ACTIVE() = "0x2358ae4c940cf1df"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if an aim camera is active and in accurate (zoom) mode. Accurate mode, which is toggled using R3, uses a narrower field of view and is available for select non-scoped weapons.
NATIVE FUNC BOOL IS_AIM_CAM_ACTIVE_IN_ACCURATE_MODE() = "0x19abd41af27cd2a7"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if a first-person aim camera is active.
NATIVE FUNC BOOL IS_FIRST_PERSON_AIM_CAM_ACTIVE() = "0x28ff2c2261b6cba1"

//INFO: Note that a third-person aim camera will generally blend back to a follow camera, whereas a first-person aim camera will cut.
//PARAM NOTES:
//PURPOSE: Disables all aim cameras for this update only. More info...
NATIVE PROC DISABLE_AIM_CAM_THIS_UPDATE() = "0x7c6105654788a17b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Please note that this view mode is now disabled in favour of the standard on-foot view mode, so this command returns a value that has no real meaning at present.
NATIVE FUNC CAM_VIEW_MODE GET_PED_AIM_CAM_VIEW_MODE() = "0x1df54e09bd6ce2f0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Please note that this view mode is now disabled in favour of the standard on-foot view mode, so this command has no meaningful effect at present.
NATIVE PROC SET_PED_AIM_CAM_VIEW_MODE(CAM_VIEW_MODE ViewMode) = "0x3a08e7e6adf155d2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the first-person aim zoom factor associated with equipped scoped weapon, or the mobile phone camera, if active.
NATIVE FUNC FLOAT GET_FIRST_PERSON_AIM_CAM_ZOOM_FACTOR() = "0x8e277ef62b1e0bdf"

//INFO: Please note that the specified zoom factor will be clamped to between 1.0 and the maximum zoom factor supported by the specific weapon/camera.
// The zoom factor will also automatically reset to 1.0 if the follow ped's equipped weapon changes or the mobile phone camera toggles on or off.
//PARAM NOTES:
//PURPOSE: Sets the first-person aim zoom factor associated with equipped scoped weapon, or the mobile phone camera, if active. More info...
NATIVE PROC SET_FIRST_PERSON_AIM_CAM_ZOOM_FACTOR(FLOAT ZoomFactor) = "0xec426a0c147ec075"

//INFO: Please note that the specified zoom factor limits will be clamped to between 1.0 and the maximum zoom factor supported by the specific weapon/camera.
//PARAM NOTES:
//PURPOSE: Sets the minimum and maximum zoom factor that can be applied for the active first-person aim camera for this update only. More info...
NATIVE PROC SET_FIRST_PERSON_AIM_CAM_ZOOM_FACTOR_LIMITS_THIS_UPDATE(FLOAT MinZoomFactor, FLOAT MaxZoomFactor) = "0x369ee77cbbd732b2"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the minimum and maximum relative heading (in Degrees) to be applied to the active first-person aim camera for this update only.
NATIVE PROC SET_FIRST_PERSON_AIM_CAM_RELATIVE_HEADING_LIMITS_THIS_UPDATE(FLOAT MinRelativeHeading, FLOAT MaxRelativeHeading) = "0xd9a8ad65089229ce"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the minimum and maximum relative pitch (in Degrees) to be applied to the active first-person aim camera for this update only.
NATIVE PROC SET_FIRST_PERSON_AIM_CAM_RELATIVE_PITCH_LIMITS_THIS_UPDATE(FLOAT MinRelativePitch, FLOAT MaxRelativePitch) = "0x57ed17672f68f6fa"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the near clip for the first person camera for this update only.
NATIVE PROC SET_FIRST_PERSON_AIM_CAM_NEAR_CLIP_THIS_UPDATE(FLOAT NearClip) = "0x5ded85df2208b943"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the near clip for the third person aim camera for this update only.
NATIVE PROC SET_THIRD_PERSON_AIM_CAM_NEAR_CLIP_THIS_UPDATE(FLOAT NearClip) = "0xd195f5a86bfb85d4"

//INFO:
//PARAM NOTES:
//PURPOSE: Allows a custom vehicle drive-by camera, as specified in the vehicle layout metadata, to be used when aiming in a vehicle for this update only.
NATIVE PROC SET_ALLOW_CUSTOM_VEHICLE_DRIVE_BY_CAM_THIS_UPDATE(BOOL State) = "0x0e83878033f3e16a"

//INFO:
//PARAM NOTES:
//PURPOSE: Force the third person camera to use the custom tight space framing, overriding the metadata setting.
//REMARKS: Only use this in confined situation wehere we are absolutely positive about the tight space framing of the rendered camera.
NATIVE PROC FORCE_TIGHTSPACE_CUSTOM_FRAMING_THIS_UPDATE() = "0xf41864db1cf85307"


//~>					  HINT Camera						 <~

//INFO: 
//PARAM NOTES: iDwellTime = how long cam looks at the entity.
// iInterpTo: How long the interp to the hint is
// iInterpFrom: How long the interp is from the iterp.
//PURPOSE: Sets the gameplay to hint a coord.
NATIVE PROC SET_GAMEPLAY_COORD_HINT (VECTOR vCoord, INT iDwellTime = DEFAULT_DWELL_TIME, INT iInterpTo = DEFAULT_INTERP_IN_TIME, INT iInterpFrom = DEFAULT_INTERP_OUT_TIME, HINT_TYPE Type = HINTTYPE_DEFAULT) = "0xdbfee73a55300843"

//INFO: 
//PARAM NOTES: iDwellTime = how long cam looks at the entity.
// iInterpTo: How long the interp to the hint is
// iInterpFrom: How long the interp is from the iterp.
// offset: the offset from the entity
// RelativeOffset : The offset is relative to the entity.
//PURPOSE: Sets the gameplay to hint a coord.
NATIVE PROC SET_GAMEPLAY_ENTITY_HINT(ENTITY_INDEX  Enttity, VECTOR Offset, BOOL RelativeOffset = TRUE, INT iDwellTime = DEFAULT_DWELL_TIME, INT iInterpTo = DEFAULT_INTERP_IN_TIME, INT iInterpFrom = DEFAULT_INTERP_OUT_TIME,  HINT_TYPE Type = HINTTYPE_DEFAULT) = "0x56593357686570f4"


//INFO: 
//PARAM NOTES: iDwellTime = how long cam looks at the entity.
// iInterpTo: How long the interp to the hint is
// iInterpFrom: How long the interp is from the iterp.
// offset: the offset from the entity
// RelativeOffset : The offset is relative to the entity.
//PURPOSE: Sets the gameplay to hint a coord.
NATIVE PROC SET_GAMEPLAY_PED_HINT (PED_INDEX Ped, VECTOR Offset, BOOL RelativeOffset = TRUE, INT iDwellTime = DEFAULT_DWELL_TIME, INT iInterpTo = DEFAULT_INTERP_IN_TIME, INT iInterpFrom = DEFAULT_INTERP_OUT_TIME) = "0xda6126f0297ba5e8"

//INFO: 
//PARAM NOTES: iDwellTime = how long cam looks at the entity.
// iInterpTo: How long the interp to the hint is
// iInterpFrom: How long the interp is from the iterp.
// offset: the offset from the entity
// RelativeOffset : The offset is relative to the entity.
//PURPOSE: Sets the gameplay to hint a coord.
NATIVE PROC SET_GAMEPLAY_OBJECT_HINT (OBJECT_INDEX Obejct, VECTOR Offset, BOOL RelativeOffset = TRUE, INT iDwellTime = DEFAULT_DWELL_TIME, INT iInterpTo = DEFAULT_INTERP_IN_TIME, INT iInterpFrom = DEFAULT_INTERP_OUT_TIME) = "0xb065566f582943d1"

//INFO: 
//PARAM NOTES: iDwellTime = how long cam looks at the entity.
// iInterpTo: How long the interp to the hint is
// iInterpFrom: How long the interp is from the iterp.
// offset: the offset from the entity
// RelativeOffset : The offset is relative to the entity.
//PURPOSE: Sets the gameplay to hint a coord.
NATIVE PROC SET_GAMEPLAY_VEHICLE_HINT  (VEHICLE_INDEX Vehicle, VECTOR Offset, BOOL RelativeOffset = TRUE, INT iDwellTime = DEFAULT_DWELL_TIME, INT iInterpTo = DEFAULT_INTERP_IN_TIME, INT iInterpFrom = DEFAULT_INTERP_OUT_TIME) = "0x7c6d4fd402f1d4f9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if a hint is running.
NATIVE FUNC BOOL IS_GAMEPLAY_HINT_ACTIVE() = "0x4131052989de1278"

//INFO: Call at the start of the hint to avoid pops
//PARAM NOTES: Valid between 1.0f and 130.0f
//PURPOSE: Sets the field of view (fov) value in degrees
NATIVE PROC SET_GAMEPLAY_HINT_FOV(FLOAT fov) = "0xc9b7a3b3228edc18"

//INFO: Call at the start of the hint to avoid pops.
//
//PARAM NOTES:
//PURPOSE: Scales the cameras orbit distance between the camera and its attach entity. 
NATIVE PROC SET_GAMEPLAY_HINT_FOLLOW_DISTANCE_SCALAR(float DistanceScalar) = "0xffd7feec98321a66"

//INFO: Call at the start of the hint to avoid pops.
//PARAM NOTES:
//PURPOSE: Adjust the pitch of camera relative to its attach parent.
NATIVE PROC SET_GAMEPLAY_HINT_BASE_ORBIT_PITCH_OFFSET(float BasePitchOffset) = "0xc3940c122330f4aa"

//INFO: Call at the start of the hint to avoid pops.
//PARAM NOTES:
//PURPOSE: Sets an side offset relative attach parent in metres. 
NATIVE PROC SET_GAMEPLAY_HINT_CAMERA_RELATIVE_SIDE_OFFSET(float SideOffset) = "0xc5fb663c1ce53c57"

//INFO: Call at the start of the hint to avoid pops.
//This will cause the camera to pull back to frame the player correctly, 
//May need to use in conjunction with the SET_GAMEPLAY_HINT_FOLLOW_DISTANCE_SCALAR
//PARAM NOTES:
//PURPOSE: Sets an vertical offset relative attach parent in metres. 
NATIVE PROC SET_GAMEPLAY_HINT_CAMERA_RELATIVE_VERTICAL_OFFSET(float VerticalOffset) = "0xf2938a28c15db464"

//INFO: Call at the start of the hint to avoid pops.
//PARAM NOTES:
//PURPOSE: Allows an active follow-ped camera to be blended into the medium third-person view mode based upon the hint blend level, which should ensure consistent hint framing.
NATIVE PROC SET_GAMEPLAY_HINT_CAMERA_BLEND_TO_FOLLOW_PED_MEDIUM_VIEW_MODE(BOOL State) = "0xcb772e2a88f6a27f"

//INFO: 
//PARAM NOTES:
//PURPOSE: TO BE DEPRECATED
NATIVE PROC SET_GAMEPLAY_HINT_RELATIVE_PITCH(FLOAT RelativePitch = 0.0, FLOAT SmoothRate = DEFAULT_HINT_RELATIVE_PITCH_SMOOTH_RATE) = "0x74c6600da8d135e3"

//INFO: 
//PARAM NOTES: bStopImmediately: If TRUE, the hint camera will stop immediately, otherwise it will enter its release phase.
//PURPOSE: Stops the hint cam running except if its a code gameplay hint.
NATIVE PROC STOP_GAMEPLAY_HINT(BOOL bStopImmediately = FALSE) = "0xbd1e8007d7dfa747"

//INFO:
//PARAM NOTES:
//PURPOSE: This is deprecated and will no longer modify the behaviour of the hint, which is no longer interrupted by right stick input by default.
NATIVE PROC STOP_GAMEPLAY_HINT_BEING_CANCELLED_THIS_UPDATE(BOOL CANCEL) = "0x457826ed772c86a4"

//INFO:
//PARAM NOTES:
//PURPOSE: Stops any active code gameplay hint. 
NATIVE PROC STOP_CODE_GAMEPLAY_HINT(bool StopImmediately) = "0x408cf406c7d78d6f"

//INFO:A code gameplay hint is a hint activated by code, hints are based on a first come, fist served basis. 
//PARAM NOTES:
//PURPOSE: Check that a code game play is active. 
NATIVE FUNC BOOL IS_CODE_GAMEPLAY_HINT_ACTIVE() = "0x3f520e7ecf3381a3"

//INFO: To get the camera to interpolate between the follow ped and follow vehicle cameras the intermediate states have to be called.
// e.g. from ped to vehicle  CAM_OUTSIDE_VEHICLE - CAM_ENTERING_VEHICLE - CAM_INSIDE_VEHICLE
//	from vehicle to ped CAM_INSIDE_VEHICLE - CAM_EXITING_VEHICLE - CAM_OUTSIDE_VEHICLE
//	CAM_ENTERING_VEHICLE	//Gameplay camera in interpolating to the follow vehicle camera
//	CAM_INSIDE_VEHICLE		//Gampeplay camera is running the follow vehilce camera
//	CAM_EXITING_VEHICLE		//Gameplay camera is interpolating from the follow vehicle camera to the follow ped camera
//	CAM_OUTSIDE_VEHICLE		//Gameplay camera is fully running the follow ped camera, dont need to specify a valid vehicle index here.
//PARAM NOTES: VEHICLE_INDEX Vehicle - Doesn't need to be valid for the CAM_OUTSIDE_VEHICLE state.
//PURPOSE: Sets the camera exit/enter state for vehicles which defines if the follow vehicle or follow ped camera runs.
NATIVE PROC SET_IN_VEHICLE_CAM_STATE_THIS_UPDATE(VEHICLE_INDEX Vehicle, CAM_IN_VEHICLE_STATE InVehicleState) = "0xc605c03d36b56591"

//INFO: Does not affect any other camera mode, so safe to call even when not in first person view.
//PARAM NOTES:
//PURPOSE: Disable on foot first person view, must be called every update.
NATIVE PROC DISABLE_ON_FOOT_FIRST_PERSON_VIEW_THIS_UPDATE() = "0xa84144d1edbb6d54"

//INFO:
//PARAM NOTES:
//PURPOSE: Disables flash effects from first person transitions, must be called every update.
NATIVE PROC DISABLE_FIRST_PERSON_FLASH_EFFECT_THIS_UPDATE() = "0x1109811fc4df0865"

//INFO:
//PARAM NOTES:
//PURPOSE: Force the after aiming blend on for third person camera (mainly for follow ped camera), must be called every update.
NATIVE PROC FORCE_THIRD_PERSON_AFTER_AIMING_BLEND_THIS_UPDATE() = "0x1a37fd458784ae4c"

//INFO:
//PARAM NOTES:
//PURPOSE: Disable the after aiming blend for third person camera (mainly for follow ped camera), must be called every update.
NATIVE PROC DISABLE_THIRD_PERSON_AFTER_AIMING_BLEND_THIS_UPDATE() = "0x4c356901bdb72d7c"

//INFO:
//PURPOSE: Special case native to disable the reorient of the first person camera when we switch to another view (scripted camera) and the controls are disabled. This will be useful for example for table games in the casino.
NATIVE PROC BLOCK_FIRST_PERSON_ORIENTATION_RESET_THIS_UPDATE() = "0x39469160703c61ae"


//~>					 CINEMATIC Cameras 						 <~

//INFO: 
//PARAM NOTES:
//PURPOSE: Script can disable/enable the cinematic button
NATIVE PROC SET_CINEMATIC_BUTTON_ACTIVE(BOOL bEnable) = "0xe4fa4fbf0bafd2a8"

//INFO: This command will return true if the cinematic director is the dominant rendering director. The cinematic director is responsible for a variety of cinematic cameras, including the idle cameras.
//PARAM NOTES:
//PURPOSE: Is the cinematic director currently rendering? More info.
NATIVE FUNC BOOL IS_CINEMATIC_CAM_RENDERING() = "0x0085e4be8fd73703"

//INFO:
//PARAM NOTES: Valid shake names are as follows:
//	"SMALL_EXPLOSION_SHAKE"
//	"MEDIUM_EXPLOSION_SHAKE"
//	"LARGE_EXPLOSION_SHAKE"
//	"HAND_SHAKE"
//	"JOLT_SHAKE"
//	"VIBRATE_SHAKE"
//	"WOBBLY_SHAKE"
//	"DRUNK_SHAKE"
//	fAmplitudeScalar: Can be used to increase or decrease the amplitude of the shake effect.
//PURPOSE: Apply a predefined shake to the rendered result of the active cinematic camera.
NATIVE PROC SHAKE_CINEMATIC_CAM(STRING ShakeName, FLOAT fAmplitudeScalar = 1.0) = "0x3b58be9e133fd48d"

//INFO:
//PARAM NOTES:
//PURPOSE: Is a cinematic camera shake active?
NATIVE FUNC BOOL IS_CINEMATIC_CAM_SHAKING() = "0xbee2f63c2da77f95"

//INFO:
//PARAM NOTES: fAmplitudeScalar: Can be used to increase or decrease the amplitude of the shake effect.
//PURPOSE: Sets the overall amplitude scaling for a cinematic camera shake.
NATIVE PROC SET_CINEMATIC_CAM_SHAKE_AMPLITUDE(FLOAT fAmplitudeScalar = 1.0) = "0x86a2751c5f3af8f8"

//INFO:
//PARAM NOTES: bStopImmediately: If TRUE, the shake will stop immediately, otherwise it will enter its release phase and fade out.
//PURPOSE: Stop the active cinematic camera shake.
NATIVE PROC STOP_CINEMATIC_CAM_SHAKING(BOOL bStopImmediately = FALSE) = "0xc3d04b421e077910"

//INFO: 
//PARAM NOTES:
//PURPOSE: Disables the cinematic first-person vehicle bonnet camera for this update only.
NATIVE PROC DISABLE_CINEMATIC_BONNET_CAMERA_THIS_UPDATE() = "0x5ad47d8cfc3a86af"

//INFO: 
//PARAM NOTES:
//PURPOSE: Disables the cinematic vehicle idle mode for this update only.
NATIVE PROC DISABLE_CINEMATIC_VEHICLE_IDLE_MODE_THIS_UPDATE() = "0x7936e7a8dbe3dbbe"

//INFO: 
//PARAM NOTES:
//PURPOSE: Invalidates the cinematic vehicle idle mode, restarting the associated idle counter.
NATIVE PROC INVALIDATE_CINEMATIC_VEHICLE_IDLE_MODE() = "0xb06c15f6118b032d"

//INFO:
//PARAM NOTES:
//PURPOSE: Invalidates the cinematic idle camera, restarting the associated idle counter.
NATIVE PROC INVALIDATE_IDLE_CAM() = "0x62ea3913642edf8e"

//INFO:
//PARAM NOTES:
//PURPOSE: Check that the cinemtatic idle camera is rendering. 
NATIVE FUNC BOOL IS_CINEMATIC_IDLE_CAM_RENDERING() = "0x20192bf9e3bb2549"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns TRUE if a cinematic first-person vehicle interior camera is rendering. 
NATIVE FUNC BOOL IS_CINEMATIC_FIRST_PERSON_VEHICLE_INTERIOR_CAM_RENDERING() = "0x94398b6170dca18c"

//INFO:SHOT_TYPE - Taken from the list of defined shots
// Duration of the shot in mili seconds after whch the shot will terminate
// Attach and look at entities: Depending on the shot you either provide one or two. If incorrectly applied the shot will just not trigger.
// This command is bound to a specific script so you cannot create one if another script already has
//The shots will terminate if rendering and the script terminates
//PARAM NOTES:
//PURPOSE: Create a cinematic shot to be used by script. More info.
NATIVE PROC CREATE_CINEMATIC_SHOT(SHOT_TYPE Shot, int DurationInMilliseconds, ENTITY_INDEX AttachEntity, ENTITY_INDEX LookAtEntity) = "0x9b30483daa48199b"

//INFO:
//PARAM NOTES:
//PURPOSE: Check that cinematic shot is active, will return a valid result a frame after creating the shot.
NATIVE FUNC BOOL IS_CINEMATIC_SHOT_ACTIVE(SHOT_TYPE Shot) = "0x99636b3721921a29"

//INFO:
//PARAM NOTES:
//PURPOSE: Stops and deletes the current shot
NATIVE PROC STOP_CINEMATIC_SHOT(SHOT_TYPE Shot) = "0x332e0449b21e13ab"

//INFO:
//PARAM NOTES:
//PURPOSE: Check that the cinemtatic shot is rendering. 
NATIVE FUNC BOOL IS_CINEMATIC_SHOT_RENDERING(SHOT_TYPE Shot) = "0x809c5dbfa8d8d422"

//INFO: If there is a cinematic camera rendering this cannot be overridden by the player. 
//PARAM NOTES:
//PURPOSE: Forces the cinematic mode to render this frame only. Will only render if there is a valid cinematic context. 
NATIVE PROC FORCE_CINEMATIC_RENDERING_THIS_UPDATE(BOOL ActiveThisFrame) = "0x683caf9e8ab4583d"

//INFO: If there is a cinematic camera rendering, this can be overriden by the player using quick toggle or pressing select
//PARAM NOTES:
//PURPOSE: Sets the cinematic mode to active. Will only render if there is a valid cinematic context else will be reset. 
NATIVE PROC SET_CINEMATIC_MODE_ACTIVE(bool Active) = "0x71800f6ecfd14497"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the cinematic news channel to be active for this update. 
NATIVE PROC SET_CINEMATIC_NEWS_CHANNEL_ACTIVE_THIS_UPDATE() = "0x58787e2db6f54bac"

//INFO: This is forcing the cinematic mode every frame and cannot be overriden by the player
//if a cinematic camera is rendering. 
//PARAM NOTES:
//PURPOSE: Sets the cinematic mission creator fail to be active for this update. 
NATIVE PROC SET_CINEMATIC_MISSION_CREATOR_FAIL_ACTIVE_THIS_UPDATE() = "0x9a341be2cbe64682"

//INFO: Ignore the menu preference for bonnet camera this update. 
//PURPOSE:
NATIVE PROC IGNORE_MENU_PREFERENCE_FOR_BONNET_CAMERA_THIS_UPDATE() = "0x438bb2738c8d1cc9"

//~>					 CUTSCENE Cameras 						 <~

//INFO:
//PARAM NOTES:
//PURPOSE: Bypasses rendering of the active cutscene camera for this update only, allowing the camera system to fallback to the active scripted camera, if rendering.
NATIVE PROC BYPASS_CUTSCENE_CAM_RENDERING_THIS_UPDATE() = "0x5a971a2d157136b6"

//INFO:
//PARAM NOTES: Valid shake names are as follows:
//	"SMALL_EXPLOSION_SHAKE"
//	"MEDIUM_EXPLOSION_SHAKE"
//	"LARGE_EXPLOSION_SHAKE"
//	"HAND_SHAKE"
//	"JOLT_SHAKE"
//	"VIBRATE_SHAKE"
//	"WOBBLY_SHAKE"
//	"DRUNK_SHAKE"
//	fAmplitudeScalar: Can be used to increase or decrease the amplitude of the shake effect.
//PURPOSE: Apply a predefined shake to the rendered result of the cutscene camera.
NATIVE PROC SHAKE_CUTSCENE_CAM(STRING ShakeName, FLOAT fAmplitudeScalar = 1.0) = "0x731970af18babee4"

//INFO:
//PARAM NOTES:
//PURPOSE: Is a cutscene camera shake active?
NATIVE FUNC BOOL IS_CUTSCENE_CAM_SHAKING() = "0x747c1186c8b8c7be"

//INFO:
//PARAM NOTES: fAmplitudeScalar: Can be used to increase or decrease the amplitude of the shake effect.
//PURPOSE: Sets the overall amplitude scaling for an cutscene camera shake.
NATIVE PROC SET_CUTSCENE_CAM_SHAKE_AMPLITUDE(FLOAT fAmplitudeScalar = 1.0) = "0x9706a280275bce96"

//INFO:
//PARAM NOTES: bStopImmediately: If TRUE, the shake will stop immediately, otherwise it will enter its release phase and fade out.
//PURPOSE: Stop the active cutscene camera shake.
NATIVE PROC STOP_CUTSCENE_CAM_SHAKING(BOOL bStopImmediately = FALSE) = "0x1435be4d0e33c803"

//INFO:
//PARAM NOTES:
//PURPOSE: Overrides the far clip of the active cutscene animated camera for this update only. This is MP-only, as SP is locked.
NATIVE PROC SET_CUTSCENE_CAM_FAR_CLIP_THIS_UPDATE(FLOAT FarClip) = "0xf0c79c8b198cd112"

//INFO: Check if the position was sucessfully registered.
//PARAM NOTES:
//PURPOSE: Register a position for the cinematic shot to try and create a camera. 
NATIVE FUNC BOOL REGISTER_CINEMATIC_CAMERA_CHECK_POINT_POS(VECTOR Pos) = "0x26bba2903674460c"

//INFO: This actually checks if this was rendered last frame, because script is updated before 
//the camera update. 
//PARAM NOTES:
//PURPOSE: Is the in vehicle mobile phone camera rendering. 
NATIVE FUNC BOOL IS_IN_VEHICLE_MOBILE_PHONE_CAMERA_RENDERING() = "0xfb59e5247fb6b7f9"

//INFO:
//PARAM NOTES:
//PURPOSE: Disables the cinematic slow mo for an update. 
NATIVE FUNC BOOL DISABLE_CINEMATIC_SLOW_MO_THIS_UPDATE() = "0x5951e2e1db653567"

//INFO:
//PARAM NOTES:
//PURPOSE: Is the bonnet cinematic cam rendering
NATIVE FUNC BOOL IS_BONNET_CINEMATIC_CAM_RENDERING() = "0x9bf14c0e44bdb17d"

//INFO:
//PARAM NOTES:
//PURPOSE: Is the cinematic input active by script or user input
NATIVE FUNC BOOL IS_CINEMATIC_CAM_INPUT_ACTIVE() = "0x3698ce894e1342d5"

//~>					 Camera Scene Transitions (Deprecated)	 						 <~

//INFO:
//PARAM NOTES:
//PURPOSE:  This command is deprecated!
NATIVE PROC  START_CAM_TRANSITION(CAMERA_INDEX CamIndex, VECTOR vStartPos, VECTOR vEndPos) = "0x5e6e0f6b80397c1d"

//INFO:
//PARAM NOTES:
//PURPOSE:  This command is deprecated!
NATIVE FUNC BOOL  IS_CAM_TRANSITIONING (CAMERA_INDEX CamIndex) = "0xe7ab8fa2bdb507c1"

//INFO:
//PARAM NOTES:
//PURPOSE: This command is deprecated!
NATIVE FUNC FLOAT  GET_CAM_TRANSITION_PHASE (CAMERA_INDEX CamIndex) = "0xebea23a22c057b10"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the acceleration, deceleration and speed limits for horizontal translation of the specified scripted fly camera.
NATIVE PROC SET_FLY_CAM_HORIZONTAL_RESPONSE(CAMERA_INDEX CameraIndex, FLOAT maxSpeed = 40.0, FLOAT maxAcceleration = 40.0, FLOAT maxDeceleration = 200.0) = "0xaea1bfac30053852"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the acceleration, deceleration and speed limits for vertical translation of the specified scripted fly camera.
NATIVE PROC SET_FLY_CAM_VERTICAL_RESPONSE(CAMERA_INDEX CameraIndex, FLOAT maxSpeed = 40.0, FLOAT maxAcceleration = 40.0, FLOAT maxDeceleration = 200.0) = "0xa2382ebb79e01e67"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the maximum world height that the specified scripted fly camera is allowed to achieve.
NATIVE PROC SET_FLY_CAM_MAX_HEIGHT(CAMERA_INDEX CameraIndex, FLOAT maxHeight = 500.0) = "0x3099b89127273567"

//INFO:
//PARAM NOTES: position: new scripted fly camera position
//PURPOSE: Overrides scripted fly camera's position. Value has to be set each update the override is required.
NATIVE PROC SET_FLY_CAM_COORD_AND_CONSTRAIN(CAMERA_INDEX CameraIndex, VECTOR position) = "0x9eb45aa8353bd0b7"

//INFO:
//PARAM NOTES:
//PURPOSE: Overrides scripted fly camera controls so trigger move camera up/down instead of forward/backward.
NATIVE PROC SET_FLY_CAM_VERTICAL_CONTROLS_THIS_UPDATE(CAMERA_INDEX CameraIndex) = "0x1aadc2d44870c7d9"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns TRUE if the specified scripted fly camera was constrained by collision on the previous update.
NATIVE FUNC BOOL WAS_FLY_CAM_CONSTRAINED_ON_PREVIOUS_UDPATE(CAMERA_INDEX CameraIndex) = "0x7f45f5de364061c3"

//INFO: 
//PARAM NOTES: maxDistanceFromCamera: The maximum valid distance from the camera to candidate peds.
// screenPositionTestBoneTag: If valid (not BONETAG_NULL), this specified the candidate ped bone to be tested for valid screen position.
// maxScreenWidthRatioAroundCentreForTestBone: The ratio of the screen width around the screen centre within which the specified test bone of a candidate ped must be located.
// maxScreenHeightRatioAroundCentreForTestBone: The ratio of the screen height around the screen centre within which the specified test bone of a candidate ped must be located.
// minRelativeHeadingScore: Defines the minimum scaling of a candidate ped's score that will be applied if the ped is at the far left or far right of the screen (at the maximum camera-relative heading.)
// maxScreenCentreScoreBoost: The maximum factor by which to boost a candidate ped's score when they are roughly centred on the screen.
// maxScreenRatioAroundCentreForScoreBoost: The ratio of the screen width located around the screen centre to apply the screenCentreScoreBoost.
// losTestBoneTag1/losTestBoneTag2: If valid (not BONETAG_NULL), a line of sight probe is tested between the camera and the specified bone of the candidate peds.
//PURPOSE: Finds the best candidate on-screen focus/subject ped.
NATIVE FUNC PED_INDEX GET_FOCUS_PED_ON_SCREEN(FLOAT maxDistanceFromCamera = 30.0, PED_BONETAG screenPositionTestBoneTag = BONETAG_HEAD, FLOAT maxScreenWidthRatioAroundCentreForTestBone = 0.8, FLOAT maxScreenHeightRatioAroundCentreForTestBone = 0.7, FLOAT minRelativeHeadingScore = 0.25, FLOAT maxScreenCentreScoreBoost = 8.0, FLOAT maxScreenRatioAroundCentreForScoreBoost = 0.333, PED_BONETAG losTestBoneTag1 = BONETAG_HEAD, PED_BONETAG losTestBoneTag2 = BONETAG_SPINE3) = "0x337b1e5a3d6dedfa"

//INFO:
//PARAM NOTES:
//PURPOSE: Disables the (PS3-specific) scanning near-clip for this update only. This prevents the final rendered near-clip distance from being increased automatically when the extended frustum in front of the camera is free of collision. Note that use of this command may result in increased z-fighting on PS3, as the scanning near-clip is designed to reduce this.
NATIVE PROC  DISABLE_NEAR_CLIP_SCAN_THIS_UPDATE() = "0x822c724fc6fae724"

//INFO:
//PARAM NOTES: State: The desired state to apply. See the definition of CAM_DEATH_FAIL_EFFECT_STATE for a list of valid states.
//PURPOSE: Pushes the death/fail camera effect through its states. You must ensure this is reset to CAM_DEATH_FAIL_EFFECT_INACTIVE once the sequence is complete.
NATIVE PROC SET_CAM_DEATH_FAIL_EFFECT_STATE(CAM_DEATH_FAIL_EFFECT_STATE State) = "0xecc353e755ab76f1"

//INFO: Must be called before RENDER_SCRIPT_CAMS(FALSE ) to change the type of the auto flash. Note that the auto flash will only
//		happen if you specify an interpolation out of 300 ms or more in your RENDER_SCRIPT_CAMS call, and the player is
//		set in first person mode.
//PARAM NOTES: 
//PURPOSE: Sets the type of flash that will be initiated by a scripted camera blend out to first person this frame
NATIVE PROC SET_FIRST_PERSON_FLASH_EFFECT_TYPE(FPS_FLASH_TYPE type) = "0x7659886d4d8ac36a"

//INFO: Must be called before RENDER_SCRIPT_CAMS(FALSE ) when you're going to warp the ped into a vehicle on the camera cut the flash corresponds to. Note that the auto flash will only
//		happen if you specify an interpolation out of 300 ms or more in your RENDER_SCRIPT_CAMS call, and the player is
//		set in first person mode.
//PARAM NOTES: 
//PURPOSE: Sets the vehicle model name used to calculate first person camera settings for a first person flash triggered by scripted cameras this frame.
NATIVE PROC SET_FIRST_PERSON_FLASH_EFFECT_VEHICLE_MODEL_NAME(STRING modelName) = "0x7533e83009d5f82f"

//INFO: Must be called before RENDER_SCRIPT_CAMS(FALSE ) when you're going to warp the ped into a vehicle on the camera cut the flash corresponds to. Note that the auto flash will only
//		happen if you specify an interpolation out of 300 ms or more in your RENDER_SCRIPT_CAMS call, and the player is
//		set in first person mode.
//PARAM NOTES: 
//PURPOSE: Sets the vehicle model hash used to calculate first person camera settings for a first person flash triggered by scripted cameras this frame.
NATIVE PROC SET_FIRST_PERSON_FLASH_EFFECT_VEHICLE_MODEL_HASH(INT modelHash) = "0x058fdcacb20a766a"

//INFO:
//PARAM NOTES: CameraIndex: The camera to be captured.
//	AnimName: The name of the animation to capture the camera to.
//PURPOSE: Starts a capture of the specified camera to the specified new animation.
NATIVE PROC START_CAMERA_CAPTURE(CAMERA_INDEX CameraIndex, STRING animName) = "0x015c04f6d80f2ada"

//INFO:
//PARAM NOTES:
//PURPOSE: Stops a capture of the camera.
NATIVE PROC STOP_CAMERA_CAPTURE() = "0xf427f64662a73be0"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns current value of pause menu setting.
NATIVE FUNC BOOL IS_ALLOWED_INDEPENDENT_CAMERA_MODES() = "0x9cf8be19558b3a3d"

//INFO:
//PARAM NOTES:
//PURPOSE: Prevent the collision settings for triple head/eyefinity resolutions in interiors for this update
NATIVE PROC CAMERA_PREVENT_COLLISION_SETTINGS_FOR_TRIPLEHEAD_IN_INTERIORS_THIS_UPDATE() = "0xb88aab5ba3dc7936"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the max distance from the player ped that the current replay free camera can be positioned. This will return 0.0f if the replay free camera is not currently running.
NATIVE FUNC FLOAT REPLAY_GET_MAX_DISTANCE_ALLOWED_FROM_PLAYER() = "0x0b9cd460e6a37693"
