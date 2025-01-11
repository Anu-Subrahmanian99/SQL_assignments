create database sales;
use sales;
create table orders(
order_id int auto_increment primary key,
customer_name varchar(150) not null,
product_category varchar(120),
ordered_item varchar(245),
contact_no varchar(15) unique
);

desc orders;

alter table orders
add column order_quality int check (order_quality between 1 and 5);

rename table orders to sales_orders;  

insert into sales_orders
values 
('12', 'Charles' , 'electronics' , 'laptop' , '12322345','1'),
('13', 'Samuel' , 'Toy' , 'Doll' , '12326645','2'),
('14', 'Anu' , 'electronics' , 'mobile' , '123223666','3'),
('15', 'Sachin' , 'grocery' , 'vegetables' , '123777745','3'),
('16', 'Megha' , 'things' , 'water bottle' , '12222245','4'),
('17', 'Marie' , 'drinks' , 'milkshake' , '12334565','4'),
('18', 'Fathima' , 'stationary' , 'book' , '12327896','5'),
('19', 'Prakash' , 'clothes' , 'pants' , '67892345','5'),
('20', 'Priya' , 'electronics' , 'fridge' , '89022345','4'),
('21', 'Shalin' , 'plants' , 'plants' , '345622345','5');

select * from sales_orders;
select customer_name from sales_orders;
select ordered_item from sales_orders;

update sales_orders set product_category = 'stationary' where order_id = 16;

drop table sales_orders;
