***********************************************************;
*  LESSON 3, PRACTICE 3                                   *;
*  a) The program contains a PROC SORT step that creates  *;
*     the WINTER2015_2016 table. This table contains rows *;
*     with dates with some snowfall between October 1,    *;
*     2015, and April 1, 2016, sorted by Code and Date.   *;
*     Only the Name, Code, Date, and Snow columns are     *;
*     kept.                                               *;
*  b) Modify the DATA step to create the SNOWFORECAST     *;
*     table based on the following specifications:        *;
*     1) Process the data in groups by Code.              *;
*     2) For the first row within each Code group, create *;
*        a new column named FirstSnow that is the date of *;
*        the first snowfall for that code.                *;
*     3) For the last row within each Code group, do the  *;
*        following:                                       *;
*        a) Create a new column named LastSnow that is    *;
*           the date of the first snowfall for that code. *;
*        b) Create a new column named WinterLengthWeeks   *;
*           that counts the number of full weeks between  *;
*           the FirstSnow and LastSnow dates.             *;
*        c) Create a new column named ProjectedFirstSnow  *;
*           that is the same day of the first snowfall    *;
*           for the next year.                            *;
*        d) Output the row to the new table.              *;
*     4) Apply the DATE7. format to the FirstSnow,        *;
*        LastSnow, and ProjectedFirstSnow columns and     *;
*        drop the Date and Snow columns.                  *;
***********************************************************;

proc sort data=pg2.np_weather(keep=Name Code Date Snow)
		  out=winter2015_2016;
	where date between '01Oct15'd and '01Jun16'd and Snow > 0;
	by Code Date;
run;

data snowforecast;
	set winter2015_2016;
	
run;
