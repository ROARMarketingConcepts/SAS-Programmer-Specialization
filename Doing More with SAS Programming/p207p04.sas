**************************************************;
*  LESSON 7, PRACTICE 4                          *;
**************************************************;

proc print data=pg2.np_2017camping(obs=5);
run;

proc transpose data=pg2.np_2017camping 
		out=work.camping2017_t 	
		(rename=(Col1=Count))
		Name=Location;
	by ParkName;
	var Tent RV;
run;