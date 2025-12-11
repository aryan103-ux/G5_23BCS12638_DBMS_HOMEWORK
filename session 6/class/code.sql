create database l;
use l;

CREATE TABLE Employees (
    emp_id     INT PRIMARY KEY,
    name       VARCHAR(50),
    dept_id    INT,
    salary     INT
);


CREATE TABLE Departments (
    dept_id     INT PRIMARY KEY,
    dept_name   VARCHAR(50)
);

INSERT INTO Employees (emp_id, name, dept_id, salary) VALUES
(1, 'Asha', 10, 50000),
(2, 'Rohan', 10, 70000),
(3, 'Meera', 20, 40000),
(4, 'Kabir', 20, 55000),
(5, 'Isha', 30, 90000);

INSERT INTO Departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'Finance'),
(30, 'IT');

SELECT d.dept_name,e.name AS emp_name,e.salary,

    (SELECT AVG(e2.salary) FROM Employees e2 WHERE e2.dept_id = d.dept_id) 
    AS dept_avg_salary FROM Employees e JOIN Departments d ON e.dept_id = d.dept_id WHERE ABS( e.salary - (SELECT AVG(e3.salary) FROM Employees e3 WHERE e3.dept_id = e.dept_id))=
    (SELECT MIN(ABS(e4.salary - (SELECT AVG(e5.salary) FROM Employees e5 WHERE e5.dept_id = e4.dept_id)))
    FROM Employees e4 WHERE e4.dept_id = e.dept_id);


