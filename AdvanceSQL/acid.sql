IF EXISTS (SELECT * FROM sys.objects
            where object_id = OBJECT_ID(N'[dbo].[demoTransanction]')
                AND type in (N'U'))
DROP TABLE [dbo].[demoTransaction];
GO 

CREATE TABLE dbo.demoTransaction (col1 INT NOT NULL);
GO 

--1
BEGIN TRAN
    INSERT INTO dbo.demoTransaction (col1) VALUES (1);
    INSERT INTO dbo.demoTransaction (col1) VALUES (2);
COMMIT TRAN;

--2
BEGIN TRAN
    INSERT INTO dbo.demoTransaction (col1) VALUES (3);
    INSERT INTO dbo.demoTransaction (col1) VALUES ('a');
COMMIT TRAN
GO

--3
SELECT col1
from dbo.demoTransaction;

--ROLLBACK of previous Transactions

IF EXISTS (SELECT * FROM sys.objects
            where object_id = OBJECT_ID(N'[dbo].[demoTransanction]')
                AND type in (N'U'))
DROP TABLE [dbo].[demoTransaction];
GO 

CREATE TABLE dbo.demoTransaction (col1 INT NOT NULL);
GO 

--1
BEGIN TRAN
    INSERT INTO dbo.demoTransaction (col1) VALUES (1);
    INSERT INTO dbo.demoTransaction (col1) VALUES (2);
COMMIT TRAN;

--2
BEGIN TRAN
    INSERT INTO dbo.demoTransaction (col1) VALUES (3);
    INSERT INTO dbo.demoTransaction (col1) VALUES (4);
ROLLBACK TRAN
GO

--3
SELECT col1
from dbo.demoTransaction;

DROP TABLE dbo.demoTransaction;


--Using the XACT_ABORT setting

/*The XACT_ABORT setting automatically roll back trabsaction and stops the batch in the case of runtime error such as violation primary or foreign keys.*/

-- Using XACT_ABORT with the setting off

--1
CREATE TABLE #Test_XACT_OFF(COL1 INT PRIMARY KEY, COL2 VARCHAR(10));

--2
--what happend with defaut?
BEGIN TRANSACTION
    INSERT INTO #Test_XACT_OFF(COL1,COL2)
    VALUES(1,'A');

    INSERT INTO #Test_XACT_OFF(COL1,COL2)
    VALUES(2,'B');

    INSERT INTO #Test_XACT_OFF(COL1, COL2)
    VALUES(1,'C');
COMMIT TRANSACTION;

--3
SELECT * FROM #Test_XACT_OFF;


--Testing with XACT_ABORT ON
CREATE TABLE #Test_XACT_ON(COL1 INT PRIMARY KEY, COL2 VARCHAR(10));

--2
--Turn on the setting
SET XACT_ABORT ON;

BEGIN TRANSACTION
    INSERT INTO #Test_XACT_OFF(COL1,COL2)
    VALUES(1,'A');

    INSERT INTO #Test_XACT_OFF(COL1,COL2)
    VALUES(2,'B');

    INSERT INTO #Test_XACT_OFF(COL1, COL2)
    VALUES(1,'C');
COMMIT TRANSACTION;

--3
SELECT * FROM #Test_XACT_ON;

--5
SET XACT_ABORT OFF;

--EX 13-1

If OBJECT_ID('dbo.Demo') IS NOT NULL BEGIN
    DROP TABLE dbo.demo;
END;
GO
CREATE TABLE dbo.Demo(ID INT PRIMARY KEY, Name VARCHAR(25));

--1
BEGIN TRANSACTION
    INSERT INTO dbo.Demo(ID,Name)
    VALUES(1,'Avijit')

    INSERT INTO dbo.Demo(ID, Name)
    VALUES(2,'Surajit')
COMMIT TRANSACTION

--2
BEGIN TRANSACTION
    INSERT INTO dbo.Demo(ID, Name)
    VALUES(3,'Dishani')

    INSERT INTO dbo.Demo(ID,Name)
    VALUES (4,'debmalya')

--3
SELECT * from dbo.Demo;