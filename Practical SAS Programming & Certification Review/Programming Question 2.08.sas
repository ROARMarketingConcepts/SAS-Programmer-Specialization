/* Write and submit a program to do the following: 						*/
/*  																	*/
/* 1. Use PROC MEANS to read cr.employee and create a summary table  	*/
/*    named salary_summary. Do not create a report. 					*/
/* 2. Compute statistics for Salary based on the values of  			*/
/*    Department and City. 												*/
/* 3. In the output table, include a column named TotalSalary  			*/
/*    that is the sum of Salary and a column named AvgSalary  			*/
/*    that is the mean of Salary. 										*/
/* 4. In the output table, include one row for each unique combination  */
/*    of Department and City. 											*/

proc means data=cr.employee noprint;
    var Salary;
    class Department City;
    output out=salary_summary mean=AvgSalary sum=TotalSalary;
    ways 2;
run;
