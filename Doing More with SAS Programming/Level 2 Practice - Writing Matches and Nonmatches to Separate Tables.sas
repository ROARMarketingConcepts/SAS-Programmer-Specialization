proc sort data=pg2.np_2016;
	by ParkCode;
run;

proc sort data=pg2.np_codelookup;
	by ParkCode;
run;

/* Common columns are ParkCode, Region, Type(ParkType) */

data work.parkStats(keep=ParkCode ParkName Year Month DayVisits) 
	work.parkOther(keep=ParkCode ParkName);
	merge pg2.np_2016(in=in2016) pg2.np_codelookup(in=inLookup);
	by ParkCode;
	if in2016=1 then output work.parkStats;
	else output work.parkOther;
run;

	