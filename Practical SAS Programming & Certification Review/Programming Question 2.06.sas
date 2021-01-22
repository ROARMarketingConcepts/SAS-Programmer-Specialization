/* Write and submit a program to do the following: 						*/
/*  																	*/
/* 1. Analyze frequency counts for the cr.profit table. 				*/
/* 2. Create a two-way frequency table that includes the  				*/
/*    frequency count and percent for each Order_Date and Order_Source. */
/* 3. Display Order_Date using the MONNAME format so there is one row  	*/
/*    per month in the table. */

data profit_modified;
	set cr.profit;
	keep Order_Date Order_Source;
	format Order_Date monname.;
run;

proc sort data=profit_modified out=profit_modified_sorted;
    by Order_Date Order_Source;
run;

proc freq data=profit_modified_sorted;
	tables Order_Date*Order_Source / nocol nocum norow;		
run;
