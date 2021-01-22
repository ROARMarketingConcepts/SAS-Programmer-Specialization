/* Write a new program to do the following:  									*/
/*  																			*/
/* 1. Read the sashelp.fish table and create a new temporary table named fish. 	*/
/* 2. Compute a new column named Length that is the mean of Length1 through  	*/
/*    Length3. Round the stored values to the nearest hundredth. 				*/
/* 3. Create a summary report that calculates the average of Length for  		*/
/*    each value of Species. Round the average to two decimal places. 			*/
/*																				*/

data fish;
	set sashelp.fish;
	Length=round(mean(of Length1-Length3),.01);
run;

proc sort data=fish out=fish_sorted;
	by Species;
run;

proc means data=fish_sorted (keep=Species Length);
	by Species;
run;