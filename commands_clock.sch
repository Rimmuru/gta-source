//Template for script commands
//INFO:
//PARAM NOTES:
//PURPOSE:

ENUM TIME_SAMPLE
	TS_NIGHT = 0,
	TS_MORNING,
	TS_AFTERNOON,
	TS_EVENING
ENDENUM

ENUM MONTH_OF_YEAR
	JANUARY = 0,
	FEBRUARY,
	MARCH,
	APRIL,
	MAY,
	JUNE,
	JULY,
	AUGUST,
	SEPTEMBER,
	OCTOBER,
	NOVEMBER,
	DECEMBER
ENDENUM

ENUM DAY_OF_WEEK
	SUNDAY = 0,
	MONDAY,
	TUESDAY,
	WEDNESDAY,
	THURSDAY,
	FRIDAY,
	SATURDAY
ENDENUM


//INFO: this is a fixed clock mode only function 
//PARAM NOTES:
//PURPOSE: sets a specific time sample in fixed clock mode
NATIVE PROC SET_CLOCK_TIME_SAMPLE(TIME_SAMPLE timeSample) = "0xc3c632ebdc61bd08"

//INFO:
//PARAM NOTES: (h 0-23, m 0-59, s 0-59)
//PURPOSE: sets the clock to a specific time
NATIVE PROC SET_CLOCK_TIME(INT h, INT m, INT s) = "0xaa27c85e5be092aa"

// INFO:
//PARAM NOTES:
//PURPOSE: pause the game clock.  Use this instead of SET_CLOCK_TIME every frame.
NATIVE PROC PAUSE_CLOCK(BOOL pause) = "0xbc9595cb59db2217"

//INFO: if the new time is before the current time a day will pass on the date
//PARAM NOTES:
//PURPOSE: advances the current time to the time specified
NATIVE PROC ADVANCE_CLOCK_TIME_TO(INT h, INT m, INT s) = "0x642ca1dd83a8a0a9"

//INFO:
//PARAM NOTES: can be negative and out of the normal range e.g. 
//             (22, 2, 1) - will add 22 hours 2 minutes and 1 second to the time
//             (-22, 2, -1) - will take 22 hours and a second from the time and add 2 minute
//             (100, 0, -200) - will add 100 hours to the time and subtract 200 seconds
//PURPOSE: adds the passed in time to the current time
NATIVE PROC ADD_TO_CLOCK_TIME(INT h, INT m, INT s) = "0xb60bfb8af972b257"

//INFO:
//PARAM NOTES:
//PURPOSE: Works in a similar way to ADD_TO_CLOCK_TIME but doesn't change the game's actual clock
NATIVE PROC SIMULATE_ADD_TO_CLOCK_TIME(int numHours, int numMinutes, int numSeconds, 
								   int &ReturnYear, MONTH_OF_YEAR &ReturnMonth, int &ReturnDay, 
								   int &ReturnHour, int &ReturnMinute, int &ReturnSecond,
								   DAY_OF_WEEK &ReturnDayOfWeek) = "0xd5eaff55e354b01d"

//INFO:
//PARAM NOTES:
//PURPOSE: gets the current number of hours on the clock
NATIVE FUNC INT GET_CLOCK_HOURS() = "0x09fc827691dace59"

//INFO:
//PARAM NOTES:
//PURPOSE: gets the current number of minutes on the clock
NATIVE FUNC INT GET_CLOCK_MINUTES() = "0x80f97d7d29800a1a"

//INFO:
//PARAM NOTES:
//PURPOSE: gets the current number of seconds on the clock
NATIVE FUNC INT GET_CLOCK_SECONDS() = "0xaa2844cad88768b5"

//INFO:
//PARAM NOTES: the month is specified in the range 0-11 (0 is January, 11 is December)
//PURPOSE: sets the date to d/m/y 
NATIVE PROC SET_CLOCK_DATE(INT d, MONTH_OF_YEAR m, INT y) = "0xf9352288b8dec888"

//INFO:
//PARAM NOTES:
//PURPOSE: gets the current day of the week (0 is sunday, 6 is saturday)
NATIVE FUNC DAY_OF_WEEK GET_CLOCK_DAY_OF_WEEK() = "0x4bfee961f7bc72b6"

//INFO:
//PARAM NOTES:
//PURPOSE: gets the current day of the month (1-31)
NATIVE FUNC INT GET_CLOCK_DAY_OF_MONTH() = "0xd52bd97e61483713"

//INFO:
//PARAM NOTES:
//PURPOSE: gets the current month (0 is January, 11 is December)
NATIVE FUNC MONTH_OF_YEAR GET_CLOCK_MONTH() = "0x771485043fdc55de"

//INFO:
//PARAM NOTES:
//PURPOSE: gets the current year e.g. 2009
NATIVE FUNC INT GET_CLOCK_YEAR() = "0x1137fd08b8d3f874"

//PURPOSE: returns the number of real world milliseconds in one game minute
NATIVE FUNC INT GET_MILLISECONDS_PER_GAME_MINUTE() = "0x4854cc9bef210e7c"

//INFO:
//PARAM NOTES:
//PURPOSE: Get a reliable time on xbox/ps3. Expressed as UTC (or GMT timezone).
//           year - years since 1900
//           mon  - months since January	 (1-12)
//           day  - day of the month	     (1-31)
//           hour - hours since midnight	 (0-23)
//           min  - minutes after the hour   (1-60)
//           sec  - seconds after the minute (0-61)
NATIVE PROC GET_POSIX_TIME(INT &year, INT &month, INT &day, INT &hour, INT &min, INT &sec) = "0xa7f20303a35ca1bc"

//PURPOSE: Same as GET_POSIX_TIME but for British Summer Time.
NATIVE PROC GET_BST_TIME(INT &year, INT &month, INT &day, INT &hour, INT &min, INT &sec) = "0xda27a7b28d93cc45"

//PURPOSE: Same as GET_POSIX_TIME but for UTC.
NATIVE PROC GET_UTC_TIME(INT &year, INT &month, INT &day, INT &hour, INT &min, INT &sec) = "0x735e0c24346de543"

//INFO:
//PARAM NOTES:
//PURPOSE: Get the local time on xbox/ps3.
NATIVE PROC GET_LOCAL_TIME(INT &year, INT &month, INT &day, INT &hour, INT &min, INT &sec) = "0x0ef5eeafca4d8956"


