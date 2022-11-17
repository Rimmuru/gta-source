USING "types.sch"
USING "event_enums.sch"

//INFO: 
//PARAM NOTES:
//PURPOSE: Gives ped a valid decsion maker
NATIVE PROC SET_DECISION_MAKER(PED_INDEX PedIndex, DECISION_MAKER_TYPE DecisionMakerId) = "0x0ec3a788f361170a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Sets the decision maker to the default ped decision maker 
NATIVE PROC SET_DECISION_MAKER_TO_DEFAULT(PED_INDEX PedIndex) = "0x534af051e09b7c9e"

//INFO: 
//PARAM NOTES:
//PURPOSE: Creates a copy of a decision maker, passed in name must be unique
NATIVE FUNC DECISION_MAKER_TYPE COPY_DECISION_MAKER(DECISION_MAKER_TYPE SourceDecisionMakerIndex, STRING NewName) = "0x29949f782b0765d3"

//INFO: 
//PARAM NOTES:
//PURPOSE: Removes a decion maker that was created via COPY_DECISION_MAKER
NATIVE PROC DELETE_DECISION_MAKER(DECISION_MAKER_TYPE DecisionMakerId) = "0x77a0e78655287bbf"

//INFO:
//PARAM NOTES:
//PURPOSE: Checks that the decision maker exists
NATIVE FUNC BOOL DOES_DECISION_MAKER_EXIST(DECISION_MAKER_TYPE DecisionMakerId) = "0xa4a6542175ca13dc"

//INFO: This can be used to tailor specific behaviour types.
//PARAM NOTES: For the Chance parameters, please use values between 0.0 and 1.0.
//PURPOSE: Adds a task response to the decision maker for a particular event
NATIVE PROC ADD_DECISION_MAKER_EVENT_RESPONSE(DECISION_MAKER_TYPE DecisionMakerId, EVENT_NAMES EventType, EVENT_RESPONSE_TASK TaskType, FLOAT FriendChance, FLOAT ThreatChance, FLOAT PlayerChance, FLOAT OtherChance, BOOL InCarFlag, BOOL OnFootFlag) = "0x5a2e778e47bd0d5d"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Clears an Event response added to the decision maker via ADD_DECISION_MAKER_EVENT_RESPONSE
NATIVE PROC CLEAR_DECISION_MAKER_EVENT_RESPONSE(DECISION_MAKER_TYPE DecisionMakerId, EVENT_NAMES EventType) = "0x5458163cf0744e90"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Blocks a decision maker from responding to the specified Event
NATIVE PROC BLOCK_DECISION_MAKER_EVENT(DECISION_MAKER_TYPE DecisionMakerId, EVENT_NAMES EventType) = "0x955b3121f93782b0"

//INFO: 
//PARAM NOTES: 
//PURPOSE: Unblocks the specified Event if it was blocked via BLOCK_DECISION_MAKER_EVENT
NATIVE PROC UNBLOCK_DECISION_MAKER_EVENT(DECISION_MAKER_TYPE DecisionMakerId, EVENT_NAMES EventType) = "0x558a12ae451664d1"

//INFO: 
//PARAM NOTES: eventType must be one of the EVENT_SHOCKING_... events. overrideLifeTime is in seconds and can be 0 for infinite, or left at -1 to use the default for the event type.
//PURPOSE: Add a specific shocking event at a position, and return an event ID if successful, or 0 if nothing was added.
NATIVE FUNC INT ADD_SHOCKING_EVENT_AT_POSITION(EVENT_NAMES eventType, VECTOR pos, FLOAT overrideLifeTime = -1.0) = "0xaa8ea67d77d37c61"

//INFO: 
//PARAM NOTES: eventType must be one of the EVENT_SHOCKING_... events. overrideLifeTime is in seconds and can be 0 for infinite, or left at -1 to use the default for the event type.
//PURPOSE: Add a specific shocking event associated with the given entity, and return an event ID if successful, or 0 if nothing was added.
NATIVE FUNC INT ADD_SHOCKING_EVENT_FOR_ENTITY(EVENT_NAMES eventType, ENTITY_INDEX ent, FLOAT overrideLifeTime = -1.0) = "0x6f3d4a01b7ad6fb1"

//INFO:
//PARAM NOTES: eventType must be one of the EVENT_SHOCKING_... events.  
//PURPOSE: Checks if a shocking event of the given type is in the given sphere.  Returns TRUE if found, FALSE otherwise.
NATIVE FUNC BOOL IS_SHOCKING_EVENT_IN_SPHERE(EVENT_NAMES eventType, VECTOR pos, FLOAT radius) = "0x0b0f73fef90fd476"

//INFO: 
//PARAM NOTES: shockingEventId is the return value of an ADD_SHOCKING_EVENT_... command.
//PURPOSE: Remove a script-created shocking event. Returns TRUE if it was found.
NATIVE FUNC BOOL REMOVE_SHOCKING_EVENT(INT shockingEventId) = "0x527aab28db255a95"

//INFO: 
//PARAM NOTES: If scriptCreatedOnly is TRUE, only events created by ADD_SHOCKING_EVENT_... commands will be removed.
//PURPOSE: Remove all shocking events (some code-created events might come back immediately, if the conditions for triggering them are fulfilled).
NATIVE PROC REMOVE_ALL_SHOCKING_EVENTS(BOOL scriptCreatedOnly) = "0x828750f785b6a54d"

//INFO: 
//PARAM NOTES: eventType must be one of the EVENT_SHOCKING_... events. If scriptCreatedOnly is TRUE, only events created by ADD_SHOCKING_EVENT_... commands will be removed.
//PURPOSE: Remove all shocking events of a certain type.
NATIVE PROC REMOVE_ALL_SHOCKING_EVENTS_OF_TYPE(EVENT_NAMES eventType, BOOL scriptCreatedOnly) = "0x5fcbe5f476de8740"

//INFO: 
//PARAM NOTES:
//PURPOSE: Remove the ambient ped spawn blocking areas associated with shocking events.
NATIVE PROC REMOVE_SHOCKING_EVENT_SPAWN_BLOCKING_AREAS() = "0x95bd5cc1ee27a0b8"

//INFO: 
//PARAM NOTES: shockingEventId is the return value of an ADD_SHOCKING_EVENT_AT_POSITION command.
//PURPOSE: Set the position of a script-created shocking event. 
NATIVE FUNC BOOL SET_SHOCKING_EVENT_POSITION(INT shockingEventId, VECTOR pos) = "0x4b12efb735f34dd9"

//INFO:
//PARAM NOTES:
//PURPOSE:  Prevents shocking events from being added to the world next frame.
NATIVE PROC SUPPRESS_SHOCKING_EVENTS_NEXT_FRAME() = "0xaea20bbb896153f2"

//INFO:
//PARAM NOTES:  eventShockingLevel corresponds to the severity of the event type and is found in event_enums.sch.
//PURPOSE:  Prevents shocking events of a certain type from being added to the world next frame.
NATIVE PROC SUPPRESS_SHOCKING_EVENT_TYPE_NEXT_FRAME(SHOCKING_EVENT_LEVEL eventShockingLevel) = "0x50ee268371d6a236"

//INFO:
//PARAM NOTES:
//PURPOSE:  Prevents agitation events from being valid next frame (thereby suppressing disputes).
NATIVE PROC SUPPRESS_AGITATION_EVENTS_NEXT_FRAME() = "0x56b00356b09ab994"
