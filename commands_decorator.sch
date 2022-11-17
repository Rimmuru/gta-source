USING "types.sch"

ENUM DECORATOR_TYPES //Needs to be kept in sync with fwDecorator::DECORATOR_TYPES
	DECOR_TYPE_UNKNOWN=0,
    DECOR_TYPE_FLOAT,
    DECOR_TYPE_BOOL,
    DECOR_TYPE_INT,
    DECOR_TYPE_STRING,
    DECOR_TYPE_TIME
ENDENUM

/// PURPOSE:
///    Add or update a TIME decorator on an object
/// PARAMS:
///    guid - object to remove decorators from
///    decoratorName - Name of the decorator
///    value - value of the decorator
/// RETURNS:
///    BOOL true if completed successfuly else false
NATIVE FUNC BOOL DECOR_SET_TIME(ITEM_INDEX guid, STRING decoratorName, TIME_DATATYPE value) = "0x69499f92536c52d9"

/// PURPOSE:
///    Add or update a BOOL decorator on an object
/// PARAMS:
///    guid - object to remove decorators from
///    decoratorName - Name of the decorator
///    value - value of the decorator
/// RETURNS:
///    BOOL true if completed successfuly else false
NATIVE FUNC BOOL DECOR_SET_BOOL(ITEM_INDEX guid, STRING decoratorName, BOOL value) = "0x2c8c3211219c37bd"

/// PURPOSE:
///    Add or update a FLOAT decorator on an object
/// PARAMS:
///    guid - object to remove decorators from
///    decoratorName - Name of the decorator
///    value - value of the decorator
/// RETURNS:
///    BOOL true if completed successfuly else false
NATIVE FUNC BOOL DECOR_SET_FLOAT(ITEM_INDEX guid, STRING decoratorName, FLOAT value) = "0x1403fd7f2dede0e8"

/// PURPOSE:
///    Add or update a INT decorator on an object
/// PARAMS:
///    guid - object to remove decorators from
///    decoratorName - Name of the decorator
///    value - value of the decorator
/// RETURNS:
///    BOOL true if completed successfuly else false
NATIVE FUNC BOOL DECOR_SET_INT(ITEM_INDEX guid, STRING decoratorName, INT value) = "0x05b874e9abff72b4"

/// PURPOSE:
///    Add or update a STRING decorator on an object
/// PARAMS:
///    guid - object to remove decorators from
///    decoratorName - Name of the decorator
///    value - value of the decorator
/// RETURNS:
///    BOOL true if completed successfuly else false
NATIVE FUNC BOOL DECOR_SET_STRING(ITEM_INDEX guid, STRING decoratorName, STRING value) = "0xbfb078a469d01d51"

/// PURPOSE:
///    Get the value of a TIME decorator
/// PARAMS:
///    guid - object to remove decorators from
///    decoratorName - Name of the decorator
/// RETURNS:
///    TIME_DATATYPE value of the decorator
NATIVE FUNC TIME_DATATYPE DECOR_GET_TIME(ITEM_INDEX guid, STRING decoratorName) = "0xcf17343024f6ffb8"

/// PURPOSE:
///    Get the value of an BOOL decorator
/// PARAMS:
///    guid - object to remove decorators from
///    decoratorName - Name of the decorator
/// RETURNS:
///    BOOL value of the decorator
NATIVE FUNC BOOL DECOR_GET_BOOL(ITEM_INDEX guid, STRING decoratorName) = "0x9a1e55620a6c250d"

/// PURPOSE:
///    Get the value of an FLOAT decorator
/// PARAMS:
///    guid - object to remove decorators from
///    decoratorName - Name of the decorator
/// RETURNS:
///    FLOAT value of the decorator
NATIVE FUNC FLOAT DECOR_GET_FLOAT(ITEM_INDEX guid, STRING decoratorName) = "0xbff2ff18a8a89f88"

/// PURPOSE:
///    Get the value of an INT decorator
/// PARAMS:
///    guid - object to remove decorators from
///    decoratorName - Name of the decorator
/// RETURNS:
///    INT value of the decorator
NATIVE FUNC INT DECOR_GET_INT(ITEM_INDEX guid, STRING decoratorName) = "0xc3b76795ecbdef41"

/// PURPOSE:
///    Get the HASH of a STRING decorator
/// PARAMS:
///    guid - object to remove decorators from
///    decoratorName - Name of the decorator
/// RETURNS:
///    INT hash of the STRING decorator value
NATIVE FUNC INT DECOR_GET_STRING_HASH(ITEM_INDEX guid, STRING decoratorName) = "0xd74dc079a89d890f"

/// PURPOSE:
///    Check to see if the string to check matches the string applied via the decorator
/// PARAMS:
///    guid - object to remove decorators from
///    decoratorName - Name of the decorator
///    toCheck - The string to check decorator value against
/// RETURNS:
///    BOOL true if matches else false
NATIVE FUNC BOOL DECOR_STRING_MATCHES(ITEM_INDEX guid, STRING decoratorName, STRING toCheck) = "0xa1015a8ff2d5d37b"

/// PURPOSE:
///    Query to see if an object has the decorator applied to it
/// PARAMS:
///    guid - object to remove decorators from
///    decoratorName - Name of the decorator
/// RETURNS:
///    BOOL true if exists else false
NATIVE FUNC BOOL DECOR_EXIST_ON(ITEM_INDEX guid, STRING decoratorName) = "0xf2549ff74d64b720"

/// PURPOSE:
///    Remove a decorator from an object
/// PARAMS:
///    guid - object to remove decorators from
///    decoratorName - Name of the decorator
/// RETURNS:
///    BOOL true if completed successfuly else false
NATIVE FUNC BOOL DECOR_REMOVE(ITEM_INDEX guid, STRING decoratorName) = "0x8b3711a36570b638"

/// PURPOSE:
///    Remove all decorators from an object
/// PARAMS:
///    guid - object to remove decorators from
/// RETURNS:
///    BOOL true if completed successfuly else false
NATIVE FUNC BOOL DECOR_REMOVE_ALL(ITEM_INDEX guid) = "0x6577ce993f5613d6"

/// PURPOSE:
///    Register a decorator to be used as a specific type
/// PARAMS:
///    decoratorName - Name of the decorator
///    type - expected type 
NATIVE PROC DECOR_REGISTER(STRING decoratorName, DECORATOR_TYPES type) = "0x11a81a2059db324b"

/// PURPOSE:
///    Query to see if a registered decorator is of an expected type
/// PARAMS:
///    decoratorName - Name of the decorator
///    type - expected type 
/// RETURNS:
///    BOOL true if decorator is registered as the time listed else false
NATIVE FUNC BOOL DECOR_IS_REGISTERED_AS_TYPE(STRING decoratorName, DECORATOR_TYPES type) = "0x6bd06f4780eac5dd"

/// PURPOSE:
///    Locks the decorator interface so no more decorators can be registered.
/// PARAMS:
///    None.
/// RETURNS:
///    Nothing.
NATIVE PROC DECOR_REGISTER_LOCK() = "0x8649fc67a631cb32"

/// PURPOSE:
///    Unlocks the decorator interface so decorators can be registered.
/// PARAMS:
///    None.
/// RETURNS:
///    Nothing.
NATIVE PROC DECOR_REGISTER_UNLOCK() = "0xc3d247bca013ba18"



