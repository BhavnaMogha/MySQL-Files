create database joins1;
use joins1;

create table x(k int,
 a varchar(50),
 b varchar(50));
 
create table y(k int,
 c varchar(50),
 d varchar(50));
 
insert into x(k,a,b)
values(1,'A0','B0'),(2,'A1','B1'),(3,'A2''B2'),(4,'A3','B3');

insert into y(k,c,d)
values(1,'C0','D0'),(2,'C1','D1'),(3,'C2','D2'),(4,'C3','D3');


select * from x;
select * from y;

select* from x left join y on x.k=y.k;
select * from x right join y on x.k=y.k;

select* from y left join x on x.k=y.k;
select * from x right join y on x.k=y.k;
select * from x inner join y on x.k=y.k;

select * from x left join y on x.k=y.k
union
select * from x right join y on x.k=y.k;

select * from x
cross join y;


#window functions :  window function are my analytical function that perform with aggregations function on row by row.

create database windowfunction1;

use windowfunction1;

create table marks(student_id integer primary key auto_increment,
name varchar(50),
branch varchar(50),
marks integer);

drop table marks;
insert into marks(name,branch,marks) values
('Nitish','EEE',72),
('ram','EEE',92),
('vinny','EEE',52),
('sam','EEE',82),
('tinu','EEE',92),
('litish','EEE',78),
('ritish','EEE',98),
('aitish','EEE',58),
('raitish','EEE',73);

select * from  marks;

#calculate the average marks
select avg(marks) from marks;

select avg(marks) over() from marks;

select* , avg(marks) over() from marks;

#calculate the average marks according to the branch

select branch, avg(marks ) from marks group by branch;

select branch, avg(marks) over(partition by branch) from marks;

#I want  to calculate minimum marks, maximum marks, average marks for all the record

select * , max(mwrks) over(),
min(marks) over() as 'min_marks',
avg(marks) over() from marks;


#I want to calculate minimum marks, maximum marks, average marks  for all the records of each branch

select branch, max(marks) over(partition by branch),
min(marks) over(partition by branch) as 'min_marks',
avg(marks) over(partition by branch) from marks;

#find the statment who have marks higher than the average marks of there respective branch

select * from (select*, avg(marks) over(partition by branch) as 'branch_avg' from marks) t
where t.marks>t.branch_avg;

#some important window functions
#1 .Rank
#2. Dense Rank
#3. Row number
#4. First_value
#5. Lead
#6. LAG

#Assign the rank to the student who is the college

select *, rank() over(order by marks desc) from marks;

#Assign the rank to the student who is the college with respect to the branch
select*, rank() over (partition by branch order by marks desc) from marks;

select *, rank() over(order by marks desc),
dense_rank() over(order by marks desc) from marks;

select *, rank() over(partition by branch order by marks desc),
dense_rank() over(partition by branch order by marks desc) from marks;

#row number

select*, row_number() over() from marks;
select*, row_number() over(partition by branch) from marks;

select*, row_number() over(partition by branch order by marks desc) from marks ;

#assigning the unique roll number according to the branch

select*, concat_ws('-', branch, row_number() over(partition by branch)) from marks;

use windowfunction1;
select * from marks;

#first _ values

#display the student which has  the highest marks
select *, first_value(name) over(order by marks desc) from marks;

select *, first_value(marks) over(order by marks desc) from marks;

select *, first_value(name) over(partition by branch order by marks desc) from marks;


#display the student name row by row who has the minimum marks of each branch

select *, first_value(name) over(partition by branch order by marks desc),
first_value(marks) over(partition by branch order by marks desc) from marks;

#only display the name and marks of the topper of each branch
select name, marks,branch from
(select *, first_value(marks) over(partition by branch order by marks desc) as 'topper_marks',
first_value(name) over(partition by branch order by marks desc) as 'topper_name' from marks)t
where t.marks=t.topper_marks and t.name=t.topper_name;


#find the 2nd highest marks of each branch

select name, branch, marks from (select*, row_number() over(partition by branch order by marks desc) as 'second_high' from marks)
t where second_high=2;


#LAG
#compare the student marks with the previous student marks


select*, Lag(marks) over (order by marks desc) from marks;

select *, Lag(marks) over (partition by branch order by marks desc) from marks;

#Lead
#compare the student marks with the next student marks
select*, lead(marks) over(order by marks desc) from marks;

select*, lead(marks) over(partition by branch order by marks desc) from marks;

#calculate the difference between consecutive marks of students
select name, marks, branch, marks-lead(marks) over(partition by branch order by marks desc) as 'marks_diff' from marks;