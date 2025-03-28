use practice;

select NOW();

select DATEDIFF(NOW(), "2025-03-01") as days_difference;
select DATEDIFF("2024-12-31", "2024-01-01") as days_difference;

select DATE_ADD(NOW(), INTERVAL 7 DAY) as after_7_days;
select DATE_ADD(NOW(), INTERVAL 20 MINUTE) as after_20_mins;

select order_date, order_status from orders;

select order_id, order_date, order_status, 
date_add(order_date, INTERVAL 4 DAY) as delivery_date from orders
where order_status="shipped";

select DATE_SUB(NOW(), INTERVAL 30 DAY);

select order_id, order_date, order_status from orders 
where order_date >= date_sub("2021-10-30", INTERVAL 30 DAY);

select DATE_SUB(NOW(), INTERVAL 3 HOUR) as before_3_hours;

select DATE_FORMAT("2025-01-15", "%Y") as year_format;
select date_format(now(),"%a") as abbrv_day;
select date_format(now(),"%W") as full_day;

select date_format("2021-03-21","%d-%m-%Y");
select date_format("2021-03-21","%d-%M-%Y");

select CONVERT("2017-08-29", DATE) as str_to_date;
select CONVERT("2017-08-29", DATETIME) as str_to_dateTIME;
select CONVERT("140810", TIME) as hh_mm_ss;
