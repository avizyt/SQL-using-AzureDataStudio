--Note:
/*The OFFSET and FETCH clauses are the options of the ORDER BY clause. They allow you to limit the number of rows to be returned by a query.
-----------------------------------------------------------
ORDER BY column_list [ASC |DESC]
OFFSET offset_row_count {ROW | ROWS}
FETCH {FIRST | NEXT} fetch_row_count {ROW | ROWS} ONLY
-----------------------------------------------------------
1.The OFFSET clause specifies the number of rows to skip before starting to return rows from the query. The offset_row_count can be a constant, variable, or parameter that is greater or equal to zero.
2.The FETCH clause specifies the number of rows to return after the OFFSET clause has been processed. The offset_row_count can a constant, variable or scalar that is greater or equal to one.
3.The OFFSET clause is mandatory while the FETCH clause is optional. Also, the FIRST and NEXT are synonyms respectively so you can use them interchangeably. Similarly, you can use the FIRST and NEXT interchangeably.
-------------------------------------------------------------
*/

select product_name, list_price
from production.products
order by list_price, product_id
--Using OFFSET
OFFSET 10 ROWS
--Using FETCH
FETCH NEXT 20 ROWS ONLY;

--2
select product_name, list_price
from production.products
order by list_price DESC, product_id
OFFSET 10 ROWS
FETCH NEXT 20 ROWS ONLY;

--TOP 
--3
select top 3
	product_name,
	list_price
from production.products
order by list_price DESC;

--TOP return percentage of rows
SELECT top 1 percent
	product_name,
	list_price
from production.products
order by list_price DESC;

--Using TOP WITH TIES
select top 3 with ties
	product_name,
	list_price
from production.products
order by list_price DESC;