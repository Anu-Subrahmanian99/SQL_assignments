create database LIBRARY;
use LIBRARY;

#create table

create table BRANCH
(
BRANCH_NO int  primary key,
MANAGERS_ID varchar(50),
BRANCH_ADDRESS varchar(100),
CONTACT_NO int  );


select * from BRANCH;

#insert values
INSERT INTO BRANCH (BRANCH_NO, MANAGERS_ID, BRANCH_ADDRESS, CONTACT_NO)
VALUES
(1, 12, 'Mumbai', '97865436'),
(2, 13, 'Chennai', '98342167'),
(3, 15, 'Jaipur', '95674839'),
(4, 16, 'Coimbatore', '23456189'),
(5, 19, 'Kanyakumari', '45363322');




#create another table

create table EMPLOYEE
(
EMP_ID int  primary key,
EMP_NAME varchar(50),
POSITION varchar(60),
SALARY Decimal(10,2),
BRANCH_NO int ,
foreign key (BRANCH_NO) references BRANCH(BRANCH_NO)
);

select * from EMPLOYEE;

insert into EMPLOYEE(EMP_ID,EMP_NAME,POSITION,SALARY,BRANCH_NO)
values
(11,'Ranjith','Clerk','21000',1),
(12,'Siva','Senior Clerk','32000',2),
(13,'Anjali','Clerk','21000',3),
(14,'Anjana','Manager','49000',3),
(10,'Karthika','Manager','57000',4),
(15,'Karthik','AssistantManager','40000',1),
(16,'Fathima','Security','10000',1),
(17,'Gopika','AssistantManager','40000',2),
(18,'Gangothri','Clerk','19000',2),
(19,'Mary','AssistantManager','40000',5),
(20,'Vinayak','Clerk','17000',3),
(21,'Nima','AssistantManager','30000',4),
(22,'Arya','Clerk','19000',5),
(23,'Rishi','AssistantManager','30000',5),
(24,'Anandu','Clerk','18000',5),
(25,'Rajesh','Clerk','18000',2),
(26,'Suresh','Attender','11000',1);




# create table 3

create table BOOKS
(
ISBN varchar(50)  primary key,
BOOK_TITLE varchar(100),
CATEGORY varchar(50),
RENTAL_PRICE Decimal(10,2),
STATUS varchar(4) check(STATUS in('YES','NO')) ,
AUTHOR  varchar(100),
PUBLISHER  varchar(100)
);

insert into BOOKS (ISBN,BOOK_TITLE,CATEGORY,RENTAL_PRICE,STATUS,AUTHOR,PUBLISHER)
values('1-67562-099-7','The Silent Echo','Mystery',50,'YES','Elisa Freilich','MR publishers'),
('1-84592-089-9','Whispers of the Cosmos','Science Fiction',100,'NO','Carl Sagan ','Classic '),
('1-86792-060-1','The Forgotten Kingdom','Fantasy',250,'YES','Signe Pike','Shell'),
('1-82392-045-9','Beneath the Willow Tree','Romance',100,'NO','Stephen Crane','Writters'),
('1-45092-023-4','Echoes of the Past','Historical Fiction',30,'NO','Arthur Conan Doyle','Writters'),
('1-98092-038-1','Mind Over Machine','Non-Fiction',50,'YES','Hubert Dreyfus & Stuart Dreyfus','Shell'),
('1-97800-239-8','The Art of Letting Go','Self-Help',90,'YES','Courtney Joseph','Shell');

select * from BOOKS;




# create table 4

create table CUSTOMER
(
CUSTOMER_ID int  primary key,
CUSTOMER_NAME varchar(50),
CUSTOMER_ADRESS varchar(100),
REG_DATE date
);

insert into CUSTOMER (CUSTOMER_ID,CUSTOMER_NAME,CUSTOMER_ADRESS,REG_DATE)
values(11,'Ajit','Jaipur','2022-01-03'),
(12,'Sunil','Kochi','2023-03-04'),
(13,'Sanit','Delhi','2022-11-09'),
(14,'Das','Gujarat','2022-12-17'),
(15,'Vijith','Hariyana','2023-05-15');

select * from CUSTOMER;


#create table 5

create table ISSUE_STATUS
(
ISSUE_ID int  primary key,
ISSUED_CUST int,
ISSUED_B00K_NAME varchar(50),
ISSUE_DATE date,
ISBN_BOOK varchar(50),
foreign key (ISBN_BOOK) references BOOKS(ISBN),
foreign key (ISSUED_CUST) references CUSTOMER(CUSTOMER_ID)
);

insert into  ISSUE_STATUS(ISSUE_ID,ISSUED_CUST,ISSUED_B00K_NAME,ISSUE_DATE,ISBN_BOOK)
values(30,11,'The Silent Echo','2021-06-10','1-67562-099-7'),
      (32,12,'The Forgotten Kingdom','2023-05-10','1-86792-060-1'),
      (33,13,'Echoes of the Past','2022-01-02','1-45092-023-4'),
      (34,14,'Mind Over Machine','2022-10-10','1-98092-038-1');
      

select * from ISSUE_STATUS;

# create table 6


create table RETURN_STATUS
(
RETURN_ID int  primary key,
RETURN_CUST int,
RETURN_B00K_NAME varchar(50),
RETURN_DATE date,
ISBN_BOOK_2 varchar(50),
foreign key (RETURN_CUST) references CUSTOMER(CUSTOMER_ID),
foreign key (ISBN_BOOK_2) references BOOKS(ISBN)
);


insert into RETURN_STATUS(RETURN_ID,RETURN_CUST,RETURN_B00K_NAME,RETURN_DATE,ISBN_BOOK_2)
values(411,14,'Mind Over Machine','2022-02-16','1-98092-038-1');

select * from RETURN_STATUS;

#Retrieve the book title, category, and rental price of all available books

select BOOK_TITLE,CATEGORY ,RENTAL_PRICE 
 from BOOKS
 where STATUS='YES';
 
 
 #List the employee names and their respective salaries in descending order of salary
 select EMP_NAME,SALARY from EMPLOYEE order by SALARY desc;
 
 
 #Retrieve the book titles and the corresponding customers who have issued those books
 
 select ISSUED_B00K_NAME as BOOK_TITLE,ISSUED_CUST  from 
  ISSUE_STATUS  where ISSUED_B00K_NAME=(select BOOK_TITLE from BOOKS Where BOOK_TITLE= ISSUED_B00K_NAME);   
 
  
#Display the total count of books in each category.

select CATEGORY,count(CATEGORY)  as Total_Number from BOOKS group by  CATEGORY;

#Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

select EMP_NAME,POSITION from EMPLOYEE where SALARY>50000;


#List the customer names who registered before 2022-01-01 and have not issued any books yet

select  CUSTOMER.CUSTOMER_NAME 
from  CUSTOMER 
left join ISSUE_STATUS on ISSUE_STATUS.ISSUED_CUST=CUSTOMER.CUSTOMER_ID
where CUSTOMER.REG_DATE<'2022-01-01' and ISSUE_STATUS.ISSUED_CUST IS NULL;



#Display the branch numbers and the total count of employees in each branch

select EMPLOYEE .BRANCH_NO, count(EMPLOYEE .EMP_ID) as Total_Employees from EMPLOYEE  group by  BRANCH_NO;

#Display the names of customers who have issued books in the month of June 2023

select  CUSTOMER.CUSTOMER_NAME 
from  CUSTOMER 
join ISSUE_STATUS on ISSUE_STATUS.ISSUED_CUST=CUSTOMER.CUSTOMER_ID
where month(ISSUE_STATUS.ISSUE_DATE )=6  and  year( ISSUE_STATUS.ISSUE_DATE)=2023;

#Retrieve book_title from book table containing history

select BOOK_TITLE
from BOOKS
where BOOK_TITLE like '%history%';


#Retrieve the branch numbers along with the count of employees for branches having more than 5 employees



select BRANCH_NO, count(*) as Total_Employees  from EMPLOYEE group by BRANCH_NO  having  count(*) >5;
  
  
# Retrieve the names of employees who manage branches and their respective branch addresses.


select  EMPLOYEE.EMP_NAME ,BRANCH.BRANCH_ADDRESS
from 
EMPLOYEE
join
BRANCH on  EMPLOYEE.EMP_ID=BRANCH.MANAGERS_ID;


#Display the names of customers who have issued books with a rental price higher than Rs. 25.

select  CUSTOMER.CUSTOMER_NAME 
from  CUSTOMER 
join ISSUE_STATUS on ISSUE_STATUS.ISSUED_CUST=CUSTOMER.CUSTOMER_ID
join BOOKS on BOOKS.ISBN=ISSUE_STATUS.ISBN_BOOK
where BOOKS.RENTAL_PRICE>25;


  