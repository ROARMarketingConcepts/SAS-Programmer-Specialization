/* Create a numeric format named BMIRANGE that assigns  */
/* the following ranges and labels. 					*/
/*  													*/
/* Range				Label 							*/
/* less than 18.5		Underweight 					*/
/* 18.5 to 24.9			Normal 							*/
/* 25 to 29.9			Overweight 						*/
/* 30 or more			Obese 							*/
/*  													*/
/* Create a frequency report based on the BMI column  	*/
/* in the sashelp.bmimen table. Include rows where Age  */
/* is greater than or equal to 21. Apply the BMIRANGE 	*/
/* format to the BMI column. 							*/

/* Read in the bmicatdata file */

proc import datafile="/folders/myfolders/ECRB94/data/bmicatdata.csv"
	out=bmicatdata
	dbms=csv
	replace;
run;

/* Create and invoke the format table "bmirange" */

data bmirange;
	retain FmtName "bmirange";
	set bmicatdata(rename=(low=Start high=End Category=Label));
	keep FmtName Start End Label;
run;

proc format cntlin=bmirange;
run;

proc sort data=sashelp.bmimen out=bmi_sort(drop=Age);
	where Age>=21;
	by bmi;
	format bmi bmirange.;
run;

proc freq data=bmi_sort;
run;
	