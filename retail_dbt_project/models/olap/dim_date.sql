{{
   config(
    materialized = "incremental",
    schema = 'production_schema',
    unique_key = 'date_id'
  )
}}

with transformed_data as(
    select
        EXTRACT(year from sale_date)::int * 10000 + EXTRACT(month from sale_date)::int * 100 + EXTRACT(day from sale_date)::int as date_id,
        EXTRACT(day from sale_date) as day,
        EXTRACT(month from sale_date) as month,
        EXTRACT(year from sale_date) as year
    from {{source('sales_data_mart_staging_schema', 'staging_sale')}}
    group by date_id, day, month, year
)

select * from transformed_data