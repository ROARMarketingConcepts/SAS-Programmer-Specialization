/* Write a new program to do the following:  						*/
/*  																*/
/* 1. Read the sashelp.stocks table and create  					*/
/*    a new table named stocks_total. 								*/
/* 2. Include only rows where the Date is in 2005. 					*/
/* 3. Create an accumulating column for Volume named  				*/
/*    YTDVolume that is a running total of Volume for each stock. 	*/
/*  																*/

proc sort data=sashelp.stocks out=stocks_sorted;
	where year(Date)=2005;
	by Stock Date;
run;


data stocks_total;
	set stocks_sorted;
	by Stock;
	if first.Stock then YTDVolume=0;
	YTDVolume+Volume;
	format YTDVolume comma18.;
run;