select * from credit_card_transcations;

alter table credit_card_transcations 
alter column date date;

-----------------Questions-----------------
--1- write a query to print top 5 cities with highest spends and their percentage contribution of total credit card spends 

 select top 5 city, sum(amount) amt_spend 
 ,round(100.0*(sum(amount)/(select sum(amount) from credit_card_transcations)),2) percentage_contribution
 from credit_card_transcations 
 group by city
 order by amt_spend desc;

--2- write a query to print highest spend month and amount spent in that month for each card type

select * from credit_card_transcations;

with cte as(
select card_type, DATEPART(YEAR,date) yo, DATENAME(MONTH,date) mo, sum(amount) total_amt
, RANK() over(partition by card_type order by sum(amount) desc) rnk
from credit_card_transcations
group by card_type, DATEPART(YEAR,date), DATENAME(MONTH,date)
--order by card_type, total_amt desc
)
select card_type, mo as highest_spend_month, total_amt
from cte
where rnk = 1;

--3- write a query to print the transaction details(all columns from the table) for each card type when
--it reaches a cumulative of 1000000 total spends(We should have 4 rows in the o/p one for each card type

select * from (
select *
, rank() over(partition by card_type order by cum_sum asc) as rn
from (
select * ,
sum(amount) over(partition by card_type order by date) as cum_sum
from credit_card_transcations
) A
where cum_sum>=1000000
) b
where rn=1;

--4- write a query to find city which had lowest percentage spend for gold card type

select top 1  city, sum(case when card_type='Gold' then amount else 0 end) gold_spend, sum(amount) total_spend,
round(100.0*(sum(case when card_type='Gold' then amount else 0 end)/sum(amount)),2) pct_spend
from credit_card_transcations
group by city
having sum(case when card_type='Gold' then amount else 0 end)>0
order by pct_spend

--5- write a query to print 3 columns:  city, highest_expense_type , lowest_expense_type (example format : Delhi , bills, Fuel)

with top_rank_cte as(
select city, exp_type, SUM(amount) exp_sum,
RANK() over(partition by city order by sum(amount) desc) top_rnk
,RANK() over(partition by city order by sum(amount)) low_rnk
from credit_card_transcations
group by city, exp_type
)
select city 
,max(case when top_rnk=1 then exp_type end) as highest_expense_type
,max(case when low_rnk=1 then exp_type end) as lowest_expense_type
from top_rank_cte 
--where top_rnk=1 or low_rnk=1
group by city

--6- write a query to find percentage contribution of spends by females for each expense type

select exp_type, sum(case when gender='F' then amount else 0 end) F_spend, sum(amount) total_spend,
round(100.0*(sum(case when gender='F' then amount else 0 end)/sum(amount)),2) pct_spend
from credit_card_transcations
group by exp_type
having sum(case when gender='F' then amount else 0 end)>0
order by pct_spend

--7- which card and expense type combination saw highest month over month growth in Jan-2014

with cte as (
select card_type,exp_type,datepart(year,date) yt
,datepart(month,date) mt,sum(amount) as total_spend
from credit_card_transcations
group by card_type,exp_type,datepart(year,date),datepart(month,date)
)
select  top 1 *, (total_spend-prev_mont_spend) as mom_growth
from (
select *
,lag(total_spend,1) over(partition by card_type,exp_type order by yt,mt) as prev_mont_spend
from cte) A
where prev_mont_spend is not null and yt=2014 and mt=1
order by mom_growth desc;

--8- during weekends which city has highest total spend to total no of transcations ratio 

select city, sum(amount)*1.0/count(*) as ratio 
from credit_card_transcations
where datepart(weekday,date) in (1,7)
group by city
order by ratio desc

--9- which city took least number of days to reach its 500th transaction after the first transaction in that city

with cte as (
select *
, row_number() over(partition by city order by date) as rn
from credit_card_transcations)
select city, min(date) as first_transaction,max(date) as last_transaction
, datediff(day,min(date),max(date)) as days_to_500
from cte
where rn in (1,500)
group by city
having count(*)=2
order by days_to_500 asc

