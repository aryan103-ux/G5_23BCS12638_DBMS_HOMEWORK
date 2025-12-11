--1
select td.user_id , 
(case when td.action is null then 0.00 else round(td.confirmed/td.noc,2) end)as confirmation_rate
from
(select s1.user_id,c1.action,sum(case when action is null then 0 else 1 end) as noc,sum(case 
when action = 'confirmed'  then 1 else 0 end) as confirmed
from Signups s1
left join
Confirmations c1
on s1.user_id = c1.user_id
group by user_id) as td


