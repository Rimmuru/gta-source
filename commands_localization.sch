USING "rage_builtins.sch"
USING "types.sch"

ENUM LANGUAGE_TYPE
	LANGUAGE_UNDEFINED = -1,
	LANGUAGE_ENGLISH = 0,
	LANGUAGE_FRENCH,
	LANGUAGE_GERMAN,
	LANGUAGE_ITALIAN,
	LANGUAGE_SPANISH,
	LANGUAGE_PORTUGUESE,
	LANGUAGE_POLISH,
	LANGUAGE_RUSSIAN,
	LANGUAGE_KOREAN,
	LANGUAGE_CHINESE,
	LANGUAGE_JAPANESE,
	LANGUAGE_MEXICAN,
	LANGUAGE_CHINESE_SIMPLIFIED
ENDENUM

ENUM DATE_FORMAT 
	 DATE_FORMAT_DMY = 0, 
	 DATE_FORMAT_MDY, 
	 DATE_FORMAT_YMD, 

	 MAX_DATE_FORMATS
ENDENUM

ENUM DATE_FORMAT_DELIMITER 
	 DATE_FORMAT_DELIMITER_SLASH = 0, 
	 DATE_FORMAT_DELIMITER_DASH, 
	 DATE_FORMAT_DELIMITER_DOT, 
	 DATE_FORMAT_DELIMITER_SPACE, 

	 MAX_DATE_FORMAT_DELIMITERS
ENDENUM

//INFO: Returns the current system language
//PURPOSE: Used to check the language/region of the system
NATIVE FUNC LANGUAGE_TYPE LOCALIZATION_GET_SYSTEM_LANGUAGE() = "0x7cacf6619466f437"

//INFO: Returns the selected language of the player profile
//PURPOSE: Used to check the language/region of the current player
NATIVE FUNC LANGUAGE_TYPE GET_CURRENT_LANGUAGE() = "0xe2f2d76a4aa269ff"

//INFO: Returns the current system date formatting type
//PURPOSE: Used to check the language/region date formatting of the system
NATIVE FUNC DATE_FORMAT LOCALIZATION_GET_SYSTEM_DATE_TYPE() = "0xd15434691627435d"

//INFO: Returns the date formatting of the selected player profile language
//PURPOSE: Used to check the language/region date formatting of the current player
NATIVE FUNC DATE_FORMAT LOCALIZATION_GET_PLAYER_DATE_TYPE() = "0x9b03d85b27d70fd5"

//INFO: Returns the current system date delimiter
//PURPOSE: Used to check the language/region date delimiter of the system
NATIVE FUNC DATE_FORMAT_DELIMITER LOCALIZATION_GET_SYSTEM_DATE_DELIMITER_TYPE() = "0x0744946f35983dc0"

//INFO: Returns the date delimiter of the selected player profile language
//PURPOSE: Used to check the language/region date delimiter of the current player
NATIVE FUNC DATE_FORMAT_DELIMITER LOCALIZATION_GET_PLAYER_DATE_DELIMITER_TYPE() = "0xf3b0b87e86ff676d"
