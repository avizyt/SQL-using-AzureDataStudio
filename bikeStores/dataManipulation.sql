--1
select first_name, last_name, street
from sales.customers
where state = 'CA'
order by (first_name) DESC;
--Note
/* When ORDER BY is present in the query then
SQL Server processes the clauses of the query in the following seq:
FROM -> WHERE -> SELECT -> ORDER BY
*/

--2
select city,COUNT(*)
FROM sales.customers
where state = 'CA'
group BY city
order by city;

--Note:
/* In this case Processes be like:
FROM -> WHERE -> GROUP BY -> SELECT -> ORDER BY
*/

--3
/*To filter groups based on one or more conditions, you use the HAVING clause. */

select city, COUNT(*)
from sales.customers
where state = 'CA'
Group BY city
HAVING COUNT(*) > 10
ORDER BY city;

--4
select first_name, last_name
from sales.customers
order by (first_name);

--5
-- sorting with multiple columns
select city, first_name, last_name
from sales.customers
order by city, first_name;

--6 
-- It is possible to sort the result by a column that does not appear in the selct list.
select city, first_name, last_name
from sales.customers
order by state;

--7
--Sort by an expression
select city, first_name, last_name
from sales.customers
order by LEN(first_name);

--8
select city, first_name, last_name
from sales.customers
order by 1, 2;