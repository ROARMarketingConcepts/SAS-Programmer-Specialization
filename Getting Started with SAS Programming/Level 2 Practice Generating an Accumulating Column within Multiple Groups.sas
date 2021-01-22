/* 1. Write a program to create a sorted copy of sashelp.shoes  */
/* that is ordered by Region and Product. */
/* 2. Write a DATA step to read the sorted table and create  */
/* a new table named profitsummary. */
/* 3. Create a column named Profit that is the difference  */
/* between Sales and Returns. */
/* 4. Create an accumulating column named TotalProfit that  */
/* is a running total of Profit within each value of Region and Product. */
/* 5. Reset TotalProfit for each new combination of Region and Product. */
/* 6. Submit the program and verify that TotalProfit is accurate. */

proc sort data=pg2.sashelp.shoes out=sorted_table;
	by Region Product;
run;