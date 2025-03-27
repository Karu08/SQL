use practice;

select * from products where 
prod_id  = (select prod_id from orders where quantity=1);

select * from products where 
prod_id in (select prod_id from orders where quantity>2);

select * from products where
price > (select avg(price) from products);

select * from products where 
prod_id not in (select prod_id from orders);

select p.prod_name, p.price from products p,
(select avg(price) as avg_p from products) as avg_table
where p.price>avg_table.avg_p;

select prod_id, prod_name, 
(select order_status from orders where quantity=1) as CURRENT_STATUS
from products;