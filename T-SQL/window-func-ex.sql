SELECT CustomerID,
	ROW_NUMBER() OVER(ORDER BY CustomerID) AS RowNum,
	RANK() OVER(ORDER BY CustomerID) AS RankNum,
	DENSE_RANK() OVER(ORDER BY CustomerID) AS DenseRankNum,
	ROW_NUMBER() OVER(ORDER BY CustomerID DESC) AS ReverseRowNum
FROM Sales.Customer
WHERE CustomerID BETWEEN 11000 AND 11200
ORDER BY CustomerID;

select salesorderid, customerid,
	ROW_NUMBER() over(order by customerId) as RowNum,
	RANK() over(order by customerid) as RankNum,
	DENSE_RANK() over(order by customerid) as DenseRankNum
from sales.SalesOrderHeader
where customerid between 11000 and 11200
order by CustomerID;

select BusinessEntityID, FirstName, LastName,
ROW_NUMBER() over(order by FirstName) as RowNum
from person.Person;

select BusinessEntityID, FirstName, LastName,
RANK() over(order by FirstName) as RankNum
from person.Person;

select BusinessEntityID, FirstName, LastName,
DENSE_RANK() over(order by FirstName) as DenseRankNum
from person.Person;

--- Using Partitions Function
select SalesOrderID
	, OrderDate
	, CustomerID
	, ROW_NUMBER() over(partition by customerid order by orderdate) as RowNum
from sales.SalesOrderHeader
order by CustomerID;

--- Using NTILE function

select sp.FirstName
	,sp.LastName
	,SUM(soh.totaldue) as TotalSales
	,NTILE(4) over(order by SUM(soh.totaldue)) as Bucket
from Sales.vSalesPerson as sp
JOIN sales.SalesOrderHeader as soh on sp.BusinessEntityID = soh.SalesPersonID
where soh.OrderDate >= '2012-01-01' and soh.OrderDate < '2014-01-01'
group by FirstName , LastName
order by totalsales;


select sp.FirstName
	,sp.LastName
	,SUM(soh.totaldue) as TotalSales
	,NTILE(4) over(order by SUM(soh.totaldue)) * 1000 AS Bonus
from Sales.vSalesPerson as sp
JOIN sales.SalesOrderHeader as soh on sp.BusinessEntityID = soh.SalesPersonID
where soh.OrderDate >= '2012-01-01' and soh.OrderDate < '2014-01-01'
group by FirstName , LastName
order by totalsales;

/* EX:1 Write a query that assigns row numbers to the production.product table. start the numbers
over for each productsubCategoryiD and make sure that the row numbers are in order of
productiD. Display only rows where the productsubCategoryiD is not null.*/


SELECT ProductID, ProductSubcategoryID
	,ROW_NUMBER() OVER ( partition by productsubcategoryid order by productID) AS RowNum
FROM Production.Product
where ProductSubcategoryID IS NOT NULL;

/* Write a query that divides the customers into ten buckets based on the total sales for 2005.*/
select CustomerID
	, sum(totaldue) as TotalSales
	, NTILE(10) OVER(ORDER BY SUM(TotalDue)) as CustBucket
from sales.SalesOrderHeader
where orderdate between '2012-01-01' and '2012-12-31'
Group by CustomerID;
