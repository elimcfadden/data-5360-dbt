{{ config(materialized='table', schema='oliver') }}

select
  CUSTOMER_ID  as customer_key,
  CUSTOMER_ID,
  FIRST_NAME,
  LAST_NAME,
  EMAIL,
  PHONE_NUMBER,
  STATE
from ELIMCFADDEN.oliver_dw_source.customer
where coalesce(_FIVETRAN_DELETED, false) = false
