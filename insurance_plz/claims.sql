{{ config(materialized='table', schema='dw_insurance') }}

SELECT
  c.firstname AS customer_first_name,
  c.lastname AS customer_last_name,
  d.date_day,
  p.policyid,
  a.firstname AS agent_first_name,
  a.lastname AS agent_last_name,
  f.claimamount
FROM {{ ref('fact_claim') }} f
LEFT JOIN {{ ref('dim_customer') }} c ON f.customer_key = c.customer_key
LEFT JOIN {{ ref('dim_agent') }} a ON f.agent_key = a.agent_key
LEFT JOIN {{ ref('dim_policy') }} p ON f.policy_key = p.policy_key
LEFT JOIN {{ ref('dim_date') }} d ON f.date_key = d.date_key