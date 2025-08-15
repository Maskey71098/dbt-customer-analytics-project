with s as (
  select customer_id, channel, r_score, f_score, m_score, segment_label
  from {{ ref('mart__customer_segment') }}
),
bad as (
  select *
  from s
  where not (
    (r_score >= 4 and f_score >= 4 and m_score >= 4 and segment_label = 'Premier Customers') or
    (f_score >= 4 and m_score >= 3 and segment_label = 'Loyal Customers') or
    (r_score >= 4 and m_score >= 4 and f_score <= 3 and segment_label = 'High-Value Recent') or
    (r_score >= 4 and f_score <= 3 and m_score <= 3 and segment_label = 'Emerging Customers') or
    (m_score >= 4 and r_score >= 3 and segment_label = 'High Spend Customers') or
    (f_score >= 3 and m_score <= 2 and segment_label = 'Value-Oriented Customers') or
    (f_score between 3 and 5 and m_score between 3 and 5 and r_score between 2 and 3 and segment_label = 'Seasonal Customers') or
    (r_score <= 2 and (f_score >= 3 or m_score >= 3) and segment_label = 'At-Risk Customers') or
    (r_score <= 2 and f_score <= 2 and m_score <= 2 and segment_label = 'Dormant Customers') or
    (segment_label = 'Inactive Customers')
  )
)
select * from bad
