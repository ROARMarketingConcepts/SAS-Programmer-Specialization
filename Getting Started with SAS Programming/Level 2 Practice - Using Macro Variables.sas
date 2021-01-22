/* Open a new program window and write a PROC FREQ step to analyze rows  */
/* from pg1.np_species. Generate frequency tables for Abundance and  */
/* Conservation_Status. */

%LET ParkCode = ZION;
%LET SpeciesCat = Bird;

proc freq data=pg1.np_species;
	tables Abundance Conservation_Status;
		
/* 	In the PROC FREQ output, include only rows where Species_ID  */
/* 	starts with YOSE (Yosemite National Park) and Category equals Mammal. */

	where Species_ID like "&ParkCode%" and Category = "&SpeciesCat";
	run;
	
/* Write a PROC PRINT step to list the same subset of rows from pg1.np_species. */
/* Include Species_ID, Category, Scientific_Name, and Common_Names in the report. */

proc print data=pg1.np_species;
	where Species_ID like "&ParkCode%" and Category = "&SpeciesCat";
	var Species_ID Category Scientific_Name Common_Names;
run;