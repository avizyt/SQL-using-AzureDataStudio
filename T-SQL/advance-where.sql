SELECT BusinessEntityID, Firstname,Middlename,lastname
FROM person.Person
WHERE FirstName = 'Ken' AND
	Lastname IN ('Myer','Meyer');

SELECT Territoryid, Name
FROM sales.SalesTerritory
WHERE TerritoryID IN (2,2,1,4,5);

SELECT Territoryid, Name
FROM sales.SalesTerritory
WHERE TerritoryID NOT IN (2,2,1,4,5);

/*Write a query displaying the order ID, order date, and total due from the
Sales.SalesOrderheader table. retrieve only those rows where the order was
placed during the month of September 2005.*/

SELECT salesorderID, orderdate,totaldue
FROM sales.SalesOrderHeader
--WHERE orderdate IN ('2011-09-01' , '2011-09-30'); <-- This query will not work.
WHERE orderdate >='2011-09-01' AND orderdate < '2011-09-30';

/*Write a query with the same columns as question 1. Include rows where the total Due is
$10,000 or more or the SalesOrderID is less than 43000.*/

SELECT salesorderID, orderdate,totaldue
FROM sales.SalesOrderHeader
WHERE totaldue>= '$10000' or SalesOrderID < 43000;

-- Example of NULL datatype

SELECT MiddleName
from person.person
where MiddleName != 'B';

-- where middlename is null or 'B'

SELECT firstname,middlename
FROM person.person
where MiddleName IS NULL OR MiddleName='B';

-- EX:
/*1. Write a query displaying the productID, name, and Color columns from rows in the
production.product table. Display only those rows where no color has been assigned.

2. Write a query displaying the productID, name, and Color columns from rows in the
production.product table. Display only those rows in which the color is known not
to be blue.

3. Write a query displaying productID, name, Style, Size, and Color from the production.product
table. Include only the rows where at least one of the Size or Color columns contains a value.*/

--sol 1:
SELECT ProductID,Name,Color
FROM production.Product
WHERE color IS NULL;

--sol2:
SELECT ProductID,Name,Color
FROM production.Product
WHERE color <> 'blue';

--sol3:
SELECT ProductID,Name,Style,Size,Color
FROM production.Product
WHERE size IS NOT NULL or color IS NOT NULL;


SELECT ProductID,Name,Style,Size,Color
FROM production.Product
WHERE size IS NOT NULL or color IS NOT NULL;

/* Write a query that returns the business entity ID and name columns from the person.person
table. Sort the results by Lastname, Firstname, and middlename.*/

SELECT BusinessEntityID
	,FirstName
	,LastName
FROM person.Person
Order by LastName DESC,FirstName DESC,MiddleName DESC;