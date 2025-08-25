--------------------EXPERIMENT 03: (MEDIUM LEVEL)
CREATE TABLE department (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
CREATE TABLE employee (
    id INT,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
);
INSERT INTO department (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');

INSERT INTO employee (id, name, salary, department_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'SAM', 60000, 2),
(5, 'MAX', 90000, 1);

--A1
SELECT D.dept_name, E.name, E.salary
FROM employee AS E
INNER JOIN department AS D
    ON D.id = E.department_id
WHERE E.salary IN (
    SELECT MAX(E2.salary)
    FROM employee AS E2
    WHERE E2.department_id = E.department_id
)
ORDER BY D.dept_name, E.name;

--A2
SELECT D.dept_name, E.name, E.salary
FROM employee AS E
INNER JOIN department AS D
    ON D.id = E.department_id
WHERE E.salary IN (
    SELECT MAX(E2.salary)
    FROM employee AS E2
    Group By E2.department_id
)
ORDER BY D.dept_name, E.name;


--Hard
CREATE TABLE A (
    EmpID  INT,
    Ename VARCHAR(50),
    Salary INT,
);
CREATE TABLE B (
    EmpID  INT,
    Ename VARCHAR(50),
    Salary INT,
);

INSERT INTO A (EmpID, Ename, Salary) VALUES
(1, 'AA', 1000),
(2, 'BB', 300);

INSERT INTO B (EmpID, Ename, Salary) VALUES
(2, 'BB', 1000),
(3, 'CC', 300);


SELECT EmpID,Ename,MIN(Salary)
fROM (
SELECT *FROM A
UNION ALL 
SELECT *FROM B) AS Result
GROUP BY EmpID,Ename
