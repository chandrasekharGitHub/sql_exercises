CREATE database ecommerceDB;

USE ecommerceDB;

create table categories(
	id int,
    name nvarchar(60)
);

insert categories values
(101, 'Breads'),
(102, 'Fabrics');

select * from categories;

-- ALTER Command

-- To change name of the table

alter table categories rename to my_categories;

-- To add a new column decscription

alter table my_categories add description nvarchar(250);
 
desc my_categories;

-- to drop a column
alter table my_categories drop description;

describe my_categories;

-- to add a column at different positons

alter table my_categories add description nvarchar(250);

alter table my_categories add description nvarchar(250) first;

alter table my_categories add last_updated date after id;

-- to change column name

alter table my_categories rename column id to cat_id;

/*
yyyy-mm-rr ==> date
yyyy-mm-dd hh:mm:ss ==> datetime
*/

-- to change datatype of a column

alter table my_categories change last_updated last_updated datetime;


select * from my_categories;

-- to show all the columns of a table
show columns from my_categories;


-- TRUNCATE (all the rows will be deleted but it will not delete the table)


truncate table my_categories;

insert my_categories(cat_id, name) values
(101, 'Breads'),
(102, 'Fabrics');

select * from my_categories;

-- DROP (table itself gets deleted)
drop table my_categories;

select * from my_categories;

-- DML
drop table tasks;

create table if not exists tasks (
	task_id int auto_increment,
    title nvarchar(255) not null,
    start_date date,
    end_date date,
    priority tinyint not null default 3,
    description text,
    primary key(task_id)   
);

-- the following commmnd inserts a row into the tasks table

insert tasks(title, priority) values ('Writing code', 1);

insert tasks(title) values ('Testing code');

insert tasks (description) values ('Please finish this task at first');

insert tasks(title, priority) values ('Taking a class', default);

-- yyyy-mm-dd

insert tasks (title, start_date, end_date) values
('Selling the product', '2022-7-28', '2022-07-30');

-- inserting multiple rows
insert tasks (title,priority) values
('Create the product browcher', 1),
('Create the product library', 2),
('Releasing the product', 3);

select * from tasks;


-- create a table  tasks_audit with the same structure of tasks.

create table  tasks_audit(
select * from tasks
);


select * from tasks_audit;

-- create a table  tasks_audit_duplicate with the same structure 
-- of tasks but without the rows

create table  tasks_audit_duplicate(
select * from tasks where  task_id = 12345
);

select * from tasks_audit_duplicate;


