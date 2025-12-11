-- Create table
CREATE TABLE person (
    id INT PRIMARY KEY,
    email VARCHAR(100)
);

-- Insert data
INSERT INTO person (id, email) VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com');

DELETE FROM PERSON
WHERE ID IN(
SELECT P1.ID  FROM Person as p1
JOIN PERSON AS P2
ON P1.ID>P2.ID AND P1.EMAIL=P2.EMAIL
);


DELETE FROM  PERSON
WHERE ID IN(
Select id FROM(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY EMAIl order by id ) AS R1
FROM PERSON
) AS temp
where r1>1
)



--2

SELECT * FROM 



-- Create Activity table
CREATE TABLE Activity (
    machine_id     INT,
    process_id     INT,
    activity_type  VARCHAR(10),
    timestamp      DECIMAL(10, 3)
);

-- Insert data into Activity table
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES
(0, 0, 'start', 0.712),
(0, 0, 'end',   1.520),
(0, 1, 'start', 3.140),
(0, 1, 'end',   4.120),

(1, 0, 'start', 0.550),
(1, 0, 'end',   1.550),
(1, 1, 'start', 0.430),

(1, 1, 'end',   1.420),

(2, 0, 'start', 4.100),
(2, 0, 'end',   4.512),
(2, 1, 'start', 2.500),
(2, 1, 'end',   5.000);

drop table activity

Select * From Activity;

--postgres
SELECT   machine_id ,round((sum(timestamp) Filter(where activity_type='end')-
sum(timestamp) Filter(where activity_type='start'))/count(*) filter(Where  activity_type='end') ,3) 
as Processing_Time
FROM Activity
group by machine_id 
order by machine_id;







