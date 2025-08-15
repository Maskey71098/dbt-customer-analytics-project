{% docs int_rfm_base_desc %}
Aggregated RFM base metrics per customer & channel:
- last_purchase_date, frequency, monetary
- recency_days = as_of_date - last_purchase_date
Used as the input to scoring.
{% enddocs %}

{% docs rfm_scores_desc %}
R, F, M scores assigned with NTILE(5) *partitioned by channel*:
- R: lower recency_days → higher score
- F: higher frequency → higher score
- M: higher monetary → higher score
{% enddocs %}

{% docs rfm_segments_desc %}
Final customer segmentation (per channel) combining R/F/M and labeling customers for retail campaigns.
Common uses: VIP retention, win-back, seasonal planning, and promo targeting.
{% enddocs %}

{% docs segment_labels_desc %}
**Segment labels**
- Premier Customers: R≥4 & F≥4 & M≥4
- Loyal Customers: F≥4 & M≥4
- High-Value Recent: R≥4 & M≥4 & F≤3
- Emerging Customers: R≥4 & F≤3 & M≤3
- High Spend Customers: M≥4 & R≥3
- Value-Oriented Customers: F≥3 & M≤2
- Seasonal Customers: F∈[3,5] & M∈[3,5] & R∈[2,3]
- At-Risk Customers: R≤2 & (F≥3 or M≥3)
- Dormant Customers: R≤2 & F≤2 & M≤2
- Inactive Customers: everything else
{% enddocs %}
