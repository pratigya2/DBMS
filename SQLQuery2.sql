create database db_official;
    Use db_official;
  

    Create table tbl_employee (
 emp_name Varchar(255) Primary key,
 emp_street VARCHAR(255),
 emp_city varchar(255)
 );
   
    create table tbl_company(
 company_name vARCHAR(255) PRIMARY KEY,
 city varchar(255)
 );
  
    Create table tbl_works(
 emp_name Varchar(255) Primary key,
 company_name varchar(255),
 emp_salary int,
 foreign key(emp_name) references tbl_employee(emp_name),
	  foreign key(company_name) references tbl_company(company_name)
    ); 
  
   create table tbl_manages(
  emp_name varchar(255) primary key,
  manager_name varchar(255),
  foreign key(emp_name) references tbl_employee(emp_name)

  );

    INSERT INTO tbl_employee(emp_name,emp_street,emp_city)
VALUES('Pratigya','Naghdhunga','Pokhara'),
	('Pratima','Raniban','Kathmandu'),
	('Rashmi','Bhaiteshwor','Dolakha'),
	('Sushank','kapan','Budhanilkantha'),
	('Prinsa','Suryabinayak','Bhaktapur'),
('Shiwani','Jogbani','Biratnagar'),
('Prajesh','New','Itahari'),
('Nistha','Milanchowk','Palpa'),
('Pratiphal','Milanmarga','Pokhara'),
('Annu','Budhhanagar','Kathmandu');
      
  
 
   Insert into tbl_company(company_name,city)
Values('Leapfrog','Lalitpur'),
('First bank coorporation','kathmandu'),
('Small bank coorpporation','Bhaktapur'),
('Fuse machines','Pokhara'),
('Infinity','Naksal'),
('Best of Best','Jhapa');

       
      
    Insert into tbl_works(emp_name,company_name,emp_salary)
Values('Annu','Leapfrog',50000),
('Nistha','Best of Best',55000),
('Prajesh','Fuse machines',75000),
('Pratigya','Fuse machines',80000),
('Pratima','Infinity',70000),
('Pratiphal','Small bank coorpporation',60000),
('Prinsa','First bank coorporation',50000),
('Rashmi','Infinity',68000),
('Shiwani','Small bank coorpporation',59000),
('Sushank','Fuse machines',850000);

        
       
    INSERT INTO tbl_manages(emp_name,manager_name)
VALUES ('Annu','Nistha'),
('Prajesh','Shiwani'),
('Pratima','Pratiphal'),
('Pratigya','Rashmi'),
('Prinsa','Sushank');

       

    select tbl_employee.emp_name,tbl_employee.emp_city
from tbl_employee 
where 
tbl_employee.emp_name = (select tbl_works.emp_name
from tbl_works 
where
tbl_works.company_name = 'First bank coorporation');
  
    select tbl_employee.emp_name,tbl_employee.emp_city
from tbl_employee INNER JOIN tbl_works on tbl_employee.emp_name = tbl_works.emp_name
where
tbl_works.company_name = 'First bank coorporation';
  
    select tbl_employee.emp_name,tbl_employee.emp_city,tbl_employee.emp_street
from tbl_employee 
where 
tbl_employee.emp_name = (select tbl_works.emp_name
from tbl_works 
where
tbl_works.company_name = 'First bank coorporation' and tbl_works.emp_salary >= 10000);
    
   select tbl_employee.emp_name,tbl_employee.emp_city,tbl_employee.emp_street
from tbl_employee INNER JOIN tbl_works on tbl_employee.emp_name = tbl_works.emp_name
where
tbl_works.company_name = 'First bank coorporation' and tbl_works.emp_salary >= 10000;
  


    select tbl_employee.emp_name,tbl_employee.emp_city
from tbl_employee
where 
tbl_employee.emp_city = (select tbl_company.city from tbl_company
where tbl_company.company_name = (select tbl_works.company_name from tbl_works
where tbl_works.emp_name = tbl_employee.emp_name));
   
   select tbl_employee.emp_name,tbl_employee.emp_city
from tbl_employee inner join tbl_works on tbl_employee.emp_name= tbl_works.emp_name
inner join
tbl_company on tbl_works.company_name = tbl_works.company_name
where tbl_company.city = tbl_employee.emp_city;
  
    select tbl_manages.emp_name,tbl_manages.manager_name from tbl_manages
where (select tbl_employee.emp_city from tbl_employee 
where tbl_employee.emp_name = tbl_manages.manager_name) = (select tbl_employee.emp_city
from tbl_employee
where 
tbl_employee.emp_name =tbl_manages.emp_name)
AND (SELECT 
            tbl_employee.emp_street
        FROM
            Tbl_employee
        WHERE
            tbl_employee.emp_name = tbl_manages.manager_name) = (SELECT 
            tbl_employee.emp_street
        FROM
            tbl_employee
        WHERE
            tbl_employee.emp_name = tbl_manages.emp_name);
  
    select tbl_manages.emp_name,tbl_manages.manager_name from tbl_manages
inner join
tbl_employee as emp on tbl_manages.emp_name = emp.emp_name
inner join
tbl_employee as manager on tbl_manages.manager_name = manager.emp_name
where
emp.emp_city = manager.emp_city
and
emp.emp_street = manager.emp_street;
  
   select tbl_works.emp_name
from tbl_works
where
tbl_works.company_name != 'First bank coorporation';

    select * from tbl_company
where tbl_company.city = (select
tbl_company.city from tbl_company
where
tbl_company.company_name = 'Small bank coorpporation');

    SELECT 
        tbl_works.employee_name, tbl_works.company_name
    FROM
        (SELECT 
            company_name, AVG(salary) AS average_salary
        FROM
            tbl_works
        GROUP BY company_name) AS avg_salary
            JOIN
        tbl_works ON avg_salary.company_name = tbl_works.company_name
    WHERE
        tbl_works.salary > avg_salary.average_salary;

   SELECT 
    company_name, employee_count
FROM
    (SELECT 
        company_name, COUNT(emp_name) AS employee_count
    FROM
        tbl_works
    GROUP BY company_name) as C1
ORDER BY employee_count DESC;

    SELECT 
    company_name, payroll
FROM
    (SELECT 
        company_name, SUM(emp_salary) AS payroll
    FROM
        tbl_works
    GROUP BY company_name) AS total_payroll
ORDER BY payroll ASC

    SELECT 
    company_name,average_salary
FROM
    (SELECT 
        company_name, AVG(emp_salary) AS average_salary
    FROM
        tbl_works
    GROUP BY company_name) AS avg_salary
WHERE
    avg_salary.average_salary > (SELECT 
            avgs
        FROM
            (SELECT 
                company_name, AVG(emp_salary) AS avgs
            FROM
                tbl_works
            GROUP BY company_name) AS avgs_salary
        WHERE
            avgs_salary.company_name = 'First Bank Corporation');

   UPDATE tbl_employee 
    SET 
        emp_city = 'Newtown',
        emp_street = 'New Street'
    WHERE
        emp_name = 'Pratigya';
    
        SELECT 
            *
        FROM
            tbl_employee
        WHERE
            emp_name = 'Pratigya';
      

   UPDATE tbl_works 
SET 
    emp_salary= emp_salary * 1.1
WHERE
    company_name = 'First Bank Coorporation';
   
        SELECT 
            *
        FROM
            tbl_works
        WHERE
            company_name = 'First Bank Coorporation';

    UPDATE tbl_works 
SET 
    emp_salary = emp_salary * 1.1
WHERE
    emp_name = ANY (SELECT DISTINCT
            manager_name
        FROM
            tbl_manages)
        AND company_name = 'First Bank Coorporation';

    UPDATE tbl_works
        INNER JOIN
    tbl_manages ON tbl_manages.manager_name = tbl_works.emp_name 
SET 
    emp_salary = emp_salary * 1.1
WHERE
    tbl_works.company_name = 'First Bank Coorporation';
 
  
    SELECT 
        *
    FROM
        tbl_works
    WHERE
        company_name = 'First Bank Coorporation';
   
    UPDATE tbl_works 
SET 
    emp_salary = IF(emp_salary < 100000,
        emp_salary * 1.1,
        emp_salary * 1.03)
WHERE
    emp_name = ANY (SELECT DISTINCT
            manager_name
        FROM
            tbl_manages)
        AND company_name = 'First Bank Coorporation');
 
    UPDATE tbl_works
        INNER JOIN
    tbl_manages ON tbl_manages.manager_name = tbl_works.emp_name 
SET 
    emp_salary = IF(emp_salary < 100000,
        emp_salary * 1.1,
        emp_salary * 1.03)
WHERE
    tbl_works.company_name = 'First Bank Corporation';
  
    SELECT 
    *
FROM
    tbl_works
WHERE
    company_name = 'First Bank Corporation'
        AND emp_name = ANY (SELECT DISTINCT
            manager_name
        FROM
   
        SET foreign_key_checks = 0;
       
        DELETE tbl_works , tbl_employee , tbl_manages FROM tbl_works
        JOIN
    tbl_employee ON tbl_employee.emp_name = tbl_works.emp_name
        JOIN
    tbl_manages ON tbl_works.emp_name = tbl_manages.emp_name 
WHERE
    tbl_works.company_name = 'Small Bank Coorpporation';
       
        SET foreign_key_checks = 1;
       
        SELECT 
    tbl_works.emp_name,
    tbl_works.company_name,
    tbl_works.emp_salary,
    tbl_employee.emp_street,
    tbl_employee.emp_city,
    tbl_manages.manager_name
FROM
    tbl_works
        INNER JOIN
    tbl_employee ON tbl_employee.emp_name = tbl_works.emp_name
        INNER JOIN
    tbl_manages ON tbl_works.emp_name = tbl_manages.emp_name;
        
