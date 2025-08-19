 # Write a query to display employees having salary greater than 1800 and whose name
 # starts with either ‘s’ or ‘p’
 
 
 select*from customers;
 select distinct(city) from customers;
 select 25+7;
 select 25/7;
 select abs(-25.6);
 select mod(25,3);
 select ceil(25.000001);
 select floor(25.00001);
 select substring('pakistan',2,4);
 drop table pepleinfo;
CREATE TABLE pepleinfo(
people_id int not null,
first_name varchar(20),
last_name varchar(20),
age int check(age>18),
gender varchar(13)
);

desc pepleinfo;
insert into pepleinfo values(101,'jack','smith',19,'male'),
(102,'stark','jhon',19,'male');

select*from pepleinfo;
insert into pepleinfo(people_id,first_name,last_name,age)
values(106,'stephine','jhonson',25);

insert into pepleinfo(first_name,last_name,age)
values('stephine','jhonson',25);

alter table pepleinfo add column city varchar(12) default('atlanta');

select*from pepleinfo where last_name like 'j%';

select*from pepleinfo where last_name like '%n';

select*from pepleinfo where last_name like '%n%';
alter table pepleinfo add primary key(people_id);

desc pepleinfo;
alter table pepleinfo drop column city;
alter table bank_inventory add foreign key(people_id) 
references pepleinfo(people_id);

alter table pepleinfo drop primary key;
alter table pepleinfo modify last_name varchar(20) not null;

select*from pepleinfo where age>19;

select*from ds_salaries;
select job_title,salary from ds_salaries order by salary desc
limit 1;
select job_title,salary from ds_salaries order by salary desc
limit 2 offset 9;


select*from ds_salaries where job_title!='data scientist';
select*from ds_salaries where job_title<>'data scientist';
select*from ds_salaries where salary between 1000000 
and 2000000;



select*from ds_salaries where salary in
(1450000,1250000,1600000);

select*from ds_salaries where salary is not null;