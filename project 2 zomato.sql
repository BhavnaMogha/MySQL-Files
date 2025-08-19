create database project2;
use project2;

select * from users;
select * from food;
select * from menu;
select * from order_details;
select* from orders;
select * from restaurants;
select * from delivery_partner;
# 3 entities
# 1. users  # 2. restraunt   #3. food
# order table handling the realtion between users and restraunt table
# menu handle the relation between food and retraunt table
# order details handle relation between order and the food




#	Q1. Find the customers who have never ordered the food

select * from users;
select * from orders;

select name from users where user_id not in (select user_id from orders);





# 	Q2. Average Price/dish
select f_id , avg(price) from menu  group by f_id

select f.f_name, avg(price) as 'average_price' 
from menu m
inner join food f 
on m.f_id=f.f_id
group by f.f_name;







# Q3. find average price of most expensive item ordered


select * from (select f.f_name, avg(price) as 'average_price' 
from menu m
inner join food f 
on m.f_id=f.f_id
group by f.f_name) t order by average_price desc limit 1



#Q4.	Find top restaurants  in terms of number orders in a june month
select * ,monthname(date) as'month' from orders where monthname(date) like 'june'

select r_id, count(*) from orders where monthname(date) like 'june' group by r_id

select r_id, count(*) from orders where monthname(date) like 'june' group by r_id 
order by count(*) desc limit 1





select r.r_name, count(*) as 'num order'
from orders o
inner join restaurants r
on r.r_id=o.r_id
where monthname(o.date) ='june'
group by r.r_id,r.r_name 
order by count(*) desc limit 1


#	Q5. whihc restraunt has done the sales of greater than 500 in a month of june
select * from orders where monthname(date) like 'june'

select r_id, sum(amount) as' revenue' from orders where monthname(date)
like 'june'group by r_id


select r_id, sum(amount) as' revenue' from orders where monthname(date)
like 'june'group by r_id having revenue>500


select r.r_name, sum(amount) as' revenue'
from orders o
inner join restaurants r
on o.r_id=r.r_id
where monthname(o.date)='june'group by o.r_id,r.r_name having revenue>500






#	Q6. Find the restaurants with maximum repeated customerts

select r_id,user_id, count(*) as 'visit' from orders group by
r_id,user_id

select r_id,user_id, count(*) as 'visit' from orders group by
r_id,user_id having visit>1


select r_id, count(*) as 'loyal_customer'
from (select r_id,user_id, count(*) as 'visit' from orders group by
r_id,user_id having visit>1)t group by r_id


select r.r_name, count(*) as 'loyal_customer'
from (select r_id,user_id, count(*) as 'visit' from orders group by
r_id,user_id having visit>1 ) t
inner join restaurants r On
r.r_id=t.r_id
group by t.r_id, r.r_name
order by loyal_customer desc
limit 1






