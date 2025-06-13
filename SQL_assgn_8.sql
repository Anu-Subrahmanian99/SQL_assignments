create database Global_Employees_5;
use Global_Employees_5;

create table COUNTRY(
ID int auto_increment  primary key ,
Country_Name varchar(50) not null default 'Unknown',
Population int not null,
Area decimal(10,2) not null);

insert into COUNTRY (Country_Name,Population,Area)
values
('USA','2300000','5566770.00'),
('CANADA','3300000','3346789.00'),
('JAPAN','43000000','4454530.50'),
('GERMANY','5300000','9876540.21'),
('DENAMRK','63000000','8566770.55'),
('FINLAND','7300000','5566770.00'),
('UAE','8300000','12300.55'),
('OMAN','1300000','155600.60'),
('EGYPT','1400000','76534.51'),
('AUSTRALIA','4500000','9500000.90');



create table PERSONS(
ID int auto_increment  primary key ,
Fname varchar(50) not null default 'Unknown',
Lname varchar(50) not null default 'Unknown',
Population int not null,
Rating float,
Country_Id int,
Country_Name varchar(50) not null default 'Unknown',
foreign key  (Country_Id)  references  COUNTRY(ID));



insert into PERSONS (Fname,Lname,Population,Rating,Country_Id,Country_Name)
values
( 'Bershka', 'Eleve', '2300000', 4.5, 1,'USA'),                     
( 'Fraiza', 'khan', '3300000', 4.8, 2,'CANADA'),                    
( 'Rishwa', 'noel', '63000000', 4.7, 5,'DENAMRK'),                  
( 'Kiya', 'Default', '7300000', 4.2, 6,'FINLAND'),                  
( 'Reya', 'rizza', '8300000', 4.6, 7,'UAE'),                        
( 'Hersha', 'karl', '2300000', 4.3, 1,'USA'),                       
('Mirsha', 'walkers', '5300000', 4.4, 4,'GERMANY'),                 
('Kiara', 'joseph', '3300000', 4.5, 2,'CANADA'),                    
('Lara', 'george', '2300000', 4.7, 1,'USA'),                        
('Viana', 'newmen', '3300000', 4.8, 2,'CANADA') ,                  
( 'Nishita', 'NULL', '1300000', 4.4, 3,'JAPAN'),                     
( 'Krishitha', 'NULL', '1500000', 4.8, 2,'CANADA');


select * from    PERSONS;





select Country_Name, count(*) as number_people from PERSONS group by Country_Name;


select Country_Name, count(*) as number_people from PERSONS group by Country_Name  order by number_people desc;


select Country_Name,avg(Rating) as average_rating from  PERSONS group by Country_Name having(avg(Rating))>3.0;


select Country_Name
 from PERSONS
 where Country_Name in(select Country_Name from PERSONS group by Country_Name having round((Rating),2)
        =(select  round(avg(Rating),2 ) from PERSONS  where Country_Name='USA'));
        
        
        
select Country_Name
from COUNTRY
group by  Country_Name having avg(Population) >(select avg(Population) from COUNTRY);
 

create database Product;
use Product;


create table Customer  
(Customer_ID int auto_increment primary key,
 First_name varchar(50) not null default 'Unknown',
 Last_name varchar(50) not null default 'Unknown',    
 Email varchar(100),
 Phone_No varchar(15),
 Adress varchar(500),
 City varchar(50),
 State varchar(50),
 Zip_Code varchar(10),
 Country varchar(5));
                                              
 insert into Customer ( First_name,  Last_name,    Email, Phone_No,  Adress, City,State,  Zip_Code ,  Country)
 values('Ayina','Rich','ayina@111.com','9898989898','24th street',' Mariya city','Roskilde','111','Finland'),
	   ('Miliya','Mann','miliya@222.com','7897887878','Kth th street',' South city','California','222','USA'),
       ('Perk','Pen','perk@333.com','6868686868','Mial street','central city','Oolu','333','Finland'),
       ('Mariya','Joseph','mariya@444.com','5656565656','3rd juLy street','Sharja','sharja','444','UAE');
       

ALTER table Customer
modify column country  varchar(15);


create view Customer_info 
as
select concat(First_name ,' ',Last_name) as full_Name ,Email from Customer;

select * from   Customer_info ;


create view US_Customers
as
select concat(First_name, ' ',Last_name) as full_Name ,Email from Customer;

select * from   US_Customers ;



create view Customer_Details 
as
select concat(First_name, ' ',Last_name) as full_Name ,Email, Phone_No ,State from Customer;

select * from   Customer_Details ;

SET SQL_SAFE_UPDATES = 0;   --  
update Customer_Details 
set Phone_No='5454545454'
where  State='California';
SET SQL_SAFE_UPDATES = 1;

-- or

update Customer
join   Customer_Details on Customer_Details.state=Customer.state
set Customer.Phone_No='5454545454'
where Customer.State='California';




select State ,count(*)  as number_customers from Customer
group by state
having count(*)>5;


select state ,count(*)  as number_customers
from  Customer_Details 
group by state ;

 


select  * from  Customer_Details 
order by state asc ;
