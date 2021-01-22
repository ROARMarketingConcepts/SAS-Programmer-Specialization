proc sort data=sashelp.shoes
	out=sorted_table;
	by Region Product;
run;

data profitsummary;
	set sorted_table;
	by Region Product;
	Profit = Sales-Returns;
	if first.Product or first.Region then TotalProfit=0;
	TotalProfit+Profit;
run;
	
data profitsummary(keep= Region Product TotalProfit);
	set sorted_table;
	by Region Product;
	Profit = Sales-Returns;
	TotalProfit+Profit;
	format TotalProfit dollar14.;
	if last.Product or last.Region then output;
run;