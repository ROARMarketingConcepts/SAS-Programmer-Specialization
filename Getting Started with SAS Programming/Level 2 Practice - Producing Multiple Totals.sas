data work.parktypetraffic;
    set pg2.np_yearlyTraffic;
    where ParkType in ("National Monument", "National Park");
    if ParkType = 'National Monument' then MonumentTraffic+Count;
    else ParkTraffic+Count;
    format MonumentTraffic ParkTraffic comma15.;
run;

title 'Accumulating Traffic Totals for Park Types';
proc print data=work.parktypetraffic;
    var ParkType ParkName Location Count MonumentTraffic 
        ParkTraffic;
run;
title;