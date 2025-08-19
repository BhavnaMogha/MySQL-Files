create database restaurant;
use restaurant;
create table customer_info(
cust_id int primary key,
name CHAR(15),
age int unique key,
city varchar(20),
bill float);

desc customer_info;