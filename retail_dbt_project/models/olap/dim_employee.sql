{{
config(
    materialized = 'incremental',
    schema = 'production_schema',
    unique_key = 'employee_id'
)
}}

with
source_data as(
    select
        *
    from {{source('sales_data_mart_staging_schema', 'staging_employees')}}
)
select
    *
from source_data