select CustomerID
	,ROW_NUMBER() over(order by customerid) as RowNum
	,RANK() over(order by customerid) as RankNum
	,DENSE_RANK() over(order by customerid) as DenseRank
	,ROW_NUMBER() over(order by customerid DESC) as ReverseRowNum 
from sales.Customer
where CustomerID between 11000 and 11200
order by CustomerID;

select SalesOrderID, CustomerID
	,ROW_NUMBER() over(order by customerid) as RowNum
	,rank() over(order by customerid) as RankNum
	, DENSE_RANK() over(order by customerid) as DenseRankNum
from sales.SalesOrderHeader
where CustomerID between 11000 and 11200
order by CustomerID;

SELECT sp.FirstName, sp.LastName,
    SUM(soh.TotalDue) as TotalSales,
    NTILE(4) OVER (ORDER BY SUM(soh.Totaldue)) as Bucket
FROM sales.vSalesPerson sp
join sales.SalesOrderHeader soh on sp.BusinessEntityID = soh.SalesPersonID
where soh.OrderDate >= '2012-01-01' and soh.orderdate < '2013-01-01'
GROUP BY FirstName,LastName
order by TotalSales