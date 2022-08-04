-- select  command

use classicmodels;

-- retrive data from  all the columns.

select * from employees;

desc employees;


select 
	employeeNumber, 
    lastname, 
    firstname, 
    extension, 
    email, 
    officecode, 
    reportsto, 
    jobtitle 
from employees;

-- retrive data from a single column

select lastname from employees;

-- from the multiple columns

select firstname, email from employees;

-- you can use select command to do calculations

select 8 + 9 - 2;

select 8 + 9 - 2 from dual;

select 8 + 9 - 2 as 'Result';

-- current data and time (by using a function)
select now();

select now() as 'Date and Time';

-- function that takes parameters

select concat('MySQL ' , 'is ', 'a RDBMS.') as MySQL;

-- to sort the rows
-- sort the results by one column
-- display all the employees by their firstname in ascending order

select
	firstName,
    lastName
from employees
order by firstname;

-- sort by result by descending order


select
	firstName,
    lastName
from employees
order by firstname desc;

-- sort by morethan column


select
	firstName,
    lastName
from employees
order by 
	firstname desc,
    lastname desc;
    
-- sort a resultset by an expression
/*
select * from orderdetails;

select * from products;

select count(*) from orderdetails
where productcode='S10_1678';
*/

select 
	ordernumber,
	orderlinenumber,
	quantityordered * priceEach as TotalPrice
from orderdetails
order by
	quantityordered * priceeach DESC;


select 
	ordernumber,
	orderlinenumber,
	quantityordered * priceEach as TotalPrice
from orderdetails
order by
	TotalPrice DESC;
    
-- sort data using a custom list
select field(11, 10, 11, 12, 13, 14);

select field(22, 10, 11, 12, 13, 14);

create table my_employees (
	id int not null auto_increment primary key,
    name nvarchar(50)
);

insert my_employees (name) values
('Ramesh'),
('Mahesh'),
('Ram'),
('Nithya'),
('Divya');

select * from my_employees;

select * from my_employees
order by field(id, 3,2,5,1,4);

-- null will be displaying at first when you use order by clause

select * from employees
order by reportsto;

-- where clause

-- with equality operator

-- Find all the employees whose job title is 'Sales Rep';

select 
	lastname,
    firstname,
    jobtitle
from employees
where jobtitle ='Sales Rep';

-- using where clause with the AND operator

-- Find employees whose jobtitle is 'Sales Rep' and officecode is 1;

select * from employees;

select * from employees
where jobtitle = 'Sales Rep'
and officecode = 1;


-- by using OR operator
-- Find all the employees whose jobtitle is Sales Rep 
-- or employees who locate te office with office code 1
select
	lastname,
    firstname,
    jobtitle,
    officecode
from employees
where jobtitle = 'Sales Rep' 
or officecode = 1;

-- between operator
-- Find all the employees who locate on offices 
-- whose office code is from 1 to 3.
select
	lastname,
    firstname,
    jobtitle,
    officecode
from employees
where officecode = 1 or officecode = 2 or officecode = 3;



select
	lastname,
    firstname,
    jobtitle,
    officecode
from employees
where officecode between  1 and 3;

-- in oprator

select
	lastname,
    firstname,
    jobtitle,
    officecode
from employees
where officecode in (1,2,3);

-- not null

select * from employees;

-- Find all the employees who doesnot report to any one.

select
	lastname,
    firstname,
    reportsto
from employees
where reportsto is null;

-- using comparision operators
-- (=, !=, <>(not equal), <, >, <=, >=)

-- Find all employees whose jobtitle is not 'Sales Rep'

select 
	firstname,
    lastname,
    jobtitle
from employees
where jobtitle != 'Sales Rep';


select 
	firstname,
    lastname,
    jobtitle
from employees
where jobtitle <> 'Sales Rep';

-- Find all the employees with officecode lessthan or equal to 4.

select 
	lastname,
    firstname,
    reportsto,
    officecode
from employees
where officecode <= 4;


-- DISTINCT clause

-- Show only distinct lastnames

select lastname from employees
order by lastname; -- wrong query

-- right query

select distinct lastname from employees
order by lastname;

select distinct(lastname) from employees
order by lastname;


-- Find the distict states from the customers table

select state from customers;

select distinct state from customers;


-- Find the unique combination of city and state 
-- from the customers table


select * from customers;


select distinct (state, city)
from customers
where state is not null
order by state, city;

-- Find the customers who locate in California(CA), USA.

select  
	customername ,
    state, 
    country 
from customers
where country='USA' AND state='CA';

-- LIKE
-- Find all the employees whose firstname starts with 'a'.

select lastname, firstname from employees
where firstname like 'a%';


-- Find all the employees whose lastname ends with 'on'

select 
	employeenumber,
    lastname,
    firstname
from employees
where lastname like '%on';

-- Find all the employees whose lastnames contain the substring 'on'.
select 
	employeenumber,
    lastname,
    firstname
from employees
where lastname like '%on%';

-- Find employees whose firstname starts with 'T' and ends with 'm' and
-- contains a single character between them
select 
	employeenumber,
    lastname,
    firstname
from employees
where firstname like 'T_m';

-- Find products whose product codes contain a string '_20'.

select * from products;

update products set productname='America West Airlines B757_200'
where productcode='S700_2466';

select
	productcode,
    productname
from products
where productname like '%\_20%';



-- Alternatively you can specify a different escape character

select
	productcode,
    productname
from products
where productname like '%$_20%' escape '$';

-- by using LIMIT

-- Find the top 5 customers who have the highest credit

select 
	customernumber,
    customerName,
    creditLimit
from customers
order by creditlimit desc
limit 5;



    




