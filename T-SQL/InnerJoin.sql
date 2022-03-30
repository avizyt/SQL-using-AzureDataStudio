SELECT sc.CustomerID, soh.OrderDate,soh.ShipDate,soh.TotalDue
    
FROM sales.Customer as sc 
INNER JOIN sales.SalesOrderHeader as soh 
    ON sc.CustomerID= soh.CustomerID;


SELECT soh.SalesOrderID, soh.OrderDate, soh.TotalDue, sod.SalesOrderDetailID
FROM Sales.SalesOrderHeader as soh 
INNER JOIN sales.SalesOrderDetail as sod 
    ON soh.SalesOrderID = sod.SalesOrderID;



--Join two table with different Col names
SELECT c.CustomerID, c.PersonID, p.BusinessEntityID, p.LastName
FROM sales.Customer as c 
INNER JOIN Person.Person as p 
    ON c.PersonID = p.BusinessEntityID;

--Joing two columns
SELECT sod.SalesOrderID, sod.SalesOrderDetailID,
sop.ProductID, sop.SpecialOfferID, sop.ModifiedDate
FROM sales.SalesOrderDetail as sod 
INNER JOIN sales.SpecialOfferProduct as sop 
    ON sop.ProductID = sod.ProductID AND 
    sop.SpecialOfferID = sod.SpecialOfferID
where sod.SalesOrderID IN (51116,51112);