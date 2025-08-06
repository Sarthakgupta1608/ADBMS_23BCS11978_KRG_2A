/* Write your T-SQL query statement below */
Select Users.name as [NAME], Sum(Transactions.amount) as [BALANCE]
from Users 
INNER JOIN Transactions
on 
Users.account = Transactions.account
Group by Users.name
Having Sum(Transactions.amount) > 10000;