USING "types.sch"

NATIVE POPZONE_ID
NATIVE POPSCHEDULE_ID

ENUM g_eMapAreas
	MAP_BROOKLYN,
	MAP_BRONX,
	MAP_MANHATTAN,
	MAP_NEW_JERSEY,
	MAX_MAP_AREAS,
	// Leave this at the bottom
	UNKNOWN_MAP_AREA
ENDENUM

// When updating this enum, update eZoneScumminess in PopZones.h [2/4/2013 mdawe]
ENUM ZONE_SCUMMINESS
	SCUMMINESS_POSH,
	SCUMMINESS_NICE,
	SCUMMINESS_ABOVE_AVERAGE,
	SCUMMINESS_BELOW_AVERAGE,
	SCUMMINESS_CRAP,
	SCUMMINESS_SCUM
ENDENUM

//PURPOSE: Returns zone id of zone at supplied coordinates
NATIVE FUNC POPZONE_ID GET_ZONE_AT_COORDS(VECTOR VecCoors) = "0xb3aaef02e08ea464"

//PURPOSE: Returns zone id of zone with a name id
NATIVE FUNC POPZONE_ID GET_ZONE_FROM_NAME_ID(STRING nameId) = "0xbfcaed06c67f8431"

//PURPOSE: Sets if zone should generate cops
NATIVE PROC SET_ZONE_COPS_ACTIVE(POPZONE_ID zoneId, bool NoCops) = "0x6344d7f88e052f02"

//PURPOSE: Return popschedule id set for a zone
NATIVE FUNC POPSCHEDULE_ID GET_ZONE_POPSCHEDULE(POPZONE_ID zoneId) = "0x12fecc81be9413ba"

//PURPOSE: Returns the index of the multiplayer gang territory for this zone
//	(-1 means the zone doesn't belong to a territory that can be taken over by a gang)
NATIVE FUNC INT GET_MP_GANG_TERRITORY_INDEX(POPZONE_ID zoneId) = "0xf95d159de2e42944"

//PURPOSE: Get name id of zone from coordinates
NATIVE FUNC STRING GET_NAME_OF_ZONE(VECTOR VecCoors) = "0x717dd0abf4a97737"

//PURPOSE: Get name tag of zone that is displayed from coordinates
NATIVE FUNC STRING GET_NAME_OF_INFO_ZONE(VECTOR VecCoors) = "0xe57312689aadf2d1"

//PURPOSE: Enable/Disable a specific zone
NATIVE PROC SET_ZONE_ENABLED(POPZONE_ID zoneId, bool bEnabled) = "0x1524eea9eac1f06b"

//PURPOSE: Check Enabled/Disabled state of a specific zone
NATIVE FUNC BOOL GET_ZONE_ENABLED(POPZONE_ID zoneId) = "0x953d4ed6832c90df"

//PURPOSE: Get the scumminess level of a specific zone. Return value in SCUMMINESS_LEVEL enum
NATIVE FUNC INT GET_ZONE_SCUMMINESS(POPZONE_ID zoneId) = "0x0f2e6657dc3695b8"

//PURPOSE: Override population schedule with a new population group
NATIVE PROC OVERRIDE_POPSCHEDULE_GROUPS(POPSCHEDULE_ID schedule, STRING popGroupName, INT percentage) = "0x4f82f932d29836a2"

//PURPOSE: Clear population schedule group override set with OVERRIDE_POPSCHEDULE_GROUPS
NATIVE PROC CLEAR_POPSCHEDULE_OVERRIDE(POPSCHEDULE_ID schedule) = "0xf0fa86d937eb69e9"

//PURPOSE: Override the zone specified vehicle model streamed in for the population schedule in network games. Supported in network games only.
NATIVE PROC OVERRIDE_POPSCHEDULE_VEHICLE_MODEL(POPSCHEDULE_ID schedule, MODEL_NAMES ModelIndex) = "0xe81f6467ad1c34fc"

//PURPOSE: Clear population schedule vehicle model override set with OVERRIDE_POPSCHEDULE_VEHICLE_MODEL. Supported in network games only.
NATIVE PROC CLEAR_POPSCHEDULE_OVERRIDE_VEHICLE_MODEL(POPSCHEDULE_ID schedule) = "0x70fca19a938a5df3"

//PURPOSE: Return what major map area coordinate is in
NATIVE FUNC g_eMapAreas GET_MAP_AREA_FROM_COORDS(VECTOR Coords) = "0x68a9d79c339625c7"

CONST_INT MAP_AREA_CITY -289320599
CONST_INT MAP_AREA_COUNTRYSIDE 2072609373

//PURPOSE: Returns the hash of the name of the area at these coordinates (should be City or Countryside)
//	The returned value should be either MAP_AREA_CITY or MAP_AREA_COUNTRYSIDE
NATIVE FUNC INT GET_HASH_OF_MAP_AREA_AT_COORDS(VECTOR Coords) = "0x5e43fce03b0cd999"

//PURPOSE: Override the max number of ped models that may be streamed in for use by scenarios
//	This override will be applied to each scenario slot.
NATIVE PROC OVERRIDE_MAX_SCENARIO_PED_MODELS(INT maxPedModels) = "0xa98cd79ad6e91097"

//PURPOSE: Clear any override set by OVERRIDE_MAX_SCENARIO_PED_MODELS.
NATIVE PROC CLEAR_MAX_SCENARIO_PED_MODELS_OVERRIDE() = "0xdc1b7fb785d72e92"


//INFO: 
//PARAM NOTES: 
//PURPOSE:  Gets the hash of any zone the passed point is currently within (or NULL for no zone)
NATIVE FUNC INT GET_MAP_ZONE_AT_COORDS(VECTOR VecCoors) = "0xa7570ade3c568784"

