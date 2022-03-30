SELECT CustomerID, AccountNumber
FROM sales.Customer
WHERE EXISTS (
    -- Select rows from a Table or View '[salesOrderheader]' in schema '[sales]'
    SELECT * FROM [Sales].[salesOrderheader] as soh 
    WHERE soh.CustomerID = Customer.CustomerID/* add search conditions here */
    
);

SELECT CustomerID , AccountNumber
FROM sales.Customer
WHERE Not EXISTS (
    SELECT * FROM sales.SalesOrderHeader as soh 
    where soh.CustomerID = Customer.CustomerID
);

--3
/* the SELECT statement assigns the value of the FirstName and LastName columns to two variables from
one row of the Person.Person table. In this case, the WHERE clause restricts the SELECT statement to just one row. If
the statement didn’t have a WHERE clause or a less restrictive one, the value from every row would be assigned to the
variable. Eventually, the variable will contain the final value assigned from the query. Because SQL Server doesn’t
guarantee the order of the results returned, this could be any value in the results.*/
DECLARE @FirstName NVARCHAR(50), @LastName NVARCHAR(50);
SELECT @FirstName = Firstname, @LastName = LastName 
FROM Person.Person
WHERE BusinessEntityID =1;

PRINT 'The value of @FirstName';
PRINT @FirstName;
PRINT 'The value of @LastName';
PRINT @LastName;
GO 
