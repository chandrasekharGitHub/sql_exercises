create database constraintsDemo;

use constraintsDemo;

create table customers(
	id int auto_increment,
    name nvarchar(50) not null,
    address nvarchar(250),
    primary key(id)
);

insert customers values (1, 'Ramesh', 'Chennai');

select * from customers;

insert customers(name,address) values ('Rajesh', 'Bangalore');

insert customers values (5, 'Mahesh', 'Chittoor');

insert customers(name,address) values ('Prahash', 'Kolar');

insert customers(address) values('Mumbai');

insert customers (name) values ('Divya');

select * from customers;

insert customers values (1, 'Chaithu', 'Bangalore');

insert customers values (null, 'Chaithu', 'Bangalore');

insert customers(name,address) values ('Chaithu', 'Bangalore');

insert customers(name,address) values (null, 'Bangalore');

insert customers(name,address) values ('Priya', null);

insert customers(name,address) values ('', 'Bangalore');

-- a null value is never equal to an empty ('').
select * from customers;

insert customers values (1, 'Ramesh', 'Chennai');

-- foreign key constraint
drop table departments;

create table departments(
	department_id int not null primary key,
	department_name nvarchar(50) not null,
	description text
);

insert departments values
(1, 'Management', 'All managers'),
(2, 'Faculties', 'All Faculties'),
(3, 'Accountants', 'All accountants'),
(4, 'Projects', 'All programmers');

select * from departments;

create table employees(
	employee_id int not null primary key,
    employee_name nvarchar(50) not null,
    salary double,
    department_id int references departments(department_id)
);


insert employees values(101, 'Ramesh', 45000, 1);

insert employees values(102, 'Prahash', 40000, 4);

insert employees values(103, 'Divya', 3500, 3);
insert employees values(104, 'Chaithu', 55000, 4);
insert employees values(105, 'Priya', 90000, 1);
insert employees values(106, 'Zerina', 25000, 2);
insert employees values(107, 'Chandru', 20000, 2);

insert employees values(108, 'Mahesh', 50000, null);

select * from employees;






