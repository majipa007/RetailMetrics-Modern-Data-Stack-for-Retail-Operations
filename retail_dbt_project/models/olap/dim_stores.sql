{{
   config(
    materialized = "incremental",
    schema = 'production_schema',
    unique_id = 'store_id'
  )
}}

with
staging_data as(
    select
        *
    from {{source('sales_data_mart_staging_schema', 'staging_stores')}}
)

select
    *
from staging_data