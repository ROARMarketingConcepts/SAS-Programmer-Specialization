proc import datafile="&path/payroll.csv" 
	out=payroll 
	dbms=csv 
	replace;
    guessingrows=max;
run;

proc contents data=payroll;
run;