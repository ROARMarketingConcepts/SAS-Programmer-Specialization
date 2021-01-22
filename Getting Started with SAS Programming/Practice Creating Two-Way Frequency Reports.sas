ods graphics on;
proc freq data=pg1.np_codelookup order=freq;
	tables Type*Region / nocol nopercent;
	where Type not like '%Other%';
title "Park Types by Region";
run;
title;


title1 'Selected Park Types by Region';
ods graphics on;
proc freq data=pg1.np_codelookup order=freq;
    tables Type*Region /  nocol crosslist 
           plots=freqplot(groupby=row scale=grouppercent orient=horizontal);
    where Type in ('National Historic Site', 'National Monument', 'National Park');
run;
title;