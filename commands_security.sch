//PURPOSE: Register a script variable for protection with RageSec plugin. The plugin will
//		   keep an obfuscated shadow copy of the variable.
//		   Call this function whenever the protected script variable is modified to update
//		   the shadow copy at the plugin. Failing to do so will cause the plugin to think
//		   the script variable is being tampered with.
NATIVE PROC REGISTER_SCRIPT_VARIABLE(INT& scriptVariable) = "0x40eb1efd921822bc"

//PURPOSE: Unregister a script variable from protection with RageSec plugin. Use this to
//		   remove a script variable that has gone out of scope to avoid false tamper alerts.
NATIVE PROC UNREGISTER_SCRIPT_VARIABLE(INT& scriptVariable) = "0x340a36a700e99699"

//PURPOSE: Force the RageSec plugin to check the integrity of all script variables registered
//		   for protection.
NATIVE PROC FORCE_CHECK_SCRIPT_VARIABLES() = "0x8e580ab902917360"

//PURPOSE: Force the RageSec plugin to unregister all script variables from protection.
NATIVE PROC FORCE_UNLOAD_SCRIPT_VARIABLES() = "0xfc23014843d50bda"
