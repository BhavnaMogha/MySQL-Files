#DCL -Grant, Revoke

create user 'Entry_level'  @'%' identified by 'EN'

create view entry_level as
(select * from ds_salaries where experience_level = 'EN');

Grant select on project.Entry_level to 'Entry_level'  @'%' #yaha pr view ka name aayega

-- show privileges
