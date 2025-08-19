create database projects;
use projects;
select * from ds_salaries;

/*1 You're a Compensation analyst employeed by a multinational corporation.
Your Assignment is to Pinpoint Countries who give work fully remotely, for  the title 'managers' Paying salaries Exceeding $90,000 USD*/
select distinct company_location  from ds_salaries where job_title like '%manager%' and salary_in_usd>90000 and remote_ratio=100;


/*2. As a remote work advocate working for a progressive HR tech startup
who place their freshers* clients in large tech firms, You're tasked with
Identifying top 5 country Having greatest count of large(company size) number of companies. */

select * from ds_salaries where experience_level ='EN' and company_size="L";

select company_location, count(*) as 'cnt' from
(select * from ds_salaries  where experience_level='EN' and company_size="L")
t group by company_location order by cnt desc limit 5;

/*3. Picture yourself as a data scientist working for a workforce management platform. Your objective 
who enjoy fully remote roles with salaries exceeding $100,000, Shedding light on the attractiveness*/

set @total = (select count(*) from ds_salaries where salary_in_usd>1000000);

set @counts = (select count(*) from ds_salaries where salary_in_usd>100000 and remote_ratio =100);

select @percentage = (select @counts)/(select @total)*100;

select @percentage as 'percentage'


/*4. imagine you're a data analyst working for a global recruitment agency. Your task is to  identify the location where entry-level
average salaries exceed the average salary for that job title in market for entry level, helping your agency guide candidate towards lucrative countries. */
 
select * from ds_salaries

select  t.job_title, company_location, average_per_cnt* from
 (select job_title, avg(salary_in_usd) as 'average' from ds_salaries group by job_title)t

inner join
(select company_location, job_title, avg(salary_in_usd) as 'average_per_cnt' from ds_salaries group by job_title, company_location)
c on t.job_title=c.job_title where average_per_cnt>average;



/*5. You've been hired by a big HR Consultancy to look at how  much people get paid in different countries. Your job is to find out 
country pays the maximum  average salary. This helps you to place your candidates  in those countries. */

select* from (select *, dense_rank() over(partition by job_title order by average desc) as 'num' from

(select company_location, job_title, avg(salary_in_usd) as 'average' from ds_salaries group by company_location, job_title)
t)k where num=1


/*6. You're a database adminstrator tasked with role-based access control for a company's employee database.
Your goal is  to implement a security measure
where employees in different experience level (eg. Entry level, senior level etc.)
can only access details relevant to their  respective experience_level, ensurig data
confidentially and minimizing the risk of unauthorized access.*/

#DCL -Grant, Revoke

create user 'Entry_level'  @'%' identified by 'EN'

create view entry_level as
(select * from ds_salaries where experience_level = 'EN')

Grant select on project.Entry_level to 'Entry_level'  @'%' #yaha pr view ka name aayega

show privileges
