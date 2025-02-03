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
--     where EXTRACT(month from sale_date) = 1
)

select *
from source_table