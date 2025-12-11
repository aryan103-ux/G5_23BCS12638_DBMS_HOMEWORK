CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
RETURN (
 select salary from 
(select id, salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS dr
FROM Employee) as t
where dr = N
limit 1
);
END
