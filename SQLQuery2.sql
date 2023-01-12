CREATE DATABASE db_number_plate
CREATE TABLE tbl_vehicle(
vehicle_id INT IDENTITY(1,1) PRIMARY KEY,
vehicle_type VARCHAR(255),
company_name VARCHAR(255),
year_of_manufacture DATE
);
ALTER TABLE tbl_vehicle
ADD number_plate VARCHAR(255);
INSERT INTO tbl_vehicle(vehicle_type,company_name,year_of_manufacture,number_plate)
values ('private','ford','2010-04-01','pa2kha1234'),
('public','tata','2001-01-02','ba1kha5678');
SElect * from tbl_vehicle;

SELECT vehicle_type from tbl_vehicle where company_name in ('ford');
select * from tbl_vehicle where company_name like ('%or%');
INSERT INTO tbl_vehicle(vehicle_type,company_name,number_plate,year_of_manufacture)
values ('private','tata','pa2ga4523','2003-05-04');

SELECT * from tbl_vehicle where vehicle_id between 2 and 3;