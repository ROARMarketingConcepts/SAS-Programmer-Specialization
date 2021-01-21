/*  											*/
/* 				TSA Case Study 					*/
/*  											*/
/* 					Ken Wood 					*/
/* 				January 18, 2021 				*/
/*												*/
/************************************************/



/* Import the TSA csv file into SAS... */
libname tsa '/folders/myfolders/ECRB94/data/tsa';

proc import datafile="/folders/myfolders/ECRB94/data/TSAClaims2002_2017.csv"
	out=tsa.claims (drop=City County)
	dbms=csv
	replace;
 	guessingrows=30000; /* Look at first 2000 rows to determine column data types */
run;

/* Get rid of duplicate rows */

proc sort data=tsa.claims out=claims_cleaned nodupkey;
	by _all_; 
run;

/* Replace missing and ‘-‘ values in the columns Claim_Type,  */
/* Claim_Site, and Disposition with "Unknown". */
/* Set up Date_Issues and Incident_Year variables */

data claims_cleaned;
	format Disposition $30. Close_Amount dollar8.2;
	format Incident_Date Received_Date date9.;
	format State $4. StateName $15.;
	set claims_cleaned;
	if missing(Claim_Type) or Claim_Type="-" then Claim_Type="Unknown";
	if findw(Claim_Type,"Property Damage") then Claim_Type="Property Damage";
	if missing(Claim_Site) or Claim_Site="-" then Claim_Site="Unknown";
	if findw(Disposition,"Contract") then Disposition="Closed:Contractor Claim";
	if findw(Disposition,"Closed:Contract") then Disposition="Closed:Contractor Claim";
	if findw(Disposition,"Closed: Cancele") then Disposition="Closed:Canceled";	
	if missing(Disposition) or Disposition="-" then Disposition="Unknown";
	if missing(Incident_Date) or missing(Date_Received) then Date_Issues="Needs Review";
	if Incident_Date>Date_Received then Date_Issues="Needs Review";
	if year(Incident_Date) < 2002 or year(Incident_Date) > 2017 then Date_Issues="Needs Review"; 
	if year(Date_Received) < 2002 or year(Date_Received) > 2017 then Date_Issues="Needs Review";
	Incident_Year=year(Incident_Date);
	StateName=propcase(StateName);
	where State="HI";
	*where Claim_Site="Checkpoint";
	*where Disposition="Approve in Full" and State="HI";
run;

proc sort data=claims_cleaned out=claims_cleaned;
	by Close_Amount;
	where Date_Issues is null;
run;

proc means data=claims_cleaned;
run;

proc sort data=claims_cleaned out=claims_cleaned;
	by Claim_Type;
run;

proc freq data=claims_cleaned;
	by Claim_Type;
	table State ;
run;