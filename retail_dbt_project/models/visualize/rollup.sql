{{
    config(
        materialized = "view",
        schema = "visualization_schema"
    )
}}

SELECT
    month,
    store,
    employee,
    customer,
    SUM(total_amount) AS total_sales
FROM {{ ref('sales_summary') }}
GROUP BY ROLLUP(month,store,employee,customer )
ORDER BY month, store


