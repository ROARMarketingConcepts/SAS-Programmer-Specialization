**************************************************;
*  LESSON 6, PRACTICE 6                          *;
**************************************************;

data storm_workdays;
    set pg2.storm_summary;
    where year(StartDate)=2015 and name is not missing;
    /* Add or modify code below as necessary */
    Duration=0;
    LostWork2015=0;
    do ThisDay = StartDate to EndDate;
       LostWork2015+1;      
    end;
    keep Name Basin MaxWindMPH StartDate EndDate 
         Duration LostWork2015;
run;

title1 'Work Days Lost in 2015 due to Storms';
title2 '(where started in 2015 and ended in 2016)';
proc print data=storm_workdays;
    where year(StartDate) ne year(EndDate);
run;
title;



