

SQL schema definition for the employee database is as:**

>employee(employee-name, street, city)
works(employee-name, company-name, salary)
company(company-name, city)
manages (employee-name, manager-name)

1. Give an SQL schema definition for the employee database. Choose an appropriate primary key for each relation schema, and insert any other integrity constraints (for example, foreign keys) you find necessary.

 The following Queries are used to create the required database.
* create and select the company database:
 
    ```sql
    create database db_official;
    Use db_official;
    ```
* create employee table:
    ```sql
    Create table tbl_employee (
 emp_name Varchar(255) Primary key,
 emp_street VARCHAR(255),
 emp_city varchar(255)
 );
    ```
*create company table:
    ```sql
    create table tbl_company(
 company_name vARCHAR(255) PRIMARY KEY,
 city varchar(255)
 );
    ```
* To create works table:
    ```sql
    Create table tbl_works(
 emp_name Varchar(255) Primary key,
 company_name varchar(255),
 emp_salary int,
 foreign key(emp_name) references tbl_employee(emp_name),
	  foreign key(company_name) references tbl_company(company_name)
    ); 
    ```
* To create table manages:
    ```sql
   create table tbl_manages(
  emp_name varchar(255) primary key,
  manager_name varchar(255),
  foreign key(emp_name) references tbl_employee(emp_name)

  );
    );
    ```
*insert data into the tables:**

* Insert data into Employee Table
    ```sql
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
    ```
    *  View data in employee table      
        ```sql       
        SELECT 
            *
        FROM
            tbl_employee;
        ```
  ![image](https://user-images.githubusercontent.com/64631057/211145543-9c5a65c7-7635-4807-89ee-98ce15bd6cc8.png)
        

* Insert Data in Company table:
    ```sql
   Insert into tbl_company(company_name,city)
Values('Leapfrog','Lalitpur'),
('First bank coorporation','kathmandu'),
('Small bank coorpporation','Bhaktapur'),
('Fuse machines','Pokhara'),
('Infinity','Naksal'),
('Best of Best','Jhapa');
    ```
            
    * View data from company table
        ```sql    
        SELECT 
            *
        FROM
            tbl_company;
        ```
       ![image](https://user-images.githubusercontent.com/64631057/211145570-4d22c4c5-f2da-466e-bacd-4beaa5609f8e.png)

* Insert Data into Works Table
    ```sql
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
    ```
    * View data from Works table
        ```sql
        SELECT 
            *
        FROM
            tbl_works;
        ```
        ![image](https://user-images.githubusercontent.com/64631057/211145677-48792bee-3719-4ec3-a6ee-5e59b944fa59.png)
* Insert data into manages table
    ```sql
    INSERT INTO tbl_manages(emp_name,manager_name)
VALUES ('Annu','Nistha'),
('Prajesh','Shiwani'),
('Pratima','Pratiphal'),
('Pratigya','Rashmi'),
('Prinsa','Sushank');
    ```

    * View data from Manages table
        ```sql
        SELECT 
            *
        FROM
            tbl_manages;
        ```
        ![image](https://user-images.githubusercontent.com/64631057/211145735-95d62113-3bf4-409a-a067-808b3caf6760.png)
        
#### 2. Consider the employee database of Figure 5, where the primary keys are underlined. Give an expression in SQL for each of the following queries:

##### 2.a) Find the names of all employees who work for First Bank Corporation.   
* Query:
    ```sql
        select emp_name from tbl_works where company_name = 'First bank coorporation';
    ```
![image](https://user-images.githubusercontent.com/64631057/211145794-40db89c5-95e0-41c6-b9bf-5d2f9adce256.png)

2.b) Find the names and cities of residence of all employees who work for First Bank Corporation.

* Using sub query:
    ```sql
    select tbl_employee.emp_name,tbl_employee.emp_city
from tbl_employee 
where 
tbl_employee.emp_name = (select tbl_works.emp_name
from tbl_works 
where
tbl_works.company_name = 'First bank coorporation');
    ```
  

* Using Join:
    ```sql
    select tbl_employee.emp_name,tbl_employee.emp_city
from tbl_employee INNER JOIN tbl_works on tbl_employee.emp_name = tbl_works.emp_name
where
tbl_works.company_name = 'First bank coorporation';
    ```
    
![image](https://user-images.githubusercontent.com/64631057/211145879-97d930ea-2e9b-4506-8f95-2f1654ae7961.png)

##### 2.c) Find the names, street addresses, and cities of residence of all employees who work for First Bank Corporation and earn more than $10,000.

* Using sub query:
    ```sql
    select tbl_employee.emp_name,tbl_employee.emp_city,tbl_employee.emp_street
from tbl_employee 
where 
tbl_employee.emp_name = (select tbl_works.emp_name
from tbl_works 
where
tbl_works.company_name = 'First bank coorporation' and tbl_works.emp_salary >= 10000);
    ```
   

* Using Join:
    ```sql
   select tbl_employee.emp_name,tbl_employee.emp_city,tbl_employee.emp_street
from tbl_employee INNER JOIN tbl_works on tbl_employee.emp_name = tbl_works.emp_name
where
tbl_works.company_name = 'First bank coorporation' and tbl_works.emp_salary >= 10000;
    ```
    

![image](https://user-images.githubusercontent.com/64631057/211145982-9ab64d23-2576-461e-a9ee-a69d7355dd65.png)

##### 2.d) Find all employees in the database who live in the same cities as the companies for which they work.

* Using sub query:
    ```sql
    select tbl_employee.emp_name,tbl_employee.emp_city
from tbl_employee
where 
tbl_employee.emp_city = (select tbl_company.city from tbl_company
where tbl_company.company_name = (select tbl_works.company_name from tbl_works
where tbl_works.emp_name = tbl_employee.emp_name));
    ```
    
* Using Join:
    ```sql
   select tbl_employee.emp_name,tbl_employee.emp_city
from tbl_employee inner join tbl_works on tbl_employee.emp_name= tbl_works.emp_name
inner join
tbl_company on tbl_works.company_name = tbl_works.company_name
where tbl_company.city = tbl_employee.emp_city;
    ```
    ![image](https://user-images.githubusercontent.com/64631057/211146038-2c5109b1-49f6-4d81-88bf-4ce84ee1c4a1.png)



##### 2.e) Find all employees in the database who live in the same cities and on the same streets as do their managers.
* Using sub query:
    ```sql
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
    ```
   
* Using Join:
    ```sql
    select tbl_manages.emp_name,tbl_manages.manager_name from tbl_manages
inner join
tbl_employee as emp on tbl_manages.emp_name = emp.emp_name
inner join
tbl_employee as manager on tbl_manages.manager_name = manager.emp_name
where
emp.emp_city = manager.emp_city
and
emp.emp_street = manager.emp_street;
    ```
    ![image](https://user-images.githubusercontent.com/64631057/211146133-99ca946c-dc9a-4eec-bcaf-ee7ca1cb48ac.png)

##### 2.f) Find all employees in the database who do not work for First Bank Corporation.
* Query:
    ```sql
   select tbl_works.emp_name
from tbl_works
where
tbl_works.company_name != 'First bank coorporation';
    ```
![image](https://user-images.githubusercontent.com/64631057/211146178-e3f605fc-981a-4cd3-82e1-42ff87f0a36e.png)

##### 2.h) Assume that the companies may be located in several cities. Find all companies located in every city in which Small Bank Corporation is located.
* Query:
    ```sql
    select * from tbl_company
where tbl_company.city = (select
tbl_company.city from tbl_company
where
tbl_company.company_name = 'Small bank coorpporation');

    ```
   ![image](https://user-images.githubusercontent.com/64631057/211146210-53a283a4-031e-441b-8b50-28ba66bc9d65.png)

##### 2.i) Find all employees who earn more than the average salary of all employees of their company.
* Query:
    ```sql
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
    ```
   ![image](https://user-images.githubusercontent.com/64631057/211146250-2b39a93d-9293-4dcd-9728-bc43f2bb3d2e.png)

##### 2.j) Find the company that has the most employees.
* Query:
    ```sql
   SELECT 
    company_name, employee_count
FROM
    (SELECT 
        company_name, COUNT(emp_name) AS employee_count
    FROM
        tbl_works
    GROUP BY company_name) as C1
ORDER BY employee_count DESC;
    ```
    ![image](https://user-images.githubusercontent.com/64631057/211146313-bc15f47f-7ceb-4df2-946f-b3459d4e7409.png)


##### 2.k) Find the company that has the smallest payroll.
* Query:
    ```sql
    SELECT 
    company_name, payroll
FROM
    (SELECT 
        company_name, SUM(emp_salary) AS payroll
    FROM
        tbl_works
    GROUP BY company_name) AS total_payroll
ORDER BY payroll ASC
    ```
    ![image](https://user-images.githubusercontent.com/64631057/211146333-76b21759-ea9d-4069-804b-f5d0575e8f7b.png)


##### 2.l) Find those companies whose employees earn a higher salary, on average, than the average salary at First Bank Corporation.
* Query:
    ```sql
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
    ```
    ![image](https://user-images.githubusercontent.com/64631057/211146399-eafefaf2-c560-422d-bb64-cc546a06b37f.png)


#### 3. Consider the relational database of Figure 5. Give an expression in SQL for each of the following queries:
 3.a) Modify the database so that Jones now lives in Newtown.
* Query:
    ```sql
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
        ```
    ![image](https://user-images.githubusercontent.com/64631057/211146512-df499a8c-2091-4f44-9e1b-09036c2b82cd.png)

##### 3.b) Give all employees of First Bank Corporation a 10 percent raise
* Query:
    ```sql
   UPDATE tbl_works 
SET 
    emp_salary= emp_salary * 1.1
WHERE
    company_name = 'First Bank Coorporation';
    ```
    * Check if the query worked or not by selecting data from works table
        ```sql
        SELECT 
            *
        FROM
            tbl_works
        WHERE
            company_name = 'First Bank Coorporation';
        ```
    * Output:
        *Before raise:*<br>
        ![image](https://user-images.githubusercontent.com/64631057/211146647-e9343470-06e5-450b-91bc-af68752df3ac.png)

        *After raise:*<br>
       ![image](https://user-images.githubusercontent.com/64631057/211146692-a61da387-03af-4975-bd5f-cab5bd5eef69.png)
   
##### 3.c) Give all managers of First Bank Corporation a 10 percent raise.
* Using sub query:
    ```sql
    UPDATE tbl_works 
SET 
    emp_salary = emp_salary * 1.1
WHERE
    emp_name = ANY (SELECT DISTINCT
            manager_name
        FROM
            tbl_manages)
        AND company_name = 'First Bank Coorporation';
    ```
    
* Using Join:
    ```sql
    UPDATE tbl_works
        INNER JOIN
    tbl_manages ON tbl_manages.manager_name = tbl_works.emp_name 
SET 
    emp_salary = emp_salary * 1.1
WHERE
    tbl_works.company_name = 'First Bank Coorporation';
    ```
    

    * Check if the query worked or not by selecting data from works table:"
    ```sql
    SELECT 
        *
    FROM
        tbl_works
    WHERE
        company_name = 'First Bank Coorporation';
    ```
    * Output:<br>
    *Before raise for managers:*<br>
    ![image](https://user-images.githubusercontent.com/64631057/211146780-e75195a6-1eca-4182-af21-e6f5818a018f.png)
    *After raise for managers:*<br>
    ![image](https://user-images.githubusercontent.com/64631057/211146897-c4f7ba42-a453-4f71-93df-0c4b36af46a8.png)



##### 3.d) Give all managers of First Bank Corporation a 10 percent raise unless the salary becomes greater than $100,000; in such cases, give only a 3 percent raise
* Using sub query:
    ```sql
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
    ```
    

* Using Join:
    ```sql
    UPDATE tbl_works
        INNER JOIN
    tbl_manages ON tbl_manages.manager_name = tbl_works.emp_name 
SET 
    emp_salary = IF(emp_salary < 100000,
        emp_salary * 1.1,
        emp_salary * 1.03)
WHERE
    tbl_works.company_name = 'First Bank Corporation';
    ```
   
   
    ```sql
    SELECT 
    *
FROM
    tbl_works
WHERE
    company_name = 'First Bank Corporation'
        AND emp_name = ANY (SELECT DISTINCT
            manager_name
        FROM
            tbl_manages);
    ```
    
##### 3.e) Delete all tuples in the works relation for employees of Small Bank Corporation.
* Query:
    * Before deleting data from table with relation we should disable foreign key check.
        ```sql
        SET foreign_key_checks = 0;
        ```
    * Run the delete query.
        ```sql
        DELETE tbl_works , tbl_employee , tbl_manages FROM tbl_works
        JOIN
    tbl_employee ON tbl_employee.emp_name = tbl_works.emp_name
        JOIN
    tbl_manages ON tbl_works.emp_name = tbl_manages.emp_name 
WHERE
    tbl_works.company_name = 'Small Bank Coorpporation';
        ```
        *To **delete the data from all the tables** we first join all the tables and delete on the given **condition.***
    * Enable the foreign key check after deletion.
        ```sql
        SET foreign_key_checks = 1;
        ```
* Check if the data was deleted or not:
    * Query:
        ```sql
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
        ```
        ![image](https://user-images.githubusercontent.com/64631057/211147138-116d51d1-60ab-4327-b0d1-17f3290ec7eb.png)
