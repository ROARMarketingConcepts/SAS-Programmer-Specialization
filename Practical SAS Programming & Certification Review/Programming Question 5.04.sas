/*  Write a new program to do the following: 										*/
/*  																				*/
/* 1. Read the cr.shoes_summary table and create a new table named shoes_future. 	*/
/* 2. For every row read from the input table, write five rows to the output table. */
/*    Create a column named Year that will be 1 through 5 for the five rows. 		*/
/* 3. For each year, increase ProfitPerStore by 3%.									*/
/* 4. Drop the TotalStores and TotalProfit columns. 								*/

data shoes_future;
	set cr.shoes_summary;
	do Year= 1 to 5;
		ProfitPerStore=ProfitPerStore*1.03;
		output;
	end;
	drop TotalStores TotalProfit;
run;