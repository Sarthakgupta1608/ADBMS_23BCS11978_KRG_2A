--------------- EASY -----------------  
CREATE TABLE Author ( 
Author_id INT PRIMARY KEY, 
Author_Name VARCHAR(MAX), 
Country VARCHAR(MAX) 
); 
 
 
CREATE TABLE Book ( 
  Book_id INT PRIMARY KEY, 
  Book_Name VARCHAR(MAX), 
  Author_id INT, 
  FOREIGN KEY (Author_id) REFERENCES Author(Author_id) 
); 
 
INSERT INTO Author (Author_id, Author_Name, Country) VALUES  
(1, 'ABC', 'India'), 
(2, 'EFG', 'US'), 
(3, 'XYZ', 'China'), 
(4, 'MNO', 'Japan'); 
 
INSERT INTO Book (Book_id, Book_Name, Author_id) VALUES  
(11, 'Harry Potter', 1), 
(12, 'A Game of Thrones', 2), 
(13, 'Norwegian Wood', 3); 
 
 
SELECT a.Author_Name,a.Country,b.Book_Name 
  from  Author as a 
      inner join 
         Book as b 
         ON  
         a.Author_id=b.Author_id 
          
 
        
SELECT a.*,b.* 
  from  Author as a 
      left outer join 
         Book as b 
         ON  
         a.Author_id=b.Author_id 
          
SELECT a.*,b.* 
  from  Author as a 
      right outer join 
         Book as b 
         ON  
         a.Author_id=b.Author_id 
          
  -------------- MEDIUM --------------  
  
CREATE TABLE Departments ( 
    DepartmentID INT PRIMARY KEY, 
    DepartmentName VARCHAR(100) NOT NULL 
); 
 
CREATE TABLE Courses ( 
    CourseID INT PRIMARY KEY, 
    CourseTitle VARCHAR(150) NOT NULL, 
    DepartmentID INT, 
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
); 
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES 
(1, 'Computer Science'), 
(2, 'Mathematics'), 
(3, 'Physics'), 
(4, 'Chemistry'), 
(5, 'Biology'); 
SELECT * FROM Departments; 
INSERT INTO Courses (CourseID, CourseTitle, DepartmentID) VALUES 
(101, 'Data Structures', 1), 
(102, 'Operating Systems', 1), 
(103, 'Algorithms', 1), 
(104, 'Calculus I', 2), 
(105, 'Linear Algebra', 2), 
(106, 'Quantum Mechanics', 3), 
(107, 'Classical Mechanics', 3), 
(108, 'Organic Chemistry', 4), 
(109, 'Cell Biology', 5), 
(110, 'Genetics', 5); 
SELECT * FROM Courses; 
SELECT DepartmentName 
FROM Departments 
WHERE DepartmentID IN ( 
SELECT DepartmentID 
FROM Courses 
GROUP BY DepartmentID 
HAVING COUNT(CourseID) > 2 
); 