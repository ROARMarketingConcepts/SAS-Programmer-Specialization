/* Write a new program that uses PROC EXPORT to export  */
/* cr.employee_current to the output folder as a comma- */
/* delimited file. */


proc export data=cr.employee_current outfile="&outpath/employee_current.csv";
run;