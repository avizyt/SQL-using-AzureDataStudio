--Inner Join between salesorderheader and salesorderdetail
--with predicate SalesorderID.

select s.SalesOrderID, 
	s.OrderDate, 
	s.TotalDue, 
	d.SalesOrderDetailID,
	d.ProductID,
	d.OrderQty
from sales.SalesOrderHeader as s
inner join sales.SalesOrderDetail as d 
    on s.SalesOrderID = d.SalesOrderID;


-- Joining two table with diff vol name.

-- Select rows from a Table or sales '[Customer]' in schema '[dbo]'
SELECT c.CustomerID,
     c.PersonID,
     p.BusinessEntityID,
     p.LastName
FROM [sales].[Customer] as c 
INNER JOIN Person.Person as p 
    ON c.PersonID = p.BusinessEntityID
    WHERE c.CustomerID IN (10000,18000);


-- Join more than one col.

/*SELECT <SELECT list>
FROM <table1>
[INNER] JOIN <table2> ON <table1>.<col1> = <table2><col2>
AND <table1>.<col3> = <table2>.<col4>
*/

SELECT 
    sod.SalesOrderID,
    sod.SalesOrderDetailID,
    so.ProductID,
    so.SpecialOfferID,
    so.ModifiedDate
FROM sales.SalesOrderDetail as sod 
INNER JOIN sales.SpecialOfferProduct as so 
On so.ProductID = sod.ProductID AND
so.SpecialOfferID = sod.SpecialOfferID
WHERE sod.SalesOrderDetailID in (51116,51112);


--Join more than two table

SELECT 
    soh.SalesOrderID,
    soh.OrderDate,
    p.ProductID,
    p.Name
FROM sales.SalesOrderHeader as soh 
INNER JOIN sales.SalesOrderDetail as sod 
    ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product as p 
    ON sod.ProductID = p.ProductID
ORDER BY soh.SalesOrderID;

/* ex
1.the humanresources.employee table does not contain the employee names. Join that table
to the person.person table on the businessentityiD column. Display the job title, birth date,
first name, and last name.

2. the customer names also appear in the person.person table. Join the sales.Customer table
to the person.person table. the businessentityiD column in the person.person table matches
the personiD column in the sales.Customer table. Display the CustomeriD, storeiD, and
territoryiD columns along with the name columns.

3. extend the query written in question 2 to include the sales.salesorderheader table.
Display the salesorderiD column along with the columns already specified. the sales.
salesorderheader table joins the sales.Customer table on CustomeriD.

4. Write a query that joins the sales.salesorderheader table to the sales.salesperson table. Join the
businessentityiD column from the sales.salesperson table to the salespersoniD column in the
sales.salesorderheader table. Display the salesorderiD along with the salesQuota and bonus.

5. add the name columns to the query written in question 4 by joining on the person.person
table. see whether you can figure out which columns will be used to write the join.

6. the catalog description for each product is stored in the production.productModel table.
Display the columns that describe the product such as the color and size, along with the
catalog description for each product.

7. Write a query that displays the names of the customers along with the product names they
have purchased. hint: Five tables will be required to write this query!

*/

--Sol.1
SELECT  
    he.BusinessEntityID,
    p.FirstName,
    p.LastName,
    he.JobTitle,
    he.BirthDate
FROM HumanResources.Employee as he 
INNER JOIN Person.Person as p 
    ON p.BusinessEntityID = he.BusinessEntityID;


--sol.2
SELECT 
    CONCAT(p.FirstName,' ',p.LastName) as Name ,
    c.CustomerID,
    c.StoreID,
    c.TerritoryID
FROM Sales.Customer as c 
    INNER JOIN Person.Person as p 
    ON p.BusinessEntityID = c.PersonID;

--sol.3
SELECT 
    CONCAT(p.FirstName,' ',p.LastName) as Name ,
    c.CustomerID,
    soh.SalesOrderID,
    c.StoreID,
    c.TerritoryID
FROM Sales.Customer as c 
    INNER JOIN Person.Person as p 
    ON p.BusinessEntityID = c.PersonID
    INNER JOIN Sales.SalesOrderHeader as soh 
    ON soh.CustomerID = c.CustomerID;

--sol.4 and 5 combine
SELECT 
    CONCAT(p.FirstName,' ',p.LastName) as Name,
    sp.BusinessEntityID,
    soh.SalesOrderID,
    sp.SalesQuota,
    sp.Bonus
FROM sales.SalesOrderHeader as soh 
    INNER JOIN sales.SalesPerson as sp 
    ON sp.BusinessEntityID = soh.SalesPersonID
    INNER JOIN Person.Person as p 
    ON p.BusinessEntityID = sp.BusinessEntityID;

--sol.6
SELECT 
    p.Color,
    p.[Size],
    pm.CatalogDescription
FROM Production.Product as p 
    INNER JOIN Production.ProductModel as pm 
    on pm.ProductModelID = p.ProductModelID;

--sol.7
SELECT 
    CONCAT(p.FirstName,' ',p.LastName) as Name,
    prod.Name
FROM sales.Customer as c 
    INNER JOIN Person.Person as p 
        ON p.BusinessEntityID = c.PersonID
    INNER JOIN sales.SalesOrderHeader as soh 
        ON soh.CustomerID = c.CustomerID
    INNER JOIN sales.SalesOrderDetail as sod 
        ON soh.SalesOrderID = sod.SalesOrderID
    INNER JOIN Production.Product as prod  
        ON sod.ProductID = prod.ProductID;

    
    
