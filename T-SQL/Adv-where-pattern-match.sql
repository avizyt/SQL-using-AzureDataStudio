--Advance Where Clause
--Pattern Matching
--Using LIKE

/* Pattern matching is possible by using the LIKE operator in the expression instead of equal to(=), Most of the time, the percent sign (%) is used as a wildcard along with LIKE to represent zero or more cahrecters. */

--1
SELECT DISTINCT LastName
FROM Person.Person
WHERE LastName LIKE 'Sand%';
--2
SELECT DISTINCT LastName
FROM Person.Person
WHERE LastName NOT LIKE 'Sand%';
--3
SELECT DISTINCT LastName
FROM person.Person
where lastname not like '%Z%';
--4
SELECT DISTINCT LastName
FROM Person.Person
WHERE LastName LIKE 'Bec_';

