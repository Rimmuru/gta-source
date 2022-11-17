
#IF IS_DEBUG_BUILD

//INFO:
//PARAM NOTES:
//PURPOSE: Loads an XML file 
NATIVE FUNC BOOL LOAD_XML_FILE (STRING sFileName) = "0x7308c3e9c183d6c0"

//INFO:
//PARAM NOTES:
//PURPOSE: Deletes the loaded XML file
NATIVE PROC DELETE_XML_FILE() = "0x0bd0e389aee58784"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the number of XML nodes in an XML node tree
NATIVE FUNC INT GET_NUMBER_OF_XML_NODES () = "0x5fad86215aac9ea2"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the next node in an XML node tree  
NATIVE PROC  GET_NEXT_XML_NODE () = "0x21079b91ee2d85f2"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the name of the XML node
NATIVE FUNC STRING GET_XML_NODE_NAME () = "0xf9963e233c5e633e"

//INFO: Note it will return a string irrespective of the type of data.
//Need an attribute to define the data type. 
//PARAM NOTES: 
//PURPOSE: Gets the string value of the XML node. More info
NATIVE FUNC STRING GET_STRING_FROM_XML_NODE () = "0x587b900010500f5b"

//INFO:
//PARAM NOTES:
//PURPOSE: Gets the number of attributes for an XML node
NATIVE FUNC INT GET_NUMBER_OF_XML_NODE_ATTRIBUTES () = "0x41f2cfe090a1a1db"

//INFO:
//PARAM NOTES:  iAttribute does not reflect the attribute order in the XML file
//PURPOSE: Gets the Name of attributes for a XML node. 
NATIVE FUNC STRING GET_XML_NODE_ATTRIBUTE_NAME (int iAttribute) = "0x8a56188e381d0998"

//INFO: INT (Note: will return 0 if attribute is a string) 
//PARAM NOTES:  iAttribute does not reflect the attribute order.
//PURPOSE: Gets the int value of an XML attribute. 
NATIVE FUNC INT GET_INT_FROM_XML_NODE_ATTRIBUTE (int iAttribute) = "0x6bad273237de4c31"

//INFO: (Note: will return 0.0 if attribute is a string) 
//PARAM NOTES: iAttribute (Does not reflect the attribute order)
//PURPOSE: Gets the float value of an XML attribute. 
NATIVE FUNC FLOAT GET_FLOAT_FROM_XML_NODE_ATTRIBUTE (int iAttribute) = "0x14765a123105f84a"

//INFO:  FLOAT (Note: will return 0 if attribute is a string) 
//PARAM NOTES: iAttribute does not reflect the attribute order
//PURPOSE: Gets the bool value of an XML attribute. 
NATIVE FUNC BOOL GET_BOOL_FROM_XML_NODE_ATTRIBUTE (int iAttribute) = "0x6306cd55f1405357"

//INFO:
//PARAM NOTES: iAttribute does not reflect the attribute order.
//PURPOSE: Gets the string value of an XML attribute.
NATIVE FUNC STRING GET_STRING_FROM_XML_NODE_ATTRIBUTE (int iAttribute) = "0xcf604d18b5efa5d9"

//INFO:
//PARAM NOTES: iAttribute does not reflect the attribute order.
//PURPOSE: Gets the string value of an XML attribute.
NATIVE FUNC BOOL  GET_XML_NAMED_NODE (string mynode) = "0x17e1549cfee24ed6"

//INFO: You can only ever have one query active at any one point
//PARAM NOTES: REST interface query string. https://rsgedibgs1.rockstar.t2.corp:8443/BugstarRestService-1.0/rest/ will be prefixed to your query so you don't need
//				to include this in your query string 
//PURPOSE: Send a query to the Bugstar REST interface
NATIVE PROC START_BUGSTAR_QUERY (string query) = "0x0e1e1bbdc37a34dd"

//PURPOSE: For longer Bugstar query strings, call START_BUGSTAR_QUERY_APPEND, then a series of ADD_BUGSTAR_QUERY_STRING calls, followed by STOP_BUGSTAR_QUERY_APPEND
NATIVE PROC START_BUGSTAR_QUERY_APPEND() = "0xb45235d37b79e86b"

//PURPOSE: For longer Bugstar query strings, call START_BUGSTAR_QUERY_APPEND, then a series of ADD_BUGSTAR_QUERY_STRING calls, followed by STOP_BUGSTAR_QUERY_APPEND
NATIVE PROC ADD_BUGSTAR_QUERY_STRING(STRING QueryStringToAppend) = "0x09a683fe4e043ff3"

//PURPOSE: For longer Bugstar query strings, call START_BUGSTAR_QUERY_APPEND, then a series of ADD_BUGSTAR_QUERY_STRING calls, followed by STOP_BUGSTAR_QUERY_APPEND
NATIVE PROC STOP_BUGSTAR_QUERY_APPEND() = "0x76d2065d217e0ef4"

//INFO:
//PARAM NOTES: 
//PURPOSE: Return if a bugstar query is still pending
NATIVE FUNC BOOL  IS_BUGSTAR_QUERY_PENDING () = "0x4ebd295719063987"

//INFO:
//PARAM NOTES: 
//PURPOSE: Return if a bugstar query was successful
NATIVE FUNC BOOL  IS_BUGSTAR_QUERY_SUCCESSFUL () = "0xed5ea3222ddbfb65"

//INFO: Once this has been called a new bugstar query can be started. You will need to call DELETE_XML_FILE once you have finished with the XML this function creates
//PARAM NOTES: 
//PURPOSE: Create XML tree from a successful bugstar query. 
NATIVE FUNC BOOL  CREATE_XML_FROM_BUGSTAR_QUERY () = "0xc128000fc02572f2"

//INFO: 
//PARAM NOTES:  
//PURPOSE: End a bugstar query
NATIVE PROC END_BUGSTAR_QUERY () = "0xf7417c99b0730709"

#ENDIF	//	IS_DEBUG_BUILD


