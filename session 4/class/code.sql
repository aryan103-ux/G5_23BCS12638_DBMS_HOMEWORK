--1
drop database ss;

create database ss;
use ss;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

INSERT INTO Students (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(13, 'John'),
(6, 'Alex');

CREATE TABLE Subjects (
    subject_name VARCHAR(50) PRIMARY KEY
);

INSERT INTO Subjects (subject_name) VALUES
('Math'),
('Physics'),
('Programming');

CREATE TABLE Examinations (
    student_id INT,
    subject_name VARCHAR(50)
);

INSERT INTO Examinations (student_id, subject_name) VALUES
(1, 'Math'),
(1, 'Physics'),
(1, 'Programming'),
(2, 'Programming'),
(1, 'Physics'),
(1, 'Math'),
(13, 'Math'),
(13, 'Programming'),
(13, 'Physics'),
(2, 'Math'),
(1, 'Math');
SELECT S.student_id, S.student_name, Sub.subject_name, IFNULL(COUNT(E.subject_name),0) AS exam_count FROM Students S CROSS JOIN Subjects Sub LEFT JOIN Examinations E ON S.student_id=E.student_id AND Sub.subject_name=E.subject_name GROUP BY S.student_id, S.student_name, Sub.subject_name ORDER BY S.student_id, Sub.subject_name;

--2
drop database x;
 create database x;
 use x;
 CREATE TABLE Transactions (
    id INT PRIMARY KEY,
    country VARCHAR(10),
    state VARCHAR(20),
    amount INT,
    trans_date DATE
);

INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES
(121, 'US', 'approved', 1000, '2018-12-18'),
(122, 'US', 'declined', 2000, '2018-12-19'),
(123, 'US', 'approved', 2000, '2019-01-01'),
(124, 'DE', 'approved', 2000, '2019-01-07');

SELECT DATE_FORMAT(trans_date,'%Y-%m') AS month, country, COUNT(*) AS trans_count, SUM(CASE WHEN state='approved' THEN 1 ELSE 0 END) AS approved_count, SUM(amount) AS trans_total_amount, SUM(CASE WHEN state='approved' THEN amount ELSE 0 END) AS approved_total_amount FROM Transactions GROUP BY month, country ORDER BY month, country;

