/* Write a program to do the following: 								*/
/*  																	*/
/* 1. Concatenate the cr.m7_sales, cr.m8_sales, and cr.m9_sales tables  */
/*    to create a new table named q3_sales. 							*/
/* 2. Ensure that values in similar columns with different names are  	*/
/*    in a single column in the new table. 								*/
/* 3. Create a frequency report that counts the number of orders for  	*/
/*    each value of Order_Type. 										*/

proc print data=cr.m8_sales;
run;


data q3_sales;
	set cr.m7_sales cr.m8_sales (rename=(Employee_ID=EmpID)) cr.m9_sales;
run;

proc sort data=q3_sales out=q3_sales_sorted;
	by Order_Type;
run;

proc freq data=q3_sales_sorted;
	tables Order_Type;
run;