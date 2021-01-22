***********************************************************;
*  LESSON 4, PRACTICE 3                                   *;
*  a) Access the Base SAS 9.4 Procedures Guide. Find the  *;
*     PROC FORMAT section and the VALUE statement page.   *;
*     Scroll to the bottom of the page to look at         *;
*     examples where existing SAS formats are used for    *;
*     labels in a custom format.                          *;
*  b) Open p204p03.sas from the practices folder.         *;
*  c) Add a PROC FORMAT step to create a format named     *;
*     DECADE that categorizes dates as identified below.  *;
*     January 1, 2000 - December 31, 2009 => 2000-2009.   *;
*     January 1, 2010 - December 31, 2017 => 2010-2017.   *;
*     January 1, 2018 - March 31, 2018 => 1st Quarter 2018*;
*     April 1, 2018 and beyond => actual date value using *;
*                                 the MMDDYY10. format.   *;
*  d) Modify the PROC MEANS step so that the DECADE       *;
*     format is applied to the Date column.               *;
*  e) Run the program and review the output. Verify that  *;
*     the descriptive values for the Date column are      *;
*     displayed.                                          *;
***********************************************************;

/* Add a PROC FORMAT Step */

title1 'Precipitation and Snowfall';
title2 'Note: Amounts shown in inches';
proc means data=pg2.np_weather maxdec=2 sum mean nonobs;
    where Prcp > 0 or Snow > 0;
    var Prcp Snow;
    class Date Name;
run;
title;
