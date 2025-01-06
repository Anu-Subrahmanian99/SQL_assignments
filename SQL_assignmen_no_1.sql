Create database School;

use school;
#creating the table mamed student
create table student(
roll_no INT auto_increment primary key,
student_name varchar(150)not null,
marks INT,
Grade char(1) check (grade in('A','B','C'))
);
#can view the table
desc student;

#added new column named contact
alter table student
add column contact varchar(15);
#removing the grade column
alter table student
drop column grade;

#rename the table
rename table student to classten;

#delete all rows
truncate table classten;

#remove table from database
drop table classten;






