***********************************************************;
*  Open and review the pg1.np_largeparks table. Notice	   ;
*  that there are exact duplicate rows for some parks.     ;
*														   ;
*	a) Open a new program and write a PROC SORT step that  ;
*      creates two tables (park_clean and park_dups), and  ;
*      removes the duplicate rows.    					   ; 	
*														   ;	
*   b) Submit the program and view the output data. How    ;
*      many rows are included in the park_dups table?      ;
*  														   ;	
***********************************************************;

proc sort data=PG1.np_largeparks out=park_clean noduprecs
	dupout=park_dups;
	by descending AreaName;
	
run;

