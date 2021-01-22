data sales;
	set cr.employee;
	where Department="Sales" and TermDate is missing;
	format SalesLevel $ 6.;
	if JobTitle="Sales Rep. I" then SalesLevel="Entry";
	else if JobTitle in ("Sales Rep. II", "Sales Rep. III") then SalesLevel="Middle";
	else SalesLevel="Senior";
run;

proc sort data=sales out=sales_sorted;
	by SalesLevel;
run;

proc freq data=sales_sorted;
	table SalesLevel;	
run;