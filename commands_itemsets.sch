USING "types.sch"

//INFO: 
//PARAM NOTES: If autoClean is set, invalid entries are cleaned up automatically.
//PURPOSE: Create a set, which can contain entities and certain other "items".
NATIVE FUNC ITEMSET_INDEX CREATE_ITEMSET(BOOL autoClean) = "0x5dba089fcc1e8441"

//INFO: The set members are unaffected, not destroyed by this command.
//PARAM NOTES:
//PURPOSE: Destroy a set.
NATIVE PROC DESTROY_ITEMSET(ITEMSET_INDEX itemSet) = "0xf8787973a530cd9d"

//INFO: Each item can only be in the set once, an error will be generated otherwise. Returns TRUE on success.
//PARAM NOTES:
//PURPOSE: Add an entity or other item to a set.
NATIVE FUNC BOOL ADD_TO_ITEMSET(ITEM_INDEX itemToAdd, ITEMSET_INDEX itemSetToAddTo) = "0x4ada1f27dc259a08"

//INFO: Will generate an error if the item is not in the set.
//PARAM NOTES:
//PURPOSE: Remove a specific entity or other item from a set, if present.
NATIVE PROC REMOVE_FROM_ITEMSET(ITEM_INDEX itemToRemove, ITEMSET_INDEX itemSetToRemoveFrom) = "0x4e49d01105a580ba"

//INFO: If auto-cleaning, invalid items will get cleaned up first.
//PARAM NOTES:
//PURPOSE: Get the number of items in an item set.
NATIVE FUNC INT GET_ITEMSET_SIZE(ITEMSET_INDEX itemSet) = "0x3f0236a455cd21fb"

//INFO: Use NATIVE_TO_INT and INT_TO_NATIVE if you need to convert this to an ENTITY_INDEX, PED_INDEX, etc.
//PARAM NOTES: The first index is 0, the last item in the set has index GET_ITEMSET_SIZE()-1.
//PURPOSE: Get an item from the item set, by index.
NATIVE FUNC ITEM_INDEX GET_INDEXED_ITEM_IN_ITEMSET(INT indexInSet, ITEMSET_INDEX itemSet) = "0x5d8dd9724918ffbd"

//INFO: 
//PARAM NOTES:
//PURPOSE: Check if a given item is in the set.
NATIVE FUNC BOOL IS_IN_ITEMSET(ITEM_INDEX objToCheck, ITEMSET_INDEX itemSet) = "0xab829f8e88b23382"

//INFO: 
//PARAM NOTES:
//PURPOSE: Check if a given item set is valid (has been created and not destroyed).
NATIVE FUNC BOOL IS_ITEMSET_VALID(ITEMSET_INDEX itemSet) = "0x8cc4f96fbf3cfbe3"

//INFO: Generally not needed if using the autoClean option with CREATE_ITEMSET.
//PARAM NOTES:
//PURPOSE: Clean out any invalid items from the item set.
NATIVE PROC CLEAN_ITEMSET(ITEMSET_INDEX itemSet) = "0xbfa82d057e04ca9e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Check if an item is an item set.
NATIVE FUNC BOOL IS_AN_ITEMSET(ITEM_INDEX obj) = "0x3841a80ccc00b54f"
