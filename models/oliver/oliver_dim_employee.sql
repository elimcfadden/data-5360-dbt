{{ config(materialized='table', schema='oliver') }}

select
  EMPLOYEE_ID  as employee_key,
  EMPLOYEE_ID,
  FIRST_NAME,
  LAST_NAME,
  EMAIL,
  PHONE_NUMBER,
  POSITION,
  HIRE_DATE
from ELIMCFADDEN.oliver_dw_source.employee
where coalesce(_FIVETRAN_DELETED, false) = false
