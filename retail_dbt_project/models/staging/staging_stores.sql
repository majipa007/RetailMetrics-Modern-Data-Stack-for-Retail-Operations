{{
config(
    materialized = 'table',
    schema = 'staging_schema',
    unique_id = 'store_id'
)
}}

with
source_data as(
    select
        *
    from {{source('retail_shop', 'store')}}
)
select
    *
from source_data