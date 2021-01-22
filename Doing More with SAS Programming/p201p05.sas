***********************************************************;
*  LESSON 1, PRACTICE 5                                   *;
*  b) Use SAS Help or online documentation to read about  *;
*     using SELECT and WHEN statements in the DATA step.  *;
*  c) Modify the Practice 3 program to use SELECT groups  *;
*     and WHEN statements.                                *;
***********************************************************;

/* Practice 3 program */
data monument(drop=ParkType) park(drop=ParkType) other;
	set pg2.np_yearlytraffic;
	if ParkType = 'National Monument' then output monument;
	else if ParkType = 'National Park' then output park;
	else output other;
	drop Region;
run;
