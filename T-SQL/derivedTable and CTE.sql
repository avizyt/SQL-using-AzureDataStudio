-- e.g Derived table

select cus.CustomerID,s.SalesOrderID
from sales.Customer as cus
join (select salesorderID, customerID
		from sales.SalesOrderHeader) as s ON cus.CustomerID=s.CustomerID;


-- e.g Common table expression
/* syntax
WITH <CTE Name> AS (SELECT <select list FROM <table>)
SELECT * FROM <CTE Name>
WITH <CTE Name> AS (SELECT <select list> FROM <table1>)
SELECT <select list> FROM <table2>
[INNER] JOIN <CTE Name> ON <table2>.<col1> = <CTE Name>.<col2>
WITH <CTE Name> [(<colname1>,<colname2>,...<colnameN>)]
AS (SELECT <select list> FROM <table1>)
SELECT <select list> FROM <table2>
[INNER] JOIN <CTE Name> ON <table2>.<col1> = <CTE Name>.<col2>
*/


--1
;WITH orders AS(
	select SalesOrderID,CustomerID,TotalDue + Freight AS Total
	FROM sales.SalesOrderHeader)
	
	select c.CustomerID, orders.salesorderID,orders.total
	from sales.Customer as c
	JOIN orders ON c.CustomerID = orders.CustomerID;

-- 2
;WITH orders ([Order ID],[Customer ID], Total)
		AS (SELECT SalesOrderID, CustomerID, TotalDue + Freight
		FROM Sales.SalesOrderHeader )

SELECT c.CustomerID, orders.[Order ID], Orders.Total
		FROM Sales.Customer AS c
		INNER JOIN orders ON c.CustomerID = orders.[Customer ID];


/*using a derived table, join the Sales.Salesorderheader table to the
Sales.Salesorderdetail table. display the Salesorderid, orderdate, and productid columns in
the results. the Sales.Salesorderdetail table should be inside the derived table query.*/


select soh.SalesOrderID,soh.OrderDate ,productID
	from sales.SalesOrderHeader as soh

join (select SalesOrderID,ProductID
		from sales.SalesOrderDetail) as sod
		ON soh.SalesOrderID= sod.SalesOrderID;


-- rewrite with CTE

;with SOD as (select salesorderid,productid
		from sales.SalesOrderDetail)
select soh.SalesOrderID,soh.OrderDate,productid
from sales.SalesOrderHeader as soh
join SOD ON soh.SalesOrderID = SOD.SalesOrderID

/*Write a query that displays all customers along with the orders placed in 2005. Use a
common table expression to write the query and include the CustomerID, SalesOrderID,
and OrderDate columns in the results.*/
;with orders as (select CustomerID,SalesOrderID,OrderDate
				from sales.SalesOrderHeader
				where OrderDate between '1/1/2012' and '12/31/2012')
select c.CustomerID,SalesOrderID,OrderDate
from sales.Customer as c
left join orders ON c.CustomerID=orders.CustomerID



