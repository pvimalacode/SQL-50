-- # Write your MySQL query statement below
-- https://leetcode.com/problems/game-play-analysis-iv/?envType=study-plan-v2&envId=top-sql-50

with cte as(
select *,
        case when 
        datediff(event_date , min(event_date) over(partition by player_id order by event_date asc)) =1
        then 1
        else 0
        end as date_diff
    from activity
 ),
cte2 as (
        select  count(distinct player_id) a from cte where date_diff = 1)



select round((cte2.a/cte3.b),2) as fraction from cte2 

cross join 

(select  count( distinct player_id) b from activity) cte3




