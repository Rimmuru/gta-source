USING "types.sch"
USING "commands_debug.sch"
USING "commands_network.sch"

//PURPOSE: Returns TRUE if the command line to automatically launch into the multiplayer menu is true. 
NATIVE FUNC BOOL LOBBY_AUTO_MULTIPLAYER_MENU() = "0xe056c89ece707845"

//PURPOSE: Returns TRUE If the game will automatically launch into the multiplayer game in freemode
NATIVE FUNC BOOL LOBBY_AUTO_MULTIPLAYER_FREEMODE() = "0x102628dfcaf80472"

//PURPOSE: Allows script to set the auto multiplayer parameter
NATIVE PROC LOBBY_SET_AUTO_MULTIPLAYER(BOOL bIsAuto) = "0x4d2d8cf744877a20"

//PURPOSE: Returns TRUE If the game has requested an event be started
NATIVE FUNC BOOL LOBBY_AUTO_MULTIPLAYER_EVENT() = "0xaed44b40a58aadd1"

//PURPOSE: Allows script to set the auto multiplayer event parameter
NATIVE PROC LOBBY_SET_AUTO_MULTIPLAYER_EVENT(BOOL bIsAuto) = "0x53029271aa306405"

//PURPOSE: Returns TRUE If the game has requested a random job be started
NATIVE FUNC BOOL LOBBY_AUTO_MULTIPLAYER_RANDOM_JOB() = "0xd02495957f745dd0"

//PURPOSE: Allows script to set the auto multiplayer random job parameter
NATIVE PROC LOBBY_SET_AUTO_MP_RANDOM_JOB(BOOL bIsAuto) = "0x63aed124526aa103"

//PURPOSE: Call this with FALSE to allow you to call LOBBY_SET_AUTO_MULTIPLAYER(TRUE) and keep that TRUE flag across one session shutdown
NATIVE PROC SHUTDOWN_SESSION_CLEARS_AUTO_MULTIPLAYER(BOOL bClearsAutoMultiplayer) = "0x5c21733602754c43"

//PURPOSE: Returns TRUE If the game will automatically launch into the multiplayer game in creator
NATIVE FUNC BOOL LOBBY_AUTO_MULTIPLAYER_CREATOR() = "0x367e205ffb605a5c"

// These will be deleted
NATIVE FUNC BOOL LOBBY_LEAVE_MULTIPLAYER() = "0xad79adead5142693"
NATIVE FUNC BOOL LOBBY_AUTO_MULTIPLAYER_CNC() = "0x924dd713f6e1e39a"
