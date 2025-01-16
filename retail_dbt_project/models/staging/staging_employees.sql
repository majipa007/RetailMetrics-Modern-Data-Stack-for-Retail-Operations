{{
config(
    materialized = 'table',
    schema = 'staging_schema',
    unique_id = 'employee_id'
)
}}

with
source_data as(
    select
        *
    from {{source('retail_shop', 'employee')}}
)
select
    *
from source_data