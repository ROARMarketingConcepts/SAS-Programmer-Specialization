data work.np_combine;
    set pg2.np_2014 (rename=(Type=ParkType Park=ParkCode))
    pg2.np_2015 
    pg2.np_2016;
    CampTotal=sum(of Camping:);
    where Month in(6:8) and ParkType='National Park';
    format CampTotal comma15.;
    drop Camping:;
run;

proc sort data=work.np_combine;
	by ParkType ParkCode Year Month;
run;

proc print data=pg2.np_2014 (obs=10);
run;

proc print data=pg2.np_2015 (obs=10);
run;

proc print data=pg2.np_2016 (obs=10);
run;