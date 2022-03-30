
select FirstName
from person.Person
where CHARINDEX('ke',firstname) > 0;


select lastname, REVERSE(lastname)
from Person.Person
order by REVERSE(lastname);







--1
/*Write a query using the sales.salesorderheader table to display the orders placed during
2005 by using a function. include the salesorderid and orderdate columns in the results*/

select  SalesOrderID, OrderDate
from sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2013;

--2
/*Write a query using the Sales.SalesOrderHeader table listing the sales in order of
the month the order was placed and then the year the order was placed. Include the
SalesOrderID and OrderDate columns in the results.*/

select SalesOrderID, OrderDate
from Sales.SalesOrderHeader
order by MONTH(OrderDate), YEAR(OrderDate);

--3
/*Write a query that displays the PersonType and the name columns from the Person.
Person table. Sort the results so that rows with a PersonType of IN, SP, or SC sort by
LastName. The other rows should sort by FirstName. Hint: Use the CASE expression.*/

select PersonType,FirstName,MiddleName,LastName
from Person.Person
order by CASE WHEN Persontype IN ('IN','SP','SC') THEN lastname
	ELSE Firstname 
	END;
	