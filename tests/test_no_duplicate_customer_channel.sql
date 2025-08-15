with counts as (
  select customer_id, channel, count(*) as cnt
  from {{ ref('mart__customer_segment') }}
  group by 1,2
)
select * from counts where cnt > 1
