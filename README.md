
# Customer Segmentation with dbt + Snowflake (RFM)

RFM-based customer segmentation built with **dbt** on **Snowflake**, using the Snowflake **TPC-DS sample data**.  
The project unifies **Store** and **Web** sales, scores customers on **Recency, Frequency, Monetary (RFM)**, and assigns clear, business-friendly segments for targeted marketing.

> ✅ Modular dbt pipeline • ✅ Tested & documented • ✅ Dashboard-ready in Snowsight

---

## What this produces

**Final MART tables**
- `RFM_CUSTOMER_SCORES` — per customer (+channel) R/F/M metrics and 1–5 scores  
- `MART__CUSTOMER_SEGMENT` — the labeled segments for activation

**Segment examples**
- **Premier** (recent, frequent, high-spend)  
- **Loyal** (very frequent, solid spend)  
- **High-Value Recent** (big spenders who bought very recently)  
- **Emerging** (newly active; not yet frequent/high-spend)  
- **High Spend** (large baskets; decent recency)  
- **Value-Oriented** (buy often; lower spend per period)  
- **Seasonal** (activity in cycles)  
- **At-Risk / Dormant** (long since last purchase; some worth win-back)


---

## How it works (RFM in plain English)

- **Recency (R):** days since the last purchase (more recent → higher score)  
- **Frequency (F):** number of purchases (more often → higher score)  
- **Monetary (M):** total spend (higher → higher score)

Each pillar is ranked into **five bands (1–5)**; `R,F,M` combine into a customer “fingerprint” that maps to a segment.




