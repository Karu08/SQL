create database practice;
use practice;
create table products(
prod_id int NOT NULL,
prod_name varchar(50) NOT NULL,
category varchar(20),
price decimal NOT NULL,
color varchar(20),
size tinyint,
gender boolean,
PRIMARY KEY(prod_id),
CHECK (price>0)
);

desc products;

insert into products values(1001,"sneakers","casual", 2500.00,"dark brown", 6, 1);
insert into products values(1002,"loafers","formal", 3500.00,"deep black", 7, 1);
insert into products values(1003,"boots","semi-formal", 3000.00,"black", 5, 0);
insert into products values(1004,"flip-flops","casual", 500.00,"blue", 5, 0);

select * from products;

select * from products where price<3000;
select * from products where category in ("casual","formal");

select prod_name, price, size from products
where gender=1;

select * from products order by price;

select * from products  order by size desc;
select * from products  order by size, prod_id desc;

select * from products where category="casual" and price>2000;
select * from products where color="blue" or category="semi-formal";
select * from products where price<3000 and (size=5 or size=6);