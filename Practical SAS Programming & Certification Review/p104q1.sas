data holiday2019;
	set sashelp.holiday;
	where end=missing and rule=0;
	CountryCode=substr(Category,2,"_");
	Date=dmy(day, month, 2019);
	keep Desc, Country, Date;
run;

/* Corrected Code is Below... */

data holiday2019;
	set sashelp.holiday;
	where end is missing and rule=0;
	CountryCode=substr(Category,length(Category)-1,2);
	Date=mdy(month,day,2019);
	keep Desc CountryCode Date;
	*format Date date.;
run;

proc print data=sashelp.holiday (obs=10);
run;