data alive (drop=DeathCause AgeAtDeath Status) dead (drop=Status);
	set sashelp.heart;
	if Status="Alive" then output alive;
	else if Status="Dead" then output dead;
run;


proc print data=sashelp.heart (obs=10);
run;