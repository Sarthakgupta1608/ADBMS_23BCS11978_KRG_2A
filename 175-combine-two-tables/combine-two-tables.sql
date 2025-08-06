/* Write your T-SQL query statement below */
Select P.firstName, P.lastName, A.city, A.state
From Person as P
Left join 
Address as A
on p.personId = A.personId