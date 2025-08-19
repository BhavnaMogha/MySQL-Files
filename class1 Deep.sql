select 1+2;
select 1-2;
select 1*2;
select 2/4;
select round(3.1777,2);
select round(4/4,0);
select 5%2;
select mod(5,2);
select abs(-50);
select rand(); #it generates random number between 0 to 1
select rand()*10;
select (rand(10)*20);
select round(rand()*10,0);
select pow(6,3);
select sqrt(4);

#string function
select upper('hello');
#OR
select ucase('hii');
select lower('HII');
select lcase('HII');

select left('apple',2);
select right('apple',3);

#trim
select trim("  Bhavna  ");
select instr('apple','1'); 
select instr('apple','p');
select concat('bhavna', 'mogha');
select concat_ws('/','bhavna','mogha');
select reverse('bhavna');

#Date and time functions
select current_date();
#OR
select curdate();
select now();
select year(curdate());
select month(curdate());
select day(curdate());
select monthname(curdate());
select dayname(curdate());

#add date
select adddate(curdate(),interval 10 day);
select adddate(curdate(),interval 10 month);
select adddate(curdate(),interval 10 year);
select dayname('1990-09-30');

#create
create  database weekend;
show databases;
use weekend;

create table employee(
emp_id int,
emp_name varchar(255),
age int,
dept varchar(255),
salary int,
city varchar(255));

show tables;

insert into employee(emp_id,emp_name,age,dept,salary,city)
values(101,'bhavna',20,'sales',500000,'baraut'),
(102,'deep',22,'sales',800000,'delhi'),
(103,'liya',35,'IT',900000,'noida'),
(104,'ram',29,'sales',500000,'pune'),
(105,'ran',42,'sales',800000,'UP'),
(106,'lay',32,'sales',900000,'delhi'),
(107,'bhavna',62,'sales',500000,'baraut'),
(108,'deep',20,'sales',800000,'delhi'),
(109,'liya',67,'sales',900000,'baraut'),
(110,'bhavna',26,'sales',500000,'noida'),
(111,'deep',73,'sales',800000,'baraut'),
(112,'liya',50,'sales',900000,'baraut');


select * from employee;
select emp_name, dept from employee;
truncate table employee;
   
drop table employee;

#operators are my symbols that performs certain operations
#1.Arithmatic Operators
#2.Comparison Operators
#3.logical Operators
#4.Membership Operators

#Arithmetic Operators are resposible calculation
#1.Addition  +, Substration, multiplication *,division /, modulus %

select *from employee;

select age+1 from employee;
select age-2 from employee;

#comparison Operators are responsible for comparing the values
#equal to =
#Not equal to != OR <>
#greater than >
#less than <
#greater than equal to >=
#less than equal to <=

#if I want to use any condition use '''''Where''
select * from employee;

#fetch those employee who are working in delhi

select * from employee where city ='delhi';
select emp_name from employee where city = 'delhi';

#fetch those employee who are not working in delhi;

select * from employee where city!= "delhi";
select * from employee where city<> "delhi";

#fetch those employee who are working in IT 
select * from employee where department = 'IT';

#fetch the data of those employee where salary is greater than equal to 50K
select * from employee where salary >=50000;

#LOGICAL Operators : and, or, not
 #and -- when both the condition is true result will be true
 #or--- when any one condition is true or both condition are true then result will be true
 #not -- it revert the condition 
 
 #fetch the data of all those employee whose age is in between 25 to 35
 select * from employee where age>=35 and age<=35;
 
 #fetch the data of those employee whose age is greater than 30 and are working in delhi
 select * from employee where age>30 and city= 'delhi'; 
 
 #fetch the data of those employee whose age is less than 30,city is delhi,working in it department
 select * from employee where age<30 and city = 'delhi' and dept = 'IT';
 
 #fetch the data of those employee who are not working in delhi and their salary is in between 30k-50k
 select * from employee where city <> 'delhi' and salary>= 300000 and salary <=500000;
 
 #fetch the data of those employee who either working in delhi ,pune
 select * from employee where city ='delhi' or city = 'Pune';
 
 #Membership Operators 
 #in
 select * from employee where city not in ('delhi','Pune');
 select * from employee where city  in ('delhi','Pune');

#----------Aggregation Function------------
#sum, count ,min ,max

use weekend;
select * from employee;
select max(salary) from employee;

#fetch the minimum salary
select min(salary) from employee;

#fetch the total salary
select sum(salary) from employee; 
 
 #fetch the avg salary
 select avg(salary) from employee;

#fetch the average salary in whole number
select round(avg(salary)) from employee; 
 
#count the number of records in the table
select count(*) from employee;
select count(dept) from employee;

select dept from employee;
#display the unique dept
select distinct(dept) from employee;

#count the unique dept in the table
select count(distinct(dept)) from employee;

#write a query to check whether the employee having the same salary or not
select count(distinct(salary)) from employee;

#----nested query / subquery----------

select * from employee where salary=(select max(salary) from employee);

#write a query to display those who are earning more than avg
select * from employee where salary>(select avg(salary) from employee);

#how many employee are earning more than average
select count(*) from employee where salary>(select avg(salary) from employee);

#how many employee are earning minimum salary
select * from employee where salary=(select min(salary) from employee);

#tell me the name of the youngest employee
select * from employee where age=(select min(age) from employee);

#how many employees are working in IT dept
select count(*) from employee where dept='IT';

#how many employee are working in IT dept, also age is greater than 28
select *from employee where dept ='IT' and age>28;

#---------group by---------------
#how may employee are working in various dept
select dept,count(*) from employee group by dept;

#fetch the dept of different cities where employee are working
select city,dept,count(*) from employee group by dept,city;

#fetch the  total salary of each dept of different cities where employee are working
select city, dept, sum(salary) from employee group by city,dept;

#fetch the maximum salary of each dept
select dept, max(salary) from employee group by dept;

#-------------------Alter update-----------------

#alter is used to drop a particular
#alter is used to add columns
#alter is used to rename the columns

#how to drop a particular column
alter table employee drop column city;

select * from employee;
 
 #how to drop multiple columns
 alter table employee drop column age, drop column salary;
 
#how to add columns
alter table employee add column age int; 

#to add multiple columns
alter table employee add column (salary int, city varchar(20));

#to count the missing values in multiple columns
select count(*)-count(emp_name),count(*)-count(age) from employee;

#to rename the column
alter table employee rename column salary to wages;

#to rename the multiple columns
alter table employee rename column city to cities, rename column age to Age;

use weekend;
select * from employee;

#alais --- Notation
drop table employee;
select * from employee;
select dept, sum(salary) as totalsalary from employee group by dept;

select dept ,max(salary) as highest_salary from employee group by dept;

#update

set SQL_SAFE_UPDATES=0;
select *from employee;
update employee set wages = 90000 where emp_id=103;

#write a query to update wages 50000 for emp_id in between 101-103;
update employee set wages=50000 where emp_id>=101 and emp_id<=103;

#to update values in multiple columns
update employee set age=27,wages=10000 where emp_name='deep';

#update the salary of IT employee
update employee set wages=150000 where dept='IT';

#count the missing values employee set age=27,wages=10000 where emp_name='deep';
select count(*)-count(age),count(*)-count(wages),count(*)-count(cities) from employee;

#update  the city agra for the emp_id 107
update employee set cities='agra' where emp_id=107;

#update the city by noida for the dept HR
update employee set cities='noida' where dept='HR';
update employee set cities='baraut' where dept='IT';

update employee set cities='delhi' where dept='marketing';

select count(*)-count(cities) from employee;

#update the city by agra those employee working either in account,sales
update employee set cities='agra' where dept='sales' or dept='account';

#update the age  pof all employee by random number in between 20-50

select round(20+rand()*30);

update employee set  age = round(20+rand()*30) where age is null;

#select avg_age from (select avg(wages);


#having clause
#WRITe a query to find the dept with total salary more than 
select dept ,sum(wages) from employee group  by dept having sum(wages)>400000;

#to display those cities where the avg age is greater than 32
select cities ,avg(age) from employee group by cities having  avg(age)>32;

#to find those dept  where the maximum salary is less than 5 lakhs
select dept , max(wages)from employee group by dept having max(wages)=150000;

#to display those dept where employee are more than 5
select  dept, count(*)from employee group by dept having count(*)>5;

#to display those dept where minimum age is greater than 45
select dept, max(age) from employee group by dept having max(age)=45;

#Assignment1 Questions

#Q1---Replace the sales department from IT department.
select replace(dept,'sales','IT') from employee;

#OR ( if  uhh want to make change in the original table use this command)
Update employee set dept = 'IT dept' where dept = 'sales dept';

#Q2---Write a query to display the first three characters of each employee's name.
select left(name,3) from employee;
        #OR
select substr(name,1,3) from employee;

#Q3---Write a query to display the last two character of each employee's name.
select right(name,2) from employee;
    #OR
select name, substr(name,-2) from employee;   
    
#Q4---Write a query to display the names of employees in reverse order.
select reverse(name) from employee;


#Q5---Find the email addresses of employees who work in the city 'Delhi'.
select email from employees where city='delhi';
select * from employee;

use assignment;

#Q6-- Find the email addresses of employee who work in the  city 'Delhi'.

#Q7---Count the number of employees in each dept.
select dept , count(name) from employee group by dept;

select Dept , Count(name) from Employee Group by dept;



#Q7---Find the names and email addresses of employee who earn the highest salary in each department.
select name, email, max(salary), dept from employee group by dept;
select name from employees where (department,salary) in (select department, max(salary) from employee group by department);

select name from employee where max_sal=(select dept, max(salary) as max_sal from employee group by dept);

#Q8----Write a query to display those employee whose salary are even
select * from employees where salary %2 =0;

#Q8-----Retrieve the name of employee whose names start with the letter 'A' and are from the city 'Mumbai'.
select name,city from employee where name like 'a%' and city='mumbai';

select name from employee where name like 'A%' and city='mumbau';

#Q9---Write a query to give increment in salary of 10% to those employees who age is greater than 28.
select *,salary+(salary*10)/100 from employee where age >28;

#Q9----Find the names and email addresses of employee who earn the highest salary in each dept.
select dept, name, email, max(salary) from employee group by dept,name,email order by dept;
select name, email from employee where (dept, salary) in (select dept, max(salary) from employee group by dept order by dept);

select Name, Email from employee where (Dept, Salary) in (Select Dept, Max(salary) from employee group by dept order by dept);

#Q10.----Calculate the average salary of employees for each city and display the results in descending order.
select city, avg(salary) from employee group by city order by avg(salary) desc;
select city, avg(salary) from employee group by city order by avg(salary) desc;

#Q11----Retrieve the top 5 highest paid employee names and salaries, ordered by salary in descending order.
select name,max(salary) from employee group by name order by max(salary) desc limit 5;

#Q12---Find the names of employee who have the second -highest salary in the company.
select name, salary from employee where salary< (select max(salary) from employee  order by salary desc limit 1);

select name, salary from employee where salary=(select distinct(salary) from employee  order by salary desc limit 1,1);

select name, salary from employee where salary=(select distinct(salary) from employee  order by salary  limit 1,1);

drop table employee;
use weekend;
select * from employee;


#write a  query to show cities where the sum of salaries for employees in the  'Sales' department is less than 100,000

select city, sum(salary) from employee where dept= 'salary' group by city having sum(salary)<100000;
select city,dept, sum(salary) from employee group by dept, city;

# Write a query to find the cities where there are more than 2 employees earning  a salary greater than 4000.
select city, count(*) from employee where salary>1000 group by city having count(*)>2;

#write a query to show the names of employees in departments where the average salary is greater than 35,000.
select emp_name, salary from  employee where dept in (select dept from employee group by dept having avg(salary)<200000);
select emp_name, salary from  employee where (dept,salary) in (select dept, avg(salary) from employee group by dept having avg(salary)<200000);
(select dept, avg(salary) from employee group by dept having avg(salary)<350000);


#write a query to find the department with the highest average salary?
select dept,avg(salary) as avg_salary from employee group by dept having avg(salary)=
(select max(avg_salary) from (select avg(salary) as avg_salary from employee group by dept) as subquery);

#constraint
#1.Primary Key
#2.Unique key
#3. Not null
#4 . check constraint
# 5. Eum
#6. default

create table student(id  int auto_increment primary  key,
name varchar(30) not null,
age int check(age<=30),
course varchar(30) default 'M tech',
Gender enum('M','F'),
email_id varchar(30) unique);

select * from student; 
insert into student (id,name ,age,course,Gender,email_id)
values(102,'bhavna',20,'b.tech','F','abc@123');

insert into student (id,name ,age,course,Gender,email_id)
values(103,'ram',20,'b.tech','M','ram@123');

insert into student (id,name ,age,Gender,email_id)
values(104,'rita',20,'F','lbc@123');

insert into student (id,name ,age,course,Gender,email_id)
values(102,'sita',20,'b.tech','F','abc@123');


#order by
#if I want to average  my data in ascending  order by salary  column
select * from employee order by salary asc;

#if I want to average  my data in descending  order by salary  column
select * from employee order by salary desc;

#limit clause
select * from employee limit 5;

select *from employee limit 5,3;

#find the top 3 employee who are earning maxinmum salary

select * from employee order by salary desc limit 3;

#find the no. of emplyee who are working in individual dept anf arrange in descending order
select dept, count(dept) from employee group by dept order by count(dept) desc;

#write  a query to find the dept with the highest avg salary?
select dept, avg(salary) as avg_salary from employee group by dept having avg(salary)=
(select max(avg_salary) from (select avg(salary) as avg_salary from employee group by dept) as subquery);

#OR
select dept, avg(salary) from employee group by dept order by avg(salary) desc limit 1;

######### Wild card characters #############
#select the name which start with a 
select * from employee where emp_name like "a%";

#select the name which end with a
select * from employee where emp_name like "%a";

#select the name where a is present at the 3rd position  from starting
select * from employee where emp_name like "_a%";

#select the name a is present at 2nd last position
select * from employee where emp_name like "%a_";

#if uhh want to check that whether a is present at any position
select * from employee where emp_name like "%a%";


#if uhh want to check that whether a is not present at  position
select * from employee where emp_name not like "%a%";

#fetch the data of all  those employee whose salary are starts with 6
select * from employee where salary  like "6%";

#fetch the data of  those employee where 5 is present in their salary
select * from employee where salary  like "%5%";


#case when

#categorize the salary as high those salary is greater than 600000, avg 35000 to 60000,low

select *,
case when salary>600000 then 'High salary'
when salary>= 350000 and salary<= 600000 then 'avg salary'
else 'low salary'
end as 'Income Status' from employee;


#label the dept as underpaid as well paid when their avg salary is greater than 50k?
select dept,
case when avg(salary)>50000 then 'Well paid'
else 'underpaid'
end as 'dept performance' from employee group by dept;

#classify the employee into age groups?
#young less than 28 , Middle age in between 28-40, senior

select *,
case when age<28 then 'young'
when age>=28 and age<=40 then 'middle age' else 'senior' end as 'age group' from employee;


#list the employee with a type of dept label based on dept names?

#IT, HR-------------Technical/Administratative 
#sales, Marketing-------------Non technical
#otherwise-----------other

select * ,
case when dept in('IT','HR') then 'technical/Adminstration'
when dept = 'sales' or dept = 'Marketing' then 'non-technical'
else 'other' end as 'dept_type' from employee;


#view
create view EIS as
select*,
case when salary>60000 then 'high salary'
when salary>=350000 and salary<=60000 then 'avg salary'
else 'Low salary'
end as 'Income Status' from employee;


select * from EIS;

#if you want to add the result of case when in your original table
alter table employee add column salary_category varchar(50);

select * from employee;


set SQL_SAFE_UPDATES=0; #this is the solution for safe update error for those who are using sql latest

update employee
set salary_category= 
case when salary>400000 then 'high salary'
when salary >= 35000 and salary<=600000 then 'avg salary'
else 'Low salary'
end;

#delete
#delete the record of an employee with emp_id 101?
delete from employee where emp_id=101;

#delete all employees from sales dept
delete from employee where dept = 'sales';

select * from employee;
