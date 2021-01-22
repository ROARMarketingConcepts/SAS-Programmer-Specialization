***********************************************************;
*  LESSON 1, PRACTICE 3                                   *;
*  a) Modify the DATA step to create three tables:        *;
*     monument, park, and other. Use the value of         *;
*     ParkType as indicated above to determine which      *;
*     table the row is output to.                         *;
*  b) Drop ParkType from the monument and park tables.    *;
*     Drop Region from all three tables.                  *;
*  c) Submit the program and verify the output.           *;
***********************************************************;

data monument(drop=ParkType) park(drop=ParkType) other ;
	set pg2.np_yearlytraffic;
	drop Region;
/* 	Test if variable ParkType contains 'Monument' */
	if findw(ParkType,'Monument')>0 then output monument;
	
/* 	Test if variable ParkType contains 'Park' */
	else if findw(ParkType,'Park')>0 then output park;
	else output other;
run;
