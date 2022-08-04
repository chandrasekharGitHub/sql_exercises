use classicmodels;

-- left join

select
	customers.customernumber,
    customername,
	ordernumber,
    status
from customers left join orders
on orders.customernumber = customers.customernumber
order by status;

-- unmatched rows
select
	customers.customernumber,
    customername,
	ordernumber,
    status
from customers left join orders
on orders.customernumber = customers.customernumber
where ordernumber is null
order by status;

-- right join
select
	
    customernumber,
    customername,
    employeenumber
from customers right join employees
on customers.salesRepEmployeenumber = employees.employeenumber
order by employeenumber;

-- 15:47:09	select  employeenumber,     customernumber,     customername from customers right join employees on customers.employeenumber = employees.employeenumber order by employeenumber	Error Code: 1054. Unknown column 'customers.employeenumber' in 'on clause'	0.094 sec

-- selft join

-- to display the whole organization structure, you cann join the 
-- employees table to itself using the employeenumber and reportsTo column

select
	concat(m.lastname, ' ', m.firstname) as Manager,
    concat(e.lastname, ' ', e.firstname) as Emloyee
from employees as e
inner join employees as m
on m.employeenumber = e.reportsto
order by Manager;

-- the above query will not display the president information

-- The president is the employee who doesnot have any manager
-- the value in the reportsto column is null.

select
	concat(m.lastname, ' ', m.firstname) as Manager,
    concat(e.lastname, ' ', e.firstname) as Emloyee
from employees as e
left join employees as m
on m.employeenumber = e.reportsto
order by Manager;

select
	ifnull(concat(m.lastname, ' ', m.firstname), 'Top Manager') as Manager,
    concat(e.lastname, ' ', e.firstname) as Emloyee
from employees as e
left join employees as m
on m.employeenumber = e.reportsto
order by Manager desc;


-- GROUP BY

select status from orders
group by status;

select 
	status, 
    count(status) 
from orders
group by status;


select 
	status, 
    count(*) 
from orders
group by status;

-- agregate functions (count, sum, max, min, avg)
-- to get the total amount of all the orders by status

-- you join the orders table with the oderdetails table 
-- and use sum() function to calculate the total amount

select
	status,
    sum(quantityordered * priceeach) as Amount
from orders join orderdetails
using(ordernumber)
group by status;

-- the following query gets the total sales for each year
select
	year(orderdate) as Year,
    sum(quantityordered * priceeach) as Total
from orders join orderdetails
using (ordernumber)
where status = 'Shipped'
group by year(orderdate);

-- by having clause

select
	year(orderdate) as Year,
    sum(quantityordered * priceeach) as Total
from orders join orderdetails
using (ordernumber)
where status = 'Shipped' and year(orderdate) > 2003
group by year(orderdate);


select
	year(orderdate) as Year,
    sum(quantityordered * priceeach) as Total
from orders join orderdetails
using (ordernumber)
where status = 'Shipped'
group by Year
having Year > 2003;










