***********************************************************;
*  LESSON 5, PRACTICE 1                                   *;
*  a) Complete the SET statement to concatenate the       *;
*     PG2.NP_2015 and PG2.NP_2016 tables to create a new  *;
*     table, NP_COMBINE.                                  *;
*  b) Use a WHERE statement to include only rows where    *;
*     Month is 6, 7, or 8.                                *;
*  c) Create a new column named CampTotal that is the sum *;
*     of CampingOther, CampingTent, CampingRV, and        *;
*     CampingBackcountry. Format the new column with      *;
*     commas.                                             *;
***********************************************************;

data work.np_combine;
    set pg2.np_2015 pg2.np_2016;
    where Month in (6:8);
    CampTotal=sum(CampingOther--CampingBackcountry);
    format CampTotal commmas10.;
    drop Camping:;
run;

proc sort data=work.np_combine;
	by ParkCode;
run;

proc print data=pg2.np_2015 (obs=10);
run;

proc print data=pg2.np_2016 (obs=10);
run;