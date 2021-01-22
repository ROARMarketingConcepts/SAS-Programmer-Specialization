/* Write a new program to do the following: 				*/
/*  														*/
/* 1. Read the cr.employee_training table and create a  	*/
/*    new table named training_narrow. 						*/
/* 2. Convert the wide table to a narrow table so that  	*/
/*    there is one row for each date value. 				*/
/* 3. Generate a report that counts the number of courses  	*/
/*    completed by month (Hint: Use the MONNAME. format.) 	*/

proc sort data=cr.employee_training out=employee_training;
	by Name;
	format Compliance_Training Corporate_Security On_the_Job_Safety monname.;
run;



proc transpose data=employee_training out=training_narrow(rename=(col1=Date)) 
	name=Training;
	by Name;
	var Compliance_Training Corporate_Security On_the_Job_Safety;
run;

proc sort data=training_narrow out=training_narrow_sorted;
	by Date;
run;

proc freq data=training_narrow_sorted;
	tables Date;
run;

