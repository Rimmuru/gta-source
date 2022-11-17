USING "types.sch"

//~>                                                                       apps commands 

ENUM APP_DATA_NET_STATUS
	APP_FILE_STATUS_NONE = 0,
	APP_FILE_STATUS_PENDING,
	APP_FILE_STATUS_SUCCEEDED,
	APP_FILE_STATUS_FAILED,
	APP_FILE_STATUS_DOESNT_EXIST
ENDENUM

//INFO: 
//PARAM NOTES:
//PURPOSE: Unlocks a named file
NATIVE FUNC STRING APPS_CAR_UNLOCK(STRING name) = "0x952402bc76011b2d"

//INFO: 
//PARAM NOTES:
//PURPOSE: Check if there is valid data fetched
NATIVE FUNC BOOL APP_DATA_VALID() = "0x22c6b747bc6e361e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get a named integer from the fetched data block
NATIVE FUNC INT APP_GET_INT(STRING name) = "0x5038830517cd70f6"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the named float from the fetched data block
NATIVE FUNC FLOAT APP_GET_FLOAT(STRING name) = "0x4c7cf7912c241e6b"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the named string from the fetched data block
NATIVE FUNC STRING APP_GET_STRING(STRING name) = "0x2d15550f7fcd5086"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the int value for the current block
NATIVE PROC APP_SET_INT(STRING name, INT value) = "0x1c02fd23c1547cf8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the float value for the current block
NATIVE PROC APP_SET_FLOAT(STRING name, FLOAT value) = "0x268821bcc02b91e9"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the string value for the current block
NATIVE PROC APP_SET_STRING(STRING name, STRING value) = "0xe1adb2de0b8174ae"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the current app
NATIVE PROC APP_SET_APP(STRING name) = "0x1da152b5eac0cc1f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the current block
NATIVE PROC APP_SET_BLOCK(STRING name) = "0xff1067af9210d60e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Writes the current app block to the cloud
NATIVE PROC APP_SAVE_DATA() = "0x7fb1b1a8b6c93051"

//INFO: 
//PARAM NOTES:
//PURPOSE: Closes the current app
NATIVE PROC APP_CLOSE_APP() = "0x9daa3c517c0e9456"

//INFO: 
//PARAM NOTES:
//PURPOSE: Closes the current block
NATIVE PROC APP_CLOSE_BLOCK() = "0xeaf291b4eace0e17"

//INFO: 
//PARAM NOTES:
//PURPOSE: Clears the current blocks data
NATIVE PROC APP_CLEAR_BLOCK() = "0xbe6c25a9cd239f04"

//INFO: 
//PARAM NOTES:
//PURPOSE: Deletes the app data from the cloud
NATIVE FUNC BOOL APP_DELETE_APP_DATA(STRING name) = "0x0b75c472b38530fb"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the current status of the deleted file
NATIVE FUNC APP_DATA_NET_STATUS APP_GET_DELETED_FILE_STATUS() = "0x9b1f0a416059fb72"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns the state of the app files netstatus
NATIVE FUNC APP_DATA_NET_STATUS APP_GET_APP_FILE_STATUS() = "0x5ae69b6f236b12c8"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if player account is linked to a rockstar account
NATIVE FUNC BOOL APP_HAS_LINKED_SOCIAL_CLUB_ACCOUNT() = "0x0fecf87f208d8eb4"

//INFO: 
//PARAM NOTES:
//PURPOSE: Returns true if the game has initially synced with the cloud
NATIVE FUNC BOOL APP_HAS_SYNCED_DATA(STRING name) = "0x4325115cea2ae76c"

FUNC INT APPS_CAR_GET_UID()
                return APP_GET_INT("uid")
ENDFUNC

FUNC INT APPS_CAR_GET_COST()
                return APP_GET_INT("cost")
ENDFUNC

FUNC int APPS_CAR_GET_BODY_COLOUR()
                return APP_GET_INT("colour")
ENDFUNC

FUNC VECTOR APPS_CAR_GET_BODY_COLOUR_RGB()
                return <<0,0,0>>
ENDFUNC

FUNC STRING APPS_CAR_GET_PLATE_TEXT()
                return APP_GET_STRING("plateText")
ENDFUNC
