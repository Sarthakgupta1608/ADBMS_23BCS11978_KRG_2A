------------------------ MEDIUM --------------------------  
CREATE TABLE EmployeeTable ( 
EmployeeID INT PRIMARY KEY, 
EmployeeName VARCHAR(25), 
Dept VARCHAR(25), 
ManagerID INT 
); 
INSERT INTO EmployeeTable (EmployeeID, EmployeeName, Dept, ManagerID) VALUES 
(1, 'Sarthak', 'HR', NULL), 
(2, 'Reyansh', 'Finance', 1), 
(3, 'Yogesh', 'IT', 1), 
(4, 'Pravi', 'Finance', 2), 
(5, 'Surya', 'IT', 3), 
(6, 'MD', 'HR', 1); 
SELECT * FROM EmployeeTable; 
SELECT  
E.EmployeeName AS [Employee_Name], 
M.EmployeeName AS [Manager_Name], 
E.Dept AS [Employee_Dept], 
M.Dept AS [Manager_Dept] 
FROM EmployeeTable E 
LEFT JOIN EmployeeTable M 
ON E.ManagerID = M.EmployeeID; --------------------------- HARD -------------------------  
CREATE TABLE YearData ( 
RecordID INT, 
YearVal INT, 
NetPresentValue INT 
); 
CREATE TABLE RequestList ( 
RecordID INT, 
YearVal INT 
); 
INSERT INTO YearData (RecordID, YearVal, NetPresentValue) VALUES 
(1, 2018, 100), 
(7, 2020, 30), 
(13, 2019, 40), 
(1, 2019, 113), 
(2, 2008, 121), 
(3, 2009, 12), 
(11, 2020, 99), 
(7, 2019, 0); 
SELECT * FROM YearData; 
INSERT INTO RequestList (RecordID, YearVal) VALUES 
(1, 2019), 
(2, 2008), 
(3, 2009), 
(7, 2018), 
(7, 2019), 
(7, 2020), 
(13, 2019); 
SELECT * FROM RequestList; 
SELECT  
R.RecordID, 
R.YearVal, 
ISNULL(Y.NetPresentValue, 0) AS NetPresentValue 
FROM RequestList R 
LEFT JOIN YearData Y 
ON R.RecordID = Y.RecordID 
AND R.YearVal = Y.YearVal; 