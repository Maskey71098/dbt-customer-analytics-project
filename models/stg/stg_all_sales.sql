SELECT * FROM {{ ref('stg_store_sales') }}
UNION ALL
SELECT * FROM {{ ref('stg_web_sales') }}
