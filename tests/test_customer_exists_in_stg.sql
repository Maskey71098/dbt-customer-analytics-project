select s.*
from {{ ref('mart__customer_segment') }} s
left join {{ ref('stg_customers') }} c
  on s.customer_id = c.customer_id
where c.customer_id is null
