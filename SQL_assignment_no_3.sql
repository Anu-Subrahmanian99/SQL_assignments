create database Survey;
use survey;
create table managers(
manager_id int auto_increment primary key,
first_name varchar(15) not null,
last_name varchar(15),
DOB date not null,
age int not null,
last_update timestamp not null default current_timestamp,
gender char(1) not null check(gender in ('M','F','O')),
department varchar(100) not null,
salary decimal(10,2) check (salary>0)
);
#insert 10 rows

insert into managers
values
(default, 'veer', 'moorty', '1990-05-15', 35, DEFAULT, 'M', 'HR', 55000),
(default, 'Aaliya', 'S', '1999-05-15', 25, DEFAULT, 'F', 'administrator', 30000),
(default, 'Santhosh', 'george', '2000-05-03', 24, DEFAULT, 'M', 'HR', 18000),
(default, 'Asha', 'manu', '2001-05-15', 23, DEFAULT, 'F', 'IT', 23000),
(default, 'deepa', 'pradeep', '1997-11-15', 27, DEFAULT, 'F', 'HR', 31000),
(default, 'Nisha', 'fathima', '1998-01-10', 26, DEFAULT, 'F', 'operational', 12000),
(default, 'ganesh', 'sree', '1989-03-31', 36, DEFAULT, 'M', 'IT', 69000),
(default, 'riya', 'tripti', '1996-08-30', 28, DEFAULT, 'F', 'marketing', 16000),
(default, 'najeeb', 'inshi', '1996-02-28', 28, DEFAULT, 'M', 'specialist', 24000),
(default, 'Aman', 'neeraj', '1987-11-14', 37, DEFAULT, 'M', 'IT', 68000);

#retrieve 
select * from  managers
select first_name, last_name,DOB
from managers
where manager_id = 1;

select salary from managers

#annual income
SELECT 
    manager_id,
    first_name,
    last_name,
    (salary * 12) AS annual_income
FROM 
    managers
LIMIT 10;


#excluding aaliya
select * 
FROM managers
WHERE first_name <> 'Aaliya';

#annual income above 25000 and dept is IT
SELECT *
FROM managers
WHERE department = 'IT' AND (salary) > 25000;

#salary between 10000 and 35000
SELECT *
FROM managers
WHERE salary between 10000 and 35000;