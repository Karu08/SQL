use practice;

create table orders(
order_id int NOT NULL AUTO_INCREMENT,
order_date date,
prod_id int,
quantity int,
order_status varchar(20),
region_id varchar(3),
PRIMARY KEY(order_id),
FOREIGN KEY(prod_id) references products(prod_id) 
);

desc orders;

insert into orders(order_date,prod_id,quantity,order_status,region_id)
values("2020-04-28",1002,3,"shipped","TN");
insert into orders(order_date,prod_id,quantity,order_status,region_id)
values("2020-07-17",1001,4,"packaged","AP");
insert into orders(order_date,prod_id,quantity,order_status,region_id)
values("2021-10-08",1002,5,"shipped","TN");
insert into orders(order_date,prod_id,quantity,order_status,region_id)
values("2021-02-22",1003,1,"shipped","KA");
insert into orders(order_date,prod_id,quantity,order_status,region_id)
values("2020-01-15",1001,3,"delivered","DL");

select * from orders;

select orders.order_id, products.prod_name, products.prod_id, products.price, orders.quantity
from products INNER JOIN orders on products.prod_id=orders.prod_id;

select products.prod_id, products.prod_name, products.price, orders.quantity, orders.order_status
from products LEFT JOIN orders on products.prod_id=orders.prod_id;

select products.prod_name, products.price, orders.quantity, orders.order_status
from orders RIGHT JOIN products on products.prod_id=orders.prod_id;

select products.prod_id, products.prod_name, orders.order_date, orders.order_status, orders.region_id
from products INNER JOIN orders on products.prod_id=orders.prod_id
where orders.order_date between "2020/01/01" and "2020/12/01";
