/* Write a new program to do the following: 								*/
/*  																		*/
/* 1. Merge the cr.employee and cr.employee_addresses tables  				*/
/*    to create a new table named emp_full. 								*/
/* 2. Include all rows from the cr.employee table in the emp_full table. 	*/
/* 3. Ensure that the emp_full table is ordered by EmpID. 					*/

proc print data=cr.employee;
run;

proc print data=cr.employee_addresses;
run;

proc sort data=cr.employee_addresses out=employee_addresses;
	by Employee_ID;
run;

data emp_full;
	merge cr.employee (in=e) employee_addresses (rename=(Employee_ID=EmpID));
	by EmpID;
	if e;
run;
	