

ENUM PAD_NUMBER
	PAD1 = 0,
//	PAD2 = 1,
//	PAD3 = 2,
//	PAD4 = 3,
	DEBUG_PAD = 99
ENDENUM


#IF IS_DEBUG_BUILD
//	It's going to take more work to make this Debug-only
//	List of controls on the control pad - must match the order of the switch statement in 
//	GetPadState() in commands_pad.cpp in the games Script directory
ENUM PAD_BUTTON_NUMBER
	LEFTSTICKX = 0,
	LEFTSTICKY = 1,
	RIGHTSTICKX = 2,
	RIGHTSTICKY = 3,
	LEFTSHOULDER1 = 4,
	LEFTSHOULDER2 = 5,
	RIGHTSHOULDER1 = 6,
	RIGHTSHOULDER2 = 7,
	DPADUP = 8,
	DPADDOWN = 9,
	DPADLEFT = 10,
	DPADRIGHT = 11,
	START = 12,
	SELECT = 13,
	SQUARE = 14,
	TRIANGLE = 15,
	CROSS = 16,
	CIRCLE = 17,
	LEFTSHOCK = 18,   // (LEFTSHOULDER3 / the PS3 pad left nipple press)
	RIGHTSHOCK = 19,  // (RIGHTSHOULDER3 / the PS3 pad right nipple press)
	
	NO_BUTTON_PRESSED = 9999 // this was added for using funtions that return a PAD_BUTTON_NUMBER, do not pass this value into any pad commands
		
ENDENUM
#ENDIF	//	IS_DEBUG_BUILD


//	This ENUM should only be used with the SET_INPUT_EVENT scaleform method
ENUM SCALEFORM_INPUT_EVENT

	SCALEFORM_INPUT_EVENT_LEFTSHOULDER1 = 4,
	SCALEFORM_INPUT_EVENT_LEFTSHOULDER2 = 5,
	SCALEFORM_INPUT_EVENT_RIGHTSHOULDER1 = 6,
	SCALEFORM_INPUT_EVENT_RIGHTSHOULDER2 = 7,
	SCALEFORM_INPUT_EVENT_UP = 8,
	SCALEFORM_INPUT_EVENT_DOWN = 9,
	SCALEFORM_INPUT_EVENT_LEFT = 10,
	SCALEFORM_INPUT_EVENT_RIGHT = 11,

	SCALEFORM_INPUT_EVENT_SELECT = 13,
	SCALEFORM_INPUT_EVENT_SQUARE = 14,
	SCALEFORM_INPUT_EVENT_TRIANGLE = 15,
	SCALEFORM_INPUT_EVENT_CROSS = 16,
	SCALEFORM_INPUT_EVENT_CIRCLE = 17,

	SCALEFORM_INPUT_EVENT_LEFT_CLICK = 1001,
	
	SCALEFORM_INPUT_EVENT_INVALID = 9999
ENDENUM

//	It looks like this is used in Release scripts
//	#IF IS_DEBUG_BUILD
//To be used with Actionscript / Scaleform
//To be used to indicate which icon to be used with instructional text
ENUM INSTRUCTIONAL_BUTTON_NUMBER
	
	ICON_UP = 0,
	ICON_DOWN = 1,
	ICON_LEFT = 2,
	ICON_RIGHT = 3,
	ICON_DPAD_UP = 4,
	ICON_DPAD_DOWN = 5,
	ICON_DPAD_LEFT = 6,
	ICON_DPAD_RIGHT = 7,
	ICON_DPAD_NONE = 8,
	ICON_DPAD_ALL = 9,
	ICON_DPAD_UPDOWN = 10,
	ICON_DPAD_LEFTRIGHT = 11,
	ICON_LSTICK_UP = 12,
	ICON_LSTICK_DOWN = 13,
	ICON_LSTICK_LEFT = 14,
	ICON_LSTICK_RIGHT = 15,
	ICON_LSTICK_NONE = 16,
	ICON_LSTICK_ALL1= 17,
	ICON_LSTICK_UPDOWN = 18,
	ICON_LSTICK_LEFTRIGHT = 19,
	ICON_LSTICK_ROTATE = 20,
	ICON_RSTICK_UP = 21,
	ICON_RSTICK_DOWN = 22,
	ICON_RSTICK_LEFT = 23,
	ICON_RSTICK_RIGHT = 24,
	ICON_RSTICK_NONE = 25,
	ICON_RSTICK_ALL = 26,
	ICON_RSTICK_UPDOWN = 27,
	ICON_RSTICK_LEFTRIGHT = 28,
	ICON_RSTICK_ROTATE = 29,
	ICON_BUTTON_A = 30,
	ICON_BUTTON_B = 31,
	ICON_BUTTON_X = 32,
	ICON_BUTTON_Y = 33,
	ICON_BUTTON_LB = 34,
	ICON_BUTTON_LT = 35,
	ICON_BUTTON_RB = 36,
	ICON_BUTTON_RT = 37,
	ICON_BUTTON_START = 38,
	ICON_BUTTON_BACK = 39,
	ICON_SIXAXIS_DRIVE = 40,
	ICON_SIXAXIS_PITCH = 41,
	ICON_SIXAXIS_RELOAD = 42,
	ICON_SIXAXIS_ROLL = 43,
	ICON_SPINNER = 44,
	ICON_GENERIC_UPDOWN_ARROWS = 45,
	ICON_GENERIC_LEFTRIGHT_ARROWS = 46,
	ICON_GENERIC_ALL_ARROWS = 47,
	
	ICON_INVALID = 9999 //Needed for default value
ENDENUM
//	#ENDIF	//	IS_DEBUG_BUILD


ENUM CONTROL_TYPE
	PLAYER_CONTROL = 0,
	CAMERA_CONTROL,
	FRONTEND_CONTROL
ENDENUM

ENUM CONTROL_ACTION

	//////////////////////////////////////////////////////////////////////////
	// General Controls
	//////////////////////////////////////////////////////////////////////////
	// These act as on foot controls but are technically separate.
	//////////////////////////////////////////////////////////////////////////
	INPUT_NEXT_CAMERA = 0,

	// In range -1 (left/up)...+1(right/down). Sign dependent on direction.
	INPUT_LOOK_LR,
	INPUT_LOOK_UD,

	// In range 0...1. All directions positive.
	INPUT_LOOK_UP_ONLY,
	INPUT_LOOK_DOWN_ONLY,
	INPUT_LOOK_LEFT_ONLY,
	INPUT_LOOK_RIGHT_ONLY,

	INPUT_CINEMATIC_SLOWMO,
	INPUT_SCRIPTED_FLY_UD,
	INPUT_SCRIPTED_FLY_LR,
	INPUT_SCRIPTED_FLY_ZUP,
	INPUT_SCRIPTED_FLY_ZDOWN,

	// These are for selecting a position in the weapon wheel
	INPUT_WEAPON_WHEEL_UD,
	INPUT_WEAPON_WHEEL_LR,
	
	// These switches between weapons in the same position of the weapon wheel
	INPUT_WEAPON_WHEEL_NEXT,
	INPUT_WEAPON_WHEEL_PREV,

	// These directly switch to the next weapon (used for a PC mouse).
	INPUT_SELECT_NEXT_WEAPON,
	INPUT_SELECT_PREV_WEAPON,

	INPUT_SKIP_CUTSCENE,
	INPUT_CHARACTER_WHEEL,

	INPUT_MULTIPLAYER_INFO,

	//////////////////////////////////////////////////////////////////////////
	// On Foot Controls
	//////////////////////////////////////////////////////////////////////////
	INPUT_SPRINT,
	INPUT_JUMP,
	INPUT_ENTER,
	INPUT_ATTACK,
	INPUT_AIM,
	INPUT_LOOK_BEHIND,
	INPUT_PHONE,

	INPUT_SPECIAL_ABILITY,
	INPUT_SPECIAL_ABILITY_SECONDARY,

	// In range -1 (left/up)...+1(right/down). Sign dependent on direction.
	INPUT_MOVE_LR,
	INPUT_MOVE_UD,

	// In range 0...1. All directions positive.
	INPUT_MOVE_UP_ONLY,
	INPUT_MOVE_DOWN_ONLY,
	INPUT_MOVE_LEFT_ONLY,
	INPUT_MOVE_RIGHT_ONLY,

	INPUT_DUCK,
	INPUT_SELECT_WEAPON,
	INPUT_PICKUP,
	INPUT_SNIPER_ZOOM,
	INPUT_SNIPER_ZOOM_IN_ONLY,
	INPUT_SNIPER_ZOOM_OUT_ONLY,
	INPUT_SNIPER_ZOOM_IN_SECONDARY,
	INPUT_SNIPER_ZOOM_OUT_SECONDARY,
	INPUT_COVER,
	INPUT_RELOAD,
	INPUT_TALK,
	INPUT_DETONATE,
	INPUT_HUD_SPECIAL,
	INPUT_ARREST,
	INPUT_ACCURATE_AIM,
	INPUT_CONTEXT,
	INPUT_CONTEXT_SECONDARY,
	INPUT_WEAPON_SPECIAL,
	INPUT_WEAPON_SPECIAL_TWO,
	INPUT_DIVE,
	INPUT_DROP_WEAPON,
	INPUT_DROP_AMMO,
	INPUT_THROW_GRENADE,

	//////////////////////////////////////////////////////////////////////////
	// In Vehicle Controls
	//////////////////////////////////////////////////////////////////////////
	// In range -1 (left/up)...+1(right/down). Sign dependent on direction.
	INPUT_VEH_MOVE_LR,
	INPUT_VEH_MOVE_UD,

	// In range 0...1. All directions positive.
	INPUT_VEH_MOVE_UP_ONLY,
	INPUT_VEH_MOVE_DOWN_ONLY,
	INPUT_VEH_MOVE_LEFT_ONLY,
	INPUT_VEH_MOVE_RIGHT_ONLY,

	INPUT_VEH_SPECIAL,
	INPUT_VEH_GUN_LR,
	INPUT_VEH_GUN_UD,
	INPUT_VEH_AIM,
	INPUT_VEH_ATTACK,
	INPUT_VEH_ATTACK2,
	INPUT_VEH_ACCELERATE,
	INPUT_VEH_BRAKE,
	INPUT_VEH_DUCK,
	INPUT_VEH_HEADLIGHT,
	INPUT_VEH_EXIT,
	INPUT_VEH_HANDBRAKE,
	INPUT_VEH_HOTWIRE_LEFT,
	INPUT_VEH_HOTWIRE_RIGHT,
	INPUT_VEH_LOOK_BEHIND,
	INPUT_VEH_CIN_CAM,
	INPUT_VEH_NEXT_RADIO,
	INPUT_VEH_PREV_RADIO,
	INPUT_VEH_NEXT_RADIO_TRACK,
	INPUT_VEH_PREV_RADIO_TRACK,
	INPUT_VEH_RADIO_WHEEL,
	INPUT_VEH_HORN,
	INPUT_VEH_FLY_THROTTLE_UP,
	INPUT_VEH_FLY_THROTTLE_DOWN,
	INPUT_VEH_FLY_YAW_LEFT,
	INPUT_VEH_FLY_YAW_RIGHT,
	INPUT_VEH_PASSENGER_AIM,
	INPUT_VEH_PASSENGER_ATTACK,
	INPUT_VEH_SPECIAL_ABILITY_FRANKLIN,
	INPUT_VEH_STUNT_UD,
	INPUT_VEH_CINEMATIC_UD,
	INPUT_VEH_CINEMATIC_UP_ONLY,
	INPUT_VEH_CINEMATIC_DOWN_ONLY,
	INPUT_VEH_CINEMATIC_LR,
	INPUT_VEH_SELECT_NEXT_WEAPON,
	INPUT_VEH_SELECT_PREV_WEAPON,
	INPUT_VEH_ROOF,
	INPUT_VEH_JUMP, // This is for bikes, try INPUT_VEH_CAR_JUMP
	INPUT_VEH_GRAPPLING_HOOK,
	INPUT_VEH_SHUFFLE,
	INPUT_VEH_DROP_PROJECTILE,
	INPUT_VEH_MOUSE_CONTROL_OVERRIDE,

	//////////////////////////////////////////////////////////////////////////
	// In Aircraft specific Controls
	//////////////////////////////////////////////////////////////////////////

	INPUT_VEH_FLY_ROLL_LR,
	INPUT_VEH_FLY_ROLL_LEFT_ONLY,
	INPUT_VEH_FLY_ROLL_RIGHT_ONLY,
	INPUT_VEH_FLY_PITCH_UD,
	INPUT_VEH_FLY_PITCH_UP_ONLY,
	INPUT_VEH_FLY_PITCH_DOWN_ONLY,
	INPUT_VEH_FLY_UNDERCARRIAGE,
	INPUT_VEH_FLY_ATTACK,
	INPUT_VEH_FLY_SELECT_NEXT_WEAPON,
	INPUT_VEH_FLY_SELECT_PREV_WEAPON,
	INPUT_VEH_FLY_SELECT_TARGET_LEFT,
	INPUT_VEH_FLY_SELECT_TARGET_RIGHT,
	INPUT_VEH_FLY_VERTICAL_FLIGHT_MODE,
	INPUT_VEH_FLY_DUCK,
	INPUT_VEH_FLY_ATTACK_CAMERA,
	INPUT_VEH_FLY_MOUSE_CONTROL_OVERRIDE,

	//////////////////////////////////////////////////////////////////////////
	// In Sub Controls
	//////////////////////////////////////////////////////////////////////////

	INPUT_VEH_SUB_TURN_LR,
	INPUT_VEH_SUB_TURN_LEFT_ONLY,
	INPUT_VEH_SUB_TURN_RIGHT_ONLY,
	INPUT_VEH_SUB_PITCH_UD,
	INPUT_VEH_SUB_PITCH_UP_ONLY,
	INPUT_VEH_SUB_PITCH_DOWN_ONLY,
	INPUT_VEH_SUB_THROTTLE_UP,
	INPUT_VEH_SUB_THROTTLE_DOWN,
	INPUT_VEH_SUB_ASCEND,
	INPUT_VEH_SUB_DESCEND,
	INPUT_VEH_SUB_TURN_HARD_LEFT,
	INPUT_VEH_SUB_TURN_HARD_RIGHT,
	INPUT_VEH_SUB_MOUSE_CONTROL_OVERRIDE,

	//////////////////////////////////////////////////////////////////////////
	// On Pushbike Controls
	//////////////////////////////////////////////////////////////////////////
	
	INPUT_VEH_PUSHBIKE_PEDAL,
	INPUT_VEH_PUSHBIKE_SPRINT,
	INPUT_VEH_PUSHBIKE_FRONT_BRAKE,
	INPUT_VEH_PUSHBIKE_REAR_BRAKE,

	//////////////////////////////////////////////////////////////////////////
	// Melee Combat Controls
	//////////////////////////////////////////////////////////////////////////
	INPUT_MELEE_ATTACK_LIGHT,
	INPUT_MELEE_ATTACK_HEAVY,
	INPUT_MELEE_ATTACK_ALTERNATE,
	INPUT_MELEE_BLOCK,
	
	//////////////////////////////////////////////////////////////////////////
	// Parachute Controls
	//////////////////////////////////////////////////////////////////////////
	INPUT_PARACHUTE_DEPLOY,
	INPUT_PARACHUTE_DETACH,
	INPUT_PARACHUTE_TURN_LR,
	INPUT_PARACHUTE_TURN_LEFT_ONLY,
	INPUT_PARACHUTE_TURN_RIGHT_ONLY,
	INPUT_PARACHUTE_PITCH_UD,
	INPUT_PARACHUTE_PITCH_UP_ONLY,
	INPUT_PARACHUTE_PITCH_DOWN_ONLY,
	INPUT_PARACHUTE_BRAKE_LEFT,
	INPUT_PARACHUTE_BRAKE_RIGHT,
	INPUT_PARACHUTE_SMOKE,
	INPUT_PARACHUTE_PRECISION_LANDING,

	//////////////////////////////////////////////////////////////////////////
	// PC Specific
	//////////////////////////////////////////////////////////////////////////
	INPUT_MAP,

	INPUT_SELECT_WEAPON_UNARMED,
	INPUT_SELECT_WEAPON_MELEE,
	INPUT_SELECT_WEAPON_HANDGUN,
	INPUT_SELECT_WEAPON_SHOTGUN,
	INPUT_SELECT_WEAPON_SMG,
	INPUT_SELECT_WEAPON_AUTO_RIFLE,
	INPUT_SELECT_WEAPON_SNIPER,
	INPUT_SELECT_WEAPON_HEAVY,
	INPUT_SELECT_WEAPON_SPECIAL,

	INPUT_SELECT_CHARACTER_MICHAEL,
	INPUT_SELECT_CHARACTER_FRANKLIN,
	INPUT_SELECT_CHARACTER_TREVOR,
	INPUT_SELECT_CHARACTER_MULTIPLAYER,

	INPUT_SAVE_REPLAY_CLIP,
	INPUT_SPECIAL_ABILITY_PC, // This is so you can have the same input for both on foot and in-car special abilities on PC

	//////////////////////////////////////////////////////////////////////////
	// Cellphone Controls
	//////////////////////////////////////////////////////////////////////////
	INPUT_CELLPHONE_UP,
	INPUT_CELLPHONE_DOWN,
	INPUT_CELLPHONE_LEFT,
	INPUT_CELLPHONE_RIGHT,
	INPUT_CELLPHONE_SELECT,
	INPUT_CELLPHONE_CANCEL,
	INPUT_CELLPHONE_OPTION,
	INPUT_CELLPHONE_EXTRA_OPTION,
	INPUT_CELLPHONE_SCROLL_FORWARD,
	INPUT_CELLPHONE_SCROLL_BACKWARD,
	INPUT_CELLPHONE_CAMERA_FOCUS_LOCK,
	INPUT_CELLPHONE_CAMERA_GRID,
	INPUT_CELLPHONE_CAMERA_SELFIE,
	INPUT_CELLPHONE_CAMERA_DOF,
	INPUT_CELLPHONE_CAMERA_EXPRESSION,

	//////////////////////////////////////////////////////////////////////////
	// Direct Controls. Used By Frontend ONLY.
	//////////////////////////////////////////////////////////////////////////
	INPUT_FRONTEND_DOWN,
	INPUT_FRONTEND_UP,
	INPUT_FRONTEND_LEFT,
	INPUT_FRONTEND_RIGHT,
	INPUT_FRONTEND_RDOWN,
	INPUT_FRONTEND_RUP,
	INPUT_FRONTEND_RLEFT,
	INPUT_FRONTEND_RRIGHT,
	INPUT_FRONTEND_AXIS_X,
	INPUT_FRONTEND_AXIS_Y,
	INPUT_FRONTEND_RIGHT_AXIS_X,
	INPUT_FRONTEND_RIGHT_AXIS_Y,
	INPUT_FRONTEND_PAUSE,
	INPUT_FRONTEND_PAUSE_ALTERNATE,		// Alternate pause to get around conflict issues with Esc going back on PC.
	INPUT_FRONTEND_ACCEPT,
	INPUT_FRONTEND_CANCEL,
	INPUT_FRONTEND_X,
	INPUT_FRONTEND_Y,
	INPUT_FRONTEND_LB,
	INPUT_FRONTEND_RB,
	INPUT_FRONTEND_LT,
	INPUT_FRONTEND_RT,
	INPUT_FRONTEND_LS,
	INPUT_FRONTEND_RS,
	INPUT_FRONTEND_LEADERBOARD,
	INPUT_FRONTEND_SOCIAL_CLUB,
	INPUT_FRONTEND_SOCIAL_CLUB_SECONDARY,
	INPUT_FRONTEND_DELETE,
	INPUT_FRONTEND_ENDSCREEN_ACCEPT,
	INPUT_FRONTEND_ENDSCREEN_EXPAND,
	INPUT_FRONTEND_SELECT, // DP: ensure you update INPUT_FRONTEND_CONTROL_END if you add any more frontend input! 


	////////////////////////////////////////////////////////////////////////////////////////////////////
	// Remappable Script controls. For use in minigames and other scripts using a custom control scheme
	// instead of direct pad controls and non-remappable front end controls
	///////////////////////////////////////////////////////////////////////////////////////////////////


	INPUT_SCRIPT_LEFT_AXIS_X,	// Left stick X analogue input. Values may be > 1 when using a mouse. Usually maps to movement
	INPUT_SCRIPT_LEFT_AXIS_Y,	// Left stick Y analogue input. Values may be > 1 when using a mouse. Usually maps to movement
	INPUT_SCRIPT_RIGHT_AXIS_X,	// Right stick X analogue input. Values may be > 1 when using a mouse. Usually maps to look.
	INPUT_SCRIPT_RIGHT_AXIS_Y,	// Right stick Y analogue input. Values may be > 1 when using a mouse. Usually maps to look.
	INPUT_SCRIPT_RUP,		// PS3 = TRIANGLE, 360 = Y
	INPUT_SCRIPT_RDOWN,		// PS3 = X, 360 = A
	INPUT_SCRIPT_RLEFT,		// PS3 = SQUARE, 360 = X
	INPUT_SCRIPT_RRIGHT,		// PS3 = CIRCLE, 360 = B
	INPUT_SCRIPT_LB,		// Left shoulder button
	INPUT_SCRIPT_RB,		// Right shoulder button
	INPUT_SCRIPT_LT,		// Left shoulder trigger  - DIGITAL ONLY
	INPUT_SCRIPT_RT,		// Right shoulder trigger - DIGITAL ONLY
	INPUT_SCRIPT_LS,		// Left stick L3 button,
	INPUT_SCRIPT_RS,		// Right stick R3 button
	INPUT_SCRIPT_PAD_UP,		// D-Pad / Directional buttons up
	INPUT_SCRIPT_PAD_DOWN,		// D-Pad / Directional buttons down
	INPUT_SCRIPT_PAD_LEFT,		// D-Pad / Directional buttons left
	INPUT_SCRIPT_PAD_RIGHT,		// D-Pad / Directional buttons right
	INPUT_SCRIPT_SELECT,		// Back button on 360, select on PS3


	//////////////////////////////////////////////////////////////////////////
	// NEXT GEN AND PC
	//////////////////////////////////////////////////////////////////////////

	INPUT_CURSOR_ACCEPT,		// Touch pad click or mouse button 1 click
	INPUT_CURSOR_CANCEL,		// Mouse button 2 click
	INPUT_CURSOR_X,				// The cursor X position in the range of 0...1.
	INPUT_CURSOR_Y,				// The cursor Y position in the range of 0...1.
	INPUT_CURSOR_SCROLL_UP,		// Scroll up, e.g. mouse wheel
	INPUT_CURSOR_SCROLL_DOWN,	// Scroll down, e.g. mouse wheel
	INPUT_ENTER_CHEAT_CODE,		// Brings up the cheat code input box.
	INPUT_INTERACTION_MENU,		// Brings up the interaction menu.
	INPUT_MP_TEXT_CHAT_ALL,		// Brings up text chat box. Message sent to all players on a server.
	INPUT_MP_TEXT_CHAT_TEAM,	// Brings up text chat box. Message sent to all players on in the current team.
	INPUT_MP_TEXT_CHAT_FRIENDS, // Brings up text chat box. Message sent to all friends on a server
	INPUT_MP_TEXT_CHAT_CREW,	// Brings up text chat box. Message sent to all crew on a server
	INPUT_PC_PUSH_TO_TALK,		// Push to talk for VOIP
	INPUT_CREATOR_LS,			// Creator Left stick equivalent for functions like field of view, etc.
	INPUT_CREATOR_RS,			// Creator right stick equivalent for functions like field of view, etc.
	INPUT_CREATOR_LT,			// Creator left trigger equivalent for zooming.
	INPUT_CREATOR_RT,			// Creator right trigger equivalent for zooming.
	INPUT_CREATOR_MENU_TOGGLE,	// Creator menu toggle on/off for PC keyboard and mouse.
	INPUT_CREATOR_ACCEPT,		// Creator accept/place items button.
	INPUT_CREATOR_DELETE,		// Creator delete items button.

	//////////////////////////////////////////////////////////////////////////
	// LEGACY SUPPORT
	//////////////////////////////////////////////////////////////////////////
	// Remove once legacy input support has been removed. Also, update
	// GetValue()!
	//////////////////////////////////////////////////////////////////////////
	INPUT_ATTACK2, // Know one knows what this does!
	INPUT_RAPPEL_JUMP,
	INPUT_RAPPEL_LONG_JUMP,
	INPUT_RAPPEL_SMASH_WINDOW,

	// The weapon selecting works differently now. These are temporarily mapped to the weapon wheel. NOTE: the weapon can be switched in other ways than the weapon wheel on PC
	// So these are NOT portable.
	INPUT_PREV_WEAPON,
	INPUT_NEXT_WEAPON,


	INPUT_MELEE_ATTACK1,	// This has been renamed to INPUT_MELEE_ATTACK_LIGHT. If this should be kept as it is, let me know thomas.randall@rockstarleeds.com
	INPUT_MELEE_ATTACK2,	// This has been renamed to INPUT_MELEE_ATTACK_HEAVY. If this should be kept as it is, let me know thomas.randall@rockstarleeds.com

	INPUT_WHISTLE,	// This is mapped to nothing and is not used anywhere, it is added here so scripts work. If this should be kept let me know thomas.randall@rockstarleeds.com

	INPUT_MOVE_LEFT,
	INPUT_MOVE_RIGHT,
	INPUT_MOVE_UP,
	INPUT_MOVE_DOWN,
	INPUT_LOOK_LEFT,
	INPUT_LOOK_RIGHT,
	INPUT_LOOK_UP,
	INPUT_LOOK_DOWN,
	INPUT_SNIPER_ZOOM_IN,
	INPUT_SNIPER_ZOOM_OUT,
	INPUT_SNIPER_ZOOM_IN_ALTERNATE,
	INPUT_SNIPER_ZOOM_OUT_ALTERNATE,

	INPUT_VEH_MOVE_LEFT,
	INPUT_VEH_MOVE_RIGHT,
	INPUT_VEH_MOVE_UP,
	INPUT_VEH_MOVE_DOWN,
	INPUT_VEH_GUN_LEFT,
	INPUT_VEH_GUN_RIGHT,
	INPUT_VEH_GUN_UP,
	INPUT_VEH_GUN_DOWN,
	INPUT_VEH_LOOK_LEFT,
	INPUT_VEH_LOOK_RIGHT,
	
	INPUT_REPLAY_START_STOP_RECORDING,
	INPUT_REPLAY_START_STOP_RECORDING_SECONDARY,

	INPUT_SCALED_LOOK_LR,
	INPUT_SCALED_LOOK_UD,
	INPUT_SCALED_LOOK_UP_ONLY,
	INPUT_SCALED_LOOK_DOWN_ONLY,
	INPUT_SCALED_LOOK_LEFT_ONLY,
	INPUT_SCALED_LOOK_RIGHT_ONLY,

	INPUT_REPLAY_MARKER_DELETE,
	INPUT_REPLAY_CLIP_DELETE,
	INPUT_REPLAY_PAUSE,
	INPUT_REPLAY_REWIND,
	INPUT_REPLAY_FFWD,
	INPUT_REPLAY_NEWMARKER,
	INPUT_REPLAY_RECORD,
	INPUT_REPLAY_SCREENSHOT,
	INPUT_REPLAY_HIDEHUD,
	INPUT_REPLAY_STARTPOINT,
	INPUT_REPLAY_ENDPOINT,
	INPUT_REPLAY_ADVANCE,
	INPUT_REPLAY_BACK,
	INPUT_REPLAY_TOOLS,
	INPUT_REPLAY_RESTART,
	INPUT_REPLAY_SHOWHOTKEY,
	INPUT_REPLAY_CYCLEMARKERLEFT,
	INPUT_REPLAY_CYCLEMARKERRIGHT,
	INPUT_REPLAY_FOVINCREASE,
	INPUT_REPLAY_FOVDECREASE,
	INPUT_REPLAY_CAMERAUP,
	INPUT_REPLAY_CAMERADOWN,
	INPUT_REPLAY_SAVE,
	INPUT_REPLAY_TOGGLETIME,
	INPUT_REPLAY_TOGGLETIPS,
	INPUT_REPLAY_PREVIEW,
	INPUT_REPLAY_TOGGLE_TIMELINE,
	INPUT_REPLAY_TIMELINE_PICKUP_CLIP,
	INPUT_REPLAY_TIMELINE_DUPLICATE_CLIP,
	INPUT_REPLAY_TIMELINE_PLACE_CLIP,
	INPUT_REPLAY_CTRL,
	INPUT_REPLAY_TIMELINE_SAVE,
	INPUT_REPLAY_PREVIEW_AUDIO,

	INPUT_VEH_DRIVE_LOOK,
	INPUT_VEH_DRIVE_LOOK2,

	INPUT_VEH_FLY_ATTACK2,

	INPUT_RADIO_WHEEL_UD,
	INPUT_RADIO_WHEEL_LR,

	INPUT_VEH_SLOWMO_UP,
	INPUT_VEH_SLOWMO_UP_ONLY,
	INPUT_VEH_SLOWMO_DOWN_ONLY,

	INPUT_VEH_HYDRAULICS_CONTROL_TOGGLE,
	INPUT_VEH_HYDRAULICS_CONTROL_LEFT,
	INPUT_VEH_HYDRAULICS_CONTROL_RIGHT,
	INPUT_VEH_HYDRAULICS_CONTROL_UP,
	INPUT_VEH_HYDRAULICS_CONTROL_DOWN,
	INPUT_VEH_HYDRAULICS_CONTROL_LR,
	INPUT_VEH_HYDRAULICS_CONTROL_UD,

	INPUT_SWITCH_VISOR,

	INPUT_VEH_MELEE_HOLD,
	INPUT_VEH_MELEE_LEFT,
	INPUT_VEH_MELEE_RIGHT,
	
    INPUT_MAP_POI, 
    INPUT_REPLAY_SNAPMATIC_PHOTO, 

    INPUT_VEH_CAR_JUMP, 
    INPUT_VEH_ROCKET_BOOST, 
	INPUT_VEH_FLY_BOOST,
    INPUT_VEH_PARACHUTE, 
    INPUT_VEH_BIKE_WINGS, 

    INPUT_VEH_FLY_BOMB_BAY,
    INPUT_VEH_FLY_COUNTER,
	INPUT_VEH_TRANSFORM,
	INPUT_QUAD_LOCO_REVERSE,
	INPUT_RESPAWN_FASTER,
	// INPUT_CNC_INTERACT_ATM,  temp removed because of ARCHIVED_SUMMER_CONTENT_ENABLED
	INPUT_HUDMARKER_SELECT,

	INPUT_EAT_SNACK,
	INPUT_USE_ARMOR,
	MAX_INPUTS
ENDENUM


ENUM CONTROL_ACTION_GROUP
    	INPUTGROUP_MOVE = 0,
    	INPUTGROUP_LOOK,
    	INPUTGROUP_WHEEL, 
    	INPUTGROUP_CELLPHONE_NAVIGATE, 
    	INPUTGROUP_CELLPHONE_NAVIGATE_UD,
    	INPUTGROUP_CELLPHONE_NAVIGATE_LR, 
    	INPUTGROUP_FRONTEND_DPAD_ALL, 
    	INPUTGROUP_FRONTEND_DPAD_UD, 
    	INPUTGROUP_FRONTEND_DPAD_LR,
    	INPUTGROUP_FRONTEND_LSTICK_ALL, 
    	INPUTGROUP_FRONTEND_RSTICK_ALL, 
    	INPUTGROUP_FRONTEND_GENERIC_UD, 
    	INPUTGROUP_FRONTEND_GENERIC_LR, 
    	INPUTGROUP_FRONTEND_GENERIC_ALL, 
		INPUTGROUP_FRONTEND_BUMPERS,
		INPUTGROUP_FRONTEND_TRIGGERS,
		INPUTGROUP_FRONTEND_STICKS,
    	INPUTGROUP_SCRIPT_DPAD_ALL, 
    	INPUTGROUP_SCRIPT_DPAD_UD,
    	INPUTGROUP_SCRIPT_DPAD_LR, 
    	INPUTGROUP_SCRIPT_LSTICK_ALL, 
    	INPUTGROUP_SCRIPT_RSTICK_ALL, 
    	INPUTGROUP_SCRIPT_BUMPERS, 
    	INPUTGROUP_SCRIPT_TRIGGERS, 
    	INPUTGROUP_WEAPON_WHEEL_CYCLE, 
    	INPUTGROUP_FLY, 
    	INPUTGROUP_SUB, 
    	INPUTGROUP_VEH_MOVE_ALL, 
		INPUTGROUP_CURSOR,
		INPUTGROUP_CURSOR_SCROLL,
		INPUTGROUP_SNIPER_ZOOM_SECONDARY,
		INPUTGROUP_VEH_HYDRAULICS_CONTROL,

    	MAX_INPUTGROUPS 
ENDENUM

ENUM MOTION_PREFERENCE
	MP_HELI = 0,			// Helis and Planes
	MP_BIKE = 1,
	MP_BOAT = 2,
	MP_AFTERTOUCH = 3,		// Vehicle aftertouch
	MP_RELOAD = 4,
	MP_ACTIVITY = 5			// e.g. Darts, bowling
ENDENUM

#IF IS_DEBUG_BUILD
//INFO:
//PARAM NOTES:  PadLabel should be either PAD1 or PAD2.  
//	ButtonNumber should be one of the names in the KEY_NUMBER
// PURPOSE:  Returns TRUE if the specified button on the specified controller is being pressed/used. More info..
NATIVE FUNC BOOL IS_BUTTON_PRESSED(PAD_NUMBER PadNumber, PAD_BUTTON_NUMBER ButtonNumber) = "0x7bdf096145218859"

//INFO:
//PARAM NOTES:  PadLabel should be either PAD1 or PAD2.  
//	ButtonNumber should be one of the names in the KEY_NUMBER
// PURPOSE:  Returns TRUE if the specified button on the specified controller is not being pressed/used. More info..
NATIVE FUNC BOOL IS_BUTTON_RELEASED(PAD_NUMBER PadNumber, PAD_BUTTON_NUMBER ButtonNumber) = "0xb7d69f6a253b695f"

//INFO:
//PARAM NOTES:  PadLabel should be either PAD1 or PAD2. 
//	ButtonLabel should be one of the names in the Control Pad Button List
// PURPOSE: Returns TRUE if the specified button on the specified controller is has been pressed this frame. More info..
NATIVE FUNC BOOL IS_BUTTON_JUST_PRESSED(PAD_NUMBER PadNumber, PAD_BUTTON_NUMBER ButtonNumber) = "0x4f1e7dda6834e8d4"

//INFO:
//PARAM NOTES:  PadLabel should be either PAD1 or PAD2. 
//	ButtonLabel should be one of the names in the Control Pad Button List
// PURPOSE: Returns TRUE if the specified button on the specified controller is has been released this frame. More info..
NATIVE FUNC BOOL IS_BUTTON_JUST_RELEASED(PAD_NUMBER PadNumber, PAD_BUTTON_NUMBER ButtonNumber) = "0xbd9daa2a34bb6051"

//PARAM NOTES:  PadLabel should be either PAD1 or PAD2. 
//ButtonLabel should be one of the names in the Control Pad Button List
// PURPOSE: Returns the values of the specified button on the specified controller for this frame
NATIVE FUNC INT GET_BUTTON_VALUE(PAD_NUMBER PadNumber, PAD_BUTTON_NUMBER ButtonNumber) = "0x75a69523a8ec1a39"

//INFO: 
//PARAM NOTES: A value of 0 means that the stick is in the central position. 
// PURPOSE: Gets the position of analogue stickes between -128 and 128. More info..
NATIVE PROC GET_POSITION_OF_ANALOGUE_STICKS(PAD_NUMBER PadNumber, INT &ReturnLeftX, INT &ReturnLeftY, INT &ReturnRightX, INT &ReturnRightY) = "0x4188d4863c710507"
#ENDIF	//	IS_DEBUG_BUILD

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets a light device to a constant color (if there is one).
NATIVE PROC SET_CONTROL_LIGHT_EFFECT_COLOR(CONTROL_TYPE control, INT red, INT green, INT blue) = "0x2638db8310d6ee6b"

//INFO: 
//PARAM NOTES:
// PURPOSE: Clears any set colors on a light device.
NATIVE PROC CLEAR_CONTROL_LIGHT_EFFECT(CONTROL_TYPE control) = "0xe16df1340f6a4f39"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return if controller button related to an action is down.
NATIVE FUNC BOOL IS_CONTROL_PRESSED(CONTROL_TYPE control, CONTROL_ACTION action) = "0x4c1b8c5717647539"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return if controller button related to an action is up.
NATIVE FUNC BOOL IS_CONTROL_RELEASED(CONTROL_TYPE control, CONTROL_ACTION action) = "0x98e8b3ffceda25a5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return if controller button related to an action has just been pressed down.
NATIVE FUNC BOOL IS_CONTROL_JUST_PRESSED(CONTROL_TYPE control, CONTROL_ACTION action) = "0xf09a4f413b0d30eb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return if controller button related to an action has just been release up.
NATIVE FUNC BOOL IS_CONTROL_JUST_RELEASED(CONTROL_TYPE control, CONTROL_ACTION action) = "0x26009f50a14ad073"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return controller value related to an action (range 0 to 255)
NATIVE FUNC INT GET_CONTROL_VALUE(CONTROL_TYPE control, CONTROL_ACTION action) = "0xf439ff1991626cb9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns a mouse value adjusted for 3x1 and eyefinity coords
NATIVE FUNC FLOAT GET_ADJUSTED_MOUSE_VALUE(FLOAT fValue) = "0xa3f7d2ce2a1a994a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return controller value related to an action (range between -1 to +1)
NATIVE FUNC FLOAT GET_CONTROL_NORMAL(CONTROL_TYPE control, CONTROL_ACTION action) = "0x664c0a1bf5e133fa"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set if you want to use the adjusted mouse coords
NATIVE PROC SET_USE_ADJUSTED_MOUSE_COORDS(BOOL control) = "0x4522e5855673d159"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets it we are currently using the adjusted mouse coords
NATIVE FUNC FLOAT GET_USE_ADJUSTED_MOUSE_COORDS() = "0xa99cfcb5427dde55"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return controller value related to an action (range generally between -1 to +1 but can exceed this, usually by a mouse)
NATIVE FUNC FLOAT GET_CONTROL_UNBOUND_NORMAL(CONTROL_TYPE control, CONTROL_ACTION action) = "0x3bf65cf27f6cfbbe"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets a control value for a give CONTROL_ACTION.
// RETURNS: TRUE if the value was set. If this turns false then the control is disabled.
NATIVE FUNC BOOL SET_CONTROL_VALUE_NEXT_FRAME(CONTROL_TYPE control, CONTROL_ACTION action, FLOAT value) = "0x9b3ae3991f75ef59"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return if controller button related to an action is down even if the control is disabled.
NATIVE FUNC BOOL IS_DISABLED_CONTROL_PRESSED(CONTROL_TYPE control, CONTROL_ACTION action) = "0x0dba73788f6e3c5f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return if controller button related to an action is up even if the control is disabled.
NATIVE FUNC BOOL IS_DISABLED_CONTROL_RELEASED(CONTROL_TYPE control, CONTROL_ACTION action) = "0x154529612c25bc17"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return if controller button related to an action has just been pressed down even if the control is disabled.
NATIVE FUNC BOOL IS_DISABLED_CONTROL_JUST_PRESSED(CONTROL_TYPE control, CONTROL_ACTION action) = "0xf01464d7af0b7347"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return if controller button related to an action has just been release up even if the control is disabled.
NATIVE FUNC BOOL IS_DISABLED_CONTROL_JUST_RELEASED(CONTROL_TYPE control, CONTROL_ACTION action) = "0x51844f589d928a86"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return controller value related to an action (range between -1 to +1) even if the control is disabled.
NATIVE FUNC FLOAT GET_DISABLED_CONTROL_NORMAL(CONTROL_TYPE control, CONTROL_ACTION action) = "0x159f9b5a2920df4e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return controller value related to an action (range generally between -1 to +1 but can exceed this, usually by a mouse) even if the control is disabled.
NATIVE FUNC FLOAT GET_DISABLED_CONTROL_UNBOUND_NORMAL(CONTROL_TYPE control, CONTROL_ACTION action) = "0x1ec2077a4d963881"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return how long ago a control last had a value (in milliseconds).
NATIVE FUNC INT GET_CONTROL_HOW_LONG_AGO(CONTROL_TYPE control) = "0xadb86701a67cb7e4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return how long ago a disabled control last had a value (in milliseconds).
NATIVE FUNC INT GET_DISABLED_CONTROL_HOW_LONG_AGO(CONTROL_TYPE control) = "0x8587c8c397743fd1"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the player is using keyboard and mouse controls.
NATIVE FUNC BOOL IS_USING_KEYBOARD_AND_MOUSE(CONTROL_TYPE control) = "0x3a76a0944be2c291"




//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the cursor CONTROL_ACTIONS are valid (e.g. on a touchpad, the touchpad is actually being touched).
//NOTES:   When this returns false, the values inside the cursor CONTROL_ACTIONS will be zero.
NATIVE FUNC BOOL IS_USING_CURSOR(CONTROL_TYPE control) = "0xe360d4c4ce76e4bb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the mouse cursor position on the PC version.
//NOTES:   Returns true if the cursor position was succesfully set (also returns false on platforms not supported).
NATIVE FUNC BOOL SET_CURSOR_POSITION(FLOAT x, FLOAT y) = "0x2969b478ff4db4df"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the the player is playing on a remote play device.
NATIVE FUNC BOOL IS_USING_REMOTE_PLAY(CONTROL_TYPE control) = "0xff31e3ef4ed19ceb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if controls have changed since the last call to this function, this can happen if the user changes their control options,
//		   switches between FPS and TPS mode, or between gamepad and keyboard/mouse.
NATIVE FUNC BOOL HAVE_CONTROLS_CHANGED(CONTROL_TYPE control) = "0xb1c1e679bd17a4f0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return the INSTRUCTIONAL_BUTTON_NUMBER of a CONTROL_ACTION. ICON_INVALID will be returned on error!
//NOTES:   This function is deprecated and will be removed! Use GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING instead.
NATIVE FUNC INSTRUCTIONAL_BUTTON_NUMBER GET_CONTROL_INSTRUCTIONAL_BUTTON(CONTROL_TYPE control, CONTROL_ACTION action, BOOL allowXOSwap = TRUE) = "0x43366bdb17bb18dc"

//INFO: 
//PURPOSE: Return an encoded string of the icon to show of a CONTROL_ACTION. empty string will be returned on error!
NATIVE FUNC STRING GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING(CONTROL_TYPE control, CONTROL_ACTION action, BOOL allowXOSwap = TRUE) = "0x2018949b2c9fd96a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Return the INSTRUCTIONAL_BUTTON_NUMBER of a CONTROL_ACTION_GROUP. ICON_INVALID will be returned on error!
//NOTES:   This function is deprecated and will be removed! Use GET_CONTROL_GROUP_INSTRUCTIONAL_BUTTONS_STRING instead.
NATIVE FUNC INSTRUCTIONAL_BUTTON_NUMBER GET_CONTROL_GROUP_INSTRUCTIONAL_BUTTON(CONTROL_TYPE control, CONTROL_ACTION_GROUP actionGroup, BOOL allowXOSwap = TRUE) = "0x4463abaac9f67f70"

//INFO: 
//PURPOSE: Return an encoded string of the icon to show of a CONTROL_ACTION. empty string will be returned on error!
NATIVE FUNC STRING GET_CONTROL_GROUP_INSTRUCTIONAL_BUTTONS_STRING(CONTROL_TYPE control, CONTROL_ACTION_GROUP actionGroup, BOOL allowXOSwap = TRUE) = "0x19214818f925d149"

/// Special gamepad icons

//INFO:
// PURPOSE:  Returns the TEXT_LABEL_63 that represents the Left Stick Rotate icon.
FUNC STRING GET_ICON_LSTICK_ROTATE_STRING()
      STRING label = "b_20"
      return label
ENDFUNC

//INFO:
// PURPOSE:  Returns the TEXT_LABEL_63 that represents the Right Stick Rotate icon.
FUNC STRING GET_ICON_RSTICK_ROTATE_STRING()
      STRING label = "b_29"
      return label
ENDFUNC

//INFO:
// PURPOSE:  Returns the TEXT_LABEL_63 that represents the Sixaxis Drive icon.
FUNC STRING GET_ICON_SIXAXIS_DRIVE_STRING()
      STRING label = "b_40"
      return label
ENDFUNC

//INFO:
// PURPOSE:  Returns the TEXT_LABEL_63 that represents the Sixaxis Pitch icon.
FUNC STRING GET_ICON_SIXAXIS_PITCH_STRING()
      STRING label = "b_41"
      return label
ENDFUNC

//INFO:
// PURPOSE:  Returns the TEXT_LABEL_63 that represents the Sixaxis Reload icon.
FUNC STRING GET_ICON_SIXAXIS_RELOAD_STRING()
      STRING label = "b_42"
      return label
ENDFUNC

//INFO:
// PURPOSE:  Returns the TEXT_LABEL_63 that represents the Sixaxis Roll icon.
FUNC STRING GET_ICON_SIXAXIS_ROLL_STRING()
      STRING label = "b_43"
      return label
ENDFUNC

//INFO:
// PURPOSE:  Returns the TEXT_LABEL_63 that represents the Spinner icon.
FUNC STRING GET_ICON_SPINNER_STRING()
      STRING label = "b_44"
      return label
ENDFUNC


//INFO:
//PARAM NOTES:
//PURPOSE: Return true if the control is disabled.
NATIVE FUNC BOOL IS_CONTROL_ENABLED(CONTROL_TYPE control, CONTROL_ACTION action) = "0xf98ff61cd2d3500d"

//INFO: 
//PARAM NOTES: Frequency should be less than 256.
//	Duration is in milliseconds
// PURPOSE: Causes the given Pad, assigned to a Control, to shake. More info..
NATIVE PROC SET_CONTROL_SHAKE(CONTROL_TYPE control, INT Duration, INT Frequency) = "0xf7a14a1a76b6dd17"

//INFO: 
//PARAM NOTES: Frequency should be less than 256.
//	Duration is in milliseconds
// PURPOSE: Causes the given Pad, assigned to a Control, to shake its triggers. More info..
NATIVE PROC SET_CONTROL_TRIGGER_SHAKE(CONTROL_TYPE control, INT leftDuration, INT leftFrequency, INT rightDuration, INT rightFrequency) = "0xf8bf168f565017ef"

//INFO:
// PURPOSE: Stops the given Pad, assigned to a Control, from shaking. More info..
NATIVE PROC STOP_CONTROL_SHAKE(CONTROL_TYPE control) = "0xf4ab1adb142fd39d"

//INFO:
// PURPOSE: Suppresses vibrations on a given control's pad when id set to other than -1, clear on -1
//			or call CLEAR_CONTROL_SHAKE_SUPPRESSED_ID.
NATIVE PROC SET_CONTROL_SHAKE_SUPPRESSED_ID(CONTROL_TYPE control, INT SupressId) = "0x6120122451823936"

//INFO:
// PURPOSE: Clears a supress id passed to SET_CONTROL_SHAKE_SUPPRESSED_ID.
NATIVE PROC CLEAR_CONTROL_SHAKE_SUPPRESSED_ID(CONTROL_TYPE control) = "0xf3f6c6e90b9afc5d"

//INFO: 
//PARAM NOTES:
// PURPOSE: Checks if the gamepad look is inverted.
NATIVE FUNC BOOL IS_LOOK_INVERTED() = "0xc63a09aa9006f776"

//INFO: 
//PARAM NOTES:
// PURPOSE: Checks if the mouse y look is inverted.
// NOTES:   Will return false for platforms that do not support the mouse. This does not mean the player is playing with a
//          mouse, they could be playing on a gamepad.
NATIVE FUNC BOOL IS_MOUSE_LOOK_INVERTED() = "0x2ed671f67654fd28"

//INFO: 
//PARAM NOTES:
// PURPOSE: Returns current player aim state (sometimes GET_PROFILE_SETTINGS doesn't return the correct one if not saved)
// NOTES:	Will return free aim when the player is playing on the keyboard and mouse.
NATIVE FUNC INT GET_LOCAL_PLAYER_AIM_STATE() = "0x6f8ba9ef200e4310"


//INFO: 
//PARAM NOTES:
// PURPOSE: Returns current player aim state (sometimes GET_PROFILE_SETTINGS doesn't return the correct one if not saved)
// NOTES:	Will return the gamepad setting even if the player is playing on the keyboard and mouse.
NATIVE FUNC INT GET_LOCAL_PLAYER_GAMEPAD_AIM_STATE() = "0x4d3f908dba3908e4"

//INFO: 
//PARAM NOTES:
// PURPOSE: Returns whether the player has the alternate handbrake profile option set (switching INPUT_VEH_HANDBRAKE and INPUT_VEH_DUCK)
NATIVE FUNC BOOL GET_IS_USING_ALTERNATE_HANDBRAKE() = "0xb6b1a58467f8a268"

//INFO: 
//PARAM NOTES:
// PURPOSE: Returns whether the player has the alternate driveby profile option set
NATIVE FUNC BOOL GET_IS_USING_ALTERNATE_DRIVEBY() = "0xc77fd7c62139abaa"

//INFO: 
//PARAM NOTES:
// PURPOSE: Returns if player can move while zoomed (sometimes GET_PROFILE_SETTINGS doesn't return the correct one if not saved)
NATIVE FUNC BOOL GET_ALLOW_MOVEMENT_WHILE_ZOOMED() = "0x78711a80544b2439"

//INFO: 
//PARAM NOTES:
// PURPOSE:  Set a flag to true so that pad shake is on when the controller is disabled.
NATIVE PROC SET_PLAYERPAD_SHAKES_WHEN_CONTROLLER_DISABLED(BOOL bSetPadShakes) = "0x802687ca71bc8666"

//INFO: 
//PARAM NOTES:
// PURPOSE:  returns whether standard (true) or classic (false) pad control.
NATIVE FUNC BOOL IS_USING_STANDARD_CONTROLS() = "0xb36d171806697a81"


//~>						Motion control commands							<~

//INFO: 
//PARAM NOTES:
// PURPOSE: Returns True/false if motion controls are enabled / disabled.
NATIVE FUNC BOOL GET_PAD_PITCH_ROLL(PAD_NUMBER PadNumber, FLOAT &pitch, FLOAT &roll) = "0xeae8ff32a35b6797"

//INFO: 
//PARAM NOTES:
// PURPOSE:  Returns true/false if motion controls are enabled / disabled.
NATIVE FUNC BOOL HAS_RELOADED_WITH_MOTION_CONTROL(PAD_NUMBER PadNumber, BOOL &bHasReloaded) = "0xcabdedf70abe69db"

//INFO: 
//PARAM NOTES:
// PURPOSE:Force all profile settings to do with motion control to be on or off.
NATIVE PROC SET_ALL_MOTION_CONTROL_PREFERENCES(BOOL bPreferencesActive) = "0xec16f157ca752992"

//INFO: 
//PARAM NOTES:
// PURPOSE: Use to see if the user has a certain motion control preference turned on / off in the frontend
// RETURN: Will always return false on 360, or if no motion controller exists on ps3. More info..
NATIVE FUNC BOOL GET_MOTION_CONTROL_PREFERENCE(MOTION_PREFERENCE prefType) = "0x8e4183c5edc441b3"

//INFO: 
//PARAM NOTES:
// PURPOSE: Sets an input to recieve exclusive input for 1 frame only. This will disable all inputs that
//			are associated to the same buttons except for this one.
NATIVE PROC SET_INPUT_EXCLUSIVE (CONTROL_TYPE control, CONTROL_ACTION action) = "0x07899aaa5d680386"

//INFO: 
//PARAM NOTES: If disableRelatedActions is true, related inputs will also be disabled. For example, disabling INPUT_SELECT_WEAPON
//             will also disable INPUT_SELECT_WEAPON_UNARMED (and others) so no weapon can be selected.
// PURPOSE:
// RETURN:  Disables the given action for 1 frame. 
NATIVE PROC DISABLE_CONTROL_ACTION (CONTROL_TYPE control, CONTROL_ACTION action, BOOL disableRelatedActions = TRUE) = "0x7653d561c9574763"

//INFO: 
//PARAM NOTES: If enableRelatedActions is true, related inputs will also be enabled. For example, enabling INPUT_SELECT_WEAPON
//             will also enable INPUT_SELECT_WEAPON_UNARMED (and others) so the weapon can be selected by the other means.
// PURPOSE:
// RETURN:  Enables the given action for 1 frame. 
NATIVE PROC ENABLE_CONTROL_ACTION (CONTROL_TYPE control, CONTROL_ACTION action, BOOL enableRelatedActions = TRUE) = "0x5089dd830fa61d71"

//INFO: 
//PARAM NOTES:
// PURPOSE: Disables all the inputs for a player control.
NATIVE PROC DISABLE_ALL_CONTROL_ACTIONS (CONTROL_TYPE control) = "0x58699da34f83b510"

//INFO: 
//PARAM NOTES:
// PURPOSE: Enables all the inputs for a player control.
NATIVE PROC ENABLE_ALL_CONTROL_ACTIONS (CONTROL_TYPE control) = "0xa308468b6494bc8b"

//INFO: 
//PARAM NOTES:
// PURPOSE: Initialises the dynamic scripted control schemes system and loads the specified sceme.
// NOTES:   SHUTDOWN_PC_SCRIPTED_CONTROLS() must be called when finished.
NATIVE FUNC BOOL INIT_PC_SCRIPTED_CONTROLS (STRING SchemeName) = "0x9e4a185a00c358e1"

//INFO: 
//PARAM NOTES:
// PURPOSE: Switched to a different PC dynamic scripted control scheme once the dynamic control system is already initialised.
// NOTES:   This should only be called to switch to another control sceme when the dynamic system is loaded.
NATIVE FUNC BOOL SWITCH_PC_SCRIPTED_CONTROLS (STRING SchemeName) = "0x870fdfbb89c863ca"

//INFO: 
//PARAM NOTES:
// PURPOSE: Shuts-down PC dynamic scripted control schemes.
NATIVE PROC SHUTDOWN_PC_SCRIPTED_CONTROLS () = "0x027f803a942fb98f"

//INFO: 
//PARAM NOTES:
// PURPOSE: Switches INPUT_SCRIPT_* controls to use alternative layouts.
// NOTES:	This must be called every frame or else the controls revert back to defaults. The INPUT_SCRIPT_* controls mimic a PS3/Xbox
//			gamepad, however, the user may change the control layout in the settings. Some mission/script might need to know this.
//			For example, if the INPUT_SCRIPT_* controls are being used to control movement and the camera, then the script need to know
//			if the player has selected Southpaw (sticks are swapped) mode. Calling ALLOW_ALTERNATIVE_SCRIPT_CONTROLS_LAYOUT() every frame
//			will calculate this for you so you can carry on using the INPUT_SCRIPT_* controls as if they were the standard layout when infact
//			they are actually altered to reflect the user preferences.
//				Some scripts/mission will *NOT* want this, for example, Yoga asks the user to move specific sticks. In this case, not calling
//			ALLOW_ALTERNATIVE_SCRIPT_CONTROLS_LAYOUT() will default to use the standard gamepad layout no matter what the user has set their
//			settings to. 
NATIVE PROC ALLOW_ALTERNATIVE_SCRIPT_CONTROLS_LAYOUT (CONTROL_TYPE control) = "0x7bc5e5a5ff7f278f"


#IF IS_DEBUG_BUILD
//INFO: 
//PARAM NOTES:
// PURPOSE:
// RETURN:  Disables the given button for 1 frame. 
NATIVE PROC DISABLE_CONTROL_BUTTON (CONTROL_TYPE control, PAD_BUTTON_NUMBER ButtonNumber) = "0x2a51b0600c959ac9"
#ENDIF	//	IS_DEBUG_BUILD

#IF IS_DEBUG_BUILD
ENUM KEY_NUMBER

// this was chosen to match Windows virtual key layout layout
// the KEY_ values are system-independent

	KEY_BACK                    = 8,   // 0x08,        // Backspace. -- These key-code correspond to the virtual key codes (VK_*) in windows.
	KEY_TAB                     = 9,   // 0x09, 
	KEY_CLEAR                   = 12,  // 0x0C, 
	KEY_RETURN                  = 13,  // 0x0D,        // 'Enter' on main keyboard.
	KEY_PAUSE                   = 19,  // 0x13,        // Pause.
	KEY_CAPITAL                 = 20,  // 0x14, 
	KEY_KANA                    = 21,  // 0x15,        // (Japanese keyboard).
	KEY_JUNJA                   = 23,  // 0x17, 
	KEY_FINAL                   = 24,  // 0x18, 
	KEY_KANJI                   = 25,  // 0x19,        // (Japanese keyboard).
	KEY_ESCAPE                  = 27,  // 0x1B, 
	KEY_CONVERT                 = 28,  // 0x1C,        // (Japanese keyboard).
	KEY_NOCONVERT               = 29,  // 0x1D,        // (Japanese keyboard).
	KEY_ACCEPT                  = 30,  // 0x1E, 
	KEY_MODECHANGE              = 31,  // 0x1F, 
	KEY_SPACE                   = 32,  // 0x20, 
	KEY_PAGEUP                  = 33,  // 0x21,        // PgUp.
	KEY_PRIOR                   = 33,  // 0x21,        // PgUp on arrow keypad.
	KEY_PAGEDOWN                = 34,  // 0x22,        // PgDn.
	KEY_NEXT                    = 34,  // 0x22,        // PgDn on arrow keypad.
	KEY_END                     = 35,  // 0x23,        // End on arrow keypad.
	KEY_HOME                    = 36,  // 0x24,        // Home on arrow keypad.
	KEY_LEFT                    = 37,  // 0x25,        // LeftArrow on arrow keypad.
	KEY_UP                      = 38,  // 0x26,        // UpArrow on arrow keypad.
	KEY_RIGHT                   = 39,  // 0x27,        // RightArrow on arrow keypad.
	KEY_DOWN                    = 40,  // 0x28,        // DownArrow on arrow keypad.
	KEY_SELECT                  = 41,  // 0x29, 
	KEY_PRINT                   = 42,  // 0x2A,
	KEY_SYSRQ                   = 19,  // 0x2A,        // SysRq. NOTE: Here for legacy support, use KEY_PRINT instead.
	KEY_EXE                     = 43,  // 0x2B,        // Execute.
	KEY_SNAPSHOT                = 44,  // 0x2C, 
	KEY_INSERT                  = 45,  // 0x2D,        // Insert on arrow keypad.
	KEY_DELETE                  = 46,  // 0x2E,        // Delete on arrow keypad.
	KEY_HELP                    = 47,  // 0x2F, 
	KEY_0                       = 48,  // 0x30, 
	KEY_1                       = 49,  // 0x31, 
	KEY_2                       = 50,  // 0x32, 
	KEY_3                       = 51,  // 0x33, 
	KEY_4                       = 52,  // 0x34, 
	KEY_5                       = 53,  // 0x35, 
	KEY_6                       = 54,  // 0x36, 
	KEY_7                       = 55,  // 0x37, 
	KEY_8                       = 56,  // 0x38, 
	KEY_9                       = 57,  // 0x39, 
	KEY_A                       = 65,  // 0x41, 
	KEY_B                       = 66,  // 0x42, 
	KEY_C                       = 67,  // 0x43, 
	KEY_D                       = 68,  // 0x44, 
	KEY_E                       = 69,  // 0x45, 
	KEY_F                       = 70,  // 0x46, 
	KEY_G                       = 71,  // 0x47, 
	KEY_H                       = 72,  // 0x48, 
	KEY_I                       = 73,  // 0x49, 
	KEY_J                       = 74,  // 0x4A, 
	KEY_K                       = 75,  // 0x4B, 
	KEY_L                       = 76,  // 0x4C, 
	KEY_M                       = 77,  // 0x4D, 
	KEY_N                       = 78,  // 0x4E, 
	KEY_O                       = 79,  // 0x4F, 
	KEY_P                       = 80,  // 0x50, 
	KEY_Q                       = 81,  // 0x51, 
	KEY_R                       = 82,  // 0x52, 
	KEY_S                       = 83,  // 0x53, 
	KEY_T                       = 84,  // 0x54, 
	KEY_U                       = 85,  // 0x55, 
	KEY_V                       = 86,  // 0x56, 
	KEY_W                       = 87,  // 0x57, 
	KEY_X                       = 88,  // 0x58, 
	KEY_Y                       = 89,  // 0x59, 
	KEY_Z                       = 90,  // 0x5A, 
	KEY_LWIN                    = 91,  // 0x5B,        // Left Windows key.
	KEY_RWIN                    = 92,  // 0x5C,        // Right Windows key.
	KEY_APPS                    = 93,  // 0x5D,        // AppMenu key.
	KEY_SLEEP                   = 95,  // 0x5F,        // System Sleep.
	KEY_NUMPAD0                 = 96,  // 0x60, 
	KEY_NUMPAD1                 = 97,  // 0x61, 
	KEY_NUMPAD2                 = 98,  // 0x62, 
	KEY_NUMPAD3                 = 99,  // 0x63, 
	KEY_NUMPAD4                 = 100, // 0x64, 
	KEY_NUMPAD5                 = 101, // 0x65, 
	KEY_NUMPAD6                 = 102, // 0x66, 
	KEY_NUMPAD7                 = 103, // 0x67, 
	KEY_NUMPAD8                 = 104, // 0x68, 
	KEY_NUMPAD9                 = 105, // 0x69, 
	KEY_MULTIPLY                = 106, // 0x6A,        // '*' on numeric keypad.
	KEY_ADD                     = 107, // 0x6B,        // '+' on numeric keypad.
	KEY_SEPARATOR               = 108, // 0x6C, 
	KEY_SUBTRACT                = 109, // 0x6D,        // '-' on numeric keypad.
	KEY_DECIMAL                 = 110, // 0x6E,        // '.' on numeric keypad.
	KEY_DIVIDE                  = 111, // 0x6F,        // '/' on numeric keypad.
	KEY_F1                      = 112, // 0x70, 
	KEY_F2                      = 113, // 0x71, 
	KEY_F3                      = 114, // 0x72, 
	KEY_F4                      = 115, // 0x73, 
	KEY_F5                      = 116, // 0x74, 
	KEY_F6                      = 117, // 0x75, 
	KEY_F7                      = 118, // 0x76, 
	KEY_F8                      = 119, // 0x77, 
	KEY_F9                      = 120, // 0x78, 
	KEY_F10                     = 121, // 0x79, 
	KEY_F11                     = 122, // 0x7A, 
	KEY_F12                     = 123, // 0x7B, 
	KEY_F13                     = 124, // 0x7C,        // (NEC PC98).
	KEY_F14                     = 125, // 0x7D,        // (NEC PC98).
	KEY_F15                     = 126, // 0x7E,        // (NEC PC98).
	KEY_F16                     = 127, // 0x7F, 
	KEY_F17                     = 128, // 0x80, 
	KEY_F18                     = 129, // 0x81, 
	KEY_F19                     = 130, // 0x82, 
	KEY_F20                     = 131, // 0x83, 
	KEY_F21                     = 132, // 0x84, 
	KEY_F22                     = 133, // 0x85, 
	KEY_F23                     = 134, // 0x86, 
	KEY_F24                     = 135, // 0x87, 
	KEY_NUMLOCK                 = 144, // 0x90, 
	KEY_SCROLL                  = 145, // 0x91,        // Scroll Lock.
	KEY_NUMPADEQUALS            = 146, // 0x92,        // '=' on numeric keypad (NEC PC98).
	key_FJ_JISHO                = 146, // 0x92,        // Fujitsu/OASYS 'Dictionary' Key.
	key_FJ_MASSHOU              = 147, // 0x93,        // Fujitsu/OASYS 'Unregister word' Key.
	key_FJ_TOUROKU              = 148, // 0x94,        // Fujitsu/OASYS 'Register word' Key.
	key_FJ_LOYA                 = 149, // 0x95,        // Fujitsu/OASYS 'Left OYAYUBI' Key.
	key_FJ_ROYA                 = 150, // 0x96,        // Fujitsu/OASYS 'Right OYAYUBI' Key.
	KEY_LSHIFT                  = 160, // 0xA0, 
	KEY_RSHIFT                  = 161, // 0xA1, 
	KEY_LCONTROL                = 162, // 0xA2, 
	KEY_RCONTROL                = 163, // 0xA3, 
	KEY_LMENU                   = 164, // 0xA4,        // Left Alt.
	KEY_RMENU                   = 165, // 0xA5,        // Right Alt.
	KEY_WEBBACK                 = 166, // 0xA6,        // Web Back.
	KEY_WEBFORWARD              = 167, // 0xA7,        // Web Forward.
	KEY_WEBREFRESH              = 168, // 0xA8,        // Web Refresh.
	KEY_WEBSTOP                 = 169, // 0xA9,        // Web Stop.
	KEY_WEBSEARCH               = 170, // 0xAA,        // Web Search.
	KEY_WEBFAVORITES            = 171, // 0xAB,        // Web Favorites.
	KEY_WEBHOME                 = 172, // 0xAC,        // Web home.
	KEY_MUTE                    = 173, // 0xAD,        // Mute.
	KEY_VOLUMEDOWN              = 174, // 0xAE,        // Volume '-'.
	KEY_VOLUMEUP                = 175, // 0xAF,        // Volume '+'.
	KEY_NEXTTRACK               = 176, // 0xB0,        // Next Track.
	KEY_PREVTRACK               = 177, // 0xB1,        // Previous Track (KEY_CIRCUMFLEX on Japanese keyboard).
	KEY_MEDIASTOP               = 178, // 0xB2,        // Media Stop.
	KEY_PLAYPAUSE               = 179, // 0xB3,        // Play / Pause.
	KEY_MAIL                    = 180, // 0xB4,        // Mail.
	KEY_MEDIASELECT             = 181, // 0xB5,        // Media Select.
	KEY_LAUNCHAPP1              = 182, // 0xB6, 
	KEY_LAUNCHAPP2              = 183, // 0xB7, 
	KEY_SEMICOLON               = 186, // 0xBA,        // Actually eq. VK_OEM_1 that might not be ;: on international keyboards.
	KEY_OEM_1                   = 186, // 0xBA,
	KEY_PLUS                    = 187, // 0xBB,        // Actually eq. VK_OEM_PLUS that might not be = on international keyboards.
	KEY_EQUALS                  = 187, // 0xBB,        // LEGACY, DO NOT USE. Use KEY_PLUS as it may not the equals key on interational keyboards.
	KEY_COMMA                   = 188, // 0xBC, 
	KEY_MINUS                   = 189, // 0xBD,        // '-' on main keyboard.
	KEY_PERIOD                  = 190, // 0xBE,        // '.' on main keyboard.
	KEY_SLASH                   = 191, // 0xBF,        // Actually eq. VK_OEM_2 that might not be /? on international keyboards.
	KEY_OEM_2                   = 191, // 0xBF,
	KEY_TILDE                   = 192, // 0xC0,        // Actually eq. VK_OEM_3 that might not be ~ on international (non-US) keyboards.
	KEY_OEM_3                   = 192, // 0xC0, 
	KEY_LBRACKET                = 219, // 0xDB,        // Actually eq. VK_OEM_4 that might not be [{ on international keyboards.
	KEY_OEM_4                   = 219, // 0xDB,
	KEY_BACKSLASH               = 220, // 0xDC,        // Actually eq. VK_OEM_5 that might not be \| on international keyboards.
	KEY_OEM_5                   = 220, // 0xDC,
	KEY_RBRACKET                = 221, // 0xDD,        // Actually eq. VK_OEM_6 that might not be ]} on international keyboards.
	KEY_OEM_6                   = 221, // 0xDD,
	KEY_APOSTROPHE              = 222, // 0xDE,        // Actually eq. VK_OEM_7 that might not be '" on international keyboards.
	KEY_OEM_7                   = 222, // 0xDE,
	KEY_GRAVE                   = 223, // 0xDF,        // Actually eq. VK_OEM_8 that might not be ` on international (non-UK) keyboards.
	KEY_OEM_8                   = 223, // 0xDF, 
	KEY_AX                      = 225, // 0xE1,        // (Japan AX).
	KEY_OEM_102                 = 226, // 0xE2,        // < < | on UK/Germany keyboards.
	KEY_ICO_HELP                = 227, // 0xE3,        // Help on ICO.
	KEY_ICO_00                  = 228, // 0xE4,        // 00 on ICO
	KEY_PROCESSKEY              = 229, // 0xE5, 
	KEY_ICO_CLEAR               = 230, // 0xE6, 
	KEY_PACKET                  = 231, // 0xE7, 
	KEY_NUMPADENTER             = 253, // 0xFD,                                                     // Enter on numeric keypad.
	KEY_CHATPAD_GREEN_SHIFT     = 254, // 0xFE,                                                     // Xbox 360 chatpad green shift.
	KEY_CHATPAD_ORANGE_SHIFT    = 255  // 0xFF,

ENDENUM

ENUM MOUSE_BUTTON
	MB_LEFT_BTN = 1,
	MB_RIGHT_BTN = 2
ENDENUM

// Has to match with enum at the top of keyboard.h
ENUM KEYBOARD_MODIFIER
	KEYBOARD_MODIFIER_NONE = 0,
	KEYBOARD_MODIFIER_SHIFT = 13,
	KEYBOARD_MODIFIER_CTRL = 14,
	KEYBOARD_MODIFIER_ALT = 15,
	KEYBOARD_MODIFIER_CTRL_SHIFT = 17
ENDENUM

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks for keys in Level Design keyboard mode.
NATIVE FUNC BOOL IS_DEBUG_KEY_PRESSED(KEY_NUMBER KeyNumber, KEYBOARD_MODIFIER KeyboardModifier, STRING pDescriptionOfUse) = "0x70cea47cea5148b2"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks for keys in Level Design keyboard mode.
NATIVE FUNC BOOL IS_DEBUG_KEY_RELEASED(KEY_NUMBER KeyNumber, KEYBOARD_MODIFIER KeyboardModifier, STRING pDescriptionOfUse) = "0x9283c20d88f9aa74"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks for keys in Level Design keyboard mode.
NATIVE FUNC BOOL IS_DEBUG_KEY_JUST_PRESSED(KEY_NUMBER KeyNumber, KEYBOARD_MODIFIER KeyboardModifier, STRING pDescriptionOfUse) = "0x765fbb5f50ea1ba4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks for keys in Level Design keyboard mode.
NATIVE FUNC BOOL IS_DEBUG_KEY_JUST_RELEASED(KEY_NUMBER KeyNumber, KEYBOARD_MODIFIER KeyboardModifier, STRING pDescriptionOfUse) = "0xea3a04fc4ef2369a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks for keys in Level Design keyboard mode.
NATIVE FUNC BOOL IS_KEYBOARD_KEY_PRESSED(KEY_NUMBER KeyNumber) = "0x5c5e9e56793fe873"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks for keys in Level Design keyboard mode.
NATIVE FUNC BOOL IS_KEYBOARD_KEY_RELEASED(KEY_NUMBER KeyNumber) = "0x54513f1f06e805b9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks for keys in Level Design keyboard mode
NATIVE FUNC BOOL IS_KEYBOARD_KEY_JUST_PRESSED(KEY_NUMBER KeyNumber) = "0xd8a25bbf7491d032"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks for keys in Level Design keyboard mode
NATIVE FUNC BOOL IS_KEYBOARD_KEY_JUST_RELEASED(KEY_NUMBER KeyNumber) = "0x1c31a69e6cc1e85f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks for keys in Game keyboard mode
NATIVE FUNC BOOL IS_GAME_KEYBOARD_KEY_PRESSED(KEY_NUMBER KeyNumber) = "0x5985a1aa8005975a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks for keys in Game keyboard mode
NATIVE FUNC BOOL IS_GAME_KEYBOARD_KEY_RELEASED(KEY_NUMBER KeyNumber) = "0x9e122ff04ae5d18d"

//INFO: 
//PARAM NOTES:
//	
//PURPOSE: Checks for keys in Game keyboard mode
NATIVE FUNC BOOL IS_GAME_KEYBOARD_KEY_JUST_PRESSED(KEY_NUMBER KeyNumber) = "0xc956318cc1099f68"

//INFO: 
//PARAM NOTES:
//	
//PURPOSE: Checks for keys in Game keyboard mode
NATIVE FUNC BOOL IS_GAME_KEYBOARD_KEY_JUST_RELEASED(KEY_NUMBER KeyNumber) = "0x3665b5dfbe67b932"

//INFO: 
//PARAM NOTES:	
//PURPOSE: Fakes a keypress. The next frame the IS_..._KEY_PRESSED etc functions will return this key has been pressed
NATIVE PROC FAKE_KEY_PRESS(KEY_NUMBER KeyNumber) = "0x8fc2e3197963de0a"


ENUM KEYBOARD_MODE
	KEYBOARD_MODE_DEBUG = 0,	// standard
	KEYBOARD_MODE_GAME,			// game/script
	KEYBOARD_MODE_MARKETING		// marketing tools
ENDENUM


NATIVE FUNC KEYBOARD_MODE GET_KEYBOARD_MODE() = "0x165be0f2a9685a34"

NATIVE PROC SET_KEYBOARD_MODE(KEYBOARD_MODE NewKeyboardMode) = "0xbb6490cf594af527"


//INFO: 
//PARAM NOTES:
// PURPOSE:
// RETURN: Gets the x,y position of the mouse pointer on the screen. Starting top left 0.0 to bottom right 1.0
NATIVE PROC  GET_MOUSE_POSITION (float &X, float &Y ) = "0x5a21367565868156"

//INFO: 
//PARAM NOTES:
// PURPOSE:
// RETURN: Checks if the mouse button has just been pressed that frame
NATIVE FUNC  BOOL  IS_MOUSE_BUTTON_JUST_PRESSED (MOUSE_BUTTON BTN) = "0x4b89e34427b3875c"

//INFO: 
//PARAM NOTES:
// PURPOSE:
// RETURN: Checks if the mouse button has just been released that frame
NATIVE FUNC  BOOL  IS_MOUSE_BUTTON_JUST_RELEASED (MOUSE_BUTTON BTN) = "0x4474cdf81869ab92"

//INFO: 
//PARAM NOTES:
// PURPOSE:
// RETURN:  Checks if the mouse button is currently pressed
NATIVE FUNC  BOOL  IS_MOUSE_BUTTON_PRESSED (MOUSE_BUTTON BTN) = "0xa9eba80bd0e8cf96"

//INFO: 
//PARAM NOTES:
// PURPOSE:
// RETURN:  Checks if the mouse button is currently released
NATIVE FUNC  BOOL  IS_MOUSE_BUTTON_RELEASED (MOUSE_BUTTON BTN) = "0x4ecabb4d295ea77b"

//INFO: 
//PARAM NOTES:
// PURPOSE:
// RETURN:  Returns if a companion app (Smartglass/Playstation app) is connected
NATIVE FUNC  BOOL  COMPANION_IS_DEVICE_CONNECTED () = "0x012fe1d3a9ed3f8b"

#ENDIF	//	IS_DEBUG_BUILD

