CREATE DATABASE IF NOT EXISTS SALES;
USE SALES;

CREATE TABLE SALES
( 
purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
date_of_purchase DATE NOT NULL,
customer_id INT,
item_code VARCHAR(10) NOT NULL
);

CREATE TABLE CUSTOMERS
( 
customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
first_name varchar(255),
last_name varchar(255),
email_adress varchar(255),
number_of_complains int
);

SELECT * FROM sales;
SELECT * FROM sales.sales;

DROP TABLE sales; ##Drops the sales table 


