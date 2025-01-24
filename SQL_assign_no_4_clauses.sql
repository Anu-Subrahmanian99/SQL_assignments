create database countryDB;
use countryDB;
create table country(
id int auto_increment primary key,
country_name varchar(150) not null,
population INT CHECK (population >= 0),
area DECIMAL(15,2) CHECK (area > 0)
);

create table persons(
id int auto_increment primary key,
Fname varchar(150) not null,
Lname varchar(120),
population int check (population >= 0),
rating decimal(3,1) not null check (rating >= 0 and rating <= 5),
country_id int,
country_name varchar(150) not null
);

INSERT into country 
VALUES 
(default, 'India', 1400000000, 3287263.00),
(default, 'USA', 331000000, 9833520.00),
(default, 'Australia', 25687041, 7692024.00),
(default, 'Canada', 98979656, 8792024.00),
(default, 'Africa', 12121234, 456724.00),
(default, 'Nezeland', 34243214, 13456.00),
(default, 'Georgia', 123321123, 2435678.00),
(default, 'Pakisthan', 24589123, 5647894.00),
(default, 'Brazil', 1238701, 5643231.00),
(default, 'UK', 8702341, 12123453.00)
;


INSERT INTO persons (Fname, Lname, population, rating, country_id, country_name)
VALUES  
('ashik', 'usman', 1300000000, 3.5, 3, 'Canada'),
('diya', 'jose', 221000000, 2.1, 2, 'Saudi Arabia'),
('manu', 'pillai', 25687041, 4.5, 5, 'Africa'),
('swathy', 's', 98339656, 3.0, 1, 'Izrael'),
('Amina', 'ashik', 12231234, 2.5, 2, 'Japan'),
('Nima', 'suresh', 34123214, 5.0, 6, 'Serbia'),
('George', 'kenny', 144321123, 3.5, 10, 'China'),
('Parvathy', 's', 26689123, 5.0, 7, 'null'),
('Bunny', 'rahul', 1778701, 1.5, 9, 'UK'),
('Mahesh', 'anil', 8242341, 4.7, 8, 'Australia');


select * from persons
#distinct country name
SELECT DISTINCT country_name FROM persons;

#select first and last name from the table persons
SELECT fname AS FirstName, lname AS LastName
FROM persons;

#all persons greater than rating 4.0
select * from persons where rating > 4.0;

#population greater than 0 lakh
select country_name from persons where population > 0; 

#persons who are from USA or rating greater than 4.5
select * from persons where country_name = 'USA' or rating > 4.5;

#all persons with country name null
select * from persons where country_name = 'null';

#all persons from the USA, CANADA AND UK
SELECT fname, lname 
FROM persons 
WHERE country_name IN ('USA', 'CANADA', 'UK');

#all persons not from india and australia
SELECT fname, lname 
FROM persons 
WHERE country_name NOT IN ('India', 'Australia');

#all countries with population between 5 lakhs and 20 lakhs
select country_name from country where population between 500000 and 2000000;

#countries whose name names do not start with 'C'

SELECT country_name 
FROM country
WHERE country_name NOT LIKE 'C%';
