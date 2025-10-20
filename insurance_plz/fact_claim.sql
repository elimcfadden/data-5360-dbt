{{ config(materialized='table', schema='dw_insurance') }}

SELECT
  p.policy_key,
  cu.customer_key,
  a.agent_key,
  d.date_key,
  c.claimamount
FROM {{ source('insurance_landing', 'claims') }} c
INNER JOIN {{ source('insurance_landing', 'policies') }} pd ON c.policyid = pd.policyid
INNER JOIN {{ ref('dim_policy') }} p ON pd.policyid = p.policyid
INNER JOIN {{ ref('dim_customer') }} cu ON pd.customerid = cu.customerid
INNER JOIN {{ ref('dim_agent') }} a ON pd.agentid = a.agentid
INNER JOIN {{ ref('dim_date') }} d ON d.date_day = c.claimdate