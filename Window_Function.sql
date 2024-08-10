CREATE TABLE marks (
 student_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    branch VARCHAR(255),
    marks INTEGER
);

INSERT INTO marks (name,branch,marks)VALUES 
('Nitish','EEE',82),
('Rishabh','EEE',91),
('Anukant','EEE',69),
('Rupesh','EEE',55),
('Shubham','CSE',78),
('Ved','CSE',43),
('Deepak','CSE',98),
('Arpan','CSE',95),
('Vinay','ECE',95),
('Ankit','ECE',88),
('Anand','ECE',81),
('Rohit','ECE',95),
('Prashant','MECH',75),
('Amit','MECH',69),
('Sunny','MECH',39),
('Gautam','MECH',51);

USE sys;

SELECT * FROM marks;

## If Avg Is Used : 
SELECT AVG(marks) FROM marks;

## With Window Function :
SELECT *,AVG(marks) OVER() FROM marks;

SELECT *,AVG(marks) OVER(partition by branch) FROM marks;

SELECT *,MIN(marks) OVER(), MAX(marks) OVER() FROM marks;

SELECT *, 
AVG(marks) OVER() AS Total_AVG,
AVG(marks) OVER(PARTITION BY branch) AS Branch_AVG,
MIN(marks) OVER() AS Overall_Min_Mark,
MAX(marks) OVER() AS Overall_Max_Mark,
MIN(marks) OVER(PARTITION BY branch) AS Branch_Min_Mark,
MAX(marks) OVER(PARTITION BY branch) AS Branch_Max_Mark
FROM marks;

### Que. Find all the students who have marks higher than the avg marks of their respective branch 

SELECT * FROM(SELECT * ,
AVG(marks) OVER(PARTITION BY branch) AS Branch_Avg 
FROM marks)t
WHERE marks > Branch_Avg ;




































