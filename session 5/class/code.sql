--1
drop database d;
create database d;
use d;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT,
    Salary INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);


INSERT INTO Departments (DeptID, DeptName, Location) VALUES
(10, 'HR', 'Delhi'),
(20, 'IT', 'Mumbai'),
(30, 'Finance', 'Pune'),
(50, 'Marketing', 'Chennai');

INSERT INTO Employees (EmpID, EmpName, DeptID, Salary) VALUES
(1, 'Akash', 10, 50000),
(2, 'Nisha', 20, 60000),
(4, 'Simran', 30, 70000),
(5, 'Meena', 30, 55000);

SELECT d.DeptName,COUNT(e.EmpID) AS EmployeeCount,AVG(e.Salary) AS AvgSalary,
CASE 
	WHEN COUNT(e.EmpID) = 0 THEN 'No Employees'
	WHEN AVG(e.Salary) >= 60000 THEN 'High Avg'
	WHEN AVG(e.Salary) BETWEEN 50000 AND 59999 THEN 'Medium Avg'
    ELSE 'Low Avg'
    END AS SalaryCategory
FROM Departments d LEFT JOIN Employees e ON d.DeptID = e.DeptID GROUP BY d.DeptID, d.DeptName
ORDER BY d.DeptID;


--2
drop database f;
create database f ;
use f;
CREATE TABLE Triangle (
	x INT,
	y INT,
	z INT,
	PRIMARY KEY (x, y, z)
);
 
-- Insert sample data
INSERT INTO Triangle (x, y, z) VALUES
(13, 15, 30),
(10, 20, 15);

SELECT x,y,z,
    CASE 
        WHEN x+y>z AND x+z>y AND y+z>x 
        THEN 'YES'
        ELSE 'NO'END AS TriangleStatus
FROM Triangle;

