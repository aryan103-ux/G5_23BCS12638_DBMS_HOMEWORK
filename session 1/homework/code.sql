create table employee (
    emp_id int primary key,
    emp_name varchar(50),
    department varchar(50),
    salary numeric(10,2)
);

insert into employee values
(1, 'rahul sharma', 'it', 60000),
(2, 'anita verma', 'hr', 55000),
(3, 'karan singh', 'finance', 70000);

create view employee_view as
select emp_id,emp_name,
department,salary
from employee;


create role analyst;

grant select on employee_view to analyst;

create role user1 login password 'password123';

grant analyst to user1;
