-- when we do group by, its corresponding value is not selected

with cte as (
select *,
    case when year = min(year) over(partition by product_id) then 1
    else 0 end as fac
    
from sales
)
 select 
    product_id ,year as first_year ,quantity, price
     from cte where fac =1