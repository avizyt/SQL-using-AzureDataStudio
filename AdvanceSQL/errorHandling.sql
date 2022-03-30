--Using Try and Catch

BEGIN TRY
    PRINT 1/0;
END TRY
BEGIN CATCH
    PRINT 'Inside the Catch block';
    PRINT ERROR_NUMBER();
    PRINT ERROR_MESSAGE();
    PRINT ERROR_NUMBER();
END CATCH
PRINT 'Outside the catch block';
PRINT CASE when ERROR_NUMBER() IS NULL THEN 'NULL'
    ELSE cast(ERROR_NUMBER() AS VARCHAR(10)) END;
GO 

--2
BEGIN TRY 
    DROP TABLE testTable;
END TRY
BEGIN CATCH
    PRINT 'An error has occured.'
    PRINT ERROR_NUMBER();
    PRINT ERROR_MESSAGE();
END CATCH;

--Viewing Untrappable errors
--Use AdventrueWorks2019

PRINT 'Syntax error.';
GO
BEGIN TRY
    SELECT  FROM sales.SalesOrderDetail;
End TRY
BEGIN CATCH
    PRINT ERROR_NUMBER();
END CATCH;
GO 

-- RAISERROR(<message>,<severity>,<state>)

USE master;
GO

--1 This code section create a custom error message
IF EXISTS(SELECT * FROM sys.messages where message_id=50002) BEGIN
    EXEC sp_dropmessage 50002;
END;
GO
PRINT 'Creating a custom error message.'
EXEC sp_addmessage 50002, 16,
    N'Customer missing.';
GO 

USE AdventureWorks2019;
GO
--2
IF NOT EXISTS(Select * from Sales.Customer
            where CustomerID = -1) BEGIN
    RAISERROR(50002,16,1);
END;
Go 

--2 
BEGIN TRY
    PRINT 1/0;
END TRY
BEGIN CATCH
    IF ERROR_NUMBER() = 8134 BEGIN
    RAISERROR('A bad math error!', 16, 1);
    END;
END CATCH;

--Using Try ... Catch with Transactions

--1
CREATE TABLE #Test (ID INT NOT NULL PRIMARY KEY);
GO

--2
BEGIN TRY
    --2.1
    BEGIN TRANSACTION
        INSERT INTO #Test (ID)
        VALUES (1),(2),(3);

        UPDATE #Test SET ID = 2 WHERE ID = 1;
    COMMIT
END TRY 

--3
BEGIN CATCH 
    PRINT ERROR_MESSAGE();

    PRINT 'Rolling back transaction';
    IF @@TRANCOUNT > 0 BEGIN
        ROLLBACK;
    END;
END CATCH;


--Using THROW Instead of RAISERROR
/*New in SQL Server 2012 is the THROW statement. You’ll find using THROW to be much simpler than using RAISERROR.
For example, the error number in the THROW statement doesn’t have to exist in sys.messages. */

-- THROW [{ error_number | message | state}] [;]
--Using THROW in a Transaction
USE AdventureWorks2019;
GO
BEGIN TRY
INSERT INTO Person.PersonPhone (BusinessEntityID,PhoneNumber,PhoneNumberTypeID)
VALUES (1, '697-555-0142', 1);
END TRY 
BEGIN CATCH
THROW 999999, 'I will not allow you to insert a duplicate value.', 1;
END CATCH;

-- EX 13-2
/* Write a statement that attempts to insert a duplicate row into the HumanResources.Department table. Use TRY...CATCH to trap the error.Display the error number, message and severity.*/

BEGIN TRY
    INSERT INTO HumanResources.Department (Name, GroupName, ModifiedDate)
    VALUES ('Engineering', 'Research and Development', GETDATE());
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER() AS ErrorNumber ,
            ERROR_MESSAGE() as ErrorMSG,
            ERROR_SEVERITY() as ErrorSverity;
END CATCH 

-- Modify the above code to get a custom message
BEGIN TRY
    INSERT INTO HumanResources.Department (Name, GroupName, ModifiedDate)
    VALUES ('Engineering', 'Research and Development', GETDATE());
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER() = 2601 BEGIN
        RAISERROR(
            'You attempted to insert a duplicate!',
            16,1
        );
    END;
END CATCH; 