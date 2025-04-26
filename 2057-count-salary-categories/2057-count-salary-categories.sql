
select 'Low Salary' as category,coalesce(Count(account_id),0) as accounts_count from
    Accounts where income<20000
Union
select 'Average Salary' as category,coalesce(Count(account_id),0) as accounts_count from
    Accounts where income between 20000 and 50000
Union
select 'High Salary' as category,coalesce(Count(account_id),0) as accounts_count from
    Accounts where income >50000
