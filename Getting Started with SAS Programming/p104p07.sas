***********************************************************;
*  LESSON 4, PRACTICE 7                                   *;
*    a) Submit the program and view the generated output. *;
*    b) In the DATA step, use IF-THEN/ELSE statements to  *;
*       create a new column, ParkType, based on the value *;
*       of Type.                                          *;
*       NM -> Monument                                    *;
*       NP -> Park                                        *;
*       NPRE, PRE, or PRESERVE -> Preserve                *;
*       NS -> Seashore                                    *;
*       RVR or RIVERWAYS -> River                         *;
*    c) Modify the PROC FREQ step to generate a frequency *;
*       report for ParkType.                              *;
***********************************************************;

data park_type;
	set pg1.np_summary;
	if Type = "NM" then ParkType = "Monument";
	if Type = "NP" then ParkType = "Park";
	if Type = "NS" then ParkType = "Seashore";
	if Type in ("RVR","RIVERWAYS") then ParkType = "River";	
	if Type in ("NPRE","PRE","PRESERVE") then ParkType = "Preserve";
	
	*Add IF-THEN-ELSE statements;
run;

proc freq data=park_type;
	tables ParkType;
run;
