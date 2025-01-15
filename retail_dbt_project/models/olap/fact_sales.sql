{{
    config(
        materialized = "incremental",
        schema = "production_schema",
        unique_id = "sale_id"
    )
}}

with staging_data as(
    select
        sale_id serial ,
        store_id,
        customer_id,
        employee_id,
        EXTRACT(year from sale_date)::int * 10000 + EXTRACT(month from sale_date)::int * 100 + EXTRACT(day from sale_date)::int as date_id,
        total_amount
    from {{source('sales_data_mart_staging_schema', 'staging_sale')}}
)

select *
from staging_data