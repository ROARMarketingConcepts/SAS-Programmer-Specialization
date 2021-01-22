data bonus;
	set cr.employee;
	where TermDate is missing;
	YearsEmp=yrdif(HireDate, '01jan2019'd, 'ACT/ACT');

	if YearsEmp >=10 then
		do;
			Bonus=Salary*.03;
			Vacation=20;
		end;
	else
		do;
			Bonus=Salary*.02;
			Vacation=15;
		end;
	format YearsEmp 3.2;
	format Bonus dollar8.2;
run;

proc sort data=bonus;
	by descending YearsEmp;
run;

proc freq data=bonus;
	table Vacation;
run;