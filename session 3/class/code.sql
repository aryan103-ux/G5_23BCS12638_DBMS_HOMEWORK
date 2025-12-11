--1
drop database sd;
create database sd;
use sd;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    product_category VARCHAR(50)
);
INSERT INTO Products (product_id, product_name, product_category) VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'),
(4, 'Lenovo', 'Laptop'),
(5, 'Leetcode Kit', 'T-shirt');

-- drop table Products
-- drop table Orders 

CREATE TABLE Orders (
    product_id INT,
    order_date DATE,
    unit INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Orders (product_id, order_date, unit) VALUES
(1, '2020-02-05', 60),
(1, '2020-02-10', 70),
(2, '2020-01-18', 30),
(2, '2020-02-11', 80),
(3, '2020-02-17', 2),
(3, '2020-02-24', 3),
(4, '2020-03-01', 20),
(4, '2020-03-04', 30),
(4, '2020-03-04', 60),
(5, '2020-02-25', 50),
(5, '2020-02-27', 50),
(5, '2020-03-01', 50);

select P.product_name, sum(O.unit) as Total_Unit from Products as P left join Orders as O On O.product_id=P.product_id where O.order_date between '2020-02-01' and '2020-02-29' group by P.product_name having sum(O.unit)>=100;


--2

drop database xd;
create database xd;
use xd;
-- DROP TABLE STUDENT
-- DROP TABLE  Enrollments 
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE Enrollments (
    student_id INT,
    course VARCHAR(50)
);


INSERT INTO Student (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');


INSERT INTO Enrollments (student_id, course) VALUES
(1, 'DBMS'),
(3, 'Java'),
(5, 'Python');

select S.student_id,S.student_name from Student S LEFT JOIN Enrollments E ON S.student_id=E.student_id where E.student_id IS NULL;

select * from Student where student_id Not in(Select student_id from Enrollments);
