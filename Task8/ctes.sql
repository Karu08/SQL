use practice;

with AvgPriceByCat as (
	select category, avg(price) as avg_price
    from products
    group by category
)
select * from AvgPriceByCat;

with AvgPriceByCat as (
	select category, avg(price) as avg_price
    from products
    group by category
)
select p.prod_name, p.category, p.color, a.avg_price
from products p inner join AvgPriceByCat a 
on p.category = a.category;