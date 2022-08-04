drop database colleges;

create database colleges;

use colleges;

create table students (
	student_id int,
    student_name nvarchar(50),
    course nvarchar(25),
    fees double
);

insert students values(101, 'Rajesh', 'java', 2000);

select * from students;

insert into students values (102, 'Anish', '.Net', 4000);

insert students values
(103, 'Mahesh', 'PHP', 1000),
(104, 'Chaithu', 'Python', 3500),
(105, 'Divya', 'Angular', 2500),
(106, 'Sujay', '.Net' , 4000); 

select * from students;

select student_id, student_name, course, fees from students;

select student_name from students;

select student_name, course from students;


select * from students where course='java';

delete from students where student_id = 103;

delete from students where student_name = 'Divya';

select student_id, student_name, course, fees from students;

delete from students where course in ('Angular', 'Python');

delete from students where course = 'Angular' or course = 'Python';

delete from students;

select * from students;

drop table students;




