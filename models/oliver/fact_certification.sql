{{ config(materialized='table', schema='oliver') }}

-- Grain: one row per employee per certification awarded date
select
  e.employee_key,
  d.date_key,
  c.certification_name,
  c.certification_cost
from ELIMCFADDEN.dbt_emcfadden_oliver.stg_employee_certifications c
join ELIMCFADDEN.dbt_emcfadden_oliver.oliver_dim_employee e
    on lower(c.email) = lower(e.email)
join ELIMCFADDEN.dbt_emcfadden_oliver.oliver_dim_date d
    on d.date_day = c.certification_awarded_date
