**************************************************;
*  LESSON 7, PRACTICE 3                          *;
**************************************************;

data np_lodge_stack;
	set pg2.np_lodging_array;
	keep ParkName Year Stays;
	format Stays comma12.;
	Year=2015;
	Stays=Lodge2015;
	output;
	Year=2016;
	Stays=Lodge2016;
	output;
	Year=2017;
	Stays=Lodge2017;
	output;
run;
