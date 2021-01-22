***********************************************************;
*  LESSON 6, PRACTICE 3                                   *;
*  b) Add a DO loop to the DATA step to produce the       *;
*     following results. The Weight value is increasing   *;
*     by four pounds per quarter.                         *;
***********************************************************;

data IncWt;
    set sashelp.class;
    where Sex='F' and Age=13;

run;

title 'Projected Weight for Females (Age 13)';
proc print data=IncWt;
    var Name Weight Quarter;
run;
title;
