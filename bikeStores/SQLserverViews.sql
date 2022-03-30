create view sales.product_info
AS

select product_name,
	brand_name,
	list_price
	
from production.products as p
join production.brands as b
	on b.brand_id = p.brand_id;


