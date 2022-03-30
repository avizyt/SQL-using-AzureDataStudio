-- Complex functions


select BusinessEntityID,
	CASE	BusinessEntityID % 2 
		WHEN 0 THEN 'EVEN'
		ELSE 'ODD'
		END AS 'TYPE'
from HumanResources.Employee;

SELECT COALESCE(Title + ' ','') + FirstName +
COALESCE(' ' + MiddleName,'') + ' ' + LastName +
COALESCE(', ' + Suffix,'')
FROM Person.Person;
	
SELECT SERVERPROPERTY('Edition'),
SERVERPROPERTY('InstanceName'),
SERVERPROPERTY('MachineName');



select SalesOrderID,OrderDate
	from sales.SalesOrderHeader
where YEAR(OrderDate) = 2013

select SalesOrderID, OrderDate
from sales.SalesOrderHeader
order by MONTH(orderdate), year(orderdate);


select PersonType,FirstName,MiddleName,LastName	
from Person.Person
order by CASE WHEN PersonType IN ('IN','SP','SC')
	THEN lastname ELSE FirstName END;