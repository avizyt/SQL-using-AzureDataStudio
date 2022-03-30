--- Window aggregates allow you to add aggregate expression to nonaggregate queries.


select SalesOrderID,CustomerID,TotalDue
From sales.SalesOrderHeader
order by CustomerID;

select SalesOrderID, CustomerID
	,COUNT(*) over() as CountOfSales
	,COUNT(*) OVER(PARTITION BY CUSTOMERID) AS CountOfCustSales
	,SUM(TotalDue) Over(partition by customerid) as SumOfCustSales
From sales.SalesOrderHeader
order by CustomerID;

select SalesOrderID, CustomerID
	,COUNT(*) over() as CountOfSales
	,COUNT(*) OVER(partition by customerid) as countOfCustSales
	,sum(TotalDue) OVER(partition by customerid) as sumofCustsales

from sales.SalesOrderHeader
where salesorderid > 55000
order by customerid;

/* EX1:Write a query returning the salesorderiD, orderDate, CustomeriD, and totalDue from the
sales.salesorderheader table. include the average order total over all the results.*/

select SalesOrderID
	,OrderDate
	,CustomerID
	,TotalDue
	, AVG(TotalDue) over() as AvgTotal
from sales.SalesOrderHeader
order by CustomerID ;

---Add the average total due for each customer to the query you wrote in question 1.

select SalesOrderID, OrderDate,CustomerID,TotalDue
	 ,AVG(totaldue) Over() as AvgTotal
	 ,AVG(totalDue) over(partition by customerid) as AvgCustTotal
from sales.SalesOrderHeader;