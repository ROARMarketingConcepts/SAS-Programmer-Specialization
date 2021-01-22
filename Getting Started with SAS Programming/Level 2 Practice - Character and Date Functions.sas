data eu_occ_total;
	set pg1.eu_occ;	
	*Add assignment statements;
	*Extract year and month from YearMon which is a character variable;
	Year = input(substr(YearMon,1,4),4.);
	Month = input(substr(YearMon,6,2),2.);
	ReportDate = mdy(Month,1,Year);
	Total = sum(Hotel,ShortStay,Camp);
	format ReportDate YYMON.;
run;