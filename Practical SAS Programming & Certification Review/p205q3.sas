proc sort data=cr.employee(keep=EmpID Name Department) out=emp_sort;
	by EmpID;
run;

proc sort data=cr.employee_donations out=donate_sort;
	by EmpID;
run;

data donation no_donation;
	merge emp_sort(in=in_emp) donate_sort(in=in_don);
	by EmpID;

	if in_don=1 and in_emp=1 then
		do;
			TotalDonation=sum(of Qtr1-Qtr4);
			output donation;
		end;
	else
		output no_donation;
run;