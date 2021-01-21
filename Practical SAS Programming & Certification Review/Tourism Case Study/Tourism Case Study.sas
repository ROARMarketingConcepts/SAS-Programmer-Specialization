/*************************/
/*  					 */
/* 	Tourism Case Study 	 */
/*  					 */
/* 	Ken Wood 			 */
/* 	January 21, 2021 	 */
/*						 */
/*************************/

data cleaned_tourism trash;
	set cr.tourism;
	
/* 	Create new column "Country_Name" for the country name */
	Country_Name=Country;
	if upcase(Country_Name) ne Country_Name then Country_Name="";

/* 	Cleaning up some values in the Country (Category) and Series Columns	 */
	Country=tranwrd(Country,"US$ Mn","US$");
	Country=tranwrd(Country,"- Thousands","");
	Series=tranwrd(Series,"..",.);
	_2014=tranwrd(_2014,"..",.);
	
/* 	Convert _2014 (character) to Y2014 (numeric) */
	Y2014=input(_2014, 15.);
	Y2014=Y2014*1E6;
	format Y2014 comma25.;

/* 	Create new column "Tourism_Type" */
	Tourism_Type=Country;
	if findw(Tourism_Type,"Inbound tourism") 
		then Tourism_Type="Inbound tourism";
	else if findw(Tourism_Type,"Outbound tourism") 
		then Tourism_Type="Outbound tourism";
	else Tourism_Type="";
	
/* 	Fill in the "Tourism_Type" column with the appropriate values */
	retain _Tourism_Type;
	if Tourism_Type ne "" then _Tourism_Type=Tourism_Type;
	else Tourism_Type=_Tourism_Type;
	drop _Tourism_Type;
	
/* 	Fill in the "Country_Name" column with the appropriate values */	
	retain _Country_Name;
	if Country_Name ne "" then _Country_Name=Country_Name;
	else Country_Name=_Country_Name;
	drop _Country_name A;

	
/* 	Delete rows with duplicate values in columns... */
	if Country_Name=Country then output trash;
	else if Tourism_Type=Country then output trash;
/* 	else if findw(Country,"Inbound tourism") then output trash; */
/* 	else if findw(Country_Name,"Outbound tourism") then output trash; */

/* 	Create output file */
	else output cleaned_tourism;
	
/* 	Rename the "Country" column to "Category" */
	rename Country=Category;
	rename Country_Name=Country;
run;


/* 	Move "Tourism_Type" column to front of cleaned_tourism */
data cleaned_tourism ;
  set cleaned_tourism (drop=Tourism_Type);
  set cleaned_tourism ;
run;

data cleaned_tourism;
  set cleaned_tourism (keep=Tourism_Type);
  set cleaned_tourism ;
run;

/* 	Move "Country_Name" column to front of cleaned_tourism */
data cleaned_tourism ;
  set cleaned_tourism (drop=Country);
  set cleaned_tourism ;
run;

data cleaned_tourism;
  set cleaned_tourism (keep=Country);
  set cleaned_tourism ;
  keep Country Tourism_Type Category Series Y2014;
run;

/**************************************************************************/

/* Now merge country_info with cleaned_tourism to add continent codes...  */

proc sort data=cr.country_info out=country_info;
	by Country;
run;

data cleaned_tourism;
	merge cleaned_tourism country_info;
	by Country;
run;

/* Create two new tables: 									*/
/* 1. final_tourism should contain only merged data. 		*/
/* 2. nocountryfound should contain a list of distinct  	*/
/*    countries from the cleaned_tourism table that do  	*/
/*    not have a match in the country_info table. 			*/

data final_tourism nocountryfound;
	set cleaned_tourism;
	if Continent="" then output nocountryfound;
	else output final_tourism;
run;


data country_info;
	set cr.country_info;
run;
