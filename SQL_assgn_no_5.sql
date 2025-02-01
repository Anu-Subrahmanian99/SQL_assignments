create database details;
use details;
create table country(
id int auto_increment primary key,
country_name varchar(15) not null,
population INT CHECK (population >= 0),
area DECIMAL(15,2) CHECK (area > 0)
);

create table Persons(
id int auto_increment primary key,
Fname varchar(15) not null,
Lname varchar(15),
population INT CHECK (population >= 0),
rating decimal(3,1) not null check (rating >= 0 and rating <= 5),
country_id int,
country_name varchar(150) not null
);

#insert 10 rows

INSERT into country 
VALUES 
(default, 'India', 1402300000, 3287263.00),
(default, 'USA', 33100000, 9833520.00),
(default, 'Germany', 25677041, 7692024.00),
(default, 'Srilanka', 18979656, 8792024.00),
(default, 'France', 22121234, 456724.00),
(default, 'Poland', 33243214, 13456.00),
(default, 'Georgia', 23321123, 2435678.00),
(default, 'Bhutan', 2589123, 5647894.00),
(default, 'Afganisthan', 1438701, 5643231.00),
(default, 'Myanmar', 8702341, 12123453.00)
;

INSERT into persons (Fname, Lname, population, rating, country_id, country_name)
VALUES 
('ashik','usman', 1300000000,3.5,3,'Canada'),
('diya','jose', 221000000,2.1,2,'Saudi Arabia' ),
('manu','pillai', 25687041,4.5,5,'Africa' ),
('swathy','s' ,98339656,3.0,1,'Canada' ),
('Amina','ashik',12231234,2.5,2,'canada' ),
('Nima','suresh', 34123214,5.0,6,'Serbia' ),
('George','kenny', 144321123,3.5,10,'China' ),
('Parvathy','s', 26689123,5.0,7,'Ireland' ),
('Bunny','rahul', 1778701,1.5,9,'UK' ),
('Mahesh','anil', 8242341,4.7,8,'Australia')
;

#print the first 3 characters of country_name from country table

select left(country_name , 3) from country
limit 3;

#concatenate fname and lname from persons table.
SELECT CONCAT(fname, ' ', lname) AS full_name
FROM persons;

#to count no of unique country from the person table
SELECT COUNT(DISTINCT country_name) AS unique_country_count
FROM persons;

#maximum population from the country table
select max(population) as maximum_population from country;

#minimum population from the persons table
select min(population) as minimum_population from persons;

#insert 2 new rows to person table from making the lname null
insert into persons (Fname, Lname, population, rating, country_id, country_name)
values
('Anand',null, 1778701,4.5,9,'ukrain' ),
('Gayantika',null, 8242341,5.0,8,'czech republic')
;

#count the Lname from the person table
SELECT COUNT(Lname) AS total_count
FROM persons;

#to find no of rows in persons table
SELECT COUNT(*) AS total_rows
FROM persons;

#show the population of first 3 rows of country table
select * from country order by population limit 3;

#print 3 random rows of country
SELECT *
FROM country
ORDER BY RAND()
LIMIT 3;

#list all persons by rating in desc order 
select * from persons order by rating desc;

#total population for each country in persons table
select country_name,sum(population) as total_population from persons group by country_name;

#find countries in the persons table with a total population greater than 50,000.
select country_name , sum(population) as total_population from persons  group by country_name having sum(population)>50000;

#list the total no of persons and average rating for each country,but only for the country for more than 2 persons, ordered by the average rating in asc order.
SELECT Country_name, COUNT(*) AS total_persons, AVG(Rating) AS average_rating
FROM persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY average_rating ASC;