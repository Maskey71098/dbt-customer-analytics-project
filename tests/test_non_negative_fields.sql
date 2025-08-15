select *
from {{ ref('mart__customer_segment') }}
where coalesce(monetary,0) < 0
   or coalesce(frequency,0) < 0
   or coalesce(recency_days,0) < 0
