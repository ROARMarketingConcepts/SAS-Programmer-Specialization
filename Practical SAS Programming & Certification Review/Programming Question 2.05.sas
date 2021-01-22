/*  Write and submit a program to analyze the number of employees  */
/*  in the cr.employee table by City, Department, and JobTitle. */

data employee_modified;
	set cr.employee;
	keep City Department JobTitle;
run;

proc sort data=employee_modified out=employee_modified_sorted;
    by City Department Jobtitle;
run;

proc freq data=employee_modified_sorted nlevels;	
run;
