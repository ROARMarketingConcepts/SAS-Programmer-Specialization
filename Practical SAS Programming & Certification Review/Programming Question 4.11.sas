/* Write a new program to do the following: 							*/
/*  																	*/
/* 1. Use the cr.continent_codes table to create a numeric  			*/
/*    format named CONTFMT. The Code column contains data values,  		*/
/*    and the Continent column contains labels. 						*/
/* 2. Read the cr.demographics table and compute the sum of the  		*/
/*    Pop column for each value of Cont. Apply the CONTFMT format  		*/
/*    to the Cont column. Note: If you don't have the cr.demograhics 	*/
/*    table, copy and paste this code into a new program window and  	*/
/*    run it to create the table. 										*/

/* Create and invoke the format table "contfmt" */

data contfmt;
	retain FmtName "contfmt";
	set cr.continent_codes (rename=(Code=Start Continent=Label));
	keep FmtName Start Label;
run;

proc format cntlin=contfmt;
run;

proc sort data=cr.demographics out=demographics_sort;
	by Cont;
	format Cont contfmt.;
run;

proc means data=demographics_sort sum n;
	by Cont;
	var Cont Pop;
run;

/* Another solution... */

data continentfmt;
    set cr.continent_codes;
    retain fmtname "contfmt";
    Start=Code;
    Label=Continent;
run;

proc format cntlin=continentfmt;
run;

proc means data=cr.demographics sum maxdec=0;
    var pop;
    class cont;
    format cont contfmt.;
run;
	