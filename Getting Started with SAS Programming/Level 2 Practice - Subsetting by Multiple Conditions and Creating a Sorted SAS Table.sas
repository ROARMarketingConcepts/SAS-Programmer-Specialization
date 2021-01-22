data pg2.out_fox;
	set pg1.np_species;
	where Category = "Mammal" and Common_Names like '%Fox%'
	and Common_Names <> 'Fox Squirrel';
	drop Category Record_Status Occurrence Nativeness;
	
/* Sort the output data by the 'Column_Names' column	 */
	
proc sort data=pg2.out_fox;
	by Common_Names; 	
run;
