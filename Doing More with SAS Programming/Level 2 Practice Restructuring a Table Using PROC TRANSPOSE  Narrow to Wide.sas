proc print data=pg2.np_2016camping (obs=10);
run;

proc transpose data=pg2.np_2016camping 
		out=work.camping2016_t(drop=_name_);
	by ParkName;
	id CampType;
	var CampCount;
run;
