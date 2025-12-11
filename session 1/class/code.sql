CREATE TABLE client_master (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(100),
    email VARCHAR(100)
);

-- SERVICE TABLE
CREATE TABLE service_catalog (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(100),
    hourly_rate NUMERIC(10,2)
);

-- INVOICE TABLE
CREATE TABLE invoice_details (
    invoice_id INT PRIMARY KEY,
    client_id INT REFERENCES client_master(client_id),
    service_id INT REFERENCES service_catalog(service_id),
    hours_worked INT,
    discount_percent INT,
    invoice_date DATE
);

-- INSERT INTO client_master
INSERT INTO client_master (client_id, client_name, email) VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com'),
(2, 'Anita Verma', 'anita@gmail.com'),
(3, 'Karan Singh', 'karan@gmail.com');

-- INSERT INTO service_catalog
INSERT INTO service_catalog (service_id, service_name, hourly_rate) VALUES
(101, 'Web Development', 1200.00),
(102, 'Data Analysis', 1500.00),
(103, 'SEO Optimization', 800.00);

-- INSERT INTO invoice_details
INSERT INTO invoice_details (invoice_id, client_id, service_id, hours_worked, discount_percent, invoice_date) VALUES
(1001, 1, 101, 10, 10, '2025-01-05'),
(1002, 2, 102, 8,  5,  '2025-01-07'),
(1003, 3, 103, 12, 0,  '2025-01-10');


Select *  From client_master;
Select *  From service_catalog;
Select * From invoice_details;


 invoice_id
invoice_date 
client_name
service_name

S.hourly_rate* I.hours_worked-

--iNVOICE TABLE  DEFINE WHAT SERVICE A CLIENT TAKE
-- service_catalog DEGINE WHAT TYPE OF SERIVE 

-- Formulae:
-- CAST(((S.hourly_rate* I.hours_worked)*(100-I.discount_percent))/100 


CREATE OR REPLACE VIEW VW_INVOICE_SUMMARY AS 
SELECT I.invoice_id,I.invoice_date ,C.client_name, S.SERVICE_NAME,
CAST(((S.hourly_rate* I.hours_worked)*(100-I.discount_percent))/100 AS NUMERIC(10,2)) AS TOTAL
FROM invoice_details AS I 
JOIN client_master AS C
ON I.CLIENT_ID=C.CLIENT_ID 
JOIN service_catalog AS S
ON S.service_id=I.service_id


SELECT * FROM VW_INVOICE_SUMMARY

CREATE  ROLE ARJUN
WITH LOGIN PASSWORD 'SHALABH2012@'




GRANT SELECT ON VW_INVOICE_SUMMARY TO ARJUN

REVOKE SELECT ON VW_INVOICE_SUMMARY FROM ARJUN



SELECT CURRENT_USER
