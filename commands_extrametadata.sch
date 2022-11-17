USING "types.sch"

////////////////////////////////////////////////////////////////////////////////////////////////////////
//			Support for retrieving any extra dlc metadata
//
//

/// PURPOSE: Wrapper for new tattoo shop items data
/// NOTE:
///    Keep in sync with code in commands_extrametadata.cpp
STRUCT sTattooShopItemValues
	INT		m_lockHash
	INT		Id
	INT		Collection
	INT		Preset
	INT		Cost
	INT		Facing
	INT		UpdateGroup
	TEXT_LABEL_31	Label
ENDSTRUCT

ENUM eShopPedApparel
	SHOP_PED_COMPONENT = 0, 
	SHOP_PED_PROP,
	SHOP_PED_OUTFIT
ENDENUM

/// PURPOSE: Used to differentiate between the different types of clothes shops
///    /// NOTE:
///    Keep in sync with //depot/gta5/src/dev_ng/game/scene/ExtraMetadataDefs.psc
ENUM CLOTHES_SHOP_ENUM
	CLO_SHOP_LOW,
	CLO_SHOP_MID,
	CLO_SHOP_HIGH,
	CLO_SHOP_GUN_LARGE,
	CLO_SHOP_GUN_SMALL,
	CLO_SHOP_AMB,
	CLO_SHOP_CASINO,
	CLO_SHOP_CAR_MEET,
	CLO_SHOP_ARMORY_FIXER,
	CLO_SHOP_MUSIC_STUDIO,
	CLO_SHOP_NONE
ENDENUM

ENUM eContentRightsTypes
	CRT_TATTOOS = 0,
	CRT_PED_APPAREL,
	CRT_WEAPONS,
	CRT_VEHICLES
ENDENUM

ENUM TATTOO_FACTION_ENUM
	TATTOO_SP_MICHAEL = 0,
	TATTOO_SP_FRANKLIN,
	TATTOO_SP_TREVOR,
	TATTOO_MP_FM
	
	#IF USE_TU_CHANGES
	,TATTOO_MP_FM_F
	#ENDIF
	
ENDENUM

ENUM TATTOO_FACING
	TATTOO_FRONT,
	TATTOO_BACK,
	TATTOO_LEFT,
	TATTOO_RIGHT,
	TATTOO_FRONT_LEFT,
	TATTOO_BACK_LEFT,
	TATTOO_FRONT_RIGHT,
	TATTOO_BACK_RIGHT
ENDENUM

/// PURPOSE: Wrapper for outfit variant components
/// NOTE:
///    Keep in sync with code in commands_extrametadata.cpp
STRUCT scrOutfitCompStruct
    INT nameHash
	INT enumValue
	INT eCompType
ENDSTRUCT

/// PURPOSE: Wrapper for outfit variant props
/// NOTE:
///    Keep in sync with code in commands_extrametadata.cpp
STRUCT scrOutfitPropStruct
    INT nameHash
	INT enumValue
	INT anchorPoint
ENDSTRUCT

/// PURPOSE: Wrapper for new component item shop data
/// NOTE:
///    Keep in sync with code in commands_extrametadata.cpp
STRUCT scrShopPedComponent
	INT	m_lockHash
    INT m_nameHash
    INT m_locate
    INT m_drawableIndex
    INT m_textureIndex
    INT m_cost
    INT m_eCompType
    INT m_eShopEnum
    INT m_eCharacter
	TEXT_LABEL_31 m_textLabel
ENDSTRUCT

/// PURPOSE: Wrapper for new component item shop data
/// NOTE:
///    Keep in sync with code in commands_extrametadata.cpp
STRUCT scrShopPedProp
	INT	m_lockHash
    INT m_nameHash
    INT m_locate
    INT m_propIndex
    INT m_textureIndex
    INT m_cost
    INT m_eAnchorPoint
    INT m_eShopEnum
    INT m_eCharacter
	TEXT_LABEL_31 m_textLabel
ENDSTRUCT

/// PURPOSE: Wrapper for new clothing outfit item shop data
/// NOTE:
///    Keep in sync with code in commands_extrametadata.cpp
STRUCT scrShopPedOutfit
	INT	m_lockHash
    INT m_nameHash
    INT m_cost
    INT m_numberOfProps
    INT m_numberOfComponents
	INT m_eShopEnum
	INT m_eCharacter
	TEXT_LABEL_31 m_textLabel
ENDSTRUCT

/// PURPOSE: Wrapper for new weapons data
/// NOTE:
///    Keep in sync with code in commands_extrametadata.cpp
STRUCT sWeaponShopItemValues
	INT		m_lockHash
	INT		Id
	INT		Cost
	TEXT_LABEL_31	Label
ENDSTRUCT

/// PURPOSE: Wrapper for new weapon shop items data
/// NOTE:
///    Keep in sync with code in commands_extrametadata.cpp
STRUCT scrShopWeaponData
	INT						m_lockHash
	INT						m_nameHash
	INT						Id
	INT						Cost
	INT						AmmoCost
	INT						AmmoType
	INT						DefaultClipSize
	TEXT_LABEL_31			Label
	TEXT_LABEL_31			weaponDesc
	TEXT_LABEL_31			weaponTT
	TEXT_LABEL_31			weaponUppercase
ENDSTRUCT

/// PURPOSE: Wrapper for new weapon shop items data
/// NOTE: ModType returns a hash of the weapon component's attach point name (and not something sensible, like an enum of component types that matches code...)
/// NOTE:
///    Keep in sync with code in commands_extrametadata.cpp
STRUCT scrShopWeaponComponentData
	INT 					ModType
	BOOL					IsDefault
	INT						m_lockHash
	INT						m_componentName
	INT						Id
	INT						Cost
	TEXT_LABEL_31			Label
	TEXT_LABEL_31			m_componentDesc
ENDSTRUCT

/// PURPOSE: Wrapper for new vehicles data
/// NOTE:
///    Keep in sync with code in commands_extrametadata.cpp
STRUCT  scrShopVehicleData
	INT		m_lockHash
	INT		m_nameHash
	INT		m_cost
	TEXT_LABEL_31	m_textLabel
ENDSTRUCT

/// PURPOSE: Wrapper for new vehicle mods data
/// NOTE:
///    Keep in sync with code in commands_extrametadata.cpp
STRUCT  scrShopVehicleModData
	INT		m_lockHash
	INT		m_nameHash
	INT		m_cost
ENDSTRUCT


//PURPOSE: Gets the number of extra tattoo shop items for a given faction
NATIVE FUNC INT GET_NUM_TATTOO_SHOP_DLC_ITEMS(TATTOO_FACTION_ENUM tattoo_faction) = "0x883e6f2863a2c982"

//PURPOSE: 
//	Get the total number of messages in the inbox available to be processed
//NOTE: 
//	This number may change (bigger or smaller) as we refresh our local inbox
NATIVE FUNC BOOL GET_TATTOO_SHOP_DLC_ITEM_DATA(TATTOO_FACTION_ENUM tattoo_faction, INT tattooIndex, sTattooShopItemValues& out_Values) = "0x7a1b82e97e3bd5be"

//PURPOSE: Returns the index of the tattoo that matches the faction and hash parameters.
//			This index can then be used to call GET_TATTOO_SHOP_DLC_ITEM_DATA
//PARAMS: Specify a collectionHash of -1 to check all collections
//RETURNS: -1 if no match was found
NATIVE FUNC INT GET_TATTOO_SHOP_DLC_ITEM_INDEX(TATTOO_FACTION_ENUM tattoo_faction, INT collectionHash, INT presetHash) = "0x35f01d0bcdf83b24"

//PURPOSE: Initialises a scrShopPedComponent to its default values
NATIVE PROC INIT_SHOP_PED_COMPONENT(scrShopPedComponent& componentItem) = "0xb5abdb2fa64e87f2"

//PURPOSE: Initialises a scrShopPedProp to its default values
NATIVE PROC INIT_SHOP_PED_PROP(scrShopPedProp& componentItem) = "0x1cf199d23d4dfae4"

//PURPOSE: Used to get the hashName for a DLC component for a ped based on global drawable and texture indices
NATIVE FUNC INT GET_HASH_NAME_FOR_COMPONENT(INT pedIndex, INT componentType, INT drawableIndex, INT textureIndex) = "0x748ef68a43bbbc6c"

//PURPOSE: Used to get the hashName for a DLC prop for a ped based on global drawable and texture indices
NATIVE FUNC INT GET_HASH_NAME_FOR_PROP(INT pedIndex, INT anchorPoint, INT propIndex, INT textureIndex) = "0x7abbacadfb201c3a"

//PURPOSE: Used after calling SETUP_SHOP_PED_APPAREL_QUERY with SHOP_PED_COMPONENT, gets the component data for this index
NATIVE PROC GET_SHOP_PED_QUERY_COMPONENT(INT index, scrShopPedComponent& componentItem) = "0xea030ac498b5f181"

//PURPOSE: Used after calling SETUP_SHOP_PED_APPAREL_QUERY_TU, gets the index within the query results list of the component with nameHash
//			The returned index can then be passed to GET_SHOP_PED_QUERY_COMPONENT
//RETURNS: -1 if no component was found with this nameHash
NATIVE FUNC INT GET_SHOP_PED_QUERY_COMPONENT_INDEX(INT nameHash) = "0x8f3f503bada161ed"

//PURPOSE: Looks up a component item based on the supplied name hash and returns its information
NATIVE PROC GET_SHOP_PED_COMPONENT(INT nameHash, scrShopPedComponent& componentItem) = "0x37e8462bc2a63393"

//PURPOSE: Used after calling SETUP_SHOP_PED_APPAREL_QUERY with SHOP_PED_PROP, gets the component data for this index
NATIVE PROC GET_SHOP_PED_QUERY_PROP(INT index, scrShopPedProp& componentItem) = "0xc99ce91134872039"

//PURPOSE: Used after calling SETUP_SHOP_PED_APPAREL_QUERY_TU, gets the index within the query results list of the prop with nameHash
//			The returned index can then be passed to GET_SHOP_PED_QUERY_PROP
//RETURNS: -1 if no prop was found with this nameHash
NATIVE FUNC INT GET_SHOP_PED_QUERY_PROP_INDEX(INT nameHash) = "0x971016887dc14ced"

//PURPOSE: Looks up a component item based on the supplied name hash and returns its information
NATIVE PROC GET_SHOP_PED_PROP(INT nameHash, scrShopPedProp& componentItem) = "0x46bb251c1291e1ba"

//PURPOSE: Sets up a query of the scrShopPedComponent or scrShopPedProp (eShopPedApparel) based on the character, shop and location
//PARAMS:
//	locate - The desired locate, use LOC_ANY(-1) to query any location
//	apparelType - The eShopPedApparel of the item
//	anchorPoint - Pass in a specific anchor point for prop queries or ANCHOR_NONE(-1) for any
//	componentType - Pass in the specific component type for component queries or PV_COMP_INVALID(-1) for any
NATIVE FUNC INT SETUP_SHOP_PED_APPAREL_QUERY(INT character, INT shop, INT locate, INT apparelType) = "0xd58129e68c118090"

//PURPOSE: TU Version of SETUP_SHOP_PED_APPAREL_QUERY, with added query options
NATIVE FUNC INT SETUP_SHOP_PED_APPAREL_QUERY_TU(INT character, INT shop, INT locate, INT apparelType, INT anchorPoint, INT componentType) = "0xa188d1127a77c942"

//PURPOSE: Does this item (eShopPedApparel) have a restriction tag set on it e.g. HASH("LONG_SLEEVE")?
NATIVE FUNC BOOL DOES_SHOP_PED_APPAREL_HAVE_RESTRICTION_TAG(INT nameHash, INT tagHash, INT apparelType) = "0x036d1ea7243f2ccc"

//PURPOSE: Does the Current Ped have with this component have a restriction tag set on it
NATIVE FUNC BOOL DOES_CURRENT_PED_COMPONENT_HAVE_RESTRICTION_TAG(PED_INDEX pedIndex, PED_COMPONENT componentNumber, INT tagHash) = "0x7796b21b76221bc5"

//PURPOSE: Does the Current Ped have with this prop at position have a restriction tag set on it
NATIVE FUNC BOOL DOES_CURRENT_PED_PROP_HAVE_RESTRICTION_TAG(PED_INDEX pedIndex, INT position, int tagHash) = "0xd726bab4554da580"

//PURPOSE: Get the number of variant components for a specific DLC item
NATIVE FUNC INT GET_SHOP_PED_APPAREL_VARIANT_COMPONENT_COUNT(INT nameHash) = "0x9dcc12e44dda0a36"

//PURPOSE: Get the number of variant props for a specific DLC item
NATIVE FUNC INT GET_SHOP_PED_APPAREL_VARIANT_PROP_COUNT(INT nameHash) = "0xda897eb65abfc365"

//PURPOSE: Get the number of forced components for a specific DLC item
NATIVE FUNC INT GET_SHOP_PED_APPAREL_FORCED_COMPONENT_COUNT(INT nameHash) = "0x2c13d8eab528ce21"

//PURPOSE: Get the number of forced props for a specific DLC item
NATIVE FUNC INT GET_SHOP_PED_APPAREL_FORCED_PROP_COUNT(INT nameHash) = "0x2abaebbc719ed4fe"

//PURPOSE: Get information about the forced component at the given index for a specific DLC item
//RETURNS:
//	forcedComponentNameHash - Will be non-zero if the forced item is a DLC item (zero is default)
//	forcedComponentEnumValue - If the forcedComponentNameHash is zero this will contain the enum value of a disk item to force (-1 is default)
//	forcedComponentType - Contains the component type for an on disk forced component
NATIVE PROC GET_FORCED_COMPONENT(INT nameHash, INT forcedComponentIndex, INT& forcedComponentNameHash, INT& forcedComponentEnumValue, INT& forcedComponentType) = "0xd58956643d657992"

//PURPOSE: Get information about the forced prop at the given index for a specific DLC item
//RETURNS:
//	forcedPropNameHash - Will be non-zero if the forced item is a DLC item (zero is default)
//	forcedPropEnumValue - If the forcedPropNameHash is zero this will contain the enum value of a disk item to force (-1 is default)
//	forcedPropAnchor - Contains the anchor point for any on disk forced props
NATIVE PROC GET_FORCED_PROP(INT nameHash, INT forcedPropIndex, INT& forcedPropNameHash, INT& forcedPropEnumValue, INT& forcedPropAnchor) = "0xdd2207d8f05a54a3"

//PURPOSE: Get information about the variant component at the given index for a specific DLC item
//RETURNS:
//	variantComponentNameHash - Will be non-zero if the variant item is a DLC item (zero is default)
//	variantComponentEnumValue - If the variantComponentNameHash is zero this will contain the enum value of a disk item to use (-1 is default)
//	variantComponentType - Contains the component type for an on disk variant component
NATIVE PROC GET_VARIANT_COMPONENT(INT nameHash, INT variantComponentIndex, INT& variantComponentNameHash, INT& variantComponentEnumValue, INT& variantComponentType) = "0x0225613f2ac9e3c8"

//PURPOSE: Get information about the variant prop at the given index for a specific DLC item
//RETURNS:
//	variantPropNameHash - Will be non-zero if the variant item is a DLC item (zero is default)
//	variantPropEnumValue - If the variantPropNameHash is zero this will contain the enum value of a disk item to use (-1 is default)
//	variantPropAnchor - Contains the anchor point for any on disk variant props
NATIVE PROC GET_VARIANT_PROP(INT nameHash, INT variantPropIndex, INT& variantPropNameHash, INT& variantPropEnumValue, INT& variantPropAnchor) = "0xead0175c012d1ca4"

//PURPOSE: Sets up a query of the scrShopPedOutfit based on the character and shop
// *** PLEASE CONSIDER USING SETUP_SHOP_PED_APPAREL_QUERY WITH OUTFIT TYPE AND LOC_ANY(-1) FOR LOCATION INSTEAD ***
NATIVE FUNC INT SETUP_SHOP_PED_OUTFIT_QUERY(INT character, INT shop) = "0x30264a1c9adaae62"

//PURPOSE: Used after calling SETUP_SHOP_PED_OUTFIT_QUERY, gets the component data for this index
NATIVE PROC GET_SHOP_PED_QUERY_OUTFIT(INT index, scrShopPedOutfit& outfitItem) = "0x43ffb630e515d7a1"

//PURPOSE: Looks up an outfit item based on the supplied name hash and returns its information
NATIVE PROC GET_SHOP_PED_OUTFIT(INT nameHash, scrShopPedOutfit& outfitItem) = "0x24dfba133538eaec"

//PURPOSE: Gets the locate of the outfit for the given name hash, -1 if it doesn't exists
NATIVE FUNC INT 	GET_SHOP_PED_OUTFIT_LOCATE(INT nameHash) = "0xb3ac49cb24f59ed4"

//PURPOSE: Used after calling SETUP_SHOP_PED_OUTFIT_QUERY, loads the component data for this index into the "itemInfo"
NATIVE FUNC	BOOL 	GET_SHOP_PED_OUTFIT_COMPONENT_VARIANT(INT nameHash, INT componentIndex, scrOutfitCompStruct& itemInfo) = "0xa5404cdf63badf48"

//PURPOSE: Used after calling SETUP_SHOP_PED_OUTFIT_QUERY, loads the prop data for this index into the "itemInfo"
NATIVE FUNC	BOOL 	GET_SHOP_PED_OUTFIT_PROP_VARIANT(INT nameHash, INT propIndex, scrOutfitPropStruct& itemInfo) = "0xe0a9b7f977ebd7af"


//PURPOSE: 
//	Returns the hash for the component with componentIndex as index in the outfit with nameHash
//	Returns -1 if outfit with nameHash does not exist or if componentIndex is out of bounds
//NOTE:
//	Returned value can be used as a parameter for GET_SHOP_PED_COMPONENT
NATIVE FUNC INT GET_SHOP_PED_OUTFIT_COMPONENT(INT nameHash, int componentIndex) = "0x7b77c31c6e50678f"

//PURPOSE: 
//	Returns the hash for the prop with propIndex as index in the outfit with nameHash
//	Returns -1 if outfit with nameHash does not exist or if propIndex is out of bounds
//NOTE:
//	Returned value can be used as a parameter for GET_SHOP_PED_PROP
NATIVE FUNC INT GET_SHOP_PED_OUTFIT_PROP(INT nameHash, int propIndex) = "0x7a3888c090e2a616"

//PURPOSE: Query the content lock status of this item
NATIVE FUNC BOOL IS_CONTENT_ITEM_LOCKED(INT lockHash) = "0x1b5c8ee302fc0d1e"

//PURPOSE: Returns number of available DLC vehicles
NATIVE FUNC INT GET_NUM_DLC_VEHICLES() = "0x63913871ecc3707e"

//PURPOSE: Returns MODEL_NAMES for an available DLC vehicle (index must be inside range: (0 <= dlcIndex < GET_NUM_DLC_VEHICLES()) )
NATIVE FUNC MODEL_NAMES GET_DLC_VEHICLE_MODEL(INT index) = "0x6f4ef840847d6dab"

//PURPOSE: Looks up a vehicle based on the supplied dlc index (dlcIndex must be inside range: (0 <= dlcIndex < GET_NUM_DLC_VEHICLES()) )
NATIVE FUNC BOOL GET_DLC_VEHICLE_DATA(INT dlcIndex, scrShopVehicleData& vehicle) = "0xcd58de0b13d04118"

//PURPOSE: Looks up vehicle flags based on the supplied dlc index (dlcIndex must be inside range: (0 <= dlcIndex < GET_NUM_DLC_VEHICLES()) )
// Use the enum below as and index to the bits set from the metadata, if more are required we will need to update the enum
//Enum:
// <enumdef type="eVehicleFlags">
//	<enumval name="VF_DISABLE_GARAGE"/>
// </enumdef>
NATIVE FUNC INT GET_DLC_VEHICLE_FLAGS(INT dlcIndex) = "0x05cc5402fda31300"

//PURPOSE: Returns number of available DLC vehicle modifications for the supplied DLC index (dlcIndex must be inside range: (0 <= dlcIndex < GET_NUM_DLC_VEHICLES()) )
NATIVE FUNC INT GET_NUM_DLC_VEHICLE_MODS(INT dlcIndex) = "0xd5edccf2f3a5b664"

//PURPOSE: Looks up a vehicle mod based on the supplied dlc index and modIndex
//NOTE : (dlcIndex must be inside range: (0 <= dlcIndex < GET_NUM_DLC_VEHICLES()) )
//NOTE : (modIndex must be inside range: (0 <= modIndex < GET_NUM_DLC_VEHICLE_MODS(dlcIndex)) )
NATIVE FUNC BOOL GET_DLC_VEHICLE_MOD_DATA(INT dlcIndex, INT modIndex, scrShopVehicleModData& vehicleMod) = "0xced26b1d82b4f831"

//PURPOSE: Returns number of available DLC weapons
NATIVE FUNC INT GET_NUM_DLC_WEAPONS() = "0x501053ebab36db66"

//PURPOSE: Returns number of available DLC weapons in SP
NATIVE FUNC INT GET_NUM_DLC_WEAPONS_SP() = "0xeff3ecb899fc93ac"

//PURPOSE: Looks up a weapon based on the supplied dlc index (dlcIndex must be inside range: (0 <= dlcIndex < GET_NUM_DLC_WEAPONS()) )
NATIVE FUNC BOOL GET_DLC_WEAPON_DATA(INT dlcIndex, scrShopWeaponData& weapon) = "0x4cd88d794e108bec"

//PURPOSE: Looks up a sp weapon based on the supplied dlc index (dlcIndex must be inside range: (0 <= dlcIndex < GET_NUM_DLC_WEAPONS()) )
NATIVE FUNC BOOL GET_DLC_WEAPON_DATA_SP(INT dlcIndex, scrShopWeaponData& weapon) = "0x75bacf95335672b8"

//PURPOSE: Returns number of available DLC weapon components for the supplied DLC index (dlcIndex must be inside range: (0 <= dlcIndex < GET_NUM_DLC_WEAPONS()) )
NATIVE FUNC INT GET_NUM_DLC_WEAPON_COMPONENTS(INT dlcIndex) = "0x8c780bef2d6db238"

//PURPOSE: Returns number of available DLC weapon components in SP for the supplied DLC index (dlcIndex must be inside range: (0 <= dlcIndex < GET_NUM_DLC_WEAPONS()) )
NATIVE FUNC INT GET_NUM_DLC_WEAPON_COMPONENTS_SP(INT dlcIndex) = "0xa67aea8bbdc78f33"

//PURPOSE: Looks up a weapon component based on the supplied dlc index and componentIndex
//NOTE : (dlcIndex must be inside range: (0 <= dlcIndex < GET_NUM_DLC_WEAPONS()) )
//NOTE : (componentIndex must be inside range: (0 <= componentIndex < GET_NUM_DLC_WEAPON_COMPONENTS(dlcIndex)) )
//NOTE : ModType inside scrShopWeaponComponentData returns a hash of the weapon component's attach point name (and not something sensible, like an enum of component types...)
NATIVE FUNC BOOL GET_DLC_WEAPON_COMPONENT_DATA(INT dlcIndex, INT componentIndex, scrShopWeaponComponentData& weaponComponent) = "0x45f755b731a742d2"

//PURPOSE: Looks up a weapon component in SP based on the supplied dlc index and componentIndex
//NOTE : (dlcIndex must be inside range: (0 <= dlcIndex < GET_NUM_DLC_WEAPONS()) )
//NOTE : (componentIndex must be inside range: (0 <= componentIndex < GET_NUM_DLC_WEAPON_COMPONENTS(dlcIndex)) )
//NOTE : ModType inside scrShopWeaponComponentData returns a hash of the weapon component's attach point name (and not something sensible, like an enum of component types...)
NATIVE FUNC BOOL GET_DLC_WEAPON_COMPONENT_DATA_SP(INT dlcIndex, INT componentIndex, scrShopWeaponComponentData& weaponComponent) = "0xd6677a8863dc6340"

//PURPOSE: This is set to true when ever some content within the in-game stores has been unlocked via a paid pack for a given type
NATIVE FUNC BOOL HAVE_SHOP_CONTENT_RIGHTS_CHANGED(eContentRightsTypes type) = "0x1dfb7045135146e5"

//PURPOSE: Resets the status for a given type once we have invalidated all shop data to ensure it is up to date
NATIVE PROC RESET_SHOP_CONTENT_RIGHTS_CHANGED(eContentRightsTypes type) = "0xff08664f971c8226"

NATIVE PROC EXECUTE_CONTENT_CHANGESET(INT dlcNameHash, INT groupName, INT changeSetName) = "0x6dbfcee18f70ff9b"
NATIVE PROC REVERT_CONTENT_CHANGESET(INT dlcNameHash, INT groupName, INT changeSetName) = "0x67f40fc4e8c80e77"

NATIVE PROC EXECUTE_CONTENT_CHANGESET_GROUP(INT dlcNameHash, INT groupName) = "0xb1d68580bdbc7484"
NATIVE PROC REVERT_CONTENT_CHANGESET_GROUP(INT dlcNameHash, INT groupName) = "0xc7c82b4c73e95908"

NATIVE PROC EXECUTE_CONTENT_CHANGESET_GROUP_FOR_ALL(INT groupName) = "0xec1d16396ec19654"
NATIVE PROC REVERT_CONTENT_CHANGESET_GROUP_FOR_ALL(INT groupName) = "0x26908af0bdf2030d"

//PURPOSE:	Returns TRUE if the vehicle mod with the identifier hash is a DLC mod
NATIVE FUNC BOOL IS_DLC_VEHICLE_MOD(INT identifierHash) = "0xd624ba89d119abd9"
//PURPOSE:	Returns the content locking hash of the mod with the provided identifier hash
NATIVE FUNC INT GET_DLC_VEHICLE_MOD_LOCK_HASH(INT identifierHash) = "0x3d7b86f100512881"
