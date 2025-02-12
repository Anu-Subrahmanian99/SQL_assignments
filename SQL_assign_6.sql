create database joints;
use joints;
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
(default, ' ', 8702341, 12123453.00)
;

INSERT into persons (Fname, Lname, population, rating, country_id, country_name)
VALUES 
('ashik','usman', 1300000000,3.5,3,'Canada'),
('diya','jose', 221000000,2.1,2,'Saudi Arabia' ),
('manu','pillai', 25687041,4.5,5,'Africa' ),
('swathy','s' ,98339656,3.0,1,'Canada' ),
('Amina','ashik',12231234,2.5,2,'canada' ),
('Nima','suresh', 34123214,5.0,6,'Bhutan' ),
('George','kenny', 144321123,3.5,10,'China' ),
('Parvathy','s', 26689123,5.0,7,'Ireland' ),
('Bunny','rahul', 1778701,1.5,9,'UK' ),
('Mahesh','anil', 8242341,4.7,8,'Australia')
;
#inner joint
select p.id, p.fname, c.country_name, c.area from persons p 
inner join country c on p.country_id = c.id;

#left joint
SELECT 
    p.id AS person_id,
    p.Fname,
    p.Lname,
    p.population AS person_population,
    p.rating,
    p.country_id,
    p.country_name AS person_country_name,
    c.id AS country_id,
    c.country_name AS country_name,
    c.population AS country_population,
    c.area AS country_area
FROM 
    Persons p
LEFT JOIN 
    country c
ON 
    p.country_id = c.id;
    
    #right join
    SELECT 
    p.id AS person_id,
    p.Fname,
    p.Lname,
    p.population AS person_population,
    p.rating,
    p.country_id,
    p.country_name AS person_country_name,
    c.id AS country_id,
    c.country_name AS country_name,
    c.population AS country_population,
    c.area AS country_area
FROM 
    Persons p
right JOIN 
    country c
ON 
    p.country_id = c.id;

#list distinct country from both the tables
SELECT DISTINCT country_name
FROM country
UNION
SELECT DISTINCT country_name
FROM Persons;

#list all country names from both the country and persons table, including duplicates
SELECT country_name
FROM country
UNION ALL
SELECT country_name
FROM Persons;

#round the ratings of all persons to the nearest integer in the persons table
SELECT Fname, Lname, Rating, ROUND(Rating, 0) AS RoundedRating
FROM persons;
UPDATE persons
SET Rating = ROUND(Rating, 0);

