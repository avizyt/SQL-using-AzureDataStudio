--- How to calculate running Total?
SELECT SalesOrderID, customerID, TotalDue,
	SUM(TotalDue) OVER(PARTITION BY customerID
		ORDER BY SalesOrderID) as RunningTotal
from sales.SalesOrderHeader
order BY CustomerID, SalesOrderID;

SELECT SalesOrderID, customerID, TotalDue,
	SUM(TotalDue) OVER(PARTITION BY customerID
		ORDER BY SalesOrderID
		ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) as ReserseTotal
from sales.SalesOrderHeader
order BY CustomerID, SalesOrderID;

SELECT SalesOrderID, OrderDate,CustomerID, TotalDue,
SUM(TotalDue) OVER(PARTITION BY CustomerID
ORDER BY OrderDate
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
AS ROWS_RT,
SUM(TotalDue) OVER(PARTITION BY CustomerID
ORDER BY OrderDate
RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
AS RANGE_RT
FROM Sales.SalesOrderHeader
WHERE CustomerID = 29837;

select SalesOrderID, ProductID, LineTotal,
	SUM(LineTotal) OVER(Partition by salesorderID 
	order by productID) as runningTotal
from sales.SalesOrderDetail
order by SalesOrderID,ProductID;

SELECT SalesOrderID, ProductID, LineTotal,
SUM(LineTotal) OVER(PARTITION BY ProductID
ORDER BY SalesOrderID
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
AS RunningTotal
FROM Sales.SalesOrderDetail;