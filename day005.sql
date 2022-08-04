use classicmodels;
/*

Suppose you want to get (productcode, productname, textdescription)

	1. The productcode and productname from the products table
    
    2. the textdescription from the productlines table
*/
select
	p1.productline,
	productcode,
    productname,
	textDescription
from products as p1 inner join productlines as pl1
on p1.productLine = pl1.productLine;

-- or
select
	products.productline,
	productcode,
    productname,
	textDescription
from products inner join productlines
on products.productLine = productlines.productLine;

-- or

select
	products.productline,
	products.productcode,
    products.productname,
    productlines.textDescription
from products inner join productlines
using (productline);


-- inner keyword is optional


select
	products.productline,
	productcode,
    productname,
	textDescription
from products join productlines
on products.productLine = productlines.productLine;

-- inner join with group by
-- the following query returns ordernumber, order status, total sales
-- from orders and otderdetails tables

select
	orders.orderNumber,
    orders.status,
    sum(quantityordered * priceeach) as total
from orders inner join orderdetails
on orders.orderNumber = orderdetails.orderNumber
group by ordernumber;


select
	orders.orderNumber,
    orders.status,
    sum(quantityordered * priceeach) as total
from orders inner join orderdetails
using (orderNumber )
group by ordernumber;

-- inner join with three tables
-- this query uses inner join clause to join three tables
-- (products, orders, orderdetails)

select
	t1.ordernumber,
    orderdate,
    productname,
    quantityordered,
    priceeach
from orders as t1 
inner join orderdetails as t2
	on t1.orderNumber = t2.orderNumber
inner join products as t3
	on t3.productCode = t2.productCode
order by orderNumber;
    
select
	t1.ordernumber,
    orderdate,
    productname,
    quantityordered,
    priceeach
from orders as t1 
inner join orderdetails as t2
	using(orderNumber)
inner join products as t3
	using(productCode)
order by orderNumber;

-- inner join with four tables
select
	t1.ordernumber,
    orderdate,
    customername,
    orderlinenumber,
    productname,
    quantityordered,
    priceeach
from orders as t1
inner join orderdetails as t2
	on t1.orderNumber = t2.ordernumber
inner join products as t3
	on t2.productCode = t3.productCode
inner join customers as t4
	on t1.customerNumber = t4.customerNumber
order by
	ordernumber,
    orderLineNumber;
    
    
    

    

