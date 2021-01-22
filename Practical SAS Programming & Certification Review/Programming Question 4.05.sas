/* Write a new program to do the following:  				*/
/*  														*/
/* 1. Read the sashelp.shoes table and create a 			*/
/*    new table named highlow. 								*/
/* 2. The highlow table should include one row 				*/
/*	  for the lowest value of Sales for each Product 		*/
/*    value, and another row for the highest value of 		*/
/*    Sales for each Product value. 						*/
/* 3. Create a column named HighLow that includes the 		*/
/*    value High or Low depending on the value of Sales.    */
/*  														*/
proc sort data=sashelp.shoes out=shoes_sorted;
	by Product Sales;
run;

data highlow;
	set shoes_sorted (keep=Region Subsidiary Product Sales);
	by Product;
	format HighLow $6.;

	if first.Product then
		do;
		HighLow="Low";
			output;
		end;

	if last.Product then
		do;
		HighLow="High";
			output;
		end;
run;