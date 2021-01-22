proc means data=pg1.np_westweather mean min max maxdec=2;
	var Precip Snow TempMin TempMax;
	class Year Name;
	ways 2;
	title "Weather Statistics by Year and Park";
run;