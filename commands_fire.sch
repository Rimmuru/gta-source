USING "types.sch"
USING "model_enums.sch"

ENUM EXPLOSION_TAG
	EXP_TAG_DONTCARE = -1,
	EXP_TAG_GRENADE,
	EXP_TAG_GRENADELAUNCHER,
	EXP_TAG_STICKYBOMB,
	EXP_TAG_MOLOTOV,
	EXP_TAG_ROCKET,
	EXP_TAG_TANKSHELL,
	EXP_TAG_HI_OCTANE,
	EXP_TAG_CAR,
	EXP_TAG_PLANE,
	EXP_TAG_PETROL_PUMP,
	EXP_TAG_BIKE,
	EXP_TAG_DIR_STEAM,
	EXP_TAG_DIR_FLAME,
	EXP_TAG_DIR_WATER_HYDRANT,
	EXP_TAG_DIR_GAS_CANISTER,
	EXP_TAG_BOAT,
	EXP_TAG_SHIP_DESTROY,
	EXP_TAG_TRUCK,
	EXP_TAG_BULLET,
	EXP_TAG_SMOKE_GRENADE_LAUNCHER,
	EXP_TAG_SMOKE_GRENADE,
	EXP_TAG_BZGAS,
	EXP_TAG_FLARE,
	EXP_TAG_GAS_CANISTER,
	EXP_TAG_EXTINGUISHER,
	EXP_TAG_PROGRAMMABLEAR,
	EXP_TAG_TRAIN,
	EXP_TAG_BARREL,
	EXP_TAG_PROPANE,
	EXP_TAG_BLIMP,
	EXP_TAG_DIR_FLAME_EXPLODE,
	EXP_TAG_TANKER,
	EXP_TAG_PLANE_ROCKET,
	EXP_TAG_VEHICLE_BULLET,
	EXP_TAG_GAS_TANK,
	EXP_TAG_BIRD_CRAP,
	EXP_TAG_RAILGUN,
	EXP_TAG_BLIMP2,
	EXP_TAG_FIREWORK,
	EXP_TAG_SNOWBALL,
	EXP_TAG_PROXMINE,
	EXP_TAG_VALKYRIE_CANNON,
	EXP_TAG_AIR_DEFENCE,
	EXP_TAG_PIPEBOMB,
	EXP_TAG_VEHICLEMINE,
	EXP_TAG_EXPLOSIVEAMMO,
	EXP_TAG_APCSHELL,
	EXP_TAG_BOMB_CLUSTER,
	EXP_TAG_BOMB_GAS,
	EXP_TAG_BOMB_INCENDIARY,
	EXP_TAG_BOMB_STANDARD,
	EXP_TAG_TORPEDO,
	EXP_TAG_TORPEDO_UNDERWATER,
	EXP_TAG_BOMBUSHKA_CANNON,
	EXP_TAG_BOMB_CLUSTER_SECONDARY,
	EXP_TAG_HUNTER_BARRAGE,
	EXP_TAG_HUNTER_CANNON,
	EXP_TAG_ROGUE_CANNON,
	EXP_TAG_MINE_UNDERWATER,
	EXP_TAG_ORBITAL_CANNON,
	EXP_TAG_BOMB_STANDARD_WIDE,
	EXP_TAG_EXPLOSIVEAMMO_SHOTGUN,
	EXP_TAG_OPPRESSOR2_CANNON,
	EXP_TAG_MORTAR_KINETIC,
	EXP_TAG_VEHICLEMINE_KINETIC,
	EXP_TAG_VEHICLEMINE_EMP,
	EXP_TAG_VEHICLEMINE_SPIKE,
	EXP_TAG_VEHICLEMINE_SLICK,
	EXP_TAG_VEHICLEMINE_TAR,
	EXP_TAG_SCRIPT_DRONE,
	EXP_TAG_RAYGUN,
	EXP_TAG_BURIEDMINE,
	EXP_TAG_SCRIPT_MISSILE,
	EXP_TAG_RCTANK_ROCKET,
	EXP_TAG_BOMB_WATER,
	EXP_TAG_BOMB_WATER_SECONDARY,
	EXP_TAG_MINE_CNCSPIKE,
	EXP_TAG_BZGAS_MK2,
	EXP_TAG_FLASHGRENADE,
	EXP_TAG_STUNGRENADE,
	EXP_TAG_CNC_KINETICRAM,
	EXP_TAG_SCRIPT_MISSILE_LARGE,
	EXP_TAG_SUBMARINE_BIG,
	EXP_TAG_EMPLAUNCHER_EMP
ENDENUM

//~>					Fire commands

//INFO:  These will be ignored by the fire brigade. Only the player can extinguish a script-created fire. A script-created fire must be REMOVE_SCRIPT_FIRE once and only once. 
//PARAM NOTES: X, Y, Z are FLOATs
//							FireID should be declared as a FIRE_INDEX. 
//PURPOSE: Creates a fire at the given coords. More info..
NATIVE FUNC FIRE_INDEX START_SCRIPT_FIRE(VECTOR VecPos, INT GenerationsAllowed, BOOL isPetrolFire = FALSE) = "0x8669ffc323be936c"

//INFO: 
//PARAM NOTES:
//PURPOSE: Removes a script fire, call only once per fire.
NATIVE PROC REMOVE_SCRIPT_FIRE(FIRE_INDEX FireIndex) = "0xd97dcb0ed4ff04f8"

//INFO: The char that the fire is created on must not be flame proof otherwise the game will assert. 
//PARAM NOTES:  FireID must be declared as a FIRE_INDEX 
//PURPOSE:  Creates a fire on this entity. More info..
NATIVE FUNC FIRE_INDEX START_ENTITY_FIRE(ENTITY_INDEX EntityIndex) = "0xa4dff3132a6b8cbe"

//INFO: 
//PARAM NOTES:
//PURPOSE: Stops a script fire on an entity.
NATIVE PROC STOP_ENTITY_FIRE(ENTITY_INDEX EntityIndex) = "0x92767b52c3080045"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if an entity is on fire.
NATIVE FUNC BOOL IS_ENTITY_ON_FIRE(ENTITY_INDEX EntityIndex) = "0xef9410c312f2b117"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the number of non script fires within radius metres of the given coord.
NATIVE FUNC INT GET_NUMBER_OF_FIRES_IN_RANGE(VECTOR VecPos, FLOAT Radius) = "0x3fde5764a07ba515"

//INFO: 
//PARAM NOTES:
//PURPOSE: Scales the flammability of every fire
NATIVE PROC SET_FLAMMABILITY_MULTIPLIER(FLOAT multiplier) = "0x911276e90cdc84c5"

//INFO: 
//PARAM NOTES:
//PURPOSE: Extinguishes fires within the specified radius
NATIVE PROC STOP_FIRE_IN_RANGE( VECTOR VecPos, FLOAT fRadius) = "0x85050cac8798cdd0"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gets the position of the closest fire. Returns false if there are no fires
NATIVE FUNC BOOL GET_CLOSEST_FIRE_POS(VECTOR& VecClosestFirePos, VECTOR VecTestPos) = "0xd0773d0c37d0a612"


//~>					Explosion commands

//INFO: 
//PARAM NOTES: EXPLOSION_TAG is a list of explosion tyrpe
//PURPOSE:  Creates an explosion at the co-ordinates. 
//					Size scale between 0.01 and 1.0. More info..
NATIVE PROC ADD_EXPLOSION(VECTOR VecExplosionPos,  EXPLOSION_TAG ExplosionTag, FLOAT SizeScale = 0.5, BOOL bMakeSound = TRUE, BOOL bNoFx = FALSE, FLOAT CamShakeMultiplier = 1.0, BOOL NoDamage = false) = "0x45b4bdaa12353e7d"

//INFO: 
//PARAM NOTES: EXPLOSION_TAG is a list of explosion tyrpe
//PURPOSE:  Creates an explosion at the co-ordinates owned by a specific ped.  
//					Size scale between 0.01 and 1.0. More info..
NATIVE PROC ADD_OWNED_EXPLOSION(ENTITY_INDEX ExplosionOwner, VECTOR VecExplosionPos,  EXPLOSION_TAG ExplosionTag, FLOAT SizeScale = 0.5, BOOL bMakeSound = TRUE, BOOL bNoFx = FALSE, FLOAT CamShakeMultiplier = 1.0) = "0x5e0a11b95ee2e0c6"


//INFO: 
//PARAM NOTES: EXPLOSION_TAG is a list of explosion tyrpe
//PURPOSE:  Creates an explosion at the co-ordinates. 
//					Size scale between 0.01 and 1.0. More info..
NATIVE PROC ADD_EXPLOSION_WITH_USER_VFX(VECTOR VecExplosionPos,  EXPLOSION_TAG ExplosionTag, INT VfxTagHash, FLOAT SizeScale = 0.5, BOOL bMakeSound = TRUE, BOOL bNoFx = FALSE, FLOAT CamShakeMultiplier = 1.0) = "0x160873c52c1196be"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if an explosion is in a area.
NATIVE FUNC BOOL IS_EXPLOSION_IN_AREA(EXPLOSION_TAG ExplosionTag, VECTOR VecPosMin, VECTOR VecPosMax) = "0x8fe34bf4165f5104"

//INFO: 
//PARAM NOTES:
//PURPOSE: Checks if an explosion is active ( i.e. the delay is 0 ) in a area.
NATIVE FUNC BOOL IS_EXPLOSION_ACTIVE_IN_AREA(EXPLOSION_TAG ExplosionTag, VECTOR VecPosMin, VECTOR VecPosMax) = "0x3791ad930b5f2dba"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Checks if an explosion is in a sphere area.
NATIVE FUNC BOOL IS_EXPLOSION_IN_SPHERE(EXPLOSION_TAG ExplosionTag, VECTOR VecCentrePos, FLOAT Radius) = "0x89d0e0233f6e59a7"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Gets the owner of an explosion in a sphere.
NATIVE FUNC ENTITY_INDEX GET_OWNER_OF_EXPLOSION_IN_SPHERE(EXPLOSION_TAG ExplosionTag, VECTOR VecCentrePos, FLOAT Radius) = "0xc89c451fdf36b99a"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Checks if an explosion is in an angled area.
NATIVE FUNC BOOL IS_EXPLOSION_IN_ANGLED_AREA(EXPLOSION_TAG ExplosionTag, VECTOR VecPos1, VECTOR VecPos2, FLOAT AreaWidth) = "0x44808d06c0ff7d30"

//INFO: 
//PARAM NOTES:
//PURPOSE:  Gets the owner of an explosion in an angled area.
NATIVE FUNC ENTITY_INDEX GET_OWNER_OF_EXPLOSION_IN_ANGLED_AREA(EXPLOSION_TAG ExplosionTag, VECTOR VecPos1, VECTOR VecPos2, FLOAT AreaWidth) = "0xda5270cbba70753a"
