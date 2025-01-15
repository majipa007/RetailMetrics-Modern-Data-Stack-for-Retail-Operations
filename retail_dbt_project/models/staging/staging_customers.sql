{{
    config (materialized = 'table',
        schema = 'staging_schema',
        unique_key = 'customer_id'
    )
}}

with
source_data as (
    select
        *    from {{ source('retail_shop', 'customer') }}
)
select
    *
from source_data