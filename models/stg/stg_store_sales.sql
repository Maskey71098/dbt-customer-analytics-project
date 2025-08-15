WITH store_sales
     AS (SELECT ss_customer_sk   AS CUSTOMER_ID,
                ss_sold_date_sk  AS SOLD_DATE_SK,
                ss_ticket_number AS TICKET_NUMBER,
                ss_item_sk       AS ITEM_SK,
                ss_net_paid      AS NET_PAID
         FROM   snowflake_sample_data.tpcds_sf100tcl.store_sales
         WHERE  ss_customer_sk IS NOT NULL),
     date
     AS (SELECT d_date_sk,
                d_date
         FROM   snowflake_sample_data.tpcds_sf100tcl.date_dim)
SELECT S.customer_id,
       D.d_date        AS SOLD_DATE,
       S.ticket_number AS TICKET_OR_ORDER,
       S.item_sk,
       S.net_paid,
       'STORE'         AS CHANNEL
FROM   store_sales S
       INNER JOIN date D
               ON S.sold_date_sk = D.d_date_sk