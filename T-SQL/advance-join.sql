select *
from sales.Customer
where CustomerID  IN (select CustomerID
	from sales.SalesOrderHeader);


select CurrencyRateID,FromCurrencyCode,ToCurrencyCode
from sales.CurrencyRate
where CurrencyRateID not in 
	(select CurrencyRateID
	from sales.SalesOrderHeader
	where CurrencyRateID IS NOT NULL);

select CustomerID, AccountNumber
from sales.Customer as cm
where EXISTS	
	(select * from sales.SalesOrderHeader as soh
	where soh.CustomerID= cm.CustomerID);

--CROSS apply and OUTER apply

select CustomerID
	,AccountNumber
	,salesorderID
from sales.Customer as cm
cross apply (
	select salesorderID from sales.SalesOrderHeader as soh
	where cm.CustomerID = soh.customerID) as A;

SELECT CustomerID, AccountNumber, SalesOrderID
FROM Sales.Customer AS Cust
OUTER APPLY(SELECT SalesOrderID
FROM Sales.SalesOrderHeader AS SOH
WHERE Cust.CustomerID = SOH.CustomerID) AS A;