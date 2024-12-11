# Write your MySQL query statement below

Select category, accounts_count
From
(Select 
    'Low Salary' as category, Count(account_id) accounts_count
From    
    Accounts
Where 
    income < 20000

Union All

Select 
    'Average Salary' as category, Count(account_id) accounts_count
From    
    Accounts
Where 
    income Between 20000 and 50000

Union All

Select 
    'High Salary' as category, Count(account_id) accounts_count
From    
    Accounts
Where 
    income > 50000) p

order by accounts_count desc

