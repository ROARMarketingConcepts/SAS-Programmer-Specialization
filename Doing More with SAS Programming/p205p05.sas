***********************************************************;
*  LESSON 5, PRACTICE 5                                   *;
*  a) The first three steps sort and merge the            *;
*     PG2.NP_CODELOOKUP and PG2.NP_FINAL tables.          *;
*     Highlight the first two PROC SORT steps and the     *;
*     DATA step and run the selected code. Examine the    *;
*     highuse table.                                      *;
*  b) Add a subsetting IF statement in the DATA step to   *;
*     output only the rows in which DayVisits is greater  *;
*     than or equal to 5,000,000. Highlight the DATA step *;
*     and run the selected code. Why must you use IF      *;
*     instead of a WHERE statement?                       *;
*  c) Run the final PROC SORT step to sort and subset the *;
*     PG2.NP_SPECIES table. Compare the columns in the    *;
*     output birds table with the highuse table to        *;
*     determine the matching column.                      *;
*  d) Add a PROC SORT step to sort the highuse table by   *;
*     the matching column in the birds table.             *;
*  e) Add a DATA step to merge the highuse and birds      *;
*     tables and create a table named BIRDS_LARGEPARK.    *;
*     Include in the output table only ParkCode values    *;
*     that are in the highuse table.                      *;
***********************************************************;

/*Steps a and b*/
proc sort data=pg2.np_CodeLookup out=sortnames(keep=ParkName ParkCode);
	by ParkName;
run;

proc sort data=pg2.np_final out=sortfinal;
	by ParkName;
run;

data highuse(keep=ParkCode ParkName);
	merge sortfinal sortnames;
	by ParkName;
	*Add a subsetting IF statement;
run;

/*Step c*/
proc sort data=pg2.np_species
	  	  out=birds(keep=ParkCode Species_ID Scientific_Name Common_Names);
	by ParkCode Species_ID;
	where Category='Bird' and Abundance='Common';
run;

