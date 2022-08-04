use classicmodels;

-- update the email of employee  Mary Patterson to the new
-- email marry.patterson@outlook.com

select * from employees where firstName = 'Mary';

update employees set email = 'marry.patterson@outlook.com'
where firstName='Mary' AND lastName = 'Patterson';

update employees set email = 'mary.patterson@outlook.com'
where employeeNumber = 1056;

-- update multiple columns

-- update lastname as 'Hill' and email as 'mary.hill@outlook.com' 
-- columns of employee number 1056

update employees set lastName='Hill', email = 'mary.hill@outlook.com'
where employeeNumber = 1056;

-- update by replace function

-- update all employees email as @outlook.com who are having Sales Rep 
-- as job title and who resides in office code 6

select * from employees;


update employees 
set email = replace(email, '@classicmodelcars.com', '@anudip.org')
where jobTitle='Sales Rep' AND officeCode=6;

-- update rows returned by select statement

-- You can supply the values for the SET clause from a select
-- statement that queries the data

-- For example, in the customers table, some customers do not have
-- any sales representative. Fetch such type of rows .

select * from customers;

select customername, salesRepEmployeeNumber from customers;

select customername, salesRepEmployeeNumber from customers
where salesRepEmployeeNumber is null;

-- this query selects a random employee

select employeenumber from employees
    where jobTitle='Sales Rep' 
    order by RAND() LIMIT 1;

update customers set salesRepEmployeeNumber = (
	select employeenumber from employees
    where jobTitle='Sales Rep' 
    order by RAND() LIMIT 1
)
where salesRepEmployeeNumber is null;

-- delete

select * from employees;

delete from employees
where employeeNumber = 1323;



select * from customers;

delete from customers 
where customernumber=103;

create table students (
	student_id int,
    student_name nvarchar(50),
    course nvarchar(25),
    fees double
);

insert students values
(103, 'Mahesh', 'PHP', 1000),
(104, 'Chaithu', 'Python', 3500),
(105, 'Divya', 'Angular', 2500),
(106, 'Sujay', '.Net' , 4000);

insert students values
(107, 'Vijay', 'PHP', 1000) ;

select * from students;

delete from students
where student_id = 105;


delete from students
where course='PHP';









