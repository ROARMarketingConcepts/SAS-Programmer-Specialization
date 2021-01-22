title "Baseball Team Statistics";
proc print data=baseball_sorted label;
	by Team;
	id Name;
	var Position YrMajor nAtBat nHits nHome;
	label YrMajor="Years in the Major Leagues";
	sum nAtBat nHits nHome;
run;
title;

proc sort data=sashelp.baseball out=baseball_sorted;
	by Team Name;
run;