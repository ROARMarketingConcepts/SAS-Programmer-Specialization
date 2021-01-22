
proc import datafile="/folders/myfolders/EPG194/data/np_traffic.csv"
	   dbms=csv out=traffic replace;
	   guessingrows=max;    /* Resolve truncation of column values */
run; 

proc contents data=traffic;
run;
