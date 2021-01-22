proc print data=pg2.np_2016camping(obs=10);
run;

data work.camping_wide;
	set pg2.np_2016Camping;
	by ParkName;
	keep ParkName Tent RV Backcountry;
	retain ParkName Tent RV Backcountry;
	format Tent RV Backcountry comma12.;
	if CampType='Tent' then Tent=CampCount;
	else if CampType='RV' then RV=CampCount;
	else if CampType='Backcountry' then Backcountry=Campcount;
	if last.ParkName;
run;
