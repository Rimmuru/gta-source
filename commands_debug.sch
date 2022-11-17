USING "buildtype.sch"
USING "rage_builtins.sch"
USING "types.sch"
USING "commands_task.sch"
USING "event_enums.sch"
USING "model_enums.sch"
//                  Debug commands 

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE DEBUGONLY PROC SCRIPT_ASSERT(STRING ErrorString) = "0x37e1d85a2a3321c5"


#IF IS_DEBUG_OR_PROFILE_BUILD
//~>                        Metrics commands
NATIVE PROC METRICS_SMOKETEST_CLEAR() = "0x552324442cb70e28"
NATIVE PROC METRICS_SMOKETEST_SHOW() = "0x3276153724a91a6f"
NATIVE PROC METRICS_SMOKETEST_HIDE() = "0x17d2d5323cc8578d"
NATIVE PROC METRICS_SMOKETEST_START(STRING zoneName) = "0x5acdbf6833438920"
NATIVE PROC METRICS_SMOKETEST_STOP() = "0x79eda528c2093155"
NATIVE PROC METRICS_SMOKETEST_SAVE() = "0x4f6356450e497da9"
NATIVE PROC METRICS_SMOKETEST_SAVE_TO_FILE(STRING filename) = "0x1e02a1b435c8198b"

//INFO: If -runscript was not used then the command will return a string containing "NULL"
//          In the FINAL build, the command will always return "NULL". 
//PARAM NOTES:
//PURPOSE: Returns the string passed to the game by the -runscript parameter (e.g. -runscript=manny1). More info..
NATIVE FUNC STRING GET_NAME_OF_SCRIPT_TO_AUTOMATICALLY_START() = "0x9a823c33fc60a8d2"

//INFO: Allow script to get a commandline argument. 
//PARAM NOTES: The name of the parameter
//PURPOSE: Allow script to check whether a specific commandline argument exists. 
NATIVE FUNC BOOL GET_COMMANDLINE_PARAM_EXISTS (STRING param) = "0xacc05862fbd8fde5"

// PURPOSE: Add new tag to the Rocky capture
NATIVE PROC ROCKY_TAG(STRING name) = "0xa59c19b532027a23"
#ENDIF // IS_DEBUG_OR_PROFILE_BUILD

#IF IS_DEBUG_BUILD

//PURPOSE: Returns TRUE if the player's coords have already been set by -playercoords, -debugstart or playercoords.txt
NATIVE FUNC BOOL HAVE_PLAYER_COORDS_BEEN_OVERRIDDEN() = "0x92c8de189b5c14b6"

//INFO: Allow script to get a commandline argument. Will return an empty string when it doesn't exist.
//PARAM NOTES: The name of the parameter
//PURPOSE: Allow script to get a commandline argument. 
NATIVE FUNC STRING GET_COMMANDLINE_PARAM (STRING param) = "0x61608341e5737e5f"

//INFO: Allow script to get a commandline argument. 
//PARAM NOTES: The name of the parameter
//PURPOSE: Allow script to get a commandline argument. 
NATIVE FUNC BOOL GET_COMMANDLINE_PARAM_BOOL (STRING param) = "0xde8417512afd99c8"

//INFO: Allow script to get a commandline argument. 
//PARAM NOTES: The name of the parameter
//PURPOSE: Allow script to get a commandline argument. 
NATIVE FUNC INT GET_COMMANDLINE_PARAM_INT (STRING param) = "0x70f0df147a7e148b"

//INFO: Allow script to get a commandline argument. 
//PARAM NOTES: The name of the parameter
//PURPOSE: Allow script to get a commandline argument. 
NATIVE FUNC FLOAT GET_COMMANDLINE_PARAM_FLOAT (STRING param) = "0x5fc6222a3c7e7b12"

//INFO: Allow script to get a commandline argument. 
//PARAM NOTES: The name of the parameter, and the zero-based index of which comma-separated float you want
//PURPOSE: Allow script to get a commandline argument. 
NATIVE FUNC FLOAT GET_COMMANDLINE_PARAM_FLOAT_BY_INDEX (STRING param,INT index) = "0xbb0f4a7512f460cf"

//INFO: This allows debiug lines to be rendered around peds, vehicles and objects for locate commands.
//PARAM NOTES:
//PURPOSE: Sets the script debug mode active so debug lines can be viewd. More info..
NATIVE PROC SET_DEBUG_ACTIVE (BOOL bActive) = "0xc9441448f237ec71"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_DEBUG_TEXT_VISIBLE(BOOL bVisible) = "0x36f37a089707fc50"

//INFO: 
//PARAM NOTES:
//PURPOSE:
NATIVE PROC SET_PROFILING_OF_THIS_SCRIPT(BOOL bProfiling) = "0x3d58e61e8f7f8bee"

//INFO: Outputs the script callstack to the TTY every time the specified native command is called
//PARAM NOTES: The name of a native command or an empty string to switch this off.
//PURPOSE: Only one TRACE_NATIVE_COMMAND or one BREAK_ON_NATIVE_COMMAND can be active at a time
NATIVE PROC TRACE_NATIVE_COMMAND(STRING pCommandName) = "0x3baaf5156ad7b58a"

//INFO: Stops game execution and prints the script callstack when the specified native command is called
//PARAM NOTES: The name of a native command or an empty string to switch this off.
//				bBreakOnFirstCallOnly - set to TRUE if you only want the game to stop on the first call to the native command
//PURPOSE: Only one TRACE_NATIVE_COMMAND or one BREAK_ON_NATIVE_COMMAND can be active at a time
NATIVE PROC BREAK_ON_NATIVE_COMMAND(STRING pCommandName, BOOL bBreakOnFirstCallOnly) = "0x0dcc8c6d57f275ab"


//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the string of the vehicles model_name
NATIVE FUNC STRING GET_MODEL_NAME_OF_VEHICLE_FOR_DEBUG_ONLY(VEHICLE_INDEX VehicleIndex) = "0x980ec4e20c81fc81"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the string of a model. 
NATIVE FUNC STRING GET_MODEL_NAME_FOR_DEBUG (MODEL_NAMES ModelHashKey) = "0xbf04fa25640e9235"

//INFO: 
//PARAM NOTES:
//PURPOSE: Is going to be removed after the milestone
NATIVE FUNC BOOL GET_NETWORK_RESTART_NODE_DEBUG( INT Index, VECTOR &vecReturn, FLOAT &Heading ) = "0xdac86a0f037e257b"

//~>                    Debug file commands 

//INFO:  Commands that write to a debug file usually open, write to the text file and then close it. 
//          Only one file can be open to be written too at once.
//          If you need to call several of these commands in a row, it might be quicker to call OPEN_DEBUG_FILE before and CLOSE_DEBUG_FILE after you're finished. 
//          This would mean there's only one open and close in total rather than one open and one close for each write command. 
//PARAM NOTES:
//PURPOSE: Opens the temp_debug.txt so that it can be written to. More info..
//RETURN: TRUE if the file was opened successfully, FALSE otherwise
NATIVE FUNC BOOL OPEN_DEBUG_FILE() = "0x32e242335d480468"

//INFO: This can be used to close files 
//PARAM NOTES:
//PURPOSE: Closes any text file that is being written too. More info..
NATIVE PROC CLOSE_DEBUG_FILE() = "0x22167ab70ea9074e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Writes an int value to temp_debug.txt
NATIVE PROC SAVE_INT_TO_DEBUG_FILE(int IntToSave) = "0xccb023e95ffa6675"

//INFO: 
//PARAM NOTES:
//PURPOSE:Writes an float value to temp_debug.txt
NATIVE PROC SAVE_FLOAT_TO_DEBUG_FILE(float FloatToSave) = "0xb483977efcbd8174"

//INFO: 
//PARAM NOTES:
//PURPOSE:Writes an new line to temp_debug.txt
NATIVE PROC SAVE_NEWLINE_TO_DEBUG_FILE () = "0xa1de54c939543cd8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Writes a string to temp_debug.txt
NATIVE PROC SAVE_STRING_TO_DEBUG_FILE(STRING pStringToSave) = "0x799589159e77d6f1"

//INFO: If the file does not exist it will create the file. Once open this will be where any debug text is written too.
//          If you want to write text to another file, close this first, using CLOSE_DEBUG_FILE to colse this file.
//PARAM NOTES:
//PURPOSE: Opens a file at the given path. More info..
//RETURN: TRUE if the file was opened successfully, FALSE otherwise
NATIVE FUNC BOOL OPEN_NAMED_DEBUG_FILE(string FilePath, string FileName) = "0xf838845ad041df6f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Saves an int value to the given file at the given path.
NATIVE PROC SAVE_INT_TO_NAMED_DEBUG_FILE(int InttoSave, string FilePath, string FileName) = "0xb78da46bbbffe697"

//INFO: 
//PARAM NOTES:
//PURPOSE: Saves an float value to the given file at the given path.
NATIVE PROC SAVE_FLOAT_TO_NAMED_DEBUG_FILE(Float FloattoSave, string FilePath, string FileName) = "0x94cc0d35eeb50750"

//INFO: 
//PARAM NOTES:
//PURPOSE: Saves an new line to the given file at the given path.
NATIVE PROC SAVE_NEWLINE_TO_NAMED_DEBUG_FILE( string FilePath, string FileName) = "0x2c97b16506c3f72d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Saves a string to the given file at the given path.
NATIVE PROC SAVE_STRING_TO_NAMED_DEBUG_FILE(string  StringToSave, string FilePath, string FileName) = "0x4f0c3061e8025888"

//INFO: Make sure that the file is not open before calling this or nothing wilhappen.
//PARAM NOTES: 
////PURPOSE: Removes any text written to this debug file. More info..
NATIVE PROC CLEAR_NAMED_DEBUG_FILE(string FilePath, string FileName) = "0x49f6c6837ff3922f"


//~>                    Widget commands 

//INFO: 
//PARAM NOTES:
//PURPOSE: script commands to create and manage widget groups
NATIVE TEXT_WIDGET_ID
NATIVE WIDGET_GROUP_ID

//INFO: 
//PARAM NOTES: Widget id, which can be used in DELETE_WIDGET
//PURPOSE: Add a slider (for an INT variable) to the script widgets. More info..
NATIVE PROC ADD_WIDGET_INT_SLIDER(STRING name, INT &variable_to_change, INT min, INT max, INT slider_step) = "0x74015e8111dbffef"

//INFO: 
//PARAM NOTES:  Widget id, which can be used in DELETE_WIDGET
//PURPOSE: Add a slider (for a FLOAT variable) to the script widgets. More info..
NATIVE PROC ADD_WIDGET_FLOAT_SLIDER(STRING Name, FLOAT &variable_to_change, FLOAT min, FLOAT max, FLOAT slider_step) = "0x7227d0c7e8d54fde"

//INFO: 
//PARAM NOTES: Widget id, which can be used in DELETE_WIDGET
//PURPOSE: Add a "slider" (which cannot be changed) (for an INT variable) to the script widgets in order to show updated values/numbers. More info..
NATIVE PROC ADD_WIDGET_INT_READ_ONLY(STRING name, INT &variable_to_show) = "0x391bb643669f4ebf"

//INFO: 
//PARAM NOTES: Widget id, which can be used in DELETE_WIDGET
//PURPOSE: Add a "slider" (which cannot be changed) (for an FLOAT variable) to the script widgets in order to show updated values/numbers. More info..
NATIVE PROC ADD_WIDGET_FLOAT_READ_ONLY(STRING name, FLOAT &variable_to_show) = "0x4758e60839d423b6"

//INFO: 
//PARAM NOTES: Widget id, which can be used in DELETE_WIDGET
//PURPOSE: Add a toggle to the script widgets. More info..
NATIVE PROC ADD_WIDGET_BOOL(STRING name, BOOL& variable_to_change) = "0xae96280cf484f907"

//INFO: 
//PARAM NOTES: Widget id, which can be used in DELETE_WIDGET
//PURPOSE: Show a string.  More info..
NATIVE PROC ADD_WIDGET_STRING(STRING stringToShow) = "0xf448ba469bfdfa52"

//INFO: CANNOT BE USED DURING NORMAL
//  widget additions this is intended for adding widgets to the specified bank AFTER creation and at runtime
//PARAM NOTES: Widget id, which can be used in DELETE_WIDGET
//PURPOSE: Forces subsequent widget additions to get added to the specified group. .
NATIVE PROC SET_CURRENT_WIDGET_GROUP(WIDGET_GROUP_ID id) = "0xd7cf1dc4baaca470"

//INFO: 
//PARAM NOTES: Widget id, which can be used in DELETE_WIDGET
//PURPOSE: Pair with SetGroup to leave the bank in a valid state
NATIVE PROC CLEAR_CURRENT_WIDGET_GROUP(WIDGET_GROUP_ID id) = "0x8ca9fb4895c97fc7"

//INFO: This has to be paired with a END_WIDGET_GROUP() command 
//PARAM NOTES:  Widget group id, which can be used in DELETE_WIDGET_GROUP
//PURPOSE:  Create a debug widget group. More info..
NATIVE FUNC WIDGET_GROUP_ID START_WIDGET_GROUP(STRING name) = "0x43ec0feab3829b5a"

//INFO: 
//PARAM NOTES:
//PURPOSE:  End a debug widget group
NATIVE PROC STOP_WIDGET_GROUP() = "0x083184ea2265df87"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Deletes a text widget
NATIVE PROC DELETE_TEXT_WIDGET(TEXT_WIDGET_ID id) = "0xd268b8a702074186"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Deletes a widget group
NATIVE PROC DELETE_WIDGET_GROUP(WIDGET_GROUP_ID id) = "0x6187c1ed7467ede4"

//INFO: 
//PARAM NOTES: 
//PURPOSE:  test if a widget group exists
NATIVE FUNC BOOL DOES_WIDGET_GROUP_EXIST(WIDGET_GROUP_ID id) = "0x2fffad519592c13f"

//INFO: 
//PARAM NOTES: 
//PURPOSE:  returns true if the text widget has been created
NATIVE FUNC BOOL DOES_TEXT_WIDGET_EXIST(TEXT_WIDGET_ID id) = "0xda53aba8ea85e865"

//PURPOSE: Returns the ID of the first widget group created for the current script thread
NATIVE FUNC WIDGET_GROUP_ID GET_ID_OF_TOP_LEVEL_WIDGET_GROUP() = "0xf36a18017af7d65f"

//INFO: 
//PARAM NOTES:
//PURPOSE: This should be the first command called when creating a combo box
NATIVE PROC START_NEW_WIDGET_COMBO() = "0x7808d27c1dde6d52"

//INFO: 
//PARAM NOTES:
//PURPOSE: Call this command for every entry in the list for the combo box
NATIVE PROC ADD_TO_WIDGET_COMBO(STRING pNewComboEntryName) = "0xa6fe8f276cea9017"

//INFO: 
//PARAM NOTES:
//PURPOSE: Call this command once you have added all the entries to the combo
NATIVE PROC STOP_WIDGET_COMBO( STRING pComboName, INT &variable_to_change ) = "0x65260ceb9d06c20c"

//INFO: 
//PARAM NOTES: Widget id, which can be used in GET_CONTENTS_OF_TEXT_WIDGET and DELETE_WIDGET
//PURPOSE: Creates a widget in which the user can enter text. More info..
NATIVE FUNC TEXT_WIDGET_ID ADD_TEXT_WIDGET(STRING Title) = "0x2835f632d23c8ecf"

//INFO: 
//PARAM NOTES: a string holding the contents of the text widget
//PURPOSE: Returns the contents of a text widget that has previously been created with ADD_TEXT_WIDGET. More info..
NATIVE FUNC STRING GET_CONTENTS_OF_TEXT_WIDGET(TEXT_WIDGET_ID id) = "0x843d4e4d887ec17b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the contents of a text widget that has previously been created with ADD_TEXT_WIDGET. More info..
NATIVE PROC SET_CONTENTS_OF_TEXT_WIDGET(TEXT_WIDGET_ID id, STRING NewWidgetContents) = "0x5f715e762f04cde0"

//INFO: 
//PARAM NOTES: Widget id, which can be used in DELETE_WIDGET
//PURPOSE: Adds an int to Rag as a bit field, with a toggle widget for each of the 32 bits
NATIVE PROC ADD_BIT_FIELD_WIDGET(STRING Title, INT &BitField) = "0x2c12383c6b60b963"


//~>                        Commands for handling Bugstar text

//PURPOSE: Add a line of text with a key so that the key can later be used as if the text appeared in the .gxt file
NATIVE PROC ADD_DEBUG_STRING(STRING pTextKey, STRING pTextToDisplay) = "0x5ee7aab423e0d2d7"

//PURPOSE: Remove a line of text that had previously been added by ADD_DEBUG_STRING
NATIVE PROC REMOVE_DEBUG_STRING_WITH_THIS_KEY(STRING pTextKey) = "0xd9f0ab18d80da20f"

//PURPOSE: Clear all the lines of text that had previously been added by ADD_DEBUG_STRING
NATIVE PROC CLEAR_ALL_DEBUG_STRINGS() = "0x58b4d4f0ac6fe243"


//~>                       Mouse commands

//INFO: To get this to work, you first have to press the Toggle Script bank button inside the Script bank in Rag. 
//		Then press the Enable/Disable Debugging button inside the Script Debug Tools widget group that appears.
//PARAM NOTES:
//PURPOSE: If using the script debug tools, this command gets the position in world coords from the clicked mouse pos 
//				(shown in the world as a small red marker).
NATIVE FUNC VECTOR GET_SCRIPT_MOUSE_POINTER_IN_WORLD_COORDS() = "0x0462df823be75a10"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the index of the currently selected entity. 
NATIVE FUNC ENTITY_INDEX GET_FOCUS_ENTITY_INDEX() = "0xfd109c50560d00ef"

//~>                        Scenario commands

//INFO:
//PARAM NOTES:
//PURPOSE: Won't spawn peds at any scenario points that have no animation data (ie: not set up yet)
NATIVE PROC DISABLE_INCOMPLETE_SCENARIOS(BOOL disable) = "0xbf0034b2971f106b"

//~>                        Physics commands

//INFO:
//PARAM NOTES:
//PURPOSE: To allow "sleeping" of physical objects to be turned off as part of the phsyics performance scripts.
NATIVE PROC PHYSICS_DEBUG_SET_SLEEP_ENABLED(BOOL enabled) = "0x261840193762c6f3"

//~>                        Profile stats (EKG) commands

//INFO:
//PARAM NOTES: You can see the available pages under the bank "rage - Profile Stats", e.g. "ph Simulator", "Simulator", "SimUpdate"
//PURPOSE: To allow retrieval of profile stats times from the EKG.
NATIVE FUNC FLOAT GET_PROFILE_STATS_FRAME_TIME(STRING pageName, STRING groupName, STRING timerName) = "0x21cdd51335b3ec91"

//~>                        Unique commands

//INFO: In Beta builds, this will return the number of commands that the current script has run this frame
//PARAM NOTES:
//PURPOSE:
NATIVE FUNC INT GET_NUMBER_OF_INSTRUCTIONS_EXECUTED() = "0x2339945490fd1a00"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the name of the room that the ped is in, returns "" if not in a room.
NATIVE FUNC STRING GET_ROOM_NAME_FROM_PED_DEBUG(PED_INDEX PedIndex) = "0xf88dcd16dfc4f17d"

NATIVE FUNC BOOL NODEVIEWER_INIT() = "0xae9feb2ae7d2ae12"
NATIVE FUNC BOOL NODEVIEWER_SHUTDOWN() = "0x0fdeddb1a6c6a057"
NATIVE FUNC BOOL NODEVIEWER_SAVE_SET(INT User, INT Index, STRUCT& NodeSet, INT Size) = "0x697c602bc8309a50"
NATIVE FUNC BOOL NODEVIEWER_LOAD_SET(INT User, INT Index, STRUCT& NodeSet, INT Size) = "0xbd61a475d391c1ff"
NATIVE FUNC BOOL NODEVIEWER_DELETE_SET(INT User, INT Index) = "0x03468203efc58615"

//~>                        Smoketest commands

//PURPOSE: Returns whether the smoketest has started
NATIVE FUNC BOOL SMOKETEST_STARTED() = "0x2be6ecf537a50330"

//PURPOSE: Tell the game the smoketest is finished.
NATIVE PROC SMOKETEST_END() = "0x7b43ebace329ebcb"

//PURPOSE: Start a section capture.
NATIVE PROC SMOKETEST_START_CAPTURE_SECTION(STRING section) = "0x7cfbeaf53e941de2"

//PURPOSE: End a section capture.
NATIVE PROC SMOKETEST_STOP_CAPTURE_SECTION() = "0x2bbd4a403df3fa47"

//PURPOSE: Save a screenshot.
NATIVE PROC SAVE_SCREENSHOT(STRING name) = "0x9f31211e267bec5d"

//~>                        Frame capture commands

//PURPOSE: Begin capturing frames, either JPEG or PNG, with quality between 50 and 100 percent.
NATIVE PROC START_FRAME_CAPTURE(STRING name, BOOL jpeg, INT quality) = "0x152c18ae972ef737"

//PURPOSE: Stop capturing frames
NATIVE PROC STOP_FRAME_CAPTURE() = "0x3f8ec46956958660"


//~>                        Debug location commands

//PURPOSE: Returns the number of debug locations.
NATIVE FUNC INT GET_DEBUG_LOCATION_COUNT() = "0xd4e4b88593992901"

//PURPOSE: Set the debug location to the chosen index.
NATIVE FUNC BOOL SET_CURRENT_DEBUG_LOCATION(INT Index) = "0x4e2d6a82bf188b5a"

//PURPOSE: Returns the name of the current debug location.
NATIVE FUNC STRING GET_CURRENT_DEBUG_LOCATION_NAME() = "0xe5014709f82e4c4e"

//PURPOSE: Set the debug location by .
NATIVE FUNC BOOL SET_CURRENT_DEBUG_LOCATION_BY_NAME(STRING Location) = "0x505a631e261af27c"


//~>                        Metrics commands
NATIVE PROC METRICS_ZONES_CLEAR() = "0x9e91cadb6d6b1baa"
NATIVE PROC METRICS_ZONES_SHOW() = "0x86c3dd783b38f078"
NATIVE PROC METRICS_ZONES_HIDE() = "0xbe72bf3ef0807c1b"
NATIVE PROC METRICS_ZONE_START(STRING zoneName) = "0x088de6cf540487f9"
NATIVE PROC METRICS_ZONE_STOP() = "0x228d28ca792bb99a"
NATIVE PROC METRICS_ZONE_SAVE() = "0xe2bcf94771089012"
NATIVE PROC METRICS_ZONE_SAVE_TO_FILE(STRING filename) = "0x24df8b2ce0c048d2"
NATIVE PROC METRICS_ZONE_SAVE_TELEMETRY() = "0x0685f602f6eda361"


//~>                        Script Metrics Commands
//INFO: 
//PARAM NOTES:
//PURPOSE: Outputs All Current scripts processing times, Average processing time (over last 10 seconds) & Peak processing time (over last 10 seconds) to the TTY
NATIVE PROC METRICS_PRINT_SCRIPT_PROCESSING_TIMES() = "0x8a5895a3855b2503"

//INFO: 
//PARAM NOTES:
//PURPOSE: returns the current processig time
NATIVE FUNC FLOAT METRICS_GET_UPDATE_TIME_FOR_THREAD(THREADID thread_ID) = "0x5f17bd5e28977f36"

//INFO: 
//PARAM NOTES:
//PURPOSE: returns the current average processig time over the last ten seconds
NATIVE FUNC FLOAT METRICS_GET_AVERAGE_UPDATE_TIME_FOR_THREAD(THREADID thread_ID) = "0x603d5ec109b5b015"

//INFO: 
//PARAM NOTES:
//PURPOSE: returns the current peak processig time over the last ten seconds
NATIVE FUNC FLOAT METRICS_GET_PEAK_UPDATE_TIME_FOR_THREAD(THREADID thread_ID) = "0x8be3cb2616fd74dc"

//INFO: 
//PARAM NOTES:
// channel - telemetry channel to set the log level of.  0 is the defaul level.
//PURPOSE: Turns on or off the telemetry by setting log level to -1 for each channel.
NATIVE PROC METRICS_CHANGE_LOG_LEVEL(INT channel, INT logLevel, BOOL logOnlyThisLevel) = "0xa2a2b971026495f9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Log metrics related to timebars. This metrics use LOGLEVEL_DEBUG3.
NATIVE PROC METRICS_LOG_TIMEBARS( ) = "0xebdfbe5c1bdedc4b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Used to check that the values for script and code enums pair up
NATIVE PROC VALIDATE_ENUM_VALUES(INT EventNameMax = NUM_NETWORK_EVENTTYPE) = "0x1c910789c011e3f0"

//~>                        Console interpreter commands
/// PURPOSE:
///    A function that gets the last command typed in the console.
///	   For example, if "script <whatever>" is typed into the console,
///	   this function will return "<whatever>".
/// RETURNS:
///    the last command typed in the console.
NATIVE FUNC STRING GET_LATEST_CONSOLE_COMMAND() = "0x1e83f317118b814c"

/// PURPOSE:
///    Sets the string that will be returned by GET_LATEST_CONSOLE_COMMAND
///    to nothing, until the next console command is typed.
NATIVE PROC RESET_LATEST_CONSOLE_COMMAND() = "0x5e9dab9a1203fff6"

/// PURPOSE:
///    Returns number of tokens a console string was delivered in
/// RETURNS:
///    INT - number of space seperated tokens on the command line
NATIVE FUNC INT GET_NUM_CONSOLE_COMMAND_TOKENS() = "0x4afd729dfad4119e"

/// PURPOSE:
///    Returns a given token as a string
/// PARAMS:
///    iToken - index of token (must be >=0 and <GET_NUM_CONSOLE_COMMAND_TOKENS)
/// RETURNS:
///    STRING. DO NOT CACHE. MAKE COPY. IS (NORMALLY) BAD TO ASSIGN TO STRING VARIABLE AS IT WILL CHANGE....
NATIVE FUNC STRING GET_CONSOLE_COMMAND_TOKEN(INT iToken) = "0xab31250f6a376b07"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the version name
NATIVE FUNC STRING GET_GAME_VERSION_NAME() = "0x91f21bab5f932a1e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Turns on or off the stream graph, depending on passed param
NATIVE PROC SET_DISPLAY_STREAM_GRAPH(BOOL bTurnOn) = "0x18f2e3cec6745f44"

//INFO: 
//PARAM NOTES:
//PURPOSE: Start the heatmap test
NATIVE PROC HEATMAP_TEST_START() = "0xd82a22c65d2d2106"

//INFO: 
//PARAM NOTES:
//PURPOSE: Check if the heatmap test is still running
NATIVE FUNC BOOL HEATMAP_TEST_IS_COMPLETE() = "0x9fc6eaef514636b5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Send the heatmap data collected to telemetry
NATIVE PROC HEATMAP_TEST_WRITE_TELEMETRY() = "0xca960d484df81d21"


//INFO: 
//PARAM NOTES:
//PURPOSE: Do the shapetest cost test and cache results
NATIVE PROC DETERMINE_SHAPETEST_COST( VECTOR& start_param, VECTOR& end_param, FLOAT granularity_param, FLOAT radius_param ) = "0x3c30297ad332330c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Send the results of a previous shapetest out via telemetry
NATIVE FUNC BOOL SHAPETEST_COST_WRITE_TELEMETRY() = "0x29750f04e1ade996"

ENUM MAPDATA_TYPE
	MAPDATA_LOW,
	MAPDATA_MED,
	MAPDATA_HI
ENDENUM

NATIVE PROC DBG_SET_MAPDATA_STATS( BOOL bEnabled ) = "0x8967e79ba76d616f"

NATIVE FUNC INT DBG_GET_NUM_MAPDATA_LOADED( MAPDATA_TYPE mapDataType ) = "0x5b438223aab86efc"

NATIVE FUNC INT DBG_GET_NUM_MAPDATA_REQUIRED( MAPDATA_TYPE mapDataType ) = "0x7c66a684004a66b6"

//PURPOSE: Each script array has a hidden integer before the first element. This hidden integer stores the number of elements in the array.
// There is currently a bug (Bug Number 4618786) where this hidden integer is getting set to 0. That should never happen.
// Call this command once at the start of your script to catch the hidden integer getting modified.
NATIVE PROC MONITOR_SCRIPT_ARRAY_FOR_SIZE_OVERWRITE(STRUCT &Address) = "0x9d5a8f0c4aef81d0"

#ENDIF	//	IS_DEBUG_BUILD


