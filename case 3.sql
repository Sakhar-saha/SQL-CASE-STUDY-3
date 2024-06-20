create database case2;

use case2;


/*There are 2 datasets present in the file. Data 1 and Data 2
The primary key for both data1 and data2 is Order Id + Product ID combination (i.e. the individual datasets do not have any duplicate on this combination)

Provide solution and approach for the following:

1) How to identify the Records (Order ID + Product ID combination) present in data1 but missing in data2 (Specify the number of records missing in your answer)

2) How to identify the Records (Order ID + Product ID combination) missing in data1 but present in data2 (Specify the number of records missing in your answer)

3) Find the Sum of the total Qty of Records missing in data1 but present in data2

4) Find the total number of unique records (Order ID + Product ID combination) present in the combined dataset of data1 and data2*/



select *
from data1 as d1 inner join data2 as d2
on d1.`order id` = d2.`order id`;


#1
select d1.`order id`, d1.`product id`, d1.qty
from data1 as d1 left join data2 as d2
on d1.`order id` = d2.`order id` 
and d1.`product id` = d2.`product id`
where d2.`order id` is null and d2.`product id` is null;


#2
select d2.`order id`, d2.`product id`, d2.qty
from data1 as d1 right join data2 as d2
on d1.`order id` = d2.`order id` 
and d1.`product id` = d2.`product id`
where d1.`order id` is null and d1.`product id` is null;


#3
select sum(d2.qty)
from data1 as d1 right join data2 as d2
on d1.`order id` = d2.`order id` 
and d1.`product id` = d2.`product id`
where d1.`order id` is null and d1.`product id` is null;



#4
select d1.`order id`, d1.`product id`, d1.qty
from data1 as d1 left join data2 as d2
on d1.`order id` = d2.`order id` 
and d1.`product id` = d2.`product id`
where d2.`order id` is null and d2.`product id` is null
union
select d2.`order id`, d2.`product id`, d2.qty
from data1 as d1 right join data2 as d2
on d1.`order id` = d2.`order id` 
and d1.`product id` = d2.`product id`
where d1.`order id` is null and d1.`product id` is null;