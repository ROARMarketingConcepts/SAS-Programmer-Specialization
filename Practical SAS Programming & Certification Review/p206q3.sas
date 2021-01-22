/* Modify the program to do the following:  								*/
/*  																		*/
/* 1. Income begins as 50,000,000. Increase Income by 1% each year. 		*/
/* 2. Add a column named Year that will store the DO loop iteration number. */
/* 3. Change the DO loop so that it stops when TotalCost exceeds Income. 	*/



data income_expenses;
	Wages=12874000;
	Retire=1765000;
	Medical=649000;
	Income=50000000;

	do until(TotalCost>Income);
		Income=Income*1.01;
		Wages=Wages*1.06;
		Retire=Retire*1.014;
		Medical=Medical *1.095;
		TotalCost=sum(Wages, Retire, Medical);
		output;
	end;
	keep Year TotalCost Income;
	format TotalCost Income comma12.;
run;