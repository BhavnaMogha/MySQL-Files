create database project2;
use project2

select * from users
select * from food
select * from menu
select * from order_details
select* from orders
select * from resturants

# 3 entities
 #1. users #2. restraunt #3 food 
 #order table handling the relation between users and restraut 
 #menu handle the relation between  food and restraunt the
 #order details handle the relation between order and the food
 
 select * from users
 select * from order
 select name from user where user_id not in (select user_id from orders)
 
# Q2. Average Price/ dish
select f_id , avg(price) from menu group by f_id

select f.f_name, avg(price) as 'average_price'
from menu m

inner join food f
on m.f_id=f.f_id


group by f.f_name

#Q3. find average price of most expensive  item ordered

select * from (select f.f_name, avg(price) as 'average_price'
from menu m
















 
 
 












select * from


