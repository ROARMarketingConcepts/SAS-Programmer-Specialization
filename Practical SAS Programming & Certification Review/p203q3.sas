data emp_new;
	set cr.employee_new;
	EmpID=substr(EmpID, 4);
	HireDate=input(HireDate, date9.);
	Salary=input(AnnualSalary, 12.);
run;	

/* Correct code */

data emp_new;
	  set cr.employee_new(rename=(HireDate=HireDateC));
	  EmpID=substr(EmpID,4);
	  HireDate=input(HireDateC, anydtdte10.);
	  Salary=input(AnnualSalary, dollar10.);
	  drop HireDateC;
run;
	