USING "commands_vehicle.sch"
USING "model_enums.sch"
USING "weapon_enums.sch"
USING "types.sch"

// List of weapon skill levels - must match the eWeaponSkill enumerated type in 
//	weaponinfo.h in the games Weapons directory
ENUM WEAPON_SKILLS
	WEAPONSKILL_POOR = 0,
	WEAPONSKILL_STD = 1,
	WEAPONSKILL_PRO = 2
ENDENUM

ENUM VEHICLE_SELECTED_WEAPONS
	SELECTEDWEAPON_NONE = 0,
	SELECTEDWEAPON_GUNS,		//	1
	SELECTEDWEAPON_BOMBS,		//	2
	SELECTEDWEAPON_HSMISSILES,	//	3
	SELECTEDWEAPON_MISSILES		//	4
ENDENUM

// Keep in sync with VehicleResourceFlags in VehicleScriptResource.h
ENUM WEAPON_RESOURCE_FLAGS

	WRF_REQUEST_BASE_ANIMS		= 1,
	WRF_REQUEST_COVER_ANIMS		= 2,
	WRF_REQUEST_MELEE_ANIMS		= 4,
	WRF_REQUEST_MOTION_ANIMS	= 8,
	WRF_REQUEST_STEALTH_ANIMS	= 16,
	WRF_REQUEST_ALL_MOVEMENT_VARIATION_ANIMS = 32, 

	WRF_REQUEST_ALL_ANIMS		= 31
ENDENUM

ENUM EXTRA_WEAPON_COMPONENT_RESOURCE_FLAGS
	WEAPON_COMPONENT_NONE		= 0,
	WEAPON_COMPONENT_FLASH		= 1,
	WEAPON_COMPONENT_SCOPE		= 2,
	WEAPON_COMPONENT_SUPP		= 4,
	WEAPON_COMPONENT_SCLIP2		= 8,
	WEAPON_COMPONENT_GRIP		= 16
ENDENUM

/// PURPOSE: values from 0-100 to display in HUD-related activities
///    May not be directly representative of actual values
/// NOTE:
///    Keep in sync with code in commands_weapon.cpp
STRUCT sHudStatValues
	INT Damage
	INT Speed
	INT Capacity
	INT Accuracy
	INT Range
ENDSTRUCT

//~>								  General Purpose Commands								<~

//INFO:
//PARAM NOTES: bEnable - whether or not you want laser sights to render
//PURPOSE: Toggles the rendering of the laser sights on weapons
NATIVE PROC ENABLE_LASER_SIGHT_RENDERING( BOOL bEnable ) = "0xe05dc71741b614fb"

//INFO:
//PARAM NOTES: WEAPONCOMPONENT_TYPE is in weapon_enums.sch
//PURPOSE: Return the model used by a weapon component type. More info
NATIVE FUNC MODEL_NAMES GET_WEAPON_COMPONENT_TYPE_MODEL(WEAPONCOMPONENT_TYPE weaponComponent) = "0x2597f123290b0413"

//INFO:
//PARAM NOTES: WEAPON_TYPE is in weapon_enums.sch
//PURPOSE: Return the model used by a weapon type. More info
NATIVE FUNC MODEL_NAMES GET_WEAPONTYPE_MODEL(WEAPON_TYPE weapon) = "0xb8dee91181c30e65"

//INFO:
//PARAM NOTES:
//PURPOSE: Return which slot this weapon type is placed in
NATIVE FUNC WEAPON_SLOT GET_WEAPONTYPE_SLOT(WEAPON_TYPE weapon) = "0xc5ede22c3d2885b3"

//INFO:
//PARAM NOTES:
//PURPOSE: Return which group this weapon type is placed in
NATIVE FUNC WEAPON_GROUP GET_WEAPONTYPE_GROUP(WEAPON_TYPE weapon) = "0x7f4cb90bca531a70"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the number of entries in the variant model info extra components array
NATIVE FUNC INT GET_WEAPON_COMPONENT_VARIANT_EXTRA_COUNT(WEAPONCOMPONENT_TYPE weaponComponent) = "0xb02e6513201cffba"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the model hash at the given index in the variant model info extra components array
NATIVE FUNC MODEL_NAMES GET_WEAPON_COMPONENT_VARIANT_EXTRA_MODEL(WEAPONCOMPONENT_TYPE weaponComponent, INT extraComponentIndex) = "0xdcd1cf170306e130"

//~>								 Ammo Commands								<~

//INFO:
//PARAM NOTES:
//PURPOSE: Give ammo for a weapon type to a character
NATIVE PROC ADD_AMMO_TO_PED(PED_INDEX PedIndex, WEAPON_TYPE TypeOfWeapon, INT AmountOfAmmo) = "0x4f692b4cc67a70bc"

//INFO:
//PARAM NOTES:
//PURPOSE: Set the ammo a character has for a certain weapon type
NATIVE PROC SET_PED_AMMO(PED_INDEX PedIndex, WEAPON_TYPE TypeOfWeapon, INT AmountOfAmmo, BOOL IgnoreDeadCheck = FALSE) = "0xca8f055643a07c74"

//INFO:
//PARAM NOTES:
//PURPOSE: Set the specified weapon type to have infinite ammo for the ped.  If weapon type is WEAPONTYPE_INVALID then all weapons count as infinite ammo.
NATIVE PROC SET_PED_INFINITE_AMMO(PED_INDEX PedIndex, BOOL Infinite, WEAPON_TYPE TypeOfWeapon = WEAPONTYPE_INVALID) = "0x73ac05050f54f1e0"

//INFO:
//PARAM NOTES:
//PURPOSE: Set the specified ped to have a infinite ammo clips, meaning they don't need to reload.
NATIVE PROC SET_PED_INFINITE_AMMO_CLIP(PED_INDEX PedIndex, BOOL Infinite) = "0xb5ad1b3d21ec1aa1"

//INFO:
//PARAM NOTES:
//PURPOSE: Set the specified ped to have finite ammo for WEAPON_STUNGUN, overriding metadata InfiniteAmmo value
//		   Natives that set ammo values on WEAPON_STUNGUN/AMMO_STUNGUN will be IGNORED if finite ammo is not set by this native
NATIVE PROC SET_PED_STUN_GUN_FINITE_AMMO(PED_INDEX PedIndex, BOOL SetFinite) = "0x5af8598f3b8dd63d"

//INFO:
//PARAM NOTES:
//PURPOSE: Return the amount of ammo a character has for a weapon
NATIVE FUNC INT GET_AMMO_IN_PED_WEAPON(PED_INDEX PedIndex, WEAPON_TYPE TypeOfWeapon) = "0x1f741abe25b3cdd3"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the maximum number of bullets allowed in one clip 
NATIVE FUNC INT GET_MAX_AMMO_IN_CLIP(PED_INDEX PedIndex, WEAPON_TYPE WeaponType, BOOL DoDeadCheck = true ) = "0x3fc10ba7b76fe8ba"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the current amount of ammo in a clip
NATIVE FUNC BOOL GET_AMMO_IN_CLIP(PED_INDEX PedIndex, WEAPON_TYPE WeaponType, INT &ReturnAmmoInClip ) = "0x49d5a28b919b07c0"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets the ampuntof ammo in a clip.
NATIVE FUNC BOOL SET_AMMO_IN_CLIP(PED_INDEX PedIndex, WEAPON_TYPE WeaponType, INT AmmoInClip ) = "0x1e0ed6750db74e70"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC BOOL GET_MAX_AMMO(PED_INDEX PedIndex, WEAPON_TYPE WeaponType, INT &ReturnMaxAmmo ) = "0x6019be7548b68c4b"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the max ammo directly for an ammo type, rather than looking up ammo type from weapon hash
NATIVE FUNC BOOL GET_MAX_AMMO_BY_TYPE(PED_INDEX PedIndex, AMMO_TYPE AmmoType, INT &ReturnMaxAmmo ) = "0x5b75073e91a0aef6"

//INFO:
//PARAM NOTES:
//PURPOSE: Adds the ammo amount based on type. If an item of the type doesn't exist, one will be created.
NATIVE PROC ADD_PED_AMMO_BY_TYPE(PED_INDEX PedIndex, AMMO_TYPE AmmoType, INT AmmoAmount) = "0xfaf8b712245b6bf6"

//INFO:
//PARAM NOTES:
//PURPOSE: Set the ammo amount based on type (if an item of the type exists). 
NATIVE PROC SET_PED_AMMO_BY_TYPE(PED_INDEX PedIndex, AMMO_TYPE AmmoType, INT AmmoAmount) = "0xb003193c68661c8d"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the total ammo given the ammo type
NATIVE FUNC INT GET_PED_AMMO_BY_TYPE(PED_INDEX PedIndex, AMMO_TYPE AmmoType) = "0x4a88c4acac824897"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the ammo type for the given weapon (considering any overrides by clip component, etc.)
NATIVE FUNC AMMO_TYPE GET_PED_AMMO_TYPE_FROM_WEAPON(PED_INDEX PedIndex, WEAPON_TYPE WeaponType) = "0x5d3596c624f0c4ac"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the ammo type for the given weapon (default ammo, as defined in weapon metdata)
NATIVE FUNC AMMO_TYPE GET_PED_ORIGINAL_AMMO_TYPE_FROM_WEAPON(PED_INDEX PedIndex, WEAPON_TYPE WeaponType) = "0x589b5b25edf4e89c"

//INFO:
//PARAM NOTES:
//PURPOSE: Specifies how much ammo the ped will drop when he dies. ****Only works in MP at the moment***
NATIVE PROC SET_PED_AMMO_TO_DROP(PED_INDEX PedIndex, INT AmmoAmount) = "0xbeb9849370cc0abe"

//INFO:
//PARAM NOTES:
//PURPOSE: Set pickup ammo ammount scaler. Need to call it every frame since the scaler gets reset. 
NATIVE PROC SET_PICKUP_AMMO_AMOUNT_SCALER(FLOAT scale) = "0xed8e9ca97c15c21d"

//~>						Weapon commands

//INFO:
//PARAM NOTES:
//PURPOSE: Give a weapon to a character with ammo
NATIVE PROC GIVE_WEAPON_TO_PED(PED_INDEX PedIndex, WEAPON_TYPE TypeOfWeapon, INT AmountOfAmmo, BOOL bForceIntoHand = FALSE, BOOL bEquip = TRUE) = "0x9521fb98db6ddf50"

//INFO:
//PARAM NOTES:
//PURPOSE: Requests the weapon model and gives the weapon to a character with ammo once the model has loaded
NATIVE PROC GIVE_DELAYED_WEAPON_TO_PED(PED_INDEX PedIndex, WEAPON_TYPE TypeOfWeapon, INT AmountOfAmmo, BOOL bSetAsCurrentWeapon) = "0x5399a284d9fad3bd"

//INFO:
//PARAM NOTES:
//PURPOSE: Set the weapon a character is currently using
NATIVE PROC SET_CURRENT_PED_WEAPON(PED_INDEX PedIndex, WEAPON_TYPE TypeOfWeapon, BOOL bForceInHand=false) = "0x202b28feabec4034"

//INFO:
//PARAM NOTES:
//PURPOSE: Get the current weapon a character is using - returns if it is usable (i.e. in their hand)
NATIVE FUNC BOOL GET_CURRENT_PED_WEAPON(PED_INDEX PedIndex, WEAPON_TYPE &ReturnWeaponType, BOOL DoDeadCheck = true) = "0xa7e29842fa438ed6"

//INFO:
//PARAM NOTES:
//PURPOSE: Get the current weapon a character is using - returns if it is usable (i.e. in their hand)
NATIVE FUNC ENTITY_INDEX GET_CURRENT_PED_WEAPON_ENTITY_INDEX(PED_INDEX PedIndex, BOOL DoDeadCheck = true) = "0x4d03373543a78098"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the best weapon the designated ped owns
NATIVE FUNC WEAPON_TYPE GET_BEST_PED_WEAPON(PED_INDEX PedIndex, BOOL bIgnoreAmmoCheck=false) = "0x4eb626d21abb5bae"

//INFO:
//PARAM NOTES:
//PURPOSE: Set the current vehicle weapon ped can use
//RETURNS: TRUE if it successfully changed the vehicle weapon
NATIVE FUNC BOOL SET_CURRENT_PED_VEHICLE_WEAPON(PED_INDEX PedIndex, WEAPON_TYPE TypeOfWeapon) = "0x922ac1d1e4ad7864"

//INFO:
//PARAM NOTES:
//PURPOSE: Retrieve the vehicle weapon the designated ped is currently using
//RETURNS: TRUE if it successfully found a vehicle weapon
NATIVE FUNC BOOL GET_CURRENT_PED_VEHICLE_WEAPON(PED_INDEX PedIndex, WEAPON_TYPE &ReturnWeaponType) = "0x0cc0416f24be03ff"

//INFO:
//PARAM NOTES:
//PURPOSE: Restricts weapon selection when tapping square to select only vehicle weapons
NATIVE PROC SET_PED_CYCLE_VEHICLE_WEAPONS_ONLY(PED_INDEX PedIndex) = "0x983daefb042809e8"

//INFO:
//PARAM NOTES:
//PURPOSE: Return if a weapon is valid for the ped. Checks if the hash exists for the ped.
NATIVE FUNC BOOL IS_WEAPON_VALID(WEAPON_TYPE TypeOfWeapon) = "0x072699bd07af0086"

//INFO:
//PARAM NOTES:
//PURPOSE: Return if character has a weapon
NATIVE FUNC BOOL HAS_PED_GOT_WEAPON(PED_INDEX PedIndex, WEAPON_TYPE TypeOfWeapon, GENERALWEAPON_TYPE GeneralWeaponType = GENERALWEAPON_TYPE_INVALID) = "0x8fea2e94638f9767"

//INFO:
//PARAM NOTES:
//PURPOSE: Return whether or not the current equipped weapon is ready to shoot
NATIVE FUNC BOOL IS_PED_WEAPON_READY_TO_SHOOT(PED_INDEX PedIndex) = "0xc9ddce46bcbb3f06"

//INFO:
//PARAM NOTES:
//PURPOSE: Return which weapon is in a given slot for a character
NATIVE FUNC WEAPON_TYPE GET_PED_WEAPONTYPE_IN_SLOT(PED_INDEX PedIndex, WEAPON_SLOT slot) = "0xcb497f652acb2dd3"

//INFO:
//PARAM NOTES: WEAPON_SKILLS are in commands_weapon.sch
//PURPOSE: Set a characters weapon skill
NATIVE PROC SET_PED_WEAPON_SKILL(PED_INDEX PedIndex, WEAPON_SKILLS WeaponSkill) = "0x74b2ba09ce92f351"

//INFO:
//PARAM NOTES:
//PURPOSE: Remove a weapon a character has
NATIVE PROC REMOVE_WEAPON_FROM_PED(PED_INDEX PedIndex, WEAPON_TYPE TypeOfWeapon) = "0xe002dfd518bf86a7"

//INFO:
//PARAM NOTES:
//PURPOSE: Remove all weapons a character has
NATIVE PROC REMOVE_ALL_PED_WEAPONS(PED_INDEX PedIndex, BOOL DeadCheck = TRUE) = "0x70d9ec5af67d79c4"

//INFO:
//PARAM NOTES:
//PURPOSE: Hide a characters weapons while playing a scripted cutscene
NATIVE PROC HIDE_PED_WEAPON_FOR_SCRIPTED_CUTSCENE(PED_INDEX PedIndex, BOOL HideWeaponFlag) = "0x4f1e6a84bc157fa0"

//INFO:
//PARAM NOTES: StoreDestroyedWeaponClipValue: only used if "DestroyObject" is TRUE. This flag ensures the weapon clip value if cached when destroyed, ensuring that it gets restored to this value when it is re-created. 
//PURPOSE: Sets the visibility flag for the characters currently equipped weapon
NATIVE PROC SET_PED_CURRENT_WEAPON_VISIBLE(PED_INDEX PedIndex, BOOL VisibleFlag, BOOL DestroyObject = TRUE, BOOL DeadCheck = TRUE, BOOL StoreDestroyedWeaponClipValue = FALSE) = "0x882a3682867542aa"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets whether a character drops his weapons as pickups when he dies
NATIVE PROC SET_PED_DROPS_WEAPONS_WHEN_DEAD(PED_INDEX PedIndex, BOOL DropsWeaponsFlag) = "0x671d9a1f3d47d0de"

//INFO: This command should be called every frame as the the last valid result only is reurned that frame else it returns 0.
//PARAM NOTES:
//PURPOSE: Checks if it can and gets the last position a weapon was impacted at. More info
NATIVE FUNC BOOL GET_PED_LAST_WEAPON_IMPACT_COORD (PED_INDEX PedIndex, VECTOR &ImpactCoord) = "0x2ef467a4dca81d5a"

//~>							Damage commands

//INFO:
//PARAM NOTES:
//PURPOSE: Return if a character has been damaged by a certain weapon
NATIVE FUNC BOOL HAS_PED_BEEN_DAMAGED_BY_WEAPON(PED_INDEX PedIndex, WEAPON_TYPE TypeOfWeapon, GENERALWEAPON_TYPE GeneralWeaponType = GENERALWEAPON_TYPE_INVALID) = "0x6799f7dd0261990e"

//INFO:
//PARAM NOTES:
//PURPOSE: Clear the damaged by last weapon information on a character
NATIVE PROC CLEAR_PED_LAST_WEAPON_DAMAGE(PED_INDEX PedIndex) = "0xe095496a833d555c"

// Keep in sync with eWeaponCheckFlags in commands_weapon.cpp 
CONST_INT WF_INCLUDE_MELEE			1
CONST_INT WF_INCLUDE_PROJECTILE		2
CONST_INT WF_INCLUDE_GUN			4

//INFO:
//PARAM NOTES:
//PURPOSE: Queries the peds armament using the flags passed
NATIVE FUNC BOOL IS_PED_ARMED(PED_INDEX PedIndex, INT weaponCheckFlags) = "0x5007a91d57c39ffc"


//~>								 Vehicle Commands							<~

//INFO:
//PARAM NOTES:
//PURPOSE: Return if an entity has been damaged by a certain weapon
NATIVE FUNC BOOL HAS_ENTITY_BEEN_DAMAGED_BY_WEAPON(ENTITY_INDEX EntityIndex, WEAPON_TYPE TypeOfWeapon, GENERALWEAPON_TYPE GeneralWeaponType = GENERALWEAPON_TYPE_INVALID) = "0xeef1a3c0e56fc8ff"

//INFO:
//PARAM NOTES:
//PURPOSE: Clear the damaged by last weapon information on an entity
NATIVE PROC CLEAR_ENTITY_LAST_WEAPON_DAMAGE(ENTITY_INDEX EntityIndex) = "0x2ad4bd9956c8aad7"


//~>								 Object Commands						<~

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_PED_DROPS_WEAPON(PED_INDEX PedIndex) = "0xa6d4fbb3b47cf11e"

//INFO:
//PARAM NOTES:
//PURPOSE: Drops a weapon in the peds inventory at the given offset with the given ammo
NATIVE PROC SET_PED_DROPS_INVENTORY_WEAPON(PED_INDEX PedIndex, WEAPON_TYPE WeaponType, VECTOR offset, INT ammoAmount) = "0x35e8b97ba540a71f"

//INFO:
//PARAM NOTES:
//PURPOSE: If Equip is true, gives the ped the specified gadget, if false it gets removed
NATIVE PROC SET_PED_GADGET(PED_INDEX PedIndex, WEAPON_TYPE GadgetType, BOOL Equip) = "0x777180e634735829"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns whether the specified ped gadget is equipped. Returns false if ped does not have gadget or if it is not equipped
NATIVE FUNC BOOL GET_IS_PED_GADGET_EQUIPPED(PED_INDEX PedIndex, WEAPON_TYPE GadgetType) = "0x8de48073046d4cf0"

//INFO:
//PARAM NOTES:
//PURPOSE: Query the selected weapon hash - this is what is selected in the UI, not necessarily equipped
NATIVE FUNC WEAPON_TYPE GET_SELECTED_PED_WEAPON(PED_INDEX PedIndex) = "0x65141ccb0a6f7ea4"

//INFO:
//PARAM NOTES:
//PURPOSE: Explode all the projectiles owned by the specified ped of the specified type
NATIVE PROC EXPLODE_PROJECTILES(PED_INDEX PedIndex, WEAPON_TYPE WeaponType, BOOL bInstant = FALSE) = "0x8c7d915965382c47"

//INFO:
//PARAM NOTES:	bExplode - Pass in TRUE if you want all projectiles of type WeaponType to detonate
//PURPOSE: Explode all the projectiles owned by the specified ped of the specified type
NATIVE PROC REMOVE_ALL_PROJECTILES_OF_TYPE(WEAPON_TYPE WeaponType, BOOL bExplode = FALSE) = "0xa968e928ca6f0a96"

//INFO:
//PARAM NOTES:
//PURPOSE: Activate/Deactivate the specified peds detonator
NATIVE PROC ACTIVATE_DETONATOR(PED_INDEX PedIndex, BOOL Activate) = "0x42c916a10522b15f"

//INFO:
//PARAM NOTES:
//PURPOSE: Query whether the specified ped has fired their detonator
NATIVE FUNC BOOL GET_IS_DETONATOR_FIRED(PED_INDEX PedIndex) = "0xb4cdf0805f86df21"

//INFO:
//PARAM NOTES:
//PURPOSE: Query whether the specified ped has fired their sticky cam viewer
NATIVE FUNC BOOL GET_IS_STICKY_CAM_VIEWER_FIRED(PED_INDEX PedIndex) = "0x68cf1e9fee40721e"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the lock on distance of the current peds weapon (returns -1.0f if not found or invalid weapon)
NATIVE FUNC FLOAT GET_LOCKON_DISTANCE_OF_CURRENT_PED_WEAPON(PED_INDEX PedIndex) = "0xaec78423999efe49"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the maximum lock-on range of the current ped weapon (returns -1.0f if not found or invalid weapon)
NATIVE FUNC FLOAT GET_MAX_RANGE_OF_CURRENT_PED_WEAPON(PED_INDEX PedIndex) = "0x6658b2555bca5bdf"

//INFO:
//PARAM NOTES:
//PURPOSE: Query whether the specified ped has any projectiles attached to the specified vehicle of the specified type (0 for any type)
NATIVE FUNC BOOL HAS_VEHICLE_GOT_PROJECTILE_ATTACHED(PED_INDEX PedIndex, VEHICLE_INDEX VehicleIndex, WEAPON_TYPE WeaponType = 0, SC_DOOR_LIST DoorNumber = SC_DOOR_INVALID) = "0xbc0cfdf47c99d84b"

//INFO:
//PARAM NOTES:
//PURPOSE: Give a weapon component to a ped
NATIVE PROC GIVE_WEAPON_COMPONENT_TO_PED(PED_INDEX PedIndex, WEAPON_TYPE TypeOfWeapon, WEAPONCOMPONENT_TYPE TypeOfComponent) = "0x130c7a0e5945e494"

//INFO:
//PARAM NOTES:
//PURPOSE: Remove a weapon component from the inventory
NATIVE PROC REMOVE_WEAPON_COMPONENT_FROM_PED(PED_INDEX PedIndex, WEAPON_TYPE TypeOfWeapon, WEAPONCOMPONENT_TYPE TypeOfComponent) = "0xdead024b4d0717f8"

//INFO:
//PARAM NOTES:
//PURPOSE: Return if character has a weapon component
NATIVE FUNC BOOL HAS_PED_GOT_WEAPON_COMPONENT(PED_INDEX PedIndex, WEAPON_TYPE TypeOfWeapon, WEAPONCOMPONENT_TYPE TypeOfComponent) = "0x54b42dec4cab3d41"

//INFO:
//PARAM NOTES:
//PURPOSE: Return if character has a weapon component
NATIVE FUNC BOOL GET_PED_CURRENT_WEAPON_TIME_BEFORE_NEXT_SHOT(PED_INDEX PedIndex, INT &TimeBeforeNextShot) = "0x75a8182479296220"

//INFO:
//PARAM NOTES:
//PURPOSE: Return if character weapon component is active, make sure it's a valid weapon component first with HAS_PED_GOT_WEAPON_COMPONENT.
NATIVE FUNC BOOL IS_PED_WEAPON_COMPONENT_ACTIVE(PED_INDEX PedIndex, WEAPON_TYPE TypeOfWeapon, WEAPONCOMPONENT_TYPE TypeOfComponent) = "0x5c89acc6e6cf4148"

//PARAM NOTES: 
//PURPOSE: Make the current peds weapon reload without ped interaction.
NATIVE FUNC BOOL REFILL_AMMO_INSTANTLY(PED_INDEX ped) = "0x8cd8e9cb739389ac"

//INFO: The initial version of this command only works for the player, can be extended to AI if needed.
//PARAM NOTES: 
//PURPOSE: Make a (player) ped reload at the first opportunity and return true, if holding
//		   a reloadable weapon that's not full already, or otherwise, return false.
NATIVE FUNC BOOL MAKE_PED_RELOAD(PED_INDEX ped) = "0xf4d8955f68fa1058"

//INFO: 
//PARAM NOTES: ExtraWeaponComponentFlags - Used to load the non-default weapon components.
//PURPOSE:  Request streaming to load a weapon asset
NATIVE PROC REQUEST_WEAPON_ASSET(WEAPON_TYPE weaponType, INT iWeaponResourceFlags = WRF_REQUEST_ALL_ANIMS, EXTRA_WEAPON_COMPONENT_RESOURCE_FLAGS ExtraWeaponComponentFlags = WEAPON_COMPONENT_NONE) = "0x334e9a09859a3c8d"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Return if a weapon asset is in memory
NATIVE FUNC BOOL HAS_WEAPON_ASSET_LOADED(WEAPON_TYPE weaponType) = "0xc870cd3d6d40cb09"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Tell streaming that this script no longer needs this weapon asset
NATIVE PROC REMOVE_WEAPON_ASSET(WEAPON_TYPE weaponType) = "0x315d54141149c1b6"

//INFO:
//PARAM NOTES:
//PURPOSE: Return if character has a weapon manager - this allows them to use weapons
NATIVE FUNC BOOL HAS_PED_GOT_WEAPON_MANAGER(PED_INDEX PedIndex) = "0x67a9213e9840bae0"

//INFO:
//PARAM NOTES:
//PURPOSE: Create weapon object not attached to ped
NATIVE FUNC OBJECT_INDEX CREATE_WEAPON_OBJECT(WEAPON_TYPE WeaponType, INT AmountOfAmmo, VECTOR VecNewCoors, BOOL CreateDefaultComponents, FLOAT Scale = 1.0, MODEL_NAMES CustomModel = 0, BOOL RegisterAsNetworkObject = FALSE, BOOL ScriptHostObject = TRUE) = "0xbf59603e8a18feb0"

//INFO:
//PARAM NOTES:
//PURPOSE: Attach the specified component to the specified weapon object (created via CREATE_WEAPON_OBJECT)
NATIVE PROC GIVE_WEAPON_COMPONENT_TO_WEAPON_OBJECT(OBJECT_INDEX WeaponObjectIndex, WEAPONCOMPONENT_TYPE WeaponComponent) = "0x0b46dbce80ad9de5"

//INFO:
//PARAM NOTES:
//PURPOSE: Delete the specified component from the specified weapon object (created via CREATE_WEAPON_OBJECT)
NATIVE PROC REMOVE_WEAPON_COMPONENT_FROM_WEAPON_OBJECT(OBJECT_INDEX WeaponObjectIndex, WEAPONCOMPONENT_TYPE WeaponComponent) = "0x8d0169a2fdd87126"

//INFO:
//PARAM NOTES:
//PURPOSE: Check if the weapon (created via CREATE_WEAPON_OBJECT) has the specified weapon component
NATIVE FUNC BOOL HAS_WEAPON_GOT_WEAPON_COMPONENT(OBJECT_INDEX WeaponObjectIndex, WEAPONCOMPONENT_TYPE WeaponComponent) = "0xddc523d7b3e70e65"

//INFO:
//PARAM NOTES:
//PURPOSE: Attach the specified weapon (created via CREATE_WEAPON_OBJECT) to the specified ped
NATIVE PROC GIVE_WEAPON_OBJECT_TO_PED(OBJECT_INDEX WeaponObjectIndex, PED_INDEX PedIndex) = "0x3aea6b9a9fe5bd26"

//INFO:
//PARAM NOTES:
//PURPOSE: Check if the weapon supports the weapon component
NATIVE FUNC BOOL DOES_WEAPON_TAKE_WEAPON_COMPONENT(WEAPON_TYPE WeaponType, WEAPONCOMPONENT_TYPE WeaponComponent) = "0xf387a3736de5f1d5"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns the weapon object for the current equipped ped weapon and detachs it from the ped.
NATIVE FUNC OBJECT_INDEX GET_WEAPON_OBJECT_FROM_PED(PED_INDEX PedIndex, BOOL DoDeadCheck = true) = "0x07093f8f06dd02ff"

//INFO:
//PARAM NOTES:
//PURPOSE: Drops a locally owned ped's weapon. The weapon will be dropped on remote machines as well
NATIVE PROC DROP_WEAPON_OBJECT_OF_PED(PED_INDEX PedIndex, BOOL DoDeadCheck = true) = "0xcb160c7b9368da2e"

//INFO:
//PARAM NOTES:
//PURPOSE: Give the specified ped the set of weapons defined in the specified loadout
NATIVE PROC GIVE_LOADOUT_TO_PED(PED_INDEX PedIndex, LOADOUT_TYPE LoadOut) = "0x588d77b641cbeddf"

//INFO:
//PARAM NOTES:
//PURPOSE: Override any instances of OriginalLoadOut with NewLoadOut
NATIVE PROC SET_LOADOUT_ALIAS(LOADOUT_TYPE OriginalLoadOut, LOADOUT_TYPE NewLoadOut) = "0xa1698d5b905894c0"

//INFO:
//PARAM NOTES:
//PURPOSE: Clear any loadout aliases
NATIVE PROC CLEAR_LOADOUT_ALIAS(LOADOUT_TYPE LoadOut) = "0x27065729161c04e3"

//INFO:
//PARAM NOTES:
//PURPOSE: Set a ped's tint index for the specified weapon
NATIVE PROC SET_PED_WEAPON_TINT_INDEX(PED_INDEX PedIndex, WEAPON_TYPE WeaponType, INT TintIndex) = "0x7fec7f18430588cc"

//INFO:
//PARAM NOTES:
//PURPOSE: Get a ped's tint index for the specified weapon, returns -1 if fails
NATIVE FUNC INT GET_PED_WEAPON_TINT_INDEX(PED_INDEX PedIndex, WEAPON_TYPE WeaponType) = "0xc158eb99f56cb1fb"

//INFO:
//PARAM NOTES:
//PURPOSE: Set a ped's camo index for the specified weapon
NATIVE PROC SET_PED_WEAPON_CAMO_INDEX(PED_INDEX PedIndex, WEAPON_TYPE WeaponType, INT CamoIndex) = "0x4c9ff1928a739330"

//INFO:
//PARAM NOTES:
//PURPOSE: Get a ped's camo index for the specified weapon, returns -1 if fails
NATIVE FUNC INT GET_PED_WEAPON_CAMO_INDEX(PED_INDEX PedIndex, WEAPON_TYPE WeaponType) = "0xef3626a1be542f5e"

//INFO:
//PARAM NOTES:
//PURPOSE: Set the tint values on a weapon object
NATIVE PROC SET_WEAPON_OBJECT_TINT_INDEX(OBJECT_INDEX WeaponObjectIndex, INT TintIndex) = "0x3e27bf30c58d41ec"

//INFO:
//PARAM NOTES:
//PURPOSE: Get the tint values for a weapon object, returns -1 if fails
NATIVE FUNC INT GET_WEAPON_OBJECT_TINT_INDEX(OBJECT_INDEX WeaponObjectIndex) = "0xf22ab94467b80164"

//INFO:
//PARAM NOTES:
//PURPOSE: Get the number of tints a weapon supports
NATIVE FUNC INT GET_WEAPON_TINT_COUNT(WEAPON_TYPE WeaponType) = "0xdf7052e5c1ffbd7b"

//INFO:
//PARAM NOTES:
//PURPOSE: Set a ped's tint index for the specified weapon component attached to the specified weapon
NATIVE PROC SET_PED_WEAPON_COMPONENT_TINT_INDEX(PED_INDEX PedIndex, WEAPON_TYPE WeaponType, WEAPONCOMPONENT_TYPE ComponentType, INT TintIndex) = "0xb7987e326f1fc793"

//INFO:
//PARAM NOTES:
//PURPOSE: Get a ped's tint index for the specified weapon component attached to the specified weapon, returns -1 if fails
NATIVE FUNC INT GET_PED_WEAPON_COMPONENT_TINT_INDEX(PED_INDEX PedIndex, WEAPON_TYPE WeaponType, WEAPONCOMPONENT_TYPE ComponentType) = "0x6f970742b880af88"

//INFO:
//PARAM NOTES:
//PURPOSE: Set the tint values for a specified weapon component attached to the specified weapon object
NATIVE PROC SET_WEAPON_OBJECT_COMPONENT_TINT_INDEX(OBJECT_INDEX WeaponObjectIndex, WEAPONCOMPONENT_TYPE ComponentType, INT TintIndex) = "0x9a614f230d802f82"

//INFO:
//PARAM NOTES:
//PURPOSE: Get the tint values for a specified weapon component attached to the specified weapon object, returns -1 if fails
NATIVE FUNC INT GET_WEAPON_OBJECT_COMPONENT_TINT_INDEX(OBJECT_INDEX WeaponObjectIndex, WEAPONCOMPONENT_TYPE ComponentType) = "0xe4f0e3a023f6b91a"

//INFO:
//PARAM NOTES:
//PURPOSE: Set the camo values on a weapon object
NATIVE PROC SET_WEAPON_OBJECT_CAMO_INDEX(OBJECT_INDEX WeaponObjectIndex, INT CamoIndex) = "0x7ccc68177a94f9be"

//INFO:
//PARAM NOTES:
//PURPOSE: Get the camo values for a weapon object, returns -1 if fails
NATIVE FUNC INT GET_WEAPON_OBJECT_CAMO_INDEX(OBJECT_INDEX WeaponObjectIndex) = "0x8a3d69849bd451fe"

/// PURPOSE:
///    Gets values from code of the variety of HUD-related stats
/// PARAMS:
///    WeaponType - Hash of weapon
///    out_Values - Struct to fill out
/// RETURNS:
///    TRUE if filling out was successful, FALSE and an assert if not
NATIVE FUNC BOOL GET_WEAPON_HUD_STATS(WEAPON_TYPE WeaponType, sHudStatValues& out_Values ) = "0x0eac086d816d5cb1"

/// PURPOSE:
///    Gets values from code of the variety of HUD-related stats
/// PARAMS:
///    WeaponComponentType - Hash of weapon component
///    out_Values - Struct to fill out
/// RETURNS:
///    TRUE if filling out was successful, FALSE and an assert if not
NATIVE FUNC BOOL GET_WEAPON_COMPONENT_HUD_STATS(WEAPONCOMPONENT_TYPE WeaponComponentType, sHudStatValues& out_Values ) = "0x8dc1b37fab5462c2"

//INFO:
//PARAM NOTES:
//PURPOSE: Get the weapon default damage and/or with a weaponcomponent
NATIVE FUNC FLOAT GET_WEAPON_DAMAGE(WEAPON_TYPE WeaponType, WEAPONCOMPONENT_TYPE WeaponComponent) = "0x1c07375215a5ad6b"

//INFO:
//PARAM NOTES:
//PURPOSE: Get the clip size of a weapon
NATIVE FUNC INT GET_WEAPON_CLIP_SIZE(WEAPON_TYPE WeaponType) = "0x982237eb68628e6a"

//INFO:
//PARAM NOTES:
//PURPOSE: Get the time between shots of a weapon
NATIVE FUNC FLOAT GET_WEAPON_TIME_BETWEEN_SHOTS(WEAPON_TYPE WeaponType) = "0xfb17bb33ae9dea97"

//INFO:
//PARAM NOTES:
//PURPOSE: Get the accuracy of the weapon info and/or with a weaponcomponent
NATIVE FUNC FLOAT GET_WEAPON_ACCURACY(WEAPON_TYPE WeaponType, WEAPONCOMPONENT_TYPE WeaponComponent = WEAPONCOMPONENT_INVALID) = "0xf104b3c55715593b"

//INFO:
//PARAM NOTES:
//PURPOSE: Set the peds chance of firing blanks.  The min chance is their chance when close, the max is when further away.
NATIVE PROC SET_PED_CHANCE_OF_FIRING_BLANKS(PED_INDEX PedIndex, FLOAT CHANCE_MIN, FLOAT CHANCE_MAX) = "0x1eabb8571d8c86d4"

//INFO:
//PARAM NOTES:	fProjectileLifeTime will determine how long (in secs) the projectile will live. By default the life time 
//				is infinite. Projectile will still be destroyed on contact with any physical body.
//PURPOSE: Fires off ordnance weapon and returns the projectile object to script for control
NATIVE FUNC ENTITY_INDEX SET_PED_SHOOT_ORDNANCE_WEAPON(PED_INDEX PedIndex, FLOAT fProjectileLifeTime = -1.0) = "0x4afc09d27972d668"

//INFO:
//PARAM NOTES:
//PURPOSE: Requests the given weapon's HD assets. Needs to be called every frame or assets get streamed out.
NATIVE PROC REQUEST_WEAPON_HIGH_DETAIL_MODEL(OBJECT_INDEX ObjectIndex) = "0x5f59388c2ba4ced1"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_WEAPON_DAMAGE_MODIFIER(WEAPON_TYPE WeaponType, FLOAT newModifier) = "0x4e2c3699b7a57d47"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC FLOAT GET_WEAPON_DAMAGE_MODIFIER(WEAPON_TYPE WeaponType) = "0x6beddbd61f42d457"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_WEAPON_FALL_OFF_RANGE_MODIFIER(WEAPON_TYPE WeaponType, FLOAT newModifier) = "0xd2840ccee4fe0b3c"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC FLOAT GET_WEAPON_FALL_OFF_RANGE_MODIFIER(WEAPON_TYPE WeaponType) = "0xc7c9c0acd96afe6e"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_WEAPON_FALL_OFF_DAMAGE_MODIFIER(WEAPON_TYPE WeaponType, FLOAT newModifier) = "0xd8bdb556f05116ae"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC FLOAT GET_DAMAGE_FALL_OFF_DAMAGE_MODIFIER(WEAPON_TYPE WeaponType) = "0x0a88fcdf00ffb555"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_WEAPON_AOE_MODIFIER(WEAPON_TYPE WeaponType, FLOAT newModifier) = "0x7a3cfc319adc00b2"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC FLOAT GET_WEAPON_AOE_MODIFIER(WEAPON_TYPE WeaponType) = "0x11179f4dbc8d7d0f"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_WEAPON_EFFECT_DURATION_MODIFIER(WEAPON_TYPE WeaponType, FLOAT newModifier) = "0xca92f7e472406ec5"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC FLOAT GET_WEAPON_EFFECT_DURATION_MODIFIER(WEAPON_TYPE WeaponType) = "0x6b13c3b8b1a6d4b3"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_RECOIL_ACCURACY_TO_ALLOW_HEADSHOT_PLAYER_MODIFIER(WEAPON_TYPE WeaponType, FLOAT newModifier) = "0xc7c735c837a6b4f9"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC FLOAT GET_RECOIL_ACCURACY_TO_ALLOW_HEADSHOT_PLAYER_MODIFIER(WEAPON_TYPE WeaponType) = "0xe9c6043c02b779f1"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_MIN_HEADSHOT_DISTANCE_PLAYER_MODIFIER(WEAPON_TYPE WeaponType, FLOAT newModifier) = "0xb4424a99f7c232cb"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC FLOAT GET_MIN_HEADSHOT_DISTANCE_PLAYER_MODIFIER(WEAPON_TYPE WeaponType) = "0x63a1d467d86075da"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_MAX_HEADSHOT_DISTANCE_PLAYER_MODIFIER(WEAPON_TYPE WeaponType, FLOAT newModifier) = "0xa0dcb3d3a2822b98"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC FLOAT GET_MAX_HEADSHOT_DISTANCE_PLAYER_MODIFIER(WEAPON_TYPE WeaponType) = "0xd7179c1ce2a3773a"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE PROC SET_HEADSHOT_DAMAGE_MODIFIER_PLAYER_MODIFIER(WEAPON_TYPE WeaponType, FLOAT newModifier) = "0x371fdb87c52a3699"

//INFO:
//PARAM NOTES:
//PURPOSE: 
NATIVE FUNC FLOAT GET_HEADSHOT_DAMAGE_MODIFIER_PLAYER_MODIFIER(WEAPON_TYPE WeaponType) = "0x579d07ce7434c633"


//INFO:
//PARAM NOTES:
//PURPOSE: If a ped's currently equipped weapon is silenced.
NATIVE FUNC BOOL IS_PED_CURRENT_WEAPON_SILENCED(PED_INDEX PedIndex) = "0x807d601fa146717a"

//INFO:
//PARAM NOTES:
//PURPOSE: If a ped's currently equipped weapon has a flash light that is on.
NATIVE FUNC BOOL IS_FLASH_LIGHT_ON(PED_INDEX PedIndex) = "0xed91b91cc1189b30"

//INFO:
//PARAM NOTES: Distance in meters. Use a value <= 0 to restore default.
//PURPOSE: Set the distance at which flashlights are no longer drawn. 
NATIVE FUNC BOOL SET_FLASH_LIGHT_FADE_DISTANCE(FLOAT distance) = "0xf6fa7ffe56554d2a"

//INFO:
//PARAM NOTES: Is the flash light active when aiming
//PURPOSE: Set whether or not the flash light is active when the ped next aims the weapon
NATIVE PROC SET_FLASH_LIGHT_ACTIVE_HISTORY(PED_INDEX PedIndex, BOOL active) = "0x5b71e8e84cae61b5"

//INFO:
//PARAM NOTES:
//PURPOSE: Set a peds weapon animation override, these are set up in weaponanimations.meta
NATIVE PROC SET_WEAPON_ANIMATION_OVERRIDE(PED_INDEX PedIndex, INT WeaponAnimationOverride ) = "0x5f04d63142241e1f"

//INFO:
//PARAM NOTES:
//PURPOSE: Get the weapon damage type
NATIVE FUNC DAMAGE_TYPE GET_WEAPON_DAMAGE_TYPE(WEAPON_TYPE WeaponType) = "0x963bc5e5049966d1"

//INFO:
//PARAM NOTES:
//PURPOSE: Set the eqipped weapon (e.g., minigun) start spinning at full speed (no spin up phase). 
NATIVE PROC SET_EQIPPED_WEAPON_START_SPINNING_AT_FULL_SPEED(PED_INDEX PedIndex) = "0xf976379fb8b92eb4"

//INFO:
//PARAM NOTES:
//PURPOSE: Check if a particular weapon can be used when parachuting
//RETURNS: TRUE it it can be used.
NATIVE FUNC BOOL CAN_USE_WEAPON_ON_PARACHUTE(WEAPON_TYPE weapon) = "0x64cdf8f5c3d31323"

//~>								 Air Defence Commands							<~

//INFO: Creates an air defence sphere at the defined position.
//PARAM NOTES:
//PURPOSE:	Any bullets, projectiles or air vehicles that enter this sphere will be destroyed/exploded. 
//			Weapon is used to trigger a shot/VFX aimed at the sphere intersection position of any bullets/projectiles to look like they're being shot down.
//			If no weapon hash passed in, sphere will not fire at vehicles, and bullets/projectiles will only be deleted.
//			Peds inside the sphere will enter the weapon blocked state when trying to aim.
//			MAX_AIR_DEFENCE_ZONES = 10, speak to Blair Trusler/David Hynd if this needs increasing.
//RETURNS: Zone index.
NATIVE FUNC INT CREATE_AIR_DEFENCE_SPHERE(VECTOR vPosition, FLOAT fRadius, VECTOR vWeaponPosition, WEAPON_TYPE WeaponType = WEAPONTYPE_DLC_AIR_DEFENCE_GUN) = "0x28b8e32d8a6d5208"

//INFO: Creates an air defence angled area at the defined position.
//PARAM NOTES:
//PURPOSE:	Any bullets, projectiles or air vehicles that enter this angled area will be destroyed/exploded. 
//			Weapon is used to trigger a shot/VFX aimed at the area intersection position of any bullets/projectiles to look like they're being shot down.
//			If no weapon hash passed in, angled area will not fire at vehicles, and bullets/projectiles will only be deleted.
//			Peds inside the angled area will enter the weapon blocked state when trying to aim.
//			MAX_AIR_DEFENCE_ZONES = 10, speak to Blair Trusler/David Hynd if this needs increasing.
//RETURNS: Zone index.
NATIVE FUNC INT CREATE_AIR_DEFENCE_ANGLED_AREA(VECTOR VecCoors1, VECTOR VecCoors2, FLOAT AreaWidth, VECTOR vWeaponPosition, WEAPON_TYPE WeaponType = WEAPONTYPE_DLC_AIR_DEFENCE_GUN) = "0xac8961b74e9fb713"

//INFO:
//PARAM NOTES:
//PURPOSE: Removes specified air defence sphere.
//RETURNS: TRUE if sphere is removed
NATIVE FUNC BOOL REMOVE_AIR_DEFENCE_SPHERE(INT iSphereIndex) = "0x22833c17e06dae37"

//INFO:
//PARAM NOTES:
//PURPOSE: Removes any air defence spheres that intersect the specified position.
//RETURNS: TRUE if sphere(s) are removed.
NATIVE FUNC BOOL REMOVE_AIR_DEFENCE_SPHERES_INTERSECTING_POS(VECTOR vPosition) = "0xe1fcbc1d4d8a6885"

//INFO:
//PARAM NOTES:
//PURPOSE: Removes all air defence spheres. 
NATIVE PROC REMOVE_ALL_AIR_DEFENCE_SPHERES() = "0xb4fc64537af766e8"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets player targettable for all active air defence spheres.
NATIVE PROC SET_PLAYER_TARGETTABLE_FOR_ALL_AIR_DEFENCE_SPHERES(INT PlayerIndex, BOOL Targettable) = "0xa7cba54dd809ad23"

//INFO:
//PARAM NOTES:
//PURPOSE: Sets player targettable for specific air defence sphere.
NATIVE PROC SET_PLAYER_TARGETTABLE_FOR_AIR_DEFENCE_SPHERE(INT PlayerIndex, INT SphereIndex, BOOL Targettable) = "0x29827c14db83cc07"

//INFO:
//PARAM NOTES:
//PURPOSE: Resets player targettable flags for all air defence spheres.
NATIVE PROC RESET_PLAYER_TARGETTABLE_FLAGS_FOR_ALL_AIR_DEFENCE_SPHERES() = "0x3512766544034c1a"

//INFO:
//PARAM NOTES:
//PURPOSE: Resets player targettable flags for specific air defence sphere.
NATIVE PROC RESET_PLAYER_TARGETTABLE_FLAGS_FOR_AIR_DEFENCE_SPHERE(INT SphereIndex) = "0xa3535755b04054d0"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if an air defence sphere is detected in the specified zone. Returns the found sphere index by reference.
NATIVE FUNC BOOL IS_AIR_DEFENCE_SPHERE_IN_AREA(VECTOR vPosition, FLOAT fRadius, INT &SphereIndex) = "0xe249916f8fdd6268"

//INFO:
//PARAM NOTES:
//PURPOSE: Fires the specified sphere's weapon at the target position. Explosion VFX will be triggered at the target position.
NATIVE PROC FIRE_AIR_DEFENCE_SPHERE_WEAPON_AT_POSITION(INT SphereIndex, VECTOR vTargetPosition) = "0xc6eda100ecf72aac"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if the specified air defence sphere exists
NATIVE FUNC BOOL DOES_AIR_DEFENCE_SPHERE_EXIST(INT SphereIndex) = "0xe2f5cc9ee3864144"

//INFO:
//PARAM NOTES:
//PURPOSE: Will prevent player from being able to select a specific weapon from weapon wheel if 'bCanSelect' is false, or re-enable it otherwise.
NATIVE PROC SET_CAN_PED_SELECT_INVENTORY_WEAPON(PED_INDEX PedIndex, WEAPON_TYPE WeaponHash, BOOL bCanSelect) = "0x9e40fd8565afbd17"

//INFO:
//PARAM NOTES:
//PURPOSE: Will disable or re-enable selection of all weapons in the inventory
NATIVE PROC SET_CAN_PED_SELECT_ALL_WEAPONS(PED_INDEX PedIndex, BOOL bCanSelect) = "0x2155139b0979d9f6"

//INFO:
//PARAM NOTES:
//PURPOSE: Returns true if this weapon is considered non-lethal
NATIVE FUNC BOOL GET_WEAPON_HAS_NON_LETHAL_TAG(WEAPON_TYPE weapon) = "0x1a6484d80213bf9a"
