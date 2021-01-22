**************************************************;
*  LESSON 7, PRACTICE 6                          *;
**************************************************;

proc sort data=pg2.weather_highlow out=sort_highlow;
	by Location;
run;


