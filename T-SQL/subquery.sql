select CustomerID,AccountNumber
from sales.Customer 
Where EXISTS (
	select* from sales.SalesOrderHeader AS soh
	where soh.CustomerID = Customer.CustomerID);
/* the above code is described as , find all the customer's customerID and Accountnumbers where 
customer are presents or exists in the salesorderheader table.*/

-- the vice versa of the above situation will be.

select CustomerID,AccountNumber
from sales.Customer 
Where NOT EXISTS (
	select* from sales.SalesOrderHeader AS soh
	where soh.CustomerID = Customer.CustomerID);


-- Using CROSS APPLY and OUTER APPLY

/*Two more technique for joing subqueries are cross apply and outer apply.
these works similer to functions that join the results to the left side of 
the query.
*/

SELECT CustomerID, AccountNumber, SalesOrderID
FROM Sales.Customer AS Cust
CROSS APPLY(SELECT SalesOrderID
FROM Sales.SalesOrderHeader AS SOH
WHERE Cust.CustomerID = SOH.CustomerID) AS A;


-- OUTER APLLY is similer to left outer join, returned all customers even if the customer has 
-- not placed any order.
SELECT CustomerID, AccountNumber, SalesOrderID
FROM Sales.Customer AS Cust
OUTER APPLY(SELECT SalesOrderID
FROM Sales.SalesOrderHeader AS SOH
WHERE Cust.CustomerID = SOH.CustomerID) AS A;

-- UNION

SELECT BusinessEntityID AS ID
FROM HumanResources.Employee
UNION
SELECT BusinessEntityID
FROM Person.Person
UNION
SELECT SalesOrderID
FROM Sales.SalesOrderHeader
ORDER BY ID;

/*using a subquery, display the product names and product id numbers from the production.
product table that have been ordered*/

select pd.Name,pd.ProductID
from production.Product as pd
where EXISTS (select * from sales.SalesOrderDetail as sod
			where sod.ProductID = pd.ProductID);

select pd.Name,pd.ProductID
from production.Product as pd
where pd.ProductID NOT IN (select sod.ProductID from sales.SalesOrderDetail as sod
			);

/*Write a query that displays the colors used in the production.product table that are not listed
in the production.productColor table using a subquery. use the keyword DISTINCT before the
column name to return each color only once*/
/*Write a query that combines the modifieddate from person.person and the hiredate from
humanresources.employee with no duplicates in the results*/

select ModifiedDate
from Person.Person
UNION
select HireDate
from HumanResources.Employee;

-- EXCEPT and INTERSECT

SELECT BusinessEntityID AS ID
FROM HumanResources.Employee
EXCEPT
SELECT BusinessEntityID
FROM Person.Person;
--2
SELECT BusinessEntityID AS ID
FROM HumanResources.Employee
INTERSECT
SELECT BusinessEntityID
FROM Person.Person;
