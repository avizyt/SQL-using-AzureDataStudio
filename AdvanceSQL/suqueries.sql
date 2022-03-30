--Using subqueries in an IN List
SELECT TOP(10) CustomerID, AccountNumber
FROM sales.Customer
WHERE CustomerID IN (SELECT CustomerID from sales.SalesOrderDetail);

-- Using a Subquery Containing NULL with NOT IN
/*If the subquery contains
any NULL values, using NOT IN will incorrectly produce no rows. This is not a bug in SQL Server; you simply must take
NULL values into account.*/

--1
SELECT CurrencyRateID, FromCurrencyCode, ToCurrencyCode
FROM Sales.CurrencyRate
WHERE CurrencyRateID NOT IN (
    select CurrencyRateID FROM Sales.SalesOrderHeader
);

--2
SELECT CurrencyRateID, FromCurrencyCode, ToCurrencyCode
FROM   Sales.CurrencyRate
WHERE CurrencyRateID Not IN (
    SELECT CurrencyRateID
    FROM Sales.SalesOrderHeader
    WHERE CurrencyRateID IS NOT NUll
);

-- EXISTS
--1
SELECT CustomerID, AccountNumber
FROM Sales.Customer
WHERE EXISTS (
    SELECT * FROM Sales.SalesOrderHeader as soh 
    WHERE soh.CustomerID = Customer.CustomerID
    );

--2
SELECT CustomerID, AccountNumber
FROM Sales.Customer
WHERE NOT EXISTS(
    SELECT * FROM Sales.SalesOrderHeader as soh 
    WHERE soh.CustomerID = Customer.CustomerID
);

-- CROSS APPLY and OUTER APPLY
SELECT CustomerID, AccountNumber, SalesOrderID
FROM Sales.Customer as cust 
CROSS APPLY(
    SELECT Salesorderid 
    FROM sales.SalesOrderHeader as soh 
    WHERE cust.CustomerID = soh.CustomerID
) as A;

SELECT CustomerID, AccountNumber, SalesOrderID
FROM Sales.Customer as cust 
OUTER APPLY(
    SELECT Salesorderid 
    FROM sales.SalesOrderHeader as soh 
    WHERE cust.CustomerID = soh.CustomerID
) as A;

--UNION
SELECT BusinessEntityID as ID
FROM HumanResources.Employee
UNION
SELECT BusinessEntityID
FROM Person.Person
UNION
SELECT SalesOrderID
From Sales.SalesOrderHeader
ORDER BY ID;

--2
SELECT BusinessEntityID as ID
FROM HumanResources.Employee
UNION ALL
SELECT BusinessEntityID
FROM Person.Person
UNION ALl
SELECT SalesOrderID
From Sales.SalesOrderHeader
ORDER BY ID;

--EX 6-1
/*1. using a subquery, display the product names and product id numbers from the production.
product table that have been ordered.
2. Change the query written in question 1 to display the products that have not been ordered.
3. if the production.productColor table is not part of the adventureWorks database, run the code
in listing 5-11 to create it. Write a query using a subquery that returns the rows from the
production.productColor table that are not being used in the production.product table. use
the NOT EXISTS technique.
4. Write a query that displays the colors used in the production.product table that are not listed
in the production.productColor table using a subquery. use the keyword DISTINCT before the
column name to return each color only once.
5. Write a query that combines the modifieddate from person.person and the hiredate from
humanresources.employee with no duplicates in the results.*/

--1
SELECT ProductID, name
FROM Production.Product
where ProductID IN (
    select ProductID
    From Sales.SalesOrderDetail
);
--2
SELECT ProductID, name
FROM Production.Product
where ProductID NOT IN (
    select ProductID
    From Sales.SalesOrderDetail
);

--5
SELECT ModifiedDate
from Person.Person
UNION
SELECT HireDate
from HumanResources.Employee

--EXCEPT and INTERSECT
/*
Queries written with EXCEPT returnrows from the left side that do not match with right side.
Queries written written with INTERSECT will retur rows that ar found in both sides.
*/

--1
SELECT BusinessEntityID as ID 
FROM HumanResources.Employee
EXCEPT
SELECT BusinessEntityID AS ID
FROM Person.Person;

--2 
SELECT BusinessEntityID as ID 
FROM HumanResources.Employee
INTERSECT
SELECT BusinessEntityID AS ID
FROM Person.Person;
