/* Write and submit a program to do the following: 						*/
/*  																	*/
/* Calculate summary statistics for the cr.employee table. 				*/
/* Subset the rows to include only the Sales Department. 				*/
/* Calculate the sum, mean, minimum, and maximum of Salary  			*/
/* for each value of JobTitle. Round values to the nearest whole number.*/

data employee_modified;
	set cr.employee;
	where Department="Sales";
	keep JobTitle Salary;
run;

proc sort data=employee_modified out=employee_modified_sorted;
	by JobTitle;
run;

proc means data=employee_modified_sorted sum mean min max maxdec=0;
    by JobTitle;
run;
