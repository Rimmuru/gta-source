USING "hud_colours.sch"
USING "types.sch"
USING "script_hud_enums.sch"
USING "model_enums.sch"
USING "ped_bonetags.sch"
USING "commands_hud.sch"
USING "eulers.sch"

ENUM CORONATYPE
    CORONATYPE_SHINYSTAR = 0,
    CORONATYPE_MOON,
    CORONATYPE_NONE
ENDENUM

ENUM FLARETYPE
    FLARETYPE_NONE = 0,
    FLARETYPE_SUN,
    FLARETYPE_HEADLIGHTS
ENDENUM

ENUM CHECKPOINT_TYPE
	// ground races - positioned at base of cylinder
    CHECKPOINT_RACE_GROUND_CHEVRON_1_BASE = 0,
    CHECKPOINT_RACE_GROUND_CHEVRON_2_BASE = 1,
    CHECKPOINT_RACE_GROUND_CHEVRON_3_BASE = 2,
    CHECKPOINT_RACE_GROUND_LAP_BASE = 3,
    CHECKPOINT_RACE_GROUND_FLAG_BASE = 4,
    CHECKPOINT_RACE_GROUND_PIT_LANE_BASE = 5,
    
	// ground races - positioned at centre of chevron/flag etc			
    CHECKPOINT_RACE_GROUND_CHEVRON_1 = 6,								
    CHECKPOINT_RACE_GROUND_CHEVRON_2 = 7,								
    CHECKPOINT_RACE_GROUND_CHEVRON_3 = 8,								
    CHECKPOINT_RACE_GROUND_LAP = 9,									
    CHECKPOINT_RACE_GROUND_FLAG = 10,
    CHECKPOINT_RACE_GROUND_PIT_LANE = 11,

	// air races
    CHECKPOINT_RACE_AIR_CHEVRON_1 = 12,
    CHECKPOINT_RACE_AIR_CHEVRON_2 = 13,
    CHECKPOINT_RACE_AIR_CHEVRON_3 = 14,
    CHECKPOINT_RACE_AIR_LAP = 15,
    CHECKPOINT_RACE_AIR_FLAG = 16,

	// water races
    CHECKPOINT_RACE_WATER_CHEVRON_1 = 17,
    CHECKPOINT_RACE_WATER_CHEVRON_2 = 18,
    CHECKPOINT_RACE_WATER_CHEVRON_3 = 19,
    CHECKPOINT_RACE_WATER_LAP = 20,
    CHECKPOINT_RACE_WATER_FLAG = 21,

	// triathlon running races
    CHECKPOINT_RACE_TRI_RUN_CHEVRON_1 = 22,
    CHECKPOINT_RACE_TRI_RUN_CHEVRON_2 = 23,
    CHECKPOINT_RACE_TRI_RUN_CHEVRON_3 = 24,
    CHECKPOINT_RACE_TRI_RUN_LAP = 25,
    CHECKPOINT_RACE_TRI_RUN_FLAG = 26,
	
	// triathlon swimming races
    CHECKPOINT_RACE_TRI_SWIM_CHEVRON_1 = 27,
    CHECKPOINT_RACE_TRI_SWIM_CHEVRON_2 = 28,
    CHECKPOINT_RACE_TRI_SWIM_CHEVRON_3 = 29,
    CHECKPOINT_RACE_TRI_SWIM_LAP = 30,
    CHECKPOINT_RACE_TRI_SWIM_FLAG = 31,
	
	// triathlon cycling races
    CHECKPOINT_RACE_TRI_CYCLE_CHEVRON_1 = 32,
    CHECKPOINT_RACE_TRI_CYCLE_CHEVRON_2 = 33,
    CHECKPOINT_RACE_TRI_CYCLE_CHEVRON_3 = 34,
    CHECKPOINT_RACE_TRI_CYCLE_LAP = 35,
    CHECKPOINT_RACE_TRI_CYCLE_FLAG = 36,
	
	// plane school
    CHECKPOINT_PLANE_FLAT = 37,
    CHECKPOINT_PLANE_SIDE_L = 38,
    CHECKPOINT_PLANE_SIDE_R = 39,
    CHECKPOINT_PLANE_INVERTED = 40,
    
	// heli 
    CHECKPOINT_HELI_LANDING = 41,
    
    // parachute
    CHECKPOINT_PARACHUTE_RING = 42,
    CHECKPOINT_PARACHUTE_LANDING = 43,
    
	// gang locators
    CHECKPOINT_GANG_LOCATE_LOST = 44,
    CHECKPOINT_GANG_LOCATE_VAGOS = 45,
    CHECKPOINT_GANG_LOCATE_COPS = 46,
    
	// gang locators
    CHECKPOINT_RACE_LOCATE_GROUND = 47,
    CHECKPOINT_RACE_LOCATE_AIR= 48,
    CHECKPOINT_RACE_LOCATE_WATER = 49,
    
	// gang locators
    CHECKPOINT_MP_LOCATE_1 = 50,
    CHECKPOINT_MP_LOCATE_2 = 51,
    CHECKPOINT_MP_LOCATE_3 = 52,
    CHECKPOINT_MP_CREATOR_TRIGGER = 53,

	// freemode
	CHECKPOINT_MONEY = 54,

	// misc
	CHECKPOINT_BEAST = 55,

	// transforms
	CHECKPOINT_TRANSFORM = 56,
	CHECKPOINT_TRANSFORM_PLANE = 57,
	CHECKPOINT_TRANSFORM_HELICOPTER = 58,
	CHECKPOINT_TRANSFORM_BOAT = 59,
	CHECKPOINT_TRANSFORM_CAR = 60,
	CHECKPOINT_TRANSFORM_BIKE = 61,
	CHECKPOINT_TRANSFORM_PUSH_BIKE = 62,
	CHECKPOINT_TRANSFORM_TRUCK = 63,
	CHECKPOINT_TRANSFORM_PARACHUTE = 64,
	CHECKPOINT_TRANSFORM_THRUSTER = 65,

	// warps
	CHECKPOINT_WARP = 66
ENDENUM

ENUM GFX_DRAW_ORDER
	GFX_ORDER_BEFORE_HUD_PRIORITY_LOW = 0,
    GFX_ORDER_BEFORE_HUD,  // standard
    GFX_ORDER_BEFORE_HUD_PRIORITY_HIGH,
    
    GFX_ORDER_AFTER_HUD_PRIORITY_LOW,
	GFX_ORDER_AFTER_HUD,  // standard
	GFX_ORDER_AFTER_HUD_PRIORITY_HIGH,
	
	GFX_ORDER_AFTER_FADE_PRIORITY_LOW,
	GFX_ORDER_AFTER_FADE,  // standard
	GFX_ORDER_AFTER_FADE_PRIORITY_HIGH
ENDENUM

ENUM MARKER_TYPE
    MARKER_CONE = 0,
    MARKER_CYLINDER = 1,
    MARKER_ARROW = 2,
    MARKER_ARROW_FLAT = 3,
    MARKER_FLAG = 4,
    MARKER_RING_FLAG = 5,
    MARKER_RING = 6,
    MARKER_PLANE = 7,
    MARKER_BIKE_LOGO_1 = 8,
    MARKER_BIKE_LOGO_2 = 9,
    MARKER_NUM_0 = 10,
    MARKER_NUM_1 = 11,
    MARKER_NUM_2 = 12,
    MARKER_NUM_3 = 13,
    MARKER_NUM_4 = 14,
    MARKER_NUM_5 = 15,
    MARKER_NUM_6 = 16,
    MARKER_NUM_7 = 17,
    MARKER_NUM_8 = 18,
    MARKER_NUM_9 = 19,
    MARKER_CHEVRON_1 = 20,
    MARKER_CHEVRON_2 = 21,
    MARKER_CHEVRON_3 = 22,
    MARKER_RING_FLAT = 23,
    MARKER_LAP = 24,
    MARKER_HALO = 25,
    MARKER_HALO_POINT = 26,
    MARKER_HALO_ROTATE = 27,
    MARKER_SPHERE = 28,
    MARKER_MONEY = 29,
	MARKER_LINES = 30,
	MARKER_BEAST = 31,
	MARKER_QUESTION_MARK = 32,
	MARKER_TRANSFORM_PLANE = 33,
	MARKER_TRANSFORM_HELICOPTER = 34,
	MARKER_TRANSFORM_BOAT = 35,
	MARKER_TRANSFORM_CAR = 36,
	MARKER_TRANSFORM_BIKE = 37,
	MARKER_TRANSFORM_PUSH_BIKE = 38,
	MARKER_TRANSFORM_TRUCK = 39,
	MARKER_TRANSFORM_PARACHUTE = 40,
	MARKER_TRANSFORM_THRUSTER = 41,
	MARKER_WARP = 42,
	MARKER_BOXES = 43,
	MARKER_PIT_LANE = 44
ENDENUM

ENUM DECAL_RENDERSETTING_ID
    DECAL_RSID_BLOOD_SPLATTER = 1110,
    DECAL_RSID_BLOOD_DIRECTIONAL = 1015,
    DECAL_RSID_FOOTPRINT_SAND = 2020,
    DECAL_RSID_BULLET_IMPACT_METAL_SHOTGUN = 4202,
	DECAL_RSID_GENERIC_SCORCH = 4421,
    DECAL_RSID_FLOOR_SCUFF_1 = 7800,
    DECAL_RSID_FLOOR_SCUFF_2 = 7801,
    DECAL_RSID_FLOOR_SCUFF_3 = 7802,
    DECAL_RSID_FLOOR_SCUFF_4 = 7803,
    DECAL_RSID_LOGO_LOST_HOLLOW = 9100,
    DECAL_RSID_LOGO_LOST_GREY = 9101,
    DECAL_RSID_LOGO_LOST_WHITE = 9102,
    DECAL_RSID_LOGO_COPS_WHITE = 9103,
    DECAL_RSID_LOGO_VAGOS_WHITE = 9104,
    DECAL_RSID_RACE_LOCATE_GROUND = 9106,
    DECAL_RSID_RACE_LOCATE_AIR = 9107,
    DECAL_RSID_RACE_LOCATE_WATER = 9108,
    DECAL_RSID_TRIATHLON_CYCLING = 9110,
    DECAL_RSID_TRIATHLON_RUNNING= 9111,
    DECAL_RSID_TRIATHLON_SWIMMING = 9112,
    DECAL_RSID_HELIPAD = 9115,
    DECAL_RSID_PARACHUTE_LANDING = 9116,
    DECAL_RSID_SHADOW = 9117,
    DECAL_RSID_HALO = 9118,
    DECAL_RSID_HALO_PT = 9119,
    DECAL_RSID_MP_LOCATE_1 = 9120,
    DECAL_RSID_MP_LOCATE_2 = 9121,
    DECAL_RSID_MP_LOCATE_3 = 9122,
    DECAL_RSID_MP_CREATOR_TRIGGER = 9123,
    DECAL_RSID_OIL_POOL = 9200
ENDENUM

ENUM THERMALBEHAVIOUR
    TB_DEAD = 0,
    TB_COLD = 1, // Most animals
    TB_WARM = 2, 
    TB_HOT = 3 // Peds
ENDENUM

ENUM MOVIEMESHSETSTATE
    MMS_FAILED = -1,
    MMS_PENDING_LOAD = 0,
    MMS_LOADED = 1,
    MMS_READY = 2,
    MMS_PENDING_DELETE = 3
ENDENUM


ENUM TVCHANNELTYPE
    TVCHANNELTYPE_CHANNEL_NONE = -1,
    TVCHANNELTYPE_CHANNEL_1 = 0,
    TVCHANNELTYPE_CHANNEL_2,
    TVCHANNELTYPE_CHANNEL_SPECIAL,	
    TVCHANNELTYPE_CHANNEL_SCRIPT,		// ONLY FOR USE IN LESTER1. If you don't know why you want to use this channel, you don't want to use this channel.
	TVCHANNELTYPE_CHANNEL_3				// Requested for use in arcades in mpHeist3
ENDENUM

ENUM CREWEMBLEMREQUESTSTATE
	CERS_NOT_ACTIVE = 0,
	CERS_REQUESTING_BADGE = 1,
	CERS_APPLYING_DECAL = 2,
	CERS_SUCCEEDED = 3,
	CERS_FAILED = 4,
	CERS_FAILED_CANT_GET_CLAN_TEXTURE = 5,
	CERS_FAILED_CANT_ADD_DATA_SLOT = 6,
	CERS_FAILED_VEHICLE_NO_LONGER_VALID = 7,
	CERS_FAILED_VEHICLE_BONE_NOT_VALID = 8,
	CERS_FAILED_VEHICLE_BONE_IS_ZERO = 9,
	CERS_FAILED_VEHICLE_PROBE_FAILED = 10,
	CERS_FAILED_DECAL_DIDNT_APPLY = 11
ENDENUM

ENUM ANIMPOSTFX_EVENT_TYPE
    ANIMPOSTFX_EVENT_INVALID = -1,
    ANIMPOSTFX_EVENT_ON_START = 0,
    ANIMPOSTFX_EVENT_ON_STOP,
    ANIMPOSTFX_EVENT_ON_FRAME
ENDENUM

// STRUCT PROJTEXDATA
//     STRING texDiffuseName	// the name of the diffuse texture to project
//     STRING texNormalName	    // the name of the normal texture that gets applied (if any)
//     INT numTexRows		    // the number of rows of textures within the texture page
//     INT numTexCols		    // the number of columns of textures within the texture page
//     INT texId			    // the id of the required texture within the texture page
//     VECTOR pos			    // the position of the centre of the projection box
//     VECTOR dir			    // the direction of the projection (must be normalised)
//     VECTOR side			    // the direction of the side of the texture for texture alignment (must be normalised and perpendicular to the direction of projection)
//     FLOAT depth			    // the depth of the projection box (in the direction of projection)
//     FLOAT width			    // the width of the projection box
//     FLOAT height			    // the height of the projection box
//     FLOAT alpha_param			    // the alpha of the texture (0.0 - 1.0f)
//     FLOAT life			    // the life of the projected texture in seconds (-1.0 is infinite)
//     FLOAT specFalloff	    // the specular falloff of the texture
//     FLOAT specIntensity	    // the specular intensity of the texture
//     BOOL useSteep		    // whether or not to use the steep shader
//     FLOAT parallaxScale	    // the value of the parallex scale
// ENDSTRUCT


//~>                        Draw 3D debug commands


//NEW 

//INFO: Call this command every frame. Only runs in dev and bank release. Requires script -> Draw Debug Lines And Spheres widget to be active.
//PARAM NOTES: Defaulted to blue. Colours and alpha range are 0 - 255.
//PURPOSE: Draws a debug line bewteen the 2 vectors. More info..
NATIVE PROC DRAW_DEBUG_LINE (VECTOR VecCoorsFirst, VECTOR VecCoorsSecond, int red = 0, int green = 0, int blue = 255, int alpha_param = 255) = "0x116faa21fee61c2c"

//INFO: Call this command every frame. Only runs in dev and bank release. Requires script -> Draw Debug Lines And Spheres widget to be active.
//PARAM NOTES: Defaulted to blue. Colours and alpha range are 0 - 255.
//PURPOSE: Draws a debug line startin in one clour and blending to another. More info..
NATIVE PROC DRAW_DEBUG_LINE_WITH_TWO_COLOURS (VECTOR VecCoorsFirst, VECTOR VecCoorsSecond, int StartRed = 255, int StartGreen =  0, int StartBlue = 0, int StartAlpha = 255, int EndRed = 0,int EndGreen = 0 ,int EndBlue = 255, int EndAlpha =  255) = "0x8a66cde1d3e54c3b"

//INFO: Call this command every frame. Only runs in dev and bank release. Requires script -> Draw Debug Lines And Spheres widget to be active.
//PARAM NOTES: Defaulted to blue. Colours and alpha range are 0 - 255.
//PURPOSE: Draws a poly between the 3 vectors. More info..
NATIVE PROC DRAW_DEBUG_POLY (VECTOR VecCoorsFirst, VECTOR VecCoorsSecond, VECTOR VecCoorsThrird, int Red =  0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0x696d54b360c0af17"

//INFO: Call this command every frame. Only runs in dev and bank release. Requires script -> Draw Debug Lines And Spheres widget to be active.
//PARAM NOTES: Defaulted to blue. Colours and alpha range are 0 - 255.
//PURPOSE: Draws a polygon of a certain colour
NATIVE PROC DRAW_DEBUG_POLY_WITH_THREE_COLOURS (VECTOR VecCoorsFirst, VECTOR VecCoorsSecond, VECTOR VecCoorsThrird, int FirstRed = 255, int FirstGreen = 0, int FirstBlue = 0, int FirstAlpha = 255,  int SecondRed = 0, int SecondGreen = 255, int SecondBlue = 0, int SecondAlpha = 255, int ThirdRed = 0, int ThirdGreen = 0, int ThirdBlue = 255, int ThirdAlpha = 255  ) = "0xc3578f9d9cc71f45"

//INFO: Call this command every frame. Only runs in dev and bank release. Requires script -> Draw Debug Lines And Spheres widget to be active.
//PARAM NOTES: Defaulted to blue. Colours and alpha range are 0 - 255.
//PURPOSE: Draws a debug sphere. More info..
NATIVE PROC DRAW_DEBUG_SPHERE(VECTOR VecCoors, FLOAT Range, int Red = 0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0xb00fc865b64b72b8"

//INFO: Call this command every frame. Only runs in dev and bank release. Requires script -> Draw Debug Lines And Spheres widget to be active.
//PARAM NOTES: Defaulted to blue. Colours and alpha range are 0 - 255.
//PURPOSE: Draws a debug axis aligned box. More info
NATIVE PROC DRAW_DEBUG_BOX (VECTOR VecCoorsMin, VECTOR VecCoorsMax, int Red = 0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0x992c462a62c36aac"

//INFO: Call this command every frame. Only runs in dev and bank release. Requires script -> Draw Debug Lines And Spheres widget to be active.
//PARAM NOTES: Defaulted to blue. Colours and alpha range are 0 - 255..
//PURPOSE: Draws a cross at the given vector. More info..
NATIVE PROC DRAW_DEBUG_CROSS (VECTOR VecCoorsMin, FLOAT Size, int Red = 0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0x7f88c1f7a2bb84a8"

//INFO: Call this command every frame. Only runs in dev and bank release. Requires script -> Draw Debug Lines And Spheres widget to be active.
//PARAM NOTES: Defaulted to blue. Colours and alpha range are 0 - 255.
//PURPOSE: Draws text at a world coord. More info..
NATIVE PROC DRAW_DEBUG_TEXT (STRING text, VECTOR VecCoors, int Red = 0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0x906f6137d122d88c"

//INFO: Call this command every frame. Only runs in dev and bank release. Requires script -> Draw Debug Lines And Spheres widget to be active.
//PARAM NOTES: Defaulted to blue. Colours and alpha range are 0 - 255.
//PURPOSE:Draws text at a world coord with a screen releative offset. More info..
NATIVE PROC DRAW_DEBUG_TEXT_WITH_OFFSET (STRING text, VECTOR VecCoors, int Offset_x, int Offset_y,int Red = 0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0x232554e637753c44"

//INFO: 
//PARAM NOTES: UseHighQuality = true to enable high quality lighting
//PURPOSE:  Enable/disable high quality lighting for cutscenes
NATIVE PROC SET_HIGH_QUALITY_LIGHTING_TECHNIQUES(BOOL UseHighQuality) = "0x6244c19624fecd07"

//INFO: 
//PARAM NOTES: RGB = integers between 0 and 255
//PURPOSE:  Adds a light with the a scene. More info..
NATIVE PROC DRAW_LIGHT_WITH_RANGEEX(VECTOR VecCoors, INT R, INT G, INT B, FLOAT Range, FLOAT Intensity, FLOAT FalloffExponent) = "0xb0ebad32769ef0e8"

//INFO: 
//PARAM NOTES: RGB = integers between 0 and 255
//PURPOSE:  Adds a light with the a scene. More info..
NATIVE PROC DRAW_LIGHT_WITH_RANGE(VECTOR VecCoors, INT R, INT G, INT B, FLOAT Range, FLOAT Intensity) = "0x634e773276bb1aec"

//INFO: 
//PARAM NOTES: RGB = integers between 0 and 255
//PURPOSE:  Adds a spot light with the a scene. More info..
NATIVE PROC DRAW_SPOT_LIGHT(VECTOR VecCoors, VECTOR VecDirection, INT R, INT G, INT B, FLOAT Falloff, FLOAT Intensity, FLOAT InnerAngle, FLOAT OuterAngle, FLOAT Exp) = "0xd86164ee7a432643"

//INFO: 
//PARAM NOTES: RGB = integers between 0 and 255
//PURPOSE:  Adds a shadowed spot light with the a scene. Each one needs its own lightNum (just start at 0 and increment) for each new shadowed light added in the script.
NATIVE PROC DRAW_SHADOWED_SPOT_LIGHT(VECTOR VecCoors, VECTOR VecDirection, INT R, INT G, INT B, FLOAT Falloff, FLOAT Intensity, FLOAT InnerAngle, FLOAT OuterAngle, FLOAT Exp, INT lightNum) = "0xe2dc7c9e15411e37"

//INFO: 
//PARAM NOTES: seconds = time-taken for the ped light to fade up
//PURPOSE:  Trigger the ped light to fade up when this command is called
NATIVE PROC FADE_UP_PED_LIGHT(FLOAT seconds=4.0) = "0x34b11f2042ca7e3c"

//INFO: 
//PARAM NOTES: 
//PURPOSE:  Forces a re-calculate of all lights and their bounding boxes that are attached to this entity
NATIVE PROC UPDATE_LIGHTS_ON_ENTITY(ENTITY_INDEX EntityIndex) = "0xc9d2355daf3fe0c3"

//INFO: 
//PARAM NOTES: 
//PURPOSE:  Scales Maximum Intensity for Light Override (glow for pickups)
NATIVE PROC SET_LIGHT_OVERRIDE_MAX_INTENSITY_SCALE(FLOAT MaxIntensityScale) = "0x0a9c9cc24cd5ff43"

//INFO: 
//PARAM NOTES: 
//PURPOSE:  Return Maximum Intensity Scale for Light Override (glow for pickups)
NATIVE FUNC FLOAT GET_LIGHT_OVERRIDE_MAX_INTENSITY_SCALE() = "0x798d62da8796cbdf"

//INFO: 
//PARAM NOTES:  
//PURPOSE: Switches on the widget toggle to render debug lines and spheres. More info..
NATIVE PROC SET_DEBUG_LINES_AND_SPHERES_DRAWING_ACTIVE (BOOL bActive) = "0xf8ac79ed8746b0c2"

//~>                        Draw 2D debug commands

//INFO: This command draws to the screen game screen. The top left of the screen is 0,0 and the bottom right is 1,1. so all values should be bewteen these values.
// Call this command every frame. Only runs in dev and bank release. Requires script -> Draw Debug Lines And Spheres widget to be active.
//PARAM NOTES: RGB = integers between 0 and 255. Defaulted to blue.
//PURPOSE: Draws a Debug line to the screen. Vector x,y values should be in the range 0,0 -> 1,1. More info..
NATIVE PROC DRAW_DEBUG_LINE_2D (VECTOR VecCoorsFirst, VECTOR VecCoorsSecond, int red = 0, int green = 0, int blue = 255, int alpha_param = 255) = "0xc1869dbe37027246"

//INFO: This command draws to the screen game screen. The top left of the screen is 0,0 and the bottom right is 1,1. so all values should be bewteen these values.
// Call this command every frame. Only runs in dev and bank release. Requires script -> Draw Debug Lines And Spheres widget to be active.
//PARAM NOTES: RGB = integers between 0 and 255, Default: Line starts red and fades to blue.
//PURPOSE:  Draws a Debug line to the screen with 2 colours. Vector x,y values should be in the range 0,0 -> 1,1. More info..
NATIVE PROC DRAW_DEBUG_LINE_2D_WITH_TWO_COLOURS (VECTOR VecCoorsFirst, VECTOR VecCoorsSecond, int StartRed = 255, int StartGreen = 0, int StarBlue = 255, int StartAlpha = 255, int EndRed = 0, int EndGreen = 0 ,int EndBlue = 255, int EndAlpha = 255) = "0xa8aa43959e83267b"

//INFO:  This command draws to the screen game screen. The top left of the screen is 0,0 and the bottom right is 1,1. so all values should be bewteen these values.
//PARAM NOTES: RGB = integers between 0 and 255. Default: int red = 0, int green = 0, int blue = 255, int alpha = 255.
//PURPOSE: Draws a debug poly to the screen. Vector x,y values should be in the range 0,0 -> 1,1. More info..
NATIVE PROC DRAW_DEBUG_POLY_2D (VECTOR VecCoorsFirst, VECTOR VecCoorsSecond, VECTOR VecCoorsThird, int red = 0, int green = 0, int blue = 255, int alpha_param = 255) = "0x539e8ec586ec1110"

//INFO:  This command draws to the screen game screen. The top left of the screen is 0,0 and the bottom right is 1,1. so all values should be bewteen these values.
//PARAM NOTES: RGB = integers between 0 and 255. Default: FirstRed = 255, int FirstGreen = 0, int FirstBlue = 0, int FirstAlpha = 255,  int SecondRed = 0, int SecondGreen = 255, int SecondBlue = 0, int SecondAlpha = 255, int ThirdRed = 0, int ThirdGreen = 0, int ThirdBlue = 255, int ThirdAlpha = 255 
//PURPOSE: Draws a debug poly to the screen with 3 colours. Vector x,y values should be in the range 0,0 -> 1,1. More info.. 
NATIVE PROC DRAW_DEBUG_POLY_2D_WITH_THREE_COLOURS (VECTOR VecCoorsFirst, VECTOR VecCoorsSecond, VECTOR VecCoorsThrird,int FirstRed = 255, int FirstGreen = 0, int FirstBlue = 0, int FirstAlpha = 255,  int SecondRed = 0, int SecondGreen = 255, int SecondBlue = 0, int SecondAlpha = 255, int ThirdRed = 0, int ThirdGreen = 0, int ThirdBlue = 255, int ThirdAlpha = 255  ) = "0xbed48ff0654aaeac"

//INFO: This command draws to the screen game screen. The top left of the screen is 0,0 and the bottom right is 1,1. so all values should be bewteen these values.
//PARAM NOTES: RGB = integers between 0 and 255. Defaulted to blue.
//PURPOSE: Draws text to the screen. Vector x,y values should be in the range 0,0 -> 1,1. More info.. 
NATIVE PROC DRAW_DEBUG_TEXT_2D (STRING text, VECTOR VecCoors, int Red = 0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0x963a57df8530029d"

//~>                        Draw Vector Map debug commands

//INFO: Vector map can be zoomed in and out of by pressing 1 or 2.
//PARAM NOTES:
//PURPOSE: Draws a line on the vector map display. More info..
NATIVE PROC DRAW_VECTOR_MAP_LINE (VECTOR VecCoorsFirst, VECTOR VecCoorsSecond, int Red = 0, int Green = 0, int Blue = 255, int alpha_param = 255, int Red1 = 0, int Green1 = 0, int Blue1 = 255, int Alpha1= 255) = "0x7aecb233286db148"

//INFO: Vector map can be zoomed in and out of by pressing 1 or 2.
//PARAM NOTES:
//PURPOSE: Draws a think line on the vector map display. More info..
NATIVE PROC DRAW_VECTOR_MAP_LINE_THICK (VECTOR VecCoorsFirst, VECTOR VecCoorsSecond, int Red = 0, int Green = 0, int Blue = 255, int alpha_param = 255, int Red1 = 0, int Green1 = 0, int Blue1 = 255, int Alpha1= 255) = "0x23544bf2543331db"

//INFO: Vector map can be zoomed in and out of by pressing 1 or 2.
//PARAM NOTES:
//PURPOSE: Draws a circle on the vector map display. More info..
NATIVE PROC DRAW_VECTOR_MAP_CIRCLE (VECTOR VecCoorsFirst, FLOAT Radius, int Red = 0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0x950f3c7d321f2282"

//INFO: Vector map can be zoomed in and out of by pressing 1 or 2.
//PARAM NOTES:
//PURPOSE:  Draws a poly on the vector map display. More info..
NATIVE PROC DRAW_VECTOR_MAP_POLY (VECTOR VecCoorsFirst, VECTOR VecCoorsSecond, VECTOR VecCoorsThird, int Red = 0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0x1e412a1301c960b8"

//INFO: Vector map can be zoomed in and out of by pressing 1 or 2.
//PARAM NOTES:
//PURPOSE:  Draws a rectangle on the vector map display. More info..
NATIVE PROC DRAW_VECTOR_MAP_RECTANGLE (VECTOR VecCoorsFirst, VECTOR VecCoorsSecond, int Red = 0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0x86b887a0a6dd3d7e"

//INFO: Vector map can be zoomed in and out of by pressing 1 or 2.
//PARAM NOTES: RadiusInner: Radius of the inner circle 
//                          RadiusOuter: Radius of the outer circle.
//                          TheataStart: Start angle.
//                          TheataEnd: Number of segments

//PURPOSE:  Draws a wedge on the vector map display. More info..
NATIVE PROC DRAW_VECTOR_MAP_WEDGE (VECTOR VecCoorsFirst, FLOAT RadiusInner, FLOAT RadiusOuter, FLOAT TheataStart, FLOAT TheataEnd, int NumOfSegments,int Red = 0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0xe9dd48eec6654d98"

//INFO: Vector map can be zoomed in and out of by pressing 1 or 2.
//PARAM NOTES:
//PURPOSE:  Draws a marker on the vector map display. More info..
NATIVE PROC DRAW_VECTOR_MAP_MARKER (VECTOR VecCoorsFirst, FLOAT Size, int Red = 0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0xf4f1158260c351ee"

//INFO: Vector map can be zoomed in and out of by pressing 1 or 2.
//PARAM NOTES:
//PURPOSE:  Draws the position of a vehicle on the vector map display. More info..
NATIVE PROC DRAW_VECTOR_MAP_VEHICLE (VEHICLE_INDEX Vehicle,  int Red = 0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0x9e9e3a94754bc189"

//INFO: Vector map can be zoomed in and out of by pressing 1 or 2.
//PARAM NOTES:
//PURPOSE:  Draws the position of a ped on the vector map display. More info..
NATIVE PROC DRAW_VECTOR_MAP_PED (PED_INDEX Ped, int Red = 0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0x3be3177c6570663f"

//INFO: Vector map can be zoomed in and out of by pressing 1 or 2.
//PARAM NOTES:
//PURPOSE:  Draws the position players cam on the vector map. More info..
NATIVE PROC DRAW_VECTOR_MAP_LOCAL_PLAYER_CAM (int Red = 0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0x7c76172989638b68"

//INFO: Vector map can be zoomed in and out of by pressing 1 or 2.
//PARAM NOTES:
//PURPOSE:  Draws a ripple effect on the vector map.  More info..
NATIVE PROC DRAW_VECTOR_MAP_EVENT_RIPPLE (VECTOR VecCoors, float finalradius, int LifeTimeMs, int Red = 0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0xdb579ba66805ac59"

//INFO: Vector map can be zoomed in and out of by pressing 1 or 2.
//PARAM NOTES:
//PURPOSE:  Draws  text to the vector map. More info..
NATIVE PROC DRAW_VECTOR_MAP_TEXT (STRING Text,VECTOR VecCoorsFirst, BOOL bDrawBackGround = TRUE, int Red = 0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0xf9c03dd47c3bada8"


//~>                        Draw commands

//INFO: Call this command every frame.
//PARAM NOTES: Defaulted to blue. Colours and alpha range are 0 - 255.
//PURPOSE: Draws a line bewteen the 2 vectors.
NATIVE PROC DRAW_LINE (VECTOR VecCoorsFirst, VECTOR VecCoorsSecond, int red = 0, int green = 0, int blue = 255, int alpha_param = 255) = "0x0f3d52721510c729"


//INFO: Call this command every frame.
//PARAM NOTES: Defaulted to blue. Colours and alpha range are 0 - 255.
//PURPOSE: Draws a poly between the 3 vectors. More info..
NATIVE PROC DRAW_POLY (VECTOR VecCoorsFirst, VECTOR VecCoorsSecond, VECTOR VecCoorsThird, int Red =  0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0xf6dbd92bef1dc4ad"

//INFO: Call this command every frame.
//PARAM NOTES: Colours and alpha range are 0 - 255. UVs are passed in XY components of the vector (Z is ignored).
//PURPOSE: Draws textured poly between the 3 vectors.
NATIVE PROC DRAW_TEXTURED_POLY (VECTOR VecCoorsFirst, VECTOR VecCoorsSecond, VECTOR VecCoorsThird, int Red, int Green, int Blue, int alpha_param, STRING TextureDictionaryName, STRING TextureName, VECTOR UV1, VECTOR UV2, VECTOR UV3) = "0x4e02aff84ca4348f"

//INFO: Call this command every frame.
//PARAM NOTES: Defaulted to blue. Colours and alpha range are 0 - 255.
//PURPOSE: Draws a poly between the 3 vectors with 3 Colours
NATIVE PROC DRAW_POLY_WITH_THREE_COLOURS(VECTOR VecCoorsFirst, VECTOR VecCoorsSecond, VECTOR VecCoorsThird, int R1=0, int G1=0, int B1=255, int A1=255, int R2=0, int G2=0, int B2=255, int A2=255, int R3=0, int G3=0, int B3=255, int A3=255) = "0x46b61194a9253a03"

//INFO: Call this command every frame.
//PARAM NOTES: Colours and alpha range are 0-255. RGB componenets are passed as floats (0.0-255.0) in XYZ of the vector. UVs are passed in XY components of the vector (Z is ignored).
//PURPOSE: Draws textured poly between the 3 vectors with 3 Colours
NATIVE PROC DRAW_TEXTURED_POLY_WITH_THREE_COLOURS(VECTOR VecCoorsFirst, VECTOR VecCoorsSecond, VECTOR VecCoorsThird, VECTOR RGB1, int A1, VECTOR RGB2, int A2, VECTOR RGB3, int A3, STRING TextureDictionaryName, STRING TextureName, VECTOR UV1, VECTOR UV2, VECTOR UV3) = "0x82dc59c0f3a73991"

//INFO: Call this command every frame.
//PARAM NOTES: Defaulted to blue. Colours and alpha range are 0 - 255.
//PURPOSE: Draws a box between the 2 vectors. More info..
NATIVE PROC DRAW_BOX (VECTOR VecCoorsMin, VECTOR VecCoorsMax, int Red =  0, int Green = 0, int Blue = 255, int alpha_param = 255) = "0xfdbc3b555b9b5928"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Set backface culling for other DRAW_... commands, please reset to TRUE after use.
NATIVE PROC SET_BACKFACECULLING (BOOL on) = "0xbe1b671f8bb897b3"


//INFO: 
//PARAM NOTES: 
//PURPOSE: Set depth writing for other DRAW_... commands, please reset to FALSE after use.
NATIVE PROC SET_DEPTHWRITING (BOOL on) = "0xced4eae315bc88fe"


//~>                        Checkpoint commands

//INFO: If the checkpoint is a chevron then it will point towards scrVecPointAt. If it's a flag then scrVecPointAt will be ignored. 
//PARAM NOTES:
//PURPOSE: Creates a race checkpoint. More info..
NATIVE FUNC CHECKPOINT_INDEX CREATE_CHECKPOINT (CHECKPOINT_TYPE CheckpointType, VECTOR scrVecPosition, VECTOR scrVecPointAt, FLOAT fSize, INT colR = 255, INT colG = 100, INT colB = 0, INT colA = 100, INT num = 0) = "0x89ee105c4f81a182"

//INFO: 
//PARAM NOTES:
//PURPOSE: Scales the height of any chevron/flag etc inside a cylinder
NATIVE PROC SET_CHECKPOINT_INSIDE_CYLINDER_HEIGHT_SCALE(CHECKPOINT_INDEX UniqueCheckpointIndex, FLOAT insideCylinderHeightScale) = "0xc61e1a088d32cc8b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Scales any chevron/flag etc inside a cylinder
NATIVE PROC SET_CHECKPOINT_INSIDE_CYLINDER_SCALE(CHECKPOINT_INDEX UniqueCheckpointIndex, FLOAT insideCylinderScale) = "0xd6c441611fa6b9e2"

//INFO: 
//PARAM NOTES:
//PURPOSE: sets the min and max height  of any cylinder in a checkpoint and the distance at which the height starts to decrease from the max to the min scale
NATIVE PROC SET_CHECKPOINT_CYLINDER_HEIGHT(CHECKPOINT_INDEX UniqueCheckpointIndex, FLOAT cylinderHeightMin, FLOAT cylinderHeightMax, FLOAT cylinderHeightDist) = "0x7ff96acf7a4cd4ed"

//INFO: 
//PARAM NOTES:
//PURPOSE: sets the rgba of a checkpoint
NATIVE PROC SET_CHECKPOINT_RGBA(CHECKPOINT_INDEX UniqueCheckpointIndex, INT colR, INT colG, INT colB, INT colA) = "0x64983ddd3d05b1b7"

//INFO: 
//PARAM NOTES:
//PURPOSE: sets the rgba (secondary) of a checkpoint
NATIVE PROC SET_CHECKPOINT_RGBA2(CHECKPOINT_INDEX UniqueCheckpointIndex, INT colR, INT colG, INT colB, INT colA) = "0x5aa4072aeb6e6a0e"

//INFO: 
//PARAM NOTES:
//PURPOSE: sets the clip plane of a checkpoint using position and normal (pass a zero normal to clear the clip plane)
NATIVE PROC SET_CHECKPOINT_CLIPPLANE_WITH_POS_NORM(CHECKPOINT_INDEX UniqueCheckpointIndex, VECTOR scrVecPosition, VECTOR scrVecNormal) = "0x7a9381199559fbcb"

//INFO: 
//PARAM NOTES:
//PURPOSE: sets the clip plane of a checkpoint using plane equation (pass a zero normal to clear the clip plane)
NATIVE PROC SET_CHECKPOINT_CLIPPLANE_WITH_PLANE_EQ(CHECKPOINT_INDEX UniqueCheckpointIndex, FLOAT planeEqnX, FLOAT planeEqnY, FLOAT planeEqnZ, FLOAT planeEqnW) = "0xd3b348c7c5f51f36"

//INFO: 
//PARAM NOTES:
//PURPOSE: gets the plane equation of a checkpoint's clip plane 
NATIVE PROC GET_CHECKPOINT_CLIPPLANE_PLANE_EQ(CHECKPOINT_INDEX UniqueCheckpointIndex, FLOAT& planeEqnX, FLOAT& planeEqnY, FLOAT& planeEqnZ, FLOAT& planeEqnW) = "0x4bc0c0cac06bcb20"

//INFO: 
//PARAM NOTES:
//PURPOSE: forces a checkpoint that uses arrows to use the old style arrow pointing
NATIVE PROC SET_CHECKPOINT_FORCE_OLD_ARROW_POINTING(CHECKPOINT_INDEX UniqueCheckpointIndex) = "0xe8ca1ce36f1cc033"

//INFO: 
//PARAM NOTES:
//PURPOSE: forces a checkpoint with a decal to use the camera rotation for alignment instead of camera position
NATIVE PROC SET_CHECKPOINT_DECAL_ROT_ALIGNED_TO_CAMERA_ROT(CHECKPOINT_INDEX UniqueCheckpointIndex) = "0x17c03d186cd6f5fb"

//INFO: 
//PARAM NOTES:
//PURPOSE: stops a checkpoint ring from facing the camera
NATIVE PROC SET_CHECKPOINT_PREVENT_RING_FACING_CAM(CHECKPOINT_INDEX UniqueCheckpointIndex) = "0x74a240b42703b6cc"

//INFO: 
//PARAM NOTES:
//PURPOSE: forces a checkpoint to use the direction instead of any predefined camera facing
NATIVE PROC SET_CHECKPOINT_FORCE_DIRECTION(CHECKPOINT_INDEX UniqueCheckpointIndex) = "0x8814a1cc123e8228"

//INFO: 
//PARAM NOTES:
//PURPOSE: sets a new look at position on a checkpoint
NATIVE PROC SET_CHECKPOINT_DIRECTION(CHECKPOINT_INDEX UniqueCheckpointIndex, VECTOR scrVecPointAt) = "0x1891f5294778a5ad"

//INFO: 
//PARAM NOTES:
//PURPOSE: Removes a checkpoint
NATIVE PROC DELETE_CHECKPOINT(CHECKPOINT_INDEX UniqueCheckpointIndex) = "0xb9acd8a27bcdc3e2"

//~>                        Marker commands

//INFO: 
//PARAM NOTES:
// MarkerType - the type of marker to the drawn
// scrVecPosition - position of the marker
// scrVecDirection - the direction the marker should face
// scrVecRotation - the rotation applied to the marker (in degrees for each axis)
// scrVecScale - the scale of the marker in each of the 3 dimensions
// col - the colour of the marker (0-255 for each component)
// bounce - whether the marker should bounce up and down
// faceCam - whether the marker should face the camera
// rotate - whether the marker should rotate automatically on the Z axis.
// txdName - streamed texture dictionary name 
// texName - streamed texture name
// invert - render inverted
//PURPOSE: Draws a marker this frame
NATIVE PROC DRAW_MARKER(MARKER_TYPE MarkerType, VECTOR scrVecPosition, VECTOR scrVecDirection, VECTOR scrVecRotation, VECTOR scrVecScale, INT colR = 255, INT colG = 100, INT colB = 0, INT colA = 100, BOOL bounce = false, BOOL faceCam = false, EULER_ROT_ORDER RotOrder = EULER_YXZ, BOOL rotate = false, STRING txdName = NULL, STRING texName = NULL, BOOL invert = false) = "0x578727d52eacada6"

NATIVE PROC DRAW_MARKER_EX(MARKER_TYPE MarkerType, VECTOR scrVecPosition, VECTOR scrVecDirection, VECTOR scrVecRotation, VECTOR scrVecScale, INT colR = 255, INT colG = 100, INT colB = 0, INT colA = 100, BOOL bounce = false, BOOL faceCam = false, EULER_ROT_ORDER RotOrder = EULER_YXZ, BOOL rotate = false, STRING txdName = NULL, STRING texName = NULL, BOOL invert = false, BOOL usePreAlphaDepth = true, BOOL matchEntityRotOrder = false) = "0x3094777b6f3c614f"


//INFO: Draws a sphere marker of better quality than the markers one. ONLY ONE PER FRAME IS SUPPORTED.
//PARAM NOTES:
// scrVecPosition - position of the sphere
// radius - the direction the marker should face
// col - the colour of the marker (0-255 for each component)
// intensity - intensity of the sphere (similar behaviour to alpha)
//PURPOSE: Draws a sphere marker this frame.
NATIVE PROC DRAW_MARKER_SPHERE(VECTOR scrVecPosition, FLOAT radius, INT colR, INT colG, INT colB, FLOAT intensity) = "0xb5d87e1c6e14871d"


// INFO: Get the orientation vectors of the plane marker closest to the input position
NATIVE FUNC BOOL GET_CLOSEST_PLANE_MARKER_ORIENTATION(VECTOR scrVecPosition, VECTOR& scrVecRight, VECTOR& scrVecForward, VECTOR& scrVecUp) = "0x642905aea0bf6645"


//~>                        In Game UI commands

//INFO: 
//PARAM NOTES:
//PURPOSE: supresses the rendering of the in game UI (i.e. multiplayer mission 'locators'/'coronas'
NATIVE PROC DONT_RENDER_IN_GAME_UI(BOOL val) = "0x3b4b2c4b99c88de8"

//INFO: 
//PARAM NOTES:
//PURPOSE: forces the rendering of the in game UI (i.e. multiplayer mission 'locators'/'coronas'
NATIVE PROC FORCE_RENDER_IN_GAME_UI(BOOL val) = "0xa6e763ec100ae7bb"

//~>                        Texture dictionary commands

//INFO:  The .img file should contain platform-specific txds and the filename should be listed in X:\project\build\common\data\images.txt. 
//      After requesting the txd, you should check HAS_STREAMED_TXD_LOADED in the same way as you do for models and animations.
//      This command is a streamed version of LOAD_TXD. 
//PARAM NOTES:
//PURPOSE: Requests a texture dictionary to be loaded from an .img file. More info..
NATIVE PROC REQUEST_STREAMED_TEXTURE_DICT(STRING TxdName, BOOL bPriority=FALSE) = "0xa9911c122b3210b5"

//INFO: After requesting a streamed txd, call this command to check when the txd has finished streaming. It will return TRUE once the txd has loaded. 
//PARAM NOTES:
//PURPOSE: Checks that the streamed tecture dictionary has loaded. More info..
NATIVE FUNC BOOL HAS_STREAMED_TEXTURE_DICT_LOADED(STRING TxdName) = "0x9d4afed2949f7082"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Unloads a streamed testure
NATIVE PROC SET_STREAMED_TEXTURE_DICT_AS_NO_LONGER_NEEDED(STRING TxdName) = "0x861d35d42cfd2991"

//~>                        2d draw commands

//INFO: 
//PARAM NOTES: 
//PURPOSE: Sets a mask active.
NATIVE PROC SET_MASK_ACTIVE(BOOL bUseMask, BOOL bInvertMask=FALSE) = "0x3491642dfe0d9545"

//INFO: Will only work with Graphics (ie rectangles/sprites etc) and not text. 
//PARAM NOTES:  
//PURPOSE:  Masks off an area on screen where no graphics will be drawn. More info..
NATIVE PROC SET_MASK_ATTRIBUTES(FLOAT CentreX, FLOAT CentreY, FLOAT Width, FLOAT Height) = "0xbf7c3ffdec8a17db"

//INFO: rects are drawn in order, with the laset rectangle  drawn on top. 
//PARAM NOTES:Centre x and y: ranges between 0 (top left) and 1 (bottom right) of the screen. drawn from the rect centre.
//                      RGBA set between 0 and 255
//PURPOSE: Renders a rectangle to the screen. More info.
NATIVE PROC DRAW_RECT(FLOAT CentreX, FLOAT CentreY, FLOAT Width, FLOAT Height, INT R, INT G, INT B, INT A, BOOL bStereo = FALSE) = "0xca4c0ad3caff651e"

//INFO: movies are drawn in order, with the latest drawn on top.
//PARAM NOTES:movie id (retrieved from REQUEST_SCALEFORM_MOVIE), position & size, StereoFlag(0 = no stereo, 1 = reticule stereo, 2 = normal stereo)
//PURPOSE: Renders a scaleform movie to the screen.
NATIVE PROC DRAW_SCALEFORM_MOVIE(SCALEFORM_INDEX iScaleformMovieId, FLOAT CentreX, FLOAT CentreY, FLOAT Width, FLOAT Height, INT R, INT G, INT B, INT A, INT StereoFlag = 0) = "0x694170bb080c08ff"

//INFO: movies are drawn in order, with the latest drawn on top.
//PARAM NOTES:movie id (retrieved from REQUEST_SCALEFORM_MOVIE).   The size is always fullscreen - no adjustment for WS as this is done inside the movie itself, StereoFlag(0 = no stereo, 1 = reticule stereo, 2 = normal stereo)
//PURPOSE: Renders a scaleform movie to the screen always at full screen
NATIVE PROC DRAW_SCALEFORM_MOVIE_FULLSCREEN(SCALEFORM_INDEX iScaleformMovieId, INT R, INT G, INT B, INT A, INT StereoFlag = 0) = "0xc4353d240dce9533"

//INFO: movies are drawn in order, with the latest drawn on top.
//PARAM NOTES:movie id (retrieved from REQUEST_SCALEFORM_MOVIE).   The size is always fullscreen - no adjustment for WS as this is done inside the movie itself
//PURPOSE: Renders two movies with masking between.
NATIVE PROC DRAW_SCALEFORM_MOVIE_FULLSCREEN_MASKED(SCALEFORM_INDEX iForegroundMovieId, SCALEFORM_INDEX iBackgroundMovieId, INT R, INT G, INT B, INT A) = "0xb0393791863712b1"

//INFO: Draw rectangle by specifying the corners 
//PARAM NOTES:
//PURPOSE: Renders a rectangle to the screen. More info.
PROC DRAW_RECT_FROM_CORNER(FLOAT TopLeftX, FLOAT TopLeftY, FLOAT Width, FLOAT Height, INT R, INT G, INT B, INT A)
	DRAW_RECT(TopLeftX + (Width * 0.5), TopLeftY + (Height * 0.5), Width, Height, R, G, B, A)
ENDPROC

//INFO: lines are drawn in order, with the latest line  drawn on top. 
//PARAM NOTES:x,y start of line, x,y end of line, thickness of the line (all in 0-1 screen space)
//                      RGBA set between 0 and 255
//PURPOSE: Renders a line to the screen. More info.
NATIVE PROC DRAW_LINE_2D(FLOAT fStartX, FLOAT fStartY, FLOAT fEndX, FLOAT fEndY, FLOAT fWidth, INT R, INT G, INT B, INT A) = "0xb8da1d7223719e67"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets whether to display this scripted gfx when the game pauses.  Its defaulted to off
NATIVE PROC SET_SCRIPT_GFX_DRAW_BEHIND_PAUSEMENU(BOOL bValue) = "0xe53134abb42f336f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets scripted gfx draw order. The default setting is GFX_ORDER_AFTER_HUD
NATIVE PROC SET_SCRIPT_GFX_DRAW_ORDER(GFX_DRAW_ORDER iDrawOrder) = "0x2e04b7b46a3670e5"

ENUM UI_ALIGNMENT
	UI_ALIGN_LEFT = 76,		// 'L'
	UI_ALIGN_RIGHT = 82,	// 'R'
	UI_ALIGN_TOP = 84,		// 'T'
	UI_ALIGN_BOTTOM = 66,	// 'B'
	UI_ALIGN_IGNORE = 73	// 'I'
ENDENUM

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the alignment type to the safezone 
//		alignX : UI_ALIGN_LEFT, UI_ALIGN_RIGHT, UI_ALIGN_IGNORE
//		alignY : UI_ALIGN_TOP, UI_ALIGN_BOTTOM, UI_ALIGN_IGNORE
NATIVE PROC SET_SCRIPT_GFX_ALIGN(UI_ALIGNMENT alignX, UI_ALIGNMENT alignY) = "0xa5aab00fa8c570a4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the additional alignment parameters 
//		offsetX, offsetY : Value to offset all x,y coords passed to 2d renderer. 
//		sizeX : If you are aligned to the right of the screen it assumes the x size of everything is this. This makes the calculations for 
//				positioning multiple UI elements of different sizes easier. Set this to the size of the largest element
//		sizeY : If you are aligned to the bottom of the screen it assumes the y size of everything is this. As above set this to the size of 
//				largest element 
NATIVE PROC SET_SCRIPT_GFX_ALIGN_PARAMS(FLOAT offsetX, FLOAT offsetY, FLOAT sizeX, FLOAT sizeY) = "0x98f560bc13e5293f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get a position on screen given the current alignment setup 
//		x, y : Input x and y coords. 
//		newX, newY : Calculate x and y coords given current alignment setup
NATIVE PROC GET_SCRIPT_GFX_ALIGN_POSITION(FLOAT x, FLOAT y, FLOAT& newX, FLOAT& newY) = "0x9ccca5f1ebb26c03"


//INFO: 
//PARAM NOTES:
//PURPOSE: Return the safe zone size.
NATIVE FUNC FLOAT GET_SAFE_ZONE_SIZE() = "0x36e90400da266164"

//INFO: 
//PARAM NOTES:
//PURPOSE: Resets alll the alignment parameters to unaligned with no offset s
NATIVE PROC RESET_SCRIPT_GFX_ALIGN() = "0xb5a50a903b9ab61b"


NATIVE PROC DRAW_SPRITE(STRING pTextureDictionaryName, STRING pTextureName, FLOAT CentreX, FLOAT CentreY, FLOAT Width, FLOAT Height, FLOAT Rotation, INT R, INT G, INT B, INT A, BOOL DoStereorize = FALSE, BOOL UseNearest = FALSE) = "0xebf08da37d86cd05"

// same as DRAW_SPRITE(), but correctly rotates sprites with inverted screen Aspect Ratio applied to all X coords:
NATIVE PROC DRAW_SPRITE_ARX(STRING pTextureDictionaryName, STRING pTextureName, FLOAT CentreX, FLOAT CentreY, FLOAT Width, FLOAT Height, FLOAT Rotation, INT R, INT G, INT B, INT A, BOOL DoStereorize = FALSE, BOOL UseNearest = FALSE) = "0x7a86232b8d047c7b"

NATIVE PROC DRAW_SPRITE_NAMED_RENDERTARGET(STRING pTextureDictionaryName, STRING pTextureName, FLOAT CentreX, FLOAT CentreY, FLOAT Width, FLOAT Height, FLOAT Rotation, INT R, INT G, INT B, INT A, BOOL UseNearest = FALSE) = "0x28159a26a47145a0"

//NATIVE PROC DRAW_SPRITE_STEREO(STRING pTextureDictionaryName, STRING pTextureName, FLOAT CentreX, FLOAT CentreY, FLOAT Width, FLOAT Height, FLOAT Rotation, INT R, INT G, INT B, INT A) = 

NATIVE PROC DRAW_SPRITE_WITH_UV(STRING pTextureDictionaryName, STRING pTextureName, FLOAT CentreX, FLOAT CentreY, FLOAT Width, FLOAT Height, FLOAT ux, FLOAT uy, FLOAT vx, FLOAT vy, FLOAT Rotation, INT R, INT G, INT B, INT A, BOOL UseNearest = FALSE) = "0x1018b8fa2e04e31a"
NATIVE PROC DRAW_SPRITE_ARX_WITH_UV(STRING pTextureDictionaryName, STRING pTextureName, FLOAT CentreX, FLOAT CentreY, FLOAT Width, FLOAT Height, FLOAT ux, FLOAT uy, FLOAT vx, FLOAT vy, FLOAT Rotation, INT R, INT G, INT B, INT A, BOOL UseNearest = FALSE) = "0xaf70d3d30d433da1"

NATIVE PROC DRAW_SPRITE_3D(STRING pTextureDictionaryName, STRING pTextureName, FLOAT CentreX, FLOAT CentreY, FLOAT CentreZ, FLOAT Width, FLOAT Height, FLOAT Rotation, INT R, INT G, INT B, INT A) = "0x08e3c368c184d0cf"
NATIVE PROC DRAW_SPRITE_3D_WITH_UV(STRING pTextureDictionaryName, STRING pTextureName, FLOAT CentreX, FLOAT CentreY, FLOAT CentreZ, FLOAT Width, FLOAT Height, FLOAT ux, FLOAT uy, FLOAT vx, FLOAT vy, FLOAT Rotation, INT R, INT G, INT B, INT A) = "0x9735fee3de1ef3f8"



//INFO: 
//PARAM NOTES:
//PURPOSE: Same as DRAW_RECT but expect pixel space coordinates from (0,0) to (1280,720)
PROC DRAW_RECT_PIXELS(INT CentreX, INT CentreY, INT Width, INT Height, INT R, INT G, INT B, INT A)
	Vector xy = CONVERT_PIXELS_TO_SCREENSPACE(CentreX,CentreY)
	Vector WH = CONVERT_PIXELS_TO_SCREENSPACE(Width,Height)
	DRAW_RECT(xy.x, xy.y, WH.x, WH.y, R, G, B, A)
ENDPROC

//INFO: 
//PARAM NOTES:
//PURPOSE: Same as DRAW_LINE_2D but expect pixel space coordinates from (0,0) to (1280,720)
PROC DRAW_LINE_2D_PIXELS(INT startX, INT startY, INT endX, INT endY, FLOAT fWidth, INT R, INT G, INT B, INT A)
	Vector startxy = CONVERT_PIXELS_TO_SCREENSPACE(TO_FLOAT(startX),TO_FLOAT(startY))
	VEctor endxy = CONVERT_PIXELS_TO_SCREENSPACE(TO_FLOAT(endX),TO_FLOAT(endY))
	DRAW_LINE_2D(startxy.x, startxy, endxy.x, endxy.y, fWidth, R, G, B, A)
ENDPROC

//INFO: 
//PARAM NOTES:
//PURPOSE: Same as DRAW_SPRITE but expect pixel space coordinates from (0,0) to (1280,720)
PROC DRAW_SPRITE_PIXELS(STRING pTextureDictionaryName, STRING pTextureName, FLOAT CentreX, FLOAT CentreY, FLOAT Width, FLOAT Height, FLOAT Rotation, INT R, INT G, INT B, INT A)
	Vector xy = CONVERT_PIXELS_TO_SCREENSPACE(CentreX,CentreY)
	Vector WH = CONVERT_PIXELS_TO_SCREENSPACE(Width,Height)
	DRAW_SPRITE(pTextureDictionaryName, pTextureName, xy.x, xy.y, WH.x, WH.y, Rotation, R, G, B, A)
ENDPROC

//INFO: 
//PARAM NOTES:
//PURPOSE: Same as DRAW_SPRITE_WITH_UV but expect pixel space coordinates from (0,0) to (1280,720)
PROC DRAW_SPRITE_WITH_UV_PIXELS(STRING pTextureDictionaryName, STRING pTextureName, FLOAT CentreX, FLOAT CentreY, FLOAT Width, FLOAT Height, FLOAT ux, FLOAT uy, FLOAT vx, FLOAT vy, FLOAT Rotation, INT R, INT G, INT B, INT A)
	Vector xy = CONVERT_PIXELS_TO_SCREENSPACE(CentreX,CentreY)
	Vector WH = CONVERT_PIXELS_TO_SCREENSPACE(Width,Height)
	DRAW_SPRITE_WITH_UV(pTextureDictionaryName, pTextureName, xy.x, xy.y, WH.x, WH.y, ux, uy, vx, vy, Rotation, R, G, B, A)
ENDPROC


NATIVE ENTITY_ICON_ID

/// PURPOSE: Adds a Icon over the entity
NATIVE FUNC ENTITY_ICON_ID ADD_ENTITY_ICON(ENTITY_INDEX entityID, STRING pTextureName) = "0x891f90fbec8d4e80"
NATIVE FUNC ENTITY_ICON_ID ADD_ENTITY_ICON_BY_VECTOR(FLOAT x, FLOAT y, FLOAT z, STRING pTextureName) = "0x66e6e8a87f7930f8"

/// PURPOSE: Removes a Icon over the entity
NATIVE PROC REMOVE_ENTITY_ICON(ENTITY_INDEX entityID) = "0x1566b7c398221a11"
NATIVE PROC REMOVE_ENTITY_ICON_ID(ENTITY_ICON_ID iconID) = "0xe0cfb5e0e7895cd5"

/// PURPOSE: Returns true if the entity has an icon
NATIVE FUNC BOOL DOES_ENTITY_HAVE_ICON(ENTITY_INDEX entityID) = "0xeae67965bd9cdee4"
NATIVE FUNC BOOL DOES_ENTITY_HAVE_ICON_ID(ENTITY_ICON_ID iconID) = "0xb2a003c2e11a9e88"

/// PURPOSE: Enables/disables the existing Icon (visible by default)
NATIVE PROC SET_ENTITY_ICON_VISIBILITY(ENTITY_INDEX entityID, BOOL visible) = "0x83dfb8c3b0b37aed"
NATIVE PROC SET_ENTITY_ICON_ID_VISIBILITY(ENTITY_ICON_ID iconID, BOOL visible) = "0x6df3413003ff3da7"

/// PURPOSE: Enables/disables the bg behind the icon Icon (invisible by default)
NATIVE PROC SET_ENTITY_ICON_BG_VISIBILITY(ENTITY_INDEX entityID, BOOL showBG) = "0xc21625745809ca2b"
NATIVE PROC SET_ENTITY_ICON_ID_BG_VISIBILITY(ENTITY_ICON_ID iconID, BOOL showBG) = "0x8db314f42db97e79"

/// PURPOSE: Keeps the icon at the edge of the screen if enabled (default), or hides the icon if offscreen when disabled
NATIVE PROC SET_USING_ENTITY_ICON_CLAMP(ENTITY_INDEX entityID, BOOL shouldClamp) = "0x77532268b7427c8a"
NATIVE PROC SET_USING_ENTITY_ICON_ID_CLAMP(ENTITY_ICON_ID iconID, BOOL shouldClamp) = "0x514e722d6e51faa5"

/// PURPOSE: Sets how many frames to render, use -1 to render indefinatly.
NATIVE PROC SET_ENTITY_ICON_RENDER_COUNT(ENTITY_INDEX entityID, INT renderCount) = "0x2c1e933b5fb524f6"
NATIVE PROC SET_ENTITY_ICON_ID_RENDER_COUNT(ENTITY_ICON_ID iconID, INT renderCount) = "0x5173f78cdf8e2862"

/// PURPOSE: The color of the entities' icon
NATIVE PROC SET_ENTITY_ICON_COLOR(ENTITY_INDEX entityID, INT r, INT g, INT b, INT a) = "0x43b60611864df57c"
NATIVE PROC SET_ENTITY_ICON_ID_COLOR(ENTITY_ICON_ID iconID, INT r, INT g, INT b, INT a) = "0x0356a169fcc09d6f"

/// PURPOSE: The color of the entities' bg
NATIVE PROC SET_ENTITY_ICON_BG_COLOR(ENTITY_INDEX entityID, INT r, INT g, INT b, INT a) = "0x3009156b653a7b48"
NATIVE PROC SET_ENTITY_ICON_ID_BG_COLOR(ENTITY_ICON_ID iconID, INT r, INT g, INT b, INT a) = "0x4e325f580a5ee789"

// PURPOSE: To set the text that goes with the icon.
// PARAMS: textLabel is expected to the label of the string.
NATIVE PROC SET_ENTITY_ICON_TEXT_LABEL(ENTITY_INDEX entityIcon, STRING textLabel) = "0xceafd9143eb64f81"
NATIVE PROC SET_ENTITY_ICON_ID_TEXT_LABEL(ENTITY_ICON_ID iconID, STRING textLabel) = "0x9263d0cd13a06144"


//PURPOSE: Call this with a 3d point in the world so that all subsequent sprites and text are relative to the screen coordinates for that point
NATIVE PROC SET_DRAW_ORIGIN(VECTOR vecOrigin, bool bIs2d = FALSE) = "0x691736a810da2bd4"

//PURPOSE: Call this once you have finished drawing sprites and text relative to a 3d world coordinate
NATIVE PROC CLEAR_DRAW_ORIGIN() = "0xccc0a2ef3dc76a34"


ENUM PHOTO_OPERATION_STATUS
	PHOTO_OPERATION_SUCCEEDED,
	PHOTO_OPERATION_IN_PROGRESS,
	PHOTO_OPERATION_FAILED
ENDENUM


//~>                        Mission Creator photo commands

//PURPOSE: Triggers the storing of a photo to a memory buffer. Once the photo has been taken, you can save it to associate with a mission created by the mission creator.
//RETURN: Returns FALSE if a memory buffer couldn't be allocated. You could try saving again the next frame.
NATIVE FUNC BOOL BEGIN_TAKE_MISSION_CREATOR_PHOTO() = "0xe8f09bbd8570fefe"

//PURPOSE: Call this after calling BEGIN_TAKE_MISSION_CREATOR_PHOTO to check when the operation has finished, and whether it succeeded.
NATIVE FUNC PHOTO_OPERATION_STATUS GET_STATUS_OF_TAKE_MISSION_CREATOR_PHOTO() = "0x3e6af29dc72ef814"

//PURPOSE: This frees the memory allocated by BEGIN_TAKE_MISSION_CREATOR_PHOTO. You can't save the photo after you've called FREE_MEMORY_FOR_MISSION_CREATOR_PHOTO
NATIVE PROC FREE_MEMORY_FOR_MISSION_CREATOR_PHOTO() = "0x5a55189d6e78d557"

//PURPOSE: Triggers the saving of a photo to associate with a mission created by the mission creator.
//			This can only be called after GET_STATUS_OF_TAKE_MISSION_CREATOR_PHOTO or GET_STATUS_OF_LOAD_MISSION_CREATOR_PHOTO has returned PHOTO_OPERATION_SUCCEEDED and before calling FREE_MEMORY_FOR_MISSION_CREATOR_PHOTO
//PARAM NOTES: Path and filename to save this photo as. The filename should be the unique Id of the UGC content for the newly created mission. Example - "GTA5/mission_photos/<unique id of UGC content>.jpeg"
//RETURN: TRUE if the photo save begins successfully, FALSE if there's a problem (possibly an earlier photo save is still in progress)
NATIVE FUNC BOOL SAVE_MISSION_CREATOR_PHOTO(STRING pFilename) = "0x6e5a895bcf63fe7b"

//PURPOSE: Returns the status of the last photo save to have been successfully started by SAVE_MISSION_CREATOR_PHOTO
//PARAM NOTES: Use the same path and filename as you did when you called SAVE_MISSION_CREATOR_PHOTO
NATIVE FUNC PHOTO_OPERATION_STATUS GET_STATUS_OF_SAVE_MISSION_CREATOR_PHOTO(STRING pFilename) = "0x2057f00e5903a713"

//PURPOSE: Instead of taking a new photo using BEGIN_TAKE_MISSION_CREATOR_PHOTO, you can load the photo for an existing mission using this command
//		Once GET_STATUS_OF_LOAD_MISSION_CREATOR_PHOTO has returned PHOTO_OPERATION_SUCCEEDED, you can save the photo to the cloud with a new name using SAVE_MISSION_CREATOR_PHOTO
//		Once you're finished with the photo, call FREE_MEMORY_FOR_MISSION_CREATOR_PHOTO
//PARAM NOTES: Path and filename to the existing photo on the cloud. The filename should be the unique Id of the UGC content for the existing mission. Example - "GTA5/mission_photos/<unique id of UGC content>.jpeg"
//RETURN: TRUE if the photo load begins successfully, FALSE if there's a problem (possibly an earlier photo load is still in progress)
NATIVE FUNC BOOL LOAD_MISSION_CREATOR_PHOTO(STRING szContentID, INT nFileID, INT nFileVersion, INT nLanguage) = "0x13741f716cad14a7"

//PURPOSE: Returns the status of the last photo load to have been successfully started by LOAD_MISSION_CREATOR_PHOTO
//PARAM NOTES: Use the same path and filename as you did when you called LOAD_MISSION_CREATOR_PHOTO
NATIVE FUNC PHOTO_OPERATION_STATUS GET_STATUS_OF_LOAD_MISSION_CREATOR_PHOTO(STRING szContentID) = "0x2afeb54f1e26c2ef"

//PURPOSE: Creates a copy of a photo taken with BEGIN_TAKE_MISSION_CREATOR_PHOTO so that it can be referenced by Scaleform
//	    This command can only be called if BEGIN_TAKE_MISSION_CREATOR_PHOTO has successfully completed and hasn't been release; 
//	    in other words, the valid time window to use this command is in between BEGIN_TAKE_MISSION_CREATOR_PHOTO and FREE_MEMORY_FOR_MISSION_CREATOR_PHOTO
//PARAM NOTES: 
NATIVE FUNC BOOL BEGIN_CREATE_MISSION_CREATOR_PHOTO_PREVIEW() = "0xae8a42aa357d2416"

//PURPOSE:  Returns the status of the request triggered by BEGIN_CREATE_MISSION_CREATOR_PHOTO_PREVIEW
//	    Once this preview is ready, it can be used by script or scaleform. Both the name of the TXD and the texture is always
//	    "MISSION_CREATOR_TEXTURE"
//PARAM NOTES: 
NATIVE FUNC PHOTO_OPERATION_STATUS GET_STATUS_OF_CREATE_MISSION_CREATOR_PHOTO_PREVIEW() = "0x34d987c578caba90"

//PURPOSE:  This frees the memory allocated by BEGIN_CREATE_MISSION_CREATOR_PHOTO_PREVIEW. This must be called when the photo preview is no longer needed and it's no longer being
//	    used by Scaleform
NATIVE PROC FREE_MEMORY_FOR_MISSION_CREATOR_PHOTO_PREVIEW() = "0x4bc56e6c59e88bee"


//~>                        Photo gallery commands

//PURPOSE: Triggers the storing of a photo to a memory buffer. Once the photo has been taken, you can upload it to the cloud. The photo gallery displays these photos.
//RETURN: Returns FALSE if a memory buffer couldn't be allocated. You could try saving again the next frame.
NATIVE FUNC BOOL BEGIN_TAKE_HIGH_QUALITY_PHOTO() = "0x1abcce88aeaa76d9"

//PURPOSE: Call this after calling BEGIN_TAKE_HIGH_QUALITY_PHOTO to check when the operation has finished, and whether it succeeded.
NATIVE FUNC PHOTO_OPERATION_STATUS GET_STATUS_OF_TAKE_HIGH_QUALITY_PHOTO() = "0x6fb6030525709933"

//PURPOSE: This frees the memory allocated by BEGIN_TAKE_HIGH_QUALITY_PHOTO. You can't save or create a low quality copy of the photo after you've called FREE_MEMORY_FOR_HIGH_QUALITY_PHOTO
NATIVE PROC FREE_MEMORY_FOR_HIGH_QUALITY_PHOTO() = "0xee35b1932ee60b67"

//PURPOSE: Call this between taking a photo and saving it if you want the photo to be flagged as a mugshot
NATIVE PROC SET_TAKEN_PHOTO_IS_MUGSHOT(BOOL bIsMugshot) = "0xf61ced31c635227b"

//PURPOSE: Call this command if the photo has been taken while the player is in an Arena in Multiplayer
// It should be called just before SAVE_HIGH_QUALITY_PHOTO (after the photo has been taken)
NATIVE PROC SET_ARENA_THEME_AND_VARIATION_FOR_TAKEN_PHOTO(INT arenaTheme, INT arenaVariation) = "0x98b584f08145d31e"

//PURPOSE: Call this command if the photo has been taken while the player is on the Heist Island
// It should be called just before SAVE_HIGH_QUALITY_PHOTO (after the photo has been taken)
NATIVE PROC SET_ON_ISLAND_X_FOR_TAKEN_PHOTO(BOOL bOnIslandX) = "0x850af55dd4cd20ec"

//PURPOSE: Triggers the saving of a photo into the specified slot in the photo gallery.
//			This can only be called after GET_STATUS_OF_TAKE_HIGH_QUALITY_PHOTO has returned PHOTO_OPERATION_SUCCEEDED and before calling FREE_MEMORY_FOR_HIGH_QUALITY_PHOTO
//PARAM NOTES: Slot within photo gallery (0 to 19 (inclusive))
//RETURN: TRUE if the photo save begins successfully, FALSE if there's a problem (possibly PhotoSlotIndex is out of range or an earlier photo save is still in progress)
NATIVE FUNC BOOL SAVE_HIGH_QUALITY_PHOTO(INT PhotoSlotIndex) = "0x4a486319fee2fc38"

//PURPOSE: Returns the status of the last photo save to have been successfully started
NATIVE FUNC PHOTO_OPERATION_STATUS GET_STATUS_OF_SAVE_HIGH_QUALITY_PHOTO() = "0x8e8fe906d8bac5f7"

//PURPOSE: Triggers the uploading of a mugshot photo to the member space on the cloud.
//			This can only be called after GET_STATUS_OF_TAKE_HIGH_QUALITY_PHOTO has returned PHOTO_OPERATION_SUCCEEDED and before calling FREE_MEMORY_FOR_HIGH_QUALITY_PHOTO
//PARAM NOTES: MultiplayerCharacterIndex - a number between 0 and 4 (currently the game only uses 0 and 1)
//RETURN: TRUE if the upload begins successfully, FALSE if there was a problem (possibly an earlier mugshot upload is still in progress)
NATIVE FUNC BOOL UPLOAD_MUGSHOT_PHOTO(INT MultiplayerCharacterIndex) = "0x159f9df48982f08a"

//PURPOSE: Returns the status of the last mugshot upload to have been successfully started
//PARAM NOTES: MultiplayerCharacterIndex - a number between 0 and 4 (currently the game only uses 0 and 1)
NATIVE FUNC PHOTO_OPERATION_STATUS GET_STATUS_OF_UPLOAD_MUGSHOT_PHOTO(INT MultiplayerCharacterIndex) = "0xca2ba27b5c4b31c9"

ENUM eLowQualityPhotoSetting
	LOW_QUALITY_PHOTO_ONE,
	LOW_QUALITY_PHOTO_HALF,
	LOW_QUALITY_PHOTO_QUARTER,
	LOW_QUALITY_PHOTO_EIGHTH
ENDENUM

//PURPOSE: Creates a low quality version of the current high quality photo. The low quality version can be displayed on the phone.
//			This can only be called after GET_STATUS_OF_TAKE_HIGH_QUALITY_PHOTO has returned PHOTO_OPERATION_SUCCEEDED and before calling FREE_MEMORY_FOR_HIGH_QUALITY_PHOTO
//RETURN: FALSE if there is no high quality photo to copy
NATIVE FUNC BOOL BEGIN_CREATE_LOW_QUALITY_COPY_OF_PHOTO(eLowQualityPhotoSetting qualitySetting) = "0x91e8216f9ce58f7e"

//PURPOSE: Call this after calling BEGIN_CREATE_LOW_QUALITY_COPY_OF_PHOTO to check when the operation has finished, and whether it succeeded. The operation might fail if it can't allocate memory for the copy.
NATIVE FUNC PHOTO_OPERATION_STATUS GET_STATUS_OF_CREATE_LOW_QUALITY_COPY_OF_PHOTO(eLowQualityPhotoSetting qualitySetting) = "0xefac41d453b8fa2b"

//PURPOSE: Call this once you're finished with the low quality copy of the photo. You can't call DRAW_LOW_QUALITY_PHOTO_TO_PHONE after calling FREE_MEMORY_FOR_LOW_QUALITY_PHOTO
NATIVE PROC FREE_MEMORY_FOR_LOW_QUALITY_PHOTO() = "0x2cf943308fefb496"

ENUM ePhotoRotation
	PHOTO_NO_ROTATION = 0,
	PHOTO_CLOCKWISE,
	PHOTO_ANTI_CLOCKWISE,
	PHOTO_MAX_ROTATIONS
ENDENUM

//PURPOSE: Call this to draw the low quality copy of the photo to the phone. 
//			You can only call this after GET_STATUS_OF_CREATE_LOW_QUALITY_COPY_OF_PHOTO has returned PHOTO_OPERATION_SUCCEEDED. You can't call this after calling FREE_MEMORY_FOR_LOW_QUALITY_PHOTO
//			Call with FALSE to stop drawing the photo
NATIVE PROC DRAW_LOW_QUALITY_PHOTO_TO_PHONE(BOOL bDraw, ePhotoRotation PhotoRotation = PHOTO_NO_ROTATION) = "0x3de812d5be11533e"



NATIVE FUNC INT GET_MAXIMUM_NUMBER_OF_PHOTOS() = "0x4f09a12ba1b81917"

NATIVE FUNC INT GET_MAXIMUM_NUMBER_OF_CLOUD_PHOTOS() = "0x468404757b8a82c2"

//PURPOSE: Returns the current number of photos on the cloud. You can only call this after GET_STATUS_OF_SORTED_LIST_OPERATION has returned PHOTO_OPERATION_SUCCEEDED.
NATIVE FUNC INT GET_CURRENT_NUMBER_OF_CLOUD_PHOTOS() = "0x08b0ce958e38ac0d"

NATIVE FUNC BOOL QUEUE_OPERATION_TO_CREATE_SORTED_LIST_OF_PHOTOS(BOOL bScanForSaving) = "0x04b354be7e7b0632"

NATIVE FUNC PHOTO_OPERATION_STATUS GET_STATUS_OF_SORTED_LIST_OPERATION(BOOL bScanForSaving) = "0x78bb5808602d08aa"

NATIVE PROC CLEAR_STATUS_OF_SORTED_LIST_OPERATION() = "0xb74730632fb72ae5"

NATIVE FUNC BOOL DOES_THIS_PHOTO_SLOT_CONTAIN_A_VALID_PHOTO(INT PhotoSlotIndex) = "0x55518ee41f8109f8"

NATIVE FUNC INT GET_SLOT_FOR_SAVING_A_PHOTO_TO() = "0x9d3ef24ae103677c"


//PURPOSE: Triggers the loading of a photo into the specified slot in the photo gallery
//PARAM NOTES: Slot within photo gallery. The first slot is 0. To get the final slot index, subtract one from the number returned by GET_MAXIMUM_NUMBER_OF_PHOTOS()
//RETURN: TRUE if the photo load begins successfully, FALSE if there's a problem (possibly PhotoSlotIndex is out of range or an earlier photo load is still in progress)
NATIVE FUNC BOOL LOAD_HIGH_QUALITY_PHOTO(INT PhotoSlotIndex) = "0xce97a2ca705c4bf0"

//PURPOSE: Returns the status of the last photo load to have been successfully started
NATIVE FUNC PHOTO_OPERATION_STATUS GET_LOAD_HIGH_QUALITY_PHOTO_STATUS(INT PhotoSlotIndex) = "0xa2702a84c74e8980"


//~>                        Movie commands

//~>                        New movie commands

//INFO: To display the movie, call PLAY_BINK_MOVIE every frame. Once you've finished with the movie, call RELEASE_BINK_MOVIE to free the memory.
//PARAM NOTES:
//PURPOSE: Allocates memory and loads the specified movie file.More info..
NATIVE FUNC BINK_MOVIE_ID SET_BINK_MOVIE(STRING MovieName) = "0x16cfd341bcf2f070"

//PURPOSE: Plays a loaded movie
NATIVE PROC PLAY_BINK_MOVIE(BINK_MOVIE_ID MovieId) = "0xe178310643033958"

//PURPOSE: Stops a movie playing
NATIVE PROC STOP_BINK_MOVIE(BINK_MOVIE_ID MovieId) = "0x58b01bea756fa105"

//INFO: This command should be called when you are finished with a movie. It frees up the memory allocated by SET_BINK_MOVIE.
//PARAM NOTES:
//PURPOSE: Frees the memory allocated to the movie. More info
NATIVE PROC RELEASE_BINK_MOVIE(BINK_MOVIE_ID MovieId) = "0xf3440233f7d3e150"

//INFO: Before you can use this command you have to load the movie using SET_BINK_MOVIE. 
//PARAM NOTES: CentreX and CentreY define the centre point of the movie. between 0 (top left) and 1 (bottom right) 
//                          RGBA set between 0 and 255
//                          Rotataion : Rotation is measured in degrees. 
//PURPOSE: Draws a movie to the screen. More info..
NATIVE PROC DRAW_BINK_MOVIE(BINK_MOVIE_ID MovieId, FLOAT CentreX, FLOAT CentreY, FLOAT Width, FLOAT Height, FLOAT Rotation, INT R, INT G, INT B, INT A) = "0xfc36643f7a64338f"

//PURPOSE: Sets the time of the current movie.
NATIVE PROC SET_BINK_MOVIE_TIME(BINK_MOVIE_ID MovieId, FLOAT fMovieTime) = "0x46f131f72f3d182e"

//PURPOSE: Gets the time of the current movie.
NATIVE FUNC FLOAT GET_BINK_MOVIE_TIME(BINK_MOVIE_ID MovieId) = "0x9612d31e71756fbe"

//PURPOSE: Sets the volume of the movie audio
NATIVE PROC SET_BINK_MOVIE_VOLUME(BINK_MOVIE_ID MovieId, FLOAT fMovieVolume) = "0x6363ada3404d08c8"

//PURPOSE: Attach the audio from the specific bink movie to the specified game entity
NATIVE PROC ATTACH_BINK_AUDIO_TO_ENTITY(BINK_MOVIE_ID MovieId, ENTITY_INDEX entity) = "0xcabcbda01251c6d1"

//PURPOSE: Attach the audio from the TV to the specified game entity
NATIVE PROC ATTACH_TV_AUDIO_TO_ENTITY(ENTITY_INDEX entity) = "0x681f73673fd212dc"

// PURPOSE: Control whether or not the audio for the specified bink movie is played frontend (rather than in-world)
NATIVE PROC SET_BINK_MOVIE_AUDIO_FRONTEND(BINK_MOVIE_ID MovieId, BOOL frontend) = "0x77e1f82f6bd9fe11"

// PURPOSE: Control whether or not the audio for the TV is played frontend (rather than in-world)
NATIVE PROC SET_TV_AUDIO_FRONTEND(BOOL frontend) = "0xc4a210006ff80dea"

// PURPOSE: Control wether bink movies should skip frames to catch up with audio or not
NATIVE PROC SET_BINK_SHOULD_SKIP(BINK_MOVIE_ID MovieId, BOOL shouldSkip) = "0x01a548d39da6ccdb"

//~>                        End of new movie commands


//INFO: 
//PARAM NOTES: setName is the name of the XML file without the extension
//PURPOSE: Loads a movie mesh set from xml file and returns a handle for the set (MOVIE_MESH_SET_ID)
NATIVE FUNC MOVIE_MESH_SET_ID LOAD_MOVIE_MESH_SET(STRING setName) = "0xfd6cee56513203fb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Releases a mesh set
NATIVE PROC RELEASE_MOVIE_MESH_SET(MOVIE_MESH_SET_ID id) = "0x553c3a3b08976718"

//INFO: 
//PARAM NOTES:
//PURPOSE: Queries the state of a mesh set
NATIVE FUNC MOVIEMESHSETSTATE QUERY_MOVIE_MESH_SET_STATE(MOVIE_MESH_SET_ID id) = "0x1d4a4f0e81be4f45"


//~>                        Screen commands

//INFO: 
//PARAM NOTES:
// PURPOSE: Returns the screen resolution - 720p
// NOTE: *** THIS WILL ALWAYS RETURN 1280x720 REGARDLESS OF THE REAL RESOLUTION THE GAME IS RUNNING AT ***
NATIVE PROC GET_SCREEN_RESOLUTION(INT &X, INT &Y) = "0xbe74ec1cd33d16ea"


//INFO: 
//PARAM NOTES:
// PURPOSE: Returns the screen actual screen resolution
NATIVE PROC GET_ACTUAL_SCREEN_RESOLUTION(INT &X, INT &Y) = "0x604161eb05f29e6d"

//INFO: DEPRECATED
//PARAM NOTES: DEPRECATED
// PURPOSE: DEPRECATED
NATIVE FUNC FLOAT GET_SCREEN_ASPECT_RATIO() = "0x7cd5a6ca6f7b706d"

//INFO: Returns the aspect ratio of game
//PARAM NOTES: Passing in true will return the physical aspect ratio of the game window (Useful for 3x1 modes). False will
// return whatever the main game window aspect is. This takes into account custom overrides from the settings menu.
// PURPOSE: Returns the aspect ratio for the game
NATIVE FUNC FLOAT GET_ASPECT_RATIO(BOOL physicalAspect) = "0xf4cc509eeb975296"

//INFO:
//PARAM NOTES:
// PURPOSE: Returns the viewport aspect ratio
NATIVE FUNC FLOAT GET_VIEWPORT_ASPECT_RATIO() = "0xd54d1fc5a8ffa88c"

//INFO: 
//PARAM NOTES:
// PURPOSE: Returns if running widescreen
NATIVE FUNC BOOL GET_IS_WIDESCREEN() = "0xd87c62fa7e75d2c5"

//INFO: 
//PARAM NOTES:
// PURPOSE: Returns if running in hidef
NATIVE FUNC BOOL GET_IS_HIDEF() = "0x627df494e847af05"

//INFO:
//PARAM NOTES:
// PURPOSE: Tells code to treat the next drawn Scaleform movie position and size values as normalized 16:9
NATIVE PROC ADJUST_NEXT_POS_SIZE_AS_NORMALIZED_16_9() = "0x78bb023d65c925c4"

//INFO: 
//PARAM NOTES:
// PURPOSE: Force the loading screen on/off regardless of fade value
NATIVE PROC DISPLAY_LOADING_SCREEN_NOW(BOOL onOff) = "0x929f64a7cc0a4ea6"

//INFO: 
//PARAM NOTES:
// PURPOSE: Turn night vission effect on/off
NATIVE PROC SET_NIGHTVISION(BOOL onOff) = "0xcf840ee47fd445aa"

//INFO: 
//PARAM NOTES:
// PURPOSE: Get whether nightvision is on/off
NATIVE FUNC BOOL GET_REQUESTINGNIGHTVISION() = "0x333c7ed850043727"

//INFO: 
//PARAM NOTES:
// PURPOSE: Get whether nightvision is on/off
NATIVE FUNC BOOL GET_USINGNIGHTVISION() = "0xbf97536eedb58cbd"

//INFO: 
//PARAM NOTES:
// PURPOSE: Turn exposure tweak effect on/off
NATIVE PROC SET_EXPOSURETWEAK(BOOL onOff) = "0x05bad514d7c46d83"

//INFO:
//PARAM NOTES:
// PURPOSE: Forces exposure readback to be available on CPU. Use to fix exposure problems on SLI/Crossfire.
NATIVE PROC FORCE_EXPOSURE_READBACK(BOOL onOff) = "0x5355f8db86bc529f"

//INFO: 
//PARAM NOTES:
// PURPOSE: Overrides range (radius) of night vision light, set it to -1 to switch to default range
NATIVE PROC OVERRIDE_NIGHTVISION_LIGHT_RANGE(FLOAT range) = "0xf22bd86fc9446ba0"

//INFO: 
//PARAM NOTES:
// PURPOSE: Get whether exposure tweak is on/off
NATIVE FUNC BOOL GET_USINGEXPOSURETWEAK() = "0x0d2cba1646c42532"


//INFO: 
//PARAM NOTES:
// PURPOSE: Turn see through effect on/off
NATIVE PROC SET_SEETHROUGH(BOOL onOff) = "0xc2c3885d7793a4ef"

//INFO: 
//PARAM NOTES:
// PURPOSE: Get whether seethrough is on/off
NATIVE FUNC BOOL GET_USINGSEETHROUGH() = "0x5e1bcdaabf4860d5"

//INFO: 
//PARAM NOTES:
// PURPOSE: SeeThrough Effect : Reset effect parameters to the default
NATIVE PROC SEETHROUGH_RESET() = "0xc263729724de98ba"

//INFO: 
//PARAM NOTES:
// PURPOSE: SeeThrough Effect : Get the distance at which visible objects will start fading out
NATIVE FUNC FLOAT SEETHROUGH_GET_FADE_STARTDISTANCE() = "0x63f2bfd6a0317fd0"

//INFO: 
//PARAM NOTES:
// PURPOSE: SeeThrough Effect : Set the distance at which visible objects will start fading out
NATIVE PROC SEETHROUGH_SET_FADE_STARTDISTANCE(FLOAT param) = "0x2296de766d9d8387"

//INFO: 
//PARAM NOTES:
// PURPOSE: SeeThrough Effect : Get the distance at which visible objects will be fully faded out
NATIVE FUNC FLOAT SEETHROUGH_GET_FADE_ENDDISTANCE() = "0x91ac7b68d65ee60c"

//INFO: 
//PARAM NOTES:
// PURPOSE: SeeThrough Effect : Set the distance at which visible objects will be fully faded out 
NATIVE PROC SEETHROUGH_SET_FADE_ENDDISTANCE(FLOAT param) = "0x3bd51a2b99889304"

//INFO: 
//PARAM NOTES:
// PURPOSE: SeeThrough Effect : Get the thickness behind which objects will stop being visible
NATIVE FUNC FLOAT SEETHROUGH_GET_MAX_THICKNESS() = "0x030ed7e4898b79a5"

//INFO: 
//PARAM NOTES:
// PURPOSE: SeeThrough Effect : Set the thickness behind which objects will stop being visible
NATIVE PROC SEETHROUGH_SET_MAX_THICKNESS(FLOAT param) = "0x4d784d143adfe4c3"

//INFO: 
//PARAM NOTES:
// PURPOSE: SeeThrough Effect : Get the minimum amount of image noise
NATIVE FUNC FLOAT SEETHROUGH_GET_NOISE_MIN() = "0x1e720916dbd74d27"

//INFO: 
//PARAM NOTES:
// PURPOSE: SeeThrough Effect : Set the minimum amount of image noise
NATIVE PROC SEETHROUGH_SET_NOISE_MIN(FLOAT param) = "0x92b2207101ebf827"

//INFO: 
//PARAM NOTES:
// PURPOSE: SeeThrough Effect : Get the maximum amount of image noise
NATIVE FUNC FLOAT SEETHROUGH_GET_NOISE_MAX() = "0xd2992d13b8613bc3"

//INFO: 
//PARAM NOTES:
// PURPOSE: SeeThrough Effect : Set the maximum amount of image noise
NATIVE PROC SEETHROUGH_SET_NOISE_MAX(FLOAT param) = "0xf1ffeab20bc7e3e5"

//INFO: 
//PARAM NOTES:
// PURPOSE: SeeThrough Effect : Get the intensity of the highlights
NATIVE FUNC FLOAT SEETHROUGH_GET_HILIGHT_INTENSITY() = "0xe890390a2cd6df33"

//INFO: 
//PARAM NOTES:
// PURPOSE: SeeThrough Effect : Set the intensity of the highlights 
NATIVE PROC SEETHROUGH_SET_HILIGHT_INTENSITY(FLOAT param) = "0x66a5000c47e6fe05"

//INFO: 
//PARAM NOTES:
// PURPOSE: SeeThrough Effect : Get the amount of image noise added to the highlights
NATIVE FUNC FLOAT SEETHROUGH_GET_HILIGHT_NOISE() = "0x5a285b6f53d8b1e4"

//INFO: 
//PARAM NOTES:
// PURPOSE: SeeThrough Effect : Set the amount of image noise added to the highlights
NATIVE PROC SEETHROUGH_SET_HIGHLIGHT_NOISE(FLOAT param) = "0xe69023bddb6ee5db"

//INFO: 
//PARAM NOTES: scale goes from 0 (cold) to 1 (hot)
// PURPOSE: SeeThrough Effect : Get the amount of heat emitted for a thermal type.
NATIVE FUNC FLOAT SEETHROUGH_GET_HEATSCALE(THERMALBEHAVIOUR type) = "0x324e821f2e2b9db8"

//INFO: 
//PARAM NOTES: scale goes from 0 (cold) to 1 (hot)
// PURPOSE: SeeThrough Effect : Set the amount of heat emitted for a thermal type.
NATIVE PROC SEETHROUGH_SET_HEATSCALE(THERMALBEHAVIOUR type, FLOAT param) = "0x8d7262898e790499"

//INFO: 
//PARAM NOTES: 
// PURPOSE: SeeThrough Effect : Set the near object colors
NATIVE PROC SEETHROUGH_SET_COLOR_NEAR(INT r, INT g, INT b) = "0x592376d5f4bcef69"

//INFO: 
//PARAM NOTES: 
// PURPOSE: SeeThrough Effect : Get the near object colors
NATIVE PROC SEETHROUGH_GET_COLOR_NEAR(INT &r, INT &g, INT &b) = "0x3b92266f84cad8bf"

//INFO: 
//PARAM NOTES: 
// PURPOSE: SeeThrough Effect : Set the far object colors
NATIVE PROC SEETHROUGH_SET_COLOR_FAR(INT r, INT g, INT b) = "0xa90f752e58b4cb6b"

//INFO: 
//PARAM NOTES: 
// PURPOSE: SeeThrough Effect : Get the far object colors
NATIVE PROC SEETHROUGH_GET_COLOR_FAR(INT &r, INT &g, INT &b) = "0x52d8d306e0040d8d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Overrides the previous matrix for motion blur to allow priming the velocity
//	   before the blur effect starts
NATIVE PROC SET_MOTIONBLUR_MATRIX_OVERRIDE(VECTOR VecWorldPos, VECTOR VecRot,  EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0x29c72d9959d55fb6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Overrides the maximum velocity allowed for motion blur
NATIVE PROC SET_MOTIONBLUR_MAX_VEL_SCALER(FLOAT scaler) = "0x8463d4cc9d93c39f"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC FLOAT GET_MOTIONBLUR_MAX_VEL_SCALER() = "0x32f13bf158097204"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_FORCE_MOTIONBLUR(BOOL bForce) = "0x6286a24142b5ae12"

//INFO: 
//PARAM NOTES: TRUE - enable; FALSE - disable
//PURPOSE: 	
NATIVE PROC TOGGLE_PLAYER_DAMAGE_OVERLAY(BOOL bEnable) = "0xb777f991c6cf7d90"
	
//INFO: 
//PARAM NOTES:
// PURPOSE: Turn noise overide on/off
NATIVE PROC SET_NOISEOVERIDE(BOOL onOff) = "0xbcedf4ba5f5614d0"

//INFO: Won't do anything unless noise overide has been turned on : SET_NOISEOVERIDE(TRUE).
//PARAM NOTES: FLOAT value - goes from 0 (no noise) to whatever your eyes can take.
// PURPOSE: Set the amount of noise filter applied.
NATIVE PROC SET_NOISINESSOVERIDE(FLOAT value) = "0xd3bc305b83f12eb7"

//INFO: 
//PARAM NOTES:
// PURPOSE: Returns a valid point on screen, if either x or y is invalid, this will return false and -1.0 for x and y.
NATIVE FUNC BOOL GET_SCREEN_COORD_FROM_WORLD_COORD(VECTOR vWorldPos, float &fXpos, float  &Ypos  ) = "0xf00526c1598a6868"

//INFO: 
//PARAM NOTES:
// PURPOSE: returns the resolution of a texture
NATIVE FUNC VECTOR GET_TEXTURE_RESOLUTION(STRING pTextureDictionaryName, STRING pTextureName) = "0x7df13542ada68880"

//INFO: 
//PARAM NOTES:
// PURPOSE: overrides ped's crew logo with given texture taken from given texture dictionary
NATIVE FUNC BOOL OVERRIDE_PED_CREW_LOGO_TEXTURE(PED_INDEX Ped, STRING pTextureDictionaryName, STRING pTextureName) = "0x88ab66f9e33da3b3"

//INFO: 
//PARAM NOTES:
// PURPOSE: overrides strength of distance blur (i.e. simple DOF) for a frame (keep calling every frame you wish to override the strength)
NATIVE PROC SET_DISTANCE_BLUR_STRENGTH_OVERRIDE(FLOAT param) = "0xb27951eaa6bc6646"

//INFO: 
//PARAM NOTES: MinExposure       minimum exposure to add to current exposure, can be zero, will be applied during the entire flash effect.
//             MaxExposure       maximum exposure to add to current exposure, will ramp up/down to/from this value, this will be the value added during the hold phase.
//             rampUpDuration    time, in milliseconds to ramp up from MinExposure to MaxExposure
//             holdDuration      time, in milliseconds to to hold at MaxExposure
//             rampDownDuration  time, in milliseconds to ramp down from MaxExposure to MinExposure
// PURPOSE: Trigger a one-off screen flash
NATIVE PROC SET_FLASH(FLOAT MinExposure, FLOAT fMaxExposure, INT rampUpDuration, INT rampDownDuration, INT holdDuration) = "0xd0447e81eab7b4ac"

//~>                        Visibility tracking

//INFO: 
//PARAM NOTES:
// PURPOSE: Create a new tracked point, return 0 if none where available
NATIVE FUNC INT CREATE_TRACKED_POINT() = "0x7f462558c0a3be7d"

//INFO: 
//PARAM NOTES:
// PURPOSE: Set position and radius information for a previously created tracked point.
NATIVE PROC SET_TRACKED_POINT_INFO(INT queryIdx, VECTOR center, float radius) = "0xf3ac30dd9b660e10"

//INFO: 
//PARAM NOTES: 
// PURPOSE: Query the visibility state of a previously created tracked point
NATIVE FUNC BOOL IS_TRACKED_POINT_VISIBLE(INT queryIdx) = "0x0112bd5cb0c9e9ff"

//INFO: 
//PARAM NOTES: 
// PURPOSE: Destry a previously created tracked point
NATIVE PROC DESTROY_TRACKED_POINT(INT queryIdx) = "0x499b2a8ebb5d097a"

//~>                        Procedural Grass

//INFO: 
//PARAM NOTES:
// PURPOSE: Adds a dynamic culling sphere to reject procedural grass. Upon success, returns index/handle to new cull sphere.
NATIVE FUNC GRASS_CULL_SPHERE_HANDLE SET_GRASS_CULL_SPHERE(VECTOR center, float radius) = "0x79130f25a78a7d4b"

//INFO: 
//PARAM NOTES:
// PURPOSE: Removes a dynamic culling sphere previously added by SET_GRASS_CULL_SPHERE. Please make sure your cull sphere handle is valid.
NATIVE PROC REMOVE_GRASS_CULL_SPHERE(GRASS_CULL_SPHERE_HANDLE handle) = "0x697ba066ff659189"

//INFO: 
//PARAM NOTES:
// PURPOSE: Resets all the dynamic culling spheres, making them all inactive. (Useful for restarting)
NATIVE PROC RESET_GRASS_CULL_SPHERES() = "0x666d3c434bb420a2"

//INFO: 
//PARAM NOTES:
// PURPOSE: Enables global culling sphere to reject procedural grass and procedural objects
NATIVE PROC PROCGRASS_ENABLE_CULLSPHERE(INT id, VECTOR center, float radius) = "0x2d32f9771ed0a4e0"

//INFO: 
//PARAM NOTES:
// PURPOSE: Disables global culling sphere to reject procedural grass and procedural objects
NATIVE PROC PROCGRASS_DISABLE_CULLSPHERE(INT idx) = "0x3c2bd77477290272"

//INFO: 
//PARAM NOTES:
// PURPOSE: Returns status (enabled or disabled) of global culling sphere 
NATIVE FUNC BOOL PROCGRASS_IS_CULLSPHERE_ENABLED(INT idx) = "0x7b6e209afa2c80cb"

//INFO: 
//PARAM NOTES:
// PURPOSE: Enables ambient scale scans for proc grass (default)
NATIVE PROC PROCGRASS_ENABLE_AMBSCALESCAN() = "0xcb726669fdd0208f"

//INFO: 
//PARAM NOTES:
// PURPOSE: Enables ambient scale scans for proc grass (used for perf reasons only)
NATIVE PROC PROCGRASS_DISABLE_AMBSCALESCAN() = "0x6da72c1f117f2765"

//INFO: 
//PARAM NOTES:
// PURPOSE: Disables procedural objects creation
NATIVE PROC DISABLE_PROCOBJ_CREATION() = "0xb874e508e1e4a55c"

//INFO: 
//PARAM NOTES:
// PURPOSE: Enables procedural objects creation
NATIVE PROC ENABLE_PROCOBJ_CREATION() = "0xc2bbfcd4bb68ff42"

//INFO: 
//PARAM NOTES:
// PURPOSE: Flattens Grass Batches
NATIVE PROC GRASSBATCH_ENABLE_FLATTENING_EXT_IN_AABB(VECTOR boxMin, VECTOR boxMax, VECTOR lookVec, FLOAT groundZ) = "0x17cf30a587de1a15"

//INFO: 
//PARAM NOTES:
// PURPOSE: Flattens Grass Batches
NATIVE PROC GRASSBATCH_ENABLE_FLATTENING_IN_AABB(VECTOR boxMin, VECTOR boxMax, VECTOR lookVec) = "0x2b2d79772634f41f"

//INFO: 
//PARAM NOTES:
// PURPOSE: Flattens Grass Batches
NATIVE PROC GRASSBATCH_ENABLE_FLATTENING_EXT_IN_SPHERE(VECTOR center, float radius, VECTOR lookVec, FLOAT groundZ) = "0xf514f657049f7b67"

//INFO: 
//PARAM NOTES:
// PURPOSE: Flattens Grass Batches
NATIVE PROC GRASSBATCH_ENABLE_FLATTENING_IN_SPHERE(VECTOR center, float radius, VECTOR lookVec) = "0x265b9a7b2c12c3f5"

//INFO: 
//PARAM NOTES:
// PURPOSE: Enables procedural objects creation
NATIVE PROC GRASSBATCH_DISABLE_FLATTENING() = "0xb4d34677ca14a5df"


//~>                        Shadows

//INFO: 
//PARAM NOTES:
// PURPOSE: Call this command at the end of cutscenes to reset the effect of any calls to CASCADE_SHADOWS_xxx script commands
NATIVE PROC CASCADE_SHADOWS_INIT_SESSION() = "0xa91ec7d49df9f229"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to explicitly set a cascade bounds in worldspace - typically get these from rag "Cascade Shadows/Cascade Bounds Adjust (Mouse Track)"
NATIVE PROC CASCADE_SHADOWS_SET_CASCADE_BOUNDS(INT cascadeIndex, BOOL bEnabled, FLOAT x, FLOAT y, FLOAT z, FLOAT radiusScale, BOOL interpolateToDisabled = FALSE, FLOAT interpolationTime = 0.0 ) = "0x20f5f3ad1f7ec238"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to enable or disable the bounds snapping for cascade shadows - this will eliminate shadow shimmering if the sun movement is also stopped, otherwise it will make it much worse
NATIVE PROC CASCADE_SHADOWS_SET_CASCADE_BOUNDS_SNAP(BOOL bEnable) = "0x238d1893aec39778"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to set the min horizontal FOV for computing cascade bounds - this is required in cutscenes to stop shadow shimmering during smooth FOV changes
NATIVE PROC CASCADE_SHADOWS_SET_CASCADE_BOUNDS_HFOV(FLOAT degrees) = "0x8055ca555061be84"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to set the min vertical FOV for computing cascade bounds - this is required in cutscenes to stop shadow shimmering during smooth FOV changes
NATIVE PROC CASCADE_SHADOWS_SET_CASCADE_BOUNDS_VFOV(FLOAT degrees) = "0x57b8d42b1706a4d5"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to scale the cascade sizes/distances
NATIVE PROC CASCADE_SHADOWS_SET_CASCADE_BOUNDS_SCALE(FLOAT scale) = "0x51c7ea47553be792"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to scale the entity tracker sphere radius
NATIVE PROC CASCADE_SHADOWS_SET_ENTITY_TRACKER_SCALE(FLOAT scale) = "0xd9afa1773b20f447"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to change the distibution of the cascades 0 - cascades are split evenly to 1 - cascades are split very close to the camera. Set it to -1. to reset to default
NATIVE PROC CASCADE_SHADOWS_SET_SPLIT_Z_EXP_WEIGHT(FLOAT scale) = "0x77305a4e1c762ab8"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to change the cascade bound position . Set it to 0.0 to reset to default
NATIVE PROC CASCADE_SHADOWS_SET_BOUND_POSITION(FLOAT dist) = "0xc7f7a759dbce7eb1"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to enable or disable the entity tracer which puts the first cascade at the players position.
NATIVE PROC CASCADE_SHADOWS_ENABLE_ENTITY_TRACKER(BOOL scale) = "0x398cfb3534ff01fd"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to enable or disable the screen size check used when visibility testing entities for cascaded shadows
NATIVE PROC CASCADE_SHADOWS_SET_SCREEN_SIZE_CHECK_ENABLED(BOOL bEnable) = "0x4ca71976d9ef25d0"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to enable or disable the world height update - probably don't need to use this
NATIVE PROC CASCADE_SHADOWS_SET_WORLD_HEIGHT_UPDATE(BOOL bEnable) = "0xdd7559643235238e"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to explicitly set the world height for shadows - this may increase quality slightly, but will cause shadows to disappear if set incorrectly
NATIVE PROC CASCADE_SHADOWS_SET_WORLD_HEIGHT_MINMAX(FLOAT h0, FLOAT h1) = "0x0af775dddcad506a"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to enable or disable the receiver height update - probably don't need to use this
NATIVE PROC CASCADE_SHADOWS_SET_RECEIVER_HEIGHT_UPDATE(BOOL bEnable) = "0x7e7c6e995abff4d8"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to explicitly set the receiver height for shadows - this may increase performance slightly, but will cause shadows to disappear if set incorrectly
NATIVE PROC CASCADE_SHADOWS_SET_RECEIVER_HEIGHT_MINMAX(FLOAT h0, FLOAT h1) = "0xc829526cc8e2af9f"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to change the cascade shadows dither radius scaling factor (default is 1)
NATIVE PROC CASCADE_SHADOWS_SET_DITHER_RADIUS_SCALE(FLOAT scale) = "0x36e6bd43d2b90b27"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to override the cascade shadows depth bias (default is currently 0.01, but may change)
NATIVE PROC CASCADE_SHADOWS_SET_DEPTH_BIAS(BOOL bEnable, FLOAT depthBias) = "0x0b6506333d74c390"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to override the cascade shadows slope bias (default is currently 1.0, but may change)
NATIVE PROC CASCADE_SHADOWS_SET_SLOPE_BIAS(BOOL bEnable, FLOAT slopeBias) = "0xad503d34be39f87b"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to change the cascade shadows sampling type, e.g. CSM_ST_DITHER8, CSM_ST_BOX3x3 etc. (default is CSM_ST_DITHER4, may chang to CSM_ST_BOX3x3 soon)
NATIVE PROC CASCADE_SHADOWS_SET_SHADOW_SAMPLE_TYPE(STRING typeStr) = "0x2cd4854bf8235b97"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to clear the cascade shadows sampling type, as previously set by CASCADE_SHADOWS_SET_SHADOW_SAMPLE_TYPE
NATIVE PROC CASCADE_SHADOWS_CLEAR_SHADOW_SAMPLE_TYPE() = "0x335e0094cfabdcea"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to change the cascade shadows so they go out extremely far just like when you are in an airplane
NATIVE PROC CASCADE_SHADOWS_SET_AIRCRAFT_MODE(BOOL bEnable) = "0xea33835cb4cd38ac"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to change the cascade shadows so they are placed dependant on the nearest object in the scene from the previous frame
NATIVE PROC CASCADE_SHADOWS_SET_DYNAMIC_DEPTH_MODE(BOOL bEnable) = "0x80a55b04f3bcfc3a"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to change the cascade shadows so they are placed dependant on the nearest object in the scene from the previous frame
NATIVE PROC CASCADE_SHADOWS_SET_DYNAMIC_DEPTH_VALUE(float distance) = "0xab10c4fa283eeefc"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to change the cascade shadows to fly camera mode (a variation on the quadrant tracker which allows for camera angles which are within ~45 degrees from straight downwards)
NATIVE PROC CASCADE_SHADOWS_SET_FLY_CAMERA_MODE(BOOL bEnable) = "0xd3758c3e8218803e"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to enable/disable the cascaded shadows freezer functionality
NATIVE PROC CASCADE_SHADOWS_ENABLE_FREEZER(BOOL bEnable) = "0x06a533a461a8f65d"


//~>                        Water Reflection

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to change the water reflection height (temporary workaround until the water system provides correct height)
NATIVE PROC WATER_REFLECTION_SET_HEIGHT(BOOL bEnable, FLOAT height) = "0x50bfc8262002222f"

//INFO: 
//PARAM NOTES:
// PURPOSE: call this to enable/disable OBJECT-type entities from being rendered in water reflection. default value is FALSE, must restore this when you're done
NATIVE PROC WATER_REFLECTION_SET_SCRIPT_OBJECT_VISIBILITY(BOOL bForceVisible) = "0x63758d6234411cf4"

//~>                        Golf Trail

NATIVE PROC GOLF_TRAIL_SET_ENABLED(BOOL bEnabled) = "0xed2a45944c876db6"
NATIVE PROC GOLF_TRAIL_SET_PATH(VECTOR positionStart, VECTOR velocityStart, FLOAT velocityScale, FLOAT z1, BOOL bAscending) = "0xf7f4dad4bc730d37"
NATIVE PROC GOLF_TRAIL_SET_RADIUS(FLOAT radiusStart, FLOAT radiusMiddle, FLOAT radiusEnd) = "0xd852e9e218ae2be2"
NATIVE PROC GOLF_TRAIL_SET_COLOUR(INT rStart, INT gStart, INT bStart, INT aStart, INT rMiddle, INT gMiddle, INT bMiddle, INT aMiddle, INT rEnd, INT gEnd, INT bEnd, INT aEnd) = "0xd87b21455cf2dff5"
NATIVE PROC GOLF_TRAIL_SET_TESSELLATION(INT numControlPoints, INT tessellation) = "0x9729d6c00e75cf41"
NATIVE PROC GOLF_TRAIL_SET_FIXED_CONTROL_POINT_ENABLE(BOOL bEnabled) = "0x82a234a283aa4d45"
NATIVE PROC GOLF_TRAIL_SET_FIXED_CONTROL_POINT(INT controlPointIndex, VECTOR position, FLOAT radius, INT R, INT G, INT B, INT A) = "0xb1df335b838b6f6b"
NATIVE PROC GOLF_TRAIL_SET_SHADER_PARAMS(FLOAT pixelThickness, FLOAT pixelExpansion, FLOAT fadeOpacity, FLOAT fadeExponentBias, FLOAT textureFill) = "0xda2d0a320d992fa6"
NATIVE PROC GOLF_TRAIL_SET_FACING(BOOL bFacing) = "0x8f8e69d279a9ecf4"
NATIVE PROC GOLF_TRAIL_RESET() = "0x63cfd4f1e88f6ddc"

NATIVE FUNC FLOAT GOLF_TRAIL_GET_MAX_HEIGHT() = "0xd208773c3af637b5"
NATIVE FUNC VECTOR GOLF_TRAIL_GET_VISUAL_CONTROL_POINT(INT controlPointIndex) = "0xe172dc8891b21403"

//~>                        Particle effects commands

//INFO: Triggers a named particle effect at a world position.
//  This should only be used with non-looped particle effects.
//  The particle effect will then play and tidy itself up when finished.
//  There is no access to the particle effect once it has been triggered. 
//PARAM NOTES:  STRING fxName - the name of the particle effect to be triggered
//  VECTOR position - the world position to play the particle effect at
//  VECTOR rotation - the offset rotation of the particle effect
//  FLOAT scale - size scale of the effect (default size = 1.0) 
//  BOOL - whether or not the particle effect has been created ok 
// PURPOSE: Trigger a set piece (non looped) particle effect at a world position and orientation. More info..
NATIVE FUNC BOOL START_PARTICLE_FX_NON_LOOPED_AT_COORD(STRING fxName, VECTOR vecPosition, VECTOR vecRotation, FLOAT scale=1.0, BOOL invertAxisX=FALSE, BOOL invertAxisY=FALSE, BOOL invertAxisZ=FALSE) = "0xbc6a97baebcd5cd9"

//INFO: Triggers a named particle effect at a world position, that will replicate across the network.
//  This should only be used with non-looped particle effects.
//  The particle effect will then play and tidy itself up when finished.
//  There is no access to the particle effect once it has been triggered. 
//PARAM NOTES:  STRING fxName - the name of the particle effect to be triggered
//  VECTOR position - the world position to play the particle effect at
//  VECTOR rotation - the offset rotation of the particle effect
//  FLOAT scale - size scale of the effect (default size = 1.0) 
//  BOOL - whether or not the particle effect has been created ok 
//  BOOL ignoreScopeChecks - use this ONLY for the ion cannon effects, otherwise request permission from network code
// PURPOSE: Trigger a set piece (non looped) particle effect at a world position and orientation. More info..
NATIVE FUNC BOOL START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(STRING fxName, VECTOR vecPosition, VECTOR vecRotation, FLOAT scale=1.0, BOOL invertAxisX=FALSE, BOOL invertAxisY=FALSE, BOOL invertAxisZ=FALSE, BOOL ignoreScopeChecks=FALSE) = "0xaed7808fbb732392"

//INFO: Triggers a named particle effect on a ped bone at an offset position and rotation.
//  This should only be used with non-looped particle effects.
//  The particle effect will then play and tidy itself up when finished.
//  There is no access to the particle effect once it has been triggered. 
//PARAM NOTES:STRING STRING fxName - the name of the particle effect to be triggered
//  PED_INDEX pedIndex - the index of the ped to attach the particle effect to
//  VECTOR position - the offset position to play the particle effect at
//  VECTOR rotation - the offset rotation of the particle effect
//  INT boneTag - the bone tag to attach the particle effect to
//  FLOAT scale - size scale of the effect (default size = 1.0) 
// PURPOSE: Trigger a set piece (non looped) particle effect on a ped bone with an offset position and orientation. More info..
NATIVE FUNC BOOL START_PARTICLE_FX_NON_LOOPED_ON_PED_BONE(STRING fxName, PED_INDEX pedIndex, VECTOR vecPosition, VECTOR vecRotation, PED_BONETAG boneTag, FLOAT scale=1.0, BOOL invertAxisX=FALSE, BOOL invertAxisY=FALSE, BOOL invertAxisZ=FALSE) = "0xe4084dc6af8be020"

//INFO: Triggers a named particle effect on a ped bone at an offset position and rotation, that will replicate across the network.
//  This should only be used with non-looped particle effects.
//  The particle effect will then play and tidy itself up when finished.
//  There is no access to the particle effect once it has been triggered. 
//PARAM NOTES:STRING STRING fxName - the name of the particle effect to be triggered
//  PED_INDEX pedIndex - the index of the ped to attach the particle effect to
//  VECTOR position - the offset position to play the particle effect at
//  VECTOR rotation - the offset rotation of the particle effect
//  INT boneTag - the bone tag to attach the particle effect to
//  FLOAT scale - size scale of the effect (default size = 1.0) 
// PURPOSE: Trigger a set piece (non looped) particle effect on a ped bone with an offset position and orientation. More info..
NATIVE FUNC BOOL START_NETWORKED_PARTICLE_FX_NON_LOOPED_ON_PED_BONE(STRING fxName, PED_INDEX pedIndex, VECTOR vecPosition, VECTOR vecRotation, PED_BONETAG boneTag, FLOAT scale=1.0, BOOL invertAxisX=FALSE, BOOL invertAxisY=FALSE, BOOL invertAxisZ=FALSE) = "0x171bbeb194a0227f"

//INFO: Triggers a named particle effect on an entity at an offset position.
//  This should only be used with non-looped particle effects.
//  The particle effect will then play and tidy itself up when finished.
//  There is no access to the particle effect once it has been triggered. 
//PARAM NOTES: STRING fxName - the name of the particle effect to be triggered
//  ENTITY_INDEX entityIndex - the index of the entity to attach the particle effect to
//  VECTOR position - the offset position to play the particle effect at
//  VECTOR rotation - the offset rotation of the particle effect
//  FLOAT scale - size scale of the effect (default size = 1.0) 
// PURPOSE: Trigger a set piece (non looped) particle effect on an entity with an offset position and orientation. More info..
NATIVE FUNC BOOL START_PARTICLE_FX_NON_LOOPED_ON_ENTITY(STRING fxName, ENTITY_INDEX entityIndex, VECTOR vecPosition, VECTOR vecRotation, FLOAT scale=1.0, BOOL invertAxisX=FALSE, BOOL invertAxisY=FALSE, BOOL invertAxisZ=FALSE) = "0x74a35bff0670ecd4"

//INFO: Triggers a named particle effect on an entity at an offset position, that will replicate across the network.
//  This should only be used with non-looped particle effects.
//  The particle effect will then play and tidy itself up when finished.
//  There is no access to the particle effect once it has been triggered. 
//PARAM NOTES: STRING fxName - the name of the particle effect to be triggered
//  ENTITY_INDEX entityIndex - the index of the entity to attach the particle effect to
//  VECTOR position - the offset position to play the particle effect at
//  VECTOR rotation - the offset rotation of the particle effect
//  FLOAT scale - size scale of the effect (default size = 1.0) 
// PURPOSE: Trigger a set piece (non looped) particle effect on an entity with an offset position and orientation. More info..
NATIVE FUNC BOOL START_NETWORKED_PARTICLE_FX_NON_LOOPED_ON_ENTITY(STRING fxName, ENTITY_INDEX entityIndex, VECTOR vecPosition, VECTOR vecRotation, FLOAT scale=1.0, BOOL invertAxisX=FALSE, BOOL invertAxisY=FALSE, BOOL invertAxisZ=FALSE) = "0xd9e306ff36c32c21"

//INFO: Triggers a named particle effect on an entity bone at an offset position.
//  This should only be used with non-looped particle effects.
//  The particle effect will then play and tidy itself up when finished.
//  There is no access to the particle effect once it has been triggered. 
//PARAM NOTES: STRING fxName - the name of the particle effect to be triggered
//  ENTITY_INDEX entityIndex - the index of the entity to attach the particle effect to
//  VECTOR position - the offset position to play the particle effect at
//  VECTOR rotation - the offset rotation of the particle effect
//  INT boneIndex - the bone index to attach the particle effect to (use GET_ENTITY_BONE_INDEX_BY_NAME to get the index)
//  FLOAT scale - size scale of the effect (default size = 1.0) 
// PURPOSE: Trigger a set piece (non looped) particle effect on an entity with an offset position and orientation. More info..
NATIVE FUNC BOOL START_PARTICLE_FX_NON_LOOPED_ON_ENTITY_BONE(STRING fxName, ENTITY_INDEX entityIndex, VECTOR vecPosition, VECTOR vecRotation, INT boneIndex=-1, FLOAT scale=1.0, BOOL invertAxisX=FALSE, BOOL invertAxisY=FALSE, BOOL invertAxisZ=FALSE) = "0xa491a2306f578ced"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the colour tint of the next non looped particle effect
NATIVE PROC SET_PARTICLE_FX_NON_LOOPED_COLOUR(FLOAT colR, FLOAT colG, FLOAT colB) = "0x6fdd9329d15c7675"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the alpha tint of the next non looped particle effect
NATIVE PROC SET_PARTICLE_FX_NON_LOOPED_ALPHA(FLOAT colA) = "0x6c4a157a5f47c842"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the scale of the next non looped particle effect
NATIVE PROC SET_PARTICLE_FX_NON_LOOPED_SCALE(FLOAT scale) = "0x8b176fcee209beb9"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the size of the emitter domain of the next non looped particle effect
NATIVE PROC SET_PARTICLE_FX_NON_LOOPED_EMITTER_SIZE(VECTOR overrideSize) = "0x1e2e01c00837d26e"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the whether triggered effect will be in a vehicle interior. This is used for rendering 
NATIVE PROC SET_PARTICLE_FX_FORCE_VEHICLE_INTERIOR(BOOL isVehicleInterior) = "0x270218794b0ff497"

//INFO: Triggers a named particle effect at an world position.
//  This should only be used with infinitely looping particle effects.
//  The particle effect will then start playing and will need to be stopped by calling STOP_PTFX.
//  The returned id of the particle effect needs to be passed into any other function that needs to be called on it. 
//PARAM NOTES:STRING fxName - the name of the particle effect to be started
//  VECTOR position - the world position to play the particle effect at
//  VECTOR rotation - the offset rotation of the particle effect
//  FLOAT scale - size scale of the effect (default size = 1.0) 
//  INT - the id of the created particle effect - this will be 0 if creation fails 
// PURPOSE: Start a looped particle effect at a world position and orientation. More info..
NATIVE FUNC PTFX_ID START_PARTICLE_FX_LOOPED_AT_COORD(STRING fxName, VECTOR vecPosition, VECTOR vecRotation, FLOAT scale=1.0, BOOL invertAxisX=FALSE, BOOL invertAxisY=FALSE, BOOL invertAxisZ=FALSE, BOOL localOnly=FALSE) = "0xe1df0021f629f1d2"

//INFO: Triggers a named particle effect attached to a ped bone with an offset position and rotation.
//  This should only be used with infinitely looping particle effects.
//  The particle effect will then start playing and will need to be stopped by calling STOP_PTFX.
//  The returned id of the particle effect needs to be passed into any other function that needs to be called on it. 
//PARAM NOTES: STRING fxName - the name of the particle effect to be started
//  PED_INDEX pedIndex - the index of the ped to attach this particle effect to
//  VECTOR position - the offset position to play the particle effect at
//  VECTOR rotation - the offset rotation of the particle effect
//  INT boneTag - the bone tag to attach the particle effect to
//  FLOAT scale - size scale of the effect (default size = 1.0)
// INT - the id of the created particle effect - this will be 0 if creation fails 
// PURPOSE: Start a looped particle effect on a ped bone with an offset position and orientation. More info..
NATIVE FUNC PTFX_ID START_PARTICLE_FX_LOOPED_ON_PED_BONE(STRING fxName, PED_INDEX pedIndex, VECTOR vecPosition, VECTOR vecRotation, PED_BONETAG boneTag, FLOAT scale=1.0, BOOL invertAxisX=FALSE, BOOL invertAxisY=FALSE, BOOL invertAxisZ=FALSE) = "0xe4562f4f41c8b515"

//INFO: Triggers a named particle effect attached to an entity with an offset position.
//  This should only be used with infinitely looping particle effects.
//  The particle effect will then start playing and will need to be stopped by calling STOP_PTFX.
//  The returned id of the particle effect needs to be passed into any other function that needs to be called on it.+ 
//PARAM NOTES:STRING fxName - the name of the particle effect to be started
//  ENTITY_INDEX entityIndex - the index of the entity to attach this particle effect to
//  VECTOR position - the offset position to play the particle effect at
//  VECTOR rotation - the offset rotation of the particle effect
//  FLOAT scale - size scale of the effect (default size = 1.0) 
//  INT - the id of the created particle effect - this will be 0 if creation fails 
// PURPOSE: Start a looped particle effect on an entity with an offset position and orientation. More info..
NATIVE FUNC PTFX_ID START_PARTICLE_FX_LOOPED_ON_ENTITY(STRING fxName, ENTITY_INDEX entityIndex, VECTOR vecPosition, VECTOR vecRotation, FLOAT scale=1.0, BOOL invertAxisX=FALSE, BOOL invertAxisY=FALSE, BOOL invertAxisZ=FALSE) = "0x2d649da6dc187d35"


//INFO: Triggers a named particle effect attached to an entity bone with an offset position.
//  This should only be used with infinitely looping particle effects.
//  The particle effect will then start playing and will need to be stopped by calling STOP_PTFX.
//  The returned id of the particle effect needs to be passed into any other function that needs to be called on it.+ 
//PARAM NOTES:STRING fxName - the name of the particle effect to be started
//  ENTITY_INDEX entityIndex - the index of the entity to attach this particle effect to
//  VECTOR position - the offset position to play the particle effect at
//  VECTOR rotation - the offset rotation of the particle effect
//  INT boneIndex - the bone index to attach the particle effect to (use GET_ENTITY_BONE_INDEX_BY_NAME to get the index)
//  FLOAT scale - size scale of the effect (default size = 1.0) 
//  INT - the id of the created particle effect - this will be 0 if creation fails 
// PURPOSE: Start a looped particle effect on an entity with an offset position and orientation. More info..
NATIVE FUNC PTFX_ID START_PARTICLE_FX_LOOPED_ON_ENTITY_BONE(STRING fxName, ENTITY_INDEX entityIndex, VECTOR vecPosition, VECTOR vecRotation, INT boneIndex=-1, FLOAT scale=1.0, BOOL invertAxisX=FALSE, BOOL invertAxisY=FALSE, BOOL invertAxisZ=FALSE) = "0xdc82d60b1e9406a2"

// PURPOSE: Identical to START_PARTICLE_FX_LOOPED_ON_ENTITY, but also networks the particle effect
NATIVE FUNC PTFX_ID START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY(STRING fxName, ENTITY_INDEX entityIndex, VECTOR vecPosition, VECTOR vecRotation, FLOAT scale=1.0, BOOL invertAxisX=FALSE, BOOL invertAxisY=FALSE, BOOL invertAxisZ=FALSE, FLOAT colorR = 1.0, FLOAT colorG = 1.0, FLOAT colorB = 1.0, BOOL terminateOnOwnerLeave=FALSE) = "0x5e53429e463b220d"

// PURPOSE: Identical to START_PARTICLE_FX_LOOPED_ON_ENTITY_BONE, but also networks the particle effect
NATIVE FUNC PTFX_ID START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE(STRING fxName, ENTITY_INDEX entityIndex, VECTOR vecPosition, VECTOR vecRotation, INT boneIndex=-1, FLOAT scale=1.0, BOOL invertAxisX=FALSE, BOOL invertAxisY=FALSE, BOOL invertAxisZ=FALSE, FLOAT colorR = 1.0, FLOAT colorG = 1.0, FLOAT colorB = 1.0, BOOL terminateOnOwnerLeave=FALSE) = "0x91a5a4c63c2b5e5d"

//INFO: The stopped effect will automatically clean itself up once stopped. 
//PARAM NOTES: PTFX_ID ptfxId - the id of the started particle effect to stop 
// PURPOSE: Stop a previously started looped particle effect
NATIVE PROC STOP_PARTICLE_FX_LOOPED(PTFX_ID ptfxId, BOOL localOnly=FALSE) = "0x0f53bc871ba89c94"

//INFO: If the particle effect is attached to an entity (ped, vehicle or object) then the new position is an offset from that entity.
//  If the particle effect is not attached to an entity (ped, vehicle or object) then the new position is a world position. 
//PARAM NOTES: PTFX_ID ptfxId - the id of the started particle effect to update
//  VECTOR position - the new position of the particle effect
//  VECTOR rotation - the offset rotation of the particle effect 
// PURPOSE: Update the position and/or rotation offsets of a previously started looped particle effect. More info
NATIVE PROC SET_PARTICLE_FX_LOOPED_OFFSETS(PTFX_ID ptfxId, VECTOR position, VECTOR vecRotation) = "0x57d90001269a1354"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the evolution data of a previously started looped particle effect
NATIVE PROC SET_PARTICLE_FX_LOOPED_EVOLUTION(PTFX_ID ptfxId, STRING evoName, FLOAT evoVal, BOOL localOnly=FALSE) = "0x39b111ddfa0712b3"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the colour tint of a previously started looped particle effect
NATIVE PROC SET_PARTICLE_FX_LOOPED_COLOUR(PTFX_ID ptfxId, FLOAT colR, FLOAT colG, FLOAT colB, BOOL localOnly=FALSE) = "0x9cca66a85447d77c"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the alpha tint of a previously started looped particle effect
NATIVE PROC SET_PARTICLE_FX_LOOPED_ALPHA(PTFX_ID ptfxId, FLOAT colA) = "0x8364b4d1fe5492bd"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the scale of a previously started looped particle effect
NATIVE PROC SET_PARTICLE_FX_LOOPED_SCALE(PTFX_ID ptfxId, FLOAT scale) = "0x15aa71a3c4a07e1f"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the size of the emitter domain of a previously started looped particle effect
NATIVE PROC SET_PARTICLE_FX_LOOPED_EMITTER_SIZE(PTFX_ID ptfxId, BOOL bIsOverridden, VECTOR overrideSize) = "0x67f5ef95b2a4a92c"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the far clip distance of a previously started looped particle effect (set to -1.0 to disable)
NATIVE PROC SET_PARTICLE_FX_LOOPED_FAR_CLIP_DIST(PTFX_ID ptfxId, FLOAT farClipDist) = "0xa33a1883026b742e"

//INFO: 
//PARAM NOTES:
// PURPOSE: Tells the particle fx that the camera is inside a vehicle so that certain effects are stopped 
NATIVE PROC SET_PARTICLE_FX_CAM_INSIDE_VEHICLE(BOOL bInside) = "0xaa4afc804c4ba788"

//INFO: 
//PARAM NOTES:
// PURPOSE: Similar to SET_PARTICLE_FX_CAM_INSIDE_VEHICLE, but this command allows specifying a random vehicle 
//	    SET_PARTICLE_FX_CAM_INSIDE_VEHICLE will only affect the vehicle where the player is in
NATIVE PROC SET_PARTICLE_FX_CAM_INSIDE_NONPLAYER_VEHICLE(VEHICLE_INDEX Vehicle, BOOL bInside) = "0x172badec55cd3dcb"

//INFO: 
//PARAM NOTES:
// PURPOSE: Tells the particle fx that the boat is involved in a shootout so that the effects can be toned down
NATIVE PROC SET_PARTICLE_FX_SHOOTOUT_BOAT(VEHICLE_INDEX vehIndex) = "0x50ff2024d3503ad5"

//INFO: 
//PARAM NOTES:
// PURPOSE: Tells the particle fx that the boat is no longer involved in a shootout so that the effects can revert to normal
NATIVE PROC CLEAR_PARTICLE_FX_SHOOTOUT_BOAT() = "0xe915f7585917c52f"

//INFO: 
//PARAM NOTES:
// PURPOSE: Remove all particle effects (including existing particles) from an entity
NATIVE PROC REMOVE_PARTICLE_FX_FROM_ENTITY(ENTITY_INDEX entityIndex) = "0xc43ed93266d2a3bb"

//INFO: 
//PARAM NOTES:
// PURPOSE: Remove a particle effects (including existing particles)
NATIVE PROC REMOVE_PARTICLE_FX(PTFX_ID ptfxId, BOOL localOnly=FALSE) = "0x1439cb68c14277fb"

//INFO: 
//PARAM NOTES:
// PURPOSE: Remove a particle effects (including existing particles) with a range of a position
NATIVE PROC REMOVE_PARTICLE_FX_IN_RANGE(VECTOR pos, FLOAT range) = "0x3e100889f69b5149"

//INFO: 
//PARAM NOTES:
// PURPOSE: Forces a particle effect attached to a vehicle to be in that vehicle interior. This helps with the rendering order of that particle
NATIVE PROC FORCE_PARTICLE_FX_IN_VEHICLE_INTERIOR(PTFX_ID ptfxId, BOOL isInVehicleInterior) = "0xf5da1b9443631838"

//INFO: 
//PARAM NOTES:
// PURPOSE: Queries whether a particle effect exists
NATIVE FUNC BOOL DOES_PARTICLE_FX_LOOPED_EXIST(PTFX_ID ptfxId) = "0x6b8f21f773404988"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the scale used for the blood effects (set to 1.0 for authored size)
NATIVE PROC SET_PARTICLE_FX_BLOOD_SCALE(FLOAT scale) = "0xde1095a40e375ae9"

//INFO: 
//PARAM NOTES:
// PURPOSE: Disables all blood vfx (particle effects, decals and ped damage textures)
NATIVE PROC DISABLE_BLOOD_VFX(BOOL enable) = "0xcc85bd23691047ef"

//INFO: 
//PARAM NOTES:
// PURPOSE: Disables all in-water particle effects
NATIVE PROC DISABLE_IN_WATER_PTFX(BOOL enable) = "0xcfe5ec0c2b0b9531"

//INFO: 
//PARAM NOTES:
// PURPOSE: Disables all downwash particle effects
NATIVE PROC DISABLE_DOWNWASH_PTFX(BOOL enable) = "0xae29d588d027bf34"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the range/lod scale used for the slipstream effects (set to 1.0 for authored range/lods)
NATIVE PROC SET_PARTICLE_FX_SLIPSTREAM_LODRANGE_SCALE(FLOAT scale) = "0xaf00e6a5fb6dce38"

//INFO: 
//PARAM NOTES:
// PURPOSE: Overrides the blood effect to use the clown blood settings (remember to disable when finished)
NATIVE PROC ENABLE_CLOWN_BLOOD_VFX(BOOL enable) = "0xb74716c5f4a7623e"

//INFO: 
//PARAM NOTES:
// PURPOSE: Overrides the blood effect to use the alien blood settings (remember to disable when finished)
NATIVE PROC ENABLE_ALIEN_BLOOD_VFX(BOOL enable) = "0xa5d10312d00c63de"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the scale used for the bullet impact effects (set to 1.0 for authored size)
NATIVE PROC SET_PARTICLE_FX_BULLET_IMPACT_SCALE(FLOAT scale) = "0x4e7172e30cc3ca0a"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the range/lod scale used for the bullet impact effects (set to 1.0 for authored range/lods)
NATIVE PROC SET_PARTICLE_FX_BULLET_IMPACT_LODRANGE_SCALE(FLOAT scale) = "0x1c7591eed58e42df"

//INFO: 
//PARAM NOTES:
// PURPOSE: disables the angle rejection check for the bullet traces
NATIVE PROC SET_PARTICLE_FX_BULLET_TRACE_NO_ANGLE_REJECT(BOOL val) = "0x1c0734b49e9e6898"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the range/lod scale used for the bang and scrape effects (set to 1.0 for authored range/lods)
NATIVE PROC SET_PARTICLE_FX_BANG_SCRAPE_LODRANGE_SCALE(FLOAT scale) = "0xd5fbbcdda2486ad2"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the range/lod scale used for the footstep effects (set to 1.0 for authored range/lods)
NATIVE PROC SET_PARTICLE_FX_FOOT_LODRANGE_SCALE(FLOAT scale) = "0xa204f683b0528390"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the name of the override effect to use for footsteps (set to "" to stop the override)
NATIVE PROC SET_PARTICLE_FX_FOOT_OVERRIDE_NAME(STRING overridePtFxName) = "0xc3f733a1a64bb1e8"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the range/lod scale used for the wheel effects (set to 1.0 for authored range/lods)
NATIVE PROC SET_PARTICLE_FX_WHEEL_LODRANGE_SCALE(FLOAT scale) = "0x6f5f2ad41f7b4936"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the range scale used for the wheel skidmarks (set to 1.0 for authored range)
NATIVE PROC SET_SKIDMARK_RANGE_SCALE(FLOAT scale) = "0xb18e5568eaad15f2"

//INFO: 
//PARAM NOTES:
// PURPOSE: Makes all effect instances set the flag to be considered in vehicle interior
NATIVE PROC SET_PTFX_FORCE_VEHICLE_INTERIOR_FLAG(BOOL val) = "0xc6730e0d14e50703"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the range/lod scale used for the wheel effects (set to 1.0 for authored range/lods)
NATIVE PROC OVERRIDE_PARTICLE_FX_WATER_SPLASH_OBJECT_IN(BOOL overrideEnabled, STRING overridePtFxName) = "0x9371dd9fd1e2cb97"

//INFO: 
//PARAM NOTES:
// PURPOSE: Stops any particle effect downsampling this frame
NATIVE PROC SET_PARTICLE_FX_NO_DOWNSAMPLING_THIS_FRAME() = "0x2d82eb3fe61e670a"

//INFO: 
//PARAM NOTES:
// PURPOSE: Triggers an EMP particle effect on a vehicle 
// NOTES: the stromberg vehicle must be loaded for this to work as the effect is a dependency of it
NATIVE PROC TRIGGER_PARTICLE_FX_EMP(VEHICLE_INDEX vehIndex, FLOAT scale) = "0xd513d0b2ec275792"

//INFO:
// PURPOSE:	Enables the script to use a particle effect from a named asset (as opposed to the particle asset assigned to the script)
// NOTES: 	This must be called directly before every START_PARTICLE_FX_ command that needs it
NATIVE PROC USE_PARTICLE_FX_ASSET(STRING ptFxAssetName) = "0x76b797b61752aab8"

//INFO:
// PURPOSE:	Adds a particle effect override
// NOTES: 	All requests to play ptFxToOverride will play ptFxToUseInstead instead
NATIVE PROC SET_PARTICLE_FX_OVERRIDE(STRING ptFxToOverride, STRING ptFxToUseInstead) = "0xa01f69ade5032968"

//INFO:
// PURPOSE:	Removes a particle effect override
// NOTES: 	Removes the override set up for ptFxToOverride
NATIVE PROC RESET_PARTICLE_FX_OVERRIDE(STRING ptFxToOverride) = "0x4f743783acd5e6e6"


//~>                        Weather/Region Ptfx Commands

//INFO:
// PURPOSE:	Makes the current weather/region ptf use the override settings
// NOTES: 	
NATIVE PROC SET_WEATHER_PTFX_USE_OVERRIDE_SETTINGS(BOOL useOverrideSettings) = "0xa2b1c1c06e1d3bb5"

//INFO:
// PURPOSE:	Overrides the current weather/region level
// NOTES: 	
NATIVE PROC SET_WEATHER_PTFX_OVERRIDE_CURR_LEVEL(FLOAT currLevel) = "0x5406ff5ecea3659f"

//INFO:
// PURPOSE:	Overrides the current weather/region Emitter Box Offset
// NOTES: 	
NATIVE PROC SET_WEATHER_PTFX_OVERRIDE_BOX_OFFSET(VECTOR boxOffset) = "0x9fbd8dd0ee7935d9"

//INFO:
// PURPOSE:	Overrides the current weather/region Emitter Box Size
// NOTES: 	
NATIVE PROC SET_WEATHER_PTFX_OVERRIDE_BOX_SIZE(VECTOR boxSize) = "0x6dc6698d47357d24"


//~>                        Projected Texture Commands

//INFO: 
//PARAM NOTES:
// PURPOSE: Washes the projected textures off a vehicle (by washAmount each time it's called)
//NATIVE PROC WASH_PROJTEX_FROM_VEHICLE(VEHICLE_INDEX vehIndex, INT washAmount)

//INFO: 
//PARAM NOTES:
// PURPOSE: Removes all projected textures within the range of a position
//NATIVE PROC REMOVE_PROJTEX_IN_RANGE(VECTOR pos, FLOAT range)

//INFO: 
//PARAM NOTES:
//PURPOSE: Removes all projected textures on a particular object 
//NATIVE PROC REMOVE_PROJTEX_FROM_OBJECT(OBJECT_INDEX ObjectIndex)

//INFO: 
//PARAM NOTES:
//PURPOSE: Removes all projected textures on a particular vehicle
//NATIVE PROC REMOVE_PROJTEX_FROM_VEHICLE(VEHICLE_INDEX VehicleIndex)

//INFO: 
//PARAM NOTES:
//PURPOSE: Places a projected texture into the world
//NATIVE PROC ADD_PROJTEX (PROJTEXDATA ProjectedTexData)


//~>                        Decal Commands

//INFO: 
//PARAM NOTES:
// PURPOSE: Wash all decals within the range of a position
NATIVE PROC WASH_DECALS_IN_RANGE(VECTOR pos, FLOAT range, FLOAT washAmount) = "0xd2ef7ba398d77b2b"

//INFO: 
//PARAM NOTES:
// PURPOSE: Washes the decals off a vehicle (by washAmount each time it's called)
NATIVE PROC WASH_DECALS_FROM_VEHICLE(VEHICLE_INDEX vehIndex, FLOAT washAmount) = "0x23e905c5f39ef42a"

//INFO: 
//PARAM NOTES:
// PURPOSE: Fades out all decals within the range of a position over the fade time
NATIVE PROC FADE_DECALS_IN_RANGE(VECTOR pos, FLOAT range, FLOAT fadeTime) = "0x152bc923d5118c6f"

//INFO: 
//PARAM NOTES:
// PURPOSE: Removes all decals within the range of a position
NATIVE PROC REMOVE_DECALS_IN_RANGE(VECTOR pos, FLOAT range) = "0xef071f2ff93bc37f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Removes all decals on a particular object 
NATIVE PROC REMOVE_DECALS_FROM_OBJECT(OBJECT_INDEX ObjectIndex) = "0xca8bf400114ce91e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Removes all decals facing a certain direction on a particular object 
NATIVE PROC REMOVE_DECALS_FROM_OBJECT_FACING(OBJECT_INDEX ObjectIndex, VECTOR dir) = "0xa25856e97dbb67b4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Removes all decals on a particular vehicle
NATIVE PROC REMOVE_DECALS_FROM_VEHICLE(VEHICLE_INDEX VehicleIndex) = "0xf5da3f1915d29e2c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Removes all decals facing a certain direction on a particular vehicle
NATIVE PROC REMOVE_DECALS_FROM_VEHICLE_FACING(VEHICLE_INDEX VehicleIndex, VECTOR dir) = "0x643ee33b811308be"

//INFO: 
//PARAM NOTES:
//PURPOSE: Places a decal into the world
NATIVE FUNC DECAL_ID ADD_DECAL (DECAL_RENDERSETTING_ID renderSettingsId, VECTOR pos, VECTOR dir, VECTOR side, FLOAT width, FLOAT height, FLOAT colR, FLOAT colG, FLOAT colB, FLOAT colA, FLOAT life, BOOL isLongRange=false, BOOL isDynamic=false, BOOL useComplexColn=false) = "0x20f895e512ec5db6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Places a petrol decal into the world
NATIVE FUNC DECAL_ID ADD_PETROL_DECAL (VECTOR pos, FLOAT startSize, FLOAT endSize, FLOAT growRate) = "0x44949ec4364cc53b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Places an oil decal into the world
NATIVE FUNC DECAL_ID ADD_OIL_DECAL (VECTOR pos, FLOAT startSize, FLOAT endSize, FLOAT growRate) = "0x126d7f89fe859a5e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Starts a set of skidmark decals of a certain width
NATIVE PROC START_SKIDMARK_DECALS (FLOAT width) = "0x5b721dc2b9dd7538"

//INFO: 
//PARAM NOTES:
//PURPOSE: Adds skidmark point info to the started skidmark decals set
NATIVE PROC ADD_SKIDMARK_DECAL_INFO (VECTOR pos, FLOAT alphaMult) = "0x802082fdf21f8e9c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Ends the skidmark decals set and send to to be applied
NATIVE PROC END_SKIDMARK_DECALS () = "0x18e71758e5b89d9f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Starts a set of petrol trail decals of a certain width
NATIVE PROC START_PETROL_TRAIL_DECALS (FLOAT width) = "0x9f0371728df05832"

//INFO: 
//PARAM NOTES:
//PURPOSE: Adds petrol trail point info to the started petrol trail decals set
NATIVE PROC ADD_PETROL_TRAIL_DECAL_INFO (VECTOR pos, FLOAT alphaMult) = "0xa22d087a4f4d9310"

//INFO: 
//PARAM NOTES:
//PURPOSE: Ends the petrol trail decals set and send to to be applied
NATIVE PROC END_PETROL_TRAIL_DECALS () = "0x1dd01e482da60fba"

//INFO: 
//PARAM NOTES:
//PURPOSE: Places a marker decal into the world for a single frame
NATIVE PROC REGISTER_MARKER_DECAL (DECAL_RENDERSETTING_ID renderSettingsId, VECTOR pos, VECTOR dir, VECTOR side, FLOAT width, FLOAT height, FLOAT alpha_param, BOOL isLongRange=false, bool isDynamic=false) = "0xbf52e616037c07ee"

//INFO: 
//PARAM NOTES:
//PURPOSE: Removes a previously added decal from the world
NATIVE PROC REMOVE_DECAL (DECAL_ID decalId) = "0x12b2b502c41ef25e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if a previously added decal is still alive
NATIVE FUNC BOOL IS_DECAL_ALIVE (DECAL_ID decalId) = "0xd39231cabdb82d64"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the wash level of a previously added decal
NATIVE FUNC FLOAT GET_DECAL_WASH_LEVEL (DECAL_ID decalId) = "0x89f54ec4a6351b0f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enables/Disables the petrol pool decals from igniting
NATIVE PROC SET_DISABLE_PETROL_DECALS_IGNITING (BOOL bVal) = "0x576f5f816e776077"

//INFO: 
//PARAM NOTES:
//PURPOSE: Disables the petrol pool decals from igniting this frame
NATIVE PROC SET_DISABLE_PETROL_DECALS_IGNITING_THIS_FRAME () = "0x19f63003b476d77a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Disables the petrol pool decals from recycling this frame
NATIVE PROC SET_DISABLE_PETROL_DECALS_RECYCLING_THIS_FRAME () = "0x89e623b2dab6d83c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Disables decals from rendering this frame
NATIVE PROC SET_DISABLE_DECAL_RENDERING_THIS_FRAME () = "0x7cb01c712d0b1639"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets whether there are any petrol decals in a specified range of a position
NATIVE FUNC BOOL GET_IS_PETROL_DECAL_IN_RANGE (VECTOR pos, FLOAT range) = "0x6a1edf18639d033e"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC PATCH_DECAL_DIFFUSE_MAP (DECAL_RENDERSETTING_ID renderSettingsId, STRING diffuseMapDictionaryName, STRING diffuseMapName) = "0xb1004d004a7e8c8e"

//INFO: 
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC UNPATCH_DECAL_DIFFUSE_MAP (DECAL_RENDERSETTING_ID renderSettingsId) = "0x47671aa477611c56"

//INFO: 
//PARAM NOTES:
//PURPOSE: Moves decals from one vehicle to another - must be the same vehicle model to work correctly
NATIVE PROC MOVE_VEHICLE_DECALS (VEHICLE_INDEX VehicleFrom, VEHICLE_INDEX VehicleTo) = "0x4e2de31af276df50"

//INFO: 
//PARAM NOTES:
//PURPOSE: Places a crew emblem on a vehicle
NATIVE FUNC BOOL ADD_VEHICLE_CREW_EMBLEM (VEHICLE_INDEX VehicleIndex, PED_INDEX pedIndex, INT vehicleBoneIndex, VECTOR vOffsetPos, VECTOR vDir, VECTOR vSide, FLOAT size, int badgeIndex = 0, int badgeAlpha = 200) = "0x288e8f521b7ab08d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Places a crew emblem on a vehicle using a specified texture name
NATIVE FUNC BOOL ADD_VEHICLE_CREW_EMBLEM_USING_TEXTURE (VEHICLE_INDEX VehicleIndex, PED_INDEX pedIndex, STRING pTextureDictionaryName, STRING pTextureName, INT vehicleBoneIndex, VECTOR vOffsetPos, VECTOR vDir, VECTOR vSide, FLOAT size, int badgeIndex = 0, int badgeAlpha = 200) = "0x737f31e4debe2a25"

//INFO: 
//PARAM NOTES:
//PURPOSE: Places a tournament emblem on a vehicle
NATIVE FUNC BOOL ADD_VEHICLE_TOURNAMENT_EMBLEM(VEHICLE_INDEX VehicleIndex, INT tournamentId, INT vehicleBoneIndex, VECTOR vOffsetPos, VECTOR vDir, VECTOR vSide, FLOAT size, int badgeIndex = 0, int badgeAlpha = 200) = "0x6f193130090db577"

//INFO: 
//PARAM NOTES:
//PURPOSE: Removes a crew emblem from a vehicle
NATIVE PROC REMOVE_VEHICLE_CREW_EMBLEM (VEHICLE_INDEX VehicleIndex, int badgeIndex = 0) = "0x30e6a7038dbfeb9f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Aborts crew emblem requests from a vehicle (the requests must be stuck in a "requesting badge" state)
//		   If the abort is successful this command will return true - otherwise it'll return false
NATIVE FUNC BOOL ABORT_VEHICLE_CREW_EMBLEM_REQUEST (VEHICLE_INDEX VehicleIndex) = "0xe08352579c33866c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the current state of a vehicle crew emblem request made using ADD_VEHICLE_CREW_EMBLEM
//		   CERS_NOT_ACTIVE			- means that an error has occured as no request is found for this vehicle
//		   CERS_REQUESTING_BADGE	- means that the request is still in progress (still requesting the texture from the cloud)
//		   CERS_APPLYING_DECAL		- means that the request is still in progress (still applying the decal)
//		   CERS_SUCCEEDED			- means that the request has succeeded
//		   CERS_FAILED				- means that the request has failed
//		   Note that if CERS_SUCCEEDED or CERS_FAILED are returned the request will automatically be made not active (CERS_NOT_ACTIVE) so querying it again will produce an error
NATIVE FUNC CREWEMBLEMREQUESTSTATE GET_VEHICLE_CREW_EMBLEM_REQUEST_STATE (VEHICLE_INDEX VehicleIndex, int badgeIndex = 0) = "0x596e9ec72d8dee73"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks whether a vehicle has a crew emblem applied
NATIVE FUNC BOOL DOES_VEHICLE_HAVE_CREW_EMBLEM (VEHICLE_INDEX VehicleIndex, int badgeIndex = 0) = "0xa763b3f87da3c316"

//INFO: 
//PARAM NOTES:
//PURPOSE: Disables/Enables footprint decals (true to disable, false to enable)
NATIVE PROC DISABLE_FOOTPRINT_DECALS (BOOL val) = "0x712533916b0e0346"

//INFO: 
//PARAM NOTES:
//PURPOSE: Disables/Enables composite shotgun impact decals (true to disable, false to enable)
NATIVE PROC DISABLE_COMPOSITE_SHOTGUN_DECALS (BOOL val) = "0xcbdc492e30316d9b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Disables/Enables collision scuff decals (true to disable, false to enable)
NATIVE PROC DISABLE_SCUFF_DECALS (BOOL val) = "0x7c1f0e846828c59f"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets the range scale used for the bullet impact decals (set to 1.0 for authored range)
NATIVE PROC SET_DECAL_BULLET_IMPACT_RANGE_SCALE(FLOAT scale) = "0xfb04b0d25eeab773"




//~>                        VFX

//INFO: 
//PARAM NOTES:
// PURPOSE: Overrides the interior smoke effect name 
NATIVE PROC OVERRIDE_INTERIOR_SMOKE_NAME(STRING overrideName) = "0xe798481a8e535a88"

//INFO: 
//PARAM NOTES:
// PURPOSE: Overrides the interior smoke effect name 
NATIVE PROC OVERRIDE_INTERIOR_SMOKE_NAME_LENS(STRING overrideName) = "0x2f8c56e571f2e329"

//INFO: 
//PARAM NOTES:
// PURPOSE: Overrides the interior smoke effect name 
NATIVE PROC OVERRIDE_INTERIOR_SMOKE_LEVEL(FLOAT overrideLevel) = "0xfd12a532298d02c4"

//INFO: 
//PARAM NOTES:
// PURPOSE: Overrides the interior smoke effect name 
NATIVE PROC OVERRIDE_INTERIOR_SMOKE_END() = "0x700aba56d7a3860a"

//INFO: 
//PARAM NOTES:
// PURPOSE: Registers the film noir lens effect each frame this is called
NATIVE PROC REGISTER_NOIR_LENS_EFFECT() = "0xf484cd97db3780cc"

//INFO: 
//PARAM NOTES:
// PURPOSE: Disable vehicle distant lights rendering.
NATIVE PROC DISABLE_VEHICLE_DISTANTLIGHTS(BOOL enable) = "0xe0140518c369816e"

//INFO: 
//PARAM NOTES:
// PURPOSE: Disable lod light rendering.
NATIVE PROC DISABLE_LODLIGHTS(BOOL enable) = "0xe1b852a04b8fc6ba"

//INFO: 
//PARAM NOTES:
// PURPOSE: Allow shadowed lights with no shadows generted to render
NATIVE PROC RENDER_SHADOWED_LIGHTS_WITH_NO_SHADOWS(BOOL render) = "0x797e7eafcef57a43"

//INFO: 
//PARAM NOTES:
// PURPOSE: Request an early visibility check for shadowed lights.
NATIVE PROC REQUEST_EARLY_LIGHT_CHECK() = "0x0f839cce4ca00021"

//INFO: 
//PARAM NOTES:
// PURPOSE: When the ped is unsheltered all foot effects will use the snow vfx group
NATIVE PROC USE_SNOW_FOOT_VFX_WHEN_UNSHELTERED(BOOL enable) = "0xa968ffff56c48d0a"

//INFO: 
//PARAM NOTES:
// PURPOSE: When the car is unsheltered all wheel effects will use the snow vfx group
NATIVE PROC USE_SNOW_WHEEL_VFX_WHEN_UNSHELTERED(BOOL enable) = "0x02ba4710df2fcfc3"

//INFO: 
//PARAM NOTES:
// PURPOSE: Disables region based vfx - wind debris particles and region based gpu particles (dust, bugs etc)
NATIVE PROC DISABLE_REGION_VFX(BOOL disable) = "0xad6f16c0a4a10ebb"


//~>                        Timecycle commands

//INFO:  A timecyclemodifier is set up by an artists and can contains changes to light colour, fog colour, clip plane distance or post fx. They can be used as a filter. Good ones to try are: death, busted, sniper_ini, sniper, binocular, injured, fast
//          MAKE SURE TO CALL CLEAR_TIMECYCLE_MODIFIER when you're done. If this doesn't happen the game will from that point on use that filter. 
//PARAM NOTES:
//PURPOSE: Forces the  timecycle modifier to be used for 100%. More info..
NATIVE PROC SET_TIMECYCLE_MODIFIER(STRING ModifierName) = "0x5c3549d308ec0b7f"

//INFO:  
//PARAM NOTES:
//PURPOSE: Preset the interior cache using the specified modifier, may reduce flickers/transition in some cases.
NATIVE PROC PRESET_INTERIOR_AMBIENT_CACHE(STRING ModifierName) = "0x074934b9f1d2dc3c"



//INFO: Set the strength at which a timecycle modifier set via SET_TIMECYCLE_MODIFIER is applied. values goes from 0.0 (no effect) to 1.0 (full on)
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_TIMECYCLE_MODIFIER_STRENGTH(FLOAT strength) = "0xac7136a72de288c8"

//INFO:  Start a transition to a timecycle, either from "nothing" or from the currently active script modifier if there's one.
//          MAKE SURE TO CALL CLEAR_TIMECYCLE_MODIFIER when you're done. If this doesn't happen the game will from that point on use that filter. 
//PARAM NOTES: time is in SECONDS
//PURPOSE: 
NATIVE PROC SET_TRANSITION_TIMECYCLE_MODIFIER(STRING ModifierName, FLOAT time) = "0x4ecb2825299df02e"


//INFO:  Start a transition out of the currently active script modifier.
//PARAM NOTES: time is in SECONDS
//PURPOSE: 
NATIVE PROC SET_TRANSITION_OUT_OF_TIMECYCLE_MODIFIER(FLOAT time) = "0xbbfaae0f5c7709c5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Clears anys critp set timecycle modifier.
NATIVE PROC CLEAR_TIMECYCLE_MODIFIER() = "0xdeabc7ec7da2b48e"

//INFO: 
//PARAM NOTES:
//PURPOSE: returns the currently set timecycle modifier's index, or -1 if none is set. This index is purely unformative.
NATIVE FUNC INT GET_TIMECYCLE_MODIFIER_INDEX() = "0x607b649f72d20b6a"

//INFO: 
//PARAM NOTES:
//PURPOSE: returns the currently set timecycle modifier's index, or -1 if none is set. This index is purely unformative.
NATIVE FUNC INT GET_TIMECYCLE_TRANSITION_MODIFIER_INDEX() = "0x7234e7ff7b1c3ae3"


//INFO: 
//PARAM NOTES:
//PURPOSE: returns whether timecycle is currently in state of transition out
NATIVE FUNC BOOL GET_IS_TIMECYCLE_TRANSITIONING_OUT() = "0x31e4c810a77a13f8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Push the current timecycle modifiers, effectively saving values to be restored later.
NATIVE PROC PUSH_TIMECYCLE_MODIFIER() = "0x75896fbc1c205df1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Clear the currently pushed timecycle modifiers. USE AT YOUR OWN RISK AND ONLY IF YOU KNOW WHAT YOU'RE DOING, IF YOU'RE READING THIS THEN YOU SHOULD PROBABLY NOT USE IT.
NATIVE PROC CLEAR_PUSHED_TIMECYCLE_MODIFIER() = "0x61383c0ce774ed0c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Pop the previously timecycle modifiers settings, effectively restoring values saved earlier.
NATIVE PROC POP_TIMECYCLE_MODIFIER() = "0x200c8054b5d04eb5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Forces the current player modifier, will set next and current to CurrentModifierName
NATIVE PROC SET_CURRENT_PLAYER_TCMODIFIER(STRING CurrentModifierName) = "0x3c6b3e8d95e0f1fa"

//INFO: 
//PARAM NOTES:
//PURPOSE: Start a player modifier transition. Set CurrentModifierName as the current modifier, current transiton at 0 and next to the...
NATIVE PROC START_PLAYER_TCMODIFIER_TRANSITION(STRING CurrentModifierName, STRING NextModifierName) = "0x5765428e12a06eac"

//INFO: 
//PARAM NOTES: 0 to 1.0, once at one, the next modifier will become the current one.
//PURPOSE: Change the transition between current and next modifier (as set using START_PLAYER_TCMODIFIER_TRANSITION or SET_NEXT_PLAYER_TCMODIFIER)
NATIVE PROC SET_PLAYER_TCMODIFIER_TRANSITION(FLOAT transitionDelta) = "0xca3360db84c1b6e3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the next modifier to transition too. if a transition was already in progress, the "next modifier" becomes the current one, the delta gets updated properly, and NextModifierName becomes the new next modifier.
NATIVE PROC SET_NEXT_PLAYER_TCMODIFIER(STRING NextModifierName) = "0x3378b05a908220ae"

//INFO: 
//PARAM NOTES:
//PURPOSE: Force timecycle to use a specific region
NATIVE PROC SET_TIMECYCLE_REGION_OVERRIDE(INT region) = "0x7ff110a1aa22e294"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return the current region override or -1 if none has been set.
NATIVE FUNC INT GET_TIMECYCLE_REGION_OVERRIDE() = "0x62b8f6d1ef916c74"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns a value between 0.0 to 1.0 indicating fade between day and night (0.0 = midday, 1.0 = midnight)
NATIVE FUNC FLOAT GET_DAY_NIGHT_BALANCE() = "0xb0d34b375eab2f1f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Temporary replace TC modifier "modifier" with TC Modifier "override"
NATIVE PROC ADD_TCMODIFIER_OVERRIDE(STRING modifier, STRING override) = "0x62fa36f96ed238bd"

//INFO: 
//PARAM NOTES:
//PURPOSE: Remove override from TC modifier "modifier"
NATIVE PROC REMOVE_TCMODIFIER_OVERRIDE(STRING modifier) = "0x44ef7c1f400e0871"

//INFO: 
//PARAM NOTES:
//PURPOSE: Remove all existing TC modifier overrides.
NATIVE PROC CLEAR_ALL_TCMODIFIER_OVERRIDES(STRING modifier) = "0x419d7af047a524f2"

//INFO:  
//PARAM NOTES:
//PURPOSE: Set the extra TC modifiers, it will be used on top of every other modifier, script, code or otherwise.
NATIVE PROC SET_EXTRA_TCMODIFIER(STRING ModifierName) = "0xfae487ec4c051ed7"

//INFO:  
//PARAM NOTES:
//PURPOSE: Clear the extra TC modifiers, it will be used on top of every other modifier, script, code or otherwise.
NATIVE PROC CLEAR_EXTRA_TCMODIFIER() = "0x041f9bcedbbcdf7f"

//INFO:  
//PARAM NOTES:
//PURPOSE: return the current extra TC modifiers, or -1 if none is set.
NATIVE FUNC INT GET_EXTRA_TCMODIFIER() = "0x1b9d803d538f5624"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enable the moon cycle override and set a value between 0.0 to 1.0 (0.5 = full moon)
NATIVE PROC ENABLE_MOON_CYCLE_OVERRIDE(FLOAT value) = "0x306d379656f4f87a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Enable the moon cycle override and set a value between 0.0 to 1.0 (0.5 = full moon)
NATIVE PROC DISABLE_MOON_CYCLE_OVERRIDE() = "0xb77cc7d5e8c88bad"

//INFO: 
//PARAM NOTES: angle in degrees
//PURPOSE: Set debug roll angle for sun position
NATIVE DEBUGONLY PROC SET_SUN_ROLL_ANGLE(FLOAT angle) = "0x71993ff5d218e78a"

//INFO: 
//PARAM NOTES: angle in degrees
//PURPOSE: Set debug yaw angle for sun position
NATIVE DEBUGONLY PROC SET_SUN_YAW_ANGLE(FLOAT angle) = "0x55092887fb4045fd"

//~>                        Scaleform 3d draw commands

//INFO: movies are drawn in order, with the latest drawn on top.
//PARAM NOTES:movie id (retrieved from REQUEST_SCALEFORM_MOVIE), position, xyz rotation angles in degrees, movie scale, size in world space
//PURPOSE: Renders a scaleform movie to the screen.
NATIVE PROC DRAW_SCALEFORM_MOVIE_3D(SCALEFORM_INDEX iScaleformMovieId, VECTOR vPos, VECTOR vRotation, VECTOR vScale, VECTOR vWorldSize, EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0xa8505db724f74b62"

//INFO: movies are drawn in order, with the latest drawn on top.
//PARAM NOTES:movie id (retrieved from REQUEST_SCALEFORM_MOVIE), entity index, bone index to attach movie to, position and rotation offsets, movie scale, size in world space
//PURPOSE: Renders a scaleform movie to the screen.
NATIVE PROC DRAW_SCALEFORM_MOVIE_3D_ATTACHED_TO_ENTITY(SCALEFORM_INDEX iScaleformMovieId, ENTITY_INDEX entityIndex, INT entityBoneIndex, VECTOR vPos, VECTOR vRotation, VECTOR vScale, VECTOR vWorldSize, EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0xa29e7109d679f12e"

//INFO: movies are drawn in order, with the latest drawn on top.
//PARAM NOTES:movie id (retrieved from REQUEST_SCALEFORM_MOVIE), position, xyz rotation angles in degrees, movie scale, size in world space
//PURPOSE: Renders a scaleform movie to the screen (no lighting).
NATIVE PROC DRAW_SCALEFORM_MOVIE_3D_SOLID(SCALEFORM_INDEX iScaleformMovieId, VECTOR vPos, VECTOR vRotation, VECTOR vScale, VECTOR vWorldSize, EULER_ROT_ORDER RotOrder = EULER_YXZ) = "0x4d3ecb46a812492a"



//INFO: Sets the brightness for a scaleform movie rendered in 3D
//PARAM NOTES:movie id (retrieved from REQUEST_SCALEFORM_MOVIE), brightness value [0, 255]
//PURPOSE: Sets the brightness for a scaleform movie rendered in 3D (it will not affect 2D scaleform movies).
NATIVE PROC SET_SCALEFORM_MOVIE_3D_BRIGHTNESS(SCALEFORM_INDEX iScaleformMovieId, INT brightness) = "0xa73844c238f80f80"


//~>                        Scaleform commands

CONST_FLOAT INVALID_SCALEFORM_PARAM -1.0

//INFO: Requests that a scaleform movie is streamed in (only allows 1 instance of a movie active at one time)
//PARAM NOTES: filename of the gfx file to load, whether game should stop to load or not (should be streamed where possible)
//PURPOSE: Requests that a scaleform movie is streamed in
NATIVE FUNC SCALEFORM_INDEX REQUEST_SCALEFORM_MOVIE(STRING filename) = "0x528279f3f1eef869"

//INFO: Requests that a scaleform movie is streamed in (only allows 1 instance of a movie active at one time)
//PARAM NOTES: filename of the gfx file to load, whether game should stop to load or not (should be streamed where possible)
//PURPOSE: Requests that a scaleform movie is streamed in, and is set to ignore super widescreen adjustments
NATIVE FUNC SCALEFORM_INDEX REQUEST_SCALEFORM_MOVIE_WITH_IGNORE_SUPER_WIDESCREEN(STRING filename) = "0xc39d9c4d703fd9fd"

//INFO: Requests that a scaleform movie is streamed in - allows multiple copies of movies
//PARAM NOTES: filename of the gfx file to load, whether game should stop to load or not (should be streamed where possible)
//PURPOSE: Requests that a scaleform movie is streamed in - allows multiple copies of movies
NATIVE FUNC SCALEFORM_INDEX REQUEST_SCALEFORM_MOVIE_INSTANCE(STRING filename) = "0xd9ea500adeac231a"

//INFO: Requests that a scaleform movie is streamed in - allows multiple copies of movies
//PARAM NOTES: filename of the gfx file to load, whether game should stop to load or not (should be streamed where possible)
//PURPOSE: Requests that a scaleform movie is streamed in - allows multiple copies of movies
//	   Same as REQUEST_SCALEFORM_MOVIE, but movie won't render when the game is paused
NATIVE FUNC SCALEFORM_INDEX REQUEST_SCALEFORM_MOVIE_SKIP_RENDER_WHILE_PAUSED(STRING filename) = "0xa002427e922f5cf8"

//INFO: to check if a movie has streamed in yet
//PARAM NOTES: filename of the gfx file we are checking for
//PURPOSE: returns true or false on whether the movie has fully loaded or not
NATIVE FUNC BOOL HAS_SCALEFORM_MOVIE_LOADED(SCALEFORM_INDEX iScaleformMovieId) = "0x0347ccbd719c8adc"

//PURPOSE: returns true or false on whether an active scaleform movie is deleting.
NATIVE FUNC BOOL IS_ACTIVE_SCALEFORM_MOVIE_DELETING(SCALEFORM_INDEX iScaleformMovieId) = "0xa0d8456ab267ed90"

//PURPOSE: returns true or false on whether a movie is flagged for deletion
NATIVE FUNC BOOL IS_SCALEFORM_MOVIE_DELETING(SCALEFORM_INDEX iScaleformMovieId) = "0x46ff72ad8ecb5da0"

//INFO: to check if a movie has streamed in yet
//PARAM NOTES: filename of the gfx file we are checking for
//PURPOSE: returns true or false on whether the movie has fully loaded or not
NATIVE FUNC BOOL HAS_SCALEFORM_MOVIE_FILENAME_LOADED(STRING filename) = "0xa713b1736ec49e9d"

//INFO: returns TRUE if this movie has got a child and its loaded
//PARAM NOTES: parent movie id
//PURPOSE: returns true if the child is loaded, false if its not or it doesnt have a child
NATIVE FUNC BOOL HAS_SCALEFORM_CONTAINER_MOVIE_LOADED_INTO_PARENT(SCALEFORM_INDEX iScaleformMovieId) = "0x4b0e0bd65f1ec72c"

//INFO: sets that the scaleform movie is no longer needed & can be deleted
//PARAM NOTES: filename of the gfx file to remove
//PURPOSE: removes a scaleform movie from script memory
NATIVE PROC SET_SCALEFORM_MOVIE_AS_NO_LONGER_NEEDED(SCALEFORM_INDEX &iScaleformMovieId) = "0x705b098546deb18a"

//INFO: sets that the scaleform movie is no longer needed & can be deleted
//PARAM NOTES: filename of the gfx file to remove
//PURPOSE: removes a scaleform movie from script memory
NATIVE PROC SET_SCALEFORM_MOVIE_TO_USE_SYSTEM_TIME(SCALEFORM_INDEX iScaleformMovieId, bool bUseSystemTime) = "0xd6d689b76f32f4aa"

//INFO: sets that the scaleform movie will be rendered to a large render target (1280x720)
//PARAM NOTES: filename of the gfx file to remove
//PURPOSE: 
NATIVE PROC SET_SCALEFORM_MOVIE_TO_USE_LARGE_RT(SCALEFORM_INDEX iScaleformMovieId, bool bUseLargeRT) = "0x7b2330f209ea5ba9"

//INFO: sets that the scaleform movie will be rendered to a super large render target (2048x1024)
//PARAM NOTES: filename of the gfx file to remove
//PURPOSE: 
NATIVE PROC SET_SCALEFORM_MOVIE_TO_USE_SUPER_LARGE_RT(SCALEFORM_INDEX iScaleformMovieId, bool bUseSuperLargeRT) = "0x56e3c23258531169"

//INFO: calls an actionscript method on the passed in movie
//PARAM NOTES: movie id, actionscript method name, parms (not all need to be filled)
//PURPOSE: 
NATIVE PROC CALL_SCALEFORM_MOVIE_METHOD(SCALEFORM_INDEX iScaleformMovieId, STRING cMethodName) = "0x966fceabcb8fa5e7"

//INFO: calls an actionscript method on the passed in movie
//PARAM NOTES: movie id, actionscript method name, parms (not all need to be filled)
//PURPOSE: 
NATIVE PROC CALL_SCALEFORM_MOVIE_METHOD_WITH_NUMBER(SCALEFORM_INDEX iScaleformMovieId, STRING cMethodName, FLOAT fParam1, FLOAT fParam2 = INVALID_SCALEFORM_PARAM, FLOAT fParam3 = INVALID_SCALEFORM_PARAM, FLOAT fParam4 = INVALID_SCALEFORM_PARAM, FLOAT fParam5 = INVALID_SCALEFORM_PARAM) = "0x3c6414ec6636d573"


//INFO: calls an actionscript method on the passed in movie
//PARAM NOTES: movie id, actionscript method name, parms (not all need to be filled)
//PURPOSE: 
NATIVE PROC CALL_SCALEFORM_MOVIE_METHOD_WITH_STRING(SCALEFORM_INDEX iScaleformMovieId, STRING cMethodName, STRING cParam1, STRING cParam2 = NULL, STRING cParam3 = NULL, STRING cParam4 = NULL, STRING cParam5 = NULL) = "0x2b7e260b913761aa"

//INFO: calls an actionscript method on the passed in movie
//PARAM NOTES: movie id, actionscript method name, parms (not all need to be filled)
//PURPOSE: 
NATIVE PROC CALL_SCALEFORM_MOVIE_METHOD_WITH_NUMBER_AND_STRING(SCALEFORM_INDEX iScaleformMovieId, STRING cMethodName, FLOAT fParam1, FLOAT fParam2 = INVALID_SCALEFORM_PARAM, FLOAT fParam3 = INVALID_SCALEFORM_PARAM, FLOAT fParam4 = INVALID_SCALEFORM_PARAM, FLOAT fParam5 = INVALID_SCALEFORM_PARAM, STRING cParam1 = NULL, STRING cParam2 = NULL, STRING cParam3 = NULL, STRING cParam4 = NULL, STRING cParam5 = NULL) = "0x2e6fa6bfc49a1aa8"


#IF IS_DEBUG_BUILD

//INFO: calls an actionscript method on the passed in movie
//PARAM NOTES: movie id, actionscript method name, parms (not all need to be filled)
//PURPOSE: 
NATIVE PROC CALL_SCALEFORM_MOVIE_METHOD_WITH_LITERAL_STRING(SCALEFORM_INDEX iScaleformMovieId, STRING cMethodName, STRING cParam1, STRING cParam2 = NULL, STRING cParam3 = NULL, STRING cParam4 = NULL, STRING cParam5 = NULL) = "0x5a394c96a0fb1fb7"

//INFO: calls an actionscript method on the passed in movie
//PARAM NOTES: movie id, actionscript method name, parms (not all need to be filled)
//PURPOSE: 
NATIVE PROC CALL_SCALEFORM_MOVIE_METHOD_WITH_NUMBER_AND_LITERAL_STRING(SCALEFORM_INDEX iScaleformMovieId, STRING cMethodName, FLOAT fParam1, FLOAT fParam2 = INVALID_SCALEFORM_PARAM, FLOAT fParam3 = INVALID_SCALEFORM_PARAM, FLOAT fParam4 = INVALID_SCALEFORM_PARAM, FLOAT fParam5 = INVALID_SCALEFORM_PARAM, STRING cParam1 = NULL, STRING cParam2 = NULL, STRING cParam3 = NULL, STRING cParam4 = NULL, STRING cParam5 = NULL) = "0x9aa931d176058dd3"

#ENDIF	//	IS_DEBUG_BUILD



//INFO: start of an actionscript method called on a script hud component
//PARAM NOTES: script hud component id, actionscript method name.  Will return true if successul and false if not
//PURPOSE: 
NATIVE FUNC BOOL BEGIN_SCALEFORM_SCRIPT_HUD_MOVIE_METHOD(eSCRIPT_HUD_COMPONENT iScriptHudId, STRING cMethodName) = "0x1d728abcf062ce8b"

//INFO: start of an actionscript method called on a scaleform movie
//PARAM NOTES: movie id, actionscript method name.  Will return true if successul and false if not
//PURPOSE: 
NATIVE FUNC BOOL BEGIN_SCALEFORM_MOVIE_METHOD(SCALEFORM_INDEX iScaleformMovieId, STRING cMethodName) = "0xea5dea46c3ee64d3"

//INFO: start of an actionscript method called on the main menu content movie
//PARAM NOTES: actionscript method name.  Will return true if successful and false if not
//PURPOSE: 
NATIVE FUNC BOOL BEGIN_SCALEFORM_MOVIE_METHOD_ON_FRONTEND(STRING cMethodName) = "0xca3cb5ce1b9bfe03"

//INFO: start of an actionscript method called on the main menu header movie
//PARAM NOTES: actionscript method name.  Will return true if successful and false if not
//PURPOSE: 
NATIVE FUNC BOOL BEGIN_SCALEFORM_MOVIE_METHOD_ON_FRONTEND_HEADER(STRING cMethodName) = "0x8481f9c297e31e1e"

//INFO: end of an actionscript method called on a scaleform movie
//PARAM NOTES: returns nothing
//PURPOSE: 
NATIVE PROC END_SCALEFORM_MOVIE_METHOD() = "0x6f06cf0e9ab02847"

//INFO: end of an actionscript method called on a scaleform movie and returns an id to retrieve the returned value from
//PARAM NOTES: returns ID for the return value to check
//PURPOSE: 
NATIVE FUNC SCALEFORM_RETURN_INDEX END_SCALEFORM_MOVIE_METHOD_RETURN_VALUE() = "0xd452b47f164a4d79"

//INFO: checks whether the return ID is ready to use yet
//PARAM NOTES: returns an BOOL - with ready or not.   Takes in the return id from END_SCALEFORM_MOVIE_METHOD_RETURN_VALUE
//PURPOSE: 
NATIVE FUNC BOOL IS_SCALEFORM_MOVIE_METHOD_RETURN_VALUE_READY(SCALEFORM_RETURN_INDEX iReturnId) = "0x17e14239fb53cce3"

//INFO: gets the actual return value from the passed return id.
//PARAM NOTES: returns an INT - actual return value
//PURPOSE: 
NATIVE FUNC INT GET_SCALEFORM_MOVIE_METHOD_RETURN_VALUE_INT(SCALEFORM_RETURN_INDEX iReturnId) = "0xc2f770299dffa794"

//INFO: gets the actual return value from the passed return id.
//PARAM NOTES: returns an FLOAT - actual return value
//PURPOSE: 
NATIVE FUNC FLOAT GET_SCALEFORM_MOVIE_METHOD_RETURN_VALUE_FLOAT(SCALEFORM_RETURN_INDEX iReturnId) = "0x309d739d3b353b83"

//INFO: gets the actual return value from the passed return id.
//PARAM NOTES: returns an BOOL - actual return value
//PURPOSE: 
NATIVE FUNC BOOL GET_SCALEFORM_MOVIE_METHOD_RETURN_VALUE_BOOL(SCALEFORM_RETURN_INDEX iReturnId) = "0x5200df159ad62c73"

//INFO: gets the actual return value from the passed return id.
//PARAM NOTES: returns an STRING - actual return value
//PURPOSE: 
NATIVE FUNC STRING GET_SCALEFORM_MOVIE_METHOD_RETURN_VALUE_STRING(SCALEFORM_RETURN_INDEX iReturnId) = "0xad2773d0effe7b10"

//INFO: passes an INT to the method call.  Must be wrapped in a BEGIN & END call but can include other ADD_PARAM calls
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SCALEFORM_MOVIE_METHOD_ADD_PARAM_INT(INT param) = "0x4f47e317c74c543b"

//INFO: passes a FLOAT to the method call.  Must be wrapped in a BEGIN & END call but can include other ADD_PARAM calls
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SCALEFORM_MOVIE_METHOD_ADD_PARAM_FLOAT(FLOAT param) = "0xca5d23e5f0f0306f"

//INFO: passes a BOOL to the method call.  Must be wrapped in a BEGIN & END call but can include other ADD_PARAM calls
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SCALEFORM_MOVIE_METHOD_ADD_PARAM_BOOL(BOOL param) = "0xd7d6ba6e36aec182"

//INFO: passes a STRING to the method call.  Must be wrapped in a BEGIN & END call but can include other ADD_PARAM calls
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC BEGIN_TEXT_COMMAND_SCALEFORM_STRING(STRING pMainTextLabel) = "0x4adc8b166e139423"
NATIVE PROC END_TEXT_COMMAND_SCALEFORM_STRING() = "0xd1d4f8d5470afa4c"

//PURPOSE: Use this instead of END_TEXT_COMMAND_SCALEFORM_STRING when you want to pass a string to scaleform without converting the tokens to html
NATIVE PROC END_TEXT_COMMAND_UNPARSED_SCALEFORM_STRING() = "0x50ba5780e068a6bd"

PROC SCALEFORM_MOVIE_METHOD_ADD_PARAM_STRING(STRING param)
	BEGIN_TEXT_COMMAND_SCALEFORM_STRING(param)
	END_TEXT_COMMAND_SCALEFORM_STRING()
ENDPROC


// PURPOSE: Allows you to pass a player name (entered by the player) to a scaleform method
NATIVE PROC SCALEFORM_MOVIE_METHOD_ADD_PARAM_PLAYER_NAME_STRING(STRING playerName) = "0x341872e4d54cd053"

//PURPOSE: Returns TRUE if there is a string to display with SCALEFORM_MOVIE_METHOD_ADD_PARAM_LATEST_BRIEF_STRING. Returns FALSE if the brief list is empty.
NATIVE FUNC BOOL DOES_LATEST_BRIEF_STRING_EXIST(BRIEF_TYPE iBriefType) = "0x3e9bfa925f24e4ef"

// PURPOSE: Allows you to pass the latest help text string (of the passed type) to a scaleform method
NATIVE PROC SCALEFORM_MOVIE_METHOD_ADD_PARAM_LATEST_BRIEF_STRING(BRIEF_TYPE iBriefType) = "0x511b3958c06bf91b"

/// PURPOSE:
///    Scaleform helper function for adding a player name to the scaleform param list. Skips stringtable lookup
/// PARAMS:
///    sPlayerName - Player name (from GET_PLAYER_NAME()) to add to scaleform
PROC SCALEFORM_MOVIE_METHOD_ADD_PARAM_PLAYER_NAME(STRING sPlayerName)
//	BEGIN_TEXT_COMMAND_SCALEFORM_STRING("STRING")
//		ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(sPlayerName)
//	END_TEXT_COMMAND_SCALEFORM_STRING()
	SCALEFORM_MOVIE_METHOD_ADD_PARAM_PLAYER_NAME_STRING(sPlayerName)
ENDPROC

/// PURPOSE:
///    Scaleform helper function for adding instructional buttons to the scaleform param list. Skips stringtable lookup.
/// PARAMS:
PROC SCALEFORM_MOVIE_METHOD_ADD_PARAM_INSTRUCTIONAL_BUTTONS(STRING sButtons)
	SCALEFORM_MOVIE_METHOD_ADD_PARAM_PLAYER_NAME_STRING(sButtons)
ENDPROC

/// PURPOSE: Allows you to pass a texture name to a scaleform method
NATIVE PROC SCALEFORM_MOVIE_METHOD_ADD_PARAM_TEXTURE_NAME_STRING(STRING textureName) = "0x35395e05c7db18d0"

//INFO: passes a LITERAL STRING to the method call.  Must be wrapped in a BEGIN & END call but can include other ADD_PARAM calls
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SCALEFORM_MOVIE_METHOD_ADD_PARAM_LITERAL_STRING(STRING param) = "0x7909d3fc3439d6fd"

//INFO: Requests that a scaleform script hud movie is streamed in
//PARAM NOTES: component id , whether game should stop to load or not (should be streamed where possible)
//PURPOSE: Requests that a scaleform script hud movie is streamed in
NATIVE PROC REQUEST_SCALEFORM_SCRIPT_HUD_MOVIE(eSCRIPT_HUD_COMPONENT iComponentId) = "0x7d223dd16b5e51f3"

//INFO: Returns whether the requested scaleform script hud movie is streamed in yet
//PARAM NOTES: component id
//PURPOSE: Returns whether the requested scaleform script hud movie is streamed in yet
NATIVE FUNC BOOL HAS_SCALEFORM_SCRIPT_HUD_MOVIE_LOADED(eSCRIPT_HUD_COMPONENT iComponentId) = "0x19b4facadac4d97c"

//INFO: removes a scripted hud movie
//PARAM NOTES: component id
//PURPOSE:
NATIVE PROC REMOVE_SCALEFORM_SCRIPT_HUD_MOVIE(eSCRIPT_HUD_COMPONENT iComponentId) = "0x13858af709184724"

//INFO:
//PARAM NOTES: component id
//PURPOSE: sets a scaleform script hud movie to be at the front
NATIVE FUNC BOOL SET_SCALEFORM_SCRIPT_HUD_MOVIE_TO_FRONT(eSCRIPT_HUD_COMPONENT iComponentId) = "0xb6b203dd3530588a"

//INFO:
//PARAM NOTES: component id
//PURPOSE: sets a scaleform script hud movie to be at the back
NATIVE FUNC BOOL SET_SCALEFORM_SCRIPT_HUD_MOVIE_TO_BACK(eSCRIPT_HUD_COMPONENT iComponentId) = "0x75deee340f06f060"

//INFO:
//PARAM NOTES: component id, target id, whether to put it in front or behind the target (in front is default)
//PURPOSE: sets a scaleform script hud movie to be moved relative to another script hud component
NATIVE FUNC BOOL SET_SCALEFORM_SCRIPT_HUD_MOVIE_RELATIVE_TO_COMPONENT(eSCRIPT_HUD_COMPONENT iIdToMove, eSCRIPT_HUD_COMPONENT iTargetId, BOOL bInFront) = "0x21e91a244f2289b7"

//INFO:
//PARAM NOTES: component id, target id, whether to put it in front or behind the target (in front is default)
//PURPOSE: sets a scaleform script hud movie to be moved relative to a coded hud component
NATIVE FUNC BOOL SET_SCALEFORM_SCRIPT_HUD_MOVIE_RELATIVE_TO_HUD_COMPONENT(eSCRIPT_HUD_COMPONENT iIdToMove, eHUD_COMPONENT iTargetId, BOOL bInFront) = "0x1eabaec732080ce4"

//INFO:
//PARAM NOTES: iScaleformMovieId, the scaleform movie id.
//PURPOSE: sends keyboard input to scaleform. This is only implemented on PC but is safe to call in any build.
//RETURNS: true if there was any text that has been processed.
NATIVE FUNC BOOL PASS_KEYBOARD_INPUT_TO_SCALEFORM(SCALEFORM_INDEX iScaleformMovieId) = "0xcfca4ff4aaca8855"

//INFO:
//PARAM NOTES: iChannel, the channel to set (or TVCHANNELTYPE_CHANNEL_NONE to turn the TV off)
//PURPOSE: turns the TV on by setting a channel that isn't TVCHANNELTYPE_CHANNEL_NONE (which will turn it off)
NATIVE PROC SET_TV_CHANNEL(TVCHANNELTYPE iChannel) = "0x71dfb1e45d792d8c"

//INFO:
//PARAM NOTES: //PURPOSE: Gets the TV Channel currently playing (or TVCHANNELTYPE_CHANNEL_NONE)
NATIVE FUNC TVCHANNELTYPE GET_TV_CHANNEL() = "0xb6859807232d8aed"

//INFO:
//PARAM NOTES: 
//PURPOSE: Sets the TV Volume in decibels
NATIVE PROC SET_TV_VOLUME(FLOAT vol) = "0xcb9476bfd12cd0d4"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the current TV volume in decibels
NATIVE FUNC FLOAT GET_TV_VOLUME() = "0xd6385c54cbbb95cd"

//INFO:
//PARAM NOTES: 
//PURPOSE: Gets the Handle for the current TV Show playing on the TV (or INVALID_MOVIE_HANDLE)
NATIVE FUNC BINK_MOVIE_ID GET_TV_CURRENT_VIDEO_HANDLE() = "0xb2915094eb118ed3"

//INFO:
//PARAM NOTES: CentreX and CentreY define the centre point of the movie. between 0 (top left) and 1 (bottom right) 
//             RGBA set between 0 and 255
//             Rotataion : Rotation is measured in degrees. 
//PURPOSE: Draws the current TV show to the screen.
NATIVE PROC DRAW_TV_CHANNEL(FLOAT CentreX, FLOAT CentreY, FLOAT Width, FLOAT Height, FLOAT Rotation, INT R, INT G, INT B, INT A) = "0x8e2a4f58a41acb36"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the passed channel to the passed playlist
NATIVE PROC SET_TV_CHANNEL_PLAYLIST(TVCHANNELTYPE iChannel, STRING playlistName, BOOL startFromNow = FALSE) = "0xa7ac3c9e15f0a7dd"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the passed channel to the passed playlist, and start time of that playlist in hours (0-23)
NATIVE PROC SET_TV_CHANNEL_PLAYLIST_AT_HOUR(TVCHANNELTYPE iChannel, STRING playlistName, INT iHour) = "0x53c6566a999a13e5"

//INFO:
//PARAM NOTES:
//PURPOSE: Clears any playlist from the passed channel
NATIVE PROC CLEAR_TV_CHANNEL_PLAYLIST(TVCHANNELTYPE iChannel) = "0x7cb074c2d7222200"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns if a specific playlist is set on the specified channel
NATIVE FUNC BOOL IS_PLAYLIST_ON_CHANNEL(TVCHANNELTYPE iChannel, INT nameHash ) = "0x0ad1f14eb34b894c"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns whether the currently playing TV show is this one
NATIVE FUNC BOOL IS_TVSHOW_CURRENTLY_PLAYING(INT nameHash ) = "0x7b8dbf41f99c5da2"

//INFO:
//PARAM NOTES:
//PURPOSE: Force movie switches to be close to a keyframe
NATIVE PROC ENABLE_MOVIE_KEYFRAME_WAIT(BOOL bOnOff) = "0xc367ddff1e85a36b"

//INFO:
//PARAM NOTES:
//PURPOSE: Master switch for subtitles on bink movies
NATIVE PROC ENABLE_MOVIE_SUBTITLES(BOOL bOnOff) = "0x266d7c8b18f0c4db"

//INFO:
//PARAM NOTES:
//PURPOSE: Tell the TV logic we're actually watching TV this frame (call when in the controlling the TV state)
NATIVE PROC SET_TV_PLAYER_WATCHING_THIS_FRAME(PED_INDEX playerIndex) = "0x9a01624727325c8a"

//INFO:
//PARAM NOTES:
//PURPOSE: Get the hash of the currently playing clip through the TV playlist manager
NATIVE FUNC INT GET_CURRENT_TV_CLIP_NAMEHASH() = "0x93e4d3e19bae1398"

//INFO:
//PARAM NOTES:
//PURPOSE:  Returns whether the UI 3D scene manager is not in use already: only one user can interface with the
//	    manager at a given time.
NATIVE FUNC BOOL UI3DSCENE_IS_AVAILABLE() = "0x5e115643a74047b1"

//INFO:
//PARAM NOTES:
//PURPOSE:  Sets the preset as the current one; this needs to be done before assigning peds to the preset slots
//	    It will return false if the preset doesn't exist or if the system is already in use.
NATIVE FUNC BOOL UI3DSCENE_PUSH_PRESET(STRING presetName) = "0x0c008f6397722a9d"

//INFO:
//PARAM NOTES:
//PURPOSE:  Assigns a ped to a given slot (slotIdx) for the currently set preset; the preset must have been set
//	    previously by calling UI3DSCENE_PUSH_PRESET. Call will fail if the preset passed as a parameter does
//	    not match the current preset; it will also fail if the ped index is not valid.
//	    The posOffset parameter allows to adjust the position of a given ped (e.g.: ped is smaller or taller than
//	    the one used for reference when creating the preset).
NATIVE FUNC BOOL UI3DSCENE_ASSIGN_PED_TO_SLOT(STRING presetName, PED_INDEX pedIndex, INT slotIdx, VECTOR posOffset) = "0x2ca227b8534580d8"

//INFO:
//PARAM NOTES:
//PURPOSE:  Assigns a ped to a given slot (slotIdx) for the currently set preset; the preset must have been set
//	    previously by calling UI3DSCENE_PUSH_PRESET. Call will fail if the preset passed as a parameter does
//	    not match the current preset; it will also fail if the ped index is not valid.
//	    The posOffset parameter allows to adjust the position of a given ped (e.g.: ped is smaller or taller than
//	    the one used for reference when creating the preset).
//	    The rotation offset (degrees) will be added to whatever base rotation is defined in the preset.
//	    The rotation will *not* accumulate, so if you want to have a ped spinning around, you need to increment
//	    and store your rotation offset in script and pass that value.
NATIVE FUNC BOOL UI3DSCENE_ASSIGN_PED_TO_SLOT_WITH_ROTATION(STRING presetName, PED_INDEX pedIndex, INT slotIdx, VECTOR posOffset, VECTOR rotOffset) = "0xb290cd949bf7dfad"

//INFO:
//PARAM NOTES:
//PURPOSE:  Overrides the global light intensity for a slot in the currently set preset. This can be used to
//	    dim out peds that are not selected. Range is [0, 1]. The user must reset the slot intensity override
//	    to 1 when it's done with it; otherwise, the override value might propagate to the next use of the slot.
NATIVE PROC UI3DSCENE_ASSIGN_LIGHT_INTENSITY_TO_SLOT(STRING presetName, INT slotIdx, FLOAT intensity) = "0xc1e9f480f69fdd87"

//INFO:
//PARAM NOTES:
//PURPOSE:  This can be called after using a preset that has been patched with peds (eg: UI3DSCENE_ASSIGN_PED_TO_SLOT)
//	    to make sure all the slots are cleared after rendering the peds
NATIVE PROC UI3DSCENE_CLEAR_PATCHED_DATA() = "0x700e5926e4f3c739"

//INFO:
//PARAM NOTES:
//PURPOSE:  This can be called *after* having pushed and patched a preset to automatically keep it rendering
//	    every frame until the persistent flag is disabled. This should only be used in cases where script
//	    is unable to push a preset every frame to keep it rendering (e.g.: script is paused).
//	    No other user can push new presets while UI3DSCENE_MAKE_PUSHED_PRESET_PERSISTENT is enabled.
NATIVE PROC UI3DSCENE_MAKE_PUSHED_PRESET_PERSISTENT(BOOL bEnabled) = "0x4506c9ef247a8e43"


//INFO: 
//PARAM NOTES:     
//PURPOSE:	Enables/disables the terrain grid render
NATIVE PROC TERRAINGRID_ACTIVATE(BOOL bEnable) = "0x3d6f04eb56bd779e"

//INFO: 
//PARAM NOTES:     
//		centrePos is the centre position of the projection box used to draw the grid.
//		dir is a unit vector representing the orientation of the box
//		boxWidth, boxHeight and boxDepth define the dimensions of the projection box (a depth of 1 should be enough in most cases)
//		gridRes determines the size of each cell within the grid
//		colMult is a multiplier applied to the final colour to make grid brighter or more subtle
//		minHeight and maxHeight are the minimum and maximum heights used for the elevation colouring
//		Note that most, if not all of these params should have been gathered via the RAG > Terrain Grid	widget	
//  
//PURPOSE:	Sets all the parameters needed to render a grid
NATIVE PROC TERRAINGRID_SET_PARAMS(VECTOR centrePos, VECTOR dir, FLOAT boxWidth, FLOAT boxHeight, FLOAT boxDepth, FLOAT gridRes, FLOAT colMult, FLOAT minHeight, FLOAT maxHeight) = "0xb1228141e9108e8b"

//INFO: 
//PARAM NOTES:  low - first four RGBA values for grid pixels *below* reference height
//		mid - four RGBA values for grid pixels *at* reference height
//		high - last four RGBA values for grid pixels *above* reference height 
//
//PURPOSE:	Sets the colour mapping for the grid - only needs to be called once
NATIVE PROC TERRAINGRID_SET_COLOURS(INT lowR, INT lowG, INT lowB, INT lowA, INT midR, INT midG, INT midB, INT midA, INT highR, INT highG, INT highB, INT highA) = "0xf48c2023a8ade554"

//INFO: 
//PARAM NOTES:     
//		triggers a predefined animated postfx - durationMs defines the duration in millisecons, pass 0 to trigger the effect
//		with its default duration
//  
NATIVE PROC ANIMPOSTFX_PLAY(STRING effectName, INT durationMs, BOOL playLooped) = "0x9dcf157443ea30d6"

//INFO: 
//PARAM NOTES:     
//		stops a predefined animated postfx
//  
NATIVE PROC ANIMPOSTFX_STOP(STRING effectName) = "0x06a78ba0b756c754"

//INFO: 
//PARAM NOTES:     
//		returns the normalised current time of an animated postfx [0, 1].
//		before using this command, query whether the effect is running (ANIMPOSTFX_IS_RUNNING) as an additional check
NATIVE FUNC FLOAT ANIMPOSTFX_GET_CURRENT_TIME(STRING effectName) = "0x1d6ea79d4857d04a"

//INFO: 
//PARAM NOTES:     
//		returns true if the effect is active or fully faded in for effects that don't disable themselves at the end 
//		of their animation (eg: fade in effects), false otherwise
NATIVE FUNC BOOL ANIMPOSTFX_IS_RUNNING(STRING effectName) = "0x57ba7b498f91c8c8"

//INFO: 
//PARAM NOTES:     
//
NATIVE PROC ANIMPOSTFX_START_CROSSFADE(STRING effectNameToFadeIn, STRING effectNameToFadeOut, INT durationMs) = "0x994fc080f104bdb0"

//INFO: 
//PARAM NOTES:     
//
NATIVE PROC ANIMPOSTFX_STOP_CROSSFADE() = "0xa3653121f541074f"

//INFO: 
//PARAM NOTES:     
//
NATIVE PROC ANIMPOSTFX_STOP_ALL() = "0xde903ac1b5bbc358"

//INFO: 
//PARAM NOTES:     
//
NATIVE PROC ANIMPOSTFX_STOP_AND_FLUSH_REQUESTS(STRING effectName) = "0xeae90b95f698fa2d"

//INFO: 
//PARAM NOTES:     
//		Allows script to track a postfx stack (effectName) that's been setup to trigger events.
//		Returns false if registration failed (e.g.: effect hasn't been set up with event or the effect is already registered)
NATIVE FUNC BOOL ANIMPOSTFX_ADD_LISTENER(STRING effectName) = "0x4ee64f540c89eae1"

//INFO: 
//PARAM NOTES:     
//		Stops listening to events for effectName, previously registered with ANIMPOSTFX_ADD_LISTENER
NATIVE PROC  ANIMPOSTFX_REMOVE_LISTENER(STRING effectName) = "0x7da3eab1f96b3aae"

//INFO: 
//PARAM NOTES:
//		Use this function after registered a listener for effectName (ANIMPOSTFX_ADD_LISTENER), to query whether an event has triggered
//		Returns FALSE if the event hasn't triggered, TRUE otherwise (check details on parameter bIsRegistered below)
//		    - eventType (see ENUM) specifies what type of event the user wants to check for (an effect might be setup to trigger one OR
//		      several types of events (eg: effect start, stop and/on a custom frame)
//		    - bPeekOnly: pass FALSE unless the user wants the event to not be removed (so it can be queried by a different script).
//				 The default behaviour (e.g. when passing FALSE) causes the event to be marked as "consumed" by the user, so
//				 it gets removed from the event queue.
//		    - bIsRegistered: this BOOL will indicate whether the effect is actually registered (i.e. the user has previously called ANIMPOSTFX_ADD_LISTENER)
//				    This output parameter is only for verification purposes.
NATIVE FUNC BOOL ANIMPOSTFX_HAS_EVENT_TRIGGERED(STRING effectName, ANIMPOSTFX_EVENT_TYPE eventType, BOOL bPeekOnly, BOOL& bIsRegistered) = "0x3c80bff96d0c0d36"

//INFO: 
//PARAM NOTES: Default number of frames to reset for is 1    
//PURPOSE:	Reset the PostFX adaptation
NATIVE PROC RESET_ADAPTATION(INT numFrames = 6) = "0xb5cd7c8585f9a098"

//INFO: 
//PURPOSE:	Gradually blurs the screen along Duration (in milliseconds)
//		Once the fade in finishes, the screen will stay blurred until
//		TRIGGER_SCREENBLUR_FADE_OUT or DISABLE_SCREENBLUR_FADE is called
NATIVE FUNC BOOL TRIGGER_SCREENBLUR_FADE_IN(FLOAT Duration) = "0x4c8efafc40f3b914"

//INFO: 
//PURPOSE:	Fades out the blurred screen to its previous state; Duration is in milliseconds
NATIVE FUNC BOOL TRIGGER_SCREENBLUR_FADE_OUT(FLOAT Duration) = "0x789606e3adce39f7"

//INFO: 
//PURPOSE:	Disables the screen blur fade effect
NATIVE PROC DISABLE_SCREENBLUR_FADE() = "0x447303ba4e2014eb"

//INFO: 
//PURPOSE:	Returns the current time (in milliseconds of the fade effect).
//		Returns 0 if no fade was active
NATIVE FUNC FLOAT GET_SCREENBLUR_FADE_CURRENT_TIME() = "0x240b0351428767e8"

//INFO: 
//PURPOSE:	Returns true if the effect is currently active.
//		The active state means the effect is either fading in or out, or fully faded in.
NATIVE FUNC BOOL IS_SCREENBLUR_FADE_RUNNING() = "0xac1e9d879866c4ee"

//INFO: 
//PURPOSE:	Overrides the sniper sight DOF effect.
//PARAM NOTES:
//		enableOverride - toggle override behaviour
//		enableDOF - toggle DOF on/off (some missions might not want to use DOF at all)
NATIVE PROC SET_SNIPERSIGHT_OVERRIDE(BOOL enableOverride, BOOL enableDOF, FLOAT dofNearStart, FLOAT dofNearEnd, FLOAT dofFarStart, FLOAT dofFarEnd) = "0x69c87dbcffd51f17"

//INFO: 
//PURPOSE:	Overrides the adaptive DOF update.
//PARAM NOTES:
NATIVE PROC SET_LOCK_ADAPTIVE_DOF_DISTANCE(BOOL on) = "0x4a97cb479ff4631d"

//INFO: 
//PURPOSE:	Overrides the HI DOF effect.
//PARAM NOTES:
//		enableOverride - toggle override behaviour
//		enableDOF - toggle DOF on/off
NATIVE PROC SET_HIDOF_OVERRIDE(BOOL enableOverride, BOOL enableDOF, FLOAT dofNearStart, FLOAT dofNearEnd, FLOAT dofFarStart, FLOAT dofFarEnd) = "0x892ad63443d79b92"

//INFO: 
//PURPOSE:	Toggles rendering of everything except PostFX. This freezes the screen before the UI pass.
NATIVE PROC TOGGLE_PAUSED_RENDERPHASES(BOOL on) = "0x7e8efd07a6dc03d3"

//INFO: 
//PURPOSE:	Get the status of the render phase pause.
NATIVE FUNC BOOL GET_TOGGLE_PAUSED_RENDERPHASES_STATUS() = "0xc583550fa062b104"

//INFO: 
//PURPOSE:	Reset rendering of everything except PostFX back to ON. This unfreeze every thing and nuke the current's stack state back to 0.
NATIVE PROC RESET_PAUSED_RENDERPHASES() = "0x1c2089bf9d3135d3"

//INFO: 
//PURPOSE:	Enables and Disables the above function, which is also called on open and close of the pause menu.
NATIVE PROC ENABLE_TOGGLE_PAUSED_RENDERPHASES(BOOL on) = "0xc01e2e58980db181"

//INFO: 
//PURPOSE:	Grab ownership (AND FULL RESPONSIBILITY) for the current state of the pausemenu, if it's paused.
NATIVE PROC GRAB_PAUSEMENU_OWNERSHIP() = "0xced819d88937903a"

//INFO:
//PURPOSE:	Disables all occlusion for the current frame only - call each frame as required
NATIVE PROC DISABLE_OCCLUSION_THIS_FRAME() = "0xc1a703145662449b"


//INFO:
//PURPOSE:	Disables all Artifical light sources and emissive bits. Stupidly enough, it takes TRUE to turn them off, and FALSE to turn them on...
NATIVE PROC SET_ARTIFICIAL_LIGHTS_STATE(BOOL bState) = "0xb3e46de3b7be51b0"

//INFO:
//PURPOSE:	Includes/excludes vehicle lights in the effects of command SET_ARTIFICIAL_LIGHTS_STATE(TRUE).
//              TRUE - vehicle lights are included in the EMP (default)
//              FALSE - vehicle lights are excluded from the EMP
NATIVE PROC SET_ARTIFICIAL_VEHICLE_LIGHTS_STATE(BOOL bState) = "0xaae59b2c50deacf5"

//INFO:
//PURPOSE:	Disables ambient hd tex requests for this frame, call each frame as required.
NATIVE PROC DISABLE_HDTEX_THIS_FRAME() = "0x6868e2852ae71199"

//INFO:
//PURPOSE:	Toggles support for custom border image and text for pictures taken with the in-game phone
//		Returns FALSE (and asserts) only if trying to enable it when already enabled or when disabling it
//		while already disabled. If necessary, use PHONEPHOTOEDITOR_IS_ACTIVE to check
NATIVE FUNC BOOL PHONEPHOTOEDITOR_TOGGLE(BOOL bEnable) = "0x3ed60eddc1a35365"

//INFO:
//PURPOSE:	Checks whether the phone photo edit system is enabled
NATIVE FUNC BOOL PHONEPHOTOEDITOR_IS_ACTIVE() = "0x8cd81cdaf32d145a"

//INFO:
//PURPOSE:	Sets the TXD containing the textures for the frame the system will use whenever the next photo is taken with the phone
//		(if PHONEPHOTOEDITOR is active).
//		The passed in TXD *must* be loaded; the PHONEPHOTOEDITOR will assert and fail (this function will return FALSE) otherwise.
//
//		This command can also be used to get rid of the current frame without having to disable the PHONEPHOTOEDITOR:
//		just call PHONEPHOTOEDITOR_SET_FRAME_TXD(NULL, TRUE)
NATIVE FUNC BOOL PHONEPHOTOEDITOR_SET_FRAME_TXD(STRING nameOfLoadedTXDForFrame, BOOL justDisableCurrentFrame = FALSE) = "0xb7bf883d5036c603"

//INFO:
//PURPOSE:	Sets the text (two separate strings) for pictures taken while the PHONEPHOTOEDITOR is active
//		For scrTopText_PosXY_SizeZ and scrBottomText_PosXY_SizeZ, the text position should be in X and Y  and the size in Z
//		For reference, default positions are 0.5, 0.25 for the top text (top middle of the picture) and 0.5, 0.75 for the bottom text.
//		Default text size is 2.5 for the top text and 2 for the bottom text
NATIVE FUNC BOOL PHONEPHOTOEDITOR_SET_TEXT(STRING topText, STRING bottomText, VECTOR scrTopText_PosXY_SizeZ, VECTOR scrBottomText_PosXY_SizeZ, INT topTextR, INT topTextG, INT topTextB, INT topTextA, INT bottomTextR, INT bottomTextG, INT bottomTextB, INT bottomTextA) = "0x77c6b6c06064fc26"


//INFO:
//PURPOSE:	Registers a bullet impact/damage overlay sprite 
//		For scrWeaponWorldPos, a position in world space where the damage is coming from (e.g.: the position of the firing weapon)
//		For intensity, the range is [0, 1]
//		The overlay behaves the same way as those triggered by code (i.e.: once registered, the duration is fixed and they fade out on their own)
NATIVE PROC REGISTER_POSTFX_BULLET_IMPACT(VECTOR scrWeaponWorldPos, FLOAT intensity) = "0x73d010fff76748a7"

//INFO:
//PURPOSE:	Forces bullet impact overlays to render after hud
NATIVE PROC FORCE_POSTFX_BULLET_IMPACTS_AFTER_HUD(BOOL bEnable) = "0x54685eea86e8e51e"
