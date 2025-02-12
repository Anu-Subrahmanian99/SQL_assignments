create database length;
use length;
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

# add new column to the persons table

ALTER TABLE persons
ADD COLUMN DOB DATE;

#add user-defined function to calculate age using DOB

DELIMITER $$

CREATE FUNCTION CalculateAge(dob DATE) 
RETURNS INT 
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    RETURN age;
END $$

DELIMITER ;


#Write a select query to fetch the Age of all persons using the function that has been created.
select fname, dob, calculateage(dob) as age from persons;

# Find the length of each country name in the Country table.
DELIMITER //

CREATE FUNCTION country_length (country_name varchar(50)) 
RETURNS INT 
DETERMINISTIC
no sql
begin
    RETURN length(country_name);
END //

DELIMITER ;

select country_name, country_length(country_name) as name_length from country;

# Extract the first three characters of each country's name in the Country table.
SELECT 
    country_name, 
    SUBSTRING(country_name, 1, 3) AS first_three_chars
FROM 
    Country;

#Convert all country names to uppercase and lowercase in the Country table.
SELECT 
    country_name, 
    UPPER(country_name) AS country_name_uppercase
FROM 
    Country;

#lowercase
SELECT 
    country_name, 
    LOWER(country_name) AS country_name_lowercase
FROM 
    Country;
