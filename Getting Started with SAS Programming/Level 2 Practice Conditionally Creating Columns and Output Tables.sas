data camping (keep=ParkName Month DayVisits CampTotal) 
	lodging (keep=ParkName Month DayVisits LodgingOther);
	set pg2.np_2017;
	CampTotal=sum(CampingOther, CampingTent, CampingRV, CampingBackcountry);
	format CampTotal Comma8.;
	if CampTotal>0 then output camping;
	if LodgingOther>0 then output lodging;
run;