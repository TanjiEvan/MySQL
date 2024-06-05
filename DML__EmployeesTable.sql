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
   
SELECT * FROM employees WHERE first_name LIKE ("MAR%");  ## Every first name start with MAR
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
  





 
 
 
 
 
 

