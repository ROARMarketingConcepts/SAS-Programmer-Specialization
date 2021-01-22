proc sort data=cr.employee_current out=emp_sort;
	by Department;
run;

data dept_salary;
	set emp_sort;
	by Department;
	if first.Department then do;
		TotalDeptSalary=0;
		LowSalaryJob=JobTitle;
	end;
	TotalDeptSalary+Salary;
	if last.department then do;
		HighSalaryJob=JobTitle;
	end;
	keep Department TotalDeptSalary HighSalaryJob LowSalaryJob;
	format TotalDeptSalary dollar12.;
run;

/* Correct code */

proc sort data=cr.employee_current out=emp_sort;
    by Department Salary;
run;

data dept_salary;
    set emp_sort;
    retain LowSalaryJob; /*Have to retain the LowSalaryJob value until the next Department */
    by Department;
    if first.Department then do;
        TotalDeptSalary=0;
        LowSalaryJob=JobTitle;
    end;
    TotalDeptSalary+Salary;
    if last.department then do;
        HighSalaryJob=JobTitle;
        output;
    end;
    keep Department TotalDeptSalary HighSalaryJob LowSalaryJob;
    format TotalDeptSalary dollar12.;
run;