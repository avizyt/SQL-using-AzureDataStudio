select CustomerID
	,ROW_NUMBER() over(order by customerid) as RowNum
	,RANK() over(order by customerid) as RankNum
	,DENSE_RANK() over(order by customerid) as DenseRank
	,ROW_NUMBER() over(order by customerid DESC) as ReverseRowNum 
from sales.Customer
where CustomerID between 11000 and 11200
order by CustomerID;

SELECT BusinessEntityID
    ,Title
    ,ROW_NUMBER() over(ORDER BY Businessentityid) as RowNum
from person.Person
where BusinessEntityID BETWEEN 1000 and 1200 and title='Ms.'
order by BusinessEntityID;

SELECT SalesOrderID, CustomerID,
ROW_NUMBER() OVER(ORDER BY CustomerID) AS RowNum,
RANK() OVER(ORDER BY CustomerID) AS RankNum,
DENSE_RANK() OVER(ORDER BY CustomerID) AS DenseRankNum
FROM Sales.SalesOrderHeader
WHERE CustomerID BETWEEN 11000 AND 11200
ORDER BY CustomerID;

-- Using Partition By 
select SalesOrderID, OrderDate, CustomerID
    , ROW_NUMBER() OVER(PARTITION BY  customerid ORDER BY  orderdate) as RowNum
from sales.SalesOrderHeader
ORDER BY CustomerID;

-- Using NTILE FUNCTION 
SELECT sp.FirstName, sp.LastName,
    SUM(soh.TotalDue) as TotalSales,
    NTILE(4) OVER (ORDER BY SUM(soh.Totaldue)) as Bucket
FROM sales.vSalesPerson sp
join sales.SalesOrderHeader soh on sp.BusinessEntityID = soh.SalesPersonID
where soh.OrderDate >= '2012-01-01' and soh.orderdate < '2013-01-01'
GROUP BY FirstName,LastName
order by TotalSales;