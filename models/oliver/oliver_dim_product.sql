{{ config(materialized='table', schema='oliver') }}

select
  PRODUCT_ID   as product_key,
  PRODUCT_ID,
  PRODUCT_NAME,
  DESCRIPTION,
  UNIT_PRICE
from ELIMCFADDEN.oliver_dw_source.product
where coalesce(_FIVETRAN_DELETED, false) = false
