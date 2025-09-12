
CREATE TABLE sales ( 
     id INT, 
     weight int,
     amount int,
     status varchar(50)
 ); 

insert into sales values
(1,120,500,'shipped'),
(2,287,287,'onhold'),
(3,823,387,"craeted"),
(4,273,929,"completed"),
(5,273,234,"cancelled");


with cte as (select 
                  *, 
                  case status when 'shipped' then 'active'
                              when 'onhold' then 'active'
                              when 'craeted' then 'active'
                              else 'inactive' 
                  end as status_group
                  from sales
                  
                )
, cte2 as (
                select status_group, 
                    count(status),
                    group_concat(status order by status asc separator ',') as statuses
                    from cte  group by status_group 
            )
, cte3 as (
            select status_group, count(id) as no_orders,sum(weight) as tot_wt,sum(amount) as tot_amt
            from cte group by status_group
        )

select cte3.status_group, cte2.statuses, cte3.no_orders,cte3.tot_wt,cte3.tot_amt

from cte3 inner join cte2 on cte3.status_group = cte2.status_group;