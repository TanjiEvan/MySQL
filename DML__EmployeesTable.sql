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




 
 
 
 
 
 

