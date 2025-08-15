-- Checking if rfm_code isn;t exactly r||f||m
with bad as (
    select *
    from {{ ref('mart__customer_segment') }}
    where rfm_code <> (r_Score || f_score || m_score)
)
select * from bad