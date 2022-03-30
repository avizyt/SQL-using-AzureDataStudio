--The CASE expression
/* Use the CASE expression to evaluate a list of expression and return the first one that evaluates to true. CASE is similer to Select Case or Switch used in the other programming lang, but it is used inside the statement.*/

/* Format
CASE <test expression>
    WHEN <comparison expression1> THEN <return value1>
    WHEN <comparison expression2> THEN <return value2>
    [ELSE <value3>] END

*/

SELECT Title,
    CASE Title 
    WHEN 'Mr.' Then 'Male'
    WHEN 'Ms.' Then 'Female'
    WHEN 'Mrs.' Then 'Female'
    WHEN 'Miss'Then 'Female'
    ELSE 'Unknown' End AS Gender
    
FROM Person.Person
WHERE BusinessEntityID IN (1,5,6,357,358,11621,423);

--Searched CASE
/*
CASE WHEN <test expression1> THEN <value1>
[WHEN <test expression2> THEN <value2>]
[ELSE <value3>] END
*/

SELECT Title,
    CASE WHEN Title IN ('Ms.','Mrs.','Miss') THEN 'Female'
        When Title = 'Mr' THEN 'Male'
        ELSE 'Unknown' END AS Gender

FROM person.Person
WHERE BusinessEntityID IN (1,5,6,357,358,11621,423);

--Listing a column as the Return Value

SELECT VacationHours, SickLeaveHours,
CASE when VacationHours > SickLeaveHours then VacationHours
else SickLeaveHours END as 'More Hours'
FROM HumanResources.Employee;


--IIF function
-- IIF (boolean_expression. true_value, false_value)

--1 IIF function without variables
SELECT IIF (50> 20, 'TURE', 'FALSE') AS Result;

--2 IIF with variables
DECLARE @a INT = 50
DECLARE @b INT = 25
SELECT IIF (@a > @b, 'TRUE', 'FALSE') AS Result;

--COALESCE
-- it will take any number of parameters and return the first non-NULL value.(ANSI)
--e.g
SELECT BusinessEntityID, FirstName + Coalesce(' ' + MiddleName,'')+
' ' + LastName AS 'Full Name'
from Person.Person;

SELECT BusinessEntityID, FirstName + ISNULL(' ' + MiddleName,'') +
' ' + LastName AS "Full Name"
FROM Person.Person;