select s.SalesOrderID, s.OrderDate, s.TotalDue, d.SalesOrderDetailID,
d.ProductID, d.OrderQty
from sales.SalesOrderHeader AS s
join Sales.SalesOrderDetail AS d ON s.SalesOrderID= d.SalesOrderID

select c.CustomerID, c.PersonID,p.BusinessEntityID,p.LastName
FROM sales.Customer as c
INNER JOIN Person.Person as p ON c.PersonID = p.BusinessEntityID;

-- Joining morethan one column
-- To joining morethan one column 
SELECT sod.SalesOrderID, sod.SalesOrderDetailID,
	so.ProductID, so.SpecialOfferID, so.ModifiedDate
	FROM Sales.SalesOrderDetail AS sod
		INNER JOIN Sales.SpecialOfferProduct AS so
		ON so.ProductID = sod.ProductID AND
			so.SpecialOfferID = sod.SpecialOfferID
WHERE sod.SalesOrderID IN (51116,51112);

select  soh.SalesOrderID, soh.OrderDate, pp.ProductID, pp.Name
from sales.SalesOrderHeader as soh
join sales.SalesOrderDetail as sod ON soh.SalesOrderID=sod.SalesOrderID
join Production.Product as pp ON sod.ProductID = pp.ProductID;

-- q 1
/*the humanresources.employee table does not contain the employee names. Join that table
to the person.person table on the businessentityiD column. Display the job title, birth date,
first name, and last name.*/
select hre.JobTitle,hre.BirthDate,
		concat(pp.FirstName,' ',pp.LastName) as full_name
FROM HumanResources.Employee as hre
join person.person as pp ON hre.BusinessEntityID = pp.BusinessEntityID;

--q2
/*the customer names also appear in the person.person table. Join the sales.Customer table
to the person.person table. the businessentityiD column in the person.person table matches
the personiD column in the sales.Customer table. Display the CustomeriD, storeiD, and
territoryiD columns along with the name columns.*/

select concat(pp.FirstName,' ',pp.lastname) as FullName,CustomerID,cm.StoreID,cm.TerritoryID
from person.person as pp
JOin sales.Customer as cm 
	ON pp.BusinessEntityID = cm.PersonID;


--q3
/*extend the query written in question 2 to include the sales.salesorderheader table.
Display the salesorderiD column along with the columns already specified. the sales.
salesorderheader table joins the sales.Customer table on CustomeriD.*/
select concat(pp.FirstName,' ',pp.lastname) as FullName
	,soh.SalesOrderID
	,cm.CustomerID
	,cm.StoreID
	,cm.TerritoryID
from person.person as pp
JOin sales.Customer as cm 
	ON pp.BusinessEntityID = cm.PersonID
Join sales.SalesOrderHeader as soh
	ON cm.CustomerID = soh.CustomerID;

--q4
/*Write a query that joins the sales.salesorderheader table to the sales.salesperson table. Join the
businessentityiD column from the sales.salesperson table to the salespersoniD column in the
sales.salesorderheader table. Display the salesorderiD along with the salesQuota and bonus*/

select soh.SalesOrderID,sp.SalesQuota,sp.Bonus
from sales.SalesOrderHeader as soh
join sales.SalesPerson as sp 
	ON sp.BusinessEntityID = soh.SalesPersonID;


--q5
/*add the name columns to the query written in question 4 by joining on the person.person
table. see whether you can figure out which columns will be used to write the join.*/

select soh.SalesOrderID,sp.SalesQuota,sp.Bonus,pp.FirstName
from sales.SalesOrderHeader as soh
join sales.SalesPerson as sp 
	ON sp.BusinessEntityID = soh.SalesPersonID
join person.person as pp 
	ON pp.BusinessEntityID= sp.BusinessEntityID;

--q6
/*the catalog description for each product is stored in the production.productModel table.
Display the columns that describe the product such as the color and size, along with the
catalog description for each product.*/

select pm.CatalogDescription,pm.Name,p.Color,p.Size
from production.ProductModel as pm
join Production.Product as p
	ON pm.ProductModelID = p.ProductModelID

--q7
/*Write a query that displays the names of the customers along with the product names they
have purchased. hint: Five tables will be required to write this query!*/

select CONCAT(pp.firstname,' ',pp.LastName) as FullNmae,prod.Name
	
from person.person as pp
join sales.Customer as cm 
	ON pp.BusinessEntityID = cm.PersonID
JOIN Sales.SalesOrderHeader AS SOH
	ON cm.CustomerID = SOH.CustomerID
JOIN Sales.SalesOrderDetail AS SOD
	ON SOH.SalesOrderID = SOD.SalesOrderID
JOIN Production.Product AS Prod
	ON SOD.ProductID = Prod.ProductID;

-- Left Join

SELECT c.CustomerID, s.SalesOrderID, s.OrderDate
FROM Sales.Customer AS c
LEFT OUTER JOIN Sales.SalesOrderHeader AS s ON c.CustomerID = s.CustomerID
WHERE s.SalesOrderID IS NULL;

-- Right join

SELECT c.CustomerID, s.SalesOrderID, s.OrderDate
FROM Sales.Customer AS c
RIGHT OUTER JOIN Sales.SalesOrderHeader AS s ON c.CustomerID = s.CustomerID
WHERE c.CustomerID IN (11028,11029,1,2,3,4);