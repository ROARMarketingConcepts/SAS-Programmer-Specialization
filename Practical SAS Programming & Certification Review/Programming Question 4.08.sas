/*Write a new program to do the following: 

1. Read the sashelp.baseball table and create a new table named outfield.
2. Filter rows to include only players where the second letter of Position is F.
3. Create a new column named Player that rearranges the value in the Name 
   column so that first name is first and then last name separated by a space.
4. Compute a new column named BatAvg as nHits divided by nAtBat. 
   Round the calculated value to three decimal places.
5. Sort the outfield table by descending BatAvg.																			*/

data outfield;
	set sashelp.baseball;
	where Position like "_F%";
	Player=catx(" ",scan(Name,2,","),scan(Name,1,","));
	BatAvg=round(nHits/nAtBat,.001);
run;

proc sort data=outfield;
	by descending BatAvg;
run;

