{{ config(materialized='table', schema='dw_insurance') }}

SELECT
  policyid AS policy_key,
  policyid,
  policytype
FROM {{ source('insurance_landing', 'policies') }}