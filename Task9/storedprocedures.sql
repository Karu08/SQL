use practice;
show tables;

delimiter //
create procedure GetProdInfo()
begin
	select * from products where price>2000;
end //

call GetProdInfo();

desc products;

delimiter //
create procedure GetProdWithSize(IN reqsize tinyint)
begin
	select prod_id, prod_name, category, price from products
    where size = reqsize;
end //

call GetProdWithSize(5);

select * from orders;

delimiter //
create procedure GetTotalOrders(IN fromdate date, IN todate date)
begin
	select * from orders
    where order_date between fromdate and todate;
end //

call GetTotalOrders("2020-05-01","2021-08-31");

delimiter //
create procedure GetTotalQty(IN fromdate date, IN todate date)
begin
	select sum(quantity) as TOTAL_QTY from orders
    where order_date between fromdate and todate;
end //

call GetTotalQty("2020-05-01","2021-08-31");

delimiter //
create procedure GetProdDet(IN prodid int, OUT prodprice decimal)
begin
	select price INTO prodprice from products
    where prod_id = prodid;
end //

call GetProdDet(1002, @p);
select @p as price;


delimiter //
create function CalcDisc(amt decimal)
returns decimal deterministic
begin
	declare discamt decimal;
    set discamt = amt - amt*0.10;
    return discamt;
end //

select prod_id, prod_name, price, CalcDisc(price) as After_discount 
from products;