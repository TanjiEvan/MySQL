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

CREATE TABLE SALES
( 
purchase_number INT NOT NULL  AUTO_INCREMENT,
date_of_purchase DATE NOT NULL,
customer_id INT,
item_code VARCHAR(10) NOT NULL,
PRIMARY KEY (purchase_number)
);

DROP TABLE customers;

CREATE TABLE CUSTOMERS
( 
customer_id INT  ,
first_name varchar(255),
last_name varchar(255),
email_adress varchar(255),
number_of_complains int,
PRIMARY KEY(customer_id)
);

CREATE TABLE ITEMS
(
item_code varchar(255) ,
item varchar(255),
unit_price numeric(10,2),
company_id varchar(255),
primary key(item_code)
);

CREATE TABLE COMPANIES
( 
company_id VARCHAR(255),
company_name VARCHAR(255),
headquaters_phone_number int (12),
primary key(company_id)
);

##CREATING RELATION##

##Method1
DROP TABLE SALES;
CREATE TABLE SALES
( 
purchase_number INT NOT NULL  AUTO_INCREMENT,
date_of_purchase DATE NOT NULL,
customer_id INT,
item_code VARCHAR(10) NOT NULL,
PRIMARY KEY (purchase_number),
FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id) ON DELETE CASCADE
);

##Method2
ALTER TABLE sales
ADD FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id) ON DELETE CASCADE;

##Method3
alter table sales
DROP foreign key sales_ibfk_1;
#MANUAL ADD << 

DROP TABLE SALES;
DROP TABLE customers;
DROP TABLE items;
DROP TABLE companies;

##UNIQUE CONSTRAINTS##

CREATE TABLE CUSTOMERS
( 
customer_id INT NOT NULL  ,
first_name varchar(255),
last_name varchar(255),
email_adress varchar(255),
number_of_complains int,
PRIMARY KEY(customer_id),
UNIQUE KEY (email_adress)
);

DROP TABLE customers;
CREATE TABLE CUSTOMERS
( 
customer_id INT  ,
first_name varchar(255),
last_name varchar(255),
email_adress varchar(255),
number_of_complains int,
PRIMARY KEY(customer_id)
);

ALTER TABLE customers
ADD UNIQUE KEY (email_adress);

ALTER TABLE CUSTOMERS
DROP INDEX email_adress;

##Exercise :
DROP TABLE customers;
CREATE TABLE CUSTOMERS
( 
customer_id INT AUTO_INCREMENT ,
first_name varchar(255),
last_name varchar(255),
email_adress varchar(255),
number_of_complains int,
PRIMARY KEY(customer_id)
);

ALTER TABLE customers
ADD COLUMN gender ENUM('M','F') AFTER last_name;

INSERT INTO CUSTOMERS (first_name,last_name,gender,email_adress,number_of_complains)
VALUES('Tanji','Evan','M','Tanji.evan23@gmail.com',0);

SELECT * FROM customers;

##Default Constraint##

ALTER TABLE customers
CHANGE COLUMN number_of_complains number_of_complaints INT DEFAULT 0;

INSERT INTO CUSTOMERS (first_name,last_name,gender,email_adress)
VALUES('Ariyaa','Zrisha','F','Ariyaa.Zrisha@gmail.com');
















