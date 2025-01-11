{{
config(
    materialized = 'table',
    schema = 'staging_schema',
    unique_id = 'sale_id'
)
}}


with source_table as (
     select *
     from {{ source('retail_shop', 'sale')}}
)

select *
from source_table