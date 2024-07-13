												##DML##

										### SELECT STATEMENT ###
SELECT * FROM employees;

SELECT 
    first_name, last_name
FROM
    employees;
 
 SELECT dept_no FROM departments;
 
											### WHERE CLAUSE ###
 
SELECT * FROM employees;
SELECT * FROM employees WHERE first_name="Denis";
SELECT * FROM employees WHERE first_name="Elvis";

												### AND ###
SELECT * FROM employees WHERE first_name="Denis" AND gender="M";
SELECT * FROM employees WHERE first_name="Kellie" AND gender="F";

												### OR ###

SELECT * FROM employees WHERE first_name="Denis" OR first_name="Elvis";
SELECT * FROM employees WHERE first_name="Kellie" OR first_name="Aruna";

										### Operation Precedence ###
  
# AND > OR  
#(), !  >   *, /, %  >   +, -  > =, <, <=, >, >=, <>, != > NOT > AND > OR
#() > ! | * > / > % | + > - | = > < > <= > >= > <> > != | NOT | AND | OR

SELECT * FROM employees WHERE first_name="Denis" AND (gender="M" OR gender="F");
SELECT * FROM employees WHERE gender='F' AND (first_name="Kellie" OR first_name="Aruna");

															### IN-NOT IN ###
  #When we need to apply 2+ conditions using IN-NOT IN makes the work quicker 
  
SELECT * FROM employees WHERE first_name IN ("Cathie","Mark","Nathan");
SELECT * FROM employees WHERE first_name NOT IN ("Cathie","Mark","Nathan");
SELECT * FROM employees WHERE first_name IN ("Denis","Elvis");
SELECT * FROM employees WHERE first_name NOT IN ("John","Mark","Jacob");
   
														### LIKE - NOT LIKE ###
   
SELECT * FROM employees WHERE first_name LIKE ("MAR_");  ## 4 len , start with MAR
SELECT * FROM employees WHERE first_name LIKE ("_AR_");  ## 4 len , Middle with AR
SELECT * FROM employees WHERE first_name LIKE ("_ARK");  ## 4 len , END with ARK
   
SELECT * FROM employees WHERE first_name LIKE ("MAR%");  ## Every first name start with MAR, Any length 
SELECT * FROM employees WHERE first_name LIKE ("%AR%");  ## Every first name Middle with AR
SELECT * FROM employees WHERE first_name LIKE ("%MAR");  ## Every first name END with MAR
SELECT * FROM employees WHERE first_name LIKE ("MAR%");  ## Every first name start with MAR
   
SELECT * FROM employees WHERE first_name NOT LIKE ("%MAR");  ## Vice-Versa
SELECT * FROM employees WHERE first_name LIKE ("MARK%"); 

SELECT * FROM employees; 
SELECT * FROM employees WHERE hire_date LIKE ("2000%"); 
SELECT * FROM employees WHERE emp_no LIKE ("1000_"); 

														### BETWEEN - AND ###
 ## Can be used for strings and numbers too..                                                       
SELECT * FROM employees WHERE hire_date BETWEEN "1990-01-01" AND "2000-01-01";
SELECT * FROM employees WHERE hire_date NOT BETWEEN "1990-01-01" AND "2000-01-01";

SELECT * FROM salaries;
SELECT * FROM salaries WHERE salary BETWEEN 66000 AND 70000;
SELECT * FROM employees WHERE emp_no NOT BETWEEN 10004 AND 10012;
SELECT * FROM departments;
SELECT * FROM departments WHERE dept_no BETWEEN "d003" AND "d006";

													### IS NOT NULL - IS NULL ###
SELECT * FROM employees WHERE first_name IS NOT NULL ;
SELECT * FROM employees WHERE first_name IS NULL ;
SELECT * FROM departments WHERE dept_no IS NOT NULL ;

												### Comparison Operators ###
SELECT  * FROM employees WHERE first_name = 'Mark';  
SELECT  * FROM employees WHERE first_name != 'Mark';  
SELECT * FROM employees WHERE hire_date >= "1985-06-01";
##Task 
SELECT * FROM employees WHERE gender = "F" AND hire_date >= "2000-01-01";
SELECT * FROM salaries WHERE salary > 150000;

											### SELECT DISTINCT ###
# Used to find out unique values
SELECT DISTINCT gender FROM employees;
##Task
SELECT DISTINCT hire_date FROM employees;

										### Aggregate Function ###
## Count(), Sum() , Min() , Max() , AVG()

SELECT count(emp_no) FROM employees;
SELECT count(DISTINCT first_name) FROM employees; ##Must put distinct inside ()
##Task##
SELECT count(*) FROM salaries WHERE salary >=100000;
SELECT count(salary) FROM salaries WHERE salary >=100000;

SELECT count(*) FROM dept_manager;

											### ORDER BY ###
SELECT * FROM 	employees ORDER BY first_name;   ##ASC by default
SELECT * FROM 	employees ORDER BY first_name DESC;      
SELECT * FROM 	employees ORDER BY first_name,last_name;                                    
##TASK##
SELECT * FROM employees ORDER BY hire_date DESC;

											### GROUPBY ###
SELECT first_name FROM employees GROUP BY first_name ;
SELECT first_name,COUNT(first_name) FROM employees GROUP BY first_name;
SELECT first_name,COUNT(first_name) FROM employees GROUP BY first_name ORDER BY first_name DESC;

											###ALIASES##
SELECT first_name,COUNT(first_name) AS names_count FROM employees GROUP BY first_name;
 ### TASK ###
 SELECT salary,COUNT(emp_no) AS emp_with_same_salary FROM salaries WHERE salary > 80000 GROUP BY salary ORDER BY salary ;

										### HAVING ###
 ## Used With Agg Functions ##
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;

## TASK ## 
SELECT *,AVG(salary) FROM salaries WHERE salary > 120000 GROUP BY emp_no ORDER by emp_no; ##WRONG
SELECT *,AVG(salary) FROM salaries GROUP BY emp_no  HAVING AVG(salary) > 120000 ; ##WRONG
SELECT emp_no,AVG(salary) FROM salaries GROUP BY emp_no HAVING AVG(salary) > 120000 ORDER BY emp_no;
 
										### WHERE VS HAVING ###
SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name;
## Aggregate function -> GROUP BY HAVING;
## General conditons -> WHERE;
## TASK ##
SELECT * FROM dept_emp;
SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > 2000 - 01 - 01
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

													### LIMIT ###
 SELECT * FROM salaries ORDER BY salary DESC LIMIT 10;  ##TOP 10 Salary##                                                 
SELECT * FROM dept_emp;
SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > 2000 - 01 - 01
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no LIMIT 10;
##simply DROP DOWN can be used

													###### INSERT ########
INSERT INTO employees 
(emp_no,
birth_date,
first_name,
last_name,
gender,
hire_date)
VALUES
(999901,
"2001-01-19",
"Tanji",
"Evan",
"M",
"2025-01-19");

## Reason to use a bigger num as emp_no is to get advantage while testing, so that we can test it using DESC easily ##

SELECT * FROM 	employees ORDER BY emp_no DESC LIMIT 10;

INSERT INTO employees 
VALUES
(999902,
"2001-01-19",
"Tanji",
"Islam",
"M",
"2025-01-19");

##TASK##

INSERT INTO employees 
(emp_no,
birth_date,
first_name,
last_name,
gender,
hire_date)
VALUES
(999903,
"1977-09-14",
"Johnathan",
"Creek",
"M",
"1999-01-01");

INSERT INTO titles
(emp_no,
title,
from_date)
VALUES
(999903,
"Senior Engineer",
"1997-10-01");

SELECT * from titles ORDER BY  emp_no DESC LIMIT 10;

SELECT * FROM dept_emp LIMIT 10 ;
INSERT INTO dept_emp
(emp_no,
dept_no,
from_date,
to_date)
VALUES
(999903,
"d005",
"1997-10-01",
"9999-01-01");
SELECT * FROM dept_emp ORDER BY emp_no DESC LIMIT 10 ;

													## Creating New Table ##
SELECT * FROM departments LIMIT 10;

CREATE TABLE departments_dup 
(dept_no char(4) NOT NULL,
dept_name varchar(40) NOT NULL,
dept_manager varchar(40)
);

INSERT INTO departments_dup
( dept_no ,
dept_name
)
SELECT 
* 
FROM 
departments; ### will duplicate everything from department table to department_dup

SELECT * FROM departments_dup;

##TASK##
INSERT INTO departments_dup
( dept_no ,
dept_name
)
VALUES
('d011',
'Data Analysis'
);
INSERT INTO departments_dup 
(dept_no 
)
VALUES
('d011');

															###### UPDATE #######
UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1009-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;
    
SELECT * from employees WHERE emp_no=999901;


													### COMMIT - ROLL BACK ###
  
 SET AUTOCOMMIT= 0 ; ## Turns of AUTOCOMMIT
    
SELECT * from departments_dup; 
COMMIT ; ###In SQL, COMMIT permanently saves all changes made in the current transaction to the database.

UPDATE departments_dup
SET
dept_no="d011",
dept_name="Quality Control";
COMMIT ;

UPDATE departments_dup
SET
dept_no="d011",
dept_name="Quality ";

SELECT * from departments_dup; 
ROLLBACK;
SELECT * from departments_dup; 

### Task ##
SELECT * FROM departments;
 UPDATE departments
 SET 
 dept_name="Data Analysis"
 WHERE dept_no="d010";
 
																	#### DELETE ####
SELECT * FROM titles WHERE emp_no=999903;
COMMIT;
 
DELETE FROM employees 
WHERE 
 emp_no=999903;
 
ROLLBACK;

## TASK ##
DELETE FROM departments
WHERE 
dept_no='d010';
 
											#### AGGREGATE FUNCTIONS ####

### COUNT ### 
 SELECT COUNT(salary) FROM salaries;
 SELECT COUNT(from_date) FROM salaries;
 SELECT COUNT(DISTINCT from_date) FROM salaries; ##counts unique dates...
 SELECT COUNT(*) FROM salaries; ## This will count NULL values too!
 
## TASK ##
SELECT COUNT(DISTINCT dept_no) FROM dept_emp;

### SUM ###
 SELECT SUM(salary) FROM salaries;
## TASK ##
SELECT SUM(salary) FROM salaries WHERE from_date > "1997-01-01" ;

### MAX() & MIN() 
SELECT MAX(salary) FROM salaries ;
SELECT MIN(salary) FROM salaries ;
## TASK ##
SELECT MAX(emp_no) FROM employees ;
SELECT MIN(emp_no) FROM employees ;

### AVG () ###
SELECT AVG(salary) FROM salaries;
## TASK ##
SELECT AVG(salary) FROM salaries WHERE from_date > '1997-01-01';

### ROUND () ###
SELECT ROUND(AVG(salary)) FROM salaries;
SELECT ROUND(AVG(salary),2) FROM salaries;
## TASK ##
SELECT ROUND(AVG(salary),2) FROM salaries WHERE from_date > '1997-01-01';

### IFNULL() & COALESCE()
SELECT * FROM departments_dup ORDER BY dept_no;
COMMIT;
SELECT dept_no,IFNULL(dept_manager, "Manager not assigned") AS dept_manager FROM departments_dup;

ALTER TABLE departments_dup
ADD COLUMN trying INT;

SELECT dept_no,dept_name,dept_manager,coalesce(dept_manager,trying, "N/A") AS dept_manager FROM departments_dup;
SELECT dept_no,dept_name,coalesce(dept_manager,dept_name, "N/A") AS dept_manager FROM departments_dup;
SELECT dept_no,dept_name,COALESCE("Dept manager name") AS fake_col FROM departments_dup;
#ROLLBACK;
## TASK ##
SELECT dept_no,dept_name, coalesce(dept_no,dept_name) AS dept_info 
FROM departments_dup ORDER BY dept_no ASC;

SELECT 
IFNULL(dept_no,"N/A") as dept_no,
IFNULL(dept_name,"Dept Name Not provided") AS dept_name,
COALESCE(dept_no,dept_name) AS dept_info
FROM departments_dup ORDER BY dept_no ASC;

														#### SQL JOINS ####
## TASK ##
SELECT * FROM departments_dup;

ALTER TABLE departments_dup
DROP COLUMN dept_manager;
ALTER TABLE departments_dup
DROP COLUMN trying;

ALTER TABLE departments_dup
CHANGE COLUMN dept_no 
dept_no CHAR(4) NULL;

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

DESCRIBE departments_dup;
COMMIT;

INSERT INTO departments_dup(dept_name)
VALUES ("Public Relations");

DELETE FROM departments_dup
WHERE dept_no="d002";

INSERT INTO departments_dup(dept_no)
VALUES ("d010"),("d011");

SELECT * FROM departments_dup;


CREATE TABLE dept_manager_dup
( 
emp_no int (11) NOT NULL,
dept_no char(4) NULL,
from_date date NOT NULL,
to_date date NULL
);


-- Insert data into dept_manager_dup from dept_manager
INSERT INTO dept_manager_dup
SELECT * FROM dept_manager;

-- Insert specific rows into dept_manager_dup
INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES
    (999904, '2017-01-01'),
    (999905, '2017-01-01'),
    (999906, '2017-01-01'),
    (999907, '2017-01-01');

-- Delete rows from dept_manager_dup where dept_no is 'd001'
DELETE FROM dept_manager_dup
WHERE dept_no = 'd001';

-- Insert a new department into departments_dup
INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations');

-- Delete rows from departments_dup where dept_no is 'd002'
DELETE FROM departments_dup
WHERE dept_no = 'd002';

																	#### INNER JOIN ####
SELECT * FROM dept_manager_dup ORDER BY dept_no;
SELECT * FROM departments_dup ORDER BY dept_no;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

## TASK ##
SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees e
        INNER JOIN
    dept_manager dm ON e.emp_no = dm.emp_no;

																### Duplicate Records ###
INSERT INTO dept_manager_dup
VALUES ('110228','d003','1992-03-21','9999-01-01');
INSERT INTO departments_dup
VALUES ('d009','Customer Service');
 
 ## problem of duplicate record :-
 SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;    

## Solution1 :-
SELECT DISTINCT
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no;   
 ## Solution2 :-   
    SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY 
    m.dept_no, m.emp_no, d.dept_name
ORDER BY 
    d.dept_no;

##group by doesnt work without agg func:-
SELECT 
    m.emp_no,
    COUNT(m.dept_no) AS dept_count
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.emp_no;


															#### LEFT JOIN ####
  ## Delete the duplicates 
DELETE FROM dept_manager_dup
WHERE emp_no='110228';
DELETE FROM departments_dup
WHERE dept_no='d009';

## Add back the initial records 
INSERT INTO dept_manager_dup
VALUES('110228','d003','1992-03-21','9999-01-01');
INSERT INTO departments_dup
VALUES ('d009','Customer Service');
                                                                    
 SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;                                                                   
  
## What if we switch the table ??

SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;                                                                   
 
 ##  view values of left side only / ven's left circle values
 
  SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
    WHERE dept_name IS NULL
ORDER BY m.dept_no;  

## TASK ##
SELECT * FROM employees;
SELECT * FROM dept_manager;																
                                                                    
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    dm.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    last_name = 'Markovitch'
ORDER BY dm.dept_no DESC , e.emp_no;
 
													#### RIGHT JOIN ####                                                                   
  SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        RIGHT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;                                                                       

                                               
                                                                
                                                                
                                                                



























 
 
 
 
 
 
 
 

























 
 
 
 
 
 

