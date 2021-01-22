***********************************************************;
*  LESSON 3, PRACTICE 6                                   *;
*  a) Run the program. Notice that the Column1 column     *;
*     contains raw data with values separated by various  *;
*     symbols. The SCAN function is used to extract the   *;
*     ParkCode and ParkName values.                       *;
*  b) Examine the PROC CONTENTS report. Notice that       *;
*     ParkCode and ParkType have a length of 200, which   *;
*     is the same as Column1.                             *;
*     Note: When the SCAN function creates a new column,  *;
*     the new column will have the same length as the     *;
*     column listed as the first argument.                *;
*  c) The ParkCode column should include only the first   *;
*     four characters in the string. Add a LENGTH         *;
*     statement to define the length of ParkCode as 4.    *;
*  d) The length for the ParkName column can be optimized *;
*     by determining the longest string and setting an    *;
*     appropriate length. Modify the DATA step to create  *;
*     a new column named NameLength that uses the LENGTH  *;
*     function to return the position of the last         *;
*     non-blank character for each value of ParkName.     *;
*  e) Use a RETAIN statement to create a new column named *;
*     MaxLength that has an initial value of zero.        *;
*  f) Use an assignment statement and the MAX function to *;
*     set the value of MaxLength to either the current    *;
*     value of NameLength or MaxLength, whichever is      *;
*     larger.                                             *;
*  g) Use the END= option in the SET statement to create  *;
*     a temporary variable in the PDV named LastRow.      *;
*     LastRow will be zero for all rows until the last    *;
*     row of the table, when it will be 1. Add an IF-THEN *;
*     statement to write the value of MaxLength to the    *;
*     log if the value of LastRow is 1.                   *;
***********************************************************;

data parklookup;
	set pg2.np_unstructured_codes;
	ParkCode=scan(Column1, 2, '{}:,"()-');
	ParkName=scan(Column1, 4, '{}:,"()');
run;

proc print data=parklookup(obs=10);
run;

proc contents data=parklookup;
run;

