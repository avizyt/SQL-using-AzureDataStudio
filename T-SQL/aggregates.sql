---Aggregates function

select COUNT(*) as CountOfRows
	,MAX(TotalDue) as MaxTotal
	,MIN(TotalDue) as MinTotal
	,SUM(totalDue) as SumOfTotal
	,AVG(TotalDue) as AvgTotal
from sales.SalesOrderHeader;

select MIN(name) as MinName
	,MAX(name) as MaxName
	,MIN(SellStartDate) as MinsellstartDate
from Production.Product;

select COUNT(*) as countofrows
	,COUNT(color) as CountofCoulor
	,Count(DISTINCT Color) as Countdistcolor
from Production.Product;

select MAX(Unitprice) as MostExpensive
from sales.SalesOrderDetail;

select AVG(Freight)
from sales.SalesOrderHeader;

select min(ListPrice)
	,max(listprice)
	,avg(listprice)
from Production.Product;

--- The Group By clause

--- the nonaggregated column in the SELECT list must appear in the GROUP BY clause.
--- The below code will calculates SUM of TotalDue according to CustomerID.
select CustomerID,SUM(Totaldue) as TotalPreCustomer
from sales.SalesOrderHeader
group by customerID;

select TerritoryID
	,AVG(TotalDue) as AveragePerTerriotory
from sales.SalesOrderHeader
group by TerritoryID;

---Grouping on Expressions
select COUNT(*) as CountOfOrders, YEAR(OrderDate) as OrderYear
from sales.SalesOrderHeader
group By OrderDate;

select COUNT(*) as CountOfOrders, YEAR(OrderDate) as OrderYear
from sales.SalesOrderHeader
group By YEAR(orderdate);

/*Write a query that shows the total number of items ordered for each product. use the Sales.
Salesorderdetail table to write the query.*/

select *
from sales.SalesOrderDetail;

select ProductID,SUM(orderqty) 
from sales.SalesOrderDetail
group by productID;

/*Write a query using the Sales.SalesOrderDetail table that displays a count of the detail
lines for each SalesOrderID.*/

select count(*) as CountOfOrder, salesOrderID
from sales.SalesOrderDetail
group by SalesOrderID;

/*Write a query using the Production.Product table that lists a count of the products in each
product line.*/

select COUNT(*) , ProductLine
from Production.Product
group by ProductLine;

/*Write a query that displays the count of orders placed by year for each customer using the
Sales.SalesOrderHeader table.*/

select CustomerID, COUNT(*) as CountOfSales,
	YEAR(OrderDate) as OrderYear
from sales.SalesOrderHeader
group by CustomerID, YEAR(OrderDate);

select CustomerID,SUM(TotalDue) as TotalPerCustomer
from sales.SalesOrderHeader
group by CustomerID
order by CustomerID;