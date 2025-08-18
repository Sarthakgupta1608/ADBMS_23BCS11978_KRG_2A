------------------------ EASY--------------------------  
CREATE TABLE Employee ( 
emp_id INT 
); 
INSERT INTO Employee (emp_id) 
VALUES (1), (2), (3), (4), (5), (5), (6), (7), (8), (9), (9), (3); 
select max(emp_id) 
from Employee 
where emp_id not in 
(select emp_id  
from Employee 
group by emp_id 
having count(emp_id)>1) 


--------------------------- EASY-------------------------  
CREATE TABLE TBL_PRODUCTS 
( 
ID INT PRIMARY KEY IDENTITY, 
[NAME] NVARCHAR(50), 
[DESCRIPTION] NVARCHAR(250) 
) 
CREATE TABLE TBL_PRODUCTSALES 
( 
ID INT PRIMARY KEY IDENTITY, 
PRODUCTID INT FOREIGN KEY REFERENCES TBL_PRODUCTS (ID), 
UNITPRICE INT, 
QUALTITYSOLD INT 
) 
INSERT INTO TBL_PRODUCTS VALUES ('TV', '52 INCH BLACK COLOR LCD TV') 
INSERT INTO TBL_PRODUCTS VALUES ('LAPTOP', 'VERY THIIN BLACK COLOR ACER LAPTOP') 
INSERT INTO TBL_PRODUCTS VALUES ('DESKTOP', 'HP HIGH PERFORMANCE DESKTOP') 
INSERT INTO TBL_PRODUCTSALES VALUES (3,450,5) 
INSERT INTO TBL_PRODUCTSALES VALUES (2,250,7) 
INSERT INTO TBL_PRODUCTSALES VALUES (3,450,4) 
INSERT INTO TBL_PRODUCTSALES VALUES (3,450,9) 
SELECT *FROM TBL_PRODUCTS 
SELECT *FROM TBL_PRODUCTSALES 
select ID,[NAME],[DESCRIPTION] from TBL_PRODUCTS 
where ID not in 
(select distinct PRODUCTID from TBL_PRODUCTSALES)


------------------------ EASY--------------------------  
select P.[NAME], 
(select SUM(S.QUALTITYSOLD) from TBL_PRODUCTSALES S where S.PRODUCTID = P.ID) 
as [QTY_SOLD] 
from TBL_PRODUCTS P; 


------------------------ LEETCODE--------------------------  
SELECT user_id, MAX(time_stamp) as 'last_stamp' 
FROM Logins 
WHERE YEAR(time_stamp)='2020' 
GROUP BY user_id 