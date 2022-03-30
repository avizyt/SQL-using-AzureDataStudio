SELECT SalesOrderID
    ,OrderDate
    ,CustomerID
    , LAG(OrderDate) OVER(PARTITION BY CustomerID ORDER BY SalesOrderID) as PreOrderdate
    , LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY SalesOrderID) as FolloingOrderDate
from sales.SalesOrderHeader;

select salesorderid, orderdate,CustomerID
	,DATEDIFF(d, LAG(orderdate,1,orderdate)
			OVER(partition by customerid order by salesorderid),orderdate)
			AS DaySinceLastOrder
from sales.SalesOrderHeader