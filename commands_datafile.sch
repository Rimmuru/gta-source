USING "types.sch"

NATIVE DATAFILE_DICT
NATIVE DATAFILE_ARRAY

ENUM DATAFILE_TYPE
	DF_NONE = 0,
	DF_BOOL,
	DF_INT,
	DF_FLOAT,
	DF_STRING,
	DF_VEC3,
	DF_DICT,
	DF_ARRAY
ENDENUM

//Max amount of UGC paths - 1 for the mission data and 1 for the photo path
CONST_INT UGC_PATH_MISSION_DATA 0
CONST_INT UGC_PATH_PHOTO		1
CONST_INT UGC_PATH_MAX 			2
//Struct for containing the UGC content paths
STRUCT UGC_PATHS_STRUCT
	TEXT_LABEL_63 tl63Path[UGC_PATH_MAX]
ENDSTRUCT

// It's possible to have multiple datafiles open at once, allowing different scripts to use the 
// datafile system without stepping on each other's toes.
// Keep in sync with SveFileObjectArray::MAX_NUM_DATA_FILES in commands_datafile.cpp.
CONST_INT  NUM_DATAFILE_SLOTS  4

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
// Datafile functions
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////

/// PURPOSE: 
///		Marks this cloud ID to be added to our save file list. 
NATIVE PROC DATAFILE_WATCH_REQUEST_ID(INT nCloudRequestID) = "0x35c49a098cce05ca"

/// PURPOSE: 
///		Clears out the watch list. 
NATIVE PROC DATAFILE_CLEAR_WATCH_LIST() = "0x8b66950593ce7823"

/// PURPOSE: 
///		Inspect a particular request ID. 
NATIVE FUNC BOOL DATAFILE_IS_VALID_REQUEST_ID(INT nCloudRequestID) = "0x267b35a75af41658"
NATIVE FUNC BOOL DATAFILE_HAS_VALID_FILE_DATA(INT nCloudRequestID) = "0x9c976b35944b749d"
NATIVE FUNC BOOL DATAFILE_HAS_LOADED_FILE_DATA(INT nCloudRequestID) = "0x13268820d6544012"

/// PURPOSE: 
///		Selects the active save file that dictionary operations will operate on.
NATIVE FUNC BOOL DATAFILE_SELECT_ACTIVE_FILE(INT nCloudRequestID, INT datafileIndex = 0) = "0xa4070cbbf5694ec8"

/// PURPOSE: 
///		Deletes a save file. 
NATIVE FUNC BOOL DATAFILE_DELETE_REQUESTED_FILE(INT nCloudRequestID) = "0x7233df6dd0b0e205"

/// PURPOSE: 
///		Create a UGC file - build the UGC header using datafile commands before calling this.
///     szFilePaths - Array of file paths
///     nFiles - How many files are in the array
///     szDisplayName - Front facing content name ("My Awesome Mission!")
///     szDesc - Description of this mission ("Are you a bad enough dude to rescue the President?")
///     szTags - Comma separated tags to describe searchable tags
///     nType - Of type UGC_TYPE
///		bPublish - Publish this mission on creation (push to Rockstar candidate)
NATIVE FUNC BOOL UGC_CREATE_CONTENT(UGC_PATHS_STRUCT& szFilePaths, INT nFiles, STRING szDisplayName, UGC_DESCRIPTION &szDesc, UGC_DESCRIPTION &szTags, STRING szContentType, BOOL bPublish, INT datafileIndex = 0) = "0xfbb798e2f410d4ab"

/// PURPOSE: 
///		Create a UGC mission - build the UGC header using datafile commands before calling this. Sideline that using DATAFILE_STORE_MISSION_HEADER.
///			And then build the mission data using the datafile commands
///
///     szDisplayName - Front facing content name ("My Awesome Mission!")
///     szDesc - Description of this mission ("Are you a bad enough dude to rescue the President?")
///     szTags - Comma separated tags to describe searchable tags
///     nType - Of type UGC_TYPE
///		bPublish - Publish this mission on creation (push to Rockstar candidate)
NATIVE FUNC BOOL UGC_CREATE_MISSION(STRING szDisplayName, UGC_DESCRIPTION &szDesc, UGC_DESCRIPTION &szTags, STRING szContentType, BOOL bPublish, INT datafileIndex = 0) = "0x1e69765a21e6c2af"

/// PURPOSE: 
///		Copies out the mission header for UGC_CREATE_MISSION
/// PARAMS:
///		datafileIndex - Which datafile to take data from
NATIVE PROC DATAFILE_STORE_MISSION_HEADER(INT datafileIndex = 0) = "0xca09ed6e4be3a61c"

/// PURPOSE: 
///		Clears out the mission header (if it exists - safe to call either way)
///
NATIVE PROC DATAFILE_FLUSH_MISSION_HEADER() = "0xaf42862c16a8f3ec"

/// PURPOSE: 
///		Update a UGC file - (optionally) build an updated UGC header using datafile commands before calling this.
///     The parameters are all optional. Pass in NULL for any that should not be updated.
/// PARAMS:
///     szContentID - UGC content ID
///     szFilePaths - Array of file paths
///     nFiles - How many files are in the array
///     szDisplayName - Front facing content name ("My Awesome Mission!")
///     szDesc - Description of this mission ("Are you a bad enough dude to rescue the President?")
///     szTags - Comma separated tags to describe searchable tags
///     nType - Of type UGC_TYPE
///		datafileIndex - Datafile slot containing the data you want to save
NATIVE FUNC BOOL UGC_UPDATE_CONTENT(STRING szContentID, UGC_PATHS_STRUCT& szFilePaths, INT nFiles, STRING szDisplayName, UGC_DESCRIPTION &szDesc, UGC_DESCRIPTION &szTags, STRING szContentType, INT datafileIndex = 0) = "0x9d886ed5ccb4d1bb"

/// PURPOSE: 
///		Update a UGC file - (optionally) build an updated UGC header using datafile commands before calling this.
///     The parameters are all optional. Pass in NULL for any that should not be updated.
/// PARAMS:
///     szContentID - UGC content ID
///     szDisplayName - Front facing content name ("My Awesome Mission!")
///     szDesc - Description of this mission ("Are you a bad enough dude to rescue the President?")
///     szTags - Comma separated tags to describe searchable tags
///     nType - Of type UGC_TYPE
///		datafileIndex - Datafile slot containing the data you want to save
NATIVE FUNC BOOL UGC_UPDATE_MISSION(STRING szContentID, STRING szDisplayName, UGC_DESCRIPTION &szDesc, UGC_DESCRIPTION &szTags, STRING szContentType, INT datafileIndex = 0) = "0xe588c5baaf3797de"

/// PURPOSE: 
///		Sets player data. This is determined by game and context. 
/// PARAMS:
///     szContentID - UGC content ID
///     nType - Of type UGC_TYPE
///		datafileIndex - Datafile slot containing the data you want to save
NATIVE FUNC BOOL UGC_SET_PLAYER_DATA(STRING szContentID, FLOAT fRating, STRING szContentType, INT datafileIndex = 0) = "0x25dbc2aaeb2f3602"

/// PURPOSE: 
///		Props UGC header for access through data file commands
/// PARAMS:
///		datafileIndex - Datafile slot to put the data in
NATIVE FUNC INT DATAFILE_GET_UGC_DATA_SIZE(INT nContentIndex) = "0x1b77f78143bdde0c"
NATIVE FUNC BOOL DATAFILE_SELECT_UGC_DATA(INT nContentIndex, INT datafileIndex = 0) = "0x3b307f0fe01b03d2"

/// PURPOSE: 
///		Props UGC stats for access through data file commands
/// PARAMS:
///		datafileIndex - Datafile slot to put the data in
NATIVE FUNC INT DATAFILE_GET_UGC_STATS_SIZE(INT nContentIndex, BOOL bXv) = "0xae297e17b7d96c68"
NATIVE FUNC BOOL DATAFILE_SELECT_UGC_STATS(INT nContentIndex, BOOL bXv, INT datafileIndex = 0) = "0xf58db7bc2763da56"

/// PURPOSE: 
///		Props UGC player data for access through data file commands
/// PARAMS:
///		datafileIndex - Datafile slot to put the data in
NATIVE FUNC INT DATAFILE_GET_UGC_PLAYER_DATA_SIZE(INT nContentIndex) = "0xaeebb0a55d44201b"
NATIVE FUNC BOOL DATAFILE_SELECT_UGC_PLAYER_DATA(INT nContentIndex, INT datafileIndex = 0) = "0x43d13a207591add7"

/// PURPOSE: 
///		Props content creator stats for access through data file commands
/// PARAMS:
///		datafileIndex - Datafile slot to put the data in
NATIVE FUNC INT DATAFILE_GET_CREATOR_STATS_SIZE(INT nCreatorIndex) = "0x9a438c3fdb09b18c"
NATIVE FUNC BOOL DATAFILE_SELECT_CREATOR_STATS(INT nCreatorIndex, INT datafileIndex = 0) = "0xb04a9141590dce90"

/// PURPOSE: 
///		Saves a file to local storage.
/// PARAMS:
///     contentID - arbitrary identifier for the file, will be incorporated into the filename.
///		datafileIndex - datafile slot to save from
NATIVE FUNC BOOL DATAFILE_SAVE_OFFLINE_UGC(STRING szContentID, INT datafileIndex = 0) = "0x80837aae0a271b3b"

/// PURPOSE: 
///		Loads a file from local storage.
/// PARAMS:
///     contentID - identifier for the file, same as was used with DATAFILE_SAVE_OFFLINE_UGC.
///		datafileIndex - datafile slot to load into
NATIVE FUNC BOOL DATAFILE_LOAD_OFFLINE_UGC(STRING szContentID, INT datafileIndex = 0) = "0x938e755f4f72b35e"

/// PURPOSE: 
///		Loads a file from local storage async. Returns a cloud request id that should be polled until the file is loaded via DATAFILE_HAS_LOADED_FILE_DATA
/// PARAMS:
///     contentID - identifier for the file, same as was used with DATAFILE_SAVE_OFFLINE_UGC.
///		datafileIndex - datafile slot to load into
NATIVE FUNC INT DATAFILE_LOAD_OFFLINE_UGC_ASYNC(STRING szContentID, INT datafileIndex = 0) = "0x91963295e78c9721"

/// PURPOSE: 
///		Creates a new datafile object
NATIVE PROC DATAFILE_CREATE(INT datafileIndex = 0) = "0x280f5fc1db79e757"

/// PURPOSE:
///		Deletes the datafile object in the given slot
NATIVE PROC DATAFILE_DELETE(INT datafileIndex = 0) = "0x0222406293ea78ca"

//PURPOSE: Start the asyncronous process of loading data from the cloud using local player handle
//PARAMS:
//		filename - filename of file to load
NATIVE FUNC BOOL DATAFILE_START_LOAD_FROM_CLOUD(STRING filename) = "0x97e61a679e81efc3"

//PURPOSE: Start the asyncronous process of loading data from the cloud given a user name.
//PARAMS:
//		filename	- Filename of file to load
//		gamerHandle - GamerHandle for target player
NATIVE FUNC BOOL DATAFILE_START_LOAD_FROM_CLOUD_MEMBER(STRING filename, GAMER_HANDLE& gamerHandle) = "0xc56d710394df153c"

//PURPOSE: Update the asyncronous process of loading data from the cloud
//PARAMS:
//		success - value to be filled out with the sucess of the process
//		datafileIndex - if the data has finished loading, it will be stored in this slot
//RETURNS: Whether the process has finished
NATIVE FUNC BOOL DATAFILE_UPDATE_LOAD_FROM_CLOUD(BOOL& success, INT datafileIndex = 0) = "0x294c1c6a969a33f5"

//PURPOSE: Check if a load from cloud operation is pending
NATIVE FUNC BOOL DATAFILE_IS_LOAD_PENDING() = "0x58940e8edd1412ef"

//PURPOSE: Start the asyncronous process of saving data to the cloud
//PARAMS:
//		filename - filename of file to save
//		datafileIndex - slot to save from
NATIVE FUNC BOOL DATAFILE_START_SAVE_TO_CLOUD(STRING filename, INT datafileIndex = 0) = "0xf15dad6d0291a996"

//PURPOSE: Update the asyncronous process of saving data to the cloud
//PARAMS:
//		success - value to be filled out with the sucess of the process
//RETURNS: Whether the process has finished
NATIVE FUNC BOOL DATAFILE_UPDATE_SAVE_TO_CLOUD(BOOL& success) = "0x735b09bad85f258f"

//PURPOSE: Check if a save to cloud operation is pending
NATIVE FUNC BOOL DATAFILE_IS_SAVE_PENDING() = "0x665245305cd9e866"

//PURPOSE: Delete a file in the cloud
//PARAMS:
//		filename - file to be deleted
NATIVE PROC DATAFILE_DELETE_FILE(STRING filename) = "0x7be371f010a51bde"

//PURPOSE: Update the asyncronous process of saving data to the cloud
//PARAMS:
//		success - value to be filled out with the sucess of the process
//RETURNS: Whether the process has finished
NATIVE FUNC BOOL DATAFILE_UPDATE_DELETE_FILE(BOOL& success) = "0x9bb40c554501c51d"

//PURPOSE: Check if a delete from cloud operation is pending
NATIVE FUNC BOOL DATAFILE_IS_DELETE_PENDING() = "0xb7ac4df201400128"

/// PURPOSE:
///		Gets the top level dictionary object in the datafile in the given slot
NATIVE FUNC DATAFILE_DICT 	DATAFILE_GET_FILE_DICT(INT datafileIndex = 0) = "0x16307ef1b7664424"



////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
// Functions for additional data files
// The other natives now support up to 4 datafiles, accessed by index, so the ADDITIONAL natives
// are obsolete.
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////

/// PURPOSE: 
///		Loads a file from local storage into the specified additional data file
/// PARAMS:
///		fileIndex - for now, this must be 0. There is only one additional data file.
///     contentID - identifier for the file
NATIVE FUNC BOOL DATAFILE_LOAD_OFFLINE_UGC_FOR_ADDITIONAL_DATA_FILE(INT fileIndex, STRING szContentID) = "0xce3f2e170c5c4544"

/// PURPOSE:
///		Deletes the additional datafile object
/// PARAMS:
///		fileIndex - for now, this must be 0. There is only one additional data file.
NATIVE PROC DATAFILE_DELETE_FOR_ADDITIONAL_DATA_FILE(INT fileIndex) = "0xc1df883f184fcabc"

/// PURPOSE:
///		Gets the top level dictionary object in the additional datafile
/// PARAMS:
///		fileIndex - for now, this must be 0. There is only one additional data file.
NATIVE FUNC DATAFILE_DICT DATAFILE_GET_FILE_DICT_FOR_ADDITIONAL_DATA_FILE(INT fileIndex) = "0x0d7d14b5fa90e730"



////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
// Dictionary functions
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////

/// PURPOSE: Sets a name-value pair in the specified dictionary
/// PARAMS:
///		dict - The dictionary object
///		name - The name of the data item
///		value - The new value of the data item
/// NOTES:
///		This will overwrite any existing dictionary entry with the same name
NATIVE PROC 				DATADICT_SET_BOOL(DATAFILE_DICT dict, STRING name, BOOL value) = "0x7d75cd6838d91c65"

/// PURPOSE: Sets a name-value pair in the specified dictionary
/// PARAMS:
///		dict - The dictionary object
///		name - The name of the data item
///		value - The new value of the data item
/// NOTES:
///		This will overwrite any existing dictionary entry with the same name
NATIVE PROC 				DATADICT_SET_INT(DATAFILE_DICT dict, STRING name, INT value) = "0x59ebbea4150e286f"

/// PURPOSE: Sets a name-value pair in the specified dictionary
/// PARAMS:
///		dict - The dictionary object
///		name - The name of the data item
///		value - The new value of the data item
/// NOTES:
///		This will overwrite any existing dictionary entry with the same name
NATIVE PROC 				DATADICT_SET_FLOAT(DATAFILE_DICT dict, STRING name, FLOAT value) = "0xb60ad82fa227f055"

/// PURPOSE: Sets a name-value pair in the specified dictionary
/// PARAMS:
///		dict - The dictionary object
///		name - The name of the data item
///		value - The new value of the data item
/// NOTES:
///		This will overwrite any existing dictionary entry with the same name
NATIVE PROC 				DATADICT_SET_STRING(DATAFILE_DICT dict, STRING name, STRING value) = "0x34619b36929bd4e5"

/// PURPOSE: Sets a name-value pair in the specified dictionary
/// PARAMS:
///		dict - The dictionary object
///		name - The name of the data item
///		value - The new value of the data item
/// NOTES:
///		This will overwrite any existing dictionary entry with the same name
NATIVE PROC 				DATADICT_SET_VECTOR(DATAFILE_DICT dict, STRING name, VECTOR value) = "0x418e560d6ca5b93c"

/// PURPOSE: Adds a new dictionary object to the specified dictionary
/// PARAMS:
///		parent - The dictionary object
///		name - The name of the data item
/// RETURNS: A new (empty) dictionary object
/// NOTES:
///		This will overwrite any existing entry in the parent dictionary
NATIVE FUNC DATAFILE_DICT 	DATADICT_CREATE_DICT(DATAFILE_DICT parent, STRING name) = "0x34a4dec252e422df"

/// PURPOSE: Adds an array object to the specified dictionary
/// PARAMS:
///		parent - The dictionary object
///		name - The name of the data item
/// RETURNS: A new (empty) array object
/// NOTES:
///		This will overwrite any existing entry in the parent dictionary
NATIVE FUNC DATAFILE_ARRAY	DATADICT_CREATE_ARRAY(DATAFILE_DICT parent, STRING name) = "0x4b088bbe020c20cc"

/// PURPOSE: Gets the value of a boolean dictionary entry
/// PARAMS:
///		dict - The dictionary object
///		name - The name of the data item in the dictionary
/// RETURNS: The value of the named data item (if it was a boolean) or false (if it was any other type)
NATIVE FUNC BOOL 			DATADICT_GET_BOOL(DATAFILE_DICT dict, STRING name) = "0xea1c8198294061c8"

/// PURPOSE: Gets the value of an int dictionary entry
/// PARAMS:
///		dict - The dictionary object
///		name - The name of the data item in the dictionary
/// RETURNS: The value of the named data item (if it was an int) or 0 (if it was any other type)
NATIVE FUNC INT 			DATADICT_GET_INT(DATAFILE_DICT dict, STRING name) = "0xe6a0afebb87cc96c"

/// PURPOSE: Gets the value of a float dictionary entry
/// PARAMS:
///		dict - The dictionary object
///		name - The name of the data item in the dictionary
/// RETURNS: The value of the named data item (if it was a float) or 0.0 (if it was any other type)
NATIVE FUNC FLOAT 			DATADICT_GET_FLOAT(DATAFILE_DICT dict, STRING name) = "0x28bbe7d39916b197"

/// PURPOSE: Gets the value of a string dictionary entry
/// PARAMS:
///		dict - The dictionary object
///		name - The name of the data item in the dictionary
/// RETURNS: The value of the named data item (if it was a string) or "" (if it was any other type)
NATIVE FUNC STRING 			DATADICT_GET_STRING(DATAFILE_DICT dict, STRING name) = "0xb1473708b3bc6ed2"

/// PURPOSE: Gets the value of a vector dictionary entry
/// PARAMS:
///		dict - The dictionary object
///		name - The name of the data item in the dictionary
/// RETURNS: The value of the named data item (if it was a vector) or <<0.0, 0.0, 0.0>> (if it was any other type)
NATIVE FUNC VECTOR 			DATADICT_GET_VECTOR(DATAFILE_DICT dict, STRING name) = "0xd25353c9f68a9be0"

/// PURPOSE: Gets the named child dictionary from a dictionary
/// PARAMS:
///		dict - The dictionary object
///		name - The name of the data item in the dictionary
/// RETURNS: The value of the named data item (if it was a dictionary) or NULL (if it was any other type)
NATIVE FUNC DATAFILE_DICT 	DATADICT_GET_DICT(DATAFILE_DICT parent, STRING name) = "0xdd51dcf7a4c06797"

/// PURPOSE: Gets the named array from a dictionary
/// PARAMS:
///		dict - The dictionary object
///		name - The name of the data item in the dictionary
/// RETURNS: The value of the named data item (if it was an array) or NULL (if it was any other type)
NATIVE FUNC DATAFILE_ARRAY	DATADICT_GET_ARRAY(DATAFILE_DICT parent, STRING name) = "0x61d9cdbfec321364"

/// PURPOSE: Delets a dictionary entry, give its name
/// PARAMS:
///		dict - The dictionary object
///		name - The name of the data item to delete
NATIVE PROC					DATADICT_DELETE(DATAFILE_DICT parent, STRING name) = "0x758afd407520a47b"

/// PURPOSE: Gets the data type for the data corresponding to a name in the dictionary
/// PARAMS:
///		dict - The dictionary object
///		name - The name of the data item
/// RETURNS:
///		The DATAFILE_TYPE of the data in the dictionary, or DF_NONE if no data was found corresponding to the name
NATIVE FUNC DATAFILE_TYPE	DATADICT_GET_TYPE(DATAFILE_DICT dict, STRING name) = "0x1d0d99adc275c523"


///////////////////////////////////////////////////
// Array functions

/// PURPOSE: Adds a bool value to the end of an array
/// PARAMS:
///		arr - The array to append to
///		value - The new value to put at the end
NATIVE PROC					DATAARRAY_ADD_BOOL(DATAFILE_ARRAY arr, BOOL value) = "0xfc476fca97221928"

/// PURPOSE: Adds an int value to the end of an array
/// PARAMS:
///		arr - The array to append to
///		value - The new value to put at the end
NATIVE PROC					DATAARRAY_ADD_INT(DATAFILE_ARRAY arr, INT value) = "0x13855f4ad74314bf"

/// PURPOSE: Adds a float value to the end of an array
/// PARAMS:
///		arr - The array to append to
///		value - The new value to put at the end
NATIVE PROC					DATAARRAY_ADD_FLOAT(DATAFILE_ARRAY arr, FLOAT value) = "0x75ff0b10c341e814"

/// PURPOSE: Adds a string value to the end of an array
/// PARAMS:
///		arr - The array to append to
///		value - The new value to put at the end
NATIVE PROC					DATAARRAY_ADD_STRING(DATAFILE_ARRAY arr, STRING value) = "0x94cd9229338f719a"

/// PURPOSE: Adds a vector value to the end of an array
/// PARAMS:
///		arr - The array to append to
///		value - The new value to put at the end
NATIVE PROC					DATAARRAY_ADD_VECTOR(DATAFILE_ARRAY arr, VECTOR value) = "0x558cb010292c768b"

/// PURPOSE: Adds a dictionary to the end of an array
/// PARAMS:
///		arr - The array to append to
/// RETURNS: The new dictionary
NATIVE FUNC	DATAFILE_DICT 	DATAARRAY_ADD_DICT(DATAFILE_ARRAY arr) = "0xc7aff6dc015e7732"

/// PURPOSE: Adds a child array to the end of an array
/// PARAMS:
///		arr - The array to append to
/// RETURNS: The new child array
NATIVE FUNC DATAFILE_ARRAY	DATAARRAY_ADD_ARRAY(DATAFILE_ARRAY arr) = "0xf87ba4abcf763583"


/// PURPOSE: Sets a new bool value for an array element
/// PARAMS:
///		arr - The array to modify
///		index - The index in the array to modify
///		value - The new value for that array element
NATIVE PROC					DATAARRAY_SET_BOOL(DATAFILE_ARRAY arr, INT index, BOOL value) = "0xe9c20ec5f492e1a7"

/// PURPOSE: Sets a new int value for an array element
/// PARAMS:
///		arr - The array to modify
///		index - The index in the array to modify
///		value - The new value for that array element
NATIVE PROC					DATAARRAY_SET_INT(DATAFILE_ARRAY arr, INT index, INT value) = "0x1b31e063459f84ed"

/// PURPOSE: Sets a new float value for an array element
/// PARAMS:
///		arr - The array to modify
///		index - The index in the array to modify
///		value - The new value for that array element
NATIVE PROC					DATAARRAY_SET_FLOAT(DATAFILE_ARRAY arr, INT index, FLOAT value) = "0x56ebff0d4e810583"

/// PURPOSE: Sets a new string value for an array element
/// PARAMS:
///		arr - The array to modify
///		index - The index in the array to modify
///		value - The new value for that array element
NATIVE PROC					DATAARRAY_SET_STRING(DATAFILE_ARRAY arr, INT index, STRING value) = "0x56ddf458d514587f"

/// PURPOSE: Sets a new vector value for an array element
/// PARAMS:
///		arr - The array to modify
///		index - The index in the array to modify
///		value - The new value for that array element
NATIVE PROC					DATAARRAY_SET_VECTOR(DATAFILE_ARRAY arr, INT index, VECTOR value) = "0xd5c2d3e23002712a"

/// PURPOSE: Replaces the specified array element with an empty dictionary
/// PARAMS:
///		arr - The array to modify
///		index - The index in the array to modify
///	RETURNS: A new (empty) dictionary stored at the specified array index
NATIVE FUNC DATAFILE_DICT	DATAARRAY_CREATE_DICT(DATAFILE_ARRAY arr, INT index) = "0xce5ed6ee3e772ee2"

/// PURPOSE: Replaces the specified array element with an empty child array
/// PARAMS:
///		arr - The array to modify
///		index - The index in the array to modify
///	RETURNS: A new (empty) child array stored at the specified array index
NATIVE FUNC DATAFILE_ARRAY	DATAARRAY_CREATE_ARRAY(DATAFILE_ARRAY arr, INT index) = "0x395f4e27e36df585"

/// PURPOSE: Gets the boolean value of an array element
/// PARAMS:
///		arr - The array to get a value from
///		index - The index into the array
///	RETURNS: The boolean value at the specified array index, or false if it's not a bool value 
NATIVE FUNC BOOL 			DATAARRAY_GET_BOOL(DATAFILE_ARRAY arr, INT index) = "0xd6d7eb548f1030be"

/// PURPOSE: Gets the int value of an array element
/// PARAMS:
///		arr - The array to get a value from
///		index - The index into the array
///	RETURNS: The int value at the specified array index, or 0 if it's not an int value 
NATIVE FUNC INT 			DATAARRAY_GET_INT(DATAFILE_ARRAY arr, INT index) = "0x347f5e3d631a03ed"

/// PURPOSE: Gets the float value of an array element
/// PARAMS:
///		arr - The array to get a value from
///		index - The index into the array
///	RETURNS: The float value at the specified array index, or 0.0 if it's not a float value 
NATIVE FUNC FLOAT 			DATAARRAY_GET_FLOAT(DATAFILE_ARRAY arr, INT index) = "0xcba5860362bbb689"

/// PURPOSE: Gets the string value of an array element
/// PARAMS:
///		arr - The array to get a value from
///		index - The index into the array
///	RETURNS: The string value at the specified array index, or "" if it's not a string value 
NATIVE FUNC STRING 			DATAARRAY_GET_STRING(DATAFILE_ARRAY arr, INT index) = "0xb4f4434c791d9a40"

/// PURPOSE: Gets the vector value of an array element
/// PARAMS:
///		arr - The array to get a value from
///		index - The index into the array
///	RETURNS: The vector value at the specified array index, or <<0.0, 0.0, 0.0>> if it's not a vector value 
NATIVE FUNC VECTOR 			DATAARRAY_GET_VECTOR(DATAFILE_ARRAY arr, INT index) = "0x7b5d30273df6afc7"

/// PURPOSE: Gets the dictionary stored in an array element
/// PARAMS:
///		arr - The array to get a value from
///		index - The index into the array
///	RETURNS: The dictionary stored at the specified array index, or NULL if it's not a dictionary value 
NATIVE FUNC DATAFILE_DICT 	DATAARRAY_GET_DICT(DATAFILE_ARRAY parent, INT index) = "0x69fd7fb97594957b"

/// PURPOSE: Gets the child array stored in an array element
/// PARAMS:
///		arr - The array to get a value from
///		index - The index into the array
///	RETURNS: The child array stored at the specified array index, or NULL if it's not an array value 
NATIVE FUNC DATAFILE_ARRAY	DATAARRAY_GET_ARRAY(DATAFILE_ARRAY parent, INT index) = "0x0351f41fbc38f344"

/// PURPOSE: Gets the number of items in an array
NATIVE FUNC INT				DATAARRAY_GET_COUNT(DATAFILE_ARRAY arr) = "0x3aeb680423f056cf"

/// PURPOSE: Delets the specified item in the array
/// PARAMS:
///		arr - The array to delete from
///		index - The index into the array
/// NOTES:
///		All values above 'index' move down one in the array after deletion
NATIVE PROC					DATAARRAY_DELETE(DATAFILE_ARRAY parent, INT index) = "0x5dea74f75dd57863"

/// PURPOSE: Gets the type of value stored a the specified index in an array
/// PARAMS:
///		arr - The array
///		index - The index into the array
/// RETURNS: One of the DATAFILE_TYPE enums corresponding to the value type, or DF_NONE if the index is invalid
NATIVE FUNC DATAFILE_TYPE	DATAARRAY_GET_TYPE(DATAFILE_ARRAY arr, INT index) = "0x3e7dec6c8d20a13b"
