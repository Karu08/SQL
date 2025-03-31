use practice;

desc products;
desc orders;
select * from products;
alter table products add prod_qty tinyint;

update products set prod_qty=10 where prod_id=1001;
update products set prod_qty=8 where prod_id=1002;
update products set prod_qty=15 where prod_id=1003;
update products set prod_qty=10 where prod_id=1004;
update products set prod_qty=20 where prod_id=1005;
update products set prod_qty=9 where prod_id=1006;

alter table products rename column prod_qty to stock;

create table customers(
customer_id int auto_increment primary key,
name varchar(30),
address varchar(30),
items_qty tinyint,
order_id int,
foreign key(order_id) references orders(order_id));

insert into customers(name,address,items_qty,order_id) values("Ramu","chennai",2,2);
insert into customers(name,address,items_qty,order_id) values("Shyam","banglore",1,3);
insert into customers(name,address,items_qty,order_id) values("Sheela","trichy",2,1);

select * from customers;

create table orderdetails(
orderdetail_id int  auto_increment primary key,
order_id int,
prod_id int,
quantity tinyint,
subtotal decimal,
foreign key(order_id) references orders(order_id),
foreign key(prod_id) references products(prod_id)
);

CREATE INDEX idx_orders_customer ON orders(order_id);
CREATE INDEX idx_orderdetails_product ON orderdetails(prod_id);
CREATE INDEX idx_products_name ON products(prod_name);

delimiter //
create trigger ReduceStock after insert on orderdetails
for each row
begin
	update products
    set stock = stock-new.quantity
    where prod_id = new.prod_id;
end //

start transaction;
insert into orders(order_id, quantity) values(11,3);
SET @order_id = LAST_INSERT_ID();
insert into orderdetails (order_id, prod_id, quantity, subtotal)
VALUES (@OrderID, 1003, 3, 5000.00);

COMMIT; 

CREATE VIEW OrderSummary AS
SELECT o.order_id, c.name AS Customer, o.Order_Date
FROM Orders o
JOIN Customers c ON o.order_id = c.order_id;

select * from OrderSummary;

SELECT * FROM customers;
SELECT * FROM products WHERE stock >=10;
CALL GetProdWithSize(5);