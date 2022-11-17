USING "types.sch"

//INFO: 
//PARAM NOTES:
//PURPOSE: Check if the law enforcement system is currently configured to require witnesses for crimes.
NATIVE FUNC BOOL GET_LAW_WITNESS_REQUIRED() = "0x3d9dafd22ef2b25f"

//INFO: 
//PARAM NOTES:
//PURPOSE: Specify if the law enforcement system should require witnesses for crimes.
NATIVE PROC SET_LAW_WITNESS_REQUIRED(BOOL b) = "0xef963098f0dcef7a"

//INFO: 
//PARAM NOTES:
//PURPOSE: Get the position the law enforcement uses as the location to report crimes, if witnessing is enabled.
NATIVE FUNC VECTOR GET_LAW_WITNESS_REPORT_POSITION() = "0x0bfef7fab55bff28"

//INFO: 
//PARAM NOTES:
//PURPOSE: Set the position the law enforcement uses as the location to report crimes, if witnessing is enabled.
NATIVE PROC SET_LAW_WITNESS_REPORT_POSITION(VECTOR pos) = "0x5f5730160d6a0beb"
