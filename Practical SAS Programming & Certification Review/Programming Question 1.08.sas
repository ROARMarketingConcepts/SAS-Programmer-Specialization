proc sort data=cr.employee_raw out=emp_sort nodupkey;
	by _all_; 	
run;

/* In your program, write and submit a procedure step to  */
/* read the emp_sort table and create a listing of all  */
/* employees with a JobTitle that includes Logistics. */

proc print data=emp_sort;
    where JobTitle like '%Logistics%';
    format HireDate year.;
run;

/* What is the average salary for employees with a hire date  */
/* on or after January 1, 2010, and a missing value for TermDate? */

proc means data=emp_sort;
    where HireDate >= '01JAN2010'd and TermDate is missing;
    var Salary;
run;

/* What is the third highest salary among all employees?  */

proc sort data=emp_sort;
    by descending Salary;
run;