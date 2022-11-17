USING "types.sch"

/// PURPOSE:
///    Create a volume box
/// PARAMS:
///    rPosition - Placement of centre
///    rOrientation - Orientation
///    rScale - Scale on each axis (local space of volume)
/// RETURNS:
///    VOLUME variable, (Check using DOES_VOLUME_EXIST())
NATIVE FUNC VOLUME CREATE_VOLUME_BOX (VECTOR rPosition, VECTOR rOrientation, VECTOR rScale) = "0x4b445963518fc6e6"

/// PURPOSE:
///    Create a volume cylinder
/// PARAMS:
///    rPosition - Placement of centre
///    rOrientation - Orientation
///    rScale - Scale on each axis (local space of volume)
/// RETURNS:
///    VOLUME variable, (Check using DOES_VOLUME_EXIST())
NATIVE FUNC VOLUME CREATE_VOLUME_CYLINDER (VECTOR rPosition, VECTOR rOrientation, VECTOR rScale) = "0x52f47e58d5b88366"

/// PURPOSE:
///    Create a volume sphere
/// PARAMS:
///    rPosition - Placement of centre
///    rOrientation - Orientation
///    rScale - Scale on each axis (local space of volume)
/// RETURNS:
///    VOLUME variable, (Check using DOES_VOLUME_EXIST())
NATIVE FUNC VOLUME CREATE_VOLUME_SPHERE (VECTOR rPosition, VECTOR rOrientation, VECTOR rScale) = "0x5f828c797a006fe9"

/// PURPOSE:
///    Create a volume ellipse
/// PARAMS:
///    rPosition - Placement of centre
///    rOrientation - Orientation
///    rScale - Scale on each axis (local space of volume)
/// RETURNS:
///    VOLUME variable, (Check using DOES_VOLUME_EXIST())
NATIVE FUNC VOLUME CREATE_VOLUME_ELLIPSE (VECTOR rPosition, VECTOR rOrientation, VECTOR rScale) = "0x0fa14262dfc6b79c"

/// PURPOSE:
///    Create a volume aggregate
/// RETURNS:
///    VOLUME variable, (Check using DOES_VOLUME_EXIST())
NATIVE FUNC VOLUME CREATE_VOLUME_AGGREGATE() = "0x49664a4843a6ccda"

/// PURPOSE:
///    Add a volume to an aggregate volume
/// PARAMS:
///    aggregate - aggregate to add to 
///    toAdd - volume to add
NATIVE PROC ADD_TO_VOLUME_AGGREGATE(VOLUME aggregate, VOLUME toAdd) = "0xc7207519e6a1a705"

/// PURPOSE:
///    Delete a volume
/// PARAMS:
///    volume - VOLUME to delete
NATIVE PROC DELETE_VOLUME(VOLUME vol) = "0x4f238171ea22707e"

/// PURPOSE:
///    Findout if the point is inside the volume
/// PARAMS:
///    volume - VOLUME to check
///    rPosition - Placement of centre
/// RETURNS:
///    BOOL true or false about inclusion in the volume
NATIVE FUNC BOOL IS_POINT_IN_VOLUME(VOLUME vol, VECTOR rPoint) = "0x063379b7bdf5cca4"

/// PURPOSE:
///    Verify that the volume is valid
/// PARAMS:
///    volume - VOLUME to check
/// RETURNS:
///    BOOL true or false about validity.
NATIVE FUNC BOOL DOES_VOLUME_EXIST(VOLUME vol) = "0x2fa4d680f32e3bb3"

/// PURPOSE:
///    Get the position of a volume (this is the center point of the volume)
/// PARAMS:
///    volume - VOLUME to use
/// RETURNS:
///    VECTOR data from the volume
NATIVE FUNC VECTOR GET_VOLUME_COORDS(VOLUME vol) = "0x91a12afc1f422493"

/// PURPOSE:
///    Set the position of a volume (this is used as the center point of the volume)
/// PARAMS:
///    volume - VOLUME to use
///    rPosition - new position of the volume
/// RETURNS:
///    BOOL true or false about success.
NATIVE FUNC BOOL SET_VOLUME_COORDS(VOLUME vol, VECTOR rPosition) = "0xd9e2f4071712238e"

/// PURPOSE:
///    Get the orientation of the volume in Euler values (YXZ)
/// PARAMS:
///    volume - VOLUME to use
/// RETURNS:
///    VECTOR data from the volume
NATIVE FUNC VECTOR GET_VOLUME_ROTATION(VOLUME vol) = "0xdad7bb2b2600a0de"

/// PURPOSE:
///    Set the orientation of the volume from Euler values (YXZ)
/// PARAMS:
///    volume - VOLUME to use
///	   rEulers - new euler rotations of the volume
/// RETURNS:
///    BOOL true or false about success.
NATIVE FUNC BOOL SET_VOLUME_ROTATION(VOLUME vol, VECTOR rEulers) = "0xe70fd56034c83524"

/// PURPOSE:
///    Get the scales of the volume
/// PARAMS:
///    volume - VOLUME to use
/// RETURNS:
///    VECTOR data from the volume
NATIVE FUNC VECTOR GET_VOLUME_SCALE(VOLUME vol) = "0xe5925b01a06678a3"

/// PURPOSE:
///    Set the scales of the volume
/// PARAMS:
///    volume - VOLUME to use
///	   rScale - new scales of the volume
/// RETURNS:
///    BOOL true or false about success.
NATIVE FUNC BOOL SET_VOLUME_SCALE(VOLUME vol, VECTOR rScale) = "0x8e8d1ad6bc691874"

