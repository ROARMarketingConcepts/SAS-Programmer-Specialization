options validvarname=v7;
libname xl xlsx "&path/employee.xlsx";
proc contents data=xl._all_;
run;
