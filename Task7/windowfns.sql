use practice;

select * from products;
insert into products values(1005,"boots","casual",500,"black",8,1);
insert into products values(1006,"flip-flops","casual",300,"pink",4,0);

select prod_id, prod_name, category, price, 
row_number() over (partition by category order by price desc) as RowNum
from products;

select prod_id, prod_name, category, price, 
rank() over (partition by category order by price desc) as RankVal
from products;

select prod_id, prod_name, category, price, 
dense_rank() over (partition by category order by price desc) as DenseRankVal
from products;

select prod_id, prod_name, category, price, 
lead(price) over (partition by category order by price desc) as NextPrice
from products;

select prod_id, prod_name, category, price, 
lag(price) over (partition by category order by price desc) as PrevPrice
from products;