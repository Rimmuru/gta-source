//
//	commands_money.sch
//
//	All script commands related to cash transactions in the game
//
USING "types.sch"

// Struct for Eanr/Spend club house data.
STRUCT SPEND_CLUB_HOUSE
	INT m_property_id = -1
	INT m_property_id_amount = -1
	INT m_mural_type = -1
	INT m_mural_type_amount = -1
	INT m_wall_style = -1
	INT m_wall_style_amount = -1
	INT m_wall_hanging_style = -1
	INT m_wall_hanging_style_amount = -1
	INT m_furniture_style = -1
	INT m_furniture_style_amount = -1
	INT m_emblem = -1
	INT m_emblem_amount = -1
	INT m_gun_locker = -1
	INT m_gun_locker_amount = -1
	INT m_mod_shop = -1
	INT m_mod_shop_amount = -1
	INT m_signage = -1
	INT m_signage_amount = -1
	INT m_font = -1
	INT m_font_amount = -1
ENDSTRUCT

// PURPOSE: Returns TRUE if the local player is considered a HIGH EARNER.
NATIVE FUNC BOOL NETWORK_GET_PLAYER_IS_HIGH_EARNER() = "0xf9dfcdc2378706de"

// Give event
// PURPOSE: Give cash from the local player to another from last job
//          Script calls NETWORK_RECEIVE_PLAYER_JOBSHARE_CASH for players in the same session;
//
NATIVE PROC NETWORK_GIVE_PLAYER_JOBSHARE_CASH(INT amount, GAMER_HANDLE& handle) = "0x333ce33aa1769463"
// Give event
// PURPOSE: Receive cash from another player to local player. Is the consequence of event  NETWORK_GIVE_PLAYER_JOBSHARE_CASH.
NATIVE PROC NETWORK_RECEIVE_PLAYER_JOBSHARE_CASH(INT amount, GAMER_HANDLE& handle) = "0x6d35555e34106688"

// PURPOSE: Returns TRUE if the local player can transfer job cash.
NATIVE FUNC BOOL NETWORK_CAN_SHARE_JOB_CASH( ) = "0x0a5c97315dfc188e"


// Initialize Cash event
// PURPOSE: Initialize cash for the local player.
NATIVE PROC NETWORK_INITIALIZE_CASH(INT walletAmount, INT bankAmount = 0) = "0xdc5f6189b87e2ce4"

// Delete a character slot
// PURPOSE: Call to do a transaction to delete a character slot.
//  character - value for the current character 0 to 4.
NATIVE PROC NETWORK_DELETE_CHARACTER(INT character, BOOL wipeWallet = true, BOOL wipeBank = false) = "0xac1facc8f57409cc"

// PURPOSE: Call ONLY when the players deletes the character ie when he writes "delete".
//  character - value for the current character 0 to 4.
NATIVE PROC NETWORK_MANUAL_DELETE_CHARACTER(INT character) = "0x28ea9998417e82ab"

// Clear WALLET for that character.
// PURPOSE: Only call this during a creation of a new character
//  character - value for the current character 0 to 4.
NATIVE PROC NETWORK_CLEAR_CHARACTER_WALLET(INT character) = "0x403200d902b21e67"

//
// Refund event
//
// PURPOSE: Call to refund player cash.
// PARAMS: 
//          type - what is the refund for.
//          reason - why the cash is being refunded.
NATIVE PROC NETWORK_REFUND_CASH(INT amount, TEXT_LABEL_15& type, TEXT_LABEL_31& reason, BOOL toBank) = "0xe35a17754e4a9bbb"


//
// Deduct event
//
// PURPOSE: Call to deduct player cash.
// PARAMS: 
//          type - what is the deduct for.
//          reason - why the cash is being deducted.
NATIVE PROC NETWORK_DEDUCT_CASH(INT amount, TEXT_LABEL_15& type, TEXT_LABEL_15& reason, BOOL toBank = false, BOOL fromBankAndWallet = false, BOOL fromWalletAndBank = false) = "0x9a114d9cad104da4"

//
// PURPOSE: Check if Player can BET.
NATIVE FUNC BOOL NETWORK_CAN_BET( INT amount ) = "0xf00c090e006ccd0c"
NATIVE FUNC BOOL NETWORK_MONEY_CAN_BET( INT amount, BOOL bankOnly, BOOL bankAndWallet ) = "0x53c919139434bba9"

//
// PURPOSE: New casino gambling natives.

// casinogame must be != 0 - or it will return false. This checks evc availability.
NATIVE FUNC BOOL NETWORK_CASINO_CAN_BET( INT casinogame ) = "0x910c57e77efcf8cd"

// This checks pvc availability -- all casinogame are expected to have the same PVC setup.
NATIVE FUNC BOOL NETWORK_CASINO_CAN_BET_PVC( ) = "0x014e83a517684e5e"

// This checks the amount -- all casinogame are expected to have the same PVC setup.
NATIVE FUNC BOOL NETWORK_CASINO_CAN_BET_AMOUNT( INT amount ) = "0x19b3ed84baaba783"

// Maybe remove cash - add chips. can be called with amount 0. chips will be changed on consoles and value must > 0.
NATIVE FUNC BOOL  NETWORK_CASINO_BUY_CHIPS( INT amount, INT chips ) = "0xd3ffcbee9841c8f1"
NATIVE FUNC BOOL  NETWORK_CASINO_CAN_BUY_CHIPS_PVC(  ) = "0x5d4af7e88039c9fa"

// Maybe add cash - remove chips. can be called with amount 0. chips will be changed on consoles and value must > 0.
NATIVE FUNC BOOL NETWORK_CASINO_SELL_CHIPS( INT amount, INT chips ) = "0xf746375ef933064e"

//
// PURPOSE: Check if Player can buy lettery tickets.
NATIVE FUNC BOOL NETWORK_CAN_BUY_LOTTERY_TICKET( INT amount ) = "0x3cf9812c23fd805f"

//
// PURPOSE: Call to block cash transactions until shop save is called when the player is outside of the shop.
NATIVE PROC NETWORK_DEFER_CASH_TRANSACTIONS_UNTIL_SHOP_SAVE( ) = "0x879902101458dbad"


ENUM PAYMENT_REFUSED_REASON
	PRR_UNKNOWN,
	PRR_INVALID_AMOUNT,		//Amount is negative or 0
	PRR_NOT_ENOUGH_CASH,    //Not enough Cash in the Wallet
	PRR_NOT_ENOUGH_EVC,		//Not enough Earn Cash
	PRR_INVALID_BOOSID		// No boss Id set
ENDENUM

NATIVE FUNC BOOL CAN_PAY_AMOUNT_TO_BOSS(INT bossId1, INT bossId2, INT amount, PAYMENT_REFUSED_REASON& reason) = "0x2ea806c1e6b8766c"

//
// Earn events
//

// PURPOSE: Player earned cash from a pickup.
NATIVE PROC NETWORK_EARN_FROM_PICKUP(INT amount) = "0x112ad397202d855e"
NATIVE PROC NETWORK_EARN_FROM_CASHING_OUT(INT amount) = "0x230d7d7500f53c4f"

// PURPOSE: Player earned cash from a Gang Attack pickup.
NATIVE PROC NETWORK_EARN_FROM_GANGATTACK_PICKUP(INT amount) = "0xa8059341a93fe044"

NATIVE PROC NETWORK_EARN_ASSASSINATE_TARGET_KILLED(INT amount) = "0x992fcbe7b557e5af"

// PURPOSE: Player earned cash from Rob Armored cars.
NATIVE PROC NETWORK_EARN_FROM_ROB_ARMORED_CARS(INT amount) = "0xf4736694a1d9ead4"

// PURPOSE: Player earned cash from Random crate drops have $$$.
NATIVE PROC NETWORK_EARN_FROM_CRATE_DROP(INT amount) = "0x6a774369e0f40dea"

// PURPOSE: Player earned cash from betting.
NATIVE PROC NETWORK_EARN_FROM_BETTING(INT amount, STRING matchId) = "0xa22b9d6b2d46cc12"

// PURPOSE: Player earned cash from Earning money from jobs.
NATIVE PROC NETWORK_EARN_FROM_JOB(INT amount, STRING matchId) = "0x65a61c657aa4707e"
NATIVE PROC NETWORK_EARN_FROM_JOBX2(INT amount, STRING matchId) = "0xaace66cc21ebd075"
NATIVE PROC NETWORK_EARN_FROM_BEND_JOB(INT amount, STRING matchId) = "0x05cc9e05474790a7"
NATIVE PROC NETWORK_EARN_FROM_JOB_BONUS(INT amount, STRING matchId, STRING challenge) = "0x08ed30b3b6e5fd5c"
NATIVE PROC NETWORK_EARN_FROM_PREMIUM_JOB(INT amount, STRING matchId) = "0xa34683325f050124"
NATIVE PROC NETWORK_EARN_FROM_CRIMINAL_MASTERMIND(INT amount, STRING matchId, STRING challenge) = "0xf7983ac1b8265c33"
NATIVE PROC NETWORK_EARN_HEIST_AWARD(INT amount, STRING matchId, STRING challenge) = "0x1225e74855825b89"
NATIVE PROC NETWORK_EARN_FIRST_TIME_BONUS(INT amount, STRING matchId, STRING challenge) = "0x7d9ebe60742172c6"

// PURPOSE: Player earned cash from Earning money from winning a challenge.
NATIVE PROC NETWORK_EARN_FROM_CHALLENGE_WIN(INT amount, STRING playlistId, BOOL headToHead) = "0x7981f6cdfb2ac34f"

// PURPOSE: Player earned cash from Bounty rewards.
// PARAMS: 
//          hGamerPlaced - Person who placed bounty
//          hGamerPlaced - Target of the Bounty
//			flags: 1 - Killed target
//			       2 - Survived bounty (player receives the bounty amount if they survive for the time limit)
//			       3 - Refund (the player placing a bounty receives a refund if target leaves)
NATIVE PROC NETWORK_EARN_FROM_BOUNTY(INT amount, GAMER_HANDLE& hGamerPlaced, GAMER_HANDLE& hGamerTarget, INT flags) = "0xe365ad8c4e7fc95a"

// PURPOSE: Player earned cash from Import/export.
NATIVE PROC NETWORK_EARN_FROM_IMPORT_EXPORT(INT amount, MODEL_NAMES modelHashKey) = "0xdd82843e7135b9c4"

// PURPOSE: Player earned cash from Holdups.
NATIVE PROC NETWORK_EARN_FROM_HOLDUPS(INT amount) = "0xab0692e771961c3e"

// PURPOSE: Player earned cash from Property.
NATIVE PROC NETWORK_EARN_FROM_PROPERTY(INT amount, INT propertyType) = "0xe569a2bf164237e9"

// PURPOSE: Player earned cash from completing Daily Objectives.
NATIVE PROC NETWORK_EARN_FROM_DAILY_OBJECTIVES(INT amount, STRING description, INT objective) = "0x7e16544cdc17951c"

#IF IS_DEBUG_BUILD
// PURPOSE: Player earned cash from debug - press F6.
NATIVE PROC NETWORK_EARN_FROM_DEBUG(INT amount, BOOL toBank = FALSE) = "0xee943bc0ba675953"
#ENDIF

// PURPOSE: Player earned cash from killing an NPC target.
NATIVE PROC NETWORK_EARN_FROM_AI_TARGET_KILL(INT amount, int pedhash) = "0x4fdcf5723ba47465"

// PURPOSE: Award of cash everytime player isnt in Bad Sport / Non Cheater pool for 5 hours (real time).
NATIVE PROC NETWORK_EARN_FROM_NOT_BADSPORT(INT amount) = "0xd61770d81b66950a"

// PURPOSE: Earn money from Rockstar.
NATIVE PROC NETWORK_EARN_FROM_ROCKSTAR(INT amount) = "0xc3f2e167bd70781b"

// PURPOSE: Player earned cash from a vehicle sell.
ENUM SELLING_VEHICLE_TYPE
	SVT_EARN_FROM_VEHICLE = 0,
	SVT_EARN_FROM_PERSONAL_NORMAL_VEHICLE = 1,
	SVT_EARN_FROM_PERSONAL_HIGHEND_VEHICLE = 2,
	SVT_EARN_FROM_PERSONAL_WEAPON_VEHICLE = 3,
	SVT_EARN_FROM_PERSONAL_AIRCRAFT_VEHICLE = 4,
	SVT_EARN_FROM_H2_WEAPONIZED_VEHICLE = 5,
	SVT_EARN_FROM_BATTLES_WEAPONIZED_VEHICLE = 6
ENDENUM
NATIVE PROC NETWORK_EARN_FROM_VEHICLE(INT amount, INT itemhash, INT oldLevel = 0, INT newLevel = 0, BOOL isOffender1=FALSE, BOOL isOffender2=FALSE, INT oldThresholdLevel = 0, INT newThresholdLevel = 0) = "0x1ffc73fd03bd46b4"
NATIVE PROC NETWORK_EARN_FROM_PERSONAL_VEHICLE(INT amount, INT itemhash, INT oldLevel = 0, INT newLevel = 0, BOOL isOffender1=FALSE, BOOL isOffender2=FALSE, SELLING_VEHICLE_TYPE vehicleType = SVT_EARN_FROM_PERSONAL_NORMAL_VEHICLE, INT oldThresholdLevel = 0, INT newThresholdLevel = 0) = "0x1a9ec8bfea238a20"

// PURPOSE: Player earned cash from ambient job, job specific data.
STRUCT AMBIENT_JOB_DATA
	INT m_v1
	INT m_v2
	INT m_v3
	INT m_v4
ENDSTRUCT
// PURPOSE: Player earned cash from ambient job.
NATIVE PROC NETWORK_EARN_FROM_AMBIENT_JOB(INT amount, STRING jobdescription, AMBIENT_JOB_DATA& data) = "0xc1f6879b97d260f3"

// PURPOSE: Player earned cash from a Goon
NATIVE PROC NETWORK_EARN_GOON(INT bossId1, INT bossId2, INT amount) = "0x3243e08305457c6d"

// PURPOSE: Player earned cash from the Boss
NATIVE PROC NETWORK_EARN_BOSS(INT bossId1, INT bossId2, INT amount) = "0xffc480702d8e4846"

// PURPOSE: Player earned cash from the Agency.
NATIVE PROC NETWORK_EARN_AGENCY(INT bossId1, INT bossId2, INT amount, BOOL notInAGang) = "0x2657fe217212334b"

// PURPOSE: Player earned cash from trading a Warehouse.
NATIVE PROC NETWORK_EARN_FROM_WAREHOUSE(INT amount, INT namehash) = "0xb07e86a8889a545a"

// PURPOSE: Player earned cash from contraband.
NATIVE PROC NETWORK_EARN_FROM_CONTRABAND(INT amount, INT quantity) = "0xe8bb3ad37b7ca086"

// PURPOSE: Player earned cash from destroying contraband.
NATIVE PROC NETWORK_EARN_FROM_DESTROYING_CONTRABAND(INT amount) = "0x1557f4ffedf15230"

// PURPOSE: Called when we buy a club house.
NATIVE PROC NETWORK_EARN_PURCHASE_CLUB_HOUSE(INT amount, SPEND_CLUB_HOUSE& data) = "0x057b2c72e8615612"

// PURPOSE: Called for selling goods from the new business properties..
NATIVE PROC NETWORK_EARN_FROM_BUSINESS_PRODUCT(INT amount, INT businessID, INT businessType, INT quantity) = "0xcc091d3a89af23c8"

// PURPOSE: to reward the player for completing the mission....
NATIVE PROC NETWORK_EARN_FROM_VEHICLE_EXPORT(INT amount, INT bossID1, INT bossID2) = "0x7176349f942a0cfa"

// PURPOSE: to reward the player for completing a Smuggler work
NATIVE PROC NETWORK_EARN_FROM_SMUGGLER_WORK(INT amount, INT quantity, INT highDemandBonus, INT additionalSaleBonus, INT contrabandType) = "0xc530a5e539148d87"

// PURPOSE: to reward the player for completing a Smuggler work
NATIVE PROC NETWORK_EARN_FROM_HANGAR_TRADE(INT amount, INT propertyHash) = "0x7479bf52005e47fe"

// PURPOSE: Reward for 50 Headshots with RDR Weapon 
NATIVE PROC NETWORK_EARN_RDR_BONUS(INT amount, INT weapon = 0) = "0xc4d51fbbc4414e41"

// PURPOSE: Reward for goon wage payments
NATIVE PROC NETWORK_EARN_WAGE_PAYMENT(INT amount, INT missionId = 0) = "0x771e4ab5c79c58e6"

// PURPOSE: Reward for bonus wage payments
NATIVE PROC NETWORK_EARN_WAGE_PAYMENT_BONUS(INT amount) = "0xadcd06a46e4698db"

// PURPOSE: Reward for smuggler gang members
NATIVE PROC NETWORK_EARN_SMUGGLER_AGENCY(INT bossId1, INT bossId2, INT amount, BOOL notInAGang) = "0xe811878e2db4b386"

STRUCT SPEND_HANGAR
	INT m_location = -1
	INT m_location_amount = -1
	INT m_flooring = -1
	INT m_flooring_amount = -1
	INT m_furnitures = -1
	INT m_furnitures_amount = -1
	INT m_workshop = -1
	INT m_workshop_amount = -1
	INT m_style = -1
	INT m_style_amount = -1
	INT m_lighting = -1
	INT m_lighting_amount = -1
	INT m_livingQuarter = -1
	INT m_livingQuarter_amount = -1
ENDSTRUCT


// PURPOSE: to reward the player for purchasing a hangar
NATIVE PROC NETWORK_SPENT_PURCHASE_HANGAR(INT amount, SPEND_HANGAR& data, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x259105f0dabae149"

// PURPOSE: to reward the player for upgrading a hangar
NATIVE PROC NETWORK_SPENT_UPGRADE_HANGAR(INT amount, SPEND_HANGAR& data, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xc004d0f8042fb572"

// PURPOSE: Pay money to cover hangar utility charges
NATIVE PROC NETWORK_SPENT_HANGAR_UTILITY_CHARGES(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x270369ac6681c174"

// PURPOSE: Pay money to cover hangar utility charges
NATIVE PROC NETWORK_SPENT_HANGAR_STAFF_CHARGES(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xcd5f7ca42d8bdcb7"

// PURPOSE: Earn money
NATIVE PROC NETWORK_EARN_BOUNTY_HUNTER_REWARD(INT amount) = "0xd07f11770f2e6012"

// PURPOSE: Earn money
NATIVE PROC NETWORK_EARN_FROM_BUSINESS_BATTLE(INT amount) = "0x60ebb87a5c4cb708"

// PURPOSE: Earn money
NATIVE PROC NETWORK_EARN_FROM_BUSINESS_HUB_SELL(INT amount, INT nightclubID,  INT quantitySold) = "0x83148714b0cea446"

// PURPOSE: Earn money
NATIVE PROC NETWORK_EARN_FROM_CLUB_MANAGEMENT_PARTICIPATION(INT amount, INT missionId) = "0xa94478640dca926e"

// PURPOSE: Earn money
NATIVE PROC NETWORK_EARN_FROM_FMBB_PHONECALL_MISSION(INT amount) = "0xd2f8a068d640d1ac"

// PURPOSE: Earn money
NATIVE PROC NETWORK_EARN_FROM_FMBB_BOSS_WORK(INT amount) = "0xc1dbaeaa7b7b2570"

// PURPOSE: Earn money
NATIVE PROC NETWORK_EARN_FMBB_WAGE_BONUS(INT amount) = "0x283d44f6dc1e915b"

//
// Spend events
//

ENUM SPEND_CATEGORIES
	MONEY_SPENT_WEAPON_ARMOR     = HASH("MONEY_SPENT_WEAPON_ARMOR"),
	MONEY_SPENT_VEH_MAINTENANCE  = HASH("MONEY_SPENT_VEH_MAINTENANCE"),
	MONEY_SPENT_CONTACT_SERVICE  = HASH("MONEY_SPENT_CONTACT_SERVICE"),
	MONEY_SPENT_STYLE_ENT        = HASH("MONEY_SPENT_STYLE_ENT"),
	MONEY_SPENT_PROPERTY_UTIL    = HASH("MONEY_SPENT_PROPERTY_UTIL"),
	MONEY_SPENT_JOB_ACTIVITY     = HASH("MONEY_SPENT_JOB_ACTIVITY"),
	MONEY_SPENT_BETTING          = HASH("MONEY_SPENT_BETTING"),
	MONEY_SPENT_HEALTHCARE       = HASH("MONEY_SPENT_HEALTHCARE"),
	MONEY_SPENT_FROM_DEBUG       = HASH("MONEY_SPENT_FROM_DEBUG"),
	MONEY_SPENT_DROPPED_STOLEN   = HASH("MONEY_SPENT_DROPPED_STOLEN"),
	MONEY_SPENT_HOLDUPS          = HASH("MONEY_SPENT_HOLDUPS"),
	MONEY_SPENT_PASSIVEMODE      = HASH("MONEY_SPENT_PASSIVEMODE"),
	MONEY_SPENT_BANKINTEREST     = HASH("MONEY_SPENT_BANKINTEREST"),
	MONEY_SPENT_ROCKSTAR_AWARD   = HASH("MONEY_SPENT_ROCKSTAR_AWARD"),
	MONEY_SPENT_NOCOPS           = HASH("MONEY_SPENT_NOCOPS"),
	MONEY_SPEND_DEDUCT           = HASH("MONEY_SPEND_DEDUCT"),
	MONEY_SPEND_BOSS_GOON        = HASH("MONEY_SPEND_BOSS_GOON")
ENDENUM

ENUM EARN_CATEGORIES
	MONEY_EARN_JOBS            = HASH("MONEY_EARN_JOBS"),
	MONEY_EARN_SELLING_VEH     = HASH("MONEY_EARN_SELLING_VEH"),
	MONEY_EARN_BETTING         = HASH("MONEY_EARN_BETTING"),
	MONEY_EARN_GOOD_SPORT      = HASH("MONEY_EARN_GOOD_SPORT"),
	MONEY_EARN_PICKED_UP       = HASH("MONEY_EARN_PICKED_UP"),
	MONEY_EARN_SHARED          = HASH("MONEY_EARN_SHARED"),
	MONEY_EARN_JOBSHARED       = HASH("MONEY_EARN_JOBSHARED"),
	MONEY_EARN_ROCKSTAR_AWARD  = HASH("MONEY_EARN_ROCKSTAR_AWARD"),
	MONEY_EARN_REFUND          = HASH("MONEY_EARN_REFUND"),
	MONEY_EARN_BANK_INT		   = HASH("MONEY_EARN_BANK_INT"),
	MONEY_EARN_BANK_INTEREST   = HASH("MONEY_EARN_BANK_INTEREST"),
	MONEY_EARN_FROM_JOB_BONUS  = HASH("MONEY_EARN_FROM_JOB_BONUS"),
	MONEY_EARN_FROM_HEIST_JOB  = HASH("MONEY_EARN_FROM_HEIST_JOB")
ENDENUM

ENUM PURCHASE_TYPE
	 PURCHASE_WEAPONS
	,PURCHASE_WEAPONMODS
	,PURCHASE_WEAPONAMMO
	,PURCHASE_ARMOR
	,PURCHASE_BARBERS
	,PURCHASE_CLOTHES
	,PURCHASE_TATTOOS
	,PURCHASE_VEHICLES
	,PURCHASE_CARMODS
	,PURCHASE_CARINSURANCE
	,PURCHASE_CARDROPOFF
	,PURCHASE_CARREPAIR
	,PURCHASE_FOOD
	,PURCHASE_MASKS
	,PURCHASE_CARIMPOUND
	,PURCHASE_CARPAINT
	,PURCHASE_CARWHEELMODS
	,PURCHASE_FIREWORKS
	,PURCHASE_ENDMISSIONCARUP
	,PURCHASE_CASHEISTMISVEHUP
ENDENUM


// PURPOSE: Call this command to make sure that the call to spend cash will succeedd.
// PARAMS: 
//    amount - cash amount must be > 0. 
//    fromBank - If TRUE take the money from the bank.
//    fromBankAndWallet - If TRUE take the money from both Bank and Wallet, removing first from the Bank.
//    fromWalletAndBank - If TRUE take the money from both Wallet and Bank, removing first from the Wallet.
//    character - if the character is -1 it will use the current selected character.
NATIVE FUNC BOOL NETWORK_CAN_SPEND_MONEY(INT amount, BOOL fromBank, BOOL fromBankAndWallet, BOOL fromWalletAndBank, INT character = -1, BOOL evcOnly = FALSE) = "0x616226219f841621"
NATIVE FUNC BOOL NETWORK_CAN_SPEND_MONEY2(INT amount, BOOL fromBank, BOOL fromBankAndWallet, BOOL fromWalletAndBank, INT& diff, INT character = -1, BOOL evcOnly = FALSE) = "0x83cd7741e215b226"

// PURPOSE: Player bought something in a shop
//    extra1 - client view of the current inventory. e.g. if buying bullets include how many 
//                       bullets the client thinks he owns.
//   itemIdentifier - extra item identifier, like PEGASUS.
NATIVE PROC NETWORK_BUY_ITEM(INT amount, INT itemhash, PURCHASE_TYPE type, INT extra1 = 1, BOOL fromBank = false, STRING itemIdentifier = NULL, INT shopNameHash = 0, INT extraItemHash = 0, INT colorHash = 0, BOOL fromBankAndWallet = false) = "0x96b0ef45fcc7b79f"

// PURPOSE: Player spent in taxis.
NATIVE PROC NETWORK_SPENT_TAXI(INT amount, BOOL fromBank = false, BOOL fromWalletAndBank = false, int npcProvider = 0) = "0x633310c9b4b8972c"

// PURPOSE: Player paid for AI employee wages.
NATIVE PROC NETWORK_PAY_EMPLOYEE_WAGE(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x4f34776bdb8e6055"

// PURPOSE: Entry Fee for competitive matches
NATIVE PROC NETWORK_PAY_MATCH_ENTRY_FEE(INT amount, STRING uniqueMatchId, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x5ba45508319548c9"

// PURPOSE: Money spent betting.
NATIVE PROC NETWORK_SPENT_BETTING(INT amount, INT bettype, STRING uniqueMatchId, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xb52f40295cb9cef3"

NATIVE PROC NETWORK_SPENT_WAGER(INT bossId1, INT bossId2, INT amount) = "0x50742ed3b0caabbb"

// PURPOSE: Differentiates between the following types of expenditures: Lap dance, Watching the pole and Drinking at the bar.
ENUM eStripClubExpenditureType
	LAP_DANCE
	,WATCHING_THE_POLE
	,DRINKING_AT_THE_BAR
ENDENUM
// PURPOSE: Player spent in stripclub.
NATIVE PROC NETWORK_SPENT_IN_STRIPCLUB(INT amount, BOOL fromBank = FALSE, eStripClubExpenditureType expenditureType = LAP_DANCE, BOOL fromBankAndWallet = false) = "0xccfb2d3453e63dd0"

// PURPOSE: Player spent in Healthcare (after dying).
NATIVE PROC NETWORK_BUY_HEALTHCARE(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xc5284ef993f1f89b"

// PURPOSE: Player spent in Airstrikes (cost).
NATIVE PROC NETWORK_BUY_AIRSTRIKE(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0x70e4920577d2af8f"

// PURPOSE: Player spent in Back up gangs.
NATIVE PROC NETWORK_BUY_BACKUP_GANG(INT amount, INT gangType, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0xdb05d03d2a4414a3"

// PURPOSE: Player spent in heli strike.
NATIVE PROC NETWORK_BUY_HELI_STRIKE(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0x2d153944371c57b5"

// PURPOSE: Player spent in ammo drop
NATIVE PROC NETWORK_SPENT_AMMO_DROP(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0xd4757da5ca4abebd"

// PURPOSE: Player spent in bounty.
NATIVE PROC NETWORK_BUY_BOUNTY(INT amount, PLAYER_INDEX playerIndex, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0x2a2e293c460e3bc9"

// PURPOSE: Player spent in Buying property 
NATIVE PROC NETWORK_BUY_PROPERTY(INT amount, INT propertyType, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x5a192000f9019354"

// PURPOSE: Player spent in smokes
NATIVE PROC NETWORK_BUY_SMOKES(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x4e0498aed25a8fd4"

// PURPOSE: Player spent in buying a heli pickup.
NATIVE PROC NETWORK_SPENT_HELI_PICKUP(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0x98d10c65a5ed5819"

// PURPOSE: Player spent in buying a boat pickup.
NATIVE PROC NETWORK_SPENT_BOAT_PICKUP(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0x60baa0f5725cac6e"

// PURPOSE: Player spent in bull shark - Players can request for a box of BULL SHARK TESTOSTERONE from Brucie.
NATIVE PROC NETWORK_SPENT_BULL_SHARK(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0xb4ce8cbf609f48c9"

#IF IS_DEBUG_BUILD
// PURPOSE: Player spent cash from debug - press F6.
NATIVE PROC NETWORK_SPENT_FROM_DEBUG(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x98e0e142e7951061"
#ENDIF

// PURPOSE: Player spent in cash dropped by players death.
NATIVE PROC NETWORK_SPENT_CASH_DROP(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xa789ebe5183e8fe5"

// PURPOSE: Player spent money from Hiring a Mugger.
NATIVE PROC NETWORK_SPENT_HIRE_MUGGER(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0x20e0724aa92474e3"

// PURPOSE: Player spent money from being robbed by Mugger.
NATIVE PROC NETWORK_SPENT_ROBBED_BY_MUGGER(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0xfd06e55daf765b32"

// PURPOSE: Player spent money from hiring mercenary.
NATIVE PROC NETWORK_SPENT_HIRE_MERCENARY(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0xb370da8d10149a81"

// PURPOSE: Player spent money from buying wanted level for another player.
NATIVE PROC NETWORK_SPENT_BUY_WANTEDLEVEL(INT amount, GAMER_HANDLE& handle, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0x2e2b0a3651e8dcc2"

// PURPOSE: Player spent money to not appear on any other player's radar.
NATIVE PROC NETWORK_SPENT_BUY_OFFTHERADAR(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0xddb99faa2da252af"

// PURPOSE: Player spent money to reveal all other players on the radar.
NATIVE PROC NETWORK_SPENT_BUY_REVEAL_PLAYERS(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0xa68e39f91108707e"

// PURPOSE: Player spent money to washa car. id vehicle model hash. location the car wash location 1 for Strawberry, 2 for Little Seoul.
NATIVE PROC NETWORK_SPENT_CARWASH(INT amount, INT modelHash, INT location, BOOL fromBank = false, BOOL fromWalletandBank = false) = "0x998bb74c3a957b00"

// PURPOSE: Player spent money in cinema. cinemalocation - unique cinema identifier (hash of the unique name for instance).
NATIVE PROC NETWORK_SPENT_CINEMA(INT amount, INT cinemalocation, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x2a392968944d2f3e"

// PURPOSE: Player spent money in telescope.
NATIVE PROC NETWORK_SPENT_TELESCOPE(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xab191a4200d76617"

// PURPOSE: Player spent money in holdups.
NATIVE PROC NETWORK_SPENT_HOLDUPS(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xa6fffa63c0d556ce"

// PURPOSE: Player spent money in passive mode.
NATIVE PROC NETWORK_SPENT_BUY_PASSIVE_MODE(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0xdc639be2424a7a98"

// PURPOSE: Player spent money in passive mode.
NATIVE PROC NETWORK_SPENT_BANK_INTEREST(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x8c2c12d337d64f6d"

// PURPOSE: Player spent money in prostitutes.
NATIVE PROC NETWORK_SPENT_PROSTITUTES(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xa03beb503d736664"

// PURPOSE: Player spent money in bailing from being arrested.
NATIVE PROC NETWORK_SPENT_ARREST_BAIL(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xf07afb3413c8e424"

// PURPOSE: Player spent money in insurance claim. ONLY Set a valid Gamer handle if we are paying 
//            insurance for a remote player vehicle, ie, not our vehicle.
NATIVE PROC NETWORK_SPENT_PAY_VEHICLE_INSURANCE_PREMIUM(INT amount, INT vehiclehash, GAMER_HANDLE& handle, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xea92f2d421adba50"

// PURPOSE: Player spent money in a call. handle is for the remote player.
NATIVE PROC NETWORK_SPENT_CALL_PLAYER(INT amount, GAMER_HANDLE& handle, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x95a42c7d8591e15a"

// PURPOSE: Player was killed in a detahmatch and had a bounty.
NATIVE PROC NETWORK_SPENT_BOUNTY(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xc678817aa4802ff6"

// PURPOSE: Player was killed in a detahmatch and had a bounty.
NATIVE PROC NETWORK_SPENT_FROM_ROCKSTAR(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xf922fbc9833e0af3"

//PURPOSE: Deduct the given amount as earned vc (EVC) from the bank and all character wallets.
NATIVE FUNC INT NETWORK_SPEND_EARNED_FROM_BANK_AND_WALLETS(INT amount) = "0xabe1e3ddb9c6dcc7"

//PURPOSE: Process cash gifting, return true int result if there was any cash process false otherwise.
//RETURN: String with the amount credited or deducted.
NATIVE FUNC STRING PROCESS_CASH_GIFT( INT& result, INT& valueIsCredited, TEXT_LABEL_63& outLabel) = "0x3d3f83924782979f"

//PURPOSE: Process chip gifting, return true int result if there was any chips processed false otherwise.
//RETURN: String with the amount credited or deducted.
//NATIVE FUNC STRING PROCESS_CHIP_GIFT( INT& result, INT& valueIsCredited, TEXT_LABEL_63& outLabel)

//PURPOSE: Only returns TRUE once then it resets the flag. This should be checked before or after PROCESS_CASH_GIFT. 
//RETURN: Returns TRUE if the game had to fix the player Bank and Wallet.
NATIVE FUNC BOOL NETWORK_ECONOMY_HAS_FIXED_CRAZY_NUMBERS( ) = "0x6b6922fad2e70431"

//PURPOSE: Pay for another player healthcare.
NATIVE PROC NETWORK_SPENT_PLAYER_HEALTHCARE(INT amount, PLAYER_INDEX playerIndex, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xd9f1acf1d834ea04"

//PURPOSE: Pay for no cop.
NATIVE PROC NETWORK_SPENT_NO_COPS(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0xb69b75efecea8c8a"

//PURPOSE: Pay for a warehouse employee to "soruce cargo".
NATIVE PROC NETWORK_SPENT_CARGO_SOURCING(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT cost, INT warehouseID, INT warehouseSlot) = "0x948705f6f9c50824"

//PURPOSE: Pay for job request
NATIVE PROC NETWORK_SPENT_REQUEST_JOB(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0x70dd65d169b664fe"

//PURPOSE: Pay for heist request
NATIVE PROC NETWORK_SPENT_REQUEST_HEIST(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0x39746251feabf053"

// PURPOSE: Money spent on lettery tickets.
NATIVE PROC NETWORK_BUY_LOTTERY_TICKET(INT amount, INT numberOfTickets, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x57ac2afb27fdbccf"

// PURPOSE: Money spent on fairground rides.
NATIVE PROC NETWORK_BUY_FAIRGROUND_RIDE(INT amount, INT rideId, BOOL fromBank = false, BOOL fromBankAndWallet = false, int npcProvider = 0) = "0xe48ce8ba3679b268"

// PURPOSE: Pay to skip a job.
NATIVE PROC NETWORK_SPENT_JOB_SKIP(INT amount, STRING uniqueMatchId, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x6ba4aa7a6927fb1a"

// PURPOSE: Pay to become the boss goon.
NATIVE FUNC BOOL NETWORK_SPENT_BOSS_GOON(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x2ccde4679591a98f"

// PURPOSE: Pay money to the Goons
NATIVE PROC NETWORK_SPEND_GOON(INT bossId1, INT bossId2, INT amount) = "0x08da56d3f428bd72"

// PURPOSE: Pay money to the Boss
//  DEPRECATED !
NATIVE PROC NETWORK_SPEND_BOSS(INT bossId1, INT bossId2, INT amount) = "0x2eabae370e609bdd"

// PURPOSE: Pay money to move the Yacht
NATIVE PROC NETWORK_SPENT_MOVE_YACHT(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x3384e99fd932f997"

// PURPOSE: Pay money to move the Submarine
NATIVE PROC NETWORK_SPENT_MOVE_SUBMARINE(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x53235ac39c25ba6f"

// PURPOSE: Pay money to rename your organization
NATIVE PROC NETWORK_SPENT_RENAME_ORGANIZATION(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x06cecbac26997c80"

// PURPOSE: Player spent in Buying a contraband mission
NATIVE PROC NETWORK_BUY_CONTRABAND_MISSION(INT amount, INT warehouseID, INT missionID, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x8c1520bab4821fc9"

// PURPOSE: Player spent to pay for business supplies.
NATIVE PROC NETWORK_SPENT_PAY_BUSINESS_SUPPLIES( INT amount, INT businessID, INT businessType, INT numSegments ) = "0xc9f62b8ae66f3061"

// PURPOSE: Pay money to PA service to order a helicopter
NATIVE PROC NETWORK_SPENT_PA_SERVICE_HELI(INT amount, BOOL anotherMember, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x9e2318e355455f6c"

// PURPOSE: Pay money to PA service to order a vehicle
NATIVE PROC NETWORK_SPENT_PA_SERVICE_VEHICLE(INT amount, INT vehicleHash, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x607f5974d8f99eb5"

// PURPOSE: Pay money to PA service to get a snack
NATIVE PROC NETWORK_SPENT_PA_SERVICE_SNACK(INT amount, INT item, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x17709f31fb6c0f5d"

// PURPOSE: Pay money to PA service to get a dancer
NATIVE PROC NETWORK_SPENT_PA_SERVICE_DANCER(INT amount, INT value, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x0e1fba451087dc4e"

// PURPOSE: Pay money to PA service to get a dancer
NATIVE PROC NETWORK_SPENT_PA_SERVICE_IMPOUND(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xbd990ff45c770bba"

// PURPOSE: Pay money to PA ability to get a Helicopter pickup
NATIVE PROC NETWORK_SPENT_PA_HELI_PICKUP(INT amount, INT vehicleHash, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x610933e83410be0d"

STRUCT SPEND_OFFICE_AND_WAREHOUSE
	INT m_Location
	INT m_LocationAmount = -1
    INT m_Style
    INT m_StyleAmount = -1
    INT m_PaGender
    INT m_PaGenderAmount = -1
    INT m_Signage
    INT m_SignageAmount = -1
    INT m_GunLocker
    INT m_GunLockerAmount = -1
    INT m_Vault
    INT m_VaultAmount = -1
    INT m_PersonalQuarters
    INT m_PersonalQuartersAmount = -1
    INT m_WarehouseSize
    INT m_WarehouseSizeAmount = -1
    INT m_SmallWarehouses = -1
    INT m_MediumWarehouses = -1
    INT m_LargeWarehouses = -1
	INT m_ModShop
	INT m_ModShopAmount = -1
ENDSTRUCT

STRUCT SPEND_BUSINESS_PROPERTY
	INT m_businessID
	INT m_businessType
	INT m_businessUpgradeType
ENDSTRUCT

// PURPOSE: Pay money to buy an executive office
NATIVE PROC NETWORK_SPENT_PURCHASE_OFFICE_PROPERTY(INT amount, SPEND_OFFICE_AND_WAREHOUSE& data, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x84f008bcb6520e57"

// PURPOSE: Pay money to upgrade an executive office
NATIVE PROC NETWORK_SPENT_UPGRADE_OFFICE_PROPERTY(INT amount, SPEND_OFFICE_AND_WAREHOUSE& data, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x8a964690daeea758"

// PURPOSE: Pay money to buy an executive warehouse
NATIVE PROC NETWORK_SPENT_PURCHASE_WAREHOUSE_PROPERTY(INT amount, SPEND_OFFICE_AND_WAREHOUSE& data, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xfc3abc5c02a58459"

// PURPOSE: Pay money to upgrade an executive warehouse
NATIVE PROC NETWORK_SPENT_UPGRADE_WAREHOUSE_PROPERTY(INT amount, SPEND_OFFICE_AND_WAREHOUSE& data, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xfe9e66f0be2c4b9a"


// PURPOSE: Pay money to buy an import export warehouse
NATIVE PROC NETWORK_SPENT_PURCHASE_IMPEXP_WAREHOUSE_PROPERTY(INT amount, SPEND_OFFICE_AND_WAREHOUSE& data, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x20408ddf054340fb"

// PURPOSE: Pay money to upgrade an import export warehouse
NATIVE PROC NETWORK_SPENT_UPGRADE_IMPEXP_WAREHOUSE_PROPERTY(INT amount, SPEND_OFFICE_AND_WAREHOUSE& data, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x44e6a6d4cbe30595"

// PURPOSE: Pay money to trade import export warehouse
NATIVE PROC NETWORK_SPENT_TRADE_IMPEXP_WAREHOUSE_PROPERTY(INT amount, SPEND_BUSINESS_PROPERTY& data, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x7aadb09725ab1abd"

// PURPOSE: Warehouse vehicle ordered
NATIVE PROC NETWORK_SPENT_ORDER_WAREHOUSE_VEHICLE(INT amount, INT vehicleHash, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x22f47f1e15830884"

// PURPOSE: Bodyguard vehicle ordered
NATIVE PROC NETWORK_SPENT_ORDER_BODYGUARD_VEHICLE(INT amount, INT vehicleHash, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xfd7e887e4e1fa6c4"

// PURPOSE: Player spent in juke box.
NATIVE PROC NETWORK_SPENT_JUKEBOX(INT amount, INT playlist, BOOL fromBank = FALSE, BOOL fromBankAndWallet = false) = "0x2c43ad784c2a855e"

// PURPOSE: Called when we buy a club house.
NATIVE PROC NETWORK_SPENT_PURCHASE_CLUB_HOUSE(INT amount, SPEND_CLUB_HOUSE& data, BOOL fromBank = FALSE, BOOL fromBankAndWallet = false) = "0xddc0cb5ac421b2d8"

// PURPOSE: Called when we upgrade a club house.
NATIVE PROC NETWORK_SPENT_UPGRADE_CLUB_HOUSE(INT amount, SPEND_CLUB_HOUSE& data, BOOL fromBank = FALSE, BOOL fromBankAndWallet = false) = "0x1c63650ffab39a8c"

STRUCT SPEND_OFFICE_GARAGE
    INT m_Location		//hash of garage property name
    INT m_LocationAmount = -1
    INT m_Numbering	//id: of the floor numbering
    INT m_NumberingAmount = -1
    INT m_NumberingStyle	//id: of the floor numbering style (0-9)
    INT m_NumberingStyleAmount = -1
    INT m_Lighting		//id: of the lighting style (0-9)
    INT m_LightingAmount = -1
    INT m_Wall		//id: of the interior wall style (0-3)
    INT m_WallAmount = -1
ENDSTRUCT

// PURPOSE: Pay money to buy an office garage.
NATIVE PROC NETWORK_SPENT_PURCHASE_OFFICE_GARAGE(INT amount, SPEND_OFFICE_GARAGE& data, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xf3543dc789639b25"

// PURPOSE: Pay money to upgrade an office garage.
NATIVE PROC NETWORK_SPENT_UPGRADE_OFFICE_GARAGE(INT amount, SPEND_OFFICE_GARAGE& data, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xd596ce20824f2e5a"

// PURPOSE: Pay money to buy business property
NATIVE PROC NETWORK_SPENT_PURCHASE_BUSINESS_PROPERTY(INT amount, SPEND_BUSINESS_PROPERTY& data, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xdd57bffb2920da9b"

// PURPOSE: Pay money to upgrade business property
NATIVE PROC NETWORK_SPENT_UPGRADE_BUSINESS_PROPERTY(INT amount, SPEND_BUSINESS_PROPERTY& data, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xf3851a067fd13a25"

// PURPOSE: Pay money to upgrade business property
NATIVE PROC NETWORK_SPENT_TRADE_BUSINESS_PROPERTY(INT amount, SPEND_BUSINESS_PROPERTY& data, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xfa102669ec9b3d28"

// PURPOSE: Pay money to buy a MC Ability, amount can be 0
NATIVE PROC NETWORK_SPENT_MC_ABILITY(INT amount, INT ability, INT mcRole, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0x0880c1e6befb89f0"

// PURPOSE: Pay money to Change Char Appearance
NATIVE PROC NETWORK_SPENT_CHANGE_APPEARANCE(INT amount, BOOL fromBank = false, BOOL fromBankAndWallet = false) = "0xe623560b7f071fec"

// PURPOSE: command to allow us to charge the player before a vehicle export mission begins.
NATIVE PROC NETWORK_SPENT_VEHICLE_EXPORT_MODS(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT bossID1, INT bossID2, INT buyerID, INT vehicle1, INT vehicle2, INT vehicle3, INT vehicle4) = "0x2728585e17843fd3"

// PURPOSE: command for boss paying for repair of Import Export cars delivered to their Vehicle Warehouse.
NATIVE PROC NETWORK_SPENT_IMPORT_EXPORT_REPAIR(INT amount, BOOL fromBank, BOOL fromBankAndWallet) = "0x8ac1d155da1160af"

STRUCT SPENT_ON_TRUCK
	INT m_vehicle = -1
	INT m_vehicle_amount = -1
	INT m_trailer = -1
	INT m_trailer_amount = -1
	INT m_slot1 = -1
	INT m_slot1_amount = -1
	INT m_slot2 = -1
	INT m_slot2_amount = -1
	INT m_slot3 = -1
	INT m_slot3_amount = -1
	INT m_colorscheme = -1
	INT m_colorscheme_amount = -1
ENDSTRUCT
// PURPOSE: TRUCK
NATIVE PROC NETWORK_SPENT_BUY_TRUCK(INT amount, BOOL fromBank, BOOL fromBankAndWallet, SPENT_ON_TRUCK& data) = "0x398794d288ced547"
NATIVE PROC NETWORK_SPENT_UPGRADE_TRUCK(INT amount, BOOL fromBank, BOOL fromBankAndWallet, SPENT_ON_TRUCK& data) = "0x6d54e5dd7d1a2439"

STRUCT SPENT_ON_BUNKER
	INT m_location = -1
	INT m_location_amount = -1
	INT m_style = -1
	INT m_style_amount = -1
	INT m_personalquarter = -1
	INT m_personalquarter_amount = -1
	INT m_firingrange = -1
	INT m_firingrange_amount = -1
	INT m_gunlocker = -1
	INT m_gunlocker_amount = -1
	INT m_caddy = -1
	INT m_caddy_amount = -1
ENDSTRUCT
// PURPOSE: BUNKER 
NATIVE PROC NETWORK_SPENT_BUY_BUNKER(INT amount, BOOL fromBank, BOOL fromBankAndWallet, SPENT_ON_BUNKER& data) = "0xa2a4c678da20a7ec"
NATIVE PROC NETWORK_SPENT_UPRADE_BUNKER(INT amount, BOOL fromBank, BOOL fromBankAndWallet, SPENT_ON_BUNKER& data) = "0x8834d1f62459679d"
NATIVE PROC NETWORK_EARN_FROM_SELL_BUNKER(INT amount, INT bunkerHash) = "0xa3799a68f501052c"

NATIVE PROC NETWORK_SPENT_BALLISTIC_EQUIPMENT(INT amount, BOOL fromBank, BOOL fromBankAndWallet) = "0xdda3ee5081b3352b"

NATIVE PROC NETWORK_SPEND_GANGOPS_CANNON(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT shootType) = "0x366b0ff831b419a7"
NATIVE PROC NETWORK_SPEND_GANGOPS_SKIP_MISSION(INT mission, INT amount, BOOL fromBank, BOOL fromBankAndWallet) = "0x2b571637c15925d5"
NATIVE PROC NETWORK_SPEND_CASINO_HEIST_SKIP_MISSION(INT mission, INT amount, BOOL fromBank, BOOL fromBankAndWallet) = "0xbcf5acbed9d0b528"

NATIVE PROC NETWORK_EARN_SELL_BASE(INT amount, INT baseHash) = "0x339b184c2c67e101"
NATIVE PROC NETWORK_EARN_TARGET_REFUND(INT amount, INT target) = "0xf989a8eec7230fbe"
NATIVE PROC NETWORK_EARN_GANGOPS_WAGES(INT amount, INT contentid) = "0xd664c6e4c4b6c820"
NATIVE PROC NETWORK_EARN_GANGOPS_WAGES_BONUS(INT amount, INT contentid) = "0x6f1481526b91195f"
NATIVE PROC NETWORK_EARN_DAR_CHALLENGE(INT amount, INT contentid) = "0xa58e89ef9ed914eb"
NATIVE PROC NETWORK_SERVICE_EARN_GANGOPS_RIVAL_DELIVERY(INT amount) = "0x84b486fa79aeb51b"

ENUM GANGOPS_AWARD_TYPE
	GANGOPS_AWARD_MASTERMIND_2
	,GANGOPS_AWARD_MASTERMIND_3
	,GANGOPS_AWARD_MASTERMIND_4
	,GANGOPS_AWARD_LOYALTY_AWARD_2
	,GANGOPS_AWARD_LOYALTY_AWARD_3
	,GANGOPS_AWARD_LOYALTY_AWARD_4
	,GANGOPS_AWARD_FIRST_TIME_XM_BASE
	,GANGOPS_AWARD_FIRST_TIME_XM_SUBMARINE
	,GANGOPS_AWARD_FIRST_TIME_XM_SILO
	,GANGOPS_AWARD_SUPPORTING
	,GANGOPS_AWARD_ORDER
ENDENUM

NATIVE PROC NETWORK_EARN_GANGOPS_AWARD(INT amount, STRING matchId, GANGOPS_AWARD_TYPE challenge) = "0x324ce186024e7207"


ENUM GANGOPS_ELITE_TYPE
	GANGOPS_ELITE_XM_BASE
	,GANGOPS_ELITE_XM_SUBMARINE
	,GANGOPS_ELITE_XM_SILO
ENDENUM

NATIVE PROC NETWORK_EARN_GANGOPS_ELITE(INT amount, STRING matchId, GANGOPS_ELITE_TYPE challenge) = "0x388312fc0babbf1b"


STRUCT SPENT_ON_BASE
	INT m_location = -1
	INT m_location_amount = -1
	INT m_style = -1
	INT m_style_amount = -1
	INT m_graphics = -1
	INT m_graphics_amount = -1
	INT m_orbcannon = -1
	INT m_orbcannon_amount = -1
	INT m_secroom = -1
	INT m_secroom_amount = -1
	INT m_lounge = -1
	INT m_lounge_amount = -1
	INT m_livingquarter = -1
	INT m_livingquarter_amount = -1
	INT m_privacyglass = -1
	INT m_privacyglass_amount = -1
ENDSTRUCT
// PURPOSE: BASE 
NATIVE PROC NETWORK_SPENT_BUY_BASE(INT amount, BOOL fromBank, BOOL fromBankAndWallet, SPENT_ON_BASE& data) = "0x8b8cd926260a4df1"
NATIVE PROC NETWORK_SPENT_UPGRADE_BASE(INT amount, BOOL fromBank, BOOL fromBankAndWallet, SPENT_ON_BASE& data) = "0xa788db38560d8c97"


STRUCT SPENT_ON_TILTROTOR
	INT m_aircraft = -1
	INT m_aircraft_amount = -1
	INT m_interiortint = -1
	INT m_interiortint_amount = -1
	INT m_turret = -1
	INT m_turret_amount = -1
	INT m_weaponworkshop = -1
	INT m_weaponworkshop_amount = -1
	INT m_vehicleworkshop = -1
	INT m_vehicleworkshop_amount = -1
	INT m_countermeasures = -1
	INT m_countermeasures_amount = -1
	INT m_bombs = -1
	INT m_bombs_amount = -1
ENDSTRUCT
// PURPOSE: BASE 
NATIVE PROC NETWORK_SPENT_BUY_TILTROTOR(INT amount, BOOL fromBank, BOOL fromBankAndWallet, SPENT_ON_TILTROTOR& data) = "0x6a03dd233331ef8e"
NATIVE PROC NETWORK_SPENT_UPGRADE_TILTROTOR(INT amount, BOOL fromBank, BOOL fromBankAndWallet, SPENT_ON_TILTROTOR& data) = "0x8f06c7ea77d0810d"

// PURPOSE: Assassins ability
NATIVE PROC NETWORK_SPENT_EMPLOY_ASSASSINS(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT level) = "0xab62af06f39ee7cb"

NATIVE PROC NETWORK_SPEND_GANGOPS_START_STRAND(INT strand, INT amount, BOOL fromBank, BOOL fromBankAndWallet) = "0x76f9f95febf3708a"
NATIVE PROC NETWORK_SPEND_GANGOPS_TRIP_SKIP(INT amount, BOOL fromBank, BOOL fromBankAndWallet) = "0x44b09d298448791c"
NATIVE PROC NETWORK_EARN_GANGOPS_PREP_PARTICIPATION(INT amount) = "0x73338a57ed708319"
NATIVE PROC NETWORK_EARN_GANGOPS_SETUP(INT amount, STRING contentid) = "0x9446d0d780403f07"
NATIVE PROC NETWORK_EARN_GANGOPS_FINALE(INT amount, STRING contentid) = "0x69586c400a6cb406"
NATIVE PROC NETWORK_SPEND_GANGOPS_REPAIR_COST(INT amount, BOOL fromBank, BOOL fromBankAndWallet) = "0xd4abddb11c6dbe35"
NATIVE PROC NETWORK_EARN_DOOMSDAY_FINALE_BONUS(INT amount, INT vehiclemodelid = 0) = "0xa4e011a66f70ce6d"
NATIVE PROC NETWORK_EARN_NIGHTCLUB(INT amount) = "0xa82297f11d86ffbf"

NATIVE PROC NETWORK_EARN_BB_EVENT_BONUS(INT amount) = "0x746cdc44f782dfa6"

/////////////////////////////////////////////////////////////////////////////// MEGA BUSINESS

STRUCT STRUCT_SPENT_ON_HACKER_TRUCK
	INT m_truck = -1
	INT m_truck_amount = -1
	INT m_tint = -1
	INT m_tint_amount = -1
	INT m_pattern = -1
	INT m_pattern_amount = -1
	INT m_missileLauncher = -1
	INT m_missileLauncher_amount = -1
	INT m_droneStation = -1
	INT m_droneStation_amount = -1
	INT m_weaponWorkshop = -1
	INT m_weaponWorkshop_amount = -1
	INT m_bike = -1
	INT m_bike_amount = -1
	INT m_bikeWorkshop = -1
	INT m_bikeWorkshop_amount = -1
ENDSTRUCT

NATIVE PROC NETWORK_SPENT_PURCHASE_HACKER_TRUCK(INT amount, STRUCT_SPENT_ON_HACKER_TRUCK& data, BOOL fromBank, BOOL fromBankAndWallet) = "0x6e8ad780a8cc9e28"
NATIVE PROC NETWORK_SPENT_UPGRADE_HACKER_TRUCK(INT amount, STRUCT_SPENT_ON_HACKER_TRUCK& data, BOOL fromBank, BOOL fromBankAndWallet) = "0xb5788763064eedb8"
NATIVE PROC NETWORK_EARN_HACKER_TRUCK(INT amount, INT mission, INT missionRival, INT missionSolo) = "0x96d0dd1362b188ba"

STRUCT STRUCT_SPENT_ON_NIGHTCLUB_AND_WAREHOUSE
	INT m_location = -1
	INT m_location_amount = -1
	INT m_dj = -1
	INT m_dj_amount = -1
	INT m_style = -1
	INT m_style_amount = -1
	INT m_tint = -1
	INT m_tint_amount = -1
	INT m_lighting = -1
	INT m_lighting_amount = -1
	INT m_staff = -1
	INT m_staff_amount = -1
	INT m_security = -1
	INT m_security_amount = -1
	INT m_equipment = -1
	INT m_equipment_amount = -1
	INT m_whGarage2 = -1
	INT m_whGarage2_amount = -1
	INT m_whGarage3 = -1
	INT m_whGarage3_amount = -1
	INT m_whGarage4 = -1
	INT m_whGarage4_amount = -1
	INT m_whGarage5 = -1
	INT m_whGarage5_amount = -1
	INT m_whBasement2 = -1
	INT m_whBasement2_amount = -1
	INT m_whBasement3 = -1
	INT m_whBasement3_amount = -1
	INT m_whBasement4 = -1
	INT m_whBasement4_amount = -1
	INT m_whBasement5 = -1
	INT m_whBasement5_amount = -1
	INT m_whTechnician2 = -1
	INT m_whTechnician2_amount = -1
	INT m_whTechnician3 = -1
	INT m_whTechnician3_amount = -1
	INT m_whTechnician4 = -1
	INT m_whTechnician4_amount = -1
	INT m_whTechnician5 = -1
	INT m_whTechnician5_amount = -1
	INT m_name = -1
	INT m_name_amount = -1
	INT m_podium = -1
	INT m_podium_amount = -1
	INT m_dryice = -1
	INT m_dryice_amount = -1
ENDSTRUCT

NATIVE PROC NETWORK_SPENT_PURCHASE_NIGHTCLUB_AND_WAREHOUSE(INT amount, STRUCT_SPENT_ON_NIGHTCLUB_AND_WAREHOUSE& data, BOOL fromBank, BOOL fromBankAndWallet) = "0xbf64f84699419a71"
NATIVE PROC NETWORK_SPENT_UPGRADE_NIGHTCLUB_AND_WAREHOUSE(INT amount, STRUCT_SPENT_ON_NIGHTCLUB_AND_WAREHOUSE& data, BOOL fromBank, BOOL fromBankAndWallet) = "0x82178573c53353a9"
NATIVE PROC NETWORK_EARN_NIGHTCLUB_AND_WAREHOUSE(INT amount, INT location, INT popularityEarnings, INT mission, INT rivalNcEarned, INT sellContraband, INT sellContrabandBonus) = "0xc21030ea0af189b3"

NATIVE PROC NETWORK_EARN_NIGHTCLUB_DANCING(INT amount) = "0xdf55b0ff68a7b01c"

NATIVE PROC NETWORK_SPENT_RDR_HATCHET_BONUS(INT amount, BOOL fromBank, BOOL fromBankAndWallet) = "0xcbe001b6c37192a7"
NATIVE PROC NETWORK_SPEND_NIGHTCLUB_AND_WAREHOUSE(INT attendant, INT entryFee, BOOL fromBank, BOOL fromBankAndWallet) = "0x4d840f1546bc9e99"

NATIVE PROC NETWORK_SPENT_NIGHTCLUB_ENTRY_FEE(PLAYER_INDEX playerIndex, INT entryType, INT amount, BOOL fromBank, BOOL fromBankAndWallet) = "0x9e254735ca670b43"
NATIVE PROC NETWORK_SPEND_NIGHTCLUB_BAR_DRINK(INT drinkid, INT amount, BOOL fromBank, BOOL fromBankAndWallet) = "0x2db77846c375feee"
NATIVE PROC NETWORK_SPEND_BOUNTY_HUNTER_MISSION(INT amount, BOOL fromBank, BOOL fromBankAndWallet) = "0x2b81856aaa0e53a3"

NATIVE PROC NETWORK_SPENT_REHIRE_DJ(INT amount, INT dj, BOOL fromBank, BOOL fromBankAndWallet) = "0xf00cc41ba4468456"

NATIVE PROC NETWORK_SPENT_ARENA_JOIN_SPECTATOR(INT amount, INT iEntryId, BOOL fromBank, BOOL fromBankAndWallet) = "0xcabd18851daabfcd"

NATIVE PROC NETWORK_EARN_ARENA_SKILL_LEVEL_PROGRESSION(INT amount, INT iLevel) = "0x6eedc85d467a4d10"

NATIVE PROC NETWORK_EARN_ARENA_CAREER_PROGRESSION(INT amount, INT iTier) = "0xf24f7f9e554c6869"

NATIVE PROC NETWORK_SPEND_MAKE_IT_RAIN(INT amount, BOOL fromBank, BOOL fromBankAndWallet) = "0xea09a5cbac8bfc64"
NATIVE PROC NETWORK_SPEND_ARENA_SPECTATOR_BOX(INT amount, INT itembought, BOOL fromBank, BOOL fromBankAndWallet) = "0x8f78e3686e1557e4"
NATIVE PROC NETWORK_SPEND_SPIN_THE_WHEEL_PAYMENT(INT amount, BOOL fromBank, BOOL fromBankAndWallet) = "0xb6519c7f89415a54"
NATIVE PROC NETWORK_EARN_SPIN_THE_WHEEL_CASH(INT amount) = "0x146d9786343d5ba6"
NATIVE PROC NETWORK_EARN_RC_TIME_TRIAL(INT amount) = "0xc1daf08902be8028"
NATIVE PROC NETWORK_EARN_DAILY_OBJECTIVE_EVENT(INT amount) = "0x1a5c2e2723945652"

STRUCT STRUCT_SPENT_ON_ARENA
	INT m_location = -1
	INT m_location_amount = -1
	INT m_style = -1
	INT m_style_amount = -1
	INT m_graphics = -1
	INT m_graphics_amount = -1
	INT m_colour = -1
	INT m_colour_amount = -1
	INT m_floor = -1
	INT m_floor_amount = -1
	INT m_mechanic = -1
	INT m_mechanic_amount = -1
	INT m_personalQuarters = -1
	INT m_personalQuarters_amount = -1
ENDSTRUCT

NATIVE PROC NETWORK_SPEND_BUY_ARENA(INT amount, BOOL fromBank, BOOL fromBankAndWallet, STRUCT_SPENT_ON_ARENA& data) = "0x336e4fc3e6c2fd9e"

NATIVE PROC NETWORK_SPEND_UPGRADE_ARENA(INT amount, BOOL fromBank, BOOL fromBankAndWallet, STRUCT_SPENT_ON_ARENA& data) = "0x3f44ae4073f23543"

NATIVE PROC NETWORK_SPEND_ARENA_PREMIUM(INT amount, BOOL fromBank, BOOL fromBankAndWallet) = "0xf51d556d6ef05e21"

NATIVE PROC NETWORK_EARN_ARENA_WAR(INT matchEarnings, INT premiumEarnings, INT careerAward, INT skillAward) = "0x1b7d1bd13341944e"
NATIVE PROC NETWORK_EARN_ARENA_WAR_ASSASSINATE_TARGET(INT amount) = "0xc8e0bee49bb952a3"
NATIVE PROC NETWORK_EARN_ARENA_WAR_EVENT_CARGO(INT amount) = "0xc7c4f92697e08526"

NATIVE PROC NETWORK_SPEND_CASINO_MEMBERSHIP(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT purchasePoint) = "0xdbffa0366cd21d2e"

/// 
/// CASH BALANCE COMMANDS:
/// 

// PURPOSE: Retrieve Total WALLET ( EARN + PAID ) cash balance. -1 gets the cash for the current selected character.
NATIVE FUNC INT NETWORK_GET_VC_WALLET_BALANCE(INT character = -1) = "0xeee6dafbf451b942"

// PURPOSE: Retrieve Total BANK cash balance.
NATIVE FUNC INT NETWORK_GET_VC_BANK_BALANCE() = "0xa257acf32a90b705"

// PURPOSE: Retrieve Total Virtual Cash balance. This includes cash for all wallets. Its EVC + PVC.
NATIVE FUNC INT NETWORK_GET_VC_BALANCE() = "0x6fb86f8f2f03ebd3"

// PURPOSE: Retrieve Total Earned Virtual Cash balance.
NATIVE FUNC INT NETWORK_GET_EVC_BALANCE() = "0x3543f80eac8d303c"

// PURPOSE: Retrieve Total Paid Virtual Cash balance.
NATIVE FUNC INT NETWORK_GET_PVC_BALANCE() = "0x5189fe639fbe50a7"

// PURPOSE: Retrieve a string with the WALLET balance.
NATIVE FUNC STRING NETWORK_GET_STRING_WALLET_BALANCE(INT character = -1) = "0x034feb0a8464a229"

// PURPOSE: Retrieve a string with the BANK balance.
NATIVE FUNC STRING NETWORK_GET_STRING_BANK_BALANCE() = "0x5f57025291607cd8"

// PURPOSE: Retrieve a string with the BANK balance.
NATIVE FUNC STRING NETWORK_GET_STRING_BANK_WALLET_BALANCE(INT character = -1) = "0xc5d480c52c8e3653"

// PURPOSE: Check if we have enough money in the WALLET, BANK or both for a certain amount.
NATIVE FUNC BOOL NETWORK_GET_CAN_SPEND_FROM_WALLET(INT amount, INT character = -1) = "0x0379a27eab9f02c8"
NATIVE FUNC BOOL NETWORK_GET_CAN_SPEND_FROM_BANK(INT amount) = "0xb917918314ca8a39"
NATIVE FUNC BOOL NETWORK_GET_CAN_SPEND_FROM_BANK_AND_WALLET(INT amount, INT character = -1) = "0x68c9515ee9a0586c"

// PURPOSE: Retrieve amount of PVC transferred out by a player to other players in 1 day.
NATIVE FUNC INT NETWORK_GET_PVC_TRANSFER_BALANCE() = "0x50c8d39907798d7c"

// PURPOSE: Retrieve amount of PVC transferred out by a player to other players in 1 day.
NATIVE FUNC BOOL NETWORK_GET_CAN_TRANSFER_CASH(INT amount) = "0x18ef751b1f4f5e68"

// PURPOSE: check if the receiving player can receive the cash.
NATIVE FUNC BOOL NETWORK_CAN_RECEIVE_PLAYER_CASH(INT amount, INT amountOfEVC, INT amountOfPVC, FLOAT amountOfUSDE) = "0xf08d186298944b05"

// PURPOSE: Get the amount of remaining cash for transfers.
NATIVE FUNC INT NETWORK_GET_REMAINING_TRANSFER_BALANCE() = "0x648e0ae7087aa50c"

/// 
/// BANK TRANSACTIONS:
///   - TRANSFER MONEY BETWEEN BANK ACCOUNT AND FREEMODE CASH
/// 

/// PURPOSE: Transfer money from BANK account to FREEMODE cash.
/// INFO: Start a VC transfer. This function requests a VC total of "amount" to the current player.
///		Returns an int (transferId) which is used to query the state of the transfer.
NATIVE FUNC INT WITHDRAW_VC( INT amount ) = "0xfd3c38a9030ad7f2"

/// INFO: Query whether a VC transfer has completed. Take as a parameter a transfer ID returned by TRANSFER_VC
NATIVE FUNC BOOL HAS_VC_WITHDRAWAL_COMPLETED( INT transferId ) = "0x46e0dbddea18907a"

/// INFO: Query whether a VC transfer was successful. Take as a parameter a transfer ID returned by TRANSFER_VC
/// WARNING: Will return false until HAS_VC_TRANSFER_COMPLETED is returning true, so be sure to check HAS_VC_TRANSFER_COMPLETED first.
NATIVE FUNC BOOL WAS_VC_WITHDRAWAL_SUCCESSFUL( INT transferId ) = "0xecb38c941d121d34"

/// PURPOSE: CREDIT BANK ACCOUNT with cash.
/// INFO: Deposit cash into the VC bank. Returns true on success.
NATIVE FUNC BOOL DEPOSIT_VC( INT amount ) = "0x0d7ce3d8d074c379"


STRUCT STRUCT_SPENT_ON_CASINO
	INT m_masterBedroom = -1
	INT m_masterBedroom_amount = -1
	INT m_lounge = -1
	INT m_lounge_amount = -1
	INT m_spa = -1
	INT m_spa_amount = -1
	INT m_barParty = -1
	INT m_barParty_amount = -1
	INT m_dealer = -1
	INT m_dealer_amount = -1
	INT m_extraBedroom = -1
	INT m_extraBedroom_amount = -1
	INT m_extraBedroom2 = -1
	INT m_extraBedroom2_amount = -1
	INT m_mediaRoom = -1
	INT m_mediaRoom_amount = -1
	INT m_garage = -1
	INT m_garage_amount = -1
	INT m_colour = -1
	INT m_colour_amount = -1
	INT m_graphics = -1
	INT m_graphics_amount = -1
	INT m_office = -1
	INT m_office_amount = -1
	INT m_preset = -1
	INT m_preset_amount = -1
ENDSTRUCT

NATIVE PROC NETWORK_SPEND_BUY_CASINO(INT amount, BOOL fromBank, BOOL fromBankAndWallet, STRUCT_SPENT_ON_CASINO& data) = "0xbe42452b68c44892"

NATIVE PROC NETWORK_SPEND_UPGRADE_CASINO(INT amount, BOOL fromBank, BOOL fromBankAndWallet, STRUCT_SPENT_ON_CASINO& data) = "0x91a47dc5db7cc3a8"

NATIVE PROC NETWORK_SPEND_CASINO_GENERIC(INT amount, BOOL fromBank, BOOL fromBankAndWallet, STRING category, INT item) = "0x7d5d2115877f3a15"

NATIVE PROC NETWORK_EARN_CASINO_TIME_TRIAL_WIN(INT amount) = "0xc5aab4fe7d8e246b"
NATIVE PROC NETWORK_EARN_CASINO_COLLECTABLE_COMPLETED_COLLECTION(INT amount) = "0xb9b36ae985f6b8da"
NATIVE PROC NETWORK_EARN_SELL_PRIZE_VEHICLE(INT amount, INT iType, INT vehicleHash) = "0x2efb058d52030f3e"
NATIVE PROC NETWORK_EARN_CASINO_MISSION_REWARD(INT amount) = "0xb514ad4fd69533e6"
NATIVE PROC NETWORK_EARN_CASINO_STORY_MISSION_REWARD(INT amount) = "0xc2ad1683fd4c7bab"
NATIVE PROC NETWORK_EARN_CASINO_MISSION_PARTICIPATION(INT amount) = "0x73477c467022c107"

NATIVE PROC NETWORK_EARN_COLLECTABLES_ACTION_FIGURES(INT amount) = "0x2762fc624626fac2"

NATIVE PROC NETWORK_EARN_CASINO_AWARD(INT amount, INT award) = "0xbf70e41a3dc416cd"

/////////////////////////////////////////////////////////////////////////////// Heist 3 earn and spend
STRUCT STRUCT_ARCADE
	INT location
	INT location_amount
	INT garage
	INT garage_amount
	INT sleeping_quarter
	INT sleeping_quarter_amount
	INT drone_station
	INT drone_station_amount
	INT business_management
	INT business_management_amount
	INT m_style
	INT m_style_amount
	INT m_mural
	INT m_mural_amount
	INT m_floor
	INT m_floor_amount
	INT m_neon_art
	INT m_neon_art_amount
	INT m_highscore_screen
	INT m_highscore_screen_amount
ENDSTRUCT

NATIVE PROC NETWORK_SPEND_BUY_ARCADE(INT amount, BOOL fromBank, BOOL fromBankAndWallet, STRUCT_ARCADE& data) = "0x7204b81741d2b88a"

NATIVE PROC NETWORK_SPEND_UPGRADE_ARCADE(INT amount, BOOL fromBank, BOOL fromBankAndWallet, STRUCT_ARCADE& data) = "0xe55d5c684838f0a0"

NATIVE PROC NETWORK_SPEND_CASINO_HEIST(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT replay, INT replay_amount, INT model, INT model_amount, INT vault_door, INT vault_door_amount, INT locks, INT locks_amount) = "0x05d40158d56d62a9"

NATIVE PROC NETWORK_SPEND_ARCADE_MGMT(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT cabinet, INT cabinet_amount) = "0xcb744233c15f9b4a"

NATIVE PROC NETWORK_SPEND_PLAY_ARCADE(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT cabinet, INT cabinet_amount) = "0x12c4c93b734ea48c"

NATIVE PROC NETWORK_SPEND_ARCADE(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT bar, INT bar_amount) = "0xe84c6c337563acbb"

NATIVE PROC NETWORK_EARN_CASINO_HEIST(INT amount, INT general_prep, INT general_prep_amount, INT setup, INT setup_amount, INT finale, INT finale_amount) = "0x7a70c2f43e7510f2"

NATIVE PROC NETWORK_EARN_UPGRADE_ARCADE(INT amount, INT location, INT location_amount) = "0x02bec5b0c96d3ae5"

NATIVE PROC NETWORK_EARN_ARCADE(INT amount, INT arcade_award, INT arcade_award_amount, INT arcade_trophy, INT arcade_trophy_amount) = "0xa2ce87301cddec45"

NATIVE PROC NETWORK_EARN_COLLECTABLES(INT amount, INT arcade, INT arcade_amount) = "0x651f408d7a116cf0"

NATIVE PROC NETWORK_EARN_CHALLENGE(INT amount, INT kills, INT kills_amount) = "0x5cb7f7b38ac42890"

NATIVE PROC NETWORK_EARN_CASINO_HEIST_AWARDS(INT amount, INT awards, INT awards_amount, INT elite, INT elite_amount) = "0x67e5d1c7e503dd93"

NATIVE PROC NETWORK_EARN_COLLECTABLE_ITEM(INT amount, INT collectionHash) = "0x08ccfd36e49f6daf"
NATIVE PROC NETWORK_EARN_COLLECTABLE_COMPLETED_COLLECTION(INT amount, INT collectionHash) = "0x4560db772529945a"

NATIVE PROC NETWORK_EARN_CNC_EOM(INT result, INT matchResultAmount, INT challengeAmount, INT bonusAmount) = "0x22429b00706774f0"

// triggers when completing a new yacht mission
NATIVE PROC NETWORK_EARN_YATCH_MISSION(INT amount, INT missionId) = "0xa00a9583e60516ae"

//triggers when completing a new Dispatch Call mission
NATIVE PROC NETWORK_EARN_DISPATCH_CALL(INT amount, INT missionId) = "0xfecae0c36c187951"

//unlocking items in the CnC shop with cash
NATIVE PROC NETWORK_SPEND_CnC_ITEM_UNLOCKED(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT itemUnlocked) = "0x645ff566f260ba41"

// Increase the amount of CNC tokens
NATIVE PROC NETWORK_EARN_CNC_TOKENS(INT tokens) = "0x3c0796e94c0005eb"

// Decrease the amount of CNC tokens
NATIVE PROC NETWORK_SPEND_CNC_TOKENS(INT tokens) = "0xd292d8ca7365ed9e"

//buying a CnC XP boost.
NATIVE PROC NETWORK_SPEND_PURCHASE_CNC_XP_BOOST(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT transactionPoint, FLOAT xpMultiplier) = "0xe9be0a38080d0d3d"

// purchases made at the beach party bar, which are all free
NATIVE PROC NETWORK_SPEND_BEACH_PARTY(INT item) = "0xc9b1a37c8769239d"

// staff wages/utility fee for the submarine and/or requesting a vehicle/boat pick up from the shore to the submarine
NATIVE PROC NETWORK_SPEND_SUBMARINE(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT utility_amount, INT boat_amount, INT relocate_amount) = "0x1c42b2d94eaf2718"

//bar: buying drinks from casino nightclub bar
//vip: purchases in the VIP area of the nightclub, like champagne
//entry: fee for entering the casino nightclub
//bathroomAttendant: tipping the bathroom attendant
NATIVE PROC NETWORK_SPEND_CASINO_CLUB(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT barItem, INT barAmount, INT vipItem, INT vipAmount, INT entryAmount, INT attendantAmount) = "0xf99635f38bf6cee1"

STRUCT STRUCT_BUY_SUB
	INT submarine_amount = -1
	INT color = -1
	INT color_amount = -1
	INT flag = -1
	INT flag_amount = -1
	INT anti_aircraft_amount = -1
	INT missile_station = -1
	INT missile_station_amount = -1
	INT sonar = -1
	INT sonar_amount = -1
	INT weapon_workshop = -1
	INT weapon_workshop_amount = -1
	INT iavisa = -1
	INT avisa_pool_amount = -1
	INT iseasparrow = -1
	INT seasparrow_pool_amount = -1
ENDSTRUCT

// PURPOSE: 
NATIVE PROC NETWORK_SPEND_BUY_SUB(INT amount, BOOL fromBank, BOOL fromBankAndWallet, STRUCT_BUY_SUB& data) = "0x9b3637401377120a"

// PURPOSE: 
NATIVE PROC NETWORK_SPEND_UPGRADE_SUB(INT amount, BOOL fromBank, BOOL fromBankAndWallet, STRUCT_BUY_SUB& data) = "0xd0389d4d14078c71"

STRUCT STRUCT_SPEND_ISLAND_HEIST
	INT airstrike = -1		// buying airstrike support crew on the planning board
	INT heavy_weapon = -1	// buying heavy weapon drop on the planning board
	INT sniper = -1			// buying sniper support crew on the planning board
	INT air_support = -1	// buying air support crew on the planning board
	INT idrone = -1			// buying spy drone on the planning board
	INT weapon_stash = -1	// buying weapon stash on the planning board
	INT suppressor = -1		// buying suppressors on the planning board
	INT replay = -1			// paying to replay the heist
	INT prep = -1			// paying to skip the prep
	INT prepItem = -1		// prep name/ID	
ENDSTRUCT

// PURPOSE: 
NATIVE PROC NETWORK_SPEND_ISLAND_HEIST(INT amount, BOOL fromBank, BOOL fromBankAndWallet, STRUCT_SPEND_ISLAND_HEIST& data) = "0x70d5f434117cc632"

// PURPOSE:
NATIVE PROC NETWORK_EARN_ISLAND_HEIST(INT amount, INT finale, INT award, INT awardName, INT prep, INT prepName) = "0xd9f6ca1e468c0966"

// PURPOSE:
NATIVE PROC NETWORK_EARN_BEACH_PARTY_LOST_FOUND(INT amount, INT item, INT missionGiver) = "0xb63b018c5ecc0613"

// PURPOSE:
NATIVE PROC NETWORK_EARN_FROM_ISLAND_HEIST_DJ_MISSION(INT amount, INT mission) = "0x6cb5d96978629b3b"

// PURPOSE:
NATIVE FUNC BOOL NETWORK_GET_MP_WINDFALL_AVAILABLE() = "0x313a1d074b56a004"

// PURPOSE:
NATIVE FUNC BOOL NETWORK_SET_MP_WINDFALL_COMPLETED() = "0x7fa877948e969d93"

ENUM MEMBERSHIP_PURCHASE_METHOD
	MEMBERSHIP_PURCHASE_WEBSITE = HASH("MEMBERSHIP_PURCHASE_WEBSITE"),
	MEMBERSHIP_PURCHASE_MIMI    = HASH("MEMBERSHIP_PURCHASE_MIMI")
ENDENUM

STRUCT STRUCT_BUY_AUTOSHOP
	INT location
	INT location_amount
	INT style
	INT style_amount
	INT tint
	INT tint_amount
	INT emblem
	INT emblem_amount
	INT crew_name
	INT crew_name_amount
	INT staff
	INT staff_amount
	INT lift
	INT lift_amount
	INT personal_quarter
	INT personal_quarter_amount
ENDSTRUCT

// PURPOSE: 
NATIVE PROC NETWORK_SPEND_CAR_CLUB_MEMBERSHIP(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT carClub_amount, MEMBERSHIP_PURCHASE_METHOD purchaseMethod) = "0xb7c7367d9eb68d11"

// PURPOSE: 
NATIVE PROC NETWORK_SPEND_CAR_CLUB_BAR(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT carClub_amount) = "0xb68d72a7c9493742"

// PURPOSE: 
NATIVE PROC NETWORK_SPEND_AUTOSHOP_MODIFY(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT vehicleHash, INT autoShop_amount) = "0xf3c5fae8faa5f251"

// PURPOSE: 
NATIVE PROC NETWORK_SPEND_CAR_CLUB_TAKEOVER(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT carClub_amount) = "0x2a080e6f4637cb11"

// PURPOSE: 
NATIVE PROC NETWORK_SPEND_BUY_AUTOSHOP(INT amount, BOOL fromBank, BOOL fromBankAndWallet, STRUCT_BUY_AUTOSHOP& data) = "0xe28f46dd8a8b9a99"

// PURPOSE: 
NATIVE PROC NETWORK_SPEND_UPGRADE_AUTOSHOP(INT amount, BOOL fromBank, BOOL fromBankAndWallet, STRUCT_BUY_AUTOSHOP& data) = "0xc2b4902dfdff16ef"

// PURPOSE: 
NATIVE PROC NETWORK_EARN_AUTOSHOP_BUSINESS(INT amount, INT carHash) = "0x0329bf95d7ce7a2e"

// PURPOSE: 
NATIVE PROC NETWORK_EARN_AUTOSHOP_INCOME(INT amount, INT missionId) = "0x5aa4c7a11447c2fd"

// PURPOSE: 
NATIVE PROC NETWORK_EARN_CARCLUB_MEMBERSHIP(INT amount) = "0x7710b3985f0de8bf"

// PURPOSE: 
NATIVE PROC NETWORK_EARN_DAILY_VEHICLE(INT amount, INT carHash) = "0x5284c8c1f78142bf"

// PURPOSE: 
NATIVE PROC NETWORK_EARN_DAILY_VEHICLE_BONUS(INT amount) = "0xb1f8cd326dbb8cf2"

// PURPOSE: 
NATIVE PROC NETWORK_EARN_TUNER_AWARD(INT amount, STRING matchId, STRING challenge) = "0x66fa1b42d92ba2fc"

// PURPOSE: 
NATIVE PROC NETWORK_EARN_TUNER_ROBBERY(INT amount, INT finale, INT finaleContentID, INT prep, INT prepName) = "0xeddb967468ec8d1f"

// PURPOSE: 
NATIVE PROC NETWORK_EARN_UPGRADE_AUTOSHOP(INT amount, INT locationHash) = "0xed303f2773aaf9b5"

// PURPOSE: 
NATIVE PROC NETWORK_SPEND_INTERACTION_MENU_ABILITY(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT ability) = "0xdaf1333d739aae8e"

// PURPOSE: 
NATIVE PROC NETWORK_SPEND_SET_COMMON_FIELDS(INT properties, INT properties2, INT heists, BOOL windfall) = "0xaf0dd1fc2d0c54ae"

// PURPOSE: 
NATIVE PROC NETWORK_SPEND_SET_DISCOUNT(INT discount) = "0x7e2f4e8f44caf4e0"

STRUCT STRUCT_BUY_AGENCY
	INT location = -1
	INT location_amount = -1
	INT style = -1
	INT style_amount = -1
	INT wallpaper = -1
	INT wallpaper_amount = -1
	INT tint = -1
	INT tint_amount = -1
	INT personal_quarter = -1
	INT personal_quarter_amount = -1
	INT weapon_workshop = -1
	INT weapon_workshop_amount = -1
	INT vehicle_workshop = -1
	INT vehicle_workshop_amount = -1
ENDSTRUCT

// PURPOSE: 
NATIVE PROC NETWORK_SPEND_BUY_AGENCY(INT amount, BOOL fromBank, BOOL fromBankAndWallet, STRUCT_BUY_AGENCY& data) = "0xea8cd3c9b3c35884"

// PURPOSE: 
NATIVE PROC NETWORK_SPEND_UPGRADE_AGENCY(INT amount, BOOL fromBank, BOOL fromBankAndWallet, STRUCT_BUY_AGENCY& data) = "0x6cca64840589a3b6"

// PURPOSE: concierge service, if it costs
NATIVE PROC NETWORK_SPEND_AGENCY(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT context, INT option = 0) = "0x1b2120405080125c"

// PURPOSE: existing SPEND expanded with Imani's Out of Sight
NATIVE PROC NETWORK_SPEND_HIDDEN(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT providerNpc) = "0xbf8793b91ea094a7"

// PURPOSE: existing SPEND expanded with Imani's Source Motorcycle
NATIVE PROC NETWORK_SPEND_SOURCE_BIKE(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT providerNpc) = "0xd9df467cbe4398c8"

// PURPOSE: existing SPEND expanded with Franklin's Company SUV
NATIVE PROC NETWORK_SPEND_COMP_SUV(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT providerNpc) = "0xd86581f9e7cda383"

// PURPOSE: existing SPEND expanded with Franklin's SUV Service
NATIVE PROC NETWORK_SPEND_SUV_FST_TRVL(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT providerNpc) = "0x61a2df64ed2d396e"

// PURPOSE: existing SPEND expanded with Franklin's Supply Stash
NATIVE PROC NETWORK_SPEND_SUPPLY(INT amount, BOOL fromBank, BOOL fromBankAndWallet, INT providerNpc) = "0xebd482b82acb8bad"

// PURPOSE: emptying the Fixer Agency safe
NATIVE PROC NETWORK_EARN_AGENCY_SAFE(INT amount) = "0x663b4b9d11742a12"

// PURPOSE: pause menu awards for security contracts
NATIVE PROC NETWORK_EARN_AWARD_CONTRACT(INT amount, INT context) = "0x146d4eb6d22a403f"

// PURPOSE: payout for security contracts
NATIVE PROC NETWORK_EARN_AGENCY_CONTRACT(INT amount, INT context) = "0x38482ad49cb905c7"

// PURPOSE: pause menu awards for payphone hits
NATIVE PROC NETWORK_EARN_AWARD_PHONE(INT amount, INT context) = "0x7397a115030f1be3"

// PURPOSE: payout for payphone hits
NATIVE PROC NETWORK_EARN_AGENCY_PHONE(INT amount, INT context, INT bonusAmount = 0) = "0xe29f3d5fa63b1b82"

// PURPOSE: pause menu awards for Fixer story missions
NATIVE PROC NETWORK_EARN_AWARD_FIXER_MISSION(INT amount, INT context) = "0x88d6c327d6c57c45"

// PURPOSE: payout for Fixer story mission preps
NATIVE PROC NETWORK_EARN_PREP(INT amount, INT context) = "0x6283e5de4c4460c6"

// PURPOSE: payout for Fixer story mission finales
NATIVE PROC NETWORK_EARN_FINALE(INT amount, INT context) = "0xba154373c5fe51e8"

// PURPOSE: payout for Fixer agency short trips
NATIVE PROC NETWORK_EARN_FIXER_AGENCY_SHORT_TRIP(INT amount, INT context) = "0xf4a8e57460bf2037"

// PURPOSE: pause menu awards for short trips
NATIVE PROC NETWORK_EARN_AWARD_SHORT_TRIP(INT amount, INT context) = "0x5b4dbded84d6a420"

// PURPOSE: trade in Agency property
NATIVE PROC NETWORK_EARN_UPGRADE_AGENCY(INT amount, INT context) = "0xd07c7c3f1995108c"

// PURPOSE: These will be used when a player steals another players asset and delivers 
//          it to their own Agency. Rivals will be rewarded $10,000 for each delivery, 
//          and will be on a tunable.
NATIVE PROC NETWORK_EARN_FIXER_RIVAL_DELIVERY(INT amount, INT asset) = "0x235d41210b3a1a5e"

STRUCT APT_UTIL_BREAKDOWN
	INT iLowAptFees = -1
	INT iMedAptFees = -1
	INT iHighAptFees = -1
	INT iYachtFees = -1
	INT iFacilityFees = -1
	INT iPenthouseFees = -1
	INT iKosatkaFees = -1
	INT iCleanerFees = -1
ENDSTRUCT

NATIVE PROC NETWORK_SPEND_APARTMENT_UTILITIES(INT amount, BOOL fromBank, BOOL fromBankAndWallet, APT_UTIL_BREAKDOWN& data) = "0x1254b5b3925efd3d"

STRUCT BUSINESS_UTIL_BREAKDOWN
	INT iBunkerFees = -1
	INT iWeedFees = -1
	INT iMethFees = -1
	INT iDocForgeFees = -1
	INT iFakeCashFees = -1
	INT iCocaineFees = -1
	INT iHangarFees = -1
	INT iNightclubFees = -1
	INT iNightclubStaff = -1
	INT iExecOfficeFees = -1
	INT iExecAssistantFees = -1
	INT iSmallWhouseFees = -1
	INT iMediumWhouseFees = -1
	INT iLargeWhouseFees = -1
	INT iArcadeFees = -1
	INT iAutoShopFees = -1
	INT iFixerAgencyFees = -1
ENDSTRUCT

NATIVE PROC NETWORK_SPEND_BUSINESS_PROPERTY_FEES(INT amount, BOOL fromBank, BOOL fromBankAndWallet, BUSINESS_UTIL_BREAKDOWN& data) = "0x92d1cfda1227ff1c"

// PURPOSE: making modification to vehicles for the customer bike delivery, under the biker business
NATIVE PROC NETWORK_SPEND_BIKE_SHOP(INT amount, BOOL fromBank, BOOL fromBankAndWallet, int vehicleModel) = "0x923aea8e78f8df0b"

// PURPOSE: requesting the limo from Tony's phone menu; we would look to reuse this in the future for similar transactions
NATIVE PROC NETWORK_SPEND_VEHICLE_REQUESTED(INT amount, BOOL fromBank, BOOL fromBankAndWallet, int hashWhoRequested, int vehicleModel) = "0x02d24a35a9cc3503"

// PURPOSE: triggers for the new Request Transportation option from Agent 14; similar to Agatha Baker's �Request Vehicle� option
NATIVE PROC NETWORK_SPEND_GUNRUNNING(INT amount, BOOL fromBank, BOOL fromBankAndWallet, int vehicleModel) = "0x2ceb0e0bc2a77c05"

// PURPOSE: Reward when the player photographs a new location
//  Amount is the base reward amount, locBonus and milBonus is for the extra amount for a bonus photograph (location and military UFO thing). I'll sum them up together on code side
NATIVE PROC NETWORK_EARN_SIGHTSEEING_REWARD(INT amount, INT locBonus, INT milBonus, INT location) = "0x45087ae480b233ac"

// PURPOSE: extra income for the biker business
NATIVE PROC NETWORK_EARN_BIKER_SHOP(INT amount, INT vehicleModel) = "0x2c5809eb9df57257"

// PURPOSE: passive income from the Bar Resupply mission
NATIVE PROC NETWORK_EARN_BIKER(INT amount) = "0x71bec32fa466e105"

// PURPOSE: For the Yohan "source goods" missions
NATIVE PROC NETWORK_YOHAN_SOURCE_GOODS(INT amount, INT nightclub, INT qty, INT missionCompleted) = "0x59498bc8b1c8b15c"


//eof


