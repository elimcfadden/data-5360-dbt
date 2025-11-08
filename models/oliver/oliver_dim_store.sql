{{ config(materialized='table', schema='oliver') }}

select
  STORE_ID     as store_key,
  STORE_ID,
  STORE_NAME,
  STREET,
  CITY,
  STATE
from ELIMCFADDEN.oliver_dw_source.store
where coalesce(_FIVETRAN_DELETED, false) = false
